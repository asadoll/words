import Data
import Lib
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "formatGrid" $ do
    it "Should concatenate every line with a newline" $ do
      (formatGrid ["abc", "def", "ghi"]) `shouldBe` "abc\ndef\nghi\n"

  describe "findWord" $ do
    it "Should find words that exist on the Grid" $ do
      findWord grid "HASKELL" `shouldBe` Just "HASKELL"
      findWord grid "PERL" `shouldBe` Just "PERL"
    it "Should not find words that don't exist on the Grid" $ do
      findWord grid "HAMSTER" `shouldBe` Nothing

  describe "findwords" $ do
    it "Should find all the words that exist on the Grid" $ do
      findWords grid languages `shouldBe` languages
