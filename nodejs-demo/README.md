# Node.js Demo – TextMirror Inc.

This is the Node.js (Express) version of the TextMirror Inc. demo. It provides a simple web application with two panels: the left panel is for text input, and the right panel displays the mirrored (reversed) text. The app also features a company logo in the header.

## How to Run

1. Make sure you have Node.js (v14 or higher) and npm installed.
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the server:
   ```bash
   npm start
   ```
4. Open your browser and go to [http://localhost:3000](http://localhost:3000)

## Features
- Live text mirroring: as you type in the left field, the reversed text appears on the right.
- Modern, responsive layout with company branding.
- Simple, clean codebase for easy understanding and migration.

## Project Structure
- `public/` – Static frontend files (HTML, CSS, JS, logo)
- `server.js` – Express server
- `package.json` – Project metadata and dependencies

---

For a desktop version and migration story, see the main repository README.
