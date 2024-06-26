# knihovna API

Jednoduché API vracející obsah databáze knihovna, která obsahuje 16 titulů.

# složky
- Controller
  - Api (obsahuje kontrolery, které zpracovávají HTTP požadavky)
- inc (obsahuje inicializační a konfigurační soubory)
- Service (logika pro práci s databází)
(samotné soubory)
index.php (hlavní vstupní bod aplikace)
knihovna.sql (script databáze)

# Volání

http://localhost/knihovna/index.php/kniha/list?limit=5
