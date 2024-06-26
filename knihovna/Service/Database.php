<?php 
class Database
{
    protected $connection; /*Proměnná obsahující připojení k databázi */

    public function __construct()
    {       /*Chytáme případné vyjímky, které mohou nastat při spojení s databází */
        try {                   /*připojení pomocí konstant definovaných v config.php */
            $this->connection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
                /*Kontrola, zda-li se nevyskytla chyba */
            if (mysqli_connect_errno()) {
                throw new Exception("Nepodařilo se připojit k databázi");
            }
            /*Pokud se vyskytla vyjímka, vypiš chybovou zprávu */
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
    /*Funkce určená k provedení dotazu select */
    protected function select($query, $params = [])
    {
        try {  /*volání metody prepare and execute; připravený SQL dotaz se vrátí jako asociativní pole */
            $statement = $this->prepareAndExecute($query, $params);
            $result = $statement->get_result()->fetch_all(MYSQLI_ASSOC);
            $statement->close();
            return $result;
        } 
        /*chytání vyjímek a vypisování chybové zprávy */
        catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    /*Funkce pro přípravu a provedení dotazu */
    private function prepareAndExecute($query, $params)
    {
        try {       /*příprava SQL dotazu */
            $stmt = $this->connection->prepare($query); /*pokud se příprava nepovede - vypíše se vyjímka */
            if ($stmt === false) {
                throw new Exception("Neúspěšná příprava dotazu: " . $query);
            }
            if ($params) { /*pokud jsou parametry předány, budou svázány prostřednictvím bind_param */
                $stmt->bind_param(...$params);
            }
            /*provedení dotazu */
            $stmt->execute();
            return $stmt;
        } 
        /*zachytávání vyjímek a vypisování chybových zpráv */
        catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}
?>
