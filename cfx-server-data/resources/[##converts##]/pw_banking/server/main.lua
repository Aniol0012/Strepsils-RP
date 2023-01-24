ESX = nil
banks = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

MySQL.ready(function ()
    local ready = 0
    local buis = 0
    local cur = 0
    local sav = 0
    local gang = 0

    MySQL.Async.fetchAll("SELECT * FROM `banks`", {}, function(bankssql)
        for k, v in pairs(bankssql) do
            local coords = json.decode(v.coords)
            if v.moneyBags ~= nil then
                moneyBags = json.decode(v.moneyBags)
            else
                moneyBags = nil
            end
            banks[tonumber(v.id)] = { ['x'] = coords.x, ['y'] = coords.y, ['z'] = coords.z, ['bankOpen'] = v.bankOpen, ['bankCooldown'] = v.bankCooldown, ['bankType'] = v.bankType, ['moneyBags'] = moneyBags }
        end
        ready = ready + 1
    end)

    MySQL.Async.fetchAll("SELECT * FROM `bank_accounts` WHERE `account_type` = 'Buisness'", {}, function(accts)
        buis = #accts
        if accts[1] ~= nil then
            for k, v in pairs(accts) do
                local acctType = v.buisness
                if buisnessAccounts[acctType] == nil then
                    buisnessAccounts[acctType] = {}
                end
                buisnessAccounts[acctType][tonumber(v.buisnessid)] = generateBuisnessAccount(tonumber(v.account_number), tonumber(v.sort_code), tonumber(v.buisnessid))
                while buisnessAccounts[acctType][tonumber(v.buisnessid)] == nil do Wait(0) end
            end
        end
        ready = ready + 1
    end)

    MySQL.Async.fetchAll("SELECT * FROM `bank_accounts` WHERE `account_type` = 'Current'", {}, function(current)
        cur = #current
        if current[1] ~= nil then
            for k, v in pairs(current) do
                currentAccounts[v.character_id] = generateCurrent(v.character_id)
            end 
        end
        ready = ready + 1
    end)

    MySQL.Async.fetchAll("SELECT * FROM `bank_accounts` WHERE `account_type` = 'Savings'", {}, function(savings)
        sav = #savings
        if savings[1] ~= nil then
            for k, v in pairs(savings) do
                savingsAccounts[v.character_id] = generateSavings(v.character_id)
            end
        end
        ready = ready + 1
    end)

    MySQL.Async.fetchAll("SELECT * FROM `bank_accounts` WHERE `account_type` = 'Gang'", {}, function(gangs)
        gang = #gangs
        if gangs[1] ~= nil then
            for k, v in pairs(gangs) do
                gangAccounts[v.gangid] = loadGangAccount(v.gangid)
            end
        end
        ready = ready + 1
    end)

    repeat Wait(0) until ready == 5
    resetDailyLimit()
    local totalAccounts = (buis + cur + sav + gang)
    print(' \n^1 [PixelWorld Banking] ^3- Accounts Loaded Successfully^3 \n Current Accounts: ^4'..cur..'^3 \n Savings Accounts: ^4'..sav..'^3 \n Gang Accounts: ^4'..gang..'^3 \n Buisness Accounts: ^4'..buis..'^3 \n TOTAL ACCOUNTS: ^4'..totalAccounts..'^8^7')
end)

exports('buisness', function(acctType, bid)
    if buisnessAccounts[acctType] then
        if buisnessAccounts[acctType][tonumber(bid)] then
            return buisnessAccounts[acctType][tonumber(bid)]
        end
    end
end)

RegisterServerEvent('pw_banking:server:modifyBank')
AddEventHandler('pw_banking:server:modifyBank', function(bank, k, v)
    if banks[tonumber(bank)] then
        banks[tonumber(bank)][k] = v
        TriggerClientEvent('pw_banking:client:syncBanks', -1, banks)
    end
end)

exports('modifyBank', function(bank, k, v)
    TriggerEvent('pw_banking:server:modifyBank', bank, k, v)
end)

exports('registerAccount', function(cid)
    local _cid = tonumber(cid)
    currentAccounts[_cid] = generateCurrent(_cid)
end)

exports('current', function(cid)
    if currentAccounts[cid] then
        return currentAccounts[cid]
    end
end)

exports('debitcard', function(cardnumber)
    if bankCards[tonumber(cardnumber)] then
        return bankCards[tonumber(cardnumber)]
    else
        return false
    end
end)

exports('savings', function(cid)
    if savingsAccounts[cid] then
        return savingsAccounts[cid]
    end
end)

exports('gang', function(gid)
    if gangAccounts[cid] then
        return gangAccounts[cid]
    end
end)

PW.RegisterServerCallback('pw_banking:server:requestBanks', function(source, cb)
    repeat Wait(0) until banks ~= nil
    cb(banks)
end)

PW.RegisterServerCallback('pw_banking:server:checkMoneyBagCount', function(source, cb)
    local _src = source
    local _char = exports['pw_base']:Source(_src)
    cb(_char:Inventories().getItemCount('moneybag'))
end)

function checkAccountExists(acct, sc)
    local success
    local cid
    local processed = false
    MySQL.Async.fetchAll("SELECT * FROM `bank_accounts` WHERE `account_number` = @ac AND `sort_code` = @sc", {['@ac'] = acct, ['@sc'] = sc}, function(exists)
        if exists[1] ~= nil then 
            success = true
            cid = exists[1].character_id
            actype = exists[1].account_type
        else
            success = false
            cid = false
            actype = false
        end
        processed = true
    end)
    repeat Wait(0) until processed == true
    return success, cid, actype
end

RegisterServerEvent('pw_banking:createNewCard')
AddEventHandler('pw_banking:createNewCard', function()
    local _src = source
    local _char = exports.pw_base:Source(_src)

    if _char ~= nil then
        local _cid = _char:Character():getCID()
        if (_cid) then
            currentAccounts[tonumber(_cid)].generateNewCard()
        end
    end
end)

RegisterServerEvent('pw_base:itemUsed')
AddEventHandler('pw_base:itemUsed', function(_src, data)
    if data.item == "moneybag" then
        TriggerClientEvent('pw_banking:client:usedMoneyBag', _src, data)
    end
end)

RegisterServerEvent('pw_banking:server:unpackMoneyBag')
AddEventHandler('pw_banking:server:unpackMoneyBag', function(item)
    local _src = source
    if item ~= nil then
        local _char = exports['pw_base']:Source(_src)
        local _cid = _char:Character().getCID()
        local decode = json.decode(item.metapublic)
        _char:Inventories():Remove().Item(item, 1)
        _char:Cash().Add(tonumber(decode.amount))
        TriggerClientEvent('pw:notification:SendAlert', _src, {type = "success", text = "The cashier has counted your money bag and gave you $"..decode.amount.." cash.", length = 5000})
    end
end)

function getCharacterName(cid)
    local name
    MySQL.Async.fetchAll("SELECT * FROM `characters` WHERE `cid` = @cid", {['@cid'] = cid}, function(exists)
        if exists[1] ~= nil then 
            name = exists[1].firstname..' '..exists[1].lastname
        else
            name = false
        end
    end)
    while name == nil do Wait(0) end
    return name
end

RegisterServerEvent('pw_banking:initiateTransfer')
AddEventHandler('pw_banking:initiateTransfer', function(data)
    local _src = source
    local _startChar = exports.pw_base:Source(_src)

    while _startChar == nil do Wait(0) end

    local checkAccount, cid, acType = checkAccountExists(data.account, data.sortcode)
    while checkAccount == nil do Wait(0) end

    if (checkAccount) then 
        local receiptName = getCharacterName(cid)
        while receiptName == nil do Wait(0) end

        if receiptName ~= false or receiptName ~= nil then 
            local userOnline = exports.pw_base:checkOnline(cid)
            
            if userOnline ~= false then
                -- User is online so we can do a straght transfer 
                local _targetUser = exports.pw_base:Source(userOnline)
                if acType == "Current" then
                    local targetBank = _targetUser:Bank().Add(data.amount, 'Bank Transfer from '.._startChar.GetName())
                    while targetBank == nil do Wait(0) end
                    local bank = _startChar:Bank().Remove(data.amount, 'Bank Transfer to '..receiptName)
                    TriggerClientEvent('pw:notification:SendAlert', _src, {type = "inform", text = "You have sent a bank transfer to "..receiptName..' for the amount of $'..data.amount, length = 5000})
                    TriggerClientEvent('pw:notification:SendAlert', userOnline, {type = "inform", text = "You have received a bank transfer from ".._startChar.GetName()..' for the amount of $'..data.amount, length = 5000})
                    TriggerClientEvent('pw_banking:openBankScreen', _src)
                    TriggerClientEvent('pw_banking:successAlert', _src, 'You have sent a bank transfer to '..receiptName..' for the amount of $'..data.amount)
                else
                    local targetBank = savingsAccounts[cid].AddMoney(data.amount, 'Bank Transfer from '.._startChar.GetName())
                    while targetBank == nil do Wait(0) end
                    local bank = _startChar:Bank().Remove(data.amount, 'Bank Transfer to '..receiptName)
                    TriggerClientEvent('pw:notification:SendAlert', _src, {type = "inform", text = "You have sent a bank transfer to "..receiptName..' for the amount of $'..data.amount, length = 5000})
                    TriggerClientEvent('pw:notification:SendAlert', userOnline, {type = "inform", text = "You have received a bank transfer from ".._startChar.GetName()..' for the amount of $'..data.amount, length = 5000})
                    TriggerClientEvent('pw_banking:openBankScreen', _src)
                    TriggerClientEvent('pw_banking:successAlert', _src, 'You have sent a bank transfer to '..receiptName..' for the amount of $'..data.amount)
                end
                
            else
                -- User is not online so we need to manually adjust thier bank balance.
                    MySQL.Async.fetchScalar("SELECT `amount` FROM `bank_accounts` WHERE `account_number` = @an AND `sort_code` = @sc AND `character_id` = @cid", {
                        ['@an'] = data.account,
                        ['@sc'] = data.sortcode,
                        ['@cid'] = cid
                    }, function(currentBalance)
                        if currentBalance ~= nil then
                            local newBalance = currentBalance + data.amount
                            if newBalance ~= currentBalance then
                                MySQL.Async.execute("UPDATE `bank_accounts` SET `amount` = @newBalance WHERE `account_number` = @an AND `sort_code` = @sc AND `character_id` = @cid", {
                                    ['@an'] = data.account,
                                    ['@sc'] = data.sortcode,
                                    ['@cid'] = cid,
                                    ['@newBalance'] = newBalance
                                }, function(rowsChanged)
                                    if rowsChanged == 1 then
                                        local time = os.date("%Y-%m-%d %H:%M:%S")
                                        MySQL.Async.insert("INSERT INTO `bank_statements` (`account`, `character_id`, `account_number`, `sort_code`, `deposited`, `withdraw`, `balance`, `date`, `type`) VALUES (@accountty, @cid, @account, @sortcode, @deposited, @withdraw, @balance, @date, @type)", {
                                            ['@accountty'] = acType,
                                            ['@cid'] = cid,
                                            ['@account'] = data.account,
                                            ['@sortcode'] = data.sortcode,
                                            ['@deposited'] = data.amount,
                                            ['@withdraw'] = nil,
                                            ['@balance'] = newBalance,
                                            ['@date'] = time,
                                            ['@type'] = 'Bank Transfer from '.._startChar.GetName()
                                        }, function(statementUpdated)
                                            if statementUpdated > 0 then 
                                                local bank = _startChar:Bank().Remove(data.amount, 'Bank Transfer to '..receiptName)
                                                TriggerClientEvent('pw:notification:SendAlert', _src, {type = "inform", text = "You have sent a bank transfer to "..receiptName..' for the amount of $'..data.amount, length = 5000})
                                                TriggerClientEvent('pw_banking:openBankScreen', _src)
                                                TriggerClientEvent('pw_banking:successAlert', _src, 'You have sent a bank transfer to '..receiptName..' for the amount of $'..data.amount)
                                            end
                                        end)
                                    end
                                end)
                            end
                        end
                    end)
            end
        end
    else
        -- Send error to client that account details do no exist.
        TriggerClientEvent('pw_banking:transferError', _src, 'The account details entered could not be located.')
    end

end)

PW.RegisterServerCallback('pw_banking:getBankingInformation', function(source, cb)
    local _src = source
    local _char = exports.pw_base:Source(_src)
    while _char == nil do Wait(0) end
        if (_char) then
            local banking = {
                    ['name'] = _char:Character().getName(),
                    ['bankbalance'] = '$'.._char:Bank().getBalance(),
                    ['cash'] = '$'.._char:Cash().getCash(),
                    ['accountinfo'] = _char:Bank().GetBankAccount(),
                    ['statement'] = _char:Bank().GetStatement(),
                }
                
                if savingsAccounts[tonumber(_char:Character().getCID())] then
                    banking['savings'] = {
                        ['amount'] = savingsAccounts[tonumber(_char:Character().getCID())].GetBalance(),
                        ['details'] = savingsAccounts[tonumber(_char:Character().getCID())].getAccount(),
                        ['statement'] = savingsAccounts[tonumber(_char:Character().getCID())].getStatement(),
                    }
                    PW.TablePrint(savingsAccounts[tonumber(_char:Character().getCID())].getStatement())
                   -- banking['savingsStatement'] = _char.GetStatement('Savings')
                end

                if _char:Bank():GetCardDetails() ~= nil then
                    banking['cardInformation'] = _char:Bank().GetCardDetails()
                    --banking['cardLimit'] = _char.GetWithdrawLimit()
                end
                cb(banking)
        else
            cb(nil)
        end
end)

PW.RegisterServerCallback('pw_banking:ownsDebitCard', function(source, cb)
    local _src = source
    local _char = exports.pw_base:Source(_src)
    while _char == nil do Wait(0) end
        if (_char) then
                if _char:Bank():GetCardDetails() ~= nil then
                    local cardInformation = _char:Bank():GetCardDetails()
                    if cardInformation['cardLocked'] == false and cardInformation['cardStatus'] == true then
                        cb(true)
                    else
                        cb(false)
                    end
                else
                    cb(false)
                end
        else
            cb(false)
        end
end)

RegisterServerEvent('pw_banking:createBankCard')
AddEventHandler('pw_banking:createBankCard', function(pin)
    local _src = source
    local _char = exports.pw_base:Source(_src)
    local _cid = _char:Character():getCID()
    local cardCreated, generatedCard, acct, sc = currentAccounts[_cid].CreateDebitCard(pin)
    if cardCreated then
        -- Create Pysical Card item
        TriggerClientEvent('pw_banking:openBankScreen', _src)
        TriggerClientEvent('pw_banking:successAlert', _src, 'You have successfully ordered a Debit Card.')
    end
end)

RegisterServerEvent('pw_banking:doQuickDeposit')
AddEventHandler('pw_banking:doQuickDeposit', function(amount)
    local _src = source
    local _char = exports.pw_base:Source(_src)

    while _char == nil do Wait(0) end

    local currentCash = _char:Cash().getCash()
    
    if tonumber(amount) <= currentCash then
        local cash = _char:Cash().Remove(amount)
        local bank = _char:Bank().Add(amount, 'Cash Deposit')
        if bank then
            TriggerClientEvent('pw_banking:openBankScreen', _src)
            TriggerClientEvent('pw_banking:successAlert', _src, 'You made a cash deposit of $'..amount..' successfully.')
        end
    end
end)

RegisterServerEvent('pw_banking:toggleCard')
AddEventHandler('pw_banking:toggleCard', function(toggle)
    local _src = source
    local _char = exports.pw_base:Source(_src)
    while _char == nil do Wait(0) end
        _char:Bank():ToggleDebitCard(toggle)
end)

RegisterServerEvent('pw_banking:doQuickWithdraw')
AddEventHandler('pw_banking:doQuickWithdraw', function(amount, branch)
    local _src = source
    local _char = exports.pw_base:Source(_src)

    while _char == nil do Wait(0) end

    local currentCash = _char:Bank():getBalance()
    
    if tonumber(amount) <= currentCash then
        local bank = _char:Bank().Remove(amount, 'Cash Withdraw')
        local cash = _char:Cash().Add(amount)
        if cash then 
            TriggerClientEvent('pw_banking:openBankScreen', _src)
            TriggerClientEvent('pw_banking:successAlert', _src, 'You made a cash withdrawal of $'..amount..' successfully.')
        end
    end
end)

function resetDailyLimit()
    MySQL.Async.execute("UPDATE `characters` SET `dailyWithdraw` = 0", {}, function(rowsChanged)
        if rowsChanged > 0 then
            print('^1 [PixelWorld Banking] ^7- We have reset daily ATM Withdrawal limits for ^3'..rowsChanged..' ^7characters.')
        end
    end)
    SetTimeout(2880000, function() resetDailyLimit() end)
end

RegisterServerEvent('pw_banking:updatePin')
AddEventHandler('pw_banking:updatePin', function(pin)
    if pin ~= nil then 
        local _src = source
        local _char = exports.pw_base:Source(_src)
        while _char == nil do Wait(0) end
        _char:Bank().UpdateDebitCardPin(pin)
        TriggerClientEvent('pw_banking:openBankScreen', _src)
        TriggerClientEvent('pw_banking:successAlert', _src, 'You have successfully updated your Debit card pin.')
    end
end)

RegisterServerEvent('pw_banking:savingsDeposit')
AddEventHandler('pw_banking:savingsDeposit', function(amount)
    local _src = source
    local _char = exports.pw_base:Source(_src)

    while _char == nil do Wait(0) end

    local currentBank = _char:Bank():getBalance()
    
    if tonumber(amount) <= currentBank then
            local bank = _char:Bank().Remove(amount, 'Current Account to Savings Transfer')
            local savings = savingsAccounts[tonumber(_char:Character().getCID())].AddMoney(amount, 'Current Account to Savings Transfer')
            while bank == nil do Wait(0) end
            while savings == nil do Wait(0) end
            TriggerClientEvent('pw_banking:openBankScreen', _src)
            TriggerClientEvent('pw_banking:successAlert', _src, 'You made a savings deposit of $'..amount..' successfully.')
    end
end)

RegisterServerEvent('pw_banking:savingsWithdraw')
AddEventHandler('pw_banking:savingsWithdraw', function(amount)
    local _src = source
    local _char = exports.pw_base:Source(_src)

    while _char == nil do Wait(0) end

    local currentSavings = savingsAccounts[tonumber(_char:Character().getCID())].GetBalance()
    
    if tonumber(amount) <= currentSavings then
            local savings = savingsAccounts[tonumber(_char:Character().getCID())].RemoveMoney(amount, 'Savings to Current Account Transfer')
            local bank = _char:Bank().Add(amount, 'Savings to Current Account Transfer')
            while bank == nil do Wait(0) end
            while savings == nil do Wait(0) end
            TriggerClientEvent('pw_banking:openBankScreen', _src)
            TriggerClientEvent('pw_banking:successAlert', _src, 'You made a savings withdrawal of $'..amount..' successfully.')
    end
end)

RegisterServerEvent('pw_banking:createSavingsAccount')
AddEventHandler('pw_banking:createSavingsAccount', function()
    local _src = source 
    local _char = exports.pw_base:Source(_src)

    local success = createSavingsAccount(_char:Character().getCID())
    
    repeat Wait(0) until success ~= nil
    
    TriggerClientEvent('pw_banking:openBankScreen', _src)
    TriggerClientEvent('pw_banking:successAlert', _src, 'You have successfully opened a savings account.')
end)