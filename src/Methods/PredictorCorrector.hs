module Methods.PredictorCorrector where

import           Vector.D3Vector


predictorVelocity :: V3 -> V3 -> Float -> V3
predictorVelocity V3{x = ax1 ,y = ay1 , z = az1} V3{x = jx1 ,y = jy1 , z = jz1}  n =
  let predictedVelocity = v3Add (v3ScalerMultiply n V3{x = ax1 ,y = ay1 , z = az1}) (v3ScalerMultiply (n^2/2) V3{x = jx1 ,y = jy1 , z = jz1} )
  in predictedVelocity

predictorPosition :: V3 -> V3 -> V3 -> V3 -> Float -> V3
predictorPosition V3{x = px1 ,y = py1 , z = pz1} V3{x = vx1 ,y = vy1 , z = vz1} V3{x = ax1 ,y = ay1 , z = az1} V3{x = jx1 ,y = jy1 , z = jz1} n =
  let predictedPosition = v3Add (v3Add V3{x = px1 ,y = py1 , z = pz1} (v3ScalerMultiply n V3{x = vx1 ,y = vy1 , z = vz1})) (v3Add (v3ScalerMultiply (n^2/2) V3{x = ax1 ,y = ay1 , z = az1} ) (v3ScalerMultiply (n^3/6) V3{x = jx1 ,y = jy1 , z = jz1} ))
  in predictedPosition

correctorVelocity :: V3 -> V3 -> V3 -> V3 -> V3 -> Float -> V3
correctorVelocity V3{x = vx1 ,y = vy1 , z = vz1} V3{x = ax1 ,y = ay1 , z = az1} V3{x = pax1 ,y = pay1 , z = paz1} V3{x = jx1 ,y = jy1 , z = jz1} V3{x = pjx1 ,y = pjy1 , z = pjz1} n =
  let correctedVelocity = v3Add (v3Add V3{x = vx1 ,y = vy1 , z = vz1} (v3ScalerMultiply (n/2) (v3Add V3{x = ax1 ,y = ay1 , z = az1} V3{x = pax1 ,y = pay1 , z = paz1} ))) (v3ScalerMultiply (n^2/12) (v3Sub V3{x = jx1 ,y = jy1 , z = jz1} V3{x = pjx1 ,y = pjy1 , z = pjz1}))
  in correctedVelocity

correctorPosition :: V3 -> V3 -> V3 -> V3 -> V3 -> Float -> V3
correctorPosition V3{x = px1 ,y = py1 , z = pz1} V3{x = vx1 ,y = vy1 , z = vz1} V3{x = nvx1 ,y = nvy1 , z = nvz1} V3{x = ax1 ,y = ay1 , z = az1} V3{x = pax1 ,y = pay1 , z = paz1} n =
  let correctedPosition = v3Add (v3Add V3{x = px1 ,y = py1 , z = pz1} (v3ScalerMultiply (n/2) (v3Add V3{x = vx1 ,y = vy1 , z = vz1} V3{x = nvx1 ,y = nvy1 , z = nvz1} ))) (v3ScalerMultiply (n^2/12) (v3Sub V3{x = ax1 ,y = ay1 , z = az1} V3{x = pax1 ,y = pay1 , z = paz1}))
  in correctedPosition
