# Digital-Orrery

1 Introduction
The most common way to model the solar system is to use Kepler’s equations, which produces the orbits that we all know and love, but the problem with these orbits is that they are not accurate enough, do not account for small changes in the center of mass of an object, nor can they accurately predict the orbits of planets with moons or the moons themselves. The purpose of this project is to use numerical techniques to make a more accurate model of the solar system, called an orrery. There are two numerical methods that we use in this paper to model the solar system. The first method is the Leapfrog method, which uses half time steps to better approximate the path of an orbiting object and reduce the propagation of error. The second method is the Predictor-Corrector method, which like the Leapfrog method, also limits the amount of error propagation. It is more accurate, but takes longer to compute .

TODO: Create the full leapfrog, euler, and predictor-corrector methods out of base modules
TODO: Create Request class
TODO: Implement endpoints using scotty
TODO: Implement Postgres database

