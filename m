Return-Path: <dthompson@mellanox.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.13.47; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=dthompson@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="Yg+MRiuA";
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130047.outbound.protection.outlook.com [40.107.13.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43pCxt6K2pzDq99
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 02:20:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bv4stW5fx1FI8VQ6DetDjND50TibSSBouOb8d/BnYa8=;
 b=Yg+MRiuA7bPthWnN5PHjQ/goJzA+NtFqgWEmUbLV8wWHpHflJcdO3cXDzEcmwyH4tTEoBbJ3enfrfF0uRV6NWFbzTEisU5yQqYjUXzImYzODLo8T+MPebwiqT4Gmfn7r0batDCDevH4aycKIt414LEb3DKrCv7ayUqyBwYq2tFw=
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com (52.134.4.15) by
 VI1PR0502MB3885.eurprd05.prod.outlook.com (52.134.6.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.18; Mon, 28 Jan 2019 15:20:41 +0000
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::6d29:714e:6e07:792b]) by VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::6d29:714e:6e07:792b%2]) with mapi id 15.20.1558.023; Mon, 28 Jan 2019
 15:20:41 +0000
From: David Thompson <dthompson@mellanox.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Question on upstreaming and release planning
Thread-Topic: Question on upstreaming and release planning
Thread-Index: AdS3HQZMK7eR58SyQa+c+5FWSgfbbw==
Date: Mon, 28 Jan 2019 15:20:41 +0000
Message-ID: <VI1PR0502MB38692122CA756E330804994EDD960@VI1PR0502MB3869.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dthompson@mellanox.com; 
x-originating-ip: [216.156.69.42]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR0502MB3885;
 6:Dk+APSeeKzcaV7b1KxN3WU/KgHqwCMjSS/0QWmEUEBn0OsYKY37e5BNFVFQlGlPWp8pCP52vhb7sUuaajI46WzA8PUylW61c27E6P9zvYVJodIbpJNBcl8Mw3Df7adaJR//IkOTGSpz5r0rWVFIv2OaFIvuRj6i2uY/WZqO+9CmjI5DtypbCf2rKu3nbcgT+zvuf5VVumHuYtceKbE7JuwpB4UVHU3xIOV5G++XC+lJqu3Y2aXAEvR1JL+vy2mYZhG+CQITL4WuqQHIHM72h5D4E8HS1zSxnQ7R641GOARPzfwfUbueGbJ5jJoioqQoNtaUjMlmIpAAwInzxPa5GC494a+uPidivO3Ed8kkrvgBeps8vU6NkBGfPMymYZoVfVqLo0Mambg0GX24JPyZkewBdw8OtJmmxfr+/E0LtzJEOYjEm5Q0lUI0M3zJUl+bDYsazvM440v2NPvE0686kKA==;
 5:9fBiWiCHiOeo98PFS0UwgeSPnhLfG4f/XTkVSCRsAhv2WV7llH+geGi5K033UNfhyn6Ra8Z/2qPoLtAS4MFkhHyYDbopt/H0Wov5FSFDuUfGgOQeyDzgLCemEmPM938xuEb2yNKs+HIboFC/VDXAhr18/Qe9RuRCSb9ADaGfv8jAGIVTGYvtMxone6VQwUULkiO8WO54TgCoh4f+FOn6CA==;
 7:/fSiqORHPIUVGEpeak6atW10/csYd7nJLXtiUNL3JJyXU/4eWH9jq+Dp9rTa2rq1P+t7SjBBetiZalYHN2eukC87e3IZp7BNPIIT15Q1jI+EoirdNwST79XEi74MtdTHj2t8hnVIJ+A/zrB8LMGZAA==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: f006c549-926f-4a6b-139c-08d685342a4b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:VI1PR0502MB3885; 
