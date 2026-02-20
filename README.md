# Simple Cube

A minimal **Godot → HTML5 → itch.io** release pipeline demo.

The main purpose of this repository is to document a clear workflow for shipping small web games, from the Godot editor to a published itch.io page.

## Try it

Play the published version here:

- https://codawatt.itch.io/simplecube

## Goal of this project

This project was built to validate an end-to-end release process:

1. Build/export from Godot.
2. Test the exported files locally in a browser.
3. Upload with Butler to itch.io.
4. Verify sizing/scaling behavior on the itch.io page.

A key challenge during development was viewport size and page scaling. The best result came from using a larger project resolution and letting Godot + browser scaling reduce it for smaller windows.

## Local development run

From your exported web build folder (example path shown below), run a local static server:

```bash
cd ~/code/itch-butler-demo/release/
python3 -m http.server 8000
```

Then open:

- http://localhost:8000/

## itch.io Butler pipeline

Push the exported release folder to your itch.io channel:

```bash
butler push ~/code/itch-butler-demo/release/ codawatt/simplecube:html5 --userversion 0.0.x
```

Notes:

- Replace `0.0.x` with your release version.
- Keep `:html5` as the channel for your web build.

## HTML/CSS sizing notes

The following page styles worked best for keeping the game centered and letterboxed while preserving aspect ratio:

```css
html, body {
	margin: 0;
	height: 100%;
	width: 100%;
	background: #000;
	overflow: hidden;
}

body {
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
	touch-action: none;
}

#canvas {
	display: block;
	max-width: 100vw;
	max-height: 100vh;
	width: auto;
	height: auto;
	object-fit: contain;
}
```

## Recommended resolution strategy

Best visual results in this project came from a high internal target resolution:

- **3840×2160** (4K)

Then let engine/browser scaling adapt to the user display size.

Reference:

- https://docs.godotengine.org/en/stable/tutorials/rendering/multiple_resolutions.html

## Suggested release checklist

- [ ] Export HTML5 build from Godot.
- [ ] Run local server and test in browser (`python3 -m http.server 8000`).
- [ ] Confirm canvas/page scaling behavior.
- [ ] Upload with Butler.
- [ ] Open itch.io page and verify final presentation.
