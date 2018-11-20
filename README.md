# Emoji-Cuts

Shortcuts for emojis! This script will allow you to write emojis slack-style on Mac OS programs like Messages, Notes, and more.

**Before running the script, make sure Terminal is the only application running**

* `bin/emoji-cut` creates all of the shortcuts for you. If you run this command bare, it will add all of the emoji shortcuts for you. **Update:** If you want to add other aliases to your filesystem, you can feed a JSON file to this command, i.e. `bin/emoji-cut ./path/to/file.json`. The file must be formatted like so:

```json
{
  "some-key": "some-value",
  "another-key": "another-value"
}
```

* `bin/reset` will remove all of your aliases

## Usage

Shortcuts will be available in Mac OS applications (i.e. Messages) **_once you restart them_**. Emojis will be available slack-style:

Example: `:joy:` will output `😂`

To lookup an emoji's alias, refer to the emojis.json file

Happy shortcutting 🤓
