module Lib
    ( main
    ) where

import           Vector.D3Vector


main :: IO ()
main = do
  let vz = V3 1 1 1 +! V3 1 2 3
  putStrLn ("add "<> show vz)
  let yz = V3 1 1 1 -! V3 1 2 3
  putStrLn ("sub "<> show yz )
  let xz = norm (V3 1 1 1)
  putStrLn ("norm "<> show xz )
  let a = V3 1 1 1 .! V3 1 2 3
  putStrLn ("Dot product " <> show a)
