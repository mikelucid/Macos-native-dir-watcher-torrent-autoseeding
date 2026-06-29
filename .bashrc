#!bin/bash

#paste into ~/.bashrc

prev=$(stat -f %m ~/Downloads)
first=1
    
while true; do
  curr=$(stat -f %m ~/Downloads)
  if [ "$first" -eq 1 ]; then   
        echo "Watching for torrents...";
        first=0
  fi
  if [ "$curr" != "$prev" ]; then
    echo "New change in Downloads:"
        diff <(echo "$prev") <(echo "$curr") | grep '^>'
        prev=$curr echo "Watching ~/Downloads/ for .torrents...";
    mkdir -p ~/Documents/.transmission/seeds/ && \

    T="$(ls -t ~/Downloads | head -1)" && \
  
    if [ -z "$T" ]; then
        echo "No file found"; exit 1; 
    fi && \
    [[ "$T" == *.torrent ]] || {
         echo "Newest file is not a .torrent";
         exit 1;} && \
         mv ~/Downloads/"$T" ~/Documents/.transmission/seeds/ && \
         open -a Transmission ~/Documents/.transmission/seeds/"$T"
    prev=$curr
  fi

  sleep 1
done

fi
