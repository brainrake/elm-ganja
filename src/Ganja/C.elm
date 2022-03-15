module Ganja.C exposing (CBasis(..), basisList, basisCount, basisName, C(..), zero, get, set, new, toString, fromList, toList, reverse, dual, conjugate, involute, mul, wedge, vee, dot, add, sub, smul, muls, sadd, adds, ssub, subs, norm, inorm, normalized, unitScalar, e1)
{-| Clifford Algebra: C

Generated with ganja.js written by enki.

# Basis
@docs CBasis, basisList, basisCount, basisName

# Multivector
@docs C, zero, get, set, new

# Basis multivectors
@docs  unitScalar, e1

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
type CBasis =
    Scalar
    | E1


{-| Basis list -}
basisList : List CBasis
basisList = 
    [ Scalar, E1 ]


{-| Number of coefficients -}
basisCount : Int
basisCount = 
    2


{-| Basis name -}
basisName : CBasis -> String
basisName basis =
    case basis of
        Scalar -> 
            "1"

        E1 -> 
            "e1"


{-| Multivector -}
type C =
    C Float Float


{-| Zero value -}
zero : C
zero =
    C 0 0


{-| Get coefficient -}
get : CBasis -> C -> Float
get basis (C v0 v1) =
    case basis of
        Scalar -> 
            v0

        E1 -> 
            v1


{-| Update coefficient -}
set : CBasis -> Float -> C -> C
set basis value (C v0 v1) =
    case basis of
        Scalar -> 
            C value v1

        E1 -> 
            C v0 value


{-| Multivector with one coefficient -}
new : Float -> CBasis -> C
new value basis =
    set basis value zero


{-| Convert multivector to string -}
toString : C -> String
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
fromList : List Float -> Maybe C
fromList list =
    case ( List.head <| List.drop 0 list , ( List.head <| List.drop 1 list )) of
        ( Just v0 , ( Just v1 )) ->
            Just (C v0 v1)

        _ ->
            Nothing


{-| Convert multivector to list of coefficients -}
toList : C -> List Float
toList (C v0 v1) =
    [ v0, v1 ]



{-| Reverse the order of the basis blades. -}
reverse : C -> C
reverse (C a0 a1) =
    C
        (a0)
        (a1)


{-| Poincare duality operator. -}
dual : C -> C
dual (C a0 a1) =
    C
        (-a1)
        (a0)


{-| Clifford Conjugation -}
conjugate : C -> C
conjugate (C a0 a1) =
    C
        (a0)
        (-a1)


{-| Main involution -}
involute : C -> C
involute (C a0 a1) =
    C
        (a0)
        (-a1)


{-| The geometric product. -}
mul : C -> C -> C
mul (C a0 a1) (C b0 b1) =
    C
        (b0 * a0 - b1 * a1)
        (b1 * a0 + b0 * a1)


{-| The outer product. (MEET) -}
wedge : C -> C -> C
wedge (C a0 a1) (C b0 b1) =
    C
        (b0 * a0)
        (b1 * a0 + b0 * a1)


{-| The regressive product. (JOIN) -}
vee : C -> C -> C
vee (C a0 a1) (C b0 b1) =
    C
        (1 * (a0 * b1 + a1 * b0))
        (1 * (a1 * b1))


{-| The inner product. -}
dot : C -> C -> C
dot (C a0 a1) (C b0 b1) =
    C
        (b0 * a0 - b1 * a1)
        (b1 * a0 + b0 * a1)


{-| Multivector addition -}
add : C -> C -> C
add (C a0 a1) (C b0 b1) =
    C
        (a0 + b0)
        (a1 + b1)


{-| Multivector subtraction -}
sub : C -> C -> C
sub (C a0 a1) (C b0 b1) =
    C
        (a0 - b0)
        (a1 - b1)


{-| scalar/multivector multiplication -}
smul : Float -> C -> C
smul a (C b0 b1) =
    C
        (a * b0)
        (a * b1)


{-| multivector/scalar multiplication -}
muls : C -> Float -> C
muls (C a0 a1) b =
    C
        (a0 * b)
        (a1 * b)


{-| scalar/multivector addition -}
sadd : Float -> C -> C
sadd a (C b0 b1) =
    C
        (a + b0)
        (b1)


{-| multivector/scalar addition -}
adds : C -> Float -> C
adds (C a0 a1) b =
    C
        (a0 + b)
        (a1)


{-| scalar/multivector subtraction -}
ssub : Float -> C -> C
ssub a (C b0 b1) =
    C
        (a - b0)
        (-b1)


{-| multivector/scalar subtraction -}
subs : C -> Float -> C
subs (C a0 a1) b =
    C
        (a0 - b)
        (a1)


{-| Norm -}
norm : C -> Float
norm a =
    sqrt <| abs <| get Scalar <| mul a <| conjugate a


{-| Norm of dual -}
inorm : C -> Float
inorm a =
    norm (dual a)


{-| Normalized multivector -}
normalized : C -> C
normalized a =
    muls a (1 / norm a)


{-| Basis multivector -}
unitScalar : C
unitScalar =
    set Scalar 1 zero


{-| Basis multivector -}
e1 : C
e1 =
    set E1 1 zero
