-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pát 21. čen 2024, 12:53
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `knihovna`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `autor`
--

CREATE TABLE `autor` (
  `id` int(10) UNSIGNED NOT NULL,
  `prijmeni` varchar(100) NOT NULL,
  `krestni_jmeno` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Vypisuji data pro tabulku `autor`
--

INSERT INTO `autor` (`id`, `prijmeni`, `krestni_jmeno`) VALUES
(1, 'Čapek', 'Karel'),
(2, 'Němcová', 'Božena'),
(3, 'Seifert', 'Jaroslav'),
(4, 'Erben', 'Karel Jaromír'),
(5, 'Poláček', 'Karel'),
(6, 'Jirásek', 'Alois'),
(7, 'Sekora', 'Ondřej'),
(8, 'Austen', 'Jane'),
(9, 'Brontë', 'Charlotte'),
(10, 'Shakespeare', 'William'),
(11, 'Christie', 'Agatha'),
(12, 'Remarque', 'Erich Maria'),
(13, 'Hesse', 'Hermann'),
(14, 'Däniken, von', 'Erich'),
(15, 'Orwell', 'George'),
(16, 'Mácha', 'Karel Hynek');

-- --------------------------------------------------------

--
-- Struktura tabulky `jazyk`
--

CREATE TABLE `jazyk` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazev` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Vypisuji data pro tabulku `jazyk`
--

INSERT INTO `jazyk` (`id`, `nazev`) VALUES
(1, 'Český jazyk'),
(2, 'Anglický jazyk'),
(3, 'Německý jazyk');

-- --------------------------------------------------------

--
-- Struktura tabulky `kniha`
--

CREATE TABLE `kniha` (
  `id` int(10) UNSIGNED NOT NULL,
  `titul` varchar(45) NOT NULL,
  `datum_vydani` int(4) NOT NULL,
  `obsah` text DEFAULT NULL,
  `autor_idautor` int(10) UNSIGNED NOT NULL,
  `jazyk_idjazyk` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Vypisuji data pro tabulku `kniha`
--

INSERT INTO `kniha` (`id`, `titul`, `datum_vydani`, `obsah`, `autor_idautor`, `jazyk_idjazyk`) VALUES
(1, 'Kytice', 1853, 'Nejznámější sbírka baladických básní, kterou Karel Jaromír Erben začal psát již jako student. Balady inspirované slovanskými i jinými pověstmi se vyznačují dějově dramatickým spádem, zatímco prostředí je vykresleno stručně, popisně...\r\n\r\nTento text byl zkopírován ze serveru: https://www.cesky-jazyk.cz/ctenarsky-denik/karel-jaromir-erben/kytice-souhrn-balad-9.html#ixzz8dFUBBd3W\r\nPublikování nebo další veřejné šíření obsahu serveru Český-jazyk.cz je bez písemného souhlasu provozovatele výslovně zakázáno! Užití výhradně jen pro osobní účely je možné.', 4, 1),
(2, 'Staré pověsti české', 1932, 'Staré pověsti české je kniha pro mládež Aloise Jiráska, ve které literárně zpracovává starší pověsti z různých období českých dějin.', 6, 1),
(3, 'Máj', 1836, 'Máj je lyrickoepická skladba Karla Hynka Máchy vydaná roku 1836. Bývá považována za vrcholné dílo českého literárního romantismu. Mácha v této skladbě zcela vybočil z obrozeneckého programu 1. poloviny 19. století a pojal ji jako osobní zpověď rozervaného romantického člověka plného nejistot a otázek po smyslu života.', 16, 1),
(4, 'Bylo nás pět', 1943, 'Bylo nás pět je humoristický román Karla Poláčka, ve kterém autor vzpomíná na své dětství v Rychnově nad Kněžnou. Vypravěčem a zároveň hlavním hrdinou je školák Petr Bajza. Kniha je poměrně volným sledem jednotlivých příhod a dobrodružství, jež potkávají vypravěče a jeho čtyři kamarády: Čeňka Jirsáka, Antonína Bejvala, Édu Kemlinka a Josefa Zilvara z chudobince.', 5, 1),
(5, 'Ferda Mravenec', 1936, 'Ferda si poradí s pracemi všeho druhu: zapřáhne do kočáru pana Hlemýždě, ochočí si zeleného koníka, uspořádá hostinu pro rodinu malých ploštiček, nešťastně se zamiluje a nakonec jen taktak unikne nespravedlivému výprasku a uprchne do světa. Ale Ferda by nebyl Ferda, kdyby si neporadil s krvežíznivým Ťutínkem i s mravencožravou paní Střevlíkovou, a nakonec postaví larvičkám chrostíků tak krásné podvodní domečky, že si vyslouží svobodu a vrátí se do rodného mraveniště! Tam se vrhne do vymýšlení všelijakých zlepšováků, ať už při lovu divokých mšic nebo čištění chodeb mraveniště. Mraveniště přepadnou loupežní cizí mravenci, ale pak se vše vysvětlí a příběh končí hromadnou svatbou.', 7, 1),
(6, 'Babička', 1855, 'Babička s podtitulem Obrazy venkovského života je nejznámější dílo Boženy Němcové, poprvé vydané roku 1855.[1] Vymyká se jednoduchým žánrovým, směrovým a tematickým interpretacím.[5] Žánrově bývá označováno za idylu,[3] novelu,[2] povídkový obraz,[1] soubor črt[6] nebo za román.[4] Někteří literární historikové ji přiřazují k romantismu,[7] jiní k biedermeieru[8] nebo realismu.[9] Kniha má podobu idealizovaného vzpomínání na dětství v Ratibořickém údolí, popisuje lidové zvyky, vesnický způsob života a obyčejné i výjimečné události, přičemž jednotlivé epizody spojuje postava babičky, laskavé, moudré a zbožné ženy, které si váží všichni lidé v jejím okolí.', 2, 1),
(7, 'Píseň o Viktorce', 1950, 'Píseň o Viktorce je básnická skladba, kterou v roce 1950 vydal básník Jaroslav Seifert ke 130. výročí narození spisovatelky Boženy Němcové. Jedná se o autorovo první ucelené poválečné dílo. Nebyla to tak ani kolekce příležitostných veršů, ani básnickým komentářem k výtvarným dílům. Svou tematikou i poetikou se zařazuje do básníkova hlavního vývojového směřování, které navazuje na válečná díla.', 3, 1),
(8, 'Dášeňka čili život štěněte', 1933, 'Dášeňka čili život štěněte je kniha pro děti z roku 1933, kterou napsal, ilustroval a fotografiemi doprovodil Karel Čapek. Vypráví o narození a růstu štěňátka – foxteriéra Dášeňky, obsahuje také psí pohádky a bajky.', 1, 1),
(9, 'Pride and Prejudice', 1813, 'Pride and Prejudice is the second novel by English author Jane Austen, published in 1813. A novel of manners, it follows the character development of Elizabeth Bennet, the protagonist of the book, who learns about the repercussions of hasty judgments and comes to appreciate the difference between superficial goodness and actual goodness.', 8, 2),
(10, 'Jane Eyre', 1847, 'Jane Eyre is a novel by the English writer Charlotte Brontë. It was published under her pen name \"Currer Bell\" on 19 October 1847 by Smith, Elder & Co. of London. The first American edition was published the following year by Harper & Brothers of New York.[2] Jane Eyre is a bildungsroman that follows the experiences of its eponymous heroine, including her growth to adulthood and her love for Mr Rochester, the brooding master of Thornfield Hall.[3]', 9, 2),
(11, 'Romeo and Juliet', 1597, 'Romeo and Juliet is a tragedy written by William Shakespeare early in his career about the romance between two Italian youths from feuding families.', 10, 2),
(12, 'Murder on the Orient Express', 1934, 'The elegant train of the 1930s, the Orient Express, is stopped by heavy snowfall. A murder is discovered, and Poirot\'s trip home to London from the Middle East is interrupted to solve the case. The opening chapters of the novel take place primarily in Istanbul. The rest of the novel takes place in Yugoslavia, with the train trapped between Vinkovci and Brod, in what is now northeastern Croatia.', 11, 2),
(13, 'Im Westen nichts Neues', 1928, 'Im Westen nichts Neues ist ein 1928 verfasster Roman von Erich Maria Remarque, der die Schrecken des Ersten Weltkriegs aus der Sicht eines jungen Soldaten schildert. Obwohl Remarque selbst das Buch als unpolitisch bezeichnete, ist es als Antikriegsroman zu einem Klassiker der Weltliteratur geworden. Der Roman wird in der Literaturwissenschaft überwiegend der Neuen Sachlichkeit zugeordnet.', 12, 3),
(14, 'Der Steppenwolf', 1927, 'Der Steppenwolf ist ein 1927 erschienener Roman von Hermann Hesse. Die Erzählung schildert die Erlebnisse der Hauptfigur Harry Haller, eines Alter Egos des Verfassers. Ähnlichkeiten der Figur Hallers zu Hermann Hesse sowie etwa zum Faust von Johann Wolfgang von Goethe werden im Text mehrfach angedeutet oder sind offensichtlich, zum Beispiel stimmen die Initialen von Harry Haller und Hermann Hesse überein.', 13, 3),
(15, 'Zurück zu den Sternen', 1969, 'Im Vorliegenden Buch geht es um die Frage, warum der Mensch ins All aufbrechen will. ', 14, 3),
(16, 'Nineteen Eighty-Four', 1949, 'Nineteen Eighty-Four (also published as 1984) is a dystopian novel and cautionary tale by English writer George Orwell. It was published on 8 June 1949 by Secker & Warburg as Orwell\'s ninth and final book completed in his lifetime. Thematically, it centres on the consequences of totalitarianism, mass surveillance, and repressive regimentation of people and behaviours within society.', 15, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `zanr`
--

CREATE TABLE `zanr` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazev` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Vypisuji data pro tabulku `zanr`
--

INSERT INTO `zanr` (`id`, `nazev`) VALUES
(1, 'Česká klasika'),
(3, 'Beletrie'),
(4, 'Literatura faktu'),
(5, 'Populárně naučná'),
(6, 'Dobrodružství'),
(7, 'Romantika'),
(8, 'Fantasy'),
(9, 'Filozofie'),
(10, 'Krimi'),
(11, 'Humor'),
(12, 'Horor'),
(13, 'Historický román'),
(14, 'Válečný román'),
(15, 'Dětská literatura'),
(16, 'Lyrická skladba');

-- --------------------------------------------------------

--
-- Struktura tabulky `zanr_has_kniha`
--

CREATE TABLE `zanr_has_kniha` (
  `zanr_idzanry` int(10) UNSIGNED NOT NULL,
  `kniha_idkniha` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Vypisuji data pro tabulku `zanr_has_kniha`
--

INSERT INTO `zanr_has_kniha` (`zanr_idzanry`, `kniha_idkniha`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 6),
(6, 4),
(7, 9),
(7, 10),
(8, 16),
(9, 14),
(9, 15),
(10, 12),
(14, 13),
(15, 5),
(15, 8),
(16, 7);

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `jazyk`
--
ALTER TABLE `jazyk`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `kniha`
--
ALTER TABLE `kniha`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kniha_autor_idx` (`autor_idautor`),
  ADD KEY `fk_kniha_jazyk1_idx` (`jazyk_idjazyk`);

--
-- Indexy pro tabulku `zanr`
--
ALTER TABLE `zanr`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `zanr_has_kniha`
--
ALTER TABLE `zanr_has_kniha`
  ADD PRIMARY KEY (`zanr_idzanry`,`kniha_idkniha`),
  ADD KEY `fk_zanr_has_kniha_kniha1_idx` (`kniha_idkniha`),
  ADD KEY `fk_zanr_has_kniha_zanr1_idx` (`zanr_idzanry`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pro tabulku `jazyk`
--
ALTER TABLE `jazyk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `kniha`
--
ALTER TABLE `kniha`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pro tabulku `zanr`
--
ALTER TABLE `zanr`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `kniha`
--
ALTER TABLE `kniha`
  ADD CONSTRAINT `fk_kniha_autor` FOREIGN KEY (`autor_idautor`) REFERENCES `autor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kniha_jazyk1` FOREIGN KEY (`jazyk_idjazyk`) REFERENCES `jazyk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `zanr_has_kniha`
--
ALTER TABLE `zanr_has_kniha`
  ADD CONSTRAINT `fk_zanr_has_kniha_kniha1` FOREIGN KEY (`kniha_idkniha`) REFERENCES `kniha` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_zanr_has_kniha_zanr1` FOREIGN KEY (`zanr_idzanry`) REFERENCES `zanr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
