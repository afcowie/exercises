{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Problem3 where

import Control.Monad (foldM)
import Core.Program
import Core.System (liftIO)
import System.Directory (listDirectory, doesDirectoryExist, getFileSize)


program3 :: Program None ()
program3 = do
    size <- calculateDirectory 0 "."
    writeS size


calculateDirectory :: Integer -> FilePath -> Program None Integer
calculateDirectory previous dirname = do
    -- list the files in the given directory
    files <- liftIO (listDirectory dirname)

    -- fold over the list of files and accumulate the sizes.
    foldM countFileSize previous files

  where

    -- Get the size of the given file path. If it is a directory, loop back
    -- around and descend recursively.
    countFileSize :: Integer -> FilePath -> Program None Integer
    countFileSize accumulated file = do
        let path = dirname ++ "/" ++ file 
        debugS "path" path
        probe <- liftIO (doesDirectoryExist path)
        if probe
            then do
                calculateDirectory accumulated path
            else do
                size <- liftIO (getFileSize path)
                return (accumulated + size)
