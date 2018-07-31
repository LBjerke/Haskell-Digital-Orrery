module Vector.D3Vector where

import           GHC.Generics


data V3 = V3 { x :: Float , y :: Float , z :: Float } deriving (Show, Generic)


(+!) :: V3 -> V3 -> V3
(+!) V3{ x = x1, y = y1 , z= z1} V3{ x = x2, y = y2, z = z2} = V3{ x = x1 + x2, y = y1 + y2, z = z1 + z2}

(-!) :: V3 -> V3 -> V3
(-!) V3{ x = x1 , y = y1 , z = z1} V3{ x = x2, y = y2, z = z2} = V3{x=x1-x2, y=y1-y2,z=z1-z2}

norm :: V3 -> Float
norm V3{x = x1 , y = y1 , z = z1} = sqrt( (x1 * x1) + (y1 * y1) + (z1*z1))

(.!) :: V3 -> V3 -> Float
(.!) V3{ x = x1 , y = y1 , z = z1} V3{ x = x2, y = y2, z = z2} = (x1*x2) + (y1*y2) + (z1*z2)

(*!) :: Float -> V3 -> V3
(*!) num V3{x= x1, y = y1 , z = z1} = V3{x = num*x1 , y = num*y1 , z = num * z1}
