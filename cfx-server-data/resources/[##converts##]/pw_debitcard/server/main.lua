PW = nil

TriggerEvent('pw:getSharedObject', function(obj)
    PW = obj
end)
 
PW.RegisterServerCallback('pw_debitcard:server:requestCards', function(source, cb)
    local _src = source
    local _char = exports.pw_base:Source(_src)
    local _myCard = _char:Bank().GetCardDetails()
    MySQL.Async.fetchAll("SELECT * FROM `stored_items` WHERE `type` = 'Bankcard' AND `identifier` = @cid AND `inventoryType` = 1", {['@cid'] = _char:Character().getCID()}, function(cards)
        local sendCards = {}
        for k, v in pairs(cards) do 
            local jsonCheck = json.decode(v.metaprivate)
            if _myCard ~= nil and jsonCheck.cardnumber == _myCard.cardNumber then
                table.insert(sendCards, {['metaprivate'] = v.metaprivate, ['metapublic'] = v.metapublic, ['item'] = v.item, ['slot'] = v.slot, ['type'] = v.type, ['count'] = v.count, ['character_id'] = v.character_id, ['record_id'] = v.record_id, ['active'] = _myCard.cardStatus })
            else
                table.insert(sendCards, {['metaprivate'] = v.metaprivate, ['metapublic'] = v.metapublic, ['item'] = v.item, ['slot'] = v.slot, ['type'] = v.type, ['count'] = v.count, ['character_id'] = v.character_id, ['record_id'] = v.record_id})
            end
        end
        cb(sendCards)
    end)
end)

PW.RegisterServerCallback('pw_debitcard:retreiveUserDetails', function(source, cb)
    local _src = source
    local _char = exports.pw_base:Source(_src)
    cb(_char:Bank().GetCardDetails())
end)

PW.RegisterServerCallback('pw_debitcard:anyDebitCards', function(source, cb)
    local _src = source
    local _char = exports.pw_base:Source(_src)
    MySQL.Async.fetchAll("SELECT * FROM `stored_items` WHERE `type` = 'Bankcard' AND `identifier` = @cid AND `inventoryType` = 1", {['@cid'] = _char:Character().getCID()}, function(cards)
        if cards[1] ~= nil then
            cb(true)
        else
            cb(false)
        end
    end)
end)

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

RegisterServerEvent('pw_debitcard:server:autherisePayment')
AddEventHandler('pw_debitcard:server:autherisePayment', function(data)
    local _src = source
    if data ~= nil then
        local registeredCard = exports.pw_banking:debitcard(tonumber(data.cardNumber))
        if registeredCard ~= nil and registeredCard ~= false then
            if data.data then
                data.data.amount = data.amount
            end
            if tonumber(data.enteredPin) == tonumber(registeredCard.pin) then
                if not registeredCard.locked then
                    local associatedBank = exports.pw_banking:current(tonumber(registeredCard.cid))
                    local bankBalance = associatedBank.GetBalance()
                    if bankBalance >= tonumber(data.amount) then
                        local success = associatedBank.RemoveMoney(tonumber(data.amount), data.statement)
                        if success then
                            TriggerClientEvent('pw:notification:SendAlert', _src, {type = "success", text = "Your transaction has been successful, $"..data.amount.." has been debited from your account.", length = 5000})
                            if data.triggerType == "client" then
                                TriggerClientEvent(data.trigger, _src, data.data)
                            else
                                TriggerEvent(data.trigger, data.data)
                            end
                        end
                    else
                        TriggerClientEvent('pw:notification:SendAlert', _src, {type = "error", text = "Your card issuer has declined the transaction due to insufficent funds", length = 5000})
                    end
                else
                    TriggerClientEvent('pw:notification:SendAlert', _src, {type = "error", text = "Your card issuer has blocked use of this debit/credit card.", length = 5000})
                end
            else
                TriggerClientEvent('pw:notification:SendAlert', _src, {type = "error", text = "Your pin has been rejected.", length = 5000})
            end
        else
            TriggerClientEvent('pw:notification:SendAlert', _src, {type = "error", text = "Your card issuer has blocked use of this debit/credit card.", length = 5000})
        end
    end
end)