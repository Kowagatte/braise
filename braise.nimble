# Package

version       = "0.1.0"
author        = "Nicholas Ryan"
description   = "Scanner & Bruteforce tool for Minecraft servers with RCON enabled."
license       = "MIT"
srcDir        = "src"
bin           = @["braise"]


# Dependencies

requires "nim >= 1.4.8"
requires "struct >= 0.2.0"
requires "progress >= 1.1.3"