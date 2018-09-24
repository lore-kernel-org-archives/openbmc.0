Return-Path: <a.bartolini@unibo.it>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=unibo.it
 (client-ip=104.47.0.117; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=a.bartolini@unibo.it; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=unibo.it
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=liveunibo.onmicrosoft.com
 header.i=@liveunibo.onmicrosoft.com header.b="C9RvDJwK"; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0117.outbound.protection.outlook.com [104.47.0.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42JlYQ20sJzF1fD
 for <openbmc@lists.ozlabs.org>; Mon, 24 Sep 2018 23:34:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=liveunibo.onmicrosoft.com; s=selector1-unibo-it;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7cNYrmeJIbpPkoD3pJ3IiPAATE8Dv83GA7XMag7ZA0=;
 b=C9RvDJwKP0iLeRg+HOSwg7oC3nfWv2bpRtD256msRM1/4reIF1i+Fx0Mgbq7JnouOlMy5mwfOLKi/u3dt0aqPj8pBSTrmjvGypXk93T/J5ei65vD4NG7ChwmcKFiRhS8PpsE2wxTNcw5u/V5WZzmrDMyY3tmNzQSfUb1i8fd2c8=
Received: from AM0PR01MB3988.eurprd01.prod.exchangelabs.com (52.135.144.13) by
 AM0PR01MB4353.eurprd01.prod.exchangelabs.com (52.135.145.158) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.25; Mon, 24 Sep 2018 13:34:16 +0000
Received: from AM0PR01MB3988.eurprd01.prod.exchangelabs.com
 ([fe80::487d:3b4:7a0:3d9d]) by AM0PR01MB3988.eurprd01.prod.exchangelabs.com
 ([fe80::487d:3b4:7a0:3d9d%2]) with mapi id 15.20.1143.017; Mon, 24 Sep 2018
 13:34:15 +0000
From: Andrea Bartolini <a.bartolini@unibo.it>
To: Pietro Maltoni <pietro.maltoni@studio.unibo.it>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: R: Question on Flashing fw, bmc image and MQTT tool in openpower
 palmetto system
Thread-Topic: Question on Flashing fw, bmc image and MQTT tool in openpower
 palmetto system
Thread-Index: AQHUVAhi3fzkyrUrG0m3I5IevCf3BqT/beiw
Date: Mon, 24 Sep 2018 13:34:15 +0000
Message-ID: <AM0PR01MB3988B6F4A8217609C8C8FDAE91170@AM0PR01MB3988.eurprd01.prod.exchangelabs.com>
References: <AM6PR01MB4038467F3EE3379826DE33E9CF170@AM6PR01MB4038.eurprd01.prod.exchangelabs.com>
In-Reply-To: <AM6PR01MB4038467F3EE3379826DE33E9CF170@AM6PR01MB4038.eurprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=a.bartolini@unibo.it; 
x-originating-ip: [137.204.150.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM0PR01MB4353;
 6:Y7jkz4HGRVzPO7j2xGQ33YYD5Dmi2iecbZ0YrvWj1qk2SmT+XcGUZn7re6FCckGgPBuNdMvdBzk5YzouG60Ly4pgb4v3O2N4mnmvsFeKJYmCQcFVXublO46o5NKvVZDEEH7at5paBooi4d/vJ2HMlv28r5wuGySSNFhmIOoMCowEdGiucE2LpDzfcRMqzzci9iBku+doGb+18yrIxLGFBjc3Q0xf0WYnlY6TWVt17/11RF+hVBU5s35QA7mRUTPMkmSbRrFEpmoq/1Iozev9jw4KTRlaNtsoEMrenCLAgT2hTP17dI5wPx/YmbpurSbMa4i4zF+6wA2elXROg2tStOo2RIv2f7DOoLc8c4hUn3hIzX4uMxtIN6nWUAxWEC2vohglOw4TurvEZCxNnN2rB4fxQIoJkNxJgZc5tCmo84pKSBC3CK59KsQTQWSmhOYbLxxVk1i4mfc3mh/Hi/V2Jw==;
 5:V+HPPteLJUXTjH5DsN57BTlVgZ7zVY2/xv8hohrS0cs8zHqrRj8WpOy5gq59XcZKuXFwYAdXaXduS0FcvqyM7HkCKjLWnJFLr51/P6YivYYB9d2QGjG/hdJLRUg7w6tHDPRT9GeJ67QfFaAMzUVRLfHUSPkNJSUuAJLvdKn7V+I=;
 7:OMRI8nwUhT69AfSO+Dt0HEVZwDPbEQrYULVvAmoWu16ePVtgfNu+0zIY0bl4wXbGXZN3Pfg9/4Pu1gd+8CIdiR6kZ+ufBxDX5k9BggPTrkQwtSwRfzvW53Gf72DvN0dG1tgyb19DtzhPJSMKzSKdiAQ2oH0UsE1UUtSymdsO1OQyAGfxHBEf03zNFUYl4kkUma2Zm7ggZQ7fz7bPksMLTRp7asOze6gMye6s2FsqRFQDdjYDQoaIcyuxC+Urk/gx
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(136003)(396003)(39860400002)(376002)(346002)(366004)(189003)(199004)(786003)(316002)(19627235002)(2900100001)(8936002)(97736004)(256004)(14444005)(106356001)(14454004)(478600001)(5660300001)(8676002)(81166006)(81156014)(2906002)(105586002)(7736002)(74316002)(74482002)(6436002)(6506007)(6306002)(9686003)(54896002)(55016002)(486006)(11346002)(446003)(476003)(66066001)(99286004)(790700001)(6116002)(110136005)(68736007)(86362001)(53936002)(71200400001)(71190400001)(3846002)(7696005)(102836004)(5250100002)(2501003)(26005)(33656002)(25786009)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR01MB4353;
 H:AM0PR01MB3988.eurprd01.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-correlation-id: 28b8d099-3754-4aca-42fd-08d622226c21
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:AM0PR01MB4353; 
x-ms-traffictypediagnostic: AM0PR01MB4353:
x-microsoft-antispam-prvs: <AM0PR01MB4353018DBCFD7FA6A150D54391170@AM0PR01MB4353.eurprd01.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(163750095850)(65623756079841)(72170088055959)(21748063052155)(28532068793085)(190501279198761)(227612066756510);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231355)(944501410)(52105095)(149066)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(201703131423095)(201702281529075)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051);
 SRVR:AM0PR01MB4353; BCL:0; PCL:0; RULEID:; SRVR:AM0PR01MB4353; 
x-forefront-prvs: 0805EC9467
received-spf: None (protection.outlook.com: unibo.it does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: YeM9bWiciLJjP4vxviZnbJoDekHC/eUJadvRBcTXEYyNj6T4GE2Ut57egjmR2Xx/AOcxV079wGJnpSox5OGYXFq5UQyNS/Off0y8L23eW6WSPparKSTZVg04YIM2yS+ndthvuUZfxbEW5/s+NJg9wBjGdCEokCs3w7JOF8IhdE8uq8eT5WqPMYINai15tW1dzouNkWC5AqKmkNQwkzo3GsRbrED55LlKNg/ZMWYRdkTC/a2L56eSon7JD2JGAqJau8P4DM3hHtCUAdIeYDfrmjgrybnMdt08L45ALz1UJ+TxdWIdFy73pKSu2K075JgoyTDvbBPuGun44Wt5r5DyY36WqZ3znNEzDdZtjbN7p7k=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_AM0PR01MB3988B6F4A8217609C8C8FDAE91170AM0PR01MB3988eurp_"
MIME-Version: 1.0
X-OriginatorOrg: unibo.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b8d099-3754-4aca-42fd-08d622226c21
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2018 13:34:15.6654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e99647dc-1b08-454a-bf8c-699181b389ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR01MB4353
X-Mailman-Approved-At: Wed, 26 Sep 2018 09:51:14 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2018 13:34:36 -0000

--_000_AM0PR01MB3988B6F4A8217609C8C8FDAE91170AM0PR01MB3988eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Pietro hai fatto un po' di confusione.

Allora stai scrivendo ad una mailing list.

Il motivo per cui lo facciamo non ha senso divulgarlo in quanto crea casino=
.
MQTT e OEM sono problemi distinti, quindi non ha senso metterli insieme.

Devi essere molto pi=F9 conciso e puntuale se no nessuno ti risponde.

Puoi rimandarmi il testo alla luce di ci=F2, dopo che te l'ho rivisto lo ri=
posti nella mailing list.

Andrea

Da: Pietro Maltoni
Inviato: luned=EC 24 settembre 2018 15:13
A: openbmc@lists.ozlabs.org
Cc: Andrea Bartolini <a.bartolini@unibo.it>
Oggetto: Question on Flashing fw, bmc image and MQTT tool in openpower palm=
etto system


Trying to set up a more efficient sensor monitoring for openpower sysem and=
 after a look in the openbmc code and occ we found a probem.

The problem that we were seeing was due to the fact that in the palmetto co=
nfiguration for openbmc, the openpower oem recipes are not activated.



Furthermore on inserting MQTT support in the openbmc image, we saw that mos=
quitto is already included in openembedded but it does not build properly b=
ecause it seems to have dependencies with openssl that it can't fix.



We are now working to activate them. Do you know by any chance if there is =
already a description on how to do it properly?

--_000_AM0PR01MB3988B6F4A8217609C8C8FDAE91170AM0PR01MB3988eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.StileMessaggioDiPostaElettronica19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 2.0cm 2.0cm 2.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"IT" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Pietro ha=
i fatto un po&#8217; di confusione.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Allora st=
ai scrivendo ad una mailing list.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Il motivo=
 per cui lo facciamo non ha senso divulgarlo in quanto crea casino.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">MQTT e OE=
M sono problemi distinti, quindi non ha senso metterli insieme.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Devi esse=
re molto pi=F9 conciso e puntuale se no nessuno ti risponde.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Puoi rima=
ndarmi il testo alla luce di ci=F2, dopo che te l&#8217;ho rivisto lo ripos=
ti nella mailing list.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Andrea<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>Da:</b> Pietro Maltoni <br>
<b>Inviato:</b> luned=EC 24 settembre 2018 15:13<br>
<b>A:</b> openbmc@lists.ozlabs.org<br>
<b>Cc:</b> Andrea Bartolini &lt;a.bartolini@unibo.it&gt;<br>
<b>Oggetto:</b> Question on Flashing fw, bmc image and MQTT tool in openpow=
er palmetto system<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div id=3D"divtagdefaultwrapper">
<p><span style=3D"color:#212121">Trying to set up a more efficient sensor m=
onitoring for openpower sysem and after a look in the openbmc code and occ =
we found a probem.</span><span style=3D"font-size:12.0pt;color:black"><o:p>=
</o:p></span></p>
<p><span style=3D"color:#212121">The problem that we were seeing was due to=
 the fact that in the palmetto configuration for openbmc, the openpower oem=
 recipes are not activated.</span><span style=3D"font-size:12.0pt;color:bla=
ck"><o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"color:#212121">Furthermore on inserting MQTT support in t=
he openbmc image, we saw that mosquitto is already included in openembedded=
 but it does not build properly because it seems to have dependencies with =
openssl that it can't fix.</span><span style=3D"font-size:12.0pt;color:blac=
k"><o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"color:#212121">We are now working to activate them. Do yo=
u know by any chance if there is already a description on how to do it prop=
erly?</span><span style=3D"font-size:12.0pt;color:black"><o:p></o:p></span>=
</p>
</div>
</div>
</div>
</body>
</html>

--_000_AM0PR01MB3988B6F4A8217609C8C8FDAE91170AM0PR01MB3988eurp_--
