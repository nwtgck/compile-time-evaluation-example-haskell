{-# LANGUAGE TemplateHaskell #-}

module Main where

import Data.Maybe
import Settings
import Language.Haskell.TH.Syntax (lift)


main :: IO ()
main = do
    -- (from: https://www.reddit.com/r/haskell/comments/7yvb43/ghc_compiletime_evaluation/)
    let p = $(lift (fromJust (lookup "http.port" settings)) )

    -- (Try to recomment out the following which should be a compile error!)
    -- let p = $(lift (fromJust (lookup "http.part" settings)) )

    print p