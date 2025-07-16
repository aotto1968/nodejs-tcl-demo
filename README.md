# Node.js to Tcl/Tk Demo: TextMirror Inc.

This repository demonstrates how a simple Node.js web application (with Express and browser UI) can be migrated to a desktop GUI using Tcl/Tk. It includes both the original Node.js project and the Tcl/Tk port, along with a step-by-step story of the migration process.

## Project Structure

```
nodejs-tcl-demo/
  ├── nodejs-demo/
  │   ├── package.json
  │   ├── package-lock.json
  │   ├── public/
  │   │   ├── index.html
  │   │   ├── logo.png
  │   │   ├── script.js
  │   │   └── styles.css
  │   ├── server.js
  │   └── README.md
  ├── tcltk-demo/
  │   ├── main.tcl
  │   ├── logo.png
  │   └── README.md
  └── README.md
```

## Project Overview

- **Node.js Version:** A web app with two panels: left for text input, right for mirrored (reversed) text output, and a company logo in the header. Built with Express and vanilla JS/CSS/HTML.
- **Tcl/Tk Version:** A desktop GUI with the same functionality, implemented in pure Tcl/Tk.

## How to Run

### Node.js Web App
1. Go to the `nodejs-demo` folder.
2. Install dependencies: `npm install`
3. Start the server: `npm start`
4. Open [http://localhost:3000](http://localhost:3000) in your browser.

### Tcl/Tk Desktop App
1. Go to the `tcltk-demo` folder.
2. Make sure Tcl/Tk is installed (e.g. `sudo apt install tk`).
3. Run: `tclsh main.tcl`

## Demo Story: Migration from Node.js to Tcl/Tk

This repository was created as part of a live coding session with an AI assistant. The goal was to show how a simple web-based text mirroring tool can be ported to a desktop GUI using Tcl/Tk. The process included:

- Reviewing the Node.js/Express project structure
- Designing the equivalent GUI in Tcl/Tk
- Step-by-step translation of HTML/CSS/JS logic to Tcl/Tk widgets and event handling
- Ensuring both UIs look and behave identically (mirrored text, logo, layout)
- Iterative bugfixing and layout fine-tuning (see chat transcript below)

### Key Features
- Identical layout and branding in both versions
- Live text mirroring (reversal) as you type
- Professional, modern UI in both web and desktop

## Chat Transcript (English Summary)

> The following is a summary of the interactive session between the developer and the AI assistant, showing the migration process and key decisions. (For full details, see the original chat log.)

1. **Initial Node.js Project:**
   - Web app with Express, static HTML/CSS/JS, two panels, and a logo.
2. **Request:** "Rewrite this as a Tcl/Tk desktop app."
3. **Tcl/Tk Implementation:**
   - Created a new folder, wrote `main.tcl` with two text widgets, header, and logo.
   - Ensured mirrored text logic works on key release.
   - Matched layout and styling to the web version.
4. **Bugfixing:**
   - Fixed focus, event binding, and disabled text color issues.
   - Switched from `pack` to `grid` for perfect symmetry.
   - Adjusted padding and widget expansion for pixel-perfect layout.
   - Made right text field right-aligned, as in the web version.
5. **Result:**
   - Both apps now look and behave identically.
   - The process is fully documented for English-speaking customers.

---

## How to Use This Demo
- Try both the web and desktop versions.
- Review the code and README for migration tips.
- Use the chat summary as a reference for similar migrations.

---

**Author:** [Your Name or Company]

**Contact:** [Your Contact Info] 