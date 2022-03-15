module Ganja.Quat exposing (QuatBasis(..), basisList, basisCount, basisName, Quat(..), zero, get, set, new, toString, fromList, toList, reverse, dual, conjugate, involute, mul, wedge, vee, dot, add, sub, smul, muls, sadd, adds, ssub, subs, norm, inorm, normalized, unitScalar, e1, e2, e12)
{-| Clifford Algebra: Quat

Generated with ganja.js written by enki.

# Basis
@docs QuatBasis, basisList, basisCount, basisName

# Multivector
@docs Quat, zero, get, set, new

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
type QuatBasis =
    Scalar
    | E1
    | E2
    | E12


{-| Basis list -}
basisList : List QuatBasis
basisList = 
    [ Scalar, E1, E2, E12 ]


{-| Number of coefficients -}
basisCount : Int
basisCount = 
    4


{-| Basis name -}
basisName : QuatBasis -> String
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
type Quat =
    Quat Float Float Float Float


{-| Zero value -}
zero : Quat
zero =
    Quat 0 0 0 0


{-| Get coefficient -}
get : QuatBasis -> Quat -> Float
get basis (Quat v0 v1 v2 v3) =
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
set : QuatBasis -> Float -> Quat -> Quat
set basis value (Quat v0 v1 v2 v3) =
    case basis of
        Scalar -> 
            Quat value v1 v2 v3

        E1 -> 
            Quat v0 value v2 v3

        E2 -> 
            Quat v0 v1 value v3

        E12 -> 
            Quat v0 v1 v2 value


{-| Multivector with one coefficient -}
new : Float -> QuatBasis -> Quat
new value basis =
    set basis value zero


{-| Convert multivector to string -}
toString : Quat -> String
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
fromList : List Float -> Maybe Quat
fromList list =
    case ( List.head <| List.drop 0 list , ( List.head <| List.drop 1 list , ( List.head <| List.drop 2 list , ( List.head <| List.drop 3 list )))) of
        ( Just v0 , ( Just v1 , ( Just v2 , ( Just v3 )))) ->
            Just (Quat v0 v1 v2 v3)

        _ ->
            Nothing


{-| Convert multivector to list of coefficients -}
toList : Quat -> List Float
toList (Quat v0 v1 v2 v3) =
    [ v0, v1, v2, v3 ]



{-| Reverse the order of the basis blades. -}
reverse : Quat -> Quat
reverse (Quat a0 a1 a2 a3) =
    Quat
        (a0)
        (a1)
        (a2)
        (-a3)


{-| Poincare duality operator. -}
dual : Quat -> Quat
dual (Quat a0 a1 a2 a3) =
    Quat
        (-a3)
        (-a2)
        (a1)
        (a0)


{-| Clifford Conjugation -}
conjugate : Quat -> Quat
conjugate (Quat a0 a1 a2 a3) =
    Quat
        (a0)
        (-a1)
        (-a2)
        (-a3)


{-| Main involution -}
involute : Quat -> Quat
involute (Quat a0 a1 a2 a3) =
    Quat
        (a0)
        (-a1)
        (-a2)
        (a3)


{-| The geometric product. -}
mul : Quat -> Quat -> Quat
mul (Quat a0 a1 a2 a3) (Quat b0 b1 b2 b3) =
    Quat
        (b0 * a0 - b1 * a1 - b2 * a2 - b3 * a3)
        (b1 * a0 + b0 * a1 + b3 * a2 - b2 * a3)
        (b2 * a0 - b3 * a1 + b0 * a2 + b1 * a3)
        (b3 * a0 + b2 * a1 - b1 * a2 + b0 * a3)


{-| The outer product. (MEET) -}
wedge : Quat -> Quat -> Quat
wedge (Quat a0 a1 a2 a3) (Quat b0 b1 b2 b3) =
    Quat
        (b0 * a0)
        (b1 * a0 + b0 * a1)
        (b2 * a0 + b0 * a2)
        (b3 * a0 + b2 * a1 - b1 * a2 + b0 * a3)


{-| The regressive product. (JOIN) -}
vee : Quat -> Quat -> Quat
vee (Quat a0 a1 a2 a3) (Quat b0 b1 b2 b3) =
    Quat
        (1 * (a0 * b3 + a1 * b2 * -1 - a2 * -1 * b1 + a3 * b0))
        (1 * (a1 * b3 + a3 * b1))
        (-1 * (a2 * -1 * b3 + a3 * b2 * -1))
        (1 * (a3 * b3))


{-| The inner product. -}
dot : Quat -> Quat -> Quat
dot (Quat a0 a1 a2 a3) (Quat b0 b1 b2 b3) =
    Quat
        (b0 * a0 - b1 * a1 - b2 * a2 - b3 * a3)
        (b1 * a0 + b0 * a1 + b3 * a2 - b2 * a3)
        (b2 * a0 - b3 * a1 + b0 * a2 + b1 * a3)
        (b3 * a0 + b0 * a3)


{-| Multivector addition -}
add : Quat -> Quat -> Quat
add (Quat a0 a1 a2 a3) (Quat b0 b1 b2 b3) =
    Quat
        (a0 + b0)
        (a1 + b1)
        (a2 + b2)
        (a3 + b3)


{-| Multivector subtraction -}
sub : Quat -> Quat -> Quat
sub (Quat a0 a1 a2 a3) (Quat b0 b1 b2 b3) =
    Quat
        (a0 - b0)
        (a1 - b1)
        (a2 - b2)
        (a3 - b3)


{-| scalar/multivector multiplication -}
smul : Float -> Quat -> Quat
smul a (Quat b0 b1 b2 b3) =
    Quat
        (a * b0)
        (a * b1)
        (a * b2)
        (a * b3)


{-| multivector/scalar multiplication -}
muls : Quat -> Float -> Quat
muls (Quat a0 a1 a2 a3) b =
    Quat
        (a0 * b)
        (a1 * b)
        (a2 * b)
        (a3 * b)


{-| scalar/multivector addition -}
sadd : Float -> Quat -> Quat
sadd a (Quat b0 b1 b2 b3) =
    Quat
        (a + b0)
        (b1)
        (b2)
        (b3)


{-| multivector/scalar addition -}
adds : Quat -> Float -> Quat
adds (Quat a0 a1 a2 a3) b =
    Quat
        (a0 + b)
        (a1)
        (a2)
        (a3)


{-| scalar/multivector subtraction -}
ssub : Float -> Quat -> Quat
ssub a (Quat b0 b1 b2 b3) =
    Quat
        (a - b0)
        (-b1)
        (-b2)
        (-b3)


{-| multivector/scalar subtraction -}
subs : Quat -> Float -> Quat
subs (Quat a0 a1 a2 a3) b =
    Quat
        (a0 - b)
        (a1)
        (a2)
        (a3)


{-| Norm -}
norm : Quat -> Float
norm a =
    sqrt <| abs <| get Scalar <| mul a <| conjugate a


{-| Norm of dual -}
inorm : Quat -> Float
inorm a =
    norm (dual a)


{-| Normalized multivector -}
normalized : Quat -> Quat
normalized a =
    muls a (1 / norm a)


{-| Basis multivector -}
unitScalar : Quat
unitScalar =
    set Scalar 1 zero


{-| Basis multivector -}
e1 : Quat
e1 =
    set E1 1 zero


{-| Basis multivector -}
e2 : Quat
e2 =
    set E2 1 zero


{-| Basis multivector -}
e12 : Quat
e12 =
    set E12 1 zero
