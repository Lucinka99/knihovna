<?php 
abstract class CoreController /*Definice abstraktní třídy definující základní funkce pro kontrolery */
{
    abstract protected function handleRequest(); 

    protected function getSegments() /*Funkce rozdělující URL do segmentů */
    {
        return explode('/', parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
    }

    protected function getQueryParams() /*Funkce získávající parametry z URL */
    {
        parse_str($_SERVER['QUERY_STRING'], $query);
        return $query;
    }

    protected function output($data, $headers=array()) /*Funkce pro nastavení HTTP hlaviček */
    {
        header_remove('Set-Cookie'); /*Odstraní již nastavení header */
        foreach ($headers as $header) { /*Nastavení hlaviček podle pole $headers */
            header($header);
        }
        echo $data;
        exit;
    }
}
?>
