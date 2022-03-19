# _t
Simple JSON-based i18n for Game Maker Studio 2

## Configuration
See `_tConfig`

## Setup
Place JSON files in the chosen language directory, by default this is `/lang`.

On game startup, call `_tInit()`.

## API

### _t(key)
Returns string for given key in currently set language

### _t_setLang(lang)
Loads lang JSON file and sets it to the current language
