module Ledger (
    totalProfit,
    openTrade,
    closeTrade,
    createOrder
) where

import Types

openTrade :: Order -> String -> Trade
openTrade order newId = Trade newId order Nothing True Nothing

closeTrade :: Order -> Trade -> Trade
closeTrade exit trade@(Trade _ entry _ _ _) = trade { exit = Just exit, isOpen = False, profit = Just (calculateProfit entry exit) }

createOrder :: String -> Double -> Double -> OrdType -> Order
createOrder newId price quantity ordType = Order newId price quantity (price*quantity) ordType

calculateProfit :: Order -> Order -> Double
calculateProfit entry exit = (value exit) - (value entry)

totalProfit :: [Trade] -> Double
totalProfit trades = _totalProfit [trade | trade <- trades, isOpen trade == False] (Just 0)

-- Use applicative property of Maybe and currying to fmap (<$>) the + operator over total and 'profit total' Maybe values
_totalProfit :: [Trade] -> Maybe Double -> Double
_totalProfit (trade:trades) total = _totalProfit trades ((+) <$> total <*> profit trade)
_totalProfit [] total = case total of
    Nothing -> 0
    Just x -> x