@echo off

:Anfang
echo Wollen Sie mehrere Videos aus "Videos(URL).txt" herunterladen? [j/n]
set /P JaNein="j/n: "
if not "%JaNein%" == "j" if not "%JaNein%" == "n" echo Bitte schreiben Sie Ja oder Nein in die Konsole&&goto Anfang

if not "%JaNein%" == "j" goto Nein




cls
:Ja
:j_q
echo Welche Qualitaet brauchen Sie? (1080p (mp4) [1], beste Aufloesung [2], selber entscheiden [3])
set /P Formatn="Nummer:
if not "%Formatn%" == "1" if not "%Formatn%" == "2" if not "%Formatn%" == "3" echo Bitte schreiben Sie eine Zahl zwischen 1-3 in die Konsole&&goto j_q
cls

if "%Formatn%" == "2" goto j_q2

if "%Formatn%" == "1" goto j_q1
goto j_q3



:j_q1
youtube-dl -a Videos(URL).txt -f "bestvideo[ext=mp4,height<=1080]+bestaudio[ext=m4a]/best[height<=1080]" -o "Heruntergeladene Videos/%%(title)s.%%(ext)s"
goto Fertig

:j_q2
echo Wollen Sie die Dateien in mp4-Dateien umwandeln? (Dauert eine Weile/ nicht empfohlen) [j/n]
set /P Variable="j/n:
if not "%Variable%" == "j" if not "%Variable%" == "n" echo Bitte schreiben j für Ja oder n für Nein in die Konsole&&goto j_q2
if not "%Variable%" == "n" set Variable=--recode-video mp4&&goto j_q2_rec
set Variable=
:j_q2_rec
youtube-dl -a Videos(URL).txt -f bestvideo+bestaudio/best %Variable% -o "Heruntergeladene Videos/%%(title)s.%%(ext)s"
goto Fertig












:j_q3
youtube-dl -F -a Videos(URL).txt

:j_q3_merge
echo.
echo Wollen Sie die Audiospur und Videospur zusammenfuegen? [j/n]
set /P eingabe3="j/n: "
if not "%eingabe3%" == "j" if not "%eingabe3%" == "n" echo Bitte schreiben j für Ja oder n für Nein in die Konsole&&goto j_q3_merge
if "%eingabe3%" == "n" goto j_q3_merge_n

echo Welches Audioformat wollen Sie?
set /P eingabe="Format Nummer: "
echo Welches Videoformat wollen Sie?
set /P eingabe2="Format Nummer: "
:j_q3_merge_j_rec
echo Wollen Sie die Dateien in mp4-Datein umwandeln (Dauert eine Weile/ nicht empfohlen) [j/n]
set /P Variable="j/n:
if not "%Variable%" == "j" if not "%Variable%" == "n" echo Bitte schreiben j für Ja oder n für Nein in die Konsole&&goto j_q3_merge_j_rec
if not "%Variable%" == "n" set Variable=--recode-video mp4&&goto j_q3_rec
set Variable=
:j_q3_rec
youtube-dl -a Videos(URL).txt -f %eingabe2%+%eingabe% %Variable% -o "Heruntergeladene Videos/%%(title)s.%%(ext)s"
goto Fertig

:j_q3_merge_n
echo Welches Audioformat wollen Sie?
set /P eingabe="Format Nummer: "
:j_q3_merge_n_rec
echo Wollen Sie die Datei in eine mp4-Datei umwandeln (Dauert eine Weile/ nicht empfohlen) [j/n]
set /P Variable="j/n:
if not "%Variable%" == "j" if not "%Variable%" == "n" echo Bitte schreiben j für Ja oder n für Nein in die Konsole&&goto j_q3_merge_n_rec
if not "%Variable%" == "n" set Variable=--recode-video mp4&&goto j_q3_merge_n_rec_j
set Variable=
:j_q3_merge_n_rec_j
youtube-dl -a Videos(URL).txt -f %eingabe% %Variable% -o "Heruntergeladene Videos/%%(title)s.%%(ext)s"
goto Fertig


















:Nein

