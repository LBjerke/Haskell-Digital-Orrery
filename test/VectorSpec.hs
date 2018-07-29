module VectorSpec where

import           Test.Hspec
import           Vector.Vector

spec = do
  describe "Vector add tests" $ do
    let vz = v3Add V3{ x = 1,y = 1,z = 1} V3{ x= 1,y = 2,z = 3}
    it "adds two vectors x value" $ (x vz) `shouldBe` 2
    it "adds two vectors y value" $ (y vz) `shouldBe` 3
    it "adds two vectors z value" $ (z vz) `shouldBe` 4

  describe "Vector subtract test" $ do
    let yz = v3Sub V3{ x = 1,y = 1,z = 1} V3{ x= 1,y = 2,z = 3}
    it "subtract two vectors x value" $ (x yz) `shouldBe` 0
    it "subtract two vectors y value" $ (y yz) `shouldBe` -1
    it "subtract two vectors z value" $ (z yz) `shouldBe` -2

  describe "Norm of a vector" $ do
    let a = v3Norm V3{ x = 1 , y = 1 , z = 1}
    it "norm of a vector" $ a `shouldBe` sqrt(3)

  describe "Vector Dot product" $ do
    let a = v3Dot V3{ x = 1,y = 1,z = 1} V3{ x= 1,y = 2,z = 3}
    it "Vector Dot product" $ a `shouldBe` 6

  describe "Scaler Multiply" $ do
    let a = v3ScalerMultiply 6 V3{ x= 1,y = 2,z = 3}
    it "Scaler Multiply x value" $ (x a) `shouldBe` 6
    it "Scaler Multiply y value" $ (y a) `shouldBe` 12
    it "Scaler Multiply z value" $ (z a) `shouldBe` 18
