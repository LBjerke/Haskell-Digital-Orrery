module StellarObjects.Planet where

import           GHC.Generics
import           Vector.D3Vector

data Planet = Planet
  { name     :: String
  , position :: V3
  , velocity :: V3
  , mass     :: Float
  } deriving (Show, Generic)

showPlanet :: Planet -> String
showPlanet (Planet name (V3 px py pz) (V3 vx vy vz) mass) =
  "name: " <> name <> ", x position: " <> show px <> ", y position: " <>
   show py <>
   ", z position: " <>
   show pz <>
   ", x velocity: " <>
   show vx <>
   ", y velocity: " <>
   show vy <>
   ", z velocity: " <>
   show vz <>
   ", Mass: " <>
   show mass

planetMass :: Planet -> Float
planetMass (Planet name (V3 px py pz) (V3 vx vy vz) mass) = mass

planetPosition :: Planet -> V3
planetPosition (Planet name (V3 px py pz) (V3 vx vy vz) mass) = V3 px py pz

planetName :: Planet -> String
planetName (Planet name (V3 px py pz) (V3 vx vy vz) mass) = name

planetVelocity :: Planet -> V3
planetVelocity (Planet name (V3 px py pz) (V3 vx vy vz) mass) = V3 vx vy vz
