{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Main where

import Control.Monad (forM_)
import Core.Program
import Core.System
import System.Directory (listDirectory)

main :: IO ()
main = execute program1

program0 :: Program None ()
program0 = do
    write "Hello World"

program1 :: Program None ()
program1 = do
    files <- liftIO (listDirectory ".")
    forM_ files $ \file -> do
        writeS file
