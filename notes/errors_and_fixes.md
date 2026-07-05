## Caesar Cipher wraparound

Initial issue: I compared a character string to an integer after using `.chr`.

Fix: keep the value as an integer while checking ASCII ranges, then convert back to a character with `.chr` after the wraparound logic.