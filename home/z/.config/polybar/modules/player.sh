 export title=$(mocp -Q %file | cut -d '/' -f 6 | cut -d '.' -f 1)

if [ -z "$title" ]; then
  echo "player not running"
else
  echo $title
fi

