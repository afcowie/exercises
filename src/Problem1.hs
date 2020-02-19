{-# LANGUAGE OverloadedStrings #-}

module Problem1 where

import Control.Monad (forM_)
import Core.Program
import Core.System (liftIO)
import System.Directory (listDirectory)

program1 :: Program None ()
program1 = do
    files <- liftIO (listDirectory ".")
    forM_ files $ \file -> do
        writeS file
