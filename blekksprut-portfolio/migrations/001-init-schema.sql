-- Up
CREATE TABLE IF NOT EXISTS albums (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  requested_by VARCHAR(255),
  requested_date DATE,
  title VARCHAR(255),
  artist VARCHAR(255),
  release_year INTEGER,
  genre VARCHAR(255),
  subgenre VARCHAR(255),
  country VARCHAR(255),
  image VARCHAR(255),
  language VARCHAR(255),
  listeners INTEGER,
  mbid VARCHAR(255),
  duration VARCHAR(255),
  tracks INTEGER
  UNIQUE (title, artist)
);

CREATE TABLE IF NOT EXISTS album_listens (
  id INTEGER PRIMARY KEY AUTOINCREMENT,  
  album_id INTEGER REFERENCES albums(id) ON DELETE CASCADE ON UPDATE CASCADE,
  requested_by VARCHAR(255),
  requested_date DATE
);


INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (171,'Time Out','Dave Brubeck Quartet',1959,'jazz','cool jazz','United States','https://lastfm.freetls.fastly.net/i/u/174s/db80a7f64f0442988bdc004176a83560.jpg','English',3650,'050d2f0f-465d-41bb-bdf3-c197b85a52f1','00:39:28',7),
	 (129,'Begin Here','The Zombies',1965,'1965','60s','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/af58ae698e536246da68e3ec7b9ac2e4.png','English',491872,'272fda7d-f563-452c-86d6-540e778dcd92','00:33:50',14),
	 (150,'How Does That Grab You?','Nancy Sinatra',1966,'pop rock','country','United States','https://lastfm.freetls.fastly.net/i/u/174s/b22076401eeedf0db953808e2a0940ab.jpg','English',359672,'4fa1078a-d296-4c06-ae43-1e0d0201b1b7','00:31:04',11),
	 (284,'Abbey Road','The Beatles',1969,'rock','brit rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/f304ba0296794c6fc9d0e1cccd194ed0.jpg','English',1108072,'03437e02-835f-3a0a-a37c-48a36c2e852a','00:47:22',17),
	 (175,'Loaded (Remastered)','The Velvet Underground',1970,'rock','classic rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/b50f91fb84b3df2d80364260bfb601cf.jpg','English',80398,'--','00:58:17',14),
	 (259,'Paranoid','Black Sabbath',1970,'hard rock','classic hard rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/e88b3980787c4714b79c3cab44986595.png','English',1733071,'08c82ac5-257c-4f4b-bcc7-2ae448da284e','00:40:11',8),
	 (57,'Just as I Am','Bill Withers',1971,'soul','70s','United States','https://lastfm.freetls.fastly.net/i/u/174s/ae3cf3e82b2c4e2bb78c981ae1c5787b.jpg','English',1048799,'3e9fdf77-190d-3548-9bfa-4de8f7ffdc57','00:33:16',12),
	 (341,'Poems, Prayers, and Promises','John Denver',1971,'country','folk','United States','https://lastfm.freetls.fastly.net/i/u/770x0/040a8d21753242ec9b5751e0622728ea.jpg#040a8d21753242ec9b5751e0622728ea','English',349700,'--','00:37:57',12),
	 (278,'Ege Bamyasi (Remastered)','Can',1972,'1972','psychedelic','Germany','https://lastfm.freetls.fastly.net/i/u/174s/512674f23e5518343ff53bba71f0a7fb.jpg','--',157693,'--',NULL,NULL),
	 (348,'The Dark Side of the Moon','Pink Floyd',1973,'progressive rock','psychedelic rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/d4bdd038cacbec705e269edb0fd38419.png','English',2180506,'01aa589c-a7cb-45bd-89a3-c2cb8ddab0a9','00:53:11',10);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (168,'Slowhand','Eric Clapton',1977,'classic rock','blues rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/559b8f349209404e84c8d8bdccc9d3ff.jpg','English',158202,'04c64922-7a2f-4e0c-938c-76724a5298c1','00:30:02',9),
	 (291,'Rattus Norvegicus','The Stranglers',1977,'punk','punk','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/23176b1af01b42478cc8c20341aadd17.jpg','English',149760,'02a2de3a-e117-37f4-8724-f62a465a248a','00:39:49',9),
	 (277,'London Calling','The Clash',1979,'punk','punk rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/680af088e127e474fc536a5cfad36f3e.jpg','English',1167997,'08ffce40-a216-4e13-ad31-e0c5b85b6f57','01:07:22',19),
	 (162,'Back In Black','ACDC',1980,'classic rock','hard rock','Australia','https://lastfm.freetls.fastly.net/i/u/174s/3b8bece5e8934f128b603a43409562b0.jpg','English',2200000,'0368e093-ac44-40cb-9aef-52da0126807f','00:41:45',10),
	 (242,'The Blues Brothers Original Motion Picture Soundtrack','The Blues Brothers',1980,'blues rock','movie soundtrack','United States','https://lastfm.freetls.fastly.net/i/u/174s/c2d54d55f4dfa9ed340407f704a37109.jpg','English',112600,'--','00:33:09',11),
	 (305,'Greatest Hits (Remastered)','Queen',1981,'pop rock','classic rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/f91bec3296ca408cc074c3448f37edf3.png','English',150290,'--','00:57:16',17),
	 (141,'Let''s Dance','David Bowie',1983,'pop rock','rock','England','https://lastfm.freetls.fastly.net/i/u/174s/12cd5ebef24922cd8110c609045c2cd0.jpg','English',686844,'0075b936-1031-4464-99c5-73b3ebea6e04','00:35:29',8),
	 (170,'Legend','Bob Marley',1984,'reggae','bob marley','Jamaica','https://lastfm.freetls.fastly.net/i/u/174s/3349d6bb62bc472ec73f8a31ce962d2c.png','English',251910,'--','00:50:02',16),
	 (182,'Born in the U.S.A.','Bruce Springsteen',1984,'rock','classic rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/03426c63f1f44b53cb6ea5745ec08cda.png','English',1280513,'01dfa267-9c84-4411-a2da-ea27cc0eb317','01:00:47',12),
	 (299,'This Is Big Audio Dynamite','Big Audio Dynamite',1985,'post-punk','alternative dance','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/0c6e299274b57f2f0c42d8c3c6a1fa18.jpg','English',94547,'178cf59a-8dca-4ad3-b0b8-9453d73339ef','00:43:09',8);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (44,'Graceland','Paul Simon',1986,'pop','80s','United States','https://lastfm.freetls.fastly.net/i/u/174s/6dcd4921856a43fec390a969e8346838.png','English',470512,'0fe9089e-6b0a-4a73-9093-350d72e84be5','00:45:29',11),
	 (56,'Songs in the Key of Life','Stevie Wonder',1986,'soul','70s','United States','https://lastfm.freetls.fastly.net/i/u/174s/02f18167ffe180e4a2f1c39594cfd94d.jpg','English',1147897,'0131ea0f-c3af-471c-8274-a183a7ab5f0b','01:40:32',21),
	 (66,'Live Alive','Stevie Ray Vaughan and Double Trouble',1986,'blues','blues rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/49874bc8b8eb4d48a834385c6bdbed37.jpg','English',40429,'534a4a0a-7e3d-48a8-8843-158ed662667e','01:10:27',13),
	 (120,'Appetite For Destruction','Guns and Roses',1987,'classic rock','rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/c69a0098ea572363d982a1a148c43e40.png','English',2800000,'02729c7a-c708-37b7-9b1a-072f13dba960','01:02:41',12),
	 (239,'Walk Among Us','Misfits',1988,'horror punk','punk','United States','https://lastfm.freetls.fastly.net/i/u/174s/5acb44a1cd6148d9d1eaf1e95485ef1d.png','English',300308,'1c3a4b92-e5fa-43c7-b185-516ff74db442','00:18:23',13),
	 (276,'And Justice For All','Metallica',1988,'thrash metal','metal','United States','https://lastfm.freetls.fastly.net/i/u/174s/a7cf964132ca4accca4cb9de996ad2d9.jpg','English',148574,'--','01:09:36',9),
	 (146,'Discipline','King Crimson',1989,'progressive rock','instrumental','United Kingdom','--','English',157629,'0861269d-c1fb-32de-ace8-efd02fb1213c','00:44:53',7),
	 (82,'Diamonds And Pearls','Prince',1991,'pop','funk','United States','https://lastfm.freetls.fastly.net/i/u/174s/b5adbe084374752f39d2bbc091fcbf18.jpg','English',132507,'01fcf64a-067f-4897-a776-50911ee26f56','01:03:31',13),
	 (145,'Images and Words','Dream Theater',1994,'progressive metal','progressive rock','New York','https://lastfm.freetls.fastly.net/i/u/174s/cf47afa9760249238e3269e61b5facb4.png','English',552876,'11063b45-12f8-43b8-9bf6-049913da1284','00:57:01',8),
	 (200,'Grace','Jeff Buckley',1994,'rock','folk rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/466ee1232cea0c84851b889887f3a495.jpg','English',1866510,'1964ad07-cf2b-3508-88d7-fc96e7bb0803','00:37:53',10);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (286,'The Best of Sade','Sade',1994,'soul','smooth jazz','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/3e9f44a18466985b01748600ee4892a3.png','English',1544795,'11070dd5-5c3c-4c33-94ed-8c68334d5fe3','01:13:34',16),
	 (98,'This Is How We Do It','Montell Jordan',1995,'rnb','rnb','United States','https://lastfm.freetls.fastly.net/i/u/174s/5d9baedb92ae07bae2fc9ad079f2a668.jpg','English',381392,'4262747c-0c06-44d3-87f8-31dbecdbe13d','01:01:43',15),
	 (122,'Jagged Little Pill','Alanis Morrissette',1995,'alternative rock','post-grunge','Canada','https://lastfm.freetls.fastly.net/i/u/174s/c062584cb9b34c10b8cb706439ff6578.jpg','English',68,'016cf05e-0233-4158-b8f8-3e6e290850bd','01:07:47',12),
	 (125,'Above','Mad Season',1995,'grunge','alternative rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/4526c6a7d73143b7812e3831aa38bda2.png','English',511190,'0b5bc495-463a-4343-bb55-8ec9c60ce557','01:01:45',10),
	 (272,'...And Out Come the Wolves','Rancid',1995,'punk','ska punk','United States','https://lastfm.freetls.fastly.net/i/u/174s/faa67e346b164f08cfeb0f5313b564a8.png','English',780725,'--','00:49:49',19),
	 (339,'HIStory: Past, Present and Future, Book I','Michael Jackson',1995,'pop','michael jackson','United States','https://lastfm.freetls.fastly.net/i/u/174s/78dbac156c0900574231b833f8ee4807.png','English',907800,'195a6df1-fddc-48c6-9f83-2e90ba734176','02:40:20',30),
	 (346,'(What''s the Story) Morning Glory?','Oasis',1995,'rock','britpop','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/1b217359e775a8b6a7bc443abe5b08c2.jpg','English',2536473,'031daf2e-ee11-4a34-8a90-105f76be0729','00:48:56',12),
	 (265,'Pinkerton','Weezer',1996,'alternative rock','rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/739a9329f64575d77c81ce5fe15489cf.jpg','English',1087239,'01eb0324-12a8-435f-bf4d-eabf05bdb148','00:28:41',10),
	 (331,'Romeo & Juliet Soundtrack','Various Artists',1996,'alternative','soundtrack','--','https://lastfm.freetls.fastly.net/i/u/174s/627150b4835d59ea09df818ff21fcdeb.jpg','--',36654,'--','01:10:27',18),
	 (48,'Maverick A Strike','Finley Quaye',1997,'1997','rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/c158e6b0e39d956519027b52c6ab02df.png','English',167601,'1acaab9d-031a-44e0-a3c2-8b33190b73a8','00:46:24',13);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (167,'Fat Of The Land','The Prodigy',1997,'electronic','techno','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/290c3b241c0244fa9a0d57274b5f2495.jpg','English',98241,'--','00:51:03',10),
	 (225,'Lets Face It','The Mighty Mighty Bosstones',1997,'ska punk','ska','United States','https://lastfm.freetls.fastly.net/i/u/174s/1e7bf240c89b4f49bce64cdc68d168e6.jpg','English',405852,'--','00:33:30',12),
	 (78,'Brothers and Sisters','The Allman Brothers Band',1998,'southern rock','classic rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/2bb1c0ba87101b1a458562f96663864e.jpg','English',108157,'052118a4-4104-3843-ad12-14d03391d5e1','00:43:02',7),
	 (112,'Mezzanine','Massive Attack',1998,'trip hop','electronic','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/d1b2eab14337cbe47cc473b422625788.jpg','English',2049846,'0d33ef7a-1f5d-4365-b807-b412271b99c3','01:06:30',11),
	 (273,'Bring It On','Gomez',1998,'1998','indie','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/8f766201d3dd49e1b3cbdde935dd2d18.jpg','English',174529,'4bac2256-a3e9-4877-bd39-8ccd4b1df6f7','00:57:49',12),
	 (297,'Hello Nasty','Beastie Boys',1998,'hip hop','1998','United States','https://lastfm.freetls.fastly.net/i/u/174s/a33c4a6f8d3b4571a820d7e9d47d915a.png','English',568992,'11411c54-c40a-3816-91a3-736fcef82262','01:06:55',22),
	 (315,'Gran Turismo (Remastered)','The Cardigans',1998,'rock','pop','Sweden','https://lastfm.freetls.fastly.net/i/u/174s/b36588baa2de6196cc6602ea6f394f94.png','English',377984,'--','00:43:03',11),
	 (347,'The Miseducation of Lauren Hill','Lauryn Hill',1998,'soul','rhythm and blues','United States','https://lastfm.freetls.fastly.net/i/u/174s/3281beeddd1f4e3b97b4d7088537f31a.png','English',1379,'--','01:17:39',16),
	 (235,'2001','Dr Dre',1999,'rap','hip hop','United States','https://lastfm.freetls.fastly.net/i/u/174s/0e0d3fbd198d4860b2bf3bf2568261c2.jpg','English',2120000,'2e471ef7-c0be-4cb0-9f56-fb9505b7da70','01:14:35',22),
	 (144,'Things to Make and Do','Moloko',2000,'trip hop','electronic','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/f0b9bc0055bca120376db7ff263cb08e.png','English',402119,'031b96b2-a783-3019-87ea-56930374993e','01:01:23',18);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (163,'Pennybridge Pioneers','Millencolin',2000,'punk rock','skate punk','Sweden','https://lastfm.freetls.fastly.net/i/u/174s/b62e78142fd63398cc598764d3d38a41.jpg','English',345654,'1d430bf6-d5a6-4206-b019-6f54ffea3d50','00:35:18',14),
	 (190,'Don''t Give Me Names','Guano Apes',2000,'alternative rock','rock','Germany','https://lastfm.freetls.fastly.net/i/u/174s/2c8bf7679825a05bb8c3d4ebdcbeaba5.jpg','English',334600,'07090529-0fbf-4bd3-adc4-fe627343976d','00:47:53',14),
	 (214,'Mer de noms','A Perfect Circle',2000,'alternative rock','progressive rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/63d10287cb9c44d6950c08d9418bf59b.png','English',1125359,'0679e928-efae-4902-bb59-483642200245','00:47:19',12),
	 (260,'Hybrid Theory','Linkin Park',2000,'nu metal','rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/cc15ebc58ec625979776cabaaaa282fa.jpg','English',2120945,'04b8953c-969a-423a-8847-ccf78b83d013','00:38:21',12),
	 (87,'The Hits - Chapter One','Backstreet Boys',2001,'boyband','pop','United States','https://lastfm.freetls.fastly.net/i/u/174s/042512bb34eda2ac71e59d21cde096da.jpg','English',424500,'--','00:50:45',13),
	 (123,'Is This It','The Strokes',2001,'indie rock','rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/80f256e56b1043cdbb99da3ac4dd69a0.png','English',2962918,'05f9032d-fda8-4ce6-99a5-fdd0fc8af8ee','00:37:53',11),
	 (148,'International Superhits','Green Day',2001,'punk rock','punk','United States','https://lastfm.freetls.fastly.net/i/u/174s/663ba2f7a0174952c9e71b4f1f89753d.png','English',405100,'--','01:03:01',21),
	 (224,'Origin of Symmetry','Muse',2001,'alternative rock','rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/c9eacd9d3d3d49b4f24f1167266bcfab.jpg','English',1762350,'1cc29145-b0e4-47bf-8bda-a1edef67dd1d','00:59:01',11),
	 (231,'Down With The Sickness','Disturbed',2001,'nu metal','metal','United States','https://lastfm.freetls.fastly.net/i/u/174s/20ea65bbab9a3dd7a77c5cbaf17d5abe.jpg','English',39602,'d2ae855a-a45c-45b3-b450-ce8d7a54f5bc','00:12:06',3),
	 (244,'A Funk Odyssey','Jamiroquai',2001,'funk','acid jazz','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/df9bd16dd7e29454547e09507845e511.jpg','English',650063,'040779aa-67f9-451e-be30-69f56f9008dc','00:58:15',12);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (247,'How it Works','Bodyjar',2001,'punk rock','skate punk','Australia','https://lastfm.freetls.fastly.net/i/u/174s/4b59a6178802c7d4963c065dc128c120.jpg','English',94322,'22a37aeb-ba9a-4c29-9a96-039ce6bec424','00:34:39',12),
	 (309,'The Director''s Cut','Fantômas',2001,'experimental','avant-garde','United States','https://lastfm.freetls.fastly.net/i/u/174s/db1dc6522a2d409b98e741e6d3327386.jpg','English',123831,'0d279eae-5df7-4805-85e3-0ac402830909','00:37:04',16),
	 (70,'Yoshimi Battles the Pink Robots','The Flaming Lips',2002,'poptron','indie','United States','https://lastfm.freetls.fastly.net/i/u/174s/8e0c41249f1d437e8dc20b2ff9043262.png','English',1145357,'0a3b65fb-b4dc-411c-b448-d89851ed7c12','00:55:13',11),
	 (161,'Fever','Kylie Minogue',2002,'pop','dance','Australia','https://lastfm.freetls.fastly.net/i/u/174s/347e36908eff1e5ba779d465eda85c54.jpg','English',1398625,'03e76400-d2c5-497c-994e-48219c46c72b','00:45:24',12),
	 (177,'I brought you my bullets','My Chemical Romance',2002,'emo','punk rock','United States','https://lastfm.freetls.fastly.net/i/u/770x0/3dbe614a25914eeaab08d80eff68ae58.jpg#3dbe614a25914eeaab08d80eff68ae58','English',216,'--','00:41:08',11),
	 (216,'Audioslave','Audioslave',2002,'rock','alternative rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/ed071004b3a64afb8b2a8397aad1bed4.png','English',2190621,'050ccf72-ce0d-40ab-b934-3c586e05f8c1','01:07:19',14),
	 (294,'Up the Bracket','The Libertines',2002,'punk rock','garage rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/0e43c781102ab3b729f3b04b0652612b.jpg','English',514490,'12a77811-9faa-42c1-9db5-cba9ea2489b8','00:36:33',12),
	 (302,'Smash Mouth','Smash Mouth',2002,'rock','90s','United States','https://lastfm.freetls.fastly.net/i/u/174s/167ca36f7d2e4c6bcca4ace8848ceb2f.png','English',431506,'3af5f7fc-3c68-4702-b1bf-357f2101b785','00:51:33',15),
	 (352,'American IV: The Man Comes Around','Johnny Cash',2002,'country','johnny cash','United States','https://lastfm.freetls.fastly.net/i/u/174s/df687b9f01e138ac58ec071eef3663a0.jpg','English',1374338,'1e313a50-d295-44e2-9f0a-a40c34434061','00:49:38',15),
	 (40,'Deja Entendu','Brand New',2003,'emo','alternative rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/3796daf12d544d87cd68637da91918ab.png','English',821572,'499e5f67-a07b-4536-ad3b-82d4edefa993','00:48:43',11);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (113,'Lovebox','Groove Armada',2003,'electronic','dance','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/a5c5185d7c6f4cd6997169ce21599977.png','English',401069,'08512f0c-1cc9-309e-8fcb-cf2dbfb9c333','00:48:15',11),
	 (166,'Take Me to Your Leader','King Geedorah',2003,'hip hop','jazz hop','United States','https://lastfm.freetls.fastly.net/i/u/174s/7ba3f305787248a3c88e96fdfd33892a.png','English',834227,'41e7289c-9db7-4a4e-9bfb-54e0a81ba57c','00:38:39',13),
	 (222,'Transatlanticism','Death Cab for Cutie',2003,'indie rock','indie','United States','https://lastfm.freetls.fastly.net/i/u/174s/1dbfd75d7b8941edbde5e1b58948f9c4.png','English',1170896,'439de1b9-2391-4768-bc24-eb81300812bf','00:46:27',11),
	 (292,'Yankee Hotel Foxtrot','Wilco',2003,'alt-country','2002','United States','https://lastfm.freetls.fastly.net/i/u/174s/b30dc63512734459a046814175ef8193.png','English',873829,'0423a59e-feba-4ec9-827c-60591155edd4','00:51:49',11),
	 (319,'who will cut our hair when we''re gone','The Unicorns',2003,'indie rock','lofi rock','Canada','https://lastfm.freetls.fastly.net/i/u/174s/f67f61942ca0431ec34911de7e1aff4c.jpg','English',245069,'--','00:41:03',13),
	 (330,'Fever To Tell (Deluxe Remastered)','Yeah Yeah Yeahs',2003,'indie rock','indie','United States','https://lastfm.freetls.fastly.net/i/u/174s/84dcd046207626d7a57fc19061242652.jpg','English',602862,'--','01:12:06',29),
	 (333,'The Matrix Reloaded: The Album','Various Artists',2003,'rock','soundtrack','United States','https://lastfm.freetls.fastly.net/i/u/174s/2c6bcd81ffb40041df9970d9353fe278.jpg','--',63586,'--','01:01:15',19),
	 (103,'Guilt Show','The Get Up Kids',2004,'indie rock','emo','United States','https://lastfm.freetls.fastly.net/i/u/174s/3f3e5575ed414076c0d0ac4a05d19920.jpg','English',96496,'4a374416-da6d-4cc5-9138-16d8cc42ab33','00:45:36',13),
	 (219,'Youthanasia','Megadeth',2004,'thrash metal','heavy metal','United States','https://lastfm.freetls.fastly.net/i/u/174s/cee85a6ae55fad91fff6b91db4f35417.jpg','English',384432,'0b0195b1-4e7d-49a7-9866-73b566fbf1dc','00:46:39',12),
	 (263,'On a Wire','The Get Up Kids',2004,'indie rock','alternative country','United States','https://lastfm.freetls.fastly.net/i/u/174s/052dac2a37844faba887c1fb3b6968e6.jpg','English',168574,'3410e3eb-149f-449b-a206-2d001ff7ee2f','00:46:02',12);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (264,'As the Roots Undo','Circle Takes the Square',2004,'screamo','hardcore','United States','https://lastfm.freetls.fastly.net/i/u/174s/d5430befacb02e2f58c1c488fb6b13e8.jpg','English',92024,'0294a9b7-7fc1-3bde-af34-1e8bf6da07de','00:44:04',8),
	 (274,'A Crow Left of the Murder','Incubus',2004,'alternative rock','rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/373b06a6f2074206ab9630db40647941.png','English',461847,'55662266-54e7-461c-81f2-3b0e9d5d15e1','00:59:37',14),
	 (308,'The Fall of Math','65 days of static',2004,'post-rock','math-rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/27ac8b649a6c4a83caeeb18349aa6f1f.jpg','English',74,'3c7dab0b-0d75-4dfb-b78d-7571046e0507','00:43:50',11),
	 (313,'Greatest Hits','Britney Spears',2004,'pop','dance pop','United States','https://lastfm.freetls.fastly.net/i/u/174s/29b19123844e4daf90e6fdcaf9cbfea5.png','English',1100000,'--','01:04:10',19),
	 (356,'Shrek 2 (Original Motion Picture Soundtrack)','Various Artists',2004,'rock','movie soundtrack','United States','https://lastfm.freetls.fastly.net/i/u/174s/2b6137caa85ac70d5719f54cb6e46b99.jpg','English',205351,'--','00:16:24',5),
	 (75,'You''ll Rebel To Anything','Mindless Self Indulgence',2005,'industrial','synthpunk','United States','https://lastfm.freetls.fastly.net/i/u/174s/a2fa1ad9d955475fb1664e427406cccb.jpg','English',289318,'0e41f4f8-1c95-4822-b25e-e632f2800f91','00:26:54',10),
	 (104,'Smash the Windows','Mischief Brew',2005,'folk punk','folk-punk','United States','https://lastfm.freetls.fastly.net/i/u/174s/a0603765175f94acf285e93d19d031de.jpg','English',32127,'68468a4a-ef2d-4d71-84f3-9eb0c6e94dd1','00:49:05',13),
	 (140,'I''m Wide Awake It''s Morning','Bright Eyes',2005,'emo','indie rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/0cb9d406d23f4398c3a5979084fbde74.png','English',310940,'--','00:45:41',10),
	 (189,'Late Registration','Kanye West',2005,'hip hop','rap','United States','https://lastfm.freetls.fastly.net/i/u/174s/9c0e7886d750a519c9ec63c30434b483.png','English',2326828,'05b67f03-9593-4bef-bb61-01b28ec1600e','01:00:44',21),
	 (196,'Kimi to Boku no Dai 3ji Taisen-teki Renai Kakumei','Ging Nang Boyz',2005,'j-rock','punk','Japan','https://lastfm.freetls.fastly.net/i/u/770x0/8ef46b74b0a04309b05835edcafbf8ea.jpg#8ef46b74b0a04309b05835edcafbf8ea','Japanese',9479,'--','01:29:02',14);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (211,'Silent Alarm','Bloc Party',2005,'indie','indie rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/912efdc838584d69873450f9c1bfb033.png','English',1910900,'00897556-cb7a-3417-97aa-756b3fdc77c9','00:52:58',13),
	 (251,'The Flamingo Trigger','Foxy Shazam',2005,'post-hardcore','experimental','United States','https://lastfm.freetls.fastly.net/i/u/174s/5fb7086019684ff9aaf4c401a7e18049.jpg','English',14278,'e3ab55b8-986c-4efb-9ac8-40e8578be4b1','00:35:09',12),
	 (267,'The Sunset Tree','The Mountain Goats',2005,'folk','indie','United States','https://lastfm.freetls.fastly.net/i/u/174s/153955c4d6e20fd1ed6b45738676be42.png','English',362887,'2d66c5e3-c1f0-440c-96b7-fd4578ecb8c7','00:41:06',13),
	 (298,'Mezmerize','System of a Down',2005,'alternative metal','metal','United States','https://lastfm.freetls.fastly.net/i/u/174s/6af731c307585bb1e496f80f7dbad566.jpg','English',2104250,'1637bc33-26fd-47a8-a6a5-173b68d6f051','00:36:38',11),
	 (310,'Deadwing','Porcupine Tree',2005,'progressive rock','progressive metal','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/5c7e2369704d4f4d5def41a8dc6e5b23.jpg','English',396422,'14838335-e191-43af-8b54-ebe644687d76','01:13:35',13),
	 (351,'Truly Madly Completely - The Best of Savage Garden','Savage Garden',2005,'pop','boyband','Australia','https://lastfm.freetls.fastly.net/i/u/174s/8443a5406053dd11388d75ce4d115a0c.png','English',122145,'0dc6e17b-f886-4e30-908f-a784faed5c0a','01:15:05',17),
	 (130,'Standing in the Way of Control','Gossip',2006,'indie rock','2006','United States','https://lastfm.freetls.fastly.net/i/u/174s/146e455db43c4483b3fda238c2b475c5.jpg','English',467581,'004f358e-a0fc-4036-a2e9-975d3eae3db9','00:31:25',10),
	 (138,'Konvicted','Akon',2006,'hip-hop','akon','Senegal','https://lastfm.freetls.fastly.net/i/u/174s/0956ddf2bd294e55ce6ba63dc3b8d98b.png','English',1271727,'13141107-58e2-4984-bb90-55aa59fc03f6','00:52:13',13),
	 (323,'10,000 Days','Tool',2006,'progressive metal','progressive rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/7840c5a71ebd451e8a923ae09de91785.png','English',1070426,'10aeb19a-d352-4b69-ba37-5a6e58dd2dda','01:17:00',11),
	 (34,'La Femme Chocolat','Olivia Ruiz',2007,'chanson francaise','french','France','https://lastfm.freetls.fastly.net/i/u/174s/c9893bfe2e3d4abeb55458489a688a10.png','fra',105241,'2e615e99-3ae1-3ca3-b7ca-2aadf6892e31','00:52:38',13);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (81,'Good Girl Gone Bad','Rihanna',2007,'pop rnb','rnb','United States','https://lastfm.freetls.fastly.net/i/u/174s/3f7270f3bbd70750a479acf7a7893a8e.jpg','English',2437534,'0d44e01a-0f8e-3733-81ea-52055a515e08','00:44:43',12),
	 (84,'The Submarine','Whitley',2007,'folk','australian','Australia','https://lastfm.freetls.fastly.net/i/u/174s/e28a2960ee8b4b859387a974a818b6ce.jpg','English',65046,'134d2e19-1253-4281-9ab8-123b314c6702','00:31:14',10),
	 (88,'Into The Wild OST','Eddie Vedder',2007,'rock','movie soundtrack','United States','https://lastfm.freetls.fastly.net/i/u/174s/1eee840d01b046afaf79fdb6baff56aa.jpg','English',5253,'--','00:33:04',11),
	 (96,'Alive 2007','Daft Punk',2007,'electronic','house','France','https://lastfm.freetls.fastly.net/i/u/174s/3b9e9decf68b4f109f57d72d8ebd4b4b.jpg','English',697060,'126b20d1-371c-3db4-8a3c-f256cd4ea81f','01:59:53',27),
	 (128,'RIOT!','Paramore',2007,'pop punk','rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/b7a4b3000d0c431fbce299986ac51c48.png','English',2681444,'04fb7d1f-7011-4253-8de6-a776fa6f80aa','00:14:03',11),
	 (137,'sound of silver',' LCD Soundsystem',2007,'electronic','poptron','United States','https://lastfm.freetls.fastly.net/i/u/770x0/8b8dd3bc14f8477f823f8ad611a04d11.jpg#8b8dd3bc14f8477f823f8ad611a04d11','English',16,'21d098df-8327-3503-97e6-22bea515520e','00:55:55',9),
	 (160,'Elect the Dead','Serj Tankian',2007,'alternative metal','alternative','Los Angeles','https://lastfm.freetls.fastly.net/i/u/174s/9e645658490440b096637f594c9508a7.png','English',639211,'03e45bda-742c-3a9b-8792-a58a1d03240c','00:49:21',12),
	 (210,'Graduation','Kanye West',2007,'hip-hop','rap','United States','https://lastfm.freetls.fastly.net/i/u/174s/8ddd1959a2bef460a5149b3e0cf5e18a.png','English',3301023,'06a81817-093d-40f0-aef2-90673fa550ae','00:47:57',13),
	 (335,'Baduizm','Erykah Badu',2007,'soul','neo-soul','United States','https://lastfm.freetls.fastly.net/i/u/174s/e908f8c5e95b511a394bae27279e8960.png','English',839818,'3d5ab81d-ebd9-4e52-a4c6-334af0ddaa48','00:53:21',14),
	 (46,'The Mountain Goats','Heretic Pride',2008,'indie','indie-rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/2320e0b186b24bda96cbc7e3fc54799a.jpg','English',106165,'134df274-3877-4dcb-aeff-a223b6bc742e','00:47:19',13);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (49,'Heretic Pride','The Mountain Goats',2008,'2008','indie','United States','https://lastfm.freetls.fastly.net/i/u/174s/2320e0b186b24bda96cbc7e3fc54799a.jpg','English',106165,'134df274-3877-4dcb-aeff-a223b6bc742e','00:47:19',13),
	 (55,'Shogun','Trivium',2008,'thrash metal','metalcore','United States','https://lastfm.freetls.fastly.net/i/u/174s/b5a2b81f38273607906c53952e53cc59.jpg','English',131198,'0996dd22-a561-3613-83d8-1af06b2dfd42','01:05:40',11),
	 (86,'A Mind Of My Own','Pez',2008,'hip hop','australian','Australia','https://lastfm.freetls.fastly.net/i/u/174s/e2f85acff0e148e5841e4928cf0f64f1.jpg','English',16169,'8e006625-be10-4026-89cc-ba51fb58bb54','00:55:01',14),
	 (109,'Signify','Porcupine Tree',2008,'progressive rock','psychedelic rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/c7ae30d77ef245391da1746e676730bd.jpg','English',103686,'0990da86-916e-38d4-aa1c-7e2968703f97','01:01:15',12),
	 (115,'Ignition','The Offspring',2008,'punk rock','punk','United States','https://lastfm.freetls.fastly.net/i/u/174s/86e4571ca0a545b7bec0b7677e000511.png','English',300273,'4052c157-9c9d-4086-b72c-923787db1549','00:38:25',12),
	 (191,'For Emma, Forever Ago','Bon Iver',2008,'folk','indie','United States','https://lastfm.freetls.fastly.net/i/u/174s/2df76df7ead648eb8d4f242429a685a0.png','English',2171207,'0270cde6-6b5b-31fa-b04b-d8b68ff612d4','00:30:30',9),
	 (236,'Somewhere at the Bottom of the River Between Vega and Altair (10th Anniversary)','La Dispute',2008,'post-hardcore','screamo','United States','https://lastfm.freetls.fastly.net/i/u/174s/ccbf57075fece0ea1bcf678bea2da8d6.jpg','English',238243,'--','00:51:38',13),
	 (287,'The Best Of','Radiohead',2008,'alternative','alternative rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/5a3111af580c4d77cdc8f59163dcc0bb.png','English',594976,'054813d3-99cd-4c7e-aaa7-c63b8c3b5b48','01:18:55',17),
	 (318,'Feed the Animals','Girl Talk',2008,'mashup','electronic','United States','https://lastfm.freetls.fastly.net/i/u/174s/86cf647d22fe44fc9807a301295669ba.png','English',211657,'27009645-6238-4783-90ec-6533f40bdf06','00:53:21',14),
	 (336,'Twilight Original Motion Picture Soundtrack (International Special Edition)','Various Artists',2008,'Movie Soundtrack','-','--','https://lastfm.freetls.fastly.net/i/u/174s/201eb5c049b94f82df35b7f752ef7406.jpg','--',85333,'--','01:06:00',17);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (353,'J5 (Deluxe Edition)','Jurassic 5',2008,'hip hop','rap','United States','https://lastfm.freetls.fastly.net/i/u/174s/7a8c1618b9620ebe0395c1caf97f70a6.jpg','English',49005,'--','00:21:27',28),
	 (358,'Punk Goes Crunk','Various Artists',2008,'pop punk','cover','United States','https://lastfm.freetls.fastly.net/i/u/174s/a0b0f8fc4d4b4f04bf001d038a5c38de.jpg','English',326681,'--','01:03:11',15),
	 (64,'Scrambles','Bomb the Music Industry!',2009,'punk','indie rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/44ac361408304a1cca235e8cfd811dda.jpg','English',38610,'33cc3d27-203f-432b-a8a7-f54c72da9a36','00:37:23',13),
	 (76,'Homesick','A Day to Remember',2009,'post-hardcore','hardcore','United States','https://lastfm.freetls.fastly.net/i/u/174s/ee2c1861c992445fa15e43b4af6db55e.png','English',839277,'6eb92b5c-b64a-4992-be14-fff638586331','00:40:41',12),
	 (192,'Blacklist','Kap Bambino',2009,'electroclash','electronica','France','https://lastfm.freetls.fastly.net/i/u/174s/e89f8f479b4547f5a82fd072ca8202e8.png','English',98750,'288cad86-76a8-496c-b8a4-6e8255352de3','00:31:11',12),
	 (218,'Ten','Pearl Jam',2009,'grunge','rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/4dfa0959e9534f8dcfd24d5dc5110589.jpg','English',2457120,'032469aa-f00b-49cd-badf-5cbda161170c','01:03:55',11),
	 (250,'The Hard Road: Restrung','Hilltop Hoods',2009,'hip hop','aussie hip hop','Australia','https://lastfm.freetls.fastly.net/i/u/174s/396a0259bc3547a1c77ea728b816d8b1.jpg','English',11913,'a51091ae-4a2e-4c69-bead-4698dc09999e','00:44:16',14),
	 (303,'This Will Be The Death of Us','Set Your Goals',2009,'pop punk','pop hardcore','United States','https://lastfm.freetls.fastly.net/i/u/174s/ac2d7bb247874e2ece4029c67ca11e5f.jpg','English',104660,'07991297-871d-39f3-b88c-83e978917131','00:30:35',12),
	 (61,'Plastic Beach','Gorillaz',2010,'electronic','alternative','England','https://lastfm.freetls.fastly.net/i/u/174s/ce6e2af584a5480b85b79371b219a92e.png','English',2343112,'28ddf022-0a8a-4ecd-bf18-d80af26c3aff','00:57:44',16),
	 (85,'What Separates Me from You','A Day to Remember',2010,'post-hardcore','pop punk','United States','https://lastfm.freetls.fastly.net/i/u/174s/d05d163494c34751b14ba19f06d29676.png','English',625825,'7a4634ab-9466-4348-a17f-8337d555fc45','00:16:10',10);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (131,'Searching for a Pulse / The Worth of the World','Touché Amoré & La Dispute',2010,'emo','post-hardcore','United States','https://lastfm.freetls.fastly.net/i/u/174s/ebc31e39c08732fcd9392f844a2064f5.png','English',32,'--','00:09:08',4),
	 (132,'Brothers','The Black Keys',2010,'blues rock','rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/fe84144e16808e200304351b5e9410de.jpg','English',1386363,'07addaa9-24d6-4631-9eeb-9e92a961e37f','00:55:36',15),
	 (136,'Anesthetize','Porcupine Tree',2010,'progressive rock','progressive metal','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/06e30222524286894678212af77abff1.jpg','English',42711,'151d5800-e450-4c8b-917d-cc7bfc54821d','02:14:39',19),
	 (142,'Cerulean','Baths',2010,'downtempo','ambient','United States','https://lastfm.freetls.fastly.net/i/u/174s/4ca90af3b429a8874b9b0a6762a4aeca.jpg','English',343036,'344a7009-d81f-4761-8d2a-c90f8943ac79','00:43:11',12),
	 (243,'Bat Out of Hell','Meat Loaf',2010,'rock','classic rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/e06f235d701ef090e8a76e81780c1965.jpg','English',489414,'04ed7274-75cb-4977-9ef3-720c9b340db1','00:40:18',7),
	 (261,'still a Sigure virgin?','Ling Tosite Sigure',2010,'indie','post hardcore','Japan','https://lastfm.freetls.fastly.net/i/u/174s/9db157c7cb865a87b1bb96bd04933dda.jpg','--',12732,'--','00:37:10',9),
	 (266,'Beacons','Cloudkicker',2010,'progressive metal','post metal','United States','https://lastfm.freetls.fastly.net/i/u/174s/ab9f5f65dab291bcb87954b79bbd5dc5.jpg','English',48347,'204a7a61-3655-434f-ad0f-75f677ff06f0','00:43:12',11),
	 (355,'The Beginning & The Best of The E.N.D.','Black Eyed Peas',2010,'dance','pop','United States','https://lastfm.freetls.fastly.net/i/u/174s/724d54acc53d4c509e97ba250fc86df4.png','English',117412,'--','01:24:15',20),
	 (93,'Branded','Dope D.O.D.',2011,'hardcore rap','hip hop','Netherlands','https://lastfm.freetls.fastly.net/i/u/174s/b917db96a57643ae874774661b136de1.png','English',37392,'35e35bb3-0447-48d7-a084-db096db5a122','01:12:08',21),
	 (111,'Camp','Childish Gambino',2011,'rap','hip hop','United States','https://lastfm.freetls.fastly.net/i/u/174s/d2c51831aa2b59b93c7e56b29efbbcf6.png','English',1669530,'0e407fbd-58c1-45b3-adc5-a6ac5d945509','00:56:22',13);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (149,'Born This Way','Lady Gaga',2011,'pop','2011','United States','https://lastfm.freetls.fastly.net/i/u/174s/f403f8f345f08b8aaba47a1be32b1c11.png','English',1227341,'0371b43b-2f83-486a-835e-eff8fdd50c75','01:01:26',14),
	 (206,'You Love Her Coz She''s Dead','You Love Her',2011,'electroclash','electronic','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/f621a4bfffbf300497ef1c53bf0dcaf2.jpg','English',47858,'--','00:40:51',10),
	 (233,'Suburbia I''ve Given You All and Now I''m Nothing','The Wonder Years',2011,'pop punk','albums that i fucking love','United States','https://lastfm.freetls.fastly.net/i/u/174s/23d98c781061499fb815ba6f80a1f11e.jpg','English',148206,'cbdfb374-5914-48ff-849d-da20115f83aa','00:40:00',13),
	 (255,'Parting The Sea Between Brightness And Me','Touché Amoré',2011,'melodic hardcore','hardcore','United States','https://lastfm.freetls.fastly.net/i/u/174s/61f4245e88044d01bb5658b23a185fd7.png','English',120131,'c4d0c8c9-d89c-4195-9a95-92b778ed7f94','00:21:27',13),
	 (275,'Best of Vanessa Carlton','Vanessa Carlton',2011,'pop','female vocalists','United States','https://lastfm.freetls.fastly.net/i/u/174s/d164d25313024ba5856ce074aaa7cb35.jpg','English',3006,'fe3db785-ef0e-4520-92c7-b2b17242de40','00:48:28',12),
	 (296,'Every Kingdom','Ben Howard',2011,'folk','acoustic','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/c5742d38780cf7aed20d916afebfe48a.jpg','English',795444,'0deb28f9-8c96-465c-953d-cb15664bf4d7','00:50:03',10),
	 (39,'Punk Goes Pop, Vol. 5','Various Artists',2012,'covers','emo','United States','https://lastfm.freetls.fastly.net/i/u/174s/fa37e2e6e7b04921a9be5ad98c6402e7.jpg','English',155468,'--','00:52:09',13),
	 (71,'Cognitive','Soen',2012,'progressive metal','metal','Stockholm','https://lastfm.freetls.fastly.net/i/u/174s/79ee99a296ce4cc3a86b7d970dbb5f96.jpg','English',112019,'4530fb9a-e85d-46fd-b3e6-729f00662f31','00:48:31',10),
	 (72,'Collide With the Sky','Pierce the Veil',2012,'post-hardcore','emocore','United States','https://lastfm.freetls.fastly.net/i/u/174s/557643a8faaa35768cb6088f576fed30.jpg','English',992727,'12841a9c-293c-4417-823d-2550ea8c63cd','00:46:09',12),
	 (83,'Kingfisha','Kingfisha',2012,'reggae','-','Brisbane','https://lastfm.freetls.fastly.net/i/u/174s/cdf904eb11d34fd58003ab70bcc7d97c.jpg','English',623,'0e90a2ff-18ba-4643-be16-f0a8dc176c3b','00:47:19',10);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (110,'Second Hand Wonderland','Kontrust',2012,'nu metal','crossover','Austria','https://lastfm.freetls.fastly.net/i/u/174s/68aa88d1d0244d42b506df54c07c8928.jpg','English',35061,'946b948f-fb1b-4a0f-933c-7cd34db5912a','00:55:16',15),
	 (114,'Oblivion','Grimes',2012,'electronic','dream pop','Canada','https://lastfm.freetls.fastly.net/i/u/174s/a48fe826edf0946acc1968e176f934f0.jpg','English',549,'60e29213-da15-460d-ac2e-1fb710c0e607','00:07:21',2),
	 (127,'Fear Fun','Father John Misty',2012,'indie','folk','United States','https://lastfm.freetls.fastly.net/i/u/174s/24960601f04b4317b4d2c5432e77e1c9.jpg','English',610563,'49d3fd73-7d94-44bb-a13c-46538d049197','00:48:48',12),
	 (156,'Unapologetic','Rihanna',2012,'pop rnb','rnb','United States','https://lastfm.freetls.fastly.net/i/u/174s/6dcb38cf94b642b89af2cd49b7fcbad9.png','English',497385,'0219cdbf-7825-47ec-b0c3-903983672762','00:26:03',14),
	 (165,'House of Balloons','The Weeknd',2012,'rnb','r&b','Canada','https://lastfm.freetls.fastly.net/i/u/174s/0a4a56348b554fbcbdf81193bfc455ad.png','English',186490,'0391b278-6408-4909-8c0a-649d6f62dfb8','00:46:58',9),
	 (181,'ランドマーク','Asian Kung Fu Generation',2012,'j-rock','rock','Japan','https://lastfm.freetls.fastly.net/i/u/770x0/ea19a1cc75304890ae0edc45a7cb5dba.jpg#ea19a1cc75304890ae0edc45a7cb5dba','Japanese',15400,'0fae35f3-e821-47b3-8d15-03f6aa2cf48b','00:46:06',12),
	 (197,'Ten$ion','Die Antwoord',2012,'2012','hip-hop','South Africa','https://lastfm.freetls.fastly.net/i/u/174s/d3561c0bd8c01a27bc3e8991a68f45f4.png','Multiple languages',490348,'b53e370b-3166-4120-a0f4-b37b1e904a87','00:39:23',13),
	 (220,'Babel','Mumford And Sons',2012,'indie folk','folk','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/bfac6f9576494134bad2012cef949e6f.jpg','English',607700,'3410b49c-5ff2-491f-906b-a78e96089433','00:51:29',12),
	 (234,'The Lion’s Roar','First Aid Kit',2012,'dream pop','folk','Sweden','--','English',595,'79226b04-81d0-41c5-ae2e-949ce00aae0a','00:42:43',10),
	 (249,'The 2nd Law','Muse',2012,'alternative rock','rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/f01bd0edaa4db45c7f10f537d1b025d6.png','English',890725,'0628623f-ff64-4eb8-a6ca-3798f7a37f62','00:53:28',13);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (33,'Psycho Tropical Berlin','La Femme',2013,'psychedelic rock','indie pop','France','https://lastfm.freetls.fastly.net/i/u/174s/42f8b8f921114514a553f03d835228f7.png','French',233659,'0e11b71a-20b0-4542-aec2-93f92ee6667e','00:57:37',100),
	 (54,'Give Up','The Postal Service',2013,'indie','indie pop','United States','https://lastfm.freetls.fastly.net/i/u/174s/e764090489a84d2b9717830a4d26cf57.png','English',1491936,'00161f8c-f335-465d-a944-597d67616d9a','00:51:08',10),
	 (91,'Back to Black','Amy Winehouse',2013,'soul','jazz','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/5e8b279da10957d060253256c8302f8f.png','English',2204341,'0164ea1e-5587-4396-ac9d-8611f608b2da','00:33:08',11),
	 (124,'LONG.LIVE.A$AP','A$AP Rocky',2013,'rap','hip-hop','United States','https://lastfm.freetls.fastly.net/i/u/174s/5f30f9460faa4b8ea2238a2c4f7f60d4.png','English',91001,'0b5b055a-2050-47ac-8ca5-056d1618302f','01:06:21',17),
	 (179,'Magna Carta... Holy Grail','JAY Z',2013,'hip hop','rap','United States','https://lastfm.freetls.fastly.net/i/u/174s/33bad523bc9d4cd8b0b0c91bd7423f2f.png','English',2769,'2355bdf3-8bdc-4288-a8c2-f46bb98d17c4','00:58:55',16),
	 (212,'Sempiternal','Bring Me the Horizon',2013,'metalcore','post-hardcore','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/b665c029fbe8489f8e6a45dde56215d4.png','English',138695,'1637ac31-0dde-4552-8701-269d5d6730e1','00:45:31',11),
	 (237,'AM','Arctic Monkeys',2013,'2013','indie rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/f579e414e20f40969185e41182d72472.png','English',3232354,'169957aa-2ca8-42a8-ba02-71bdf3fe26ff','00:40:52',12),
	 (262,'Take Me Home','One Direction',2013,'pop','boy band','England','https://lastfm.freetls.fastly.net/i/u/174s/7ec86c290beb4da3b0a2f4345ad10baa.png','English',104370,'071b3110-83b5-408d-8782-7429803557e2','00:42:17',13),
	 (38,'Punk Goes Pop Vol. 6','Various Artists',2014,'covers','post-hardcore','United States','https://lastfm.freetls.fastly.net/i/u/174s/5d104400852d4fbccf7f7854ec57f2aa.jpg','English',1825,'--','00:48:53',15),
	 (126,'Alium','Submotion Orchestra',2014,'lush','downtempo','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/99d076f1ce844da9cdbbdef6358f5e65.png','English',29656,'18be85d1-ecd4-4980-8dc5-ece8c06519e6','00:53:49',12);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (134,'Listen','David Guetta',2014,'dance','electronic','France','https://lastfm.freetls.fastly.net/i/u/174s/6a75a1a847c84bb5cb69198596e2bfb8.png','English',593110,'4acbe94e-27a9-4ff5-b556-09325a0bfd3a','01:04:18',18),
	 (147,'13 Songs','Fugazi',2014,'post-hardcore','punk','United States','https://lastfm.freetls.fastly.net/i/u/174s/a2e51d47e0122d174fa17734d46e96e7.jpg','English',691877,'2f9f575b-2bd0-4ccb-9ab5-70fae4f8dd8b','00:23:54',13),
	 (157,'The Hearts of Lonely People','Isles & Glaciers',2014,'post-hardcore','i need it','United States','https://lastfm.freetls.fastly.net/i/u/174s/658c6ba479d24f1dbc89c635118325ce.png','English',181046,'3c329021-b96c-465f-a32e-ae997823d3c1','00:26:41',7),
	 (176,'Superunknown','Soundgarden',2014,'grunge','rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/ba46062e0b094a889ac06447fd5714f8.png','English',1449451,'04ae4546-532d-4ba5-a798-23dab9dbc921','01:03:09',16),
	 (280,'Because the Internet','Childish Gambino',2014,'rap','pop rap','United States','https://lastfm.freetls.fastly.net/i/u/174s/0f636525495f1458c7c55f238eb8e27d.jpg','English',1712437,'79014bd3-d9ee-4ae8-8c3d-64ee19c2d3f1','00:57:59',19),
	 (322,'Happy','Pharrell Williams',2014,'pop','hip hop','United States','https://lastfm.freetls.fastly.net/i/u/174s/fa4368fd046c4ffccf967eb22bb4f601.png','English',61491,'58bffcb3-21ac-4f60-a933-0c06f6a4f7ec','00:05:57',2),
	 (325,'E. 1999 Eternal','Bone Thugs-N-Harmony',2014,'hip hop','rap','United States','https://lastfm.freetls.fastly.net/i/u/174s/eab99d27d94d8e629f8da1c8de78a18d.png','English',590127,'2bcf08af-493b-48c3-b410-28e50c6c8b1b','01:08:55',17),
	 (326,'Demon Days','Gorillaz',2014,'alternative','electronic','England','https://lastfm.freetls.fastly.net/i/u/174s/a9c052ef2656668af3ba4753f2e1cbe7.png','English',3816024,'0380808d-2211-4869-a287-cc94e0d18162','00:50:24',15),
	 (354,'Guardians of the Galaxy: Awesome Mix, Vol. 1 (Original Motion Picture Soundtrack)','Various Artists',2014,'movie soundtrack','pop','United States','https://lastfm.freetls.fastly.net/i/u/174s/850482fd78ce409fc0e88c8eb919c85d.jpg','English',9348,'--','00:43:44',12),
	 (102,'Strange New Past','Seth Sentry',2015,'hip hop','aussie hip hop','Victoria','https://lastfm.freetls.fastly.net/i/u/174s/2ba784ca7c37a875af857bbdb81ef9c0.png','English',9007,'aedce60c-57c9-4dce-8dd6-191d81c5806b','00:51:18',13);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (183,'Feeling of Unity','Fear And Loathing In Las Vegas',2015,'post hardcore','anime','Japan','https://lastfm.freetls.fastly.net/i/u/770x0/fd4f00b3ff902c73227996f91de9f494.jpg#fd4f00b3ff902c73227996f91de9f494','Japanese',49,'--','00:38:52',11),
	 (199,'Money Shot','Puscifer',2015,'alternative','electronic','United States','https://lastfm.freetls.fastly.net/i/u/174s/a026809ab13b0d9d6ccfea7867e8a087.jpg','English',88325,'31f9e43e-34ad-429b-ae7f-c18024de27ca','00:47:01',10),
	 (213,'Purpose','Justin Bieber',2015,'pop','pop rnb','Canada','https://lastfm.freetls.fastly.net/i/u/174s/c6c4b277510d7df6bf959d0b8d77fcf1.jpg','English',86798,'006391a6-3f99-4d38-9185-50633c43fe38','00:44:38',18),
	 (35,'Mystère','La Femme',2016,'psychedelic punk','surf','France','https://lastfm.freetls.fastly.net/i/u/174s/f8958a65cd7bb3de6af14e904717cc95.jpg','French',198823,'3120c21c-4291-47cf-a802-d08807c566ef','01:11:31',16),
	 (36,'Tardigrade Inferno','Tardigrade Inferno',2016,'avant-garde metal','cabaret metal','Sankt-Peterburg','https://lastfm.freetls.fastly.net/i/u/174s/ed6ee8c25179a58cd5ec70ef3bd3641a.jpg','English',4374,'8f21c36c-39a2-43eb-b405-bc5597f6b46c','00:11:53',3),
	 (41,'Ready To Die (The Remaster)','The Notorious B.I.G.',2016,'hip-hop','rap','United States','https://lastfm.freetls.fastly.net/i/u/174s/e68c6e3706e0ececd7231e8ca10e33a8.jpg','English',1029091,'0756fea0-10c2-4d4d-afaf-c5e81ae496b4','01:09:05',19),
	 (119,'ANTI (Deluxe)','Rihanna',2016,'rnb','soul','United States','https://lastfm.freetls.fastly.net/i/u/174s/d4a339a2bd2bc5fe470e0b0c10444903.png','English',1950665,'--','00:43:36',16),
	 (133,'Skin','Flume',2016,'wonky','trap','Australia','https://lastfm.freetls.fastly.net/i/u/174s/814124126add3fc7a702ce55f616d5fe.jpg','English',727260,'0952f60e-d6b9-4acb-8289-03b10a6e3bfd','00:59:44',16),
	 (151,'The Happy Song','Imogen Heap',2016,'masterful','olivia','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/2c648ddba7896db370c7a67b04b44034.jpg','English',41489,'20fbc133-a64d-4498-ac8e-b646a762c644','00:07:00',2),
	 (154,'Diplomatic Immunity','Client Liaison',2016,'electropop','pop','Australia','https://lastfm.freetls.fastly.net/i/u/174s/eb39d29fcc72430c817a3b66dd9214a9.jpg','English',20475,'016a3939-4abb-44fa-8a04-3b81ab21cf84','00:51:50',11);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (186,'WORRY.','Jeff Rosenstock',2016,'indie rock','power pop','United States','https://lastfm.freetls.fastly.net/i/u/174s/60979031a9af4416fdeba118c6bd5a94.jpg','English',191143,'1efb5a27-8ea7-43d4-ba41-a18c60eb940b','00:29:49',17),
	 (198,'The Mountain Will Fall','DJ Shadow',2016,'electronic','rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/586ab9ddeec8855a747b5b55b2d62f40.jpg','English',237603,'561e99ac-b7db-4329-b644-c0475954b256','00:20:33',12),
	 (252,'Juturna','Circa Survive',2016,'indie','experimental','United States','https://lastfm.freetls.fastly.net/i/u/174s/0b19238d3e46bac4fe3282d586cb91ba.jpg','English',396851,'17342b8e-f23c-4d14-b908-ee8068fa4cec','00:47:50',12),
	 (281,'Still Brazy','YG',2016,'rap','g-funk','United States','https://lastfm.freetls.fastly.net/i/u/174s/aee77512ee369ab62715397b15cf7d9a.jpg','English',10702,'11719b88-c0e3-4b56-922b-8a55e1f4c5a3','00:47:52',17),
	 (317,'The Bible 2','AJJ',2016,'acoustic','indie rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/c52f752133f2cfb9749b2984991dc4d4.jpg','English',72444,'2faed372-50e8-463d-a15f-f2ca7604547a','00:31:50',11),
	 (337,'Bloom','RÜFÜS DU SOL',2016,'2016','alternative dance','Australia','https://lastfm.freetls.fastly.net/i/u/174s/18664c48d3fe7b94a6be3ddd73343052.jpg','English',336312,'--','00:08:04',11),
	 (350,'Lemonade','Beyoncé',2016,'pop','rnb','United States','https://lastfm.freetls.fastly.net/i/u/174s/75f530eee071e248abc5f72d4da59721.jpg','English',1005594,'19c88bb5-1300-4bf3-b743-76e159d60b3a','01:49:28',13),
	 (43,'SATURATION III','BROCKHAMPTON',2017,'hip hop','rap','United States','https://lastfm.freetls.fastly.net/i/u/174s/d6fdbf180b3432a2d7672aaa35749ce7.png','English',784943,'090f442c-ae2c-4eb7-9178-51b11e4f7deb','00:46:22',15),
	 (50,'Free 6LACK','6LACK',2017,'trap','alternative rnb','United States','https://lastfm.freetls.fastly.net/i/u/174s/1c845f90bb68a525baa2578aee416a1f.jpg','English',466250,'2c95578f-43c9-4de5-83f7-c4bfddd1010e','00:32:15',14),
	 (65,'Flower Boy','Tyler, the Creator',2017,'rap','tyler the creator','United States','https://lastfm.freetls.fastly.net/i/u/174s/52a7f32bdc99238080b0f17e859b3b4d.jpg','English',2288059,'523f5e88-9988-436d-ab60-6d514c1f0e15','00:41:33',14);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (73,'Halo','Juana Molina',2017,'folktronica','bagel','Argentina','https://lastfm.freetls.fastly.net/i/u/174s/0982191003d1a3b6550712b1c2c34dc5.jpg','Spanish',59028,'458cc73c-863f-4166-9b71-098c09456213','00:57:24',12),
	 (107,'Your Wilderness','The Pineapple Thief',2017,'progressive rock','alternative rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/6ca531784e0929dba16f16e4e01b7ec1.jpg','English',60462,'00a0b09f-354a-4e39-bcb6-bc0cc1b5a6ad','00:45:47',8),
	 (159,'Savage Sinusoid','Igorrr',2017,'breakcore','baroque','France','https://lastfm.freetls.fastly.net/i/u/174s/012fb21d8d3bff6bc611cee6919dcd88.png','French',84416,'138e70bb-bad2-4ab2-9b82-d58a93a739d6','00:39:26',11),
	 (194,'Caravelle','Polo & Pan',2017,'relax','feel good','France','https://lastfm.freetls.fastly.net/i/u/174s/14c7595d3a47cba2b913f084611cc338.jpg','Multiple languages',228675,'3e747fb0-63ef-43ef-979f-b5bed4d6352b','00:48:11',12),
	 (241,'Somewhere in the Between','Streetlight Manifesto',2017,'ska punk','ska','United States','https://lastfm.freetls.fastly.net/i/u/174s/ddc763a5463eccd7afa96aaad1f33df3.jpg','English',191590,'70460f88-67fe-4d9e-8803-ee0d0e4f8f10','00:39:39',10),
	 (300,'The Source','Ayreon',2017,'2017','progressive metal','Netherlands','https://lastfm.freetls.fastly.net/i/u/174s/ab93fbe3a288ac9ce9e50403649f70c3.jpg','English',38227,'382fd77a-fc31-4a37-a43b-026fa0206817','01:27:43',17),
	 (320,'Rise or Die Trying','Four Year Strong',2017,'pop punk','easycore','United States','https://lastfm.freetls.fastly.net/i/u/174s/1b3200d23e63402885ffcf10ef7b33ac.png','English',277945,'0170b295-0cd1-43ee-bea8-47fef193b5a0','00:33:32',11),
	 (324,'DAMN.','Kendrick Lamar',2017,'rap','hip hop','United States','https://lastfm.freetls.fastly.net/i/u/174s/8a59ed3a9c71cb5113325e2026889e4a.png','English',2514516,'503c4a0f-97b9-4d6b-9a27-52a7f6b21cc9','00:53:44',14),
	 (328,'Gumboot Soup','King Gizzard & The Lizard Wizard',2017,'psychedelic rock','rock','Australia','https://lastfm.freetls.fastly.net/i/u/174s/dfc9bc613d46b0a6c55a2043f30ea8e2.jpg','English',122621,'2cec0da5-db58-4279-b324-4a9b9267a0ad','00:56:32',11),
	 (332,'RnB Fridays Vol. 3','Various Artists',2017,'hip-hop','rnb','--','https://lastfm.freetls.fastly.net/i/u/174s/f323e0be01d39b0d87a59d0a0ed6be5c.jpg','English',1981,'--','01:01:30',16);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (99,'MIXPEED ACTION','Kobaryo',2018,'speedcore','j-core','Japan','https://lastfm.freetls.fastly.net/i/u/174s/f7cfd88a156cbc2374b7077ae3555a65.jpg','Multiple languages',33325,'4e78ede2-31b1-4049-88cf-a65f4ee4e1e0','00:55:31',15),
	 (143,'этажи','Molchat Doma',2018,'post-punk','new wave','Belarus','https://lastfm.freetls.fastly.net/i/u/174s/ad7772faa3029d2992b7717119d30ac7.jpg','Russian',813432,'--','00:33:13',9),
	 (158,'Satan in your Stereo','Underside',2018,'thrash metal','metalcore','Nepal','https://lastfm.freetls.fastly.net/i/u/174s/44227ab9d41693d9809dc45ee1ba355e.jpg','English',1047,'811da1b3-7a39-4f54-b242-b0591274f2f0','00:26:41',8),
	 (202,'Bonito Generation','Kero Kero Bonito',2018,'electropop','poptron','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/7d34b1fbd29910723fcff54760d7074f.png','English',250382,'2777cea6-dcd4-47a7-8540-a3042fe0c636','00:34:30',12),
	 (217,'Comp','Heart to Gold',2018,'emo','post-hardcore','Minneapolis','https://lastfm.freetls.fastly.net/i/u/174s/c0cf1913e2d2a8733d2fd1542020ba31.jpg','English',31715,'86d006ac-7596-4498-a0c3-8d230e0ce256','00:31:03',10),
	 (288,'Don''t Forget About Me, Demos','Dominic Fike',2018,'pop','alternative pop','United States','https://lastfm.freetls.fastly.net/i/u/174s/1f4447aa5510de93f025a475f6bdad33.jpg','English',1340544,'--','00:02:57',6),
	 (314,'EX_MACHINA','Crossfaith',2018,'metalcore','cyber metal','Japan','https://lastfm.freetls.fastly.net/i/u/174s/f9b47e4632b77d67b90c4f462b4fead6.jpg','English',27041,'696b8c05-680d-48e6-9109-803d694fb6ed','00:45:06',14),
	 (52,'Slipknot','Slipknot',2019,'nu metal','metal','United States','https://lastfm.freetls.fastly.net/i/u/174s/9274398d6314cb5882bf4fe8dfd084f8.jpg','English',1195643,'04b427aa-c746-3057-bd9a-8654736595d4','00:12:04',6),
	 (95,'Wasteland Baby!','Hozier',2019,'rock','soul','Ireland','https://lastfm.freetls.fastly.net/i/u/770x0/83fce5201587652d2487123aeeb027b6.jpg#83fce5201587652d2487123aeeb027b6','English',109,'--','00:57:21',14),
	 (105,'Mastermind','Tardigrade Inferno',2019,'avant-garde metal','metal','Sankt-Peterburg','https://lastfm.freetls.fastly.net/i/u/174s/f992ef213d49fcb86485e3bf1ec664e7.jpg','English',27070,'27211eaf-a945-447d-9ed5-ade1f84449b8','00:40:26',12);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (117,'the first glass beach album','Glass Beach',2019,'ambient','indie rock','Los Angeles','https://lastfm.freetls.fastly.net/i/u/174s/f34ba55a817a2dd1d97668a01bb03ae8.jpg','English',461225,'1d50f075-cb08-456a-801f-6f92586840b2','00:59:16',15),
	 (118,'Socialism Core Value III','Howie Lee',2019,'sinotronics','electronic','China','https://lastfm.freetls.fastly.net/i/u/174s/eb170dc1ad5ec514ebfe22998e2b45ed.jpg','Chinese',1091,'61d5b570-abb8-4fa7-a0d6-0fb1eec47961','00:25:05',8),
	 (135,'Split Personalities','12 Rods',2019,'indie rock','power pop','Minneapolis','https://lastfm.freetls.fastly.net/i/u/174s/b35aca2f5dfcd3497085d7ad79932d5e.jpg','English',87502,'7d7880b4-190f-4519-b727-e693f9eb1421','00:46:11',10),
	 (139,'IGOR','Tyler, the Creator',2019,'neo-soul','psychedelic soul','United States','https://lastfm.freetls.fastly.net/i/u/174s/e150fa362c89b8f1d92d883ae828b7ef.jpg','English',2176194,'4603cee3-ece6-435c-b0b7-7d9eb1842d36','00:39:26',12),
	 (153,'Fear Inoculum','Tool',2019,'2019','progressive metal','United States','https://lastfm.freetls.fastly.net/i/u/174s/2f0f02152c04a29dfd2dd2027ee64ba4.jpg','English',286907,'2a71b7a2-9d14-4921-9398-8be4f7b32bea','01:18:43',10),
	 (184,'Horizons','Panda Dub',2019,'dub','electro dub','France','https://lastfm.freetls.fastly.net/i/u/174s/2a2cb85ae9e605f992604769bd52cda6.jpg','English',8738,'8733f8ee-a20f-4d86-9740-973bd89fc7d2','00:46:26',11),
	 (185,'Ray of Light','Madonna',2019,'pop','electronic','United States','https://lastfm.freetls.fastly.net/i/u/174s/f8954eaed52fc4a524ea6f333aa2464d.png','English',782618,'011a7375-3934-4088-8423-d8d03e50ea2d','01:10:51',13),
	 (204,'Greatest Hits','2Pac',2019,'rap','2pac','United States','https://lastfm.freetls.fastly.net/i/u/174s/4ca8269cfa0a4e0bb9a08aedfb645ed6.png','English',2080832,'0fc0431f-8bb0-4f10-9fb3-5852bf36992d','01:53:59',25),
	 (205,'Downtown Battle Mountain II','Dance Gavin Dance',2019,'experimental','screamo','United States','https://lastfm.freetls.fastly.net/i/u/174s/180f13c23d2a441bb5b6a7a8a7ddbe98.png','English',75265,'300deba2-f296-4192-bca6-0c6868b0144a','00:40:14',11),
	 (209,'It''s a Whimsical Afterlife','Avenade',2019,'2019','shoegaze','United States','https://lastfm.freetls.fastly.net/i/u/174s/0b61c2fae8280c3180dff8cbb3ada544.jpg','English',18543,'9332936d-4cd7-4fe4-8bb2-691289cb0086','00:08:58',11);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (230,'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?','Billie Eilish',2019,'electropop','pop','United States','https://lastfm.freetls.fastly.net/i/u/174s/c2652de4809e5b4349565518b34b85ca.jpg','English',2215155,'033ddd2b-d499-426e-872a-697a1b5ca0c2','00:54:18',17),
	 (269,'jack in the box','TRI4TH',2019,'jazz','experimental','Japan','https://lastfm.freetls.fastly.net/i/u/770x0/d05ac4521de68854e635b7648dfb244e.jpg#d05ac4521de68854e635b7648dfb244e','--',31,'f42498eb-e6a3-447a-9299-df049846c842','00:39:12',12),
	 (285,'Indigo','Chris Brown',2019,'pop rnb','rnb','United States','https://lastfm.freetls.fastly.net/i/u/174s/d113179e77b9cc2d54528d77014e85a1.jpg','English',473497,'25f18616-5a9c-470e-964d-4eb8a511435b','01:25:49',32),
	 (301,'Everyday Life','Coldplay',2019,'rock','soft rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/9b7955e365c8e73cff713a9f15d68636.png','English',319313,'0c0e81ca-9452-4cfb-83f3-35dc47ad6ec1','00:30:13',16),
	 (345,'The Phantom of the Opera','Andrew Lloyd Webber',2019,'musical','soundtrack','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/5900f5a3fa8342f685de93151494cd02.png','English',157929,'0be6ee00-e48f-4cc5-9895-929ba1432972','01:38:56',21),
	 (357,'Punk Goes Pop Vol. 3','Various Artists',2019,'post hardcore','covers','United States','https://lastfm.freetls.fastly.net/i/u/174s/201cb28ba9904897a0965bdd4254ef51.jpg','English',55752,'--','00:53:00',14),
	 (53,'Nightmare','Avenged Sevenfold',2020,'hard rock','heavy metal','United States','https://lastfm.freetls.fastly.net/i/u/174s/bd12ddaafc7344d3bf43f963f814cc90.png','English',729971,'00294ff6-043c-446d-9e61-79d4c5c26354','01:06:50',11),
	 (74,'What Kinda Music','Tom Misch',2020,'jazz','hip hop','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/08e68a01b02f096c4a55ea98fd0e30c2.jpg','English',195848,'--','00:45:03',12),
	 (80,'HELP EVER HURT NEVER','Fujii Kaze',2020,'j-pop','japanese','Japan','https://lastfm.freetls.fastly.net/i/u/174s/e002848250653c619a9dc2169ab49d9a.jpg','--',500365,'--','00:13:09',11),
	 (152,'Facelift','Alice in Chains',2020,'grunge','hard rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/0698a59a0b874793a11d3f081b14d48a.png','English',1133667,'03d18095-53f4-41a6-b037-1fe910d88c08','00:54:15',12);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (164,'Precious Dream','Hot Garbage',2020,'psychedelic rock','alternative','Canada','https://lastfm.freetls.fastly.net/i/u/174s/2b40c3ab640da79c678331754eeb04bc.jpg','English',4586,'00d1cdf7-2b54-4223-a3d5-b153c4ea8dad','00:35:37',9),
	 (174,'The Slow Rush','Tame Impala',2020,'psychedelic','psychedelic pop','Australia','https://lastfm.freetls.fastly.net/i/u/174s/832ade6a35ec2a224ea9a5be326b5de4.jpg','English',1598882,'3a12923d-97cd-4e87-8cfd-fb67be970974','00:57:20',12),
	 (178,'10 BABYMETAL YEARS','BABYMETAL',2020,'metal','kawaii metal','Japan','https://lastfm.freetls.fastly.net/i/u/174s/ba58e73afe6ef99c19d83ea78ff20641.jpg','Multiple languages',31507,'0abe78b3-e231-4a39-a841-a29c60c1b565','01:01:49',10),
	 (208,'Duality','Duke Dumont',2020,'electronic','2015','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/cf8617f9fc398fe0cc238226ff643431.jpg','English',224293,'bcf36ca0-014f-4ec5-bbf7-4f68d99452ad','00:36:33',10),
	 (228,'PHANTOMa','Mikau',2020,'melodic metalcore','progressive metalcore','United States','https://lastfm.freetls.fastly.net/i/u/174s/73d416087fa7d418df86c55ae849658e.jpg','English',1594,'5135ee57-5d0e-45c5-9e02-78ea3a093842','00:02:55',10),
	 (229,'Mura Masa','Mura Masa',2020,'future bass','lovestep','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/1d408adc25a3d4a75dc6e335af14d341.jpg','English',498775,'3096593e-ccf5-404b-a9ac-30c38b259967','00:45:10',13),
	 (254,'Future Nostalgia','Dua Lipa',2020,'pop','disco','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/7017c94ef74a476838e751b0cee1f014.png','English',1796302,'040ecdfd-b697-4418-a0f7-08719006ab6f','00:40:34',11),
	 (256,'After Hours','The Weeknd',2020,'synthpop','pop','Canada','https://lastfm.freetls.fastly.net/i/u/174s/4583932b753c96d0d2f22fe9774e5ef3.png','English',2372194,'8a61af61-cb44-497e-9bb1-2b7b137b3bfe','00:56:15',14),
	 (268,'Tickets to My Downfall','Machine Gun Kelly',2020,'pop punk','2020','Savona','https://lastfm.freetls.fastly.net/i/u/174s/08d96f5f08c019d166aed6b033d95be4.jpg','English',482551,'fe05ec66-6167-44fe-a9b8-5d8fb94dad4e','00:11:35',15),
	 (282,'THANK YOU BLUE','DAOKO',2020,'j-pop','japanese','Japan','','Japanese',161195,'0bef4156-7cfa-4bfa-9907-1e19d9bb18f2','00:50:46',14);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (329,'50th Birthday Celebration, Volume 6','Hemophiliac',2020,'free improvisation','experimental','United States','https://lastfm.freetls.fastly.net/i/u/174s/b13ecd3bc7109a7169efbf0b702f34af.png','--',559,'893a6b78-c446-4a06-91f7-8e77b2febc1c','00:49:44',7),
	 (334,'Rust In Dust','Shree 3',2020,'stoner rock','sludge metal','Nepal','https://lastfm.freetls.fastly.net/i/u/174s/a40713936df75e7a0b3cb658a2ffe1b1.jpg','--',75,'--','00:47:26',7),
	 (37,'Actual Life (April 14 - December 17 2020)','Fred again..',2021,'electronic','#selected','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/b53fb2972136d3b4807ade225392e246.jpg','English',328788,'d261c628-6184-4a20-9d33-5d4a30543bfd','00:49:28',17),
	 (42,'Another Kill For The Highlight Reel','Save Face',2021,'emo','emo pop','New Jersey','https://lastfm.freetls.fastly.net/i/u/174s/10a37c359cafa56d6462dfc9d670b267.jpg','English',13737,'885b522b-fc73-4547-993c-03d3168a7b9d','00:33:09',11),
	 (45,'Sob Rock','John Mayer',2021,'soft rock','rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/032a5cfd9cd59e9f2e3893ea7b9117a2.jpg','English',332195,'1b12bb21-4bdf-462c-ae77-2b007913caa2','00:43:12',10),
	 (77,'Gusare','ZUTOMAYO',2021,'j-pop','anime','Japan','https://lastfm.freetls.fastly.net/i/u/174s/ed19f37ec2fca6eecec611b0afe22762.png','English',2474,'bcf7fe9e-61b0-4eab-9384-362d28a3630d','00:57:38',14),
	 (90,'Happier Than Ever','Billie Eilish',2021,'pop','pop','United States','https://lastfm.freetls.fastly.net/i/u/174s/7ebd8b6f8ac6766fb26303245a265a2e.jpg','English',1689508,'0095938b-b9a2-4f72-86ee-9be5c35ee0fd','00:57:02',16),
	 (100,'Enter Your Mind','D-Block & S-te-Fan',2021,'hardstyle','hardbass','Netherlands','https://lastfm.freetls.fastly.net/i/u/174s/13465dbdd5ca39acad731ec9c8d5c5a1.jpg','Dutch',10222,'--','00:42:35',17),
	 (155,'Planet Her','Doja Cat',2021,'pop rap','pop','United States','https://lastfm.freetls.fastly.net/i/u/174s/2321c0b23c484ab566746c0dddfc777b.png','English',1963319,'1a3e39b4-562a-43d4-ac12-b1bf466abb11','00:43:53',14),
	 (172,'I Care 4 U','Aaliyah',2021,'rnb','pop rnb','United States','https://lastfm.freetls.fastly.net/i/u/174s/d5f136e9bdea3a55b4de343ebcc4db1a.jpg','English',523597,'3cf671bf-da5c-42d3-acef-7f98b9142e9d','00:49:11',14);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (245,'STOMACH BOOK','STOMACH BOOK',2021,'emo','indietronica','United States','https://lastfm.freetls.fastly.net/i/u/174s/39558f3e679d88ffd06f3e70a440a48e.jpg','English',48490,'b8cf0084-027f-4fa8-99dd-bcdb5c28db4d','00:41:19',11),
	 (295,'forgetmenot','Five Pebbles',2021,'shoegaze','dream pop','United States','https://lastfm.freetls.fastly.net/i/u/174s/5a0bb9a5b63bc4ebf4ca55b3aed0d880.png','English',66718,'e5a56f3c-6499-4a23-944c-d6494cc8b85a','00:19:48',5),
	 (327,'Butterfly 3000','King Gizzard & The Lizard Wizard',2021,'2021','synthpop','Australia','https://lastfm.freetls.fastly.net/i/u/174s/0d0355c5b67c42a7be557485eaceae07.jpg','English',178844,'771c9ecf-249c-42cd-9498-96a00586df16','00:52:36',10),
	 (343,'The Seven Foot Tall Post-Suicidal Feel Good Blues','Nancy',2021,'indie-rock','experimental','United States','https://lastfm.freetls.fastly.net/i/u/174s/d3fbcb1f56c4a3ac2b3071c77a46b5de.jpg','English',21805,'a0c8165a-3051-46c5-a81a-99491ea2d687','00:27:00',10),
	 (68,'PAINLESS','Nilufer Yanya',2022,'indie rock','indie pop','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/129361b752422523f15c0e94d5919de5.jpg','English',1158,'--','00:46:27',12),
	 (97,'I Can’t Let Go','Suki Waterhouse',2022,'dream pop','indie rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/770x0/f56ff57a23a01ddde2d656cf8e6d04b2.jpg#f56ff57a23a01ddde2d656cf8e6d04b2','English',14,'--','00:33:28',10),
	 (116,'LOVE ALL SERVE ALL','Fujii Kaze',2022,'rnb','japan','Japan','https://lastfm.freetls.fastly.net/i/u/174s/655bd5687606d09c451cca7780e2ac9b.jpg','Japanese',214609,'--','00:46:18',11),
	 (121,'Wet Leg','Wet Leg',2022,'2022','indie rock','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/14e7090ffabb2ecd5e9bf8c8f5a108b9.jpg','English',501357,'949c1b3a-db54-4302-90b3-ec8d0f70a45b','00:38:35',12),
	 (173,'Onomatomani[a]kus','Marmalade butcher',2022,'math rock','shoegaze','Japan','https://lastfm.freetls.fastly.net/i/u/174s/f15058dce553c20a660398f64de39a39.jpg','Japanese',6635,'--','00:27:21',9),
	 (215,'USB','Fred again..',2022,'house','electronic','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/a513692d1b03f6fe41dceecf0d725cf3.jpg','English',363478,'52c3f402-6651-4642-afd7-de8f9d102dc1','00:24:19',6);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (221,'Midnights','Taylor Swift',2022,'2022','midnights (3am edition)','United States','https://lastfm.freetls.fastly.net/i/u/174s/8914bab2a0e4e454c6892f151d57208f.png','English',1495920,'4101202a-1aca-4756-8c07-752dca888722','00:44:10',13),
	 (223,'Kyougen','Ado',2022,'electronic','dance','Japan','https://lastfm.freetls.fastly.net/i/u/174s/f718febfe13c0f349f136d6a68ce14e0.jpg','Japanese',172913,'3106ffb9-4872-40ba-acde-2a07f41d7403','00:52:55',14),
	 (226,'Harry''s House','Harry Styles',2022,'pop','pop','England','https://lastfm.freetls.fastly.net/i/u/174s/931b66df2652b311fb1078ac189a2e96.jpg','English',1728666,'6d8f2455-baa3-423c-8607-b7ea4a560fe3','00:41:52',13),
	 (238,'ERROR','The Warning',2022,'hard rock','4','Mexico','https://lastfm.freetls.fastly.net/i/u/174s/6d9b52e170f11b2301176c506d06ec16.jpg','Multiple languages',48718,'dac15bb0-6b9b-49fe-b76a-0efd19c5f371','00:54:44',14),
	 (270,'Dirt (2022 Remaster)','Alice in Chains',2022,'grunge','alternative metal','United States','https://lastfm.freetls.fastly.net/i/u/174s/5c4b6583f6112eaa243f12ca00527068.jpg','English',646864,'e83ad027-db6b-4dc8-aaa5-866a00d1e17f','00:57:31',13),
	 (271,'TEKKNO','Electric Callboy',2022,'electro','metalcore','Germany','https://lastfm.freetls.fastly.net/i/u/174s/85334a57b2b2a85bfd61a808add64741.jpg','English',141118,'--','00:24:35',10),
	 (289,'Key Ingredient','Mili',2022,'folk','new age','Japan','https://lastfm.freetls.fastly.net/i/u/174s/ec31ecacc6f2396bb1a9991ef26ee7f0.jpg','English',12370,'cec3d5ba-2ac2-4f7a-ad8f-c40e7a1376df','00:44:08',13),
	 (307,'Stick Season','Noah Kahan',2022,'2022','folk','United States','https://lastfm.freetls.fastly.net/i/u/174s/370510f1781a9bd351389b6633c517ed.jpg','English',807386,'--','00:03:02',1),
	 (67,'Blouse Club','Problem Patterns',2023,'riot girl','punk','Belfast','https://lastfm.freetls.fastly.net/i/u/174s/f0251b295532df03d9f166764ab34752.jpg','English',3767,'--','00:29:12',12),
	 (79,'You’re Welcome','Lambrini Girls',2023,'riot girl','garage punk','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/38072555b93beaa02e4e0cfff52b1870.jpg','English',31,'60ce5e09-38c8-4319-8fe0-92f65994774a','00:19:06',6);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (108,'1989 (Taylor''s Version)','Taylor Swift',2023,'pop','synthpop','United States','https://lastfm.freetls.fastly.net/i/u/174s/f58d29605321bc6e1ee4da6ae5a0cb4a.jpg','English',1001898,'1708c609-ce4f-41ff-957f-e9cbfea479f6','01:01:04',16),
	 (169,'Se Bueno','TURQUOISEDEATH',2023,'breakcore','drum n bass','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/235b4c88ce22538011958036741ec2fc.jpg','English',17599,'3bdf7ee5-665f-4e21-b7d5-7a3de617ef00','00:29:32',9),
	 (180,'Desire, I Want to Turn Into You','Caroline Polachek',2023,'2023','art pop','United States','https://lastfm.freetls.fastly.net/i/u/174s/8efbfdc3ffd98d732a93e75aa5a53852.jpg','English',449138,'05880dab-780b-40e9-85ed-16606b79b7f5','00:45:04',12),
	 (187,'Why Would I Watch','Hot Mulligan',2023,'2023','emocore','Lansing','https://lastfm.freetls.fastly.net/i/u/174s/21e3053a3faec5dd7a5bf65f6305f345.png','English',87936,'5081b2e4-d694-46ef-99b4-84bf4c717638','00:37:19',12),
	 (195,'Volcano','Jungle',2023,'dance','electronic','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/d9a2ed33d293d14649500d483c74a144.jpg','English',670247,'14fbd2c0-0468-4cd7-9630-6aa655e11d5b','00:32:25',14),
	 (207,'UTOPIA','Travis Scott',2023,'experimental hip hop','alternative rnb','United States','https://lastfm.freetls.fastly.net/i/u/174s/6644c67eaa3669676252d3190f9b019f.jpg','English',1531471,'d6091fdc-58a1-4659-8d31-7b2be5021e20','01:13:27',19),
	 (290,'So Much (for) Stardust','Fall Out Boy',2023,'2023','rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/46f8fabfef2e1e3a82a2a612c9c2b82c.jpg','English',227561,'9774cdb8-10ff-4aef-a3e0-53b5697dac12','00:44:13',13),
	 (338,'THE BOOK 3','YOASOBI',2023,'japanese','jpop','Japan','https://lastfm.freetls.fastly.net/i/u/174s/f266442b5d028045a395943793ab4456.jpg','Japanese',164208,'37e42e02-9eb9-41fd-b962-427cd8b30265','00:29:24',10),
	 (340,'Postcard - EP','No Waves',2023,'new wave','post-punk','United States','https://lastfm.freetls.fastly.net/i/u/174s/37310ac84339ce99f4267f199c9742d5.jpg','English',647,'--','00:17:37',6),
	 (344,'METRO BOOMIN PRESENTS SPIDER-MAN: ACROSS THE SPIDER-VERSE (SOUNDTRACK FROM AND INSPIRED BY THE MOTION PICTURE)','Metro Boomin',2023,'Movie Soundtrack','rap','United States','https://lastfm.freetls.fastly.net/i/u/174s/dc3bdeadd7ef481945b1c8c062757bae.jpg','English',824177,'8d7cbd0e-73e6-4915-94f7-8a79bea24709','00:47:06',13);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (69,'The Code','Nemo',2024,'edm','eurovision','Switzerland','https://lastfm.freetls.fastly.net/i/u/174s/c9ad50567e38097061e5fcb0d40bff02.jpg','English',131460,'2a04d104-0486-42c8-b9d7-a619c2774caa','00:03:00',1),
	 (89,'WE DON''T TRUST YOU','Future and Metro Boomin',2024,'rap','trap','United States','https://lastfm.freetls.fastly.net/i/u/174s/ba75a60bf13208bbd87b43825ef8363d.jpg','English',16400,'--','00:59:39',17),
	 (92,'THIS MAY BE BASED ON A TRUE STORY (idk)','Changeline',2024,'trap','lathe','Paris','https://lastfm.freetls.fastly.net/i/u/174s/290f231c7c834bc62548609905133097.jpg','English',1217,'--','00:18:37',7),
	 (94,'ReVertPunk!','DJ Re:code',2024,'punk','hardcore','Boston','https://lastfm.freetls.fastly.net/i/u/174s/714ec71162cbfe908873e80042d08da8.jpg','English',4966,'591f9abf-21ac-4576-9986-2d078bf66c7e','00:28:43',13),
	 (201,'I''ve Tried Everything But Therapy (Part 1.5)','Teddy Swims',2024,'soul','rnb','United States','https://lastfm.freetls.fastly.net/i/u/174s/c40b8be626a4f67fb714b697dffc43aa.jpg','English',62903,'49a76ffb-fdbd-4fa4-b5ce-f01301d6500a','00:42:46',14),
	 (227,'Romance','Fontaines DC',2024,'alt rock','rock','Ireland','https://lastfm.freetls.fastly.net/i/u/174s/b2d96972457a85a73df53837a115ace0.jpg','English',30,'--','00:36:57',11),
	 (232,'Wrapped In Cellophane','Vessel',2024,'experimental','electro jazz','United Kingdom','https://lastfm.freetls.fastly.net/i/u/174s/1f6e9db412a9de4da91fd39ebb17dc9f.jpg','English',838,'--','00:32:56',12),
	 (246,'At The Drolma Wesel-Ling Monastery','Howie Lee',2024,'bass futurism','electronic','China','https://lastfm.freetls.fastly.net/i/u/174s/24f4a27295bbb7704c38931cb1430062.jpg','English',952,'a4e07de2-f3a9-491a-a6ad-c44f2623f88b','00:31:37',8),
	 (279,'The Set List','No Doubt',2024,'pop','rock','United States','https://lastfm.freetls.fastly.net/i/u/174s/c563ef3c1d9044d980902786a595bb14.png','English',65194,'820e50cd-979e-4ac2-8542-cce44f0cf67f','01:07:46',17),
	 (316,'HIT ME HARD AND SOFT','Billie Eilish',2024,'aoty','2024','United States','https://lastfm.freetls.fastly.net/i/u/174s/e69971625c379772fb79213dccfa194f.jpg','English',1938380,'43869ac5-c515-41a4-8ce1-d4a0c67e30c1','00:43:49',10);
