@echo off
echo Geben sie die Video-URL ein 
set /P eingabe="Url: "
youtube-dl -f best -i %eingabe% -o "Heruntergeladene Videos/%%(title)s.%%(ext)s"
PAUSE