cls
echo Fügen Sie die Youtube URL ein (Bsp.: https://www.youtube.com/watch?v=72QAAOaYW2M, https://youtu.be/72QAAOaYW2M)
set /P URL="URL: "
cls

:n_q
echo Welche Qualitaet brauchen Sie? (1080p (mp4) [1], beste Aufloesung [2], selber entscheiden [3])
set /P Formatn="Nummer:
if not "%Formatn%" == "1" if not "%Formatn%" == "2" if not "%Formatn%" == "3" echo Bitte schreiben Sie eine Zahl zwischen 1-3 in die Konsole&&goto n_q
cls

if "%Formatn%" == "2" goto n_q2

if "%Formatn%" == "1" goto n_q1
goto n_q3



:n_q1
youtube-dl -i %URL% -f "bestvideo[ext=mp4,height<=1080]+bestaudio[ext=m4a]/best[height<=1080]" -o "Heruntergeladene Videos/%%(title)s.%%(ext)s"
goto Fertig

:n_q2
echo Wollen Sie die Datei in eine mp4-Datei umwandeln (Dauert eine Weile/ nicht empfohlen) [j/n]
set /P Variable="j/n:
if not "%Variable%" == "j" if not "%Variable%" == "n" echo Bitte schreiben j für Ja oder n für Nein in die Konsole&&goto n_q2
if not "%Variable%" == "n" set Variable=--recode-video mp4&&goto n_q2_rec
set Variable=
:n_q2_rec
youtube-dl -i %URL% -f bestvideo+bestaudio/best %Variable% -o "Heruntergeladene Videos/%%(title)s.%%(ext)s"
goto Fertig









:n_q3
youtube-dl -i -F %URL%

:n_q3_merge
echo.
echo Wollen Sie die Audiospur und Videospur zusammenfügen? [j/n]
set /P eingabe3="j/n: "
if not "%eingabe3%" == "j" if not "%eingabe3%" == "n" echo Bitte schreiben j für Ja oder n für Nein in die Konsole&&goto n_q3_merge
if "%eingabe3%" == "n" goto n_q3_merge_n


echo Welches Audioformat wollen Sie?
set /P eingabe="Format Nummer: "
echo Welches Videoformat wollen Sie?
set /P eingabe2="Format Nummer: "
:n_q3_merge_j_rec
echo Wollen Sie die Datei in eine mp4-Datei umwandeln (Dauert eine Weile/ nicht empfohlen) [j/n]
set /P Variable="j/n:
if not "%Variable%" == "j" if not "%Variable%" == "n" echo Bitte schreiben j für Ja oder n für Nein in die Konsole&&goto n_q3_merge_j_rec
if not "%Variable%" == "n" set Variable=--recode-video mp4&&goto n_q3_merge_j_rec_j
set Variable=
:n_q3_merge_j_rec_j
youtube-dl -i %URL% -f %eingabe2%+%eingabe% %Variable% -o "Heruntergeladene Videos/%%(title)s.%%(ext)s"
goto Fertig

:n_q3_merge_n
echo Welches Videoformat/Audioformat wollen Sie?
set /P eingabe="Format Nummer: "
:n_q3_merge_n_rec
echo Wollen Sie die Datei in eine mp4-Datei umwandeln (Dauert eine Weile/ nicht empfohlen) [j/n]
set /P Variable="j/n:
if not "%Variable%" == "j" if not "%Variable%" == "n" echo Bitte schreiben j für Ja oder n für Nein in die Konsole&&goto n_q3_merge_n_rec
if not "%Variable%" == "n" set Variable=--recode-video mp4&&goto n_q3_merge_n_rec_j
set Variable=
:n_q3_merge_n_rec_j
youtube-dl -i %URL% -f %eingabe% %Variable% -o "Heruntergeladene Videos/%%(title)s.%%(ext)s"
goto Fertig










:Fertig


if errorlevel 1 goto error
goto Test
:error
echo.
echo.
echo.
echo.
echo.
echo.
echo Es gab einen Fehler
echo Bitte überprüfen Sie Ihre Angaben!
echo.
PAUSE
goto Ende12

:Test

echo.
echo.
echo.
echo.
echo.
echo.
echo  ... ( ...
echo  ... )) ..
echo  .. ((( ..
echo   (""""")
echo  . \___/ .
echo.
echo.
echo.
echo Das Herunterladen war erfolgreich!
PAUSE
:Ende12