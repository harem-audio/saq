{-# LANGUAGE OverloadedStrings #-}

module Main where

import Development.Shake
import Development.Shake.Language.C

import Config

main :: IO ()
main = do
  conf <- loadConfig
  return ()
