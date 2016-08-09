Return-Path: <shays@mellanox.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0056.outbound.protection.outlook.com [104.47.2.56])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s80xg5vtCzDqdv
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 03:04:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b=dTFiLknX; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=iTVpVRvvUEToKJbsolxQ2UD3kso4oqYfs1Qrj1Gvz/Y=;
 b=dTFiLknXapSPkTbp88E7ATkjxhV3XOWM9M30ke6MSZVW1ncDIm5Gy8TIS0CI4a8pA2Ag7TjC80JXoIiGrqUC4YSXY8nLZNYabZKCzNVEYF6GdsOa1AM41t074SNIhdbfhFrRiFNEUSp9gJjISjgfluo3WduQOI3YnfD0439Wu+g=
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com (10.161.249.145) by
 DB4PR05MB0944.eurprd05.prod.outlook.com (10.161.249.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.549.15; Tue, 9 Aug 2016 11:29:41 +0000
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) by
 DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) with mapi id
 15.01.0544.024; Tue, 9 Aug 2016 11:29:41 +0000
From: Shay Slobodkin <shays@mellanox.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Latest Linux dev-4.7 branch
Thread-Topic: Latest Linux dev-4.7 branch
Thread-Index: AdHyMTIIX0r8Xv1RT2aqGJ8Vt9Zr5Q==
Date: Tue, 9 Aug 2016 11:29:40 +0000
Message-ID: <DB4PR05MB094160F672C38AEB237AC40BD51C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shays@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-office365-filtering-correlation-id: 305959a0-a94a-401c-dd79-08d3c048745b
x-microsoft-exchange-diagnostics: 1; DB4PR05MB0944;
 6:L8ovv6cKunUhGmzZ5MmWB7rZMHL1Tz5Ww5N9SRWghrKrl8O3hkievGlF9u1S1vMDqBG8jWWOy891LUrt1xDMPn4dxKkzMwTuYwTcPgTuThjrTJqBCUlZRbNHa8CldFSvMkhAfxo1S9UK6IPkTz6t3zvs+lrVkUyw7HVR1b5Fx6Z8y/jyt/c3jRSr65bcrFe5SObQx51FFRbbNcQNEufSd/0ZbgG+VgA0VpFzao2qGTTb684Xbkmip7SdiHp1zcXB3l/n8438KgL3JRY2PzmmSa0IRHRTDs+3NVVlP6B2qUHy+uWzrzbgWYtbs7Sb7cGvTxyn46ps3ZZP12CBYR9G9g==;
 5:XXHGrB04lcbnltCvSyUH1NTfwiR5j6v+erznpXyQUgZQI1KzH5loM+QmYf5Rqh4o8skN9tZcanPDOizJ9Qtph9BpIXE/jrXG/4KdmyvbxQNRBXS+UvkgzQMGGmc6cPyO/c/kxP8FyM7tDLFesTpyjQ==;
 24:8KsVr2BA8Fmm7aouvs7XIAA55ledRDmFYiZIWkUaB8hbD9krNRlOYPEq5tcaOwSZm23VXm3QGmlJxRHq3ZxDTK78nKif8BGumrUpiDoVdas=;
 7:6UjOHqH4RT4fE8HQnhinQjkrZmBMLbpPbyvwCEJZogXlecY6YXXwWQbw+r/XKcq2MOeLaaICZNo/TBWChImPTp5p+WM1FobleEvWd88I1LsHmTeebS9MWWMtymj4ZD52/GBYAbolzY+RH3Ded11R0U99MiBWYaxQIcMxosDiSn72ikQ0ndexHb/HrgfNTbPOK0Gtzeu3ErxViQ0EyLm662RcQi/Y8+yhhXsNGOYF9hXiF2sxVSukFHsL2Lyu0oiU
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR05MB0944;
x-microsoft-antispam-prvs: <DB4PR05MB094446FFDA19A6B2BF79DE47D51C0@DB4PR05MB0944.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
 SRVR:DB4PR05MB0944; BCL:0; PCL:0; RULEID:; SRVR:DB4PR05MB0944; 
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916002)(199003)(189002)(50986999)(54356999)(8676002)(1730700003)(81166006)(81156014)(97736004)(92566002)(586003)(2900100001)(2906002)(9326002)(86362001)(8936002)(5002640100001)(105586002)(87936001)(7696003)(7846002)(7736002)(3846002)(102836003)(790700001)(7906003)(3660700001)(6116002)(10400500002)(110136002)(15975445007)(74316002)(229853001)(2501003)(19617315012)(77096005)(450100001)(9686002)(19300405004)(122556002)(3280700002)(189998001)(101416001)(19580395003)(2351001)(76576001)(66066001)(19625215002)(106356001)(107886002)(16236675004)(11100500001)(68736007)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR05MB0944;
 H:DB4PR05MB0941.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_DB4PR05MB094160F672C38AEB237AC40BD51C0DB4PR05MB0941eurp_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2016 11:29:40.9852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR05MB0944
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Aug 2016 17:04:25 -0000

--_000_DB4PR05MB094160F672C38AEB237AC40BD51C0DB4PR05MB0941eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

We saw some recently added code into Linux branch dev-4.7 which we can use.
Also have some of our code we want to push into it, and want to rebase on t=
op of latest code.

Where can we find the latest Linux dev-4.7 branch?

We were looking under:
https://github.com/openbmc/linux/

though latest code there is branch 4.6.

Thanks,
Shay

--_000_DB4PR05MB094160F672C38AEB237AC40BD51C0DB4PR05MB0941eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We saw some recently added code into Linux branch de=
v-4.7 which we can use.<o:p></o:p></p>
<p class=3D"MsoNormal">Also have some of our code we want to push into it, =
and want to rebase on top of latest code.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Where can we find the latest Linux dev-4.7 branch?<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We were looking under:<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/linux/">https:=
//github.com/openbmc/linux/</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">though latest code there is branch 4.6.<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Shay<o:p></o:p></p>
</div>
</body>
</html>

--_000_DB4PR05MB094160F672C38AEB237AC40BD51C0DB4PR05MB0941eurp_--
