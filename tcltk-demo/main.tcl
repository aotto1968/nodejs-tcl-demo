# Hauptskript für TextMirror Inc. in Tcl/Tk

package require Tk

# Standard-Tk-Fenster ausblenden
wm withdraw .

# Fenster erstellen
toplevel .main
wm title .main "TextMirror Inc. - Text-Spiegelung"
wm geometry .main 800x420

# Logo und Überschrift (Header)
frame .main.header -background #007bff
grid .main.header -row 0 -column 0 -columnspan 2 -sticky new

if {[file exists logo.png]} {
    image create photo logo -file logo.png
    label .main.header.logo -image logo -background #007bff
    pack .main.header.logo -side left -padx 10 -pady 10
}
label .main.header.title -text "TextMirror Inc." -font {Arial 20 bold} -foreground white -background #007bff
pack .main.header.title -side left -pady 10

# Hauptbereich mit zwei Panels nebeneinander
frame .main.body
grid .main.body -row 1 -column 0 -columnspan 2 -sticky nsew

# Grid-Konfiguration für gleichmäßige Verteilung
grid columnconfigure .main 0 -weight 1
grid columnconfigure .main 1 -weight 1
grid rowconfigure .main 1 -weight 1

# Panel-Frames (links/rechts) erzeugen
frame .main.body.left -relief ridge -bd 2
frame .main.body.right -relief ridge -bd 2
grid .main.body.left -in .main.body -row 0 -column 0 -padx {10 5} -pady 10 -sticky nsew
grid .main.body.right -in .main.body -row 0 -column 1 -padx {5 10} -pady 10 -sticky nsew

# Panels gleichmäßig wachsen lassen
grid columnconfigure .main.body 0 -weight 1
grid columnconfigure .main.body 1 -weight 1
grid rowconfigure .main.body 0 -weight 1

# Gemeinsame Optionen für beide Textfelder (ohne feste Breite/Höhe)
set textopts "-font {Arial 12} -wrap word -background white -foreground #333 -borderwidth 2 -relief solid -padx 4 -pady 4"

# Linkes Panel (Eingabe)
label .main.body.left.label -text "Input" -font {Arial 14 bold} -foreground #007bff
grid .main.body.left.label -in .main.body.left -row 0 -column 0 -sticky w -padx 10 -pady 5
text .main.body.left.input {*}$textopts
grid .main.body.left.input -in .main.body.left -row 1 -column 0 -padx 10 -pady 10 -sticky nsew
grid rowconfigure .main.body.left 1 -weight 1
grid columnconfigure .main.body.left 0 -weight 1

# Rechtes Panel (Ausgabe)
label .main.body.right.label -text "Mirrored Text" -font {Arial 14 bold} -foreground #007bff
grid .main.body.right.label -in .main.body.right -row 0 -column 0 -sticky w -padx 10 -pady 5
text .main.body.right.output {*}$textopts -state disabled
grid .main.body.right.output -in .main.body.right -row 1 -column 0 -padx 10 -pady 10 -sticky nsew
grid rowconfigure .main.body.right 1 -weight 1
grid columnconfigure .main.body.right 0 -weight 1

# Funktion zum Spiegeln des Textes
proc spiegel_text {} {
    set input [.main.body.left.input get 1.0 end-1c]
    set gespiegelt [string reverse $input]
    .main.body.right.output configure -state normal
    .main.body.right.output delete 1.0 end
    .main.body.right.output insert end $gespiegelt
    .main.body.right.output tag add all 1.0 end
    .main.body.right.output tag configure all -foreground #333 -justify right
    .main.body.right.output configure -state disabled
}

# Event-Bindung: Bei jeder Änderung spiegeln
bind .main.body.left.input <KeyRelease> {spiegel_text}

# Fokus auf Eingabefeld setzen
after 100 {focus .main.body.left.input} 