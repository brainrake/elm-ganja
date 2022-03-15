module Ganja.Mink exposing (MinkBasis(..), basisList, basisCount, basisName, Mink(..), zero, get, set, new, toString, fromList, toList, reverse, dual, conjugate, involute, mul, wedge, vee, dot, add, sub, smul, muls, sadd, adds, ssub, subs, norm, inorm, normalized, unitScalar, e1, e2, e12)
{-| Clifford Algebra: Mink

Generated with ganja.js written by enki.

# Basis
@docs MinkBasis, basisList, basisCount, basisName

# Multivector
@docs Mink, zero, get, set, new

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
type MinkBasis =
    Scalar
    | E1
    | E2
    | E12


{-| Basis list -}
basisList : List MinkBasis
basisList = 
    [ Scalar, E1, E2, E12 ]


{-| Number of coefficients -}
basisCount : Int
basisCount = 
    4


{-| Basis name -}
basisName : MinkBasis -> String
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
type Mink =
    Mink Float Float Float Float


{-| Zero value -}
zero : Mink
zero =
    Mink 0 0 0 0


{-| Get coefficient -}
get : MinkBasis -> Mink -> Float
get basis (Mink v0 v1 v2 v3) =
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
set : MinkBasis -> Float -> Mink -> Mink
set basis value (Mink v0 v1 v2 v3) =
    case basis of
        Scalar -> 
            Mink value v1 v2 v3

        E1 -> 
            Mink v0 value v2 v3

        E2 -> 
            Mink v0 v1 value v3

        E12 -> 
            Mink v0 v1 v2 value


{-| Multivector with one coefficient -}
new : Float -> MinkBasis -> Mink
new value basis =
    set basis value zero


{-| Convert multivector to string -}
toString : Mink -> String
toString a =
    let 
        values =
            toList a

        basisNames =
            basisList |> List.map basisName |> List.map (\x -> if x == "1" then "" else x)
        
        roundFloat x =
            toFloat (round (x * 10000000)) / 10000000

        formatCoefficient v b =
            if (abs v > 0.000001) then (String.fromFloat (roundFloat v) ++ b) else ""
    in
        List.map2 formatCoefficient values basisNames 
            |> List.filter ((/=) "")
            |> String.join " + "
            |> (\s -> if s == "" then "0" else s)    


{-| Convert list of coefficients to multivector -}
fromList : List Float -> Maybe Mink
fromList list =
    case ( List.head <| List.drop 0 list , ( List.head <| List.drop 1 list , ( List.head <| List.drop 2 list , ( List.head <| List.drop 3 list )))) of
        ( Just v0 , ( Just v1 , ( Just v2 , ( Just v3 )))) ->
            Just (Mink v0 v1 v2 v3)

        _ ->
            Nothing


{-| Convert multivector to list of coefficients -}
toList : Mink -> List Float
toList (Mink v0 v1 v2 v3) =
    [ v0, v1, v2, v3 ]



{-| Reverse the order of the basis blades. -}
reverse : Mink -> Mink
reverse (Mink a0 a1 a2 a3) =
    Mink
        (a0)
        (a1)
        (a2)
        (-a3)


{-| Poincare duality operator. -}
dual : Mink -> Mink
dual (Mink a0 a1 a2 a3) =
    Mink
        (a3)
        (-a2)
        (-a1)
        (a0)


{-| Clifford Conjugation -}
conjugate : Mink -> Mink
conjugate (Mink a0 a1 a2 a3) =
    Mink
        (a0)
        (-a1)
        (-a2)
        (-a3)


{-| Main involution -}
involute : Mink -> Mink
involute (Mink a0 a1 a2 a3) =
    Mink
        (a0)
        (-a1)
        (-a2)
        (a3)


{-| The geometric product. -}
mul : Mink -> Mink -> Mink
mul (Mink a0 a1 a2 a3) (Mink b0 b1 b2 b3) =
    Mink
        (b0 * a0 + b1 * a1 - b2 * a2 + b3 * a3)
        (b1 * a0 + b0 * a1 + b3 * a2 - b2 * a3)
        (b2 * a0 + b3 * a1 + b0 * a2 - b1 * a3)
        (b3 * a0 + b2 * a1 - b1 * a2 + b0 * a3)


{-| The outer product. (MEET) -}
wedge : Mink -> Mink -> Mink
wedge (Mink a0 a1 a2 a3) (Mink b0 b1 b2 b3) =
    Mink
        (b0 * a0)
        (b1 * a0 + b0 * a1)
        (b2 * a0 + b0 * a2)
        (b3 * a0 + b2 * a1 - b1 * a2 + b0 * a3)


{-| The regressive product. (JOIN) -}
vee : Mink -> Mink -> Mink
vee (Mink a0 a1 a2 a3) (Mink b0 b1 b2 b3) =
    Mink
        (1 * (a0 * b3 + a1 * b2 * -1 - a2 * -1 * b1 + a3 * b0))
        (1 * (a1 * b3 + a3 * b1))
        (-1 * (a2 * -1 * b3 + a3 * b2 * -1))
        (1 * (a3 * b3))


{-| The inner product. -}
dot : Mink -> Mink -> Mink
dot (Mink a0 a1 a2 a3) (Mink b0 b1 b2 b3) =
    Mink
        (b0 * a0 + b1 * a1 - b2 * a2 + b3 * a3)
        (b1 * a0 + b0 * a1 + b3 * a2 - b2 * a3)
        (b2 * a0 + b3 * a1 + b0 * a2 - b1 * a3)
        (b3 * a0 + b0 * a3)


{-| Multivector addition -}
add : Mink -> Mink -> Mink
add (Mink a0 a1 a2 a3) (Mink b0 b1 b2 b3) =
    Mink
        (a0 + b0)
        (a1 + b1)
        (a2 + b2)
        (a3 + b3)


{-| Multivector subtraction -}
sub : Mink -> Mink -> Mink
sub (Mink a0 a1 a2 a3) (Mink b0 b1 b2 b3) =
    Mink
        (a0 - b0)
        (a1 - b1)
        (a2 - b2)
        (a3 - b3)


{-| scalar/multivector multiplication -}
smul : Float -> Mink -> Mink
smul a (Mink b0 b1 b2 b3) =
    Mink
        (a * b0)
        (a * b1)
        (a * b2)
        (a * b3)


{-| multivector/scalar multiplication -}
muls : Mink -> Float -> Mink
muls (Mink a0 a1 a2 a3) b =
    Mink
        (a0 * b)
        (a1 * b)
        (a2 * b)
        (a3 * b)


{-| scalar/multivector addition -}
sadd : Float -> Mink -> Mink
sadd a (Mink b0 b1 b2 b3) =
    Mink
        (a + b0)
        (b1)
        (b2)
        (b3)


{-| multivector/scalar addition -}
adds : Mink -> Float -> Mink
adds (Mink a0 a1 a2 a3) b =
    Mink
        (a0 + b)
        (a1)
        (a2)
        (a3)


{-| scalar/multivector subtraction -}
ssub : Float -> Mink -> Mink
ssub a (Mink b0 b1 b2 b3) =
    Mink
        (a - b0)
        (-b1)
        (-b2)
        (-b3)


{-| multivector/scalar subtraction -}
subs : Mink -> Float -> Mink
subs (Mink a0 a1 a2 a3) b =
    Mink
        (a0 - b)
        (a1)
        (a2)
        (a3)


{-| Norm -}
norm : Mink -> Float
norm a =
    sqrt <| abs <| get Scalar <| mul a <| conjugate a


{-| Norm of dual -}
inorm : Mink -> Float
inorm a =
    norm (dual a)


{-| Normalized multivector -}
normalized : Mink -> Mink
normalized a =
    muls a (1 / norm a)


{-| Basis multivector -}
unitScalar : Mink
unitScalar =
    set Scalar 1 zero


{-| Basis multivector -}
e1 : Mink
e1 =
    set E1 1 zero


{-| Basis multivector -}
e2 : Mink
e2 =
    set E2 1 zero


{-| Basis multivector -}
e12 : Mink
e12 =
    set E12 1 zero
