{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Main where

import Control.Monad (forM_)
import Core.Program
import Core.System
import System.Directory (listDirectory)

import Problem1 (program1)
import Problem2 (program2)

main :: IO ()
main = execute program2

program0 :: Program None ()
program0 = do
    write "Hello World"
