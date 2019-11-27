module Main where

import Ledger
import Types

main :: IO ()
main = do
    let ord1 = createOrder 1 12 2 LIMIT BUY
    let ord2 = createOrder 2 15 3 LIMIT SELL
    let trade1 = Trade 1 ord1 (Just ord2) False (Just 3)
    let trade2 = Trade 2 ord1 (Just ord2) False (Just 7)
    putStrLn $ show $ totalProfit [trade1, trade2]
    let trade3 = Trade 3 ord1 Nothing True Nothing
    let trades = closeTrade ord2 [trade1, trade2, trade3]
    putStrLn $ show trades
    putStrLn $ show $ totalProfit trades

    
