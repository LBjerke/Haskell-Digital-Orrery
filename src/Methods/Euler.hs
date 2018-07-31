module Methods.Euler where

import           Vector.D3Vector


eulerVelocity :: V3 -> V3 -> Float -> V3
eulerVelocity V3{x = vx1 ,y = vy1 , z = vz1} V3{x = ax1, y = ay1, z = az1} n =
  let newVelocity = V3{x = vx1 ,y = vy1 , z = vz1} +! ( n *! V3{x = ax1, y = ay1, z = az1})
  in newVelocity

eulerPosition :: V3 -> V3 -> V3 -> Float -> V3
eulerPosition V3{x = px1 ,y = py1 , z = pz1} V3{x = nvx1 ,y = nvy1 , z = nvz1} V3{x = ovx1 ,y = ovy1 , z = ovz1} n =
  let newPosition = V3{x = px1 ,y = py1 , z = pz1} +! ((n/2) *! ( V3{x = nvx1 ,y = nvy1 , z = nvz1} +! V3{x = ovx1 ,y = ovy1 , z = ovz1} ))
  in newPosition
