module Main where

import Ledger
import Types

main :: IO ()
main = do
    let ord1 = createOrder "ord1" 12 2 LIMIT
    let ord2 = createOrder "ord2" 15 3 LIMIT
    let trade1 = Trade "trade1" ord1 (Just ord2) False (Just 3)
    let trade2 = Trade "trade2" ord1 (Just ord2) False (Just 7)
    putStrLn $ show $ totalProfit [trade1, trade2]
    let trade3 = closeTrade ord2 (Trade "trade3" ord1 Nothing True Nothing)
    putStrLn $ show trade3
    putStrLn $ show $ totalProfit [trade1, trade2, trade3]

    
