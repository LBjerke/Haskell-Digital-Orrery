module StellarObjects.PlanetSpec where

import           StellarObjects.Planet
import           Test.Hspec
import           Vector.D3Vector

spec = do
  describe "Show planet" $ do
    let testPlanet = showPlanet (Planet "test" (V3 1 1 1) (V3 1 1 1) 1000)
    it "Show planet" $
      testPlanet `shouldBe`
      "name: test, x position: 1.0, y position: 1.0, z position: 1.0, x velocity: 1.0, y velocity: 1.0, z velocity: 1.0, Mass: 1000.0"
  describe "Show planet Mass" $ do
    let testPlanet = planetMass (Planet "test" (V3 1 1 1) (V3 1 1 1) 1000)
    it "Show Mass" $ testPlanet `shouldBe` 1000.0
  describe "Show planet Position" $ do
    let testPlanet = planetPosition (Planet "test" (V3 1 1 1) (V3 1 1 1) 1000)
    it "Show Planet x position" $ (x testPlanet) `shouldBe` 1
    it "Show Planet y position" $ (y testPlanet) `shouldBe` 1
    it "Show Planet z position" $ (z testPlanet) `shouldBe` 1
  describe "Show planet velocity" $ do
    let testPlanet = planetVelocity (Planet "test" (V3 1 1 1) (V3 1 1 1) 1000)
    it "Show planet x velocity" $ (x testPlanet) `shouldBe` 1
    it "Show planet y velocity" $ (y testPlanet) `shouldBe` 1
    it "Show planet z velocity" $ (z testPlanet) `shouldBe` 1
  describe "Show planet name" $ do
    let testPlanet = planetName (Planet "test" (V3 1 1 1) (V3 1 1 1) 1000)
    it "show planet name" $ testPlanet `shouldBe` "test"
