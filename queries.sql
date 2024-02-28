mysql> use sakila;
Database changed
mysql> show tables;
+----------------------------+
| Tables_in_sakila           |
+----------------------------+
| actor                      |
| actor_copy                 |
| actor_info                 |
| address                    |
| category                   |
| city                       |
| country                    |
| customer                   |
| customer_list              |
| film                       |
| film_actor                 |
| film_category              |
| film_list                  |
| film_text                  |
| inventory                  |
| language                   |
| nicer_but_slower_film_list |
| payment                    |
| rental                     |
| sales_by_film_category     |
| sales_by_store             |
| staff                      |
| staff_list                 |
| store                      |
+----------------------------+
24 rows in set (0.01 sec)

mysql> desc film;
+----------------------+---------------------------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
| Field                | Type                                                                | Null | Key | Default           | Extra                                         |
+----------------------+---------------------------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
| film_id              | smallint unsigned                                                   | NO   | PRI | NULL              | auto_increment                                |
| title                | varchar(128)                                                        | NO   | MUL | NULL              |                                               |
| description          | text                                                                | YES  |     | NULL              |                                               |
| release_year         | year                                                                | YES  |     | NULL              |                                               |
| language_id          | tinyint unsigned                                                    | NO   | MUL | NULL              |                                               |
| original_language_id | tinyint unsigned                                                    | YES  | MUL | NULL              |                                               |
| rental_duration      | tinyint unsigned                                                    | NO   |     | 3                 |                                               |
| rental_rate          | decimal(4,2)                                                        | NO   |     | 4.99              |                                               |
| length               | smallint unsigned                                                   | YES  |     | NULL              |                                               |
| replacement_cost     | decimal(5,2)                                                        | NO   |     | 19.99             |                                               |
| rating               | enum('G','PG','PG-13','R','NC-17')                                  | YES  |     | G                 |                                               |
| special_features     | set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') | YES  |     | NULL              |                                               |
| last_update          | timestamp                                                           | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+----------------------+---------------------------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
13 rows in set (0.00 sec)

mysql> -- Films whose title begins with 'dr' --
mysql> select film_id, title from film
    -> where title like 'dr%' ;
+---------+----------------------+
| film_id | title                |
+---------+----------------------+
|     249 | DRACULA CRYSTAL      |
|     250 | DRAGON SQUAD         |
|     251 | DRAGONFLY STRANGERS  |
|     252 | DREAM PICKUP         |
|     253 | DRIFTER COMMANDMENTS |
|     254 | DRIVER ANNIE         |
|     255 | DRIVING POLISH       |
|     256 | DROP WATERFRONT      |
|     257 | DRUMLINE CYCLONE     |
|     258 | DRUMS DYNAMITE       |
+---------+----------------------+
10 rows in set (0.01 sec)

mysql> -- Films whose title ends with 'tion' --
mysql> select film_id, title from film
    -> where title like '%tion' ;
+---------+-------------------------+
| film_id | title                   |
+---------+-------------------------+
|      16 | ALLEY EVOLUTION         |
|      77 | BIRDS PERDITION         |
|     114 | CAMELOT VACATION        |
|     116 | CANDIDATE PERDITION     |
|     135 | CHANCE RESURRECTION     |
|     236 | DIVINE RESURRECTION     |
|     287 | ENTRAPMENT SATISFACTION |
|     289 | EVE RESURRECTION        |
|     383 | GROOVE FICTION          |
|     499 | KING EVOLUTION          |
|     638 | OPERATION OPERATION     |
|     726 | RESERVOIR ADAPTATION    |
|     817 | SOLDIERS EVOLUTION      |
|     841 | STAR OPERATION          |
|     881 | TEMPLE ATTRACTION       |
|     999 | ZOOLANDER FICTION       |
+---------+-------------------------+
16 rows in set (0.00 sec)

mysql> -- Drama films --
mysql> select film_id, title, description from film
    -> where description like '%drama%' ;
