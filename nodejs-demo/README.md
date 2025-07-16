# Node.js Demo – TextMirror Inc.

This is the Node.js (Express) version of the TextMirror Inc. demo. It provides a modern web application with two input panels on the left (top: blue, bottom: green) and a large output panel on the right. The app mirrors the text from both input fields to the right, displaying the top input in blue and the bottom input in green, both right-aligned. The app also features a company logo in the header.

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
- Live text mirroring: as you type in the left fields, the reversed text appears on the right in color.
- Modern, responsive layout with company branding.
- Simple, clean codebase for easy understanding and migration.

## Project Structure
- `public/` – Static frontend files (HTML, CSS, JS, logo)
- `server.js` – Express server
- `package.json` – Project metadata and dependencies

---

For a desktop version and migration story, see the main repository README.