x-ms-traffictypediagnostic: VI1PR0502MB3885:
x-microsoft-antispam-prvs: <VI1PR0502MB3885480EDC9DE728FE915855DD960@VI1PR0502MB3885.eurprd05.prod.outlook.com>
x-forefront-prvs: 0931CB1479
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(366004)(136003)(39860400002)(53754006)(199004)(189003)(476003)(81156014)(81166006)(8936002)(186003)(9686003)(54896002)(6306002)(33656002)(55016002)(71190400001)(71200400001)(7696005)(8676002)(68736007)(66066001)(25786009)(6436002)(478600001)(97736004)(74316002)(7736002)(256004)(4744005)(106356001)(2906002)(14454004)(790700001)(53936002)(3846002)(6116002)(6506007)(6916009)(316002)(26005)(105586002)(486006)(86362001)(99286004)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0502MB3885;
 H:VI1PR0502MB3869.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T35CgVE0QuPGgBRgq/win5Krr5W8uX0fuS1cpkCFmmwZV0rLWS114DZ+7UTBCSS9I+EGMh/bZeCy09kk8gw9gW87+v5k0LSYDwYzG3tHEheWQRNC4aCVzbVNdzXDz7a2VUl8H/dY1xwBEYDsTi6qwuXqC22l+DbOyucSoL1ingLKmH3QgepTYWTTvluPgVX4W+wrdSrbhRuCgh8Gc2wArIQnu/ti2OPsnOfm43CAfkXnuMQ8yaCaOCF3sIrPPiAQVdZ53RNhBH2dNsyAHsrfjKyY8EKGEQ0GQmK66OtPDpuSCBsZA+5sBAaFdiftwSD99vHJ9sAaglv7P3uppUTH7m/uVozeiOPZPDsq4zv/FqUsVog5ZuoBQ47qwUdTmSa+HSsbvJHAEnyyumh9d5Uo06+EHISmOI3GyqSGIzpfJ2E=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0502MB38692122CA756E330804994EDD960VI1PR0502MB3869_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f006c549-926f-4a6b-139c-08d685342a4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2019 15:20:41.2589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3885
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
X-List-Received-Date: Mon, 28 Jan 2019 15:20:52 -0000

--_000_VI1PR0502MB38692122CA756E330804994EDD960VI1PR0502MB3869_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

I work for Mellanox Technologies and we've have been using OpenBMC
for a while now.  We hope to upstream the code contributions that
support our machine (called "bluewhale-ast2500") which is a hardware
platform based on ASPEED AST2500.

We have a new meta-layer at:
$TOP/meta-mellanox/meta-bluewhale-ast2500/
which holds the supporting files for our machine.

What's the process to get our machine into the upstream?
Do I need to attend a release planning meeting and discuss?
I see there's a meeting on Mon 1/28, that's why I ask now.

FWIW, I have submitted a signed CCLA, and it's been accepted already.

Thanks,

  *   Dave


David Thompson
Sr. Staff Engineer, System SW
Mellanox Technologies
1900 West Park Drive, Suite 290
Westborough MA USA 01581
Direct: +1 508-475-6375


--_000_VI1PR0502MB38692122CA756E330804994EDD960VI1PR0502MB3869_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1171137380;
	mso-list-type:hybrid;
	mso-list-template-ids:-231839010 -1749405202 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I work for Mellanox Technologies and we&#8217;ve hav=
e been using OpenBMC<o:p></o:p></p>
<p class=3D"MsoNormal">for a while now.&nbsp; We hope to upstream the code =
contributions that
<o:p></o:p></p>
<p class=3D"MsoNormal">support our machine (called &#8220;bluewhale-ast2500=
&#8221;) which is a hardware<o:p></o:p></p>
<p class=3D"MsoNormal">platform based on ASPEED AST2500.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We have a new meta-layer at:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">$TOP/meta-mellanox/meta-b=
luewhale-ast2500/<o:p></o:p></p>
<p class=3D"MsoNormal">which holds the supporting files for our machine.<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What&#8217;s the process to get our machine into the=
 upstream?<o:p></o:p></p>
<p class=3D"MsoNormal">Do I need to attend a release planning meeting and d=
iscuss?<o:p></o:p></p>
<p class=3D"MsoNormal">I see there&#8217;s a meeting on Mon 1/28, that&#821=
7;s why I ask now.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">FWIW, I have submitted a signed CCLA, and it&#8217;s=
 been accepted already.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">Dave<o:p></o:p></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">David Thompson<o:p></o:p></p>
<p class=3D"MsoNormal">Sr. Staff Engineer, System SW<o:p></o:p></p>
<p class=3D"MsoNormal">Mellanox Technologies<o:p></o:p></p>
<p class=3D"MsoNormal">1900 West Park Drive, Suite 290<o:p></o:p></p>
<p class=3D"MsoNormal">Westborough MA USA 01581<o:p></o:p></p>
<p class=3D"MsoNormal">Direct: &#43;1 508-475-6375<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_VI1PR0502MB38692122CA756E330804994EDD960VI1PR0502MB3869_--
