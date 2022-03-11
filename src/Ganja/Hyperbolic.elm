module Ganja.Hyperbolic exposing (HyperbolicBasis(..), basisList, basisCount, basisName, Hyperbolic(..), zero, get, set, new, toString, fromList, toList, reverse, dual, conjugate, involute, mul, wedge, vee, dot, add, sub, smul, muls, sadd, adds, ssub, subs, norm, inorm, normalized)
{-| Clifford Algebra: Hyperbolic
Generated with ganja.js written by enki.

# Basis
@docs HyperbolicBasis, basisList, basisCount, basisName

# Multivector
@docs Hyperbolic, zero, get, set, new

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
type HyperbolicBasis =
    Scalar
    | E1


{-| Basis list -}
basisList : List HyperbolicBasis
basisList = 
    [ Scalar, E1 ]


{-| Number of coefficients -}
basisCount : Int
basisCount = 
    2


{-| Basis name -}
basisName : HyperbolicBasis -> String
basisName basis =
    case basis of
        Scalar -> 
            "1"

        E1 -> 
            "e1"


{-| Multivector -}
type Hyperbolic =
    Hyperbolic Float Float


{-| Zero value -}
zero : Hyperbolic
zero =
    Hyperbolic 0 0


{-| Get coefficient -}
get : HyperbolicBasis -> Hyperbolic -> Float
get basis (Hyperbolic v0 v1) =
    case basis of
        Scalar -> 
            v0

        E1 -> 
            v1


{-| Update coefficient -}
set : HyperbolicBasis -> Float -> Hyperbolic -> Hyperbolic
set basis value (Hyperbolic v0 v1) =
    case basis of
        Scalar -> 
            Hyperbolic value v1

        E1 -> 
            Hyperbolic v0 value


{-| Multivector with one coefficient -}
new : Float -> HyperbolicBasis -> Hyperbolic
new value basis =
    set basis value zero


{-| Convert multivector to string -}
toString : Hyperbolic -> String
toString a =
    let 
        values =
            toList a

        basisNames =
            basisList |> List.map basisName |> List.map (\x -> if x == "1" then "" else x)
        
        formatCoefficient v b =
            if (abs v > 0.000001) then (String.fromFloat v ++ b) else ""
    in
        List.map2 formatCoefficient values basisNames 
            |> List.filter ((/=) "")
            |> String.join " + "
            |> (\s -> if s == "" then "0" else s)    


{-| Convert list of coefficients to multivector -}
fromList : List Float -> Maybe Hyperbolic
fromList list =
    case ( List.head <| List.drop 0 list , ( List.head <| List.drop 1 list )) of
        ( Just v0 , ( Just v1 )) ->
            Just (Hyperbolic v0 v1)

        _ ->
            Nothing


{-| Convert multivector to list of coefficients -}
toList : Hyperbolic -> List Float
toList (Hyperbolic v0 v1) =
    [ v0, v1 ]



{-| Reverse the order of the basis blades. -}
reverse : Hyperbolic -> Hyperbolic
reverse (Hyperbolic a0 a1) =
    Hyperbolic
        (a0)
        (a1)


{-| Poincare duality operator. -}
dual : Hyperbolic -> Hyperbolic
dual (Hyperbolic a0 a1) =
    Hyperbolic
        (a1)
        (a0)


{-| Clifford Conjugation -}
conjugate : Hyperbolic -> Hyperbolic
conjugate (Hyperbolic a0 a1) =
    Hyperbolic
        (a0)
        (-a1)


{-| Main involution -}
involute : Hyperbolic -> Hyperbolic
involute (Hyperbolic a0 a1) =
    Hyperbolic
        (a0)
        (-a1)


{-| The geometric product. -}
mul : Hyperbolic -> Hyperbolic -> Hyperbolic
mul (Hyperbolic a0 a1) (Hyperbolic b0 b1) =
    Hyperbolic
        (b0 * a0 + b1 * a1)
        (b1 * a0 + b0 * a1)


{-| The outer product. (MEET) -}
wedge : Hyperbolic -> Hyperbolic -> Hyperbolic
wedge (Hyperbolic a0 a1) (Hyperbolic b0 b1) =
    Hyperbolic
        (b0 * a0)
        (b1 * a0 + b0 * a1)


{-| The regressive product. (JOIN) -}
vee : Hyperbolic -> Hyperbolic -> Hyperbolic
vee (Hyperbolic a0 a1) (Hyperbolic b0 b1) =
    Hyperbolic
        (1 * (a1 * b1))
        (1 * (a0 * b1 + a1 * b0))


{-| The inner product. -}
dot : Hyperbolic -> Hyperbolic -> Hyperbolic
dot (Hyperbolic a0 a1) (Hyperbolic b0 b1) =
    Hyperbolic
        (b0 * a0 + b1 * a1)
        (b1 * a0 + b0 * a1)


{-| Multivector addition -}
add : Hyperbolic -> Hyperbolic -> Hyperbolic
add (Hyperbolic a0 a1) (Hyperbolic b0 b1) =
    Hyperbolic
        (a0 + b0)
        (a1 + b1)


{-| Multivector subtraction -}
sub : Hyperbolic -> Hyperbolic -> Hyperbolic
sub (Hyperbolic a0 a1) (Hyperbolic b0 b1) =
    Hyperbolic
        (a0 - b0)
        (a1 - b1)


{-| scalar/multivector multiplication -}
smul : Float -> Hyperbolic -> Hyperbolic
smul a (Hyperbolic b0 b1) =
    Hyperbolic
        (a * b0)
        (a * b1)


{-| multivector/scalar multiplication -}
muls : Hyperbolic -> Float -> Hyperbolic
muls (Hyperbolic a0 a1) b =
    Hyperbolic
        (a0 * b)
        (a1 * b)


{-| scalar/multivector addition -}
sadd : Float -> Hyperbolic -> Hyperbolic
sadd a (Hyperbolic b0 b1) =
    Hyperbolic
        (a + b0)
        (b1)


{-| multivector/scalar addition -}
adds : Hyperbolic -> Float -> Hyperbolic
adds (Hyperbolic a0 a1) b =
    Hyperbolic
        (a0 + b)
        (a1)


{-| scalar/multivector subtraction -}
ssub : Float -> Hyperbolic -> Hyperbolic
ssub a (Hyperbolic b0 b1) =
    Hyperbolic
        (a - b0)
        (-b1)


{-| multivector/scalar subtraction -}
subs : Hyperbolic -> Float -> Hyperbolic
subs (Hyperbolic a0 a1) b =
    Hyperbolic
        (a0 - b)
        (a1)


{-| Norm -}
norm : Hyperbolic -> Float
norm a =
    sqrt <| abs <| get Scalar <| mul a <| conjugate a


{-| Norm of dual -}
inorm : Hyperbolic -> Float
inorm a =
    norm (dual a)


{-| Normalized multivector -}
normalized : Hyperbolic -> Hyperbolic
normalized a =
    muls a (1 / norm a)


{-| Basis multivector -}
scalar : Hyperbolic
scalar =
    set Scalar 1 zero


{-| Basis multivector -}
e1 : Hyperbolic
e1 =
    set E1 1 zero
