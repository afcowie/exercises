{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Main where

import Core.Program

import Problem1 (program1)
import Problem2 (program2)
import Problem3 (program3)

main :: IO ()
main = execute program3

program0 :: Program None ()
program0 = do
    write "Hello World"
