module CalculationSpec where

import           Calculations.Common
import           Test.Hspec
import           Vector.D3Vector
spec = do
  describe "Calculate acceleration vector" $ do
    let xs = getAccelerations V3{ x = 1,y = 1,z = 1} V3{ x= 1,y = 2,z = 3} [2.0,2.0]
    it "Acceleration vector x1 value" $ (x (xs!!0)) `shouldBe` 0.0
    it "Acceleration vector x2 value" $ (x (xs !! 1)) `shouldBe` 0.0
    it "Acceleration vector y1 value" $ (y (xs!!0)) `shouldBe`  1.1931658727938876 * 10 ^^(-11)
    it "Acceleration vector y2 value" $ (y (xs !! 1)) `shouldBe` (-1.1931659) * 10 ^^(-11)
    it "Acceleration vector z1 value" $ (z (xs!!0)) `shouldBe` 2.3863318 * 10 ^^(-11)
    it "Acceleration vector z2 value" $ (z (xs !! 1)) `shouldBe` (-2.3863318) * 10 ^^(-11)

  describe "Gravity" $ do
    it "Gravitation Constant value" $ gravity `shouldBe` (6.67 * 10 ^^(-11))

  describe "Jerk" $ do
    let xs = getJerks V3{ x = 1,y = 1,z = 1} V3{ x= 1,y = 2,z = 3} V3{ x = 10000000,y = 100,z = 10} V3{ x= 1000000,y = 200,z = 30} [1000.0,2000.0]
    it "Jerk vector x1 value" $ (x (xs!!0)) `shouldBe`  0.29829144
    it "Jerk vector x2 value" $ (x (xs !! 1)) `shouldBe` 2.9829144 * 10^^(-2)
    it "Jerk vector y1 value" $ (y (xs!!0)) `shouldBe`  ( 8.3521604) * 10^^(-7)
    it "Jerk vector y2 value" $ (y (xs !! 1)) `shouldBe` ( 1.3124824)* 10^^(-6)
    it "Jerk vector z1 value" $ (z (xs!!0)) `shouldBe` (-3.9971055) * 10^^(-6)
    it "Jerk vector z2 value" $ (z (xs !! 1)) `shouldBe` (-8.411819)*10^^(-6)
