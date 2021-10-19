module P1 exposing (..)
import Lists as L

countries = [("Romania", "Bucharest"), ("Germany", "Berlin"), ("France", "Paris")]

countriesWithCapital : List (String, String) -> (String -> Bool) -> List String
countriesWithCapital caps func = 
  let
    tuplesFilter lc = L.filter (\c -> func (c[1])) lc
  in
    L.map (\c -> c[0]) (tuplesFilter caps)

    