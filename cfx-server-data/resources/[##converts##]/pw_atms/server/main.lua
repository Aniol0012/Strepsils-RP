PW = nil

local withdrawLimit = {}

TriggerEvent('pw:getSharedObject', function(obj) PW = obj end)

function tprint (t, s)
    for k, v in pairs(t) do
        local kfmt = '["' .. tostring(k) ..'"]'
        if type(k) ~= 'string' then
            kfmt = '[' .. k .. ']'
        end
        local vfmt = '"'.. tostring(v) ..'"'
        if type(v) == 'table' then
            tprint(v, (s or '')..kfmt)
        else
            if type(v) ~= 'string' then
                vfmt = tostring(v)
            end
            print(type(t)..(s or '')..kfmt..' = '..vfmt)
        end
    end
end 

exports.pw_chat:AddChatCommand('atm', function(source, args, rawCommand)
    TriggerClientEvent('pw_atms:client:loadATM', source)
end, {
    help = "Access an ATM Machine",
}, -1)

RegisterServerEvent('pw_atms:server:doAccountWithdraw')
AddEventHandler('pw_atms:server:doAccountWithdraw', function(data)
    local _src = source
    if data ~= nil then 
        local _reqCID = tonumber(data.cid)
        local _reqCard = tonumber(data.cardnumber)
        
        if not withdrawLimit[tonumber(data.cardnumber)] then
            withdrawLimit[tonumber(data.cardnumber)] = 0
        end

        local registeredCard = exports.pw_banking:debitcard(tonumber(_reqCard))
        if registeredCard ~= nil and registeredCard ~= false then
            if not registeredCard.locked then
                local myChar = exports.pw_base:Source(_src)
                local _reqBank = exports.pw_banking:current(_reqCID)
                local _reqChar = {}
                local onlineCharacter
                if exports.pw_base:checkOnline(_reqCID) ~= false then
                    _reqChar.account = exports.pw_base:Source(exports.pw_base:checkOnline(_reqCID))
                    _reqChar.online = true
                else
                    _reqChar.account = exports.pw_base:Offline(tonumber(_reqCID))
                    _reqChar.online = false
                end
                local _reqAmount = tonumber(data.amount)
                if withdrawLimit[tonumber(data.cardnumber)] + _reqAmount <= Config.DailyLimit then
                    if _reqBank.GetBalance() >= _reqAmount then
                        withdrawLimit[tonumber(data.cardnumber)] = withdrawLimit[tonumber(data.cardnumber)] + _reqAmount
                        local remove = _reqBank.RemoveMoney(tonumber(data.amount), "Cash Withdraw")
                        if remove then
                            local myCash = myChar:Cash().Add(tonumber(data.amount))
                            if myCash then
                                local banking
                                if _reqChar.online then
                                    banking = {
                                        ['online'] = _reqChar.online,
                                        ['name'] = _reqChar.account:Character().getName(),
                                        ['bankbalance'] = _reqChar.account:Bank().getBalance(),
                                        ['accountinfo'] = _reqChar.account:Bank().GetBankAccount(),
                                        ['statement'] = _reqChar.account:Bank().GetStatement(),
                                        ['cardInformation'] = _reqChar.account:Bank().GetCardDetails(),
                                        --['cardLimit'] = _reqChar.GetWithdrawLimit(),
                                        ['cash'] = myChar:Cash():getCash()
                                    }
                                else
                                    banking = {
                                        ['online'] = _reqChar.online,
                                        ['name'] = _reqChar.account:Character().getName(),
                                        ['bankbalance'] = _reqChar.account:Bank().getBalance(),
                                        ['accountinfo'] = _reqChar.account:Bank().GetBankAccount(),
                                        ['statement'] = _reqChar.account:Bank().GetStatement(),
                                        ['cardInformation'] = _reqChar.account:Bank().GetCardDetails(),
                                        --['cardLimit'] = _reqChar.GetWithdrawLimit(),
                                        ['cash'] = myChar:Cash():getCash()
                                    }
                                end
                                TriggerClientEvent('pw_atms:client:updateBankInformation', _src, banking)
                            end
                        else
                            TriggerClientEvent('pw:notification:SendAlert', _src, {type = "error", text = "There was an error processing your request.", length = 5000})
                        end
                    else
                        TriggerClientEvent('pw:notification:SendAlert', _src, {type = "error", text = "The account has insufficient funds for this withdraw request.", length = 5000})
                    end
                else
                    TriggerClientEvent('pw:notification:SendAlert', _src, {type = "error", text = "You have reached your Daily Withdraw Limit, please visit a branch if you need money, or wait until tomorrow.", length = 5000})
                end
            else
                TriggerClientEvent('pw:notification:SendAlert', _src, {type = "error", text = "Your card issuer has blocked use of this debit/credit card.", length = 5000})
            end
        else
            TriggerClientEvent('pw:notification:SendAlert', _src, {type = "error", text = "Your card issuer has blocked use of this debit/credit card.", length = 5000})
        end
    end
end)

PW.RegisterServerCallback('pw_atms:server:loadBankAccount', function(source, cb, cid, cardnumber)
    local _src = source
    local _reqCID = tonumber(cid)
    local registeredCard = exports.pw_banking:debitcard(tonumber(cardnumber))
    repeat Wait(0) until registeredCard ~= nil
    if registeredCard ~= nil and registeredCard ~= false then
        if not registeredCard.locked then
            local myChar = exports.pw_base:Source(_src)
            local _reqBank = exports.pw_banking:current(_reqCID)
            local _reqChar = {}
            local onlineCharacter
            if exports.pw_base:checkOnline(_reqCID) ~= false then
                _reqChar.account = exports.pw_base:Source(exports.pw_base:checkOnline(_reqCID))
                _reqChar.online = true
            else
                _reqChar.account = exports.pw_base:Offline(tonumber(_reqCID))
                _reqChar.online = false
            end

            local banking = {}
            if _reqChar.online then
                banking['online'] = _reqChar.online
                banking['name'] = _reqChar.account:Character().getName()
                banking['bankbalance'] = _reqChar.account:Bank().getBalance()
                banking['accountinfo'] = _reqChar.account:Bank().GetBankAccount()
                banking['statement'] = _reqChar.account:Bank().GetStatement()
                banking['cardInformation'] = _reqChar.account:Bank().GetCardDetails()
                --banking['cardLimit'] = _reqChar.GetWithdrawLimit()
                banking['cash'] = myChar:Cash():getCash()
            else
                banking['online'] = _reqChar.online
                banking['name'] = _reqChar.account:Character().getName()
                banking['bankbalance'] = _reqChar.account:Bank().getBalance()
                banking['accountinfo'] = _reqChar.account:Bank().GetBankAccount()
                banking['statement'] = _reqChar.account:Bank().GetStatement()
                banking['cardInformation'] = _reqChar.account:Bank().GetCardDetails()
                --banking['cardLimit'] = _reqChar.GetWithdrawLimit()
                banking['cash'] = myChar:Cash():getCash()               
            end
            cb(banking)
        else
            TriggerClientEvent('pw:notification:SendAlert', _src, {type = "error", text = "Your card issuer has blocked use of this debit/credit card.", length = 5000})
            cb(false)
        end
    else
        TriggerClientEvent('pw:notification:SendAlert', _src, {type = "error", text = "Your card issuer has blocked use of this debit/credit card.", length = 5000})
        cb(false)
    end
end)