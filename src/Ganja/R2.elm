module Ganja.R2 exposing (R2Basis(..), basisList, basisCount, basisName, R2(..), zero, get, set, new, toString, fromList, toList, reverse, dual, conjugate, involute, mul, wedge, vee, dot, add, sub, smul, muls, sadd, adds, ssub, subs, norm, inorm, normalized, unitScalar, e1, e2, e12)
{-| Clifford Algebra: R2

Generated with ganja.js written by enki.

# Basis
@docs R2Basis, basisList, basisCount, basisName

# Multivector
@docs R2, zero, get, set, new

# Basis multivectors
@docs  unitScalar, e1, e2, e12

# Conversion
@docs toString, fromList, toList

# Unary Operators
@docs reverse, dual, conjugate, involute

# Binary Operators
@docs mul, wedge, vee, dot, add, sub, smul, muls, sadd, adds, ssub, subs

# Norm
@docs norm, inorm, normalized
-}

{-| Basis type -}
type R2Basis =
    Scalar
    | E1
    | E2
    | E12


{-| Basis list -}
basisList : List R2Basis
basisList = 
    [ Scalar, E1, E2, E12 ]


{-| Number of coefficients -}
basisCount : Int
basisCount = 
    4


{-| Basis name -}
basisName : R2Basis -> String
basisName basis =
    case basis of
        Scalar -> 
            "1"

        E1 -> 
            "e1"

        E2 -> 
            "e2"

        E12 -> 
            "e12"


{-| Multivector -}
type R2 =
    R2 Float Float Float Float


{-| Zero value -}
zero : R2
zero =
    R2 0 0 0 0


{-| Get coefficient -}
get : R2Basis -> R2 -> Float
get basis (R2 v0 v1 v2 v3) =
    case basis of
        Scalar -> 
            v0

        E1 -> 
            v1

        E2 -> 
            v2

        E12 -> 
            v3


{-| Update coefficient -}
set : R2Basis -> Float -> R2 -> R2
set basis value (R2 v0 v1 v2 v3) =
    case basis of
        Scalar -> 
            R2 value v1 v2 v3

        E1 -> 
            R2 v0 value v2 v3

        E2 -> 
            R2 v0 v1 value v3

        E12 -> 
            R2 v0 v1 v2 value


{-| Multivector with one coefficient -}
new : Float -> R2Basis -> R2
new value basis =
    set basis value zero


{-| Convert multivector to string -}
toString : R2 -> String
toString a =
    let 
        values =
            toList a

        basisNames =
            basisList |> List.map basisName |> List.map (\x -> if x == "1" then "" else x)
        
        roundFloat x =
            toFloat (round (x * 1000000)) / 1000000

        formatCoefficient v b =
            if (abs v > 0.000001) then (String.fromFloat (roundFloat v) ++ b) else ""
    in
        List.map2 formatCoefficient values basisNames 
            |> List.filter ((/=) "")
            |> String.join " + "
            |> (\s -> if s == "" then "0" else s)    


{-| Convert list of coefficients to multivector -}
fromList : List Float -> Maybe R2
fromList list =
    case ( List.head <| List.drop 0 list , ( List.head <| List.drop 1 list , ( List.head <| List.drop 2 list , ( List.head <| List.drop 3 list )))) of
        ( Just v0 , ( Just v1 , ( Just v2 , ( Just v3 )))) ->
            Just (R2 v0 v1 v2 v3)

        _ ->
            Nothing


{-| Convert multivector to list of coefficients -}
toList : R2 -> List Float
toList (R2 v0 v1 v2 v3) =
    [ v0, v1, v2, v3 ]



{-| Reverse the order of the basis blades. -}
reverse : R2 -> R2
reverse (R2 a0 a1 a2 a3) =
    R2
        (a0)
        (a1)
        (a2)
        (-a3)


{-| Poincare duality operator. -}
dual : R2 -> R2
dual (R2 a0 a1 a2 a3) =
    R2
        (-a3)
        (a2)
        (-a1)
        (a0)


{-| Clifford Conjugation -}
conjugate : R2 -> R2
conjugate (R2 a0 a1 a2 a3) =
    R2
        (a0)
        (-a1)
        (-a2)
        (-a3)


{-| Main involution -}
involute : R2 -> R2
involute (R2 a0 a1 a2 a3) =
    R2
        (a0)
        (-a1)
        (-a2)
        (a3)


