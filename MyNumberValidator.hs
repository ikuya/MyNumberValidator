import System.Environment (getArgs)
import Control.Monad (when)
import Text.Read (readMaybe)
import Data.Char (digitToInt)

checkMyNumber :: Int -> Bool
checkMyNumber mynumber
  | length (show mynumber) == 12 =
      let (checkDigit:p) = reverse $ map digitToInt $ show mynumber
          q     = [if n <= 6 then n + 1 else n - 5 | n <- [1..11]]
          x      = (`mod` 11) . sum . zipWith (*) q $ p
      in checkDigit == if x <= 1 then 0 else (11 - x)
  | otherwise = False

main :: IO()
main = do
  args <-getArgs
  when (not $ null args) $ do
    case readMaybe $ head args of
      Just myNumber -> let result = checkMyNumber myNumber
                       in
                         if result == True
                         then putStrLn "VALID"
                         else putStrLn "INVALID"
      Nothing -> putStrLn "Error: the argument must be a numeric number"
