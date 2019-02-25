Return-Path: <dthompson@mellanox.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=2a01:111:f400:fe0e::62d;
 helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=dthompson@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="hObyeYPX";
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 447VnC0JykzDq5f
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 05:28:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNe24USScXHR9QEd38z6FsFRnnzkC4hlgeolRTqsLSk=;
 b=hObyeYPX+yM0zevyPwAYNtGwXL+CEGglrsFiKHVcvdhlHURy66Qt7YieUZ9gSqEYqdpd4le2lhPkOmdOld6Tw8uz1gMPlgAROGkz6JlhJt8I9boEBiF+TZEnf9QeYiQoHmo+Ho97HucJstWBiP7wE2mNtY4JqwmUqaM4C7orAes=
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com (52.134.4.15) by
 VI1PR0502MB3984.eurprd05.prod.outlook.com (52.134.18.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.16; Mon, 25 Feb 2019 18:28:04 +0000
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::2127:2c98:9e0f:ca16]) by VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::2127:2c98:9e0f:ca16%3]) with mapi id 15.20.1643.019; Mon, 25 Feb 2019
 18:28:04 +0000
From: David Thompson <dthompson@mellanox.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Patches for U-Boot v2016.07-aspeed-openbmc?
Thread-Topic: Patches for U-Boot v2016.07-aspeed-openbmc?
Thread-Index: AdTNNjIaoC4ZejI8S82DncCGrScAWA==
Date: Mon, 25 Feb 2019 18:28:04 +0000
Message-ID: <VI1PR0502MB38692DFF848268A3BB778560DD7A0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dthompson@mellanox.com; 
x-originating-ip: [216.156.69.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39a500f3-c2b3-4dbd-c167-08d69b4efb69
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:VI1PR0502MB3984; 
x-ms-traffictypediagnostic: VI1PR0502MB3984:
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; VI1PR0502MB3984;
 23:ApfhTB6YnYXce5aam5l6567K7MJv+4Mp3NOsTnY?=
 =?us-ascii?Q?7rOmu2fahyeVYRyzhCEqLsnLuuONxC8BIzAA8comMIFjcV1hx52NoeAQWedJ?=
 =?us-ascii?Q?aYPO7g6ZajlRNuyeB56k/vBValueKpKiSTD1kUaE2yhqpY67jx9qER0lRkhQ?=
 =?us-ascii?Q?BlJGyMauOT6MGYPlLqKOO3d2M/hmLY2C4w0cBiOLNTdj52yjYzTIdad+F0LB?=
 =?us-ascii?Q?S70syCk8/2Xir+ihbr2f8nh5Nwnae8uAUqWh5NMTq1zY+mP+E0BrRwNXTzXB?=
 =?us-ascii?Q?u3XWcEi5XnbCOGcz5G4AwOKFxNpBorux5pkW+kkkuZ1B/EYV6yzmF5Ric7qy?=
 =?us-ascii?Q?bi9Scvp9SsSymgkyLXeVAtlDDrNLj7yaiwCGAwX4zTvr3MmiHvApP5S82EYK?=
 =?us-ascii?Q?e5eVyHkF2RROyeUlPoI6J7ZRWYk5qH68vjocynqMw9MsMPQBc9P6wGLGrBkD?=
 =?us-ascii?Q?wqi0ZmiuXkZXVsyKEaTOWAWehX8ZvbKEeodhireWd+RbGI5njjXdbuDsV9Nl?=
 =?us-ascii?Q?soNAY1Oq36cWEXqpVBKn88ULefrzPnF2jxKUHrGlzpdoOgdm8IyGF7A7606c?=
 =?us-ascii?Q?kYHPyri3IX8TkLubHTtCfmOV5a5/uz60eK6YUq+sa5Khzl4uZOy+CaY7pfgL?=
 =?us-ascii?Q?1ienv9BiwEzol/yAxlDpuE5bM02Uzm1G/sWSJ7fOVa+zYjzH80N8lzftOxtd?=
 =?us-ascii?Q?HrT/acZHwcnDdmq8WlBMuWlxnSYQF+T2TPgKMh2hAyx3rZWPqzjty6DQPqWy?=
 =?us-ascii?Q?5EOl8OvB+/1pRxClsjHPjaWVFqZuEuJrXCQhKNNxj9m0fBGhxdm/wW3txAqe?=
 =?us-ascii?Q?FUEe1Hz9S+6WkxPEY/Zp9ciA3iv9rmv9gtsfTnPD0Fboq56WN2LhMFOFaWwO?=
 =?us-ascii?Q?DurRgxU724BBxw3/BxvprQlOSw1rGqekdLxriZ8vIO7lAgiMvGXz/nrjLJvh?=
 =?us-ascii?Q?jp7QMhghDARL258OUhAem+X2AW/56HuEs4M0LsIPTQU74jlpv9b+k8OvBS8b?=
 =?us-ascii?Q?XAVMVWsjzDwd3gdQKSqml3b5kXuxqxN1D3YDHZaqnS+s+44jtG547yebcqK6?=
 =?us-ascii?Q?HJSdy098QZdWySJwFnGOAvKV/7XeNxf3H1QAVEjxCCn+pXMr9aAOHesETq1M?=
 =?us-ascii?Q?MX262BQ8N0v1DmLkjxPYG4M4J3YMEo/Zbh0IikYyO61+27J2KvjHapw=3D?=
 =?us-ascii?Q?=3D?=
x-microsoft-antispam-prvs: <VI1PR0502MB398483A1ACA6F8C37A65145BDD7A0@VI1PR0502MB3984.eurprd05.prod.outlook.com>
x-forefront-prvs: 095972DF2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(39860400002)(136003)(346002)(366004)(51874003)(189003)(199004)(6506007)(5660300002)(6916009)(97736004)(478600001)(476003)(486006)(7696005)(256004)(68736007)(14454004)(25786009)(102836004)(86362001)(99286004)(186003)(26005)(105586002)(106356001)(74316002)(790700001)(7736002)(8676002)(6116002)(3846002)(4744005)(66066001)(55016002)(9686003)(6306002)(53936002)(54896002)(52536013)(2906002)(33656002)(6436002)(8936002)(316002)(81166006)(81156014)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0502MB3984;
 H:VI1PR0502MB3869.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1lxfv3WQ5GDeAeAFtr6S9w8shlapVotd2Tg9Q7aTdinyMmHi2O9MMGWk+S6Q1Ruhs8Z/7Erkf4RH80uPpS06BSnFcV34n/bbguj/5bC0mdAzOaKRZajaAbRYqI6vZxOjrlywKDoS9+HK/GUAud9kSkAr4cBt7qNiCU46ZtBnwqWl8VK++Hl2UR1S4E9p7ZgBZXSEfUaLxkqu8J9XONKI24CzYO+VH3Cpo58+3j+z2U7tynw/fqIXyMlmtEGDfSD3munb1v9VjQ5wFOCgN+BW0V6RamJ+I56DpBkKY+TRF4d/ahkF3cHtZXTT0WxlXXBKxOvQ0DFd2hh/tngR9jYCYicigpcGuNVuYfHzXOYv7+cGJ+FRwMH7pYAgwhdNIcX/0s3y0Yrl75lJUPkEEn2XhjEZYpVgcpGX0jmkQEAPJ+8=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0502MB38692DFF848268A3BB778560DD7A0VI1PR0502MB3869_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a500f3-c2b3-4dbd-c167-08d69b4efb69
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2019 18:28:04.6549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3984
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
X-List-Received-Date: Mon, 25 Feb 2019 18:28:16 -0000

--_000_VI1PR0502MB38692DFF848268A3BB778560DD7A0VI1PR0502MB3869_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The latest OpenBMC 2.6 is based on U-Boot v2016.07-aspeed-openbmc.

I have a few patches I'm considering upstreaming, one of which is a new
U-Boot machine/board.  Should I send in patches based off this older,
but currently used, U-Boot branch?    Or, should I just be sending in
patches based on latest upstream U-Boot, with the intent that
eventually OpenBMC will be picking up a newer version of U-Boot?

Thanks in advance,

  *   Dave


David Thompson
Sr. Staff Engineer, System SW
Mellanox Technologies
1900 West Park Drive, Suite 290
Westborough MA USA 01581
Direct: +1 508-475-6375



--_000_VI1PR0502MB38692DFF848268A3BB778560DD7A0VI1PR0502MB3869_
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
	{mso-list-id:145753298;
	mso-list-type:hybrid;
	mso-list-template-ids:-503806650 1653114112 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
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
<p class=3D"MsoNormal">The latest OpenBMC 2.6 is based on U-Boot v2016.07-a=
speed-openbmc.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have a few patches I&#8217;m considering upstreami=
ng, one of which is a new<o:p></o:p></p>
<p class=3D"MsoNormal">U-Boot machine/board.&nbsp; Should I send in patches=
 based off this older,
<o:p></o:p></p>
<p class=3D"MsoNormal">but currently used, U-Boot branch?&nbsp; &nbsp;&nbsp=
;Or, should I just be sending in
<o:p></o:p></p>
<p class=3D"MsoNormal">patches based on latest upstream U-Boot, with the in=
tent that
<o:p></o:p></p>
<p class=3D"MsoNormal">eventually OpenBMC will be picking up a newer versio=
n of U-Boot?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks in advance,<o:p></o:p></p>
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_VI1PR0502MB38692DFF848268A3BB778560DD7A0VI1PR0502MB3869_--
