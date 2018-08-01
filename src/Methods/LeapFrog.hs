module Methods.LeapFrog where


import           Vector.D3Vector

leapfrogVelocity :: V3 -> V3 -> Float -> V3
leapfrogVelocity (V3 vx1 vy1 vz1) (V3 ax1 ay1 az1) n =
  let newVelocity =  V3 vx1 vy1 vz1 +! (n *! V3 ax1 ay1 az1)
  in newVelocity

leapfrogPosition :: V3 -> V3 -> V3 -> Float -> V3
leapfrogPosition (V3 px1 py1 pz1) (V3 nvx1 nvy1 nvz1) (V3 oax1 oay1 oaz1) n =
  let newPosition = V3 px1 py1 pz1 +! ((n *! V3 nvx1 nvy1 nvz1) +! (((n^2)/2) *! V3 oax1 oay1 oaz1))
  in newPosition
