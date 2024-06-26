<?php 
require_once __DIR__ . "/CoreController.php"; /*Načtení souboru se základní třídou */

class LibraryController extends CoreController /*Dědění z CoreController */
{
    function handleRequest()
    {
        $errorMsg = ''; /*Proměnná pro ukládání chybových zpráv */
        $requestMethod = $_SERVER['REQUEST_METHOD'];
        $queryParams = $this->getQueryParams(); /*zavolání metody, která nám vrátí pole s parametry dotazu z URL */

        if (strtoupper($requestMethod) == 'GET') { /*Kontrola, zda se jedná o požadavek GET; převod na velká písmena */
            try { /*Zkouší vykonat kód a chytit případné vyjímky. */
                $bookService = new BookService();
                $limit = isset($queryParams['limit']) ? intval($queryParams['limit']) : 10;
                $books = $bookService->fetchBooks($limit); /*Volání fetchbooks z Bookservice pro získání daného limitu */
                $responseData = json_encode($books); /*převedení pole knih na JSON */
            } catch (Exception $e) { /*Zachytí vyjímku, která může nastat během vykonání kódu try */
                $errorMsg = $e->getMessage().' Něco se pokazilo!';
                $errorHeader = 'HTTP/1.1 500 Chyba serveru';
            }
        } else { /*pokud metoda požadavku není get */
            $errorMsg = 'Nepodporovaná metoda';
            $errorHeader = 'HTTP/1.1 422 Nelze zpracovat požadavek';
        }

        if (empty($errorMsg)) { /*V případě, že není žádná chybová zpráva se odešle 200 OK */
            $this->output($responseData, array('Content-Type: application/json', 'HTTP/1.1 200 OK'));
        } else { /*Pokud chybová zpráva existuje, vypíšeme chybovou zprávu s odpovídající hlavičku */
            $this->output(json_encode(array('error' => $errorMsg)), array('Content-Type: application/json', $errorHeader));
        }
    }
}
?>
