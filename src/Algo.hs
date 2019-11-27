module Algo (
    evaluateTick
) where

import Types

evaluateTick :: Algo -> [Tick] -> Maybe Order
evaluateTick algo ticks = algo ticks