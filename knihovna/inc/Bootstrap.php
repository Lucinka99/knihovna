<?php 
define("PROJECT_ROOT_PATH", __DIR__ . "/../"); /*Nastavení konstanty pro cestu ke kořenovému adresáři */

/*Načítání souborů */
require_once PROJECT_ROOT_PATH . "/inc/Config.php";
require_once PROJECT_ROOT_PATH . "/Controller/Api/Controller.php";
require_once PROJECT_ROOT_PATH . "/Controller/Api/CoreController.php";
require_once PROJECT_ROOT_PATH . "/Service/BookService.php";
?>
