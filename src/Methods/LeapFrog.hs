module Methods.LeapFrog where


import           Vector.D3Vector

leapfrogVelocity :: V3 -> V3 -> Float -> V3
leapfrogVelocity V3{x = vx1 ,y = vy1 , z = vz1} V3{x = ax1 ,y = ay1 , z = az1} n =
  let newVelocity = v3Add V3{x = vx1 ,y = vy1 , z = vz1} (v3ScalerMultiply n V3{x = ax1 ,y = ay1 , z = az1})
  in newVelocity

leapfrogPosition :: V3 -> V3 -> V3 -> Float -> V3
leapfrogPosition V3{x = px1 ,y = py1 , z = pz1} V3{x = nvx1 ,y = nvy1 , z = nvz1} V3{x = oax1 ,y = oay1 , z = oaz1} n =
  let newPosition = v3Add V3{x = px1 ,y = py1 , z = pz1} (v3Add (v3ScalerMultiply n V3{x = nvx1 ,y = nvy1 , z = nvz1}) (v3ScalerMultiply ((n^2)/2) V3{x = oax1 ,y = oay1 , z = oaz1} ))
  in newPosition
