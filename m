Return-Path: <shays@mellanox.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
 (mail-am1on0054.outbound.protection.outlook.com [157.56.112.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rV7mB705kzDqjk
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 00:13:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b=Igl/P4cn; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CazzK6Zsx3ENqVrLpIXvtZDJWRbX4cBJjChV49Il0No=;
 b=Igl/P4cnWTTq1o8OuPGSsvIfoNUC43RlOUJZvAde671WCUD1MBuj5+qdpN8v+udXr4H0VPRsR/9y7QwysedvkXBoPe3uUdLsvUJffa/jlbjHo8KpIhenqTx/DER2ZJ84Opy18CfRl/dwskoDU6ChiG8+uJ/8yX+QyoCevZejK+Y=
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com (10.161.249.145) by
 DB4PR05MB0941.eurprd05.prod.outlook.com (10.161.249.145) with Microsoft SMTP
 Server (TLS) id 15.1.511.8; Wed, 15 Jun 2016 11:39:30 +0000
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) by
 DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) with mapi id
 15.01.0511.017; Wed, 15 Jun 2016 11:39:30 +0000
From: Shay Slobodkin <shays@mellanox.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: =?iso-8859-1?Q?Flashing_U-Boot_using_DediProg=AE_on_Aspeed_AST2500_EVB_?=
Thread-Topic: =?iso-8859-1?Q?Flashing_U-Boot_using_DediProg=AE_on_Aspeed_AST2500_EVB_?=
Thread-Index: AdHG+PEeY6XZ4jw8RgG4Vh7bE4iwVg==
Date: Wed, 15 Jun 2016 11:39:29 +0000
Message-ID: <DB4PR05MB094106B07FFCD2E824B72DFFD5550@DB4PR05MB0941.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shays@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-office365-filtering-correlation-id: ae17e38f-17a9-439f-6cbf-08d39511b6c4
x-microsoft-exchange-diagnostics: 1; DB4PR05MB0941;
 5:/fJuk/Aa3/+YAvofUgdhnqQLKN8Ekd1205WWLdqj443QLbURShSzsyj3DqaK/TmZ7E0FVJqoI7HrG4KHitM4SALduFjtQMxHbrfO+YKqF632k2BJVf89k9lc03Mo3N1RLVs52qDygqH0MLgrzoOuUw==;
 24:f+9EvLyhbUt5gvFAsGexzS0zb5ePwHI+G4w+WnJMhHfL2UViBrae+ZwfGKJYjEN4ciLNAbDAAOHIMQk72mJya9WjeHt3k0l4eV8eGesmveo=;
 7:BaC6lyJ/JF5DPy6EvwWRW7Ub3q9jJ4EccqYG+eg+saXMRo6SBsVtWNO2upvdJZ7U7N/nEU7sjby7BClmG8rGQdst3Pc5s/4kVZ/Un/XoXcOE6F9zyeK75/4MjcEIocfoKKN98aT83zcN1Yt0TJ3cJkyd0/zgd/xBnPbwaJBeUUgjBFwf8dYu7Uu33jIvJDtv4APVlycu81Eza5MVV8dP9A==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR05MB0941;
x-microsoft-antispam-prvs: <DB4PR05MB094138B7645427487C300738D5550@DB4PR05MB0941.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
 SRVR:DB4PR05MB0941; BCL:0; PCL:0; RULEID:; SRVR:DB4PR05MB0941; 
x-forefront-prvs: 09749A275C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(189002)(199003)(10400500002)(19625215002)(122556002)(106356001)(450100001)(3660700001)(101416001)(3280700002)(189998001)(5008740100001)(92566002)(5004730100002)(86362001)(74316001)(19580395003)(11100500001)(2900100001)(87936001)(77096005)(15975445007)(33656002)(105586002)(5890100001)(76576001)(2906002)(2351001)(16236675004)(5003600100002)(110136002)(3846002)(586003)(107886002)(6116002)(102836003)(19300405004)(9326002)(9686002)(50986999)(66066001)(5002640100001)(790700001)(1730700003)(81156014)(81166006)(68736007)(54356999)(229853001)(2501003)(8936002)(97736004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR05MB0941;
 H:DB4PR05MB0941.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_DB4PR05MB094106B07FFCD2E824B72DFFD5550DB4PR05MB0941eurp_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2016 11:39:29.9711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR05MB0941
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
X-List-Received-Date: Wed, 15 Jun 2016 14:13:49 -0000

--_000_DB4PR05MB094106B07FFCD2E824B72DFFD5550DB4PR05MB0941eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Recently we had some problems with our AST2500 EVB U-Boot.
Had several systems gone bad.

We want to use the DediProg=AE tool in order to recover.

If you have used this tool, could you please explain briefly how to use it =
with Aspeed AST2500 EVB?
Which connector to attach it to?
Does it require any special cable?
Something else we should know when using this tool?

Thanks,
Shay

--_000_DB4PR05MB094106B07FFCD2E824B72DFFD5550DB4PR05MB0941eurp_
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
<p class=3D"MsoNormal">Recently we had some problems with our AST2500 EVB U=
-Boot.<o:p></o:p></p>
<p class=3D"MsoNormal">Had several systems gone bad.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We want to use the DediProg=AE tool in order to reco=
ver.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If you have used this tool, could you please explain=
 briefly how to use it with Aspeed AST2500 EVB?<o:p></o:p></p>
<p class=3D"MsoNormal">Which connector to attach it to?<o:p></o:p></p>
<p class=3D"MsoNormal">Does it require any special cable?<o:p></o:p></p>
<p class=3D"MsoNormal">Something else we should know when using this tool?<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Shay<o:p></o:p></p>
</div>
</body>
</html>

--_000_DB4PR05MB094106B07FFCD2E824B72DFFD5550DB4PR05MB0941eurp_--
