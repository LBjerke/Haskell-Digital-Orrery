module Methods.PredictorCorrector where

import           Vector.D3Vector

predictorVelocity :: V3 -> V3 -> Float -> V3
predictorVelocity (V3 ax1 ay1 az1) (V3 jx1 jy1 jz1) n =
  let predictedVelocity =
        (n *! V3 ax1 ay1 az1) +! ((n ^ 2 / 2) *! V3 jx1 jy1 jz1)
   in predictedVelocity

predictorPosition :: V3 -> V3 -> V3 -> V3 -> Float -> V3
predictorPosition (V3 px1 py1 pz1) (V3 vx1 vy1 vz1) (V3 ax1 ay1 az1) (V3 jx1 jy1 jz1) n =
  let predictedPosition =
        (V3 px1 py1 pz1 +! (n *! V3 vx1 vy1 vz1)) +!
        (((n ^ 2 / 2) *! V3 ax1 ay1 az1) +! ((n ^ 3 / 6) *! V3 jx1 jy1 jz1))
   in predictedPosition

correctorVelocity :: V3 -> V3 -> V3 -> V3 -> V3 -> Float -> V3
correctorVelocity (V3 vx1 vy1 vz1) (V3 ax1 ay1 az1) (V3 pax1 pay1 paz1) (V3 jx1 jy1 jz1) (V3 pjx1 pjy1 pjz1) n =
  let correctedVelocity =
        (V3 vx1 vy1 vz1 +! ((n / 2) *! (V3 ax1 ay1 az1 +! V3 pax1 pay1 paz1))) +!
        ((n ^ 2 / 12) *! (V3 jx1 jy1 jz1 -! V3 pjx1 pjy1 pjz1))
   in correctedVelocity

correctorPosition :: V3 -> V3 -> V3 -> V3 -> V3 -> Float -> V3
correctorPosition (V3 px1 py1 pz1) (V3 vx1 vy1 vz1) (V3 nvx1 nvy1 nvz1) (V3 ax1 ay1 az1) (V3 pax1 pay1 paz1) n =
  let correctedPosition =
        (V3 px1 py1 pz1 +! ((n / 2) *! (V3 vx1 vy1 vz1 +! V3 nvx1 nvy1 nvz1))) +!
        ((n ^ 2 / 12) *! (V3 ax1 ay1 az1 -! V3 pax1 pay1 paz1))
   in correctedPosition
