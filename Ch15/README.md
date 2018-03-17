# Chapter 15. Monoid, semigroup

## Exercise
> Write the Monoid instance for our Maybe type renamed to Optional.
> ```haskell
> data Optional a = 
>     Nada
>   | Only a
>   deriving (Eq, Show)
> instance Monoid a => Monoid (Optional a) where
> mempty = undefined
> mappend = undefined
> ```
[Here](./optional.hs) is the code.

## Intermission: Exercise
> Write a Monoid instance for Maybe type which doesn’t require a Monoid for the contents. Reuse the Monoid law QuickCheck proper- ties and use them to validate the instance.
> ```haskell
> newtype First' a =
>   First' { getFirst' :: Optional a }
>   deriving (Eq, Show)
>
> instance Monoid (First' a) where 
>   mempty = undefined
>   mappend = undefined
>
> firstMappend :: First' a -> First' a -> First' a
> firstMappend = mappend
>
> type FirstMappend =
>      First' String
>   -> First' String
>   -> First' String
>   -> Bool
>
> main :: IO ()
> main = do
>   quickCheck (monoidAssoc :: FirstMappend)
>   quickCheck (monoidLeftIdentity :: First' String -> Bool)
>   quickCheck > (monoidRightIdentity :: First' String -> Bool)
> ```
[Here](./first.hs) is the code.