+---------+-------------------------+---------------------------------------------------------------------------------------------------------------------------+
| film_id | title                   | description                                                                                                               |
+---------+-------------------------+---------------------------------------------------------------------------------------------------------------------------+
|       1 | ACADEMY DINOSAUR        | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies                          |
|      13 | ALI FOREVER             | A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies                     |
|      14 | ALICE FANTASIA          | A Emotional Drama of a A Shark And a Database Administrator who must Vanquish a Pioneer in Soviet Georgia                 |
|      15 | ALIEN CENTER            | A Brilliant Drama of a Cat And a Mad Scientist who must Battle a Feminist in A MySQL Convention                           |
|      16 | ALLEY EVOLUTION         | A Fast-Paced Drama of a Robot And a Composer who must Battle a Astronaut in New Orleans                                   |
|      18 | ALTER VICTORY           | A Thoughtful Drama of a Composer And a Feminist who must Meet a Secret Agent in The Canadian Rockies                      |
|      20 | AMELIE HELLFIGHTERS     | A Boring Drama of a Woman And a Squirrel who must Conquer a Student in A Baloon                                           |
|      21 | AMERICAN CIRCUS         | A Insightful Drama of a Girl And a Astronaut who must Face a Database Administrator in A Shark Tank                       |
|      50 | BAKED CLEOPATRA         | A Stunning Drama of a Forensic Psychologist And a Husband who must Overcome a Waitress in A Monastery                     |
|      53 | BANG KWAI               | A Epic Drama of a Madman And a Cat who must Face a A Shark in An Abandoned Amusement Park                                 |
|      54 | BANGER PINOCCHIO        | A Awe-Inspiring Drama of a Car And a Pastry Chef who must Chase a Crocodile in The First Manned Space Station             |
|      65 | BEHAVIOR RUNAWAY        | A Unbelieveable Drama of a Student And a Husband who must Outrace a Sumo Wrestler in Berlin                               |
|      70 | BIKINI BORROWERS        | A Astounding Drama of a Astronaut And a Cat who must Discover a Woman in The First Manned Space Station                   |
|      81 | BLINDNESS GUN           | A Touching Drama of a Robot And a Dentist who must Meet a Hunter in A Jet Boat                                            |
|      82 | BLOOD ARGONAUTS         | A Boring Drama of a Explorer And a Man who must Kill a Lumberjack in A Manhattan Penthouse                                |
|     100 | BROOKLYN DESERT         | A Beautiful Drama of a Dentist And a Composer who must Battle a Sumo Wrestler in The First Manned Space Station           |
|     105 | BULL SHAWSHANK          | A Fanciful Drama of a Moose And a Squirrel who must Conquer a Pioneer in The Canadian Rockies                             |
|     112 | CALENDAR GUNFIGHT       | A Thrilling Drama of a Frisbee And a Lumberjack who must Sink a Man in Nigeria                                            |
|     115 | CAMPUS REMEMBER         | A Astounding Drama of a Crocodile And a Mad Cow who must Build a Robot in A Jet Boat                                      |
|     125 | CASSIDY WYOMING         | A Intrepid Drama of a Frisbee And a Hunter who must Kill a Secret Agent in New Orleans                                    |
|     136 | CHAPLIN LICENSE         | A Boring Drama of a Dog And a Forensic Psychologist who must Outrace a Explorer in Ancient India                          |
|     142 | CHICKEN HELLFIGHTERS    | A Emotional Drama of a Dog And a Explorer who must Outrace a Technical Writer in Australia                                |
|     152 | CIRCUS YOUTH            | A Thoughtful Drama of a Pastry Chef And a Dentist who must Pursue a Girl in A Baloon                                      |
|     158 | CLONES PINOCCHIO        | A Amazing Drama of a Car And a Robot who must Pursue a Dentist in New Orleans                                             |
|     167 | COMA HEAD               | A Awe-Inspiring Drama of a Boy And a Frisbee who must Escape a Pastry Chef in California                                  |
|     177 | CONNECTICUT TRAMP       | A Unbelieveable Drama of a Crocodile And a Mad Cow who must Reach a Dentist in A Shark Tank                               |
|     179 | CONQUERER NUTS          | A Taut Drama of a Mad Scientist And a Man who must Escape a Pioneer in An Abandoned Mine Shaft                            |
|     185 | COWBOY DOOM             | A Astounding Drama of a Boy And a Lumberjack who must Fight a Butler in A Baloon                                          |
|     189 | CREATURES SHAKESPEARE   | A Emotional Drama of a Womanizer And a Squirrel who must Vanquish a Crocodile in Ancient India                            |
|     191 | CROOKED FROGMEN         | A Unbelieveable Drama of a Hunter And a Database Administrator who must Battle a Crocodile in An Abandoned Amusement Park |
|     201 | CYCLONE FAMILY          | A Lacklusture Drama of a Student And a Monkey who must Sink a Womanizer in A MySQL Convention                             |
|     226 | DESTINY SATURDAY        | A Touching Drama of a Crocodile And a Crocodile who must Conquer a Explorer in Soviet Georgia                             |
|     231 | DINOSAUR SECRETARY      | A Action-Packed Drama of a Feminist And a Girl who must Reach a Robot in The Canadian Rockies                             |
|     238 | DOCTOR GRAIL            | A Insightful Drama of a Womanizer And a Waitress who must Reach a Forensic Psychologist in The Outback                    |
|     248 | DOZEN LION              | A Taut Drama of a Cat And a Girl who must Defeat a Frisbee in The Canadian Rockies                                        |
|     270 | EARTH VISION            | A Stunning Drama of a Butler And a Madman who must Outrace a Womanizer in Ancient India                                   |
|     281 | ENCINO ELF              | A Astounding Drama of a Feminist And a Teacher who must Confront a Husband in A Baloon                                    |
|     293 | EXORCIST STING          | A Touching Drama of a Dog And a Sumo Wrestler who must Conquer a Mad Scientist in Berlin                                  |
|     294 | EXPECATIONS NATURAL     | A Amazing Drama of a Butler And a Husband who must Reach a A Shark in A U-Boat                                            |
|     296 | EXPRESS LONELY          | A Boring Drama of a Astronaut And a Boat who must Face a Boat in California                                               |
|     305 | FATAL HAUNTED           | A Beautiful Drama of a Student And a Secret Agent who must Confront a Dentist in Ancient Japan                            |
|     313 | FIDELITY DEVIL          | A Awe-Inspiring Drama of a Technical Writer And a Composer who must Reach a Pastry Chef in A U-Boat                       |
|     360 | GLASS DYING             | A Astounding Drama of a Frisbee And a Astronaut who must Fight a Dog in Ancient Japan                                     |
|     366 | GOLDFINGER SENSIBILITY  | A Insightful Drama of a Mad Scientist And a Hunter who must Defeat a Pastry Chef in New Orleans                           |
|     384 | GROSSE WONDERFUL        | A Epic Drama of a Cat And a Explorer who must Redeem a Moose in Australia                                                 |
|     407 | HAWK CHILL              | A Action-Packed Drama of a Mad Scientist And a Composer who must Outgun a Car in Australia                                |
|     418 | HOBBIT ALIEN            | A Emotional Drama of a Husband And a Girl who must Outgun a Composer in The First Manned Space Station                    |
|     441 | HUNTER ALTER            | A Emotional Drama of a Mad Cow And a Boat who must Redeem a Secret Agent in A Shark Tank                                  |
|     448 | IDAHO LOVE              | A Fast-Paced Drama of a Student And a Crocodile who must Meet a Database Administrator in The Outback                     |
|     450 | IDOLS SNATCHERS         | A Insightful Drama of a Car And a Composer who must Fight a Man in A Monastery                                            |
|     460 | INNOCENT USUAL          | A Beautiful Drama of a Pioneer And a Crocodile who must Challenge a Student in The Outback                                |
|     496 | KICK SAVANNAH           | A Emotional Drama of a Monkey And a Robot who must Defeat a Monkey in New Orleans                                         |
|     504 | KWAI HOMEWARD           | A Amazing Drama of a Car And a Squirrel who must Pursue a Car in Soviet Georgia                                           |
|     518 | LIAISONS SWEET          | A Boring Drama of a A Shark And a Explorer who must Redeem a Waitress in The Canadian Rockies                             |
|     519 | LIBERTY MAGNIFICENT     | A Boring Drama of a Student And a Cat who must Sink a Technical Writer in A Baloon                                        |
|     528 | LOLITA WORLD            | A Thrilling Drama of a Girl And a Robot who must Redeem a Waitress in An Abandoned Mine Shaft                             |
|     532 | LOSER HUSTLER           | A Stunning Drama of a Robot And a Feminist who must Outgun a Butler in Nigeria                                            |
|     534 | LOUISIANA HARRY         | A Lacklusture Drama of a Girl And a Technical Writer who must Redeem a Monkey in A Shark Tank                             |
|     560 | MARS ROMAN              | A Boring Drama of a Car And a Dog who must Succumb a Madman in Soviet Georgia                                             |
|     564 | MASSAGE IMAGE           | A Fateful Drama of a Frisbee And a Crocodile who must Vanquish a Dog in The First Manned Space Station                    |
|     570 | MERMAID INSECTS         | A Lacklusture Drama of a Waitress And a Husband who must Fight a Husband in California                                    |
|     584 | MIXED DOORS             | A Taut Drama of a Womanizer And a Lumberjack who must Succumb a Pioneer in Ancient India                                  |
|     593 | MONTEREY LABYRINTH      | A Awe-Inspiring Drama of a Monkey And a Composer who must Escape a Feminist in A U-Boat                                   |
|     597 | MOONWALKER FOOL         | A Epic Drama of a Feminist And a Pioneer who must Sink a Composer in New Orleans                                          |
|     632 | NUTS TIES               | A Thoughtful Drama of a Explorer And a Womanizer who must Meet a Teacher in California                                    |
|     635 | OKLAHOMA JUMANJI        | A Thoughtful Drama of a Dentist And a Womanizer who must Meet a Husband in The Sahara Desert                              |
|     637 | OPEN AFRICAN            | A Lacklusture Drama of a Secret Agent And a Explorer who must Discover a Car in A U-Boat                                  |
|     640 | OPUS ICE                | A Fast-Paced Drama of a Hunter And a Boy who must Discover a Feminist in The Sahara Desert                                |
|     647 | OUTFIELD MASSACRE       | A Thoughtful Drama of a Husband And a Secret Agent who must Pursue a Database Administrator in Ancient India              |
|     652 | PAJAMA JAWBREAKER       | A Emotional Drama of a Boy And a Technical Writer who must Redeem a Sumo Wrestler in California                           |
|     667 | PEACH INNOCENT          | A Action-Packed Drama of a Monkey And a Dentist who must Chase a Butler in Berlin                                         |
|     681 | PIRATES ROXANNE         | A Stunning Drama of a Woman And a Lumberjack who must Overcome a A Shark in The Canadian Rockies                          |
|     690 | POND SEATTLE            | A Stunning Drama of a Teacher And a Boat who must Battle a Feminist in Ancient China                                      |
|     696 | PRIDE ALAMO             | A Thoughtful Drama of a A Shark And a Forensic Psychologist who must Vanquish a Student in Ancient India                  |
|     707 | QUEST MUSSOLINI         | A Fateful Drama of a Husband And a Sumo Wrestler who must Battle a Pastry Chef in A Baloon Factory                        |
|     712 | RAIDERS ANTITRUST       | A Amazing Drama of a Teacher And a Feminist who must Meet a Woman in The First Manned Space Station                       |
|     714 | RANDOM GO               | A Fateful Drama of a Frisbee And a Student who must Confront a Cat in A Shark Tank                                        |
|     719 | RECORDS ZORRO           | A Amazing Drama of a Mad Scientist And a Composer who must Build a Husband in The Outback                                 |
|     726 | RESERVOIR ADAPTATION    | A Intrepid Drama of a Teacher And a Moose who must Kill a Car in California                                               |
|     730 | RIDGEMONT SUBMARINE     | A Unbelieveable Drama of a Waitress And a Composer who must Sink a Mad Cow in Ancient Japan                               |
|     740 | ROLLERCOASTER BRINGING  | A Beautiful Drama of a Robot And a Lumberjack who must Discover a Technical Writer in A Shark Tank                        |
|     744 | ROOTS REMEMBER          | A Brilliant Drama of a Mad Cow And a Hunter who must Escape a Hunter in Berlin                                            |
|     746 | ROUGE SQUAD             | A Awe-Inspiring Drama of a Astronaut And a Frisbee who must Conquer a Mad Scientist in Australia                          |
|     770 | SCISSORHANDS SLUMS      | A Awe-Inspiring Drama of a Girl And a Technical Writer who must Meet a Feminist in The Canadian Rockies                   |
|     786 | SHEPHERD MIDSUMMER      | A Thoughtful Drama of a Robot And a Womanizer who must Kill a Lumberjack in A Baloon                                      |
|     797 | SILENCE KANE            | A Emotional Drama of a Sumo Wrestler And a Dentist who must Confront a Sumo Wrestler in A Baloon                          |
|     802 | SKY MIRACLE             | A Epic Drama of a Mad Scientist And a Explorer who must Succumb a Waitress in An Abandoned Fun House                      |
|     811 | SMILE EARRING           | A Intrepid Drama of a Teacher And a Butler who must Build a Pastry Chef in Berlin                                         |
|     825 | SPEAKEASY DATE          | A Lacklusture Drama of a Forensic Psychologist And a Car who must Redeem a Man in A Manhattan Penthouse                   |
|     846 | STING PERSONAL          | A Fanciful Drama of a Frisbee And a Dog who must Fight a Madman in A Jet Boat                                             |
|     848 | STONE FIRE              | A Intrepid Drama of a Astronaut And a Crocodile who must Find a Boat in Soviet Georgia                                    |
|     849 | STORM HAPPINESS         | A Insightful Drama of a Feminist And a A Shark who must Vanquish a Boat in A Shark Tank                                   |
|     864 | SUNDANCE INVASION       | A Epic Drama of a Lumberjack And a Explorer who must Confront a Hunter in A Baloon Factory                                |
|     878 | TEEN APOLLO             | A Awe-Inspiring Drama of a Dog And a Man who must Escape a Robot in A Shark Tank                                          |
|     888 | THIN SAGEBRUSH          | A Emotional Drama of a Husband And a Lumberjack who must Build a Cat in Ancient India                                     |
|     905 | TRAINSPOTTING STRANGERS | A Fast-Paced Drama of a Pioneer And a Mad Cow who must Challenge a Madman in Ancient Japan                                |
|     913 | TROOPERS METAL          | A Fanciful Drama of a Monkey And a Feminist who must Sink a Man in Berlin                                                 |
|     917 | TUXEDO MILE             | A Boring Drama of a Man And a Forensic Psychologist who must Face a Frisbee in Ancient India                              |
|     952 | WAGON JAWS              | A Intrepid Drama of a Moose And a Boat who must Kill a Explorer in A Manhattan Penthouse                                  |
|     956 | WANDA CHAMBER           | A Insightful Drama of a A Shark And a Pioneer who must Find a Womanizer in The Outback                                    |
|     957 | WAR NOTTING             | A Boring Drama of a Teacher And a Sumo Wrestler who must Challenge a Secret Agent in The Canadian Rockies                 |
|     969 | WEST LION               | A Intrepid Drama of a Butler And a Lumberjack who must Challenge a Database Administrator in A Manhattan Penthouse        |
|     979 | WITCHES PANIC           | A Awe-Inspiring Drama of a Secret Agent And a Hunter who must Fight a Moose in Nigeria                                    |
|     981 | WOLVES DESIRE           | A Fast-Paced Drama of a Squirrel And a Robot who must Succumb a Technical Writer in A Manhattan Penthouse                 |
|     991 | WORST BANGER            | A Thrilling Drama of a Madman And a Dentist who must Conquer a Boy in The Outback                                         |
|     997 | YOUTH KICK              | A Touching Drama of a Teacher And a Cat who must Challenge a Technical Writer in A U-Boat                                 |
+---------+-------------------------+---------------------------------------------------------------------------------------------------------------------------+
106 rows in set (0.01 sec)

