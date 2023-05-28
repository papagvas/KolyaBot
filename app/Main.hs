module Main where

import           Calamity
import           Calamity.Cache.InMemory
import           Calamity.Commands
import           Calamity.Commands.Context (useFullContext)
import           Calamity.Metrics.Noop
import           Control.Lens
import           Control.Monad
import           Data.Default
import           Data.Generics.Labels      ()
import           Data.Maybe
import           Data.Text                 (Text)
import qualified Data.Text                 as T
import qualified Di
import           DiPolysemy
import qualified Polysemy                  as P

main :: IO ()
main = Di.new $ \di ->
  void
  . P.runFinal
  . P.embedToFinal @IO
  . runDiToIO di
  . runCacheInMemory
  . runMetricsNoop
  . useFullContext
  . useConstantPrefix "!"
  . runBotIO (BotToken "<token>") defaultIntents
  $ do
    info @Text "Setting up commands and handlers..."
