-- |
-- Module      : Database.Relational.Query.Monad.Restrict
-- Copyright   : 2013 Kei Hibino
-- License     : BSD3
--
-- Maintainer  : ex8k.hibino@gmail.com
-- Stability   : experimental
-- Portability : unknown
--
-- This module contains definitions about simple restrict context monad type.
module Database.Relational.Query.Monad.Restrict (
  -- * Monad to restrict target records.
  Restrict,

  -- restricted,
  expandWhere
  ) where

import Data.Functor.Identity (Identity (..), runIdentity)

import Database.Relational.Query.Monad.Trans.Restricting
  (Restrictings, WherePrepend, extractWheres)


-- | Restrict only monad type used from update statement and delete statement.
type Restrict = Restrictings Identity

-- -- | 'return' of 'Restrict'
-- restricted :: a -> Restrict a
-- restricted =  restrict . Identity

-- | Run 'Restrict' to get SQL WHERE clause.
expandWhere :: Restrict a -> (a, WherePrepend)
expandWhere =  runIdentity . extractWheres