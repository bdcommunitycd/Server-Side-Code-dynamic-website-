module Paths_projectomatic (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/cmps112/.cabal/bin"
libdir     = "/home/cmps112/.cabal/lib/projectomatic-0.1/ghc-7.6.3"
datadir    = "/home/cmps112/.cabal/share/projectomatic-0.1"
libexecdir = "/home/cmps112/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "projectomatic_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "projectomatic_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "projectomatic_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "projectomatic_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
