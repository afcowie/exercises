{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Main where

import Control.Monad (forM_)
import Core.Program
import Core.System
import System.Directory (listDirectory)

import Problem2 (program2)

main :: IO ()
main = execute program2

program0 :: Program None ()
program0 = do
    write "Hello World"

program1 :: Program None ()
program1 = do
    files <- liftIO (listDirectory ".")
    forM_ files $ \file -> do
        writeS file
