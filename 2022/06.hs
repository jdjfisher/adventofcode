
main = do
    datastream <- readFile "input.txt"
    print $ findPacket datastream 4
    print $ findMessage datastream 14

distinct :: (Eq t) => [t] -> Bool
distinct []     = True
distinct (x:xs) = x `notElem` xs && distinct xs

findPacket :: String -> Int -> Int
findPacket (a:b:c:d:rest) x = if distinct [a,b,c,d] then x else findPacket (b:c:d:rest) x + 1
findPacket _ _ = -1 

findMessage :: String -> Int -> Int
findMessage (a:b:c:d:e:f:g:h:i:j:k:l:m:n:rest) x = if distinct [a,b,c,d,e,f,g,h,i,j,k,l,m,n] then x else findMessage (b:c:d:e:f:g:h:i:j:k:l:m:n:rest) x + 1
findMessage _ _ = -1 
