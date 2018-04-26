module Main where

import System.Environment
import System.Exit

main :: IO ()
main = getArgs >>= parse >>= putStr . tac

tac :: String -> String
tac = unlines . reverse . lines

parse :: [String] -> IO String
parse ("help":_) = usage >> exit
parse ("version":_) = version >> exit
parse [] = getContents
parse fs = concat `fmap` mapM readFile fs

usage :: IO ()
usage = putStrLn "Usage: tac: [help|version] [file ..]"

version :: IO ()
version = putStrLn "tac 0.1"

exit :: IO a
exit = exitWith ExitSuccess

die :: IO a
die = exitWith (ExitFailure 1)
