--~ Copyright Ⓒ 2015 Victor Baybekov

package.path = package.path .. ";" .. ".\\?.lua;" .. ".\\?.luac"
package.cpath = package.cpath .. ";" .. '.\\clibs\\?.dll'

local qsfunctions = {}

function qsfunctions.dispatch_and_process(msg)
    if qsfunctions[msg.cmd] then
        -- dispatch a command simply by a table lookup
        -- in qsfunctions method names must match commands
        local status, result = pcall(qsfunctions[msg.cmd], msg)
        if status then
            return result
        else
            msg.cmd = "lua_error"
            msg.lua_error = "Lua error: " .. result
            return msg
        end
    else
        msg.cmd = "lua_error"
        msg.lua_error = "Command not implemented in Lua qsfunctions module: " .. msg.cmd
        return msg
    end
end


---------------------
-- Debug functions --
---------------------

--- Returns Pong to Ping
-- @param msg message table
-- @return same msg table
function qsfunctions.ping(msg)
    -- need to know data structure the caller gives
    msg.t = 0 -- avoid time generation. Could also leave original
    if msg.data == "Ping" then
        msg.data = "Pong"
        return msg
    else
        msg.data = msg.data .. " is not Ping"
        return msg
    end
end

--- Echoes its message
function qsfunctions.echo(msg)
    return msg
end

--- Test error handling
function qsfunctions.divide_string_by_zero(msg)
    msg.data = "asd" / 0
    return msg
end

--- Is running inside quik
function qsfunctions.is_quik(msg)
    if getScriptPath then msg.data = 1 else msg.data = 0 end
    return msg
end



-----------------------
-- Service functions --
-----------------------

<<<<<<< HEAD
--- ������� ������������� ��� ����������� ��������� ����������� ����������� ����� �
-- �������. ���������� "1", ���� ���������� ����� ���������� � "0", ���� �� ����������.
=======
--- Функция предназначена для определения состояния подключения клиентского места к
-- серверу. Возвращает «1», если клиентское место подключено и «0», если не подключено.
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.isConnected(msg)
    -- set time when function was called
    msg.t = timemsec()
    msg.data = isConnected()
    return msg
end