INSERT INTO albums (id,title,artist,release_year,genre,subgenre,country,image,"language",listeners,mbid,duration,tracks) VALUES
	 (342,'EPIC: The Underworld Saga (Official Concept Album)','Jorge Rivera-Herrans',2024,'orchestral','rock','Puerto Rico','https://lastfm.freetls.fastly.net/i/u/174s/92cdac6a4fc1cf6d5f3e98d4e8e56871.png','English',50305,'df2fd6d4-d873-4078-8ab7-19ba9819ac3d','00:10:41',3),
	 (349,'Coup de Grâce','SeeYouSpaceCowboy...',2024,'metalcore','mathcore','United States','https://lastfm.freetls.fastly.net/i/u/174s/627333496a38adcc99bc6748cbaed8c7.jpg','English',31059,'--','00:39:03',12);


INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (358,'Leo','2024-07-05'),
	 (357,'Sam','2024-06-24'),
	 (38,'Sam','2024-06-28'),
	 (39,'Sam','2024-06-26'),
	 (356,'Caitlyn','2024-07-05'),
	 (355,'Alana','2024-08-16'),
	 (354,'Nick','2024-06-26'),
	 (354,'Rick','2024-08-15'),
	 (353,'Margo','2024-06-25'),
	 (37,'Caitlyn','2024-06-12');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (352,'Addi','2024-08-15'),
	 (351,'Alana','2024-07-16'),
	 (350,'Alana','2024-07-18'),
	 (349,'Deacon','2024-06-14'),
	 (348,'Addi','2024-06-14'),
	 (347,'Margo','2024-06-12'),
	 (346,'Margo','2024-06-07'),
	 (182,'Alana','2024-06-20'),
	 (345,'Tung','2024-06-14'),
	 (344,'Caitlyn','2024-06-20');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (343,'Dani','2024-06-24'),
	 (342,'Tung','2024-06-20'),
	 (341,'Nick','2024-07-03'),
	 (340,'Deacon','2024-07-03'),
	 (339,'Maricar','2024-08-06'),
	 (338,'Leo','2024-07-09'),
	 (337,'Alana','2024-07-04'),
	 (336,'Taylah','2024-07-10'),
	 (335,'Tung','2024-07-22'),
	 (334,'Kishor','2024-08-06');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (333,'Dani','2024-08-12'),
	 (332,'Caitlyn','2024-08-23'),
	 (331,'Margo','2024-07-01'),
	 (330,'Margo','2024-07-05'),
	 (329,'Leo','2024-07-16'),
	 (328,'Addi','2024-07-18'),
	 (327,'Addi','2024-08-21'),
	 (326,'Rick','2024-06-04'),
	 (325,'Nick','2024-06-07'),
	 (324,'Caitlyn','2024-06-07');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (323,'Kishor','2024-06-07'),
	 (322,'Tung','2024-06-07'),
	 (320,'Dave','2024-06-07'),
	 (319,'Dani','2024-06-11'),
	 (318,'Wietse','2024-06-11'),
	 (317,'Deacon','2024-06-11'),
	 (316,'Alana','2024-06-11'),
	 (315,'Taylah','2024-06-11'),
	 (314,'Wietse','2024-06-11'),
	 (313,'Maricar','2024-06-11');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (35,'Dani','2024-06-12'),
	 (310,'Kishor','2024-06-12'),
	 (309,'Leo','2024-06-12'),
	 (308,'Dani','2024-06-14'),
	 (307,'Caitlyn','2024-06-14'),
	 (305,'Alana','2024-06-14'),
	 (303,'Dave','2024-06-14'),
	 (302,'Sam','2024-06-17'),
	 (301,'Tung','2024-06-17'),
	 (300,'Wietse','2024-06-17');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (299,'Rick','2024-06-17'),
	 (298,'Dani','2024-06-17'),
	 (297,'Margo','2024-06-17'),
	 (296,'Kishor','2024-06-17'),
	 (295,'Deacon','2024-06-17'),
	 (294,'Margo','2024-06-20'),
	 (218,'Kishor','2024-06-20'),
	 (216,'Taylah','2024-06-20'),
	 (292,'Dave','2024-06-20'),
	 (291,'Rick','2024-06-20');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (290,'Sam','2024-06-20'),
	 (289,'Tung','2024-06-24'),
	 (288,'Caitlyn','2024-06-24'),
	 (287,'Kishor','2024-06-24'),
	 (286,'Taylah','2024-06-24'),
	 (285,'Maricar','2024-06-24'),
	 (284,'Margo','2024-06-24'),
	 (282,'Leo','2024-06-25'),
	 (33,'Dani','2024-06-25'),
	 (281,'Maricar','2024-06-25');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (280,'Caitlyn','2024-06-25'),
	 (262,'Tung','2024-06-25'),
	 (279,'Alana','2024-06-25'),
	 (278,'Taylah','2024-06-26'),
	 (277,'Matt','2024-06-26'),
	 (276,'Kishor','2024-06-26'),
	 (275,'Tung','2024-06-26'),
	 (274,'Dave','2024-06-26'),
	 (273,'Margo','2024-06-26'),
	 (272,'Matt','2024-06-28');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (271,'Wietse','2024-06-28'),
	 (270,'Taylah','2024-06-28'),
	 (269,'Deacon','2024-06-28'),
	 (268,'Caitlyn','2024-07-01'),
	 (267,'Sam','2024-07-01'),
	 (266,'Dani','2024-07-01'),
	 (265,'Deacon','2024-07-01'),
	 (264,'Leo','2024-07-01'),
	 (263,'Dave','2024-07-01'),
	 (262,'Tung','2024-07-01');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (261,'Sam','2024-07-03'),
	 (260,'Kishor','2024-07-03'),
	 (259,'Taylah','2024-07-03'),
	 (256,'Alana','2024-07-03'),
	 (255,'Leo','2024-07-03'),
	 (254,'Margo','2024-07-04'),
	 (252,'Dave','2024-07-04'),
	 (251,'Deacon','2024-07-04'),
	 (250,'Matt','2024-07-04'),
	 (249,'Taylah','2024-07-04');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (247,'Matt','2024-07-05'),
	 (246,'Taylah','2024-07-05'),
	 (245,'Dani','2024-07-05'),
	 (244,'Alana','2024-07-05'),
	 (243,'Nick','2024-07-05'),
	 (242,'Deacon','2024-07-05'),
	 (241,'Sam','2024-07-05'),
	 (239,'Deacon','2024-07-05'),
	 (238,'Wietse','2024-07-08'),
	 (237,'Addi','2024-07-08');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (236,'Taylah','2024-07-08'),
	 (235,'Maricar','2024-07-08'),
	 (234,'Margo','2024-07-08'),
	 (233,'Sam','2024-07-08'),
	 (232,'Dani','2024-07-08'),
	 (231,'Kishor','2024-07-08'),
	 (230,'Tung','2024-07-09'),
	 (229,'Caitlyn','2024-07-09'),
	 (228,'Deacon','2024-07-09'),
	 (227,'Addi','2024-07-09');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (226,'Alana','2024-07-09'),
	 (225,'Matt','2024-07-09'),
	 (224,'Taylah','2024-07-09'),
	 (223,'Dani','2024-07-09'),
	 (222,'Dave','2024-07-10'),
	 (221,'Tung','2024-07-10'),
	 (220,'Alana','2024-07-10'),
	 (219,'Kishor','2024-07-10'),
	 (218,'Addi','2024-07-10'),
	 (217,'Deacon','2024-07-11');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (216,'Addi','2024-07-11'),
	 (215,'Caitlyn','2024-07-11'),
	 (214,'Taylah','2024-07-11'),
	 (213,'Alana','2024-07-11'),
	 (212,'Sam','2024-07-11'),
	 (211,'Matt','2024-07-11'),
	 (210,'Nick','2024-07-12'),
	 (209,'Deacon','2024-07-12'),
	 (208,'Alana','2024-07-12'),
	 (207,'Tung','2024-07-12');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (206,'Dani','2024-07-12'),
	 (205,'Leo','2024-07-12'),
	 (204,'Maricar','2024-07-15'),
	 (202,'Leo','2024-07-15'),
	 (201,'Alana','2024-07-15'),
	 (200,'Addi','2024-07-15'),
	 (199,'Taylah','2024-07-15'),
	 (198,'Margo','2024-07-15'),
	 (197,'Wietse','2024-07-15'),
	 (196,'Deacon','2024-07-16');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (195,'Addi','2024-07-16'),
	 (194,'Tung','2024-07-16'),
	 (192,'Dani','2024-07-16'),
	 (191,'Kishor','2024-07-16'),
	 (190,'Wietse','2024-07-16'),
	 (189,'Dave','2024-07-18'),
	 (187,'Sam','2024-07-18'),
	 (186,'Deacon','2024-07-18'),
	 (185,'Margo','2024-07-18'),
	 (184,'Taylah','2024-07-18');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (183,'Sam','2024-07-19'),
	 (182,'Nick','2024-07-19'),
	 (181,'Dani','2024-07-19'),
	 (180,'Addi','2024-07-19'),
	 (179,'Caitlyn','2024-07-19'),
	 (178,'Wietse','2024-07-19'),
	 (177,'Deacon','2024-07-19'),
	 (176,'Kishor','2024-07-19'),
	 (175,'Margo','2024-07-22'),
	 (174,'Kishor','2024-07-22');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (173,'Deacon','2024-07-22'),
	 (172,'Maricar','2024-07-22'),
	 (171,'Dani','2024-07-22'),
	 (170,'Matt','2024-07-22'),
	 (169,'Deacon','2024-07-23'),
	 (168,'Kishor','2024-07-23'),
	 (167,'Margo','2024-07-23'),
	 (166,'Taylah','2024-07-23'),
	 (165,'Maricar','2024-07-23'),
	 (164,'Dani','2024-07-23');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (163,'Matt','2024-07-23'),
	 (162,'Nick','2024-07-26'),
	 (161,'Alana','2024-07-26'),
	 (160,'Dani','2024-07-26'),
	 (159,'Deacon','2024-07-26'),
	 (158,'Kishor','2024-07-26'),
	 (157,'Sam','2024-07-26'),
	 (156,'Caitlyn','2024-07-26'),
	 (155,'Taylah','2024-07-26'),
	 (154,'Addi','2024-07-26');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (153,'Kishor','2024-07-29'),
	 (152,'Taylah','2024-07-29'),
	 (151,'Jess','2024-07-29'),
	 (150,'Margo','2024-07-29'),
	 (149,'Alana','2024-07-29'),
	 (148,'Matt','2024-07-29'),
	 (147,'Addi','2024-07-29'),
	 (146,'Addi','2024-07-30'),
	 (145,'Kishor','2024-07-30'),
	 (144,'Margo','2024-07-30');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (143,'Dani','2024-07-30'),
	 (142,'Deacon','2024-07-30'),
	 (141,'Alana','2024-07-30'),
	 (140,'Dave','2024-07-30'),
	 (139,'Caitlyn','2024-08-01'),
	 (138,'Alana','2024-08-01'),
	 (137,'Addi','2024-08-01'),
	 (136,'Kishor','2024-08-01'),
	 (135,'Deacon','2024-08-01'),
	 (134,'Wietse','2024-08-02');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (133,'Jess','2024-08-02'),
	 (132,'Matt','2024-08-02'),
	 (131,'Leo','2024-08-02'),
	 (130,'Margo','2024-08-02'),
	 (129,'Margo','2024-08-05'),
	 (128,'Sam','2024-08-05'),
	 (127,'Taylah','2024-08-05'),
	 (126,'Leo','2024-08-05'),
	 (125,'Addi','2024-08-06'),
	 (124,'Caitlyn','2024-08-06');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (123,'Matt','2024-08-06'),
	 (122,'Wietse','2024-08-09'),
	 (121,'Addi','2024-08-09'),
	 (120,'Nick','2024-08-09'),
	 (119,'Margo','2024-08-09'),
	 (118,'Taylah','2024-08-09'),
	 (117,'Deacon','2024-08-12'),
	 (116,'Tung','2024-08-12'),
	 (115,'Matt','2024-08-12'),
	 (114,'Addi','2024-08-12');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (113,'Margo','2024-08-12'),
	 (112,'Taylah','2024-08-13'),
	 (111,'Caitlyn','2024-08-13'),
	 (110,'Wietse','2024-08-13'),
	 (109,'Leo','2024-08-13'),
	 (108,'Alana','2024-08-13'),
	 (107,'Kishor','2024-08-13'),
	 (105,'Dani','2024-08-15'),
	 (104,'Sam','2024-08-15'),
	 (103,'Dave','2024-08-15');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (102,'Taylah','2024-08-15'),
	 (100,'Wietse','2024-08-16'),
	 (99,'Deacon','2024-08-16'),
	 (98,'Nick','2024-08-16'),
	 (97,'Margo','2024-08-16'),
	 (96,'Matt','2024-08-16'),
	 (95,'Margo','2024-08-19'),
	 (94,'Deacon','2024-08-19'),
	 (93,'Wietse','2024-08-19'),
	 (92,'Dani','2024-08-19');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (91,'Taylah','2024-08-19'),
	 (90,'Tung','2024-08-20'),
	 (89,'Caitlyn','2024-08-20'),
	 (88,'Addi','2024-08-20'),
	 (87,'Alana','2024-08-20'),
	 (86,'Matt','2024-08-20'),
	 (85,'Sam','2024-08-21'),
	 (84,'Dave','2024-08-21'),
	 (83,'Taylah','2024-08-21'),
	 (82,'Rick','2024-08-21');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (81,'Nick','2024-08-21'),
	 (80,'Tung','2024-08-21'),
	 (79,'Margo','2024-08-21'),
	 (78,'Matt','2024-08-21'),
	 (77,'Leo','2024-08-22'),
	 (76,'Sam','2024-08-22'),
	 (75,'Deacon','2024-08-22'),
	 (74,'Addi','2024-08-22'),
	 (73,'Dani','2024-08-22'),
	 (72,'Taylah','2024-08-22');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (71,'Kishor','2024-08-23'),
	 (70,'Margo','2024-08-23'),
	 (69,'Tung','2024-08-26'),
	 (61,'Matt','2024-08-26'),
	 (68,'Addi','2024-08-26'),
	 (67,'Margo','2024-08-26'),
	 (66,'Kishor','2024-08-26'),
	 (65,'Caitlyn','2024-08-26'),
	 (64,'Sam','2024-08-26'),
	 (57,'Taylah','2024-08-26');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (56,'Rick','2024-08-27'),
	 (55,'Dani','2024-08-27'),
	 (54,'Dave','2024-08-27'),
	 (50,'Caitlyn','2024-08-29'),
	 (48,'Margo','2024-08-29'),
	 (46,'Sam','2024-08-29'),
	 (45,'Kishor','2024-08-29'),
	 (37,'Addi','2024-08-30'),
	 (44,'Rick','2024-08-30'),
	 (43,'Taylah','2024-08-30');
INSERT INTO album_listens (album_id,requested_by,requested_date) VALUES
	 (42,'Deacon','2024-08-30'),
	 (41,'Nick','2024-08-30'),
	 (40,'Leo','2024-08-30');


-- Down
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS album_listens;


