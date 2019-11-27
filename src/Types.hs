module Types (
    OrdType(LIMIT, MARKET),
    Order(Order, quantity, value, orderId),
    Trade (Trade, entry, exit, isOpen, profit, tradeId),
    Side(BUY, SELL)
) where

data OrdType = LIMIT | MARKET deriving (Show)

data Side = BUY | SELL deriving (Show)

data Order = Order {
    orderId :: Int,
    price :: Double,
    quantity :: Double,
    value :: Double,
    ordType :: OrdType,
    side :: Side
} deriving (Show)

-- We enforce that we must provide an order to enter a trade
data Trade = Trade {
    tradeId :: Int,   
    entry :: Order,
    exit :: Maybe Order,
    isOpen :: Bool,
    profit :: Maybe Double
} deriving (Show)