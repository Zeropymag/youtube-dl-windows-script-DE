@echo off
echo Fuegen Sie die Youtube URL ein (Bsp.: https://www.youtube.com/watch?v=72QAAOaYW2M, https://youtu.be/72QAAOaYW2M)
set /P eingabe="Url: "
youtube-dl -f bestaudio -i %eingabe% -o "Heruntergeladene Videos/%%(title)s.%%(ext)s"

PAUSE