<<<<<<< HEAD
--- ������� ���������� ���� �� �������� �������� ���� info.exe, ����������� ������ ������,
-- ��� ������������ ��������� ����� ("\"). ��������, C:\QuikFront.
=======
--- Функция возвращает путь, по которому находится файл info.exe, исполняющий данный
-- скрипт, без завершающего обратного слэша («\»). Например, C:\QuikFront.
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.getWorkingFolder(msg)
    -- set time when function was called
    msg.t = timemsec()
    msg.data = getWorkingFolder()
    return msg
end

<<<<<<< HEAD
--- ������� ���������� ���� �� �������� ��������� ����������� ������,
-- ��� ������������ ��������� ����� ("\"). ��������, C:\QuikFront\Scripts.
=======
--- Функция возвращает путь, по которому находится запускаемый скрипт, без завершающего
-- обратного слэша («\»). Например, C:\QuikFront\Scripts.
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.getScriptPath(msg)
    -- set time when function was called
    msg.t = timemsec()
    msg.data = getScriptPath()
    return msg
end

<<<<<<< HEAD
--- ������� ���������� �������� ���������� ��������������� ����
-- (����� ���� ����� / �������������� ����...).
=======
--- Функция возвращает значения параметров информационного окна (пункт меню
-- Связь / Информационное окно…).
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.getInfoParam(msg)
    -- set time when function was called
    msg.t = timemsec()
    msg.data = getInfoParam(msg.data)
    return msg
end

<<<<<<< HEAD
--- ������� ���������� ��������� � ��������� QUIK.
=======
--- Функция отображает сообщения в терминале QUIK.
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.message(msg)
    log(msg.data, 1)
    msg.data = ""
    return msg
end
function qsfunctions.warning_message(msg)
    log(msg.data, 2)
    msg.data = ""
    return msg
end
function qsfunctions.error_message(msg)
    log(msg.data, 3)
    msg.data = ""
    return msg
end

<<<<<<< HEAD
--- ������� ���������������� ���������� �������.
=======
--- Функция приостанавливает выполнение скрипта.
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.sleep(msg)
    delay(msg.data)
    msg.data = ""
    return msg
end

<<<<<<< HEAD
--- ������� ��� ������ ���������� ����������.
=======
--- Функция для вывода отладочной информации. 
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.PrintDbgStr(msg)
    log(msg.data, 0)
    msg.data = ""
    return msg
end

---------------------
-- Class functions --
---------------------

<<<<<<< HEAD
--- ������� ������������� ��� ��������� ������ ����� �������, ���������� � ������� � ���� ������ �����.
=======
--- Функция предназначена для получения списка кодов классов, переданных с сервера в ходе сеанса связи.
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.getClassesList(msg)
    msg.data = getClassesList()
--    if  msg.data then log(msg.data) else log("getClassesList returned nil") end
    return msg
end

<<<<<<< HEAD
--- ������� ������������� ��� ��������� ���������� � ������.
=======
--- Функция предназначена для получения информации о классе.
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.getClassInfo(msg)
    msg.data = getClassInfo(msg.data)
--    if msg.data then log(msg.data.name) else log("getClassInfo  returned nil") end
    return msg
end

<<<<<<< HEAD
--- ������� ������������� ��� ��������� ������ ����� ����� ��� ������ �������, ��������� ������� �����.
=======
--- Функция предназначена для получения списка кодов бумаг для списка классов, заданного списком кодов.
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.getClassSecurities(msg)
    msg.data = getClassSecurities(msg.data)
--    if msg.data then log(msg.data) else log("getClassSecurities returned nil") end
    return msg
end

<<<<<<< HEAD
--- ������� ��������� ������, ������� �� � ������� ������ �� ���������� ������ � ������.
=======
--- Функция позволяет узнать, заказан ли с сервера стакан по указанному классу и бумаге.
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.getSecurityInfo(msg)
    local spl = split(msg.data, "|")
    local class_code, sec_code = spl[1], spl[2]
    msg.data = getSecurityInfo(class_code, sec_code)
    return msg
end

<<<<<<< HEAD
--- ������� ������������� ��� ����������� ������ �� ���� ����������� �� ��������� ������ �������.
function qsfunctions.getSecurityClass(msg)
    local spl = split(msg.data, "|")
    local classes_list, sec_code = spl[1], spl[2]

	for class_code in string.gmatch(classes_list,"%a+") do
		if getSecurityInfo(class_code,sec_code) then
			msg.data = class_code
			return msg
		end
	end
	msg.data = ""
	return msg
end

--- ������� ���������� ��� �������
function qsfunctions.getClientCode(msg)
	for i=0,getNumberOf("MONEY_LIMITS")-1 do
		local clientcode = getItem("MONEY_LIMITS",i).client_code
		if clientcode ~= nil then
			msg.data = clientcode
			return msg
		end
    end
	return msg
end

--- ������� ���������� �������� ���� ��� �������������� ���� ������
function qsfunctions.getTradeAccount(msg)
	for i=0,getNumberOf("trade_accounts")-1 do
		local trade_account = getItem("trade_accounts",i)
		if string.find(trade_account.class_codes,msg.data,1,1) then
			msg.data = trade_account.trdaccid
			return msg
		end
	end
	return msg
end



---------------------------------------------------------------------
-- Order Book functions (������� ��� ������ �� �������� ���������) --
---------------------------------------------------------------------

--- ������� ���������� �� ������ ��������� ������� �� ���������� ������ � ������.
=======


---------------------------------------------------------------------
-- Order Book functions (Функции для работы со стаканом котировок) --
---------------------------------------------------------------------

--- Функция заказывает на сервер получение стакана по указанному классу и бумаге.
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.Subscribe_Level_II_Quotes(msg)
    local spl = split(msg.data, "|")
    local class_code, sec_code = spl[1], spl[2]
    msg.data = Subscribe_Level_II_Quotes(class_code, sec_code)
    return msg
end

<<<<<<< HEAD
--- ������� �������� ����� �� ��������� ������� �� ���������� ������ � ������.
=======
--- Функция отменяет заказ на получение с сервера стакана по указанному классу и бумаге.
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.Unsubscribe_Level_II_Quotes(msg)
    local spl = split(msg.data, "|")
    local class_code, sec_code = spl[1], spl[2]
    msg.data = Unsubscribe_Level_II_Quotes(class_code, sec_code)
    return msg
end

<<<<<<< HEAD
--- ������� ��������� ������, ������� �� � ������� ������ �� ���������� ������ � ������.
=======
--- Функция позволяет узнать, заказан ли с сервера стакан по указанному классу и бумаге.
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.IsSubscribed_Level_II_Quotes(msg)
    local spl = split(msg.data, "|")
    local class_code, sec_code = spl[1], spl[2]
    msg.data = IsSubscribed_Level_II_Quotes(class_code, sec_code)
    return msg
end

-----------------------
-- Trading functions --
-----------------------

<<<<<<< HEAD
-- ������� ���������� ���������� �� ������ � ���������� ������ ���������, �������
-- ����� ���������������. ������ ����, ����������� ����� ����� �������
-- OnTransReply, �� �������� �� TRANS_ID �� ������� ��������� ������������ ����������.
=======
--- отправляет транзакцию на сервер и возвращает пустое сообщение, которое
-- будет проигноировано. Вместо него, отправитель будет ждать события
-- OnTransReply, из которого по TRANS_ID он получит результат отправленной транзакции
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.sendTransaction(msg)
    local res = sendTransaction(msg.data)
    if res~="" then
        -- error handling
        msg.cmd = "lua_transaction_error"
        msg.lua_error = res
        return msg
    else
        -- transaction sent
        msg.data = true
        return msg
    end
end

<<<<<<< HEAD
-- ������� ������������� ��� ��������� �������� ���� ���������� �������� ���������� �� ������� ������� �������� ����������.
-- � ������� ���� ������� ����� �������� ����� �� �������� ������� ������� �������� ���������� ��� �������� ����� ������ � ������.
=======
--- Функция предназначена для получения значений всех параметров биржевой информации из Таблицы текущих значений параметров. 
-- С помощью этой функции можно получить любое из значений Таблицы текущих значений параметров для заданных кодов класса и бумаги. 
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350

function qsfunctions.getParamEx(msg)
    local spl = split(msg.data, "|")
    local class_code, sec_code, param_name = spl[1], spl[2], spl[3]
    msg.data = getParamEx(class_code, sec_code, param_name)
    return msg
end

<<<<<<< HEAD
-- ������� ������������� ��� ��������� ���������� �� �������� �������.
=======
-- Функция предназначена для получения информации по бумажным лимитам. 
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.getDepo(msg)
    local spl = split(msg.data, "|")
    local clientCode, firmId, secCode, account = spl[1], spl[2], spl[3], spl[4]
    msg.data = getDepo(clientCode, firmId, secCode, account)
    return msg
end

<<<<<<< HEAD
-- ������� ������������� ��� ��������� ���������� �� �������� �������.
function qsfunctions.getDepoEx(msg)
    local spl = split(msg.data, "|")
    local firmId, clientCode, secCode, account, limit_kind = spl[1], spl[2], spl[3], spl[4], spl[5]
    msg.data = getDepoEx(firmId, clientCode, secCode, account, tonumber(limit_kind))
    return msg
end

=======
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.getFuturesHolding(msg)
    local spl = split(msg.data, "|")
    local firmId, accId, secCode, posType = spl[1], spl[2], spl[3], spl[4]
	local result, err = getFuturesHolding(firmId, accId, secCode, posType*1)
	if result then
		msg.data = result
	else
<<<<<<< HEAD
		--log("Futures holding returns nil", 3)
=======
		log("Futures holding returns nil", 3)
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
		msg.data = nil
	end
    return msg
end

<<<<<<< HEAD
-- ������� ���������� ������� ������ (��� ��� �� ��������� �����������)
function qsfunctions.get_orders(msg)
	if msg.data ~= "" then
		local spl = split(msg.data, "|")
		class_code, sec_code = spl[1], spl[2]
	end

	local orders = {}
	for i = 0, getNumberOf("orders") - 1 do
		local order = getItem("orders", i)
		if msg.data == "" or (order.class_code == class_code and order.sec_code == sec_code) then
			table.insert(orders, order)
		end
	end
	msg.data = orders
	return msg
end

-- ������� ���������� ������ �� ��������� ����������� � ID-����������
function qsfunctions.getOrder_by_ID(msg)
	if msg.data ~= "" then
		local spl = split(msg.data, "|")
		class_code, sec_code, trans_id = spl[1], spl[2], spl[3]
	end

	local order_num = 0
	local res
	for i = 0, getNumberOf("orders") - 1 do
		local order = getItem("orders", i)
		if order.class_code == class_code and order.sec_code == sec_code and order.trans_id == tonumber(trans_id) and order.order_num > order_num then
			order_num = order.order_num
			res = order
		end
	end
	msg.data = res
	return msg
end

-- ������� ���������� ������ �� ������
function qsfunctions.getOrder_by_Number(msg)
	for i=0,getNumberOf("orders")-1 do
		local order = getItem("orders",i)
		if order.order_num == tonumber(msg.data) then
			msg.data = order
			return msg
		end
	end
	return msg
end

-- ������� ���������� ������� ������ (��� ��� �� ��������� �����������)
function qsfunctions.get_trades(msg)
	if msg.data ~= "" then
		local spl = split(msg.data, "|")
		class_code, sec_code = spl[1], spl[2]
	end

	local trades = {}
	for i = 0, getNumberOf("trades") - 1 do
		local trade = getItem("trades", i)
		if msg.data == "" or (trade.class_code == class_code and trade.sec_code == sec_code) then
			table.insert(trades, trade)
		end
	end
	msg.data = trades
	return msg
end

-- ������� ���������� ������� ������ �� ������ ������
function qsfunctions.get_Trades_by_OrderNumber(msg)
	local order_num = tonumber(msg.data)

	local trades = {}
	for i = 0, getNumberOf("trades") - 1 do
		local trade = getItem("trades", i)
		if trade.order_num == order_num then
			table.insert(trades, trade)
		end
	end
	msg.data = trades
	return msg
end

--function qsfunctions.getQuikTable(msg)
--	msg.data = SearchItems(msg.data, 0, getNumberOf(msg.data)-1)
--	return msg
--end

=======
--- Возвращает заявку по её номеру ---
--- На основе http://help.qlua.org/ch4_5_1_1.htm ---
function qsfunctions.get_order_by_number(msg)
	local spl = split(msg.data, "|")
	local class_code = spl[1]
	local order_id = tonumber(spl[2])
	msg.data = getOrderByNumber(class_code, order_id)
	return msg
end

--- Возвращает список записей из таблицы 'Лимиты по бумагам'
--- На основе http://help.qlua.org/ch4_6_11.htm и http://help.qlua.org/ch4_5_3.htm
function qsfunctions.get_depo_limits(msg)
	local sec_code = msg.data
	local count = getNumberOf("depo_limits")
	local depo_limits = {}
	for i = 0, count - 1 do
		local depo_limit = getItem("depo_limits", i)
		if msg.data == "" or depo_limit.sec_code == sec_code then
			table.insert(depo_limits, depo_limit)
		end
	end
	msg.data = depo_limits
	return msg
end

>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
--------------------------
-- Stop order functions --
--------------------------

<<<<<<< HEAD
--- ������� ���������� ������ ����-������
=======
--- Возвращает список стоп-заявок
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.get_stop_orders(msg)
	if msg.data ~= "" then
		local spl = split(msg.data, "|")
		class_code, sec_code = spl[1], spl[2]
	end

	local count = getNumberOf("stop_orders")
	local stop_orders = {}
	for i = 0, count - 1 do
		local stop_order = getItem("stop_orders", i)
		if msg.data == "" or (stop_order.class_code == class_code and stop_order.sec_code == sec_code) then
			table.insert(stop_orders, stop_order)
		end
	end
	msg.data = stop_orders
	return msg
end

-------------------------
--- Candles functions ---
-------------------------

<<<<<<< HEAD
--- ���������� ��� ����� �� �������������� �������. ������ ������ ���� ������.
=======
--- Возвращаем все свечи по идентификатору графика. График должен быть открыт
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.get_candles(msg)
	log("Called get_candles" .. msg.data, 2)
	local spl = split(msg.data, "|")
	local tag = spl[1]
	local line = tonumber(spl[2])
	local first_candle = tonumber(spl[3])
	local count = tonumber(spl[4])
	if count == 0 then
		count = getNumCandles(tag) * 1
	end
	log("Count: " .. count, 2)
	local t,n,l = getCandlesByIndex(tag, line, first_candle, count)
	log("Candles table size: " .. n, 2)
	log("Label: " .. l, 2)
	local candles = {}
	for i = 0, count - 1 do
		table.insert(candles, t[i])
	end
	msg.data = candles
	return msg
end

<<<<<<< HEAD
--- ������� �������� �������� (datasources) �� �����
data_sources = {}
last_indexes = {}

--- ����������� �� ��������� ���� ������ �� ��������� ����������� � ���������
function qsfunctions.subscribe_to_candles(msg)
	local class, sec, interval = get_candles_param(msg)
	local key = get_key(class, sec, interval)
	data_sources[key], error_descr = CreateDataSource(class, sec, interval)

	if(error_descr ~= nil) then
		msg.cmd = "lua_create_data_source_error"
		msg.lua_error = error_descr
		return msg
	end

	if data_sources[key] == nil then
		msg.cmd = "lua_create_data_source_error"
		msg.lua_error = "Can't create data source for " .. class .. ", " .. sec .. ", " .. tostring(interval)
	else
		--data_sources[key] = ds
		last_indexes[key] = data_sources[key]:Size()
		--------------------------

		all_candles = {}
		for i = 1, data_sources[key]:Size()-1 do
			local candle = {}
			candle.low   = data_sources[key]:L(i)
			candle.close = data_sources[key]:C(i)
			candle.high = data_sources[key]:H(i)
			candle.open = data_sources[key]:O(i)
			candle.volume = data_sources[key]:V(i)
			candle.datetime = data_sources[key]:T(i)

			candle.sec = sec
			candle.class = class
			candle.interval = interval

			table.insert(all_candles, candle)
		end
		msg.data = all_candles
		--------------------------
		data_sources[key]:SetUpdateCallback(
			function(index)
				data_source_callback(index, class, sec, interval)
=======
--- Возвращаем все свечи по заданному инструменту и интервалу
function qsfunctions.get_candles_from_data_source(msg)
	local ds, is_error = create_data_source(msg)
	if not is_error then
		--- датасорс изначально приходит пустой, нужно некоторое время подождать пока он заполниться данными
		repeat sleep(1) until ds:Size() > 0

		local count = tonumber(split(msg.data, "|")[4]) --- возвращаем последние count свечей. Если равен 0, то возвращаем все доступные свечи.
		local class, sec, interval = get_candles_param(msg)
		local candles = {}
		local start_i = count == 0 and 1 or math.max(1, ds:Size() - count + 1)
		for i = start_i, ds:Size() do
			local candle = fetch_candle(ds, i)
			candle.sec = sec
			candle.class = class
			candle.interval = interval
			table.insert(candles, candle)
		end
		ds:Close()
		msg.data = candles
	end
	return msg
end

function create_data_source(msg)
	local class, sec, interval = get_candles_param(msg)
	local ds, error_descr = CreateDataSource(class, sec, interval)
	local is_error = false
	if(error_descr ~= nil) then
		msg.cmd = "lua_create_data_source_error"
		msg.lua_error = error_descr
		is_error = true
	elseif ds == nil then
		msg.cmd = "lua_create_data_source_error"
		msg.lua_error = "Can't create data source for " .. class .. ", " .. sec .. ", " .. tostring(interval)
		is_error = true
	end
	return ds, is_error
end

function fetch_candle(data_source, index)
	local candle = {}
	candle.low   = data_source:L(index)
	candle.close = data_source:C(index)
	candle.high = data_source:H(index)
	candle.open = data_source:O(index)
	candle.volume = data_source:V(index)
	candle.datetime = data_source:T(index)
	return candle
end

--- Словарь открытых подписок (datasources) на свечи
data_sources = {}
last_indexes = {}

--- Подписаться на получения свечей по заданному инструмент и интервалу
function qsfunctions.subscribe_to_candles(msg)
	local ds, is_error = create_data_source(msg)
	if not is_error then
		local class, sec, interval = get_candles_param(msg)
		local key = get_key(class, sec, interval)
		data_sources[key] = ds
		last_indexes[key] = ds:Size()
		ds:SetUpdateCallback(
			function(index) 
				data_source_callback(index, class, sec, interval) 
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
			end)
	end
	return msg
end

function data_source_callback(index, class, sec, interval)
	local key = get_key(class, sec, interval)
	if index ~= last_indexes[key] then
		last_indexes[key] = index

<<<<<<< HEAD
		local candle = {}
		candle.low   = data_sources[key]:L(index - 1)
		candle.close = data_sources[key]:C(index - 1)
		candle.high = data_sources[key]:H(index - 1)
		candle.open = data_sources[key]:O(index - 1)
		candle.volume = data_sources[key]:V(index - 1)
		candle.datetime = data_sources[key]:T(index - 1)

=======
		local candle = fetch_candle(data_sources[key], index - 1)
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
		candle.sec = sec
		candle.class = class
		candle.interval = interval

		local msg = {}
        msg.t = timemsec()
        msg.cmd = "NewCandle"
        msg.data = candle
        sendCallback(msg)
	end
end

<<<<<<< HEAD
--- ���������� �� ��������� ������ �� ��������� ����������� � ���������
=======
--- Отписать от получения свечей по заданному инструменту и интервалу
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.unsubscribe_from_candles(msg)
	local class, sec, interval = get_candles_param(msg)
	local key = get_key(class, sec, interval)
	data_sources[key]:Close()
	data_sources[key] = nil
	last_indexes[key] = nil
	return msg
end

<<<<<<< HEAD
--- ��������� ������� �� �������� �� �������� ���������� � ��������
=======
--- Проверить открыта ли подписка на заданный инструмент и интервал
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function qsfunctions.is_subscribed(msg)
	local class, sec, interval = get_candles_param(msg)
	local key = get_key(class, sec, interval)
	for k, v in pairs(data_sources) do
		if key == k then
			msg.data = true;
			return  msg
		end
	end
	msg.data = false
	return msg
end

<<<<<<< HEAD
--- ���������� �� msg ���������� � ����������� �� ������� ������������� � ���������
=======
--- Возвращает из msg информацию о инструменте на который подписываемся и интервале
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function get_candles_param(msg)
	local spl = split(msg.data, "|")
	return spl[1], spl[2], tonumber(spl[3])
end

<<<<<<< HEAD
--- ���������� ���������� ���� ��� ����������� �� ������� ������������� � ���������
=======
--- Возвращает уникальный ключ для инструмента на который подписываемся и инетрвала
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
function get_key(class, sec, interval)
	return class .. "|" .. sec .. "|" .. tostring(interval)
end

<<<<<<< HEAD
return qsfunctions
=======
return qsfunctions
>>>>>>> 91b29cc115763bff30f3ed949bc7a2bf88d3b350
