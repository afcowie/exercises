{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Main where

import Control.Monad (forM_)
import Core.Program
import Core.System
import System.Directory (listDirectory, doesDirectoryExist)

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

program2 :: Program None ()
program2 = descend "."
  where
    descend start = do
        -- list the files in the given directory
        files <- liftIO (listDirectory start)

        -- loop over each file. If it is a directory, descend recursively.
        -- Otherwise, print the path.
        forM_ files $ \file -> do
            let path = start ++ "/" ++ file
            probe <- liftIO (doesDirectoryExist path)
            if probe
                then descend path
                else writeS path