mysql> -- Films whose title starts with 'c' and ends with 'tion' --
mysql> select film_id, title from film
    -> where title like 'c%tion' ;
+---------+---------------------+
| film_id | title               |
+---------+---------------------+
|     114 | CAMELOT VACATION    |
|     116 | CANDIDATE PERDITION |
|     135 | CHANCE RESURRECTION |
+---------+---------------------+
3 rows in set (0.00 sec)

mysql> -- Films whose title begins with a word of 3 letters --
mysql> select film_id, title from film
    -> where title like '___ %' ;
+---------+------------------+
| film_id | title            |
+---------+------------------+
|       2 | ACE GOLDFINGER   |
|      13 | ALI FOREVER      |
|      38 | ARK RIDGEMONT    |
|      62 | BED HIGHBALL     |
|     127 | CAT CONEHEADS    |
|     216 | DAY UNFAITHFUL   |
|     274 | EGG IGBY         |
|     278 | ELF MURDER       |
|     289 | EVE RESURRECTION |
|     387 | GUN BONNIE       |
|     447 | ICE CROSSING     |
|     486 | JET NEIGHBORS    |
|     585 | MOB DUFFEL       |
|     587 | MOD SECRETARY    |
|     674 | PET HAUNTING     |
|     750 | RUN PACIFIC      |
|     772 | SEA VIRGIN       |
|     802 | SKY MIRACLE      |
|     835 | SPY MILE         |
|     863 | SUN CONFESSIONS  |
|     957 | WAR NOTTING      |
|     983 | WON DARES        |
+---------+------------------+
22 rows in set (0.00 sec)