{-| The geometric product. -}
mul : R2 -> R2 -> R2
mul (R2 a0 a1 a2 a3) (R2 b0 b1 b2 b3) =
    R2
        (b0 * a0 + b1 * a1 + b2 * a2 - b3 * a3)
        (b1 * a0 + b0 * a1 - b3 * a2 + b2 * a3)
        (b2 * a0 + b3 * a1 + b0 * a2 - b1 * a3)
        (b3 * a0 + b2 * a1 - b1 * a2 + b0 * a3)


{-| The outer product. (MEET) -}
wedge : R2 -> R2 -> R2
wedge (R2 a0 a1 a2 a3) (R2 b0 b1 b2 b3) =
    R2
        (b0 * a0)
        (b1 * a0 + b0 * a1)
        (b2 * a0 + b0 * a2)
        (b3 * a0 + b2 * a1 - b1 * a2 + b0 * a3)


{-| The regressive product. (JOIN) -}
vee : R2 -> R2 -> R2
vee (R2 a0 a1 a2 a3) (R2 b0 b1 b2 b3) =
    R2
        (1 * (a0 * b3 + a1 * b2 * -1 - a2 * -1 * b1 + a3 * b0))
        (1 * (a1 * b3 + a3 * b1))
        (-1 * (a2 * -1 * b3 + a3 * b2 * -1))
        (1 * (a3 * b3))


{-| The inner product. -}
dot : R2 -> R2 -> R2
dot (R2 a0 a1 a2 a3) (R2 b0 b1 b2 b3) =
    R2
        (b0 * a0 + b1 * a1 + b2 * a2 - b3 * a3)
        (b1 * a0 + b0 * a1 - b3 * a2 + b2 * a3)
        (b2 * a0 + b3 * a1 + b0 * a2 - b1 * a3)
        (b3 * a0 + b0 * a3)


{-| Multivector addition -}
add : R2 -> R2 -> R2
add (R2 a0 a1 a2 a3) (R2 b0 b1 b2 b3) =
    R2
        (a0 + b0)
        (a1 + b1)
        (a2 + b2)
        (a3 + b3)


{-| Multivector subtraction -}
sub : R2 -> R2 -> R2
sub (R2 a0 a1 a2 a3) (R2 b0 b1 b2 b3) =
    R2
        (a0 - b0)
        (a1 - b1)
        (a2 - b2)
        (a3 - b3)


{-| scalar/multivector multiplication -}
smul : Float -> R2 -> R2
smul a (R2 b0 b1 b2 b3) =
    R2
        (a * b0)
        (a * b1)
        (a * b2)
        (a * b3)


{-| multivector/scalar multiplication -}
muls : R2 -> Float -> R2
muls (R2 a0 a1 a2 a3) b =
    R2
        (a0 * b)
        (a1 * b)
        (a2 * b)
        (a3 * b)


{-| scalar/multivector addition -}
sadd : Float -> R2 -> R2
sadd a (R2 b0 b1 b2 b3) =
    R2
        (a + b0)
        (b1)
        (b2)
        (b3)


{-| multivector/scalar addition -}
adds : R2 -> Float -> R2
adds (R2 a0 a1 a2 a3) b =
    R2
        (a0 + b)
        (a1)
        (a2)
        (a3)


{-| scalar/multivector subtraction -}
ssub : Float -> R2 -> R2
ssub a (R2 b0 b1 b2 b3) =
    R2
        (a - b0)
        (-b1)
        (-b2)
        (-b3)


{-| multivector/scalar subtraction -}
subs : R2 -> Float -> R2
subs (R2 a0 a1 a2 a3) b =
    R2
        (a0 - b)
        (a1)
        (a2)
        (a3)


{-| Norm -}
norm : R2 -> Float
norm a =
    sqrt <| abs <| get Scalar <| mul a <| conjugate a


{-| Norm of dual -}
inorm : R2 -> Float
inorm a =
    norm (dual a)


{-| Normalized multivector -}
normalized : R2 -> R2
normalized a =
    muls a (1 / norm a)


{-| Basis multivector -}
unitScalar : R2
unitScalar =
    set Scalar 1 zero


{-| Basis multivector -}
e1 : R2
e1 =
    set E1 1 zero


{-| Basis multivector -}
e2 : R2
e2 =
    set E2 1 zero


{-| Basis multivector -}
e12 : R2
e12 =
    set E12 1 zero
