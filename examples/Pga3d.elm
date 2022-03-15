module Pga3d exposing (..)

import Html
import Ganja.Pga3d exposing (..)


-- A rotor (Euclidean line) and translator (Ideal line)
rotor : Float -> Pga3d -> Pga3d
rotor angle line=
    sadd (cos (angle / 2.0)) (smul (sin (angle / 2.0)) (normalized line))


translator : Float -> Pga3d -> Pga3d
translator dist line =
    add (unitScalar) (smul (dist / 2.0) line)


-- PGA is plane based. Vectors are planes. (think linear functionals)
-- A plane is defined using its homogenous equation ax + by + cz + d = 0
plane : Float -> Float -> Float -> Float -> Pga3d
plane a b c d =
    Pga3d 0 d a b c 0 0 0 0 0 0 0 0 0 0 0


-- Trivectors are homogeneous points, euclidean coordinates plus the origin
point : Float -> Float -> Float -> Pga3d
point x y z =
    Pga3d 0 0 0 0 0 0 0 0 0 0 0 z y x 1 0


--  for our toy problem (generate points on the surface of a torus)
-- we start with a function that generates motors.
-- circle(t) with t going from 0 to 1.
circle : Float -> Float -> Pga3d -> Pga3d
circle t radius line =
    mul (rotor (t * pi * 2.0) line) (translator radius (mul e1 e0))


-- a torus is now the product of two circles.
torus : Float -> Float -> Float -> Pga3d -> Float -> Pga3d -> Pga3d
torus s t r1 l1 r2 l2 =
    mul (circle s r2 l2) (circle t r1 l1)


myTorus : Float -> Float -> Pga3d
myTorus s t = 
    torus s t 0.25 (mul e1 e2) 0.6 (mul e1 e3)


-- sandwich
sw : Pga3d -> Pga3d -> Pga3d
sw a b =
    mul (mul a b) (reverse a)


-- sample the torus points by sandwich with the origin
pointOnTorus : Float -> Float -> Pga3d
pointOnTorus s t =
    sw (myTorus s t) e123


-- Elements of the even subalgebra (scalar + bivector + pss) of unit length are motors
myRotor : Pga3d
myRotor =
    rotor (pi / 2.0) (mul e1 e2)


-- The outer product ^ is the MEET. Here we intersect the yz (x=0) and xz (y=0) planes.
axisZ : Pga3d
axisZ =
    -- x=0, y=0 -> z-axis line
    wedge e1 e2


-- Line and plane meet in point. We intersect the line along the z-axis (x=0,y=0) with the xy (z=0) plane.
origin : Pga3d
origin =
    -- x=0, y=0, z=0 -> origin
    wedge axisZ e3


-- We can also easily create points 
myPoint : Pga3d
myPoint =
    point 1 0 0
    

-- and join them into a line using the regressive (vee, &) product.
myLine : Pga3d
myLine =
    -- vee = regressive product, JOIN, here, x-axis line.
    vee origin myPoint             


-- Lets also create the plane with equation 2x + z - 3 = 0
myPlane : Pga3d
myPlane =
    plane 2 0 1 -3


-- rotations work on all elements
rotatedLine : Pga3d
rotatedLine =
    sw myRotor myLine


rotatedPoint : Pga3d
rotatedPoint =
    sw myRotor myPoint


rotatedPlane : Pga3d
rotatedPlane =
    sw myRotor myPlane


-- See the 3D PGA Cheat sheet for a huge collection of useful formulas
pointOnPlane : Pga3d
pointOnPlane =
    mul (dot myPlane myPoint) myPlane


almostEqual : Pga3d -> Pga3d -> Bool
almostEqual a b =
    norm (sub a b) < 0.000001


testEqual : Pga3d -> Pga3d -> String
testEqual a b =
    if almostEqual a b then
        "OK"
    else
        "Expected: " ++ toString b ++ "; Actual: " ++ toString a

test : List String
test = 
    [ testEqual myPoint (add e032 e123)
    , testEqual myLine (set E23 -1 <| zero)
    , testEqual myPlane (set E0 -3 <| set E1 2 <| set E3 1 <| zero)
    , testEqual myRotor (set Scalar 0.7071068 <| set E12 0.7071068 <| zero)
    , testEqual rotatedLine e31
    , testEqual rotatedPoint (set E013 -1 <| set E123 1 <| zero)
    , testEqual rotatedPlane (set E0 -3 <| set E2 -2 <| set E3 1 <| zero)
    , testEqual (normalized pointOnPlane) (set E021 0.2 <| set E032 0.14 <| set E123 1 <| zero)
    , testEqual (pointOnTorus 0 0) (set E032 0.85 <| set E123 1 <| zero )
    ]


-- output some numbers.
testOutput : String
testOutput = 
    String.join ("\n")
        [ "a point       :" ++ toString myPoint
        , "a line        :" ++ toString myLine
        , "a plane       :" ++ toString myPlane
        , "a rotor       :" ++ toString myRotor
        , "rotated line  :" ++ toString rotatedLine
        , "rotated point :" ++ toString rotatedPoint
        , "rotated plane :" ++ toString rotatedPlane
        , "point on plane:" ++ toString (normalized pointOnPlane)
        , "point on torus:" ++ toString (pointOnTorus 0 0)
        , toString (subs e0 1)
        , toString (ssub 1 e0)
        ]


main : Html.Html msg
main = 
    Html.pre [] [ Html.text testOutput ]
