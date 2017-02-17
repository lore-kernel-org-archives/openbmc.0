Return-Path: <dthompson@mellanox.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0044.outbound.protection.outlook.com [104.47.2.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vQ45q240WzDq5x
 for <openbmc@lists.ozlabs.org>; Sat, 18 Feb 2017 07:15:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="t3V1ZRgY";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8JAgFdQzehRJobzGIMxV6vH0r71Y0Wpb8PVdIY9CjZk=;
 b=t3V1ZRgYtLcxfxPWQLf/sVPE39IIvkgDVQm9K5lqIHZyRzchIEk6ZK0thGCaARdKHvEof66itbaQ/aH2xQ0u112ExLo8jenYJtZ4RqhiTWC4A4pRlLuDRqZEQRepRfxAkD64caSjAD0mZfXM+sCAoILCbr+3EIUzghNu4Ph9Hhk=
Received: from VI1PR0502MB3021.eurprd05.prod.outlook.com (10.175.21.23) by
 VI1PR0502MB3023.eurprd05.prod.outlook.com (10.175.22.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.888.16; Fri, 17 Feb 2017 20:15:37 +0000
Received: from VI1PR0502MB3021.eurprd05.prod.outlook.com ([10.175.21.23]) by
 VI1PR0502MB3021.eurprd05.prod.outlook.com ([10.175.21.23]) with mapi id
 15.01.0919.013; Fri, 17 Feb 2017 20:15:37 +0000
From: David Thompson <dthompson@mellanox.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: DSTREAM/DS-5 use on AST2500 EVB
Thread-Topic: DSTREAM/DS-5 use on AST2500 EVB
Thread-Index: AdKJWgUa+yXsGS5zQPaB+0rOhKg7dw==
Date: Fri, 17 Feb 2017 20:15:37 +0000
Message-ID: <VI1PR0502MB30211D216F237DA5240F6FF9DD5D0@VI1PR0502MB3021.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dthompson@mellanox.com; 
x-originating-ip: [173.76.53.114]
x-ms-office365-filtering-correlation-id: d4388de3-604a-41db-8cd3-08d45771bce8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(48565401081);
 SRVR:VI1PR0502MB3023; 
x-microsoft-exchange-diagnostics: 1; VI1PR0502MB3023;
 7:sJpICIbVDQIM9gH7l0UgGiidA8MTR+p2d49yy3QIntDPuFpSjK2He3POSdc/slatSQ8rAk3yyhlFAgSLOmhEg4Yr1En34nsMZPgGCphJ67PiBHVk4xWop+5Tp1dXocb3SU02bqClqjEXp7o61k/bjEpgheFE3VSpcUmJ6xlQppT9pNo1I2uI+EUF649aFMFH/oDH4Fe5nHNNBq6xCR7yQfPlYlaIm/8Zqi/AcynD4a7IZBjGrbB3XCCGEM+a7iYv97F4pzr2DjN/ZyDddNaDwrUijNk6d+wwVFGwvOVLjvtMBJMHkQ1oyuXc24I8w/gONXVtuCnkOCk0w4QWr5zT1Q==
x-microsoft-antispam-prvs: <VI1PR0502MB30237E78DCF206119671A399DD5D0@VI1PR0502MB3023.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123558025)(20161123562025)(20161123560025)(20161123564025)(20161123555025)(6072148);
 SRVR:VI1PR0502MB3023; BCL:0; PCL:0; RULEID:; SRVR:VI1PR0502MB3023; 
x-forefront-prvs: 02213C82F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(39450400003)(39410400002)(39840400002)(39850400002)(199003)(504964003)(189002)(2351001)(68736007)(9686003)(790700001)(102836003)(6306002)(3846002)(5660300001)(54896002)(8936002)(1730700003)(8676002)(105586002)(7696004)(6116002)(81166006)(2906002)(66066001)(81156014)(106356001)(7736002)(74316002)(110136004)(122556002)(38730400002)(450100001)(189998001)(99286003)(77096006)(54356999)(101416001)(2501003)(86362001)(33656002)(6436002)(6916009)(50986999)(97736004)(55016002)(2900100001)(3280700002)(6506006)(3660700001)(25786008)(92566002)(53936002)(5640700003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0502MB3023;
 H:VI1PR0502MB3021.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0502MB30211D216F237DA5240F6FF9DD5D0VI1PR0502MB3021_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2017 20:15:37.6589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3023
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Feb 2017 20:15:45 -0000

--_000_VI1PR0502MB30211D216F237DA5240F6FF9DD5D0VI1PR0502MB3021_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Does anyone utilize tools like DSTREAM & DS-5 for
development and debug of OpenBMC software on
the AST2500 EVB?   I'm actively looking to create,
or acquire, the required DSTREAM/DS-5 platform
configuration files for the AST2500 EVB platform.

Does anyone have these configuration files, including
the flash programming algorithm file, or know where
I could acquire them?  I have already posted to the
ARM community boards, but no luck there.

Thank you in advance,
Dave

David Thompson
Sr. Staff Engineer, System SW
Mellanox Technologies
1900 West Park Drive, Suite 290
Westborough MA USA 01581
Direct: 508-983-6439


--_000_VI1PR0502MB30211D216F237DA5240F6FF9DD5D0VI1PR0502MB3021_
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Does anyone utilize tools like DSTREAM &amp; DS-5 fo=
r<o:p></o:p></p>
<p class=3D"MsoNormal">development and debug of OpenBMC software on<o:p></o=
:p></p>
<p class=3D"MsoNormal">the AST2500 EVB?&nbsp;&nbsp; I&#8217;m actively look=
ing to create,<o:p></o:p></p>
<p class=3D"MsoNormal">or acquire, the required DSTREAM/DS-5 platform <o:p>=
</o:p></p>
<p class=3D"MsoNormal">configuration files for the AST2500 EVB platform.<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Does anyone have these configuration files, includin=
g<o:p></o:p></p>
<p class=3D"MsoNormal">the flash programming algorithm file, or know where<=
o:p></o:p></p>
<p class=3D"MsoNormal">I could acquire them?&nbsp; I have already posted to=
 the <o:p></o:p></p>
<p class=3D"MsoNormal">ARM community boards, but no luck there.<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you in advance,<o:p></o:p></p>
<p class=3D"MsoNormal">Dave<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">David Thompson<o:p></o:p></p>
<p class=3D"MsoNormal">Sr. Staff Engineer, System SW<o:p></o:p></p>
<p class=3D"MsoNormal">Mellanox Technologies<o:p></o:p></p>
<p class=3D"MsoNormal">1900 West Park Drive, Suite 290<o:p></o:p></p>
<p class=3D"MsoNormal">Westborough MA USA 01581<o:p></o:p></p>
<p class=3D"MsoNormal">Direct: 508-983-6439<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_VI1PR0502MB30211D216F237DA5240F6FF9DD5D0VI1PR0502MB3021_--
