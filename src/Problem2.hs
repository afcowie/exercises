{-# LANGUAGE OverloadedStrings #-}

module Problem2 where

import Control.Monad (forM_)
import Core.Program
import Core.System (liftIO)
import System.Directory (listDirectory, doesDirectoryExist)

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