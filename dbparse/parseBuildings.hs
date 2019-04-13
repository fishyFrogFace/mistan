import System.IO
import Control.Applicative (liftA)
import Data.Foldable (for_)
import Control.DeepSeq (($!!))

writeFileWithEncoding :: FilePath -> String -> IO ()
writeFileWithEncoding fp content =
    withFile fp WriteMode $ \h ->
        hSetEncoding h utf8 >>
        hPutStr h content

readFileWithEncoding :: FilePath -> IO String
readFileWithEncoding fp =
    withFile fp ReadMode $ \h -> do
        hSetEncoding h utf8
        f <- hGetContents h
        return $!! f

removeEnd :: String -> String
removeEnd (x:xs)
    | x == '<'  = []
    | otherwise = x : removeEnd xs

removeStart :: String -> String
removeStart (x:xs)
    | x == '>'  = removeEnd xs
    | otherwise = removeStart xs

addThings :: String -> String
addThings str = "  (DEFAULT, '" ++ str ++ "', 1),"

main :: IO ()
main = do
    file <- liftA lines $ readFileWithEncoding "buildings.txt"
    let result = unlines $ map (addThings . removeStart) file
    writeFileWithEncoding "res.txt" result