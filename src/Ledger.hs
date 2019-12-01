module Ledger (
    totalProfit,
    openTrade,
    closeTrade,
    createOrder
) where

import Types

-- Given a new Order and the list of current trades, updae the list with the new trade, incrementing the ID
openTrade :: Order -> [Trade] -> [Trade]
openTrade order [] = [createTrade 0 order]
openTrade order trades = trades ++ [createTrade newId order]
    where
        newId = (tradeId $ last trades) + 1
       
-- Close out a trade by adding an exit position and calculating profit, mark as no longer open
-- We assume only one open trade at a time, so the trade to update is the last in the list
closeTrade :: Order -> [Trade] -> [Trade]
closeTrade exit trades = (init trades) ++ [trade { exit = Just exit, isOpen = False, profit = Just (calculateProfit currentEntry exit) }]
        where
            trade = last trades
            currentEntry = entry trade

createOrder :: Int -> Double -> Double -> OrdType -> Side -> Order
createOrder newOrderId price quantity ordType side = Order newOrderId price quantity (price*quantity) ordType side

createTrade :: Int -> Order -> Trade
createTrade newTradeId order = Trade newTradeId order Nothing True Nothing

calculateProfit :: Order -> Order -> Double
calculateProfit entry exit = (value exit) - (value entry)

totalProfit :: [Trade] -> Double
totalProfit trades = _totalProfit [trade | trade <- trades, isOpen trade == False] (Just 0)

-- Helper function: Use applicative property of Maybe and currying to fmap (<$>) the + operator over total and 'profit total' Maybe values
_totalProfit :: [Trade] -> Maybe Double -> Double
_totalProfit (trade:trades) total = _totalProfit trades ((+) <$> total <*> profit trade)
_totalProfit [] total = case total of
    Nothing -> 0
    Just x -> x