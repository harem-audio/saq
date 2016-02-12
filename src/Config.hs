{-# LANGUAGE OverloadedStrings #-}

module Config (SaqTarget, loadConfig) where

import Control.Monad (liftM)
import Data.Text (unpack)

import Data.Configurator (autoReload, autoConfig, lookupDefault, Worth(..))
import Data.Configurator.Types (Configured(..), Value(..))

data SaqTarget = HOST
               | ARM_MCU String

instance Configured SaqTarget where
  convert (String "host") = Just HOST
  convert (String x) = Just (ARM_MCU (unpack x))
  convert _ = Nothing

data SaqDirList = DirList [String]

instance Configured SaqDirList where
  convert (String x) = Just (DirList [unpack x])
  convert (List x) = Just (DirList (fmap (\y -> case y of
                                             String z -> unpack z
                                             _ -> "")
                                    x) )
  convert _ = Nothing

loadConfig :: IO (SaqTarget, [String], [String])
loadConfig = do
  conf <- liftM fst (autoReload autoConfig [Optional ".saq"])
  conf_target <- lookupDefault (ARM_MCU "m4") conf "host"
  DirList conf_include <- lookupDefault (DirList ["include"]) conf "include"
  DirList conf_src <- lookupDefault (DirList ["src"]) conf "src"
  return (conf_target, conf_include, conf_src)
