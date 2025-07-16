# Main script for TextMirror Inc. in Tcl/Tk

package require Tk

# Hide standard Tk window
wm withdraw .

# Create main window
toplevel .main
wm title .main "TextMirror Inc. - Text-Spiegelung"
wm geometry .main 800x420

# Logo and header
frame .main.header -background #007bff
grid .main.header -row 0 -column 0 -columnspan 2 -sticky new

if {[file exists logo.png]} {
    image create photo logo -file logo.png
    label .main.header.logo -image logo -background #007bff
    pack .main.header.logo -side left -padx 10 -pady 10
}
label .main.header.title -text "TextMirror Inc." -font {Arial 20 bold} -foreground white -background #007bff
pack .main.header.title -side left -pady 10

# Main area with two panels side by side
frame .main.body
grid .main.body -row 1 -column 0 -columnspan 2 -sticky nsew

# Grid configuration for even distribution
grid columnconfigure .main 0 -weight 1
grid columnconfigure .main 1 -weight 1
grid rowconfigure .main 1 -weight 1

# Create panel frames (left/right)
frame .main.body.left -relief ridge -bd 2
frame .main.body.right -relief ridge -bd 2
grid .main.body.left -in .main.body -row 0 -column 0 -padx {10 5} -pady 10 -sticky nsew
grid .main.body.right -in .main.body -row 0 -column 1 -padx {5 10} -pady 10 -sticky nsew

# Allow panels to grow evenly
grid columnconfigure .main.body 0 -weight 1
grid columnconfigure .main.body 1 -weight 1
grid rowconfigure .main.body 0 -weight 1

# Common options for both text fields (no fixed width/height)
set textopts "-font {Arial 12} -wrap word -background white -foreground #333 -borderwidth 2 -relief solid -padx 4 -pady 4"

# Left panel (input)
label .main.body.left.label -text "Input" -font {Arial 14 bold} -foreground #007bff
grid .main.body.left.label -in .main.body.left -row 0 -column 0 -sticky w -padx 10 -pady 5
text .main.body.left.input {*}$textopts
grid .main.body.left.input -in .main.body.left -row 1 -column 0 -padx 10 -pady 10 -sticky nsew
grid rowconfigure .main.body.left 1 -weight 1
grid columnconfigure .main.body.left 0 -weight 1

# Right panel (output)
label .main.body.right.label -text "Mirrored Text" -font {Arial 14 bold} -foreground #007bff
grid .main.body.right.label -in .main.body.right -row 0 -column 0 -sticky w -padx 10 -pady 5
text .main.body.right.output {*}$textopts -state disabled
grid .main.body.right.output -in .main.body.right -row 1 -column 0 -padx 10 -pady 10 -sticky nsew
grid rowconfigure .main.body.right 1 -weight 1
grid columnconfigure .main.body.right 0 -weight 1

# Function to mirror the text
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

# Event binding: mirror on every change
bind .main.body.left.input <KeyRelease> {spiegel_text}

# Set focus to input field
after 100 {focus .main.body.left.input} 