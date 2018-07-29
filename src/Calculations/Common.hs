{-# LANGUAGE ScopedTypeVariables #-}
module Calculations.Common where



import           Vector.D3Vector
gravity :: Float
gravity = (6.67 * 10 ^^(-11))



getAccelerations :: V3 -> V3 -> [Float] -> [V3]
getAccelerations V3{x = x1, y = y1 , z = z1} V3{x = x2 , y = y2 , z = z2} [m1,m2] =
  let
    rVectorOne = v3Sub V3{x = x2 , y = y2 , z = z2} V3{x = x1, y = y1 , z = z1}
    scalerAccelerationOne = ((m2 * gravity) / ((v3Norm rVectorOne) * (v3Norm rVectorOne) * (v3Norm rVectorOne)))
    accelerationOne = v3ScalerMultiply scalerAccelerationOne rVectorOne
    rVectorTwo = v3Sub V3{x = x1, y = y1 , z = z1} V3{x = x2 , y = y2 , z = z2}
    scalerAccelerationTwo = ((m1 * gravity) / ((v3Norm rVectorTwo) * (v3Norm rVectorTwo) * (v3Norm rVectorTwo)))
    accelerationTwo = v3ScalerMultiply scalerAccelerationTwo rVectorTwo
    accelerations = [accelerationOne,accelerationTwo]
  in accelerations

getJerks:: V3 -> V3 -> V3 -> V3-> [Float] -> [V3]
getJerks V3{x = px1, y = py1 , z = pz1} V3{x = px2 , y = py2 , z = pz2} V3{x = vx1, y = vy1 , z = vz1} V3{x = vx2 , y = vy2 , z = vz2} [m1,m2] =
  let
    velocityOne = V3{x = vx1, y = vy1 , z = vz1}
    rVectorOne = v3Sub V3{x = px2 , y = py2 , z = pz2} V3{x = px1, y = py1 , z = pz1}
    jerkOnepartOne =(( gravity * m1) /( (v3Norm rVectorOne) ))
    jerkOnepartOnea = v3Dot rVectorOne velocityOne
    jerkOnepartTwoa = v3ScalerMultiply ((3/(v3Norm rVectorOne)^(2)) * jerkOnepartOnea) rVectorOne
    jerkOnepartTwob = v3Sub velocityOne  jerkOnepartTwoa
    jerkOneFinal = v3ScalerMultiply jerkOnepartOne  jerkOnepartTwob
    velocityTwo = V3{x = vx2 , y = vy2 , z = vz2}
    rVectorTwo = v3Sub V3{x = px1, y = py1 , z = pz1} V3{x = px2 , y = py2 , z = pz2}
    jerkTwopartOne =(( gravity * m1) /( (v3Norm rVectorTwo) ))
    jerkTwopartOnea = v3Dot rVectorTwo velocityTwo
    jerkTwopartTwoa = v3ScalerMultiply ((3/(v3Norm rVectorTwo)^(2)) * jerkTwopartOnea) rVectorTwo
    jerkTwopartTwob = v3Sub velocityTwo  jerkTwopartTwoa
    jerkTwoFinal = v3ScalerMultiply jerkTwopartOne  jerkTwopartTwob
    jerkFinal = [jerkOneFinal,jerkTwoFinal]
  in jerkFinal
