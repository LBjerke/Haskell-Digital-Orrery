module Methods.EulerSpec where

import           Methods.Euler
import           Test.Hspec
import           Vector.D3Vector

spec = do
   describe "Euler Velocity" $ do
      let velocity = eulerVelocity (V3 10 10 10) (V3 10 10 10) 0.25
      it "Euler Velocity vector x value" $  x velocity `shouldBe` 12.5
      it "Euler Velocity vector y value" $  y velocity `shouldBe` 12.5
      it "Euler Velocity vector z value" $  z velocity `shouldBe` 12.5

   describe "Euler Position" $ do
      let position = eulerPosition (V3 10 10 10) (V3 10 10 10) (V3 10 10 10) 0.25
      it "Euler Position vector x value" $ x position `shouldBe` 12.5
      it "Euler Position vector y value" $ y position `shouldBe` 12.5
      it "Euler Position vector z value" $ z position `shouldBe` 12.5
