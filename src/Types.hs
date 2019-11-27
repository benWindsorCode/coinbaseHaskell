module Types (
    OrdType(LIMIT, MARKET),
    Order(Order, quantity, value, orderId),
    Trade (Trade, entry, exit, isOpen, profit, tradeId),
    Side(BUY, SELL),
    Algo
) where

data OrdType = LIMIT | MARKET deriving (Show)

data Side = BUY | SELL deriving (Show)

-- todo: Should this be a type instead?
type Algo = [Tick] -> Maybe Order

-- Is this the way to do this? I want to enforce the evaluate function but dont want to have to provide an 'a'
-- class Algo a where
--     evaluate :: [a] -> ([a] -> Bool) -> Maybe Order

data Order = Order {
    orderId :: Int,
    price :: Double,
    quantity :: Double,
    value :: Double,
    ordType :: OrdType,
    side :: Side
} deriving (Show)

-- We enforce that we must provide an order to enter a trade, but an exit order is optional
data Trade = Trade {
    tradeId :: Int,   
    entry :: Order,
    exit :: Maybe Order,
    isOpen :: Bool,
    profit :: Maybe Double
} deriving (Show)

-- Based on coinbase tick info from https://docs.pro.coinbase.com/#get-product-ticker
data Tick = Tick {
    tickId :: Int,
    tickPrice :: Double,
    size :: Double,
    bid :: Double,
    ask :: Double,
    volume :: Double,
    time :: String -- todo: look into making this some ISO 8601 timestamp object
} deriving (Show)