mysql> -- Films whose title begins with 'on' after the first character --
mysql> select film_id, title from film
    -> where title like '_on%' ;
+---------+------------------------+
| film_id | title                  |
+---------+------------------------+
|      85 | BONNIE HOLOCAUST       |
|     172 | CONEHEADS SMOOCHY      |
|     173 | CONFESSIONS MAGUIRE    |
|     174 | CONFIDENTIAL INTERVIEW |
|     175 | CONFUSED CANDLES       |
|     176 | CONGENIALITY QUEST     |
|     177 | CONNECTICUT TRAMP      |
|     178 | CONNECTION MICROCOSMOS |
|     179 | CONQUERER NUTS         |
|     180 | CONSPIRACY SPIRIT      |
|     181 | CONTACT ANONYMOUS      |
|     182 | CONTROL ANTHEM         |
|     183 | CONVERSATION DOWNHILL  |
|     241 | DONNIE ALLEY           |
|     368 | GONE TROUBLE           |
|     429 | HONEY TIES             |
|     529 | LONELY ELEPHANT        |
|     590 | MONEY HAROLD           |
|     591 | MONSOON CAUSE          |
|     592 | MONSTER SPARTACUS      |
|     593 | MONTEREY LABYRINTH     |
|     594 | MONTEZUMA COMMAND      |
|     625 | NONE SPIKING           |
|     690 | POND SEATTLE           |
|     819 | SONG HEDWIG            |
|     820 | SONS INTERVIEW         |
|     983 | WON DARES              |
|     984 | WONDERFUL DROP         |
|     985 | WONDERLAND CHRISTMAS   |
|     986 | WONKA SEA              |
+---------+------------------------+
30 rows in set (0.00 sec)

mysql>
