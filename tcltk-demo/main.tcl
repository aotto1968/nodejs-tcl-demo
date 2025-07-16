# Main script for TextMirror Inc. in Tcl/Tk

package require Tk

# Create main window
# (Root window is already '.')
wm title . "TextMirror Inc. - Text-Mirroring"
wm geometry . 800x420

# Logo and header
frame .header -background #007bff
grid .header -row 0 -column 0 -columnspan 2 -sticky new

if {[file exists logo.png]} {
    image create photo logo -file logo.png
    label .header.logo -image logo -background #007bff
    pack .header.logo -side left -padx 10 -pady 10
}
label .header.title -text "TextMirror Inc." -font {Arial 20 bold} -foreground white -background #007bff
pack .header.title -side left -pady 10

# Main area with two panels side by side
frame .body
grid .body -row 1 -column 0 -columnspan 2 -sticky nsew

# Grid configuration for even distribution
grid columnconfigure . 0 -weight 1
grid columnconfigure . 1 -weight 1
grid rowconfigure . 1 -weight 1

# Create panel frames (left/right)
frame .body.left -relief ridge -bd 2
frame .body.right -relief ridge -bd 2
grid .body.left -in .body -row 0 -column 0 -padx {10 5} -pady 10 -sticky nsew
grid .body.right -in .body -row 0 -column 1 -padx {5 10} -pady 10 -sticky nsew

# Allow panels to grow evenly
grid columnconfigure .body 0 -weight 1
grid columnconfigure .body 1 -weight 1
grid rowconfigure .body 0 -weight 1

# Common options for both text fields (no fixed width/height)
set textopts "-font {Arial 12} -wrap word -background white -foreground #333 -borderwidth 2 -relief solid -padx 4 -pady 4"

# Left panel (input)
label .body.left.label -text "Input" -font {Arial 14 bold} -foreground #007bff
grid .body.left.label -in .body.left -row 0 -column 0 -sticky w -padx 10 -pady 5
text .body.left.input {*}$textopts
grid .body.left.input -in .body.left -row 1 -column 0 -padx 10 -pady 10 -sticky nsew
grid rowconfigure .body.left 1 -weight 1
grid columnconfigure .body.left 0 -weight 1

# Right panel (output)
label .body.right.label -text "Mirrored Text" -font {Arial 14 bold} -foreground #007bff
grid .body.right.label -in .body.right -row 0 -column 0 -sticky w -padx 10 -pady 5
text .body.right.output {*}$textopts -state disabled
grid .body.right.output -in .body.right -row 1 -column 0 -padx 10 -pady 10 -sticky nsew
grid rowconfigure .body.right 1 -weight 1
grid columnconfigure .body.right 0 -weight 1

# Function to mirror the text
proc spiegel_text {} {
    set input [.body.left.input get 1.0 end-1c]
    set gespiegelt [string reverse $input]
    .body.right.output configure -state normal
    .body.right.output delete 1.0 end
    .body.right.output insert end $gespiegelt
    .body.right.output tag add all 1.0 end
    .body.right.output tag configure all -foreground #333 -justify right
    .body.right.output configure -state disabled
}

# Event binding: mirror on every change
bind .body.left.input <KeyRelease> {spiegel_text}

# Set focus to input field
after 100 {focus .body.left.input} 