module Coinbase () where

-- File to contain the interaction with Coinbase API

-- placeOrder

-- getCurrentTick
getCurrentTick :: Tick

-- getOpenOrders

updateTicks :: [Tick] -> [Tick]
updateTicks currentTicks = currentTicks ++ [getCurrentTick]