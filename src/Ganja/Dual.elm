module Ganja.Dual exposing (DualBasis(..), basisList, basisCount, basisName, Dual(..), zero, get, set, new, toString, fromList, toList, reverse, dual, conjugate, involute, mul, wedge, vee, dot, add, sub, smul, muls, sadd, adds, ssub, subs, norm, inorm, normalized, unitScalar, e0)
{-| Clifford Algebra: Dual

Generated with ganja.js written by enki.

# Basis
@docs DualBasis, basisList, basisCount, basisName

# Multivector
@docs Dual, zero, get, set, new

# Basis multivectors
@docs  unitScalar, e0

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
type DualBasis =
    Scalar
    | E0


{-| Basis list -}
basisList : List DualBasis
basisList = 
    [ Scalar, E0 ]


{-| Number of coefficients -}
basisCount : Int
basisCount = 
    2


{-| Basis name -}
basisName : DualBasis -> String
basisName basis =
    case basis of
        Scalar -> 
            "1"

        E0 -> 
            "e0"


{-| Multivector -}
type Dual =
    Dual Float Float


{-| Zero value -}
zero : Dual
zero =
    Dual 0 0


{-| Get coefficient -}
get : DualBasis -> Dual -> Float
get basis (Dual v0 v1) =
    case basis of
        Scalar -> 
            v0

        E0 -> 
            v1


{-| Update coefficient -}
set : DualBasis -> Float -> Dual -> Dual
set basis value (Dual v0 v1) =
    case basis of
        Scalar -> 
            Dual value v1

        E0 -> 
            Dual v0 value


{-| Multivector with one coefficient -}
new : Float -> DualBasis -> Dual
new value basis =
    set basis value zero


{-| Convert multivector to string -}
toString : Dual -> String
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
fromList : List Float -> Maybe Dual
fromList list =
    case ( List.head <| List.drop 0 list , ( List.head <| List.drop 1 list )) of
        ( Just v0 , ( Just v1 )) ->
            Just (Dual v0 v1)

        _ ->
            Nothing


{-| Convert multivector to list of coefficients -}
toList : Dual -> List Float
toList (Dual v0 v1) =
    [ v0, v1 ]



{-| Reverse the order of the basis blades. -}
reverse : Dual -> Dual
reverse (Dual a0 a1) =
    Dual
        (a0)
        (a1)


{-| Poincare duality operator. -}
dual : Dual -> Dual
dual (Dual a0 a1) =
    Dual
        (a1)
        (a0)


{-| Clifford Conjugation -}
conjugate : Dual -> Dual
conjugate (Dual a0 a1) =
    Dual
        (a0)
        (-a1)


{-| Main involution -}
involute : Dual -> Dual
involute (Dual a0 a1) =
    Dual
        (a0)
        (-a1)


{-| The geometric product. -}
mul : Dual -> Dual -> Dual
mul (Dual a0 a1) (Dual b0 b1) =
    Dual
        (b0 * a0)
        (b1 * a0 + b0 * a1)


{-| The outer product. (MEET) -}
wedge : Dual -> Dual -> Dual
wedge (Dual a0 a1) (Dual b0 b1) =
    Dual
        (b0 * a0)
        (b1 * a0 + b0 * a1)


{-| The regressive product. (JOIN) -}
vee : Dual -> Dual -> Dual
vee (Dual a0 a1) (Dual b0 b1) =
    Dual
        (1 * (a0 * b1 + a1 * b0))
        (1 * (a1 * b1))


{-| The inner product. -}
dot : Dual -> Dual -> Dual
dot (Dual a0 a1) (Dual b0 b1) =
    Dual
        (b0 * a0)
        (b1 * a0 + b0 * a1)


{-| Multivector addition -}
add : Dual -> Dual -> Dual
add (Dual a0 a1) (Dual b0 b1) =
    Dual
        (a0 + b0)
        (a1 + b1)


{-| Multivector subtraction -}
sub : Dual -> Dual -> Dual
sub (Dual a0 a1) (Dual b0 b1) =
    Dual
        (a0 - b0)
        (a1 - b1)


{-| scalar/multivector multiplication -}
smul : Float -> Dual -> Dual
smul a (Dual b0 b1) =
    Dual
        (a * b0)
        (a * b1)


{-| multivector/scalar multiplication -}
muls : Dual -> Float -> Dual
muls (Dual a0 a1) b =
    Dual
        (a0 * b)
        (a1 * b)


{-| scalar/multivector addition -}
sadd : Float -> Dual -> Dual
sadd a (Dual b0 b1) =
    Dual
        (a + b0)
        (b1)


{-| multivector/scalar addition -}
adds : Dual -> Float -> Dual
adds (Dual a0 a1) b =
    Dual
        (a0 + b)
        (a1)


{-| scalar/multivector subtraction -}
ssub : Float -> Dual -> Dual
ssub a (Dual b0 b1) =
    Dual
        (a - b0)
        (-b1)


{-| multivector/scalar subtraction -}
subs : Dual -> Float -> Dual
subs (Dual a0 a1) b =
    Dual
        (a0 - b)
        (a1)


{-| Norm -}
norm : Dual -> Float
norm a =
    sqrt <| abs <| get Scalar <| mul a <| conjugate a


{-| Norm of dual -}
inorm : Dual -> Float
inorm a =
    norm (dual a)


{-| Normalized multivector -}
normalized : Dual -> Dual
normalized a =
    muls a (1 / norm a)


{-| Basis multivector -}
unitScalar : Dual
unitScalar =
    set Scalar 1 zero


{-| Basis multivector -}
e0 : Dual
e0 =
    set E0 1 zero
