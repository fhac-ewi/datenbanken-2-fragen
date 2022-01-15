#!/bin/sh


# Clear or Create file Fragenkatalog
> Fragenkatalog.md

# For every folder D in folder "Fragenkatalog"
find "Fragenkatalog" -type d | sort -n | while read -r D
do
    echo "$D"
    # Print Heading for Folder
    echo "$D" | sed -e 's/:$//' -e 's/[^\/]*\/[0-9]*/#/g' -e 's/^/#/' >> Fragenkatalog.md # TODO Space nach Überschrift einfügen -e 's/^##*\([ ]*\)/ /1' 
    
    # for every file F in folder D
    find "$D" -name "*.md" -maxdepth 1 -type f | sort -n | while read -r F
    do
        echo "Appending file $F"
        echo "Fragen aus der Datei [$(basename "$F" .md)](./$(echo "$F" | sed -e 's/(/%28/g' -e 's/)/%29/g' -e 's/ /%20/g'))."  >> Fragenkatalog.md
        escapedFolder=$(echo "$D" | sed -e 's/(/%28/g' -e 's/)/%29/g' -e 's/ /%20/g')
        cat "$F" | sed -e '0,/#/s/^##*.*/<details><summary><b>&<\/b><\/summary>\n<table><tr><td>\n/' \
                -e 's/^##*.*/<\/td><\/tr><\/table>\n<\/details>\n<details><summary><b>&<\/b><\/summary>\n<table><tr><td>\n/' \
                -e 's/<summary><b>#[ ]*/<summary><b>/g' \
                -e "s|(\./|(\./$escapedFolder/|g" \
                -e '$a<\/td><\/tr><\/table>\n</details>\n' >> Fragenkatalog.md
    done
done

echo "\n\nGeneriert am $(LANG=de_DE date)" >> Fragenkatalog.md
