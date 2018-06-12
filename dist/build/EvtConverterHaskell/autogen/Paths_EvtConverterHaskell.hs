{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_EvtConverterHaskell (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/onurcanbektas/.cabal/bin"
libdir     = "/home/onurcanbektas/.cabal/lib/x86_64-linux-ghc-8.2.2/EvtConverterHaskell-0.1.0.0-718qAdeOKXqEWx0By4MIY7-EvtConverterHaskell"
dynlibdir  = "/home/onurcanbektas/.cabal/lib/x86_64-linux-ghc-8.2.2"
datadir    = "/home/onurcanbektas/.cabal/share/x86_64-linux-ghc-8.2.2/EvtConverterHaskell-0.1.0.0"
libexecdir = "/home/onurcanbektas/.cabal/libexec/x86_64-linux-ghc-8.2.2/EvtConverterHaskell-0.1.0.0"
sysconfdir = "/home/onurcanbektas/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "EvtConverterHaskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "EvtConverterHaskell_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "EvtConverterHaskell_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "EvtConverterHaskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "EvtConverterHaskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "EvtConverterHaskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
