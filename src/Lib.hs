module Lib
    ( main
    ) where

import           Vector.D3Vector


main :: IO ()
main = do
  let vz = V3{ x = 1,y = 1,z = 1} +! V3{ x= 1,y = 2,z = 3}
  putStrLn ("add "<> show vz )
  let yz = V3{ x = 1,y = 1,z = 1} -! V3{ x= 1,y = 2,z = 3}
  putStrLn ("sub "<> show yz )
  let xz = norm V3{ x = 1,y = 1,z = 1}
  putStrLn ("norm "<> show xz )
  let a = V3{ x = 1,y = 1,z = 1} .! V3{ x= 1,y = 2,z = 3}
  putStrLn ("Dot product " <> show a)
