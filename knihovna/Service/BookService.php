<?php 
require_once PROJECT_ROOT_PATH . "/Service/Database.php"; /*Načtení souboru Database.php */

class BookService extends Database /*Definice třídy BookService, která dědí z Database */
{
    public function fetchBooks($limit) /*Funkce pro získání knih s limitem */
    {                                   /*Volána metoda select; výběr všeho z tabulky kniha a seřazení dat vzestupně; počet vrácených řádků je omezen limitem */
        return $this->select("SELECT * FROM kniha ORDER BY id ASC LIMIT ?", ["i", $limit]);
    }

    
}
?>
