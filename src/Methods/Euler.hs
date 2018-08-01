module Methods.Euler where

import           Vector.D3Vector


eulerVelocity :: V3 -> V3 -> Float -> V3
eulerVelocity (V3 vx1 vy1 vz1) (V3 ax1 ay1 az1) n =
  let newVelocity = V3 vx1 vy1 vz1 +! (n *! V3 ax1 ay1 az1)
  in newVelocity

eulerPosition :: V3 -> V3 -> V3 -> Float -> V3
eulerPosition (V3 px1 py1 pz1) (V3 nvx1 nvy1 nvz1) (V3 ovx1 ovy1 ovz1) n =
  let newPosition = V3 px1 py1 pz1 +! ((n/2) *! (V3 nvx1 nvy1 nvz1 +! V3 ovx1 ovy1 ovz1))
  in newPosition
