module Types (
    OrdType(LIMIT, MARKET),
    Order(Order, quantity, value),
    Trade (Trade, entry, exit, isOpen, profit)
) where

data OrdType = LIMIT | MARKET deriving (Show)

data Order = Order {
    orderId :: String,
    price :: Double,
    quantity :: Double,
    value :: Double,
    ordType :: OrdType
} deriving (Show)

-- We enforce that we must provide an order to enter a trade
data Trade = Trade {
    tradeId :: String,   
    entry :: Order,
    exit :: Maybe Order,
    isOpen :: Bool,
    profit :: Maybe Double
} deriving (Show)