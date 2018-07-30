module Methods.PredictorCorrectorSpec where

import           Methods.PredictorCorrector
import           Test.Hspec
import           Vector.D3Vector

spec =do
  describe "Predicted Velocity" $ do
    let pVelocity = predictorVelocity  V3{x = 10 ,y = 10 , z = 10} V3{x = 10 ,y = 10 , z = 10} 0.25
    it "Predicted Velocity x value" $ x pVelocity `shouldBe` 2.8125
    it "Predicted Velocity y value" $ y pVelocity `shouldBe` 2.8125
    it "Predicted Velocity z value" $ z pVelocity `shouldBe` 2.8125

  describe "Predicted Position" $ do
    let pPosition = predictorPosition  V3{x = 10 ,y = 10 , z = 10} V3{x = 10 ,y = 10 , z = 10} V3{x = 10 ,y = 10 , z = 10} V3{x = 10 ,y = 10 , z = 10} 0.25
    it "Predicted Position x value" $ x pPosition `shouldBe` 12.838542
    it "Predicted Position y value" $ y pPosition `shouldBe` 12.838542
    it "Predicted Position z value" $ z pPosition `shouldBe` 12.838542

  describe "Corrected Velocity" $ do
    let cVelocity = correctorVelocity V3{x = 10 ,y = 10 , z = 10} V3{x = 10 ,y = 10 , z = 10} V3{x = 10 ,y = 10 , z = 10} V3{x = 10 ,y = 10 , z = 10} V3{x = 12 ,y = 12 , z = 12} 0.25
    it "Corrected Velocity x value" $ x cVelocity `shouldBe` 12.489583
    it "Corrected Velocity y value" $ y cVelocity `shouldBe` 12.489583
    it "Corrected Velocity z value" $ z cVelocity `shouldBe` 12.489583

  describe "Corrected Position" $ do
    let cPosition = correctorPosition V3{x = 10 ,y = 10 , z = 10} V3{x = 10 ,y = 10 , z = 10} V3{x = 10 ,y = 10 , z = 10} V3{x = 10 ,y = 10 , z = 10} V3{x = 12 ,y = 12 , z = 12} 0.25
    it "Corrected Position x value" $ x cPosition `shouldBe` 12.489583
    it "Corrected Position y value" $ y cPosition `shouldBe` 12.489583
    it "Corrected Position z value" $ z cPosition `shouldBe` 12.489583
