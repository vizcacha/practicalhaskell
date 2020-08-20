module Chapter2.DataTypes where

data Client = GovOrg     String
            | Company    String Integer Person String
            | Individual Person Bool
            deriving Show

data Person = Person String String Gender
            deriving Show

data Gender = Male | Female | OtherGender
            deriving Show

data TimeMachine = TimeMachine String Int String TimeDirection Float
            deriving Show

data TimeDirection = Past | Future
            deriving Show

countGenders :: [Client] -> (Int, Int)
countGenders = countGenders' (0, 0)

countGenders' :: (Int, Int) -> [Client] -> (Int, Int)
countGenders' (male, female) ls = case ls of
                                    []     -> (male, female)
                                    (x:xs) -> case x of
                                                Individual (Person _ _ g) _ -> case g of
                                                                                 Male   -> countGenders' (male + 1, female) xs
                                                                                 Female -> countGenders' (male, female + 1) xs
                                                _                           -> countGenders' (male, female) xs

discountMachines :: [TimeMachine] -> Float -> [TimeMachine]
discountMachines ls discount = case ls of
                                 [] -> []
                                 ((TimeMachine manu model name dir price):xs) -> (TimeMachine manu model name dir ((1 - discount) * price)):(discountMachines xs discount)
