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
