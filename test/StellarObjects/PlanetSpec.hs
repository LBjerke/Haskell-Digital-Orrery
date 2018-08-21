module StellarObjects.PlanetSpec where

import           StellarObjects.Planet
import           Test.Hspec
import           Vector.D3Vector

spec = do
  describe "Show Planet" $ do
    let testPlanet = showPlanet (Planet "test" (V3 1 1 1) (V3 1 1 1) 1000)
    it "show Planet" $
      testPlanet `shouldBe`
      "name: test, x position: 1.0, y position: 1.0, z position: 1.0, x velocity: 1.0, y velocity: 1.0, z velocity: 1.0, Mass: 1000.0"
