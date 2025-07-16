# Main script for TextMirror Inc. in Tcl/Tk

package require Tk

# Create main window
wm title . "TextMirror Inc. - Text Mirroring"
wm geometry . 600x600

# Root grid: header at the top, body below
# Header
frame .header -background #007bff -bd 0 -relief flat
label .header.logo -text "" -background #007bff
if {[file exists logo.png]} {
    image create photo logo -file logo.png
    .header.logo configure -image logo
}
pack .header.logo -side left -padx 5 -pady 5
label .header.title -text "TextMirror Inc." -font {Arial 20 bold} -foreground white -background #007bff
pack .header.title -side left -pady 5

grid .header -row 0 -column 0 -columnspan 2 -sticky nsew

# Body (left: inputs, right: output)
frame .body -bd 0 -relief flat
# Body grid: 2 columns (left/right)
grid .body -row 1 -column 0 -columnspan 2 -sticky nsew -padx 5 -pady 5

# Grid configuration for square layout
# Root
grid rowconfigure . 0 -weight 0
grid rowconfigure . 1 -weight 1
grid columnconfigure . 0 -weight 1
# .body
grid columnconfigure .body 0 -weight 1
grid columnconfigure .body 1 -weight 1
grid rowconfigure .body 0 -weight 1

# Left side: two stacked input panels
frame .body.left -relief flat -bd 1
grid .body.left -in .body -row 0 -column 0 -sticky nsew -padx 2 -pady 2
# Two rows for top/bottom
frame .body.left.top -relief flat -bd 1
grid .body.left.top -in .body.left -row 0 -column 0 -sticky nsew -padx 2 -pady 1
frame .body.left.bottom -relief flat -bd 1
grid .body.left.bottom -in .body.left -row 1 -column 0 -sticky nsew -padx 2 -pady 1
grid rowconfigure .body.left 0 -weight 1
grid rowconfigure .body.left 1 -weight 1

# Top input (blue)
label .body.left.top.label -text "Input (Blue)" -font {Arial 14 bold} -foreground #007bff
grid .body.left.top.label -in .body.left.top -row 0 -column 0 -sticky w -padx 2 -pady 1
text .body.left.top.input -font {Arial 12} -wrap word -background white -foreground #007bff -borderwidth 1 -relief solid -padx 2 -pady 2 -height 3
grid .body.left.top.input -in .body.left.top -row 1 -column 0 -sticky nsew -padx 2 -pady 1
grid rowconfigure .body.left.top 1 -weight 1

# Bottom input (green)
label .body.left.bottom.label -text "Input (Green)" -font {Arial 14 bold} -foreground #28a745
grid .body.left.bottom.label -in .body.left.bottom -row 0 -column 0 -sticky w -padx 2 -pady 1
text .body.left.bottom.input -font {Arial 12} -wrap word -background white -foreground #28a745 -borderwidth 1 -relief solid -padx 2 -pady 2 -height 3
grid .body.left.bottom.input -in .body.left.bottom -row 1 -column 0 -sticky nsew -padx 2 -pady 1
grid rowconfigure .body.left.bottom 1 -weight 1

# Right side: output
frame .body.right -relief flat -bd 1
grid .body.right -in .body -row 0 -column 1 -sticky nsew -padx 2 -pady 2
label .body.right.label -text "Mirrored Text" -font {Arial 14 bold} -foreground #007bff
grid .body.right.label -in .body.right -row 0 -column 0 -sticky w -padx 2 -pady 1
# Grid configuration for the text widget
grid columnconfigure .body.right 0 -weight 1
grid rowconfigure .body.right 1 -weight 1
text .body.right.output -font {Arial 12} -wrap word -background white -borderwidth 1 -relief solid -padx 2 -pady 2
grid .body.right.output -in .body.right -row 1 -column 0 -sticky nsew -padx 2 -pady 1

# Function to mirror both texts and show colored in output
proc mirror_both_texts {} {
    set input_blue [.body.left.top.input get 1.0 end-1c]
    set input_green [.body.left.bottom.input get 1.0 end-1c]
    set mirrored_blue [string reverse $input_blue]
    set mirrored_green [string reverse $input_green]
    .body.right.output configure -state normal
    .body.right.output delete 1.0 end
    set line 1
    if {$mirrored_blue ne ""} {
        .body.right.output insert end $mirrored_blue "blue"
        .body.right.output insert end "\n"
        .body.right.output tag add blue "$line.0" "$line.end"
        incr line
    }
    if {$mirrored_green ne ""} {
        .body.right.output insert end $mirrored_green "green"
        .body.right.output tag add green "$line.0" "$line.end"
    }
    .body.right.output tag configure blue -foreground #007bff -justify right
    .body.right.output tag configure green -foreground #28a745 -justify right
    .body.right.output configure -state disabled
}

# Bind events for both inputs
bind .body.left.top.input <KeyRelease> {mirror_both_texts}
bind .body.left.bottom.input <KeyRelease> {mirror_both_texts}

# Set focus to top input
after 100 {focus .body.left.top.input}

# Initial mirroring on startup
mirror_both_texts 