module Methods.LeapFrogSpec where

import           Methods.LeapFrog
import           Test.Hspec
import           Vector.D3Vector

spec = do
  describe "LeapFrog Velocity" $ do
    let velocity = leapfrogVelocity (V3 10 10 10) (V3 10 10 10) 0.25
    it "LeapFrog Velocity x value" $ x velocity `shouldBe` 12.5
    it "LeapFrog Velocity y value" $ y velocity `shouldBe` 12.5
    it "LeapFrog Velocity z value" $ z velocity `shouldBe` 12.5
