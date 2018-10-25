import Test.QuickCheck
import Test.Hspec

main :: IO ()
main = hspec $ do

    describe "add" $ do
      it "can compute 2 + 2 = 4" $ do
        2 + 2 `shouldBe` 4 