## Chpater exercises
### Semigroup exercises
> Given a datatype, implement the Semigroup instance. Add Semi- group constraints to type variables where needed. Use the Semigroup class from the semigroups library or write your own. When we use `<>`, we mean the infix mappend from the Semigroup typeclass.
>
> Validate all of your instances with QuickCheck. Since Semi- group’s only law is associativity, that’s the only property you need to reuse.
> ```haskell
> data Trivial = Trivial deriving (Eq, Show)
>
> instance Semigroup Trivial where 
>   _ <> _ = undefined
> instance Arbitrary Trivial where
>   arbitrary = return Trivial
> semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
> semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)
>
> type TrivialAssoc = Trivial -> Trivial -> Trivial -> Bool
> 
> main :: IO () 
> main =
>   quickCheck (semigroupAssoc :: TrivialAssoc)
> ```
[Here](./semigroup/1-Trivial.hs) is the code.
> ```haskell
> newtype Identity a = Identity a
> ```
[Here](./semigroup/2-Identity.hs) is the code.
> ```haskell
> data Two a b = Two a b
> ```
[Here](./semigroup/3-Two.hs) is the code.
> ```haskell
> data Three a b c = Three a b c
> ```
[Here](./semigroup/4-Three.hs) is the code.
> ```haskell
> data Four a b c d = Four a b c d
> ```
[Here](./semigroup/5-Four.hs) is the code.
> ```haskell
> newtype BoolConj =
>   BoolConj Bool
> ```
> What it should do:
> ```haskell
> Prelude> (BoolConj True) <> (BoolConj True)
> BoolConj True
> Prelude> (BoolConj True) <> (BoolConj False)
> BoolConj False
> ```
[Here](./semigroup/6-BoolConj.hs) is the code.
> ```haskell
> newtype BoolDisj =
>   BoolDisj Bool
> ```
> What it should do:
> ```haskell
> Prelude> (BoolDisj True) <> (BoolDisj True)
> BoolConj True
> Prelude> (BoolDisj True) <> (BoolDisj False)
> BoolConj True
> ```
[Here](./semigroup/7-BoolDisj.hs) is the code.
> ```haskell
> data Or a b =
>     Fst a
>   | Snd b
> ```
> The Semigroup for Or should have the following behavior. We can think of this as having a “sticky” Snd value where it’ll hold onto the first Snd value when and if one is passed as an argument. This is similar to the First’ Monoid you wrote earlier.
> ```haskell
> Prelude> Fst 1 <> Snd 2
> Snd 2
> Prelude> Fst 1 <> Fst 2
> Fst 2
> Prelude> Snd 1 <> Fst 2
> Snd 1
> Prelude> Snd 1 <> Snd 2
> Snd 1
> ```
[Here](./semigroup/8-Or.hs) is the code.
> ```haskell
> newtype Comtype a b =
>   Combine { unCombine :: (a -> b) }
> ```
> What it should do:
> ```haskell
> Prelude> let f = Combine $ \n -> Sum (n + 1)
> Prelude> let g = Combine $ \n -> Sum (n - 1)
> Prelude> unCombine (f <> g) $ 0
> Sum {getSum = 0}
> Prelude> unCombine (f <> g) $ 1
> Sum {getSum = 2}
> Prelude> unCombine (f <> f) $ 1
> Sum {getSum = 4}
> Prelude> unCombine (g <> f) $ 1
> Sum {getSum = 2}
> ```
[Here](./semigroup/9-Combine.hs) is the code.
> ```haskell
> newtype Comp a =
>   Comp { unComp :: (a -> a) }
> ```
[Here](./semigroup/10-Comp.hs) is the code.
> ```haskell
> -- Look familiar?
> data Validation a b = 
>   Failure a | Success b 
>   deriving (Eq, Show)
>
> instance Semigroup a =>
>   Semigroup (Validation a b) where
>     (<>) = undefined
> ```
[Here](./semigroup/11-Validation.hs) is the code.
> ```haskell
> -- Validation with a Semigroup
> -- that does something different
> newtype AccumulateRight a b = 
>   AccumulateRight (Validation a b) 
>   deriving (Eq, Show)
> 
> instance Semigroup b =>
>   Semigroup (AccumulateRight a b) where
>     (<>) = undefined
> ```
[Here](./semigroup/12-AccumulateRight.hs) is the code.
> ```haskell
> -- Validation with a Semigroup
> -- that does something more
> newtype AccumulateBoth a b = 
>   AccumulateBoth (Validation a b) 
>   deriving (Eq, Show)
> instance (Semigroup a, Semigroup b) => 
>   Semigroup (AccumulateBoth a b) where
>     (<>) = undefined
> ```
[Here](./semigroup/13-AccumulateBoth.hs) is the code.
### Monoid exercises
> Given a datatype, implement the Monoid instance. Add Monoid constraints to type variables where needed. For the datatypes you’ve already implemented Semigroup instances for, you just need to figure out what the identity value is.
> 
> Again, validate all of your instances with QuickCheck. Example scaffold is provided for the Trivial type.
> ```haskell
> data Trivial = Trivial deriving (Eq, Show)
>
> instance Semigroup Trivial where 
>   (<>) = undefined
>
> instance Monoid Trivial where 
>   mempty = undefined
>   mappend = (<>)
>
> type TrivialAssoc = Trivial -> Trivial -> Trivial -> Bool
>
> main :: IO () 
> main = do
>   quickCheck (semigroupAssoc :: TrivialAssoc) 
>   quickCheck (monoidLeftIdentity :: Trivial -> Bool) 
>   quickCheck (monoidRightIdentity :: Trivial -> Bool)
> ```
[Here](./monoid/1-Trivial.hs) is the code.
> ```haskell
> newtype Identity a = Identity a deriving Show
> ```
[Here](./monoid/2-Identity.hs) is the code.
> ```haskell
> data Two a b = Two a b deriving Show
> ```
[Here](./monoid/3-Two.hs) is the code.
> ```haskell
> newtype BoolConj = BoolConj Bool 
> ```
> What it should do:
> ```haskell
> Prelude> (BoolConj True) `mappend` mempty
> BoolConj True
> Prelude> mempty `mappend` (BoolConj False)
> BoolConj False
> ```
[Here](./monoid/4-BoolConj.hs) is the code.
> ```haskell
> newtype BoolDisj = BoolDisj Bool
> ```
> What it should do:
> ```haskell
> Prelude> (BoolDisj True) `mappend` mempty
> BoolDisj True
> Prelude> mempty `mappend` (BoolDisj False)
> BoolDisj False
> ```
[Here](./monoid/5-BoolDisj.hs) is the code.
> ```haskell
> newtype Combine a b =
>   Combine { unCombine :: (a -> b) }
> ```
> What it should do:
> ```haskell
> Prelude> let f = Combine $ \n -> Sum (n + 1)
> Prelude> unCombine (mappend f mempty) $ 1
> Sum {getSum = 2}> 
> ```
[Here](./monoid/6-Combine.hs) is the code.
> ```haskell
> newtype Comp a = 
>   Comp (a -> a)
> ```
[Here](./monoid/7-Comp.hs) is the code.
> ```haskell
> newtype Mem s a = 
>   Mem {
>     runMem :: s -> (a,s) 
>   }
>
> instance Monoid a => Monoid (Mem s a) where 
>   mempty = undefined
>   mappend = undefined
> ```
> Given the following code:
> ```haskell
> f' = Mem $ \s -> ("hi", s + 1)
>
> main = do
>   print $ runMem (f' <> mempty) 0
>   print $ runMem (mempty <> f') 0
>   print $ (runMem mempty 0 :: (String, Int)) 
>   print $ runMem (f' <> mempty) 0 == runMem f' 0 
>   print $ runMem (mempty <> f') 0 == runMem f' 0
> ```
> A correct Monoid for Mem should, given the above code, get the following output:
> ```haskell
> Prelude> main
> ("hi",1)
> ("hi",1)
> ("",0)
> True True
> ```
