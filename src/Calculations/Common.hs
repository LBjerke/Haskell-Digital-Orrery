{-# LANGUAGE ScopedTypeVariables #-}
module Calculations.Common where



import           Vector.D3Vector
gravity :: Float
gravity = 6.67 * 10 ^^(-11)



getAccelerations :: V3 -> V3 -> [Float] -> [V3]
getAccelerations V3{x = x1, y = y1 , z = z1} V3{x = x2 , y = y2 , z = z2} [m1,m2] =
  let
    rVectorOne = V3{x = x2 , y = y2 , z = z2} -! V3{x = x1, y = y1 , z = z1}
    scalerAccelerationOne = ((m2 * gravity) / (norm rVectorOne)^3)
    accelerationOne = scalerAccelerationOne *! rVectorOne
    rVectorTwo = V3{x = x1, y = y1 , z = z1} -! V3{x = x2 , y = y2 , z = z2}
    scalerAccelerationTwo = ((m1 * gravity) / (norm rVectorTwo)^3)
    accelerationTwo = scalerAccelerationTwo *! rVectorTwo
    accelerations = [accelerationOne,accelerationTwo]
  in accelerations

getJerks:: V3 -> V3 -> V3 -> V3-> [Float] -> [V3]
getJerks V3{x = px1, y = py1 , z = pz1} V3{x = px2 , y = py2 , z = pz2} V3{x = vx1, y = vy1 , z = vz1} V3{x = vx2 , y = vy2 , z = vz2} [m1,m2] =
  let
    velocityOne = V3{x = vx1, y = vy1 , z = vz1}
    rVectorOne = V3{x = px2 , y = py2 , z = pz2} -! V3{x = px1, y = py1 , z = pz1}
    jerkOnepartOne = (gravity * m1) /norm rVectorOne
    jerkOnepartOnea = rVectorOne .! velocityOne
    jerkOnepartTwoa = ((3/norm rVectorOne^2) * jerkOnepartOnea) *! rVectorOne
    jerkOnepartTwob = velocityOne -! jerkOnepartTwoa
    jerkOneFinal = jerkOnepartOne *! jerkOnepartTwob
    velocityTwo = V3{x = vx2 , y = vy2 , z = vz2}
    rVectorTwo = V3{x = px1, y = py1 , z = pz1} -! V3{x = px2 , y = py2 , z = pz2}
    jerkTwopartOne =( gravity * m1) /norm rVectorTwo
    jerkTwopartOnea = rVectorTwo .! velocityTwo
    jerkTwopartTwoa = ((3/norm rVectorTwo^2) * jerkTwopartOnea) *! rVectorTwo
    jerkTwopartTwob = velocityTwo -! jerkTwopartTwoa
    jerkTwoFinal = jerkTwopartOne *! jerkTwopartTwob
    jerkFinal = [jerkOneFinal,jerkTwoFinal]
  in jerkFinal
