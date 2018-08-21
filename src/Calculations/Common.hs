{-# LANGUAGE ScopedTypeVariables #-}

module Calculations.Common where

import           Vector.D3Vector

gravity :: Float
gravity = 6.67 * 10 ^^ (-11)

getAccelerations :: V3 -> V3 -> [Float] -> [V3]
getAccelerations (V3 x1 y1 z1) (V3 x2 y2 z2) [m1, m2] =
  let rVectorOne = V3 x2 y2 z2 -! V3 x1 y1 z1
      accelerationOne = ((m2 * gravity) / norm rVectorOne ^ 3) *! rVectorOne
      rVectorTwo = V3 x1 y1 z1 -! V3 x2 y2 z2
      accelerationTwo = ((m1 * gravity) / norm rVectorTwo ^ 3) *! rVectorTwo
      accelerations = [accelerationOne, accelerationTwo]
   in accelerations

getJerks :: V3 -> V3 -> V3 -> V3 -> [Float] -> [V3]
getJerks (V3 px1 py1 pz1) (V3 px2 py2 pz2) (V3 vx1 vy1 vz1) (V3 vx2 vy2 vz2) [m1, m2] =
  let rVectorOne = V3 px2 py2 pz2 -! V3 px1 py1 pz1
      jerkOneFinal =
        ((gravity * m1) / norm rVectorOne) *!
        (V3 vx1 vy1 vz1 -!
         (((3 / norm rVectorOne ^ 2) * (rVectorOne .! V3 vx1 vy1 vz1)) *!
          rVectorOne))
      rVectorTwo = V3 px1 py1 pz1 -! V3 px2 py2 pz2
      jerkTwoFinal =
        ((gravity * m1) / norm rVectorTwo) *!
        (V3 vx2 vy2 vz2 -!
         (((3 / norm rVectorTwo ^ 2) * (rVectorTwo .! V3 vx2 vy2 vz2)) *!
          rVectorTwo))
      jerkFinal = [jerkOneFinal, jerkTwoFinal]
   in jerkFinal
