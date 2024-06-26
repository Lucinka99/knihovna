<?php
require __DIR__ . "/inc/Bootstrap.php"; /**načtení souboru bootstrap */

$uriSegments = explode('/', parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH)); /*rozdělení URL na segementy */

/* kontrola zda-li existují 4 segmenty a zda-li tento segment není kniha nebo jestli existuje pátý element*/
if ((isset($uriSegments[3]) && $uriSegments[3] != 'kniha') || !isset($uriSegments[4])) {
    echo "Neplatný zdroj nebo metoda";
    header("HTTP/1.1 404 Not Found");
    exit();
}
/*Nová instance třídy LibraryController */
$controller = new LibraryController();
/*Kontrola zda-li má LibraryController funkci handlerequest */
if (method_exists($controller, 'handleRequest')) {
    $controller->handleRequest();
} else {
    echo "Metoda nenalezena";
    header("HTTP/1.1 404 Nenalezeno");
    exit();
}
?>
