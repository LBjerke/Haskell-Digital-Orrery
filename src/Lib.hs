module Lib
    ( main
    ) where

import           Vector.D3Vector

main :: IO ()
main = do
  let vz = v3Add V3{ x = 1,y = 1,z = 1} V3{ x= 1,y = 2,z = 3}
  putStrLn ("add "<> show(vz) )
  let yz = v3Sub V3{ x = 1,y = 1,z = 1} V3{ x= 1,y = 2,z = 3}
  putStrLn ("sub "<> show(yz) )
  let xz = v3Norm V3{ x = 1,y = 1,z = 1}
  putStrLn ("norm "<> show(xz) )
  let a = v3Dot V3{ x = 1,y = 1,z = 1} V3{ x= 1,y = 2,z = 3}
  putStrLn ("Dot product " <> show(a))
