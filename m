Return-Path: <shays@mellanox.com>
X-Greylist: delayed 12749 seconds by postgrey-1.35 at bilbo;
 Fri, 22 Jul 2016 00:28:41 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b=Kq8g27LW; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0075.outbound.protection.outlook.com [104.47.2.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rwGNn4jXvzDqf0
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jul 2016 00:28:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+Cb+NBPZypNdAXtAg63PYFenhxUeosROa9hvtd7Q1bg=;
 b=Kq8g27LWviBigLByuZ4Mgc7Ss0x0YaN/pl84K3DHmpRjbt1ECYzP/36C9QB9idUni7z2Fa9j3ZiguAAx63dHfQl8sbzZb2Qo5lIRaigyX+ic7rNRBwZGHrw2CRF8iKDDy+t/pqEicQvxiOIis9Xj2JP8pj4NIKzvXXhlxuaK4bE=
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com (10.161.249.145) by
 DB4PR05MB0941.eurprd05.prod.outlook.com (10.161.249.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.544.10; Thu, 21 Jul 2016 10:56:04 +0000
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) by
 DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) with mapi id
 15.01.0544.014; Thu, 21 Jul 2016 10:56:04 +0000
From: Shay Slobodkin <shays@mellanox.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Aspeed 2500 EVB i2c transaction time out
Thread-Topic: Aspeed 2500 EVB i2c transaction time out
Thread-Index: AdHjPh18jT8yNP68Tle3f/Ll01NEgA==
Date: Thu, 21 Jul 2016 10:56:03 +0000
Message-ID: <DB4PR05MB0941FC06CBEC427C99A40C80D5090@DB4PR05MB0941.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shays@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-office365-filtering-correlation-id: e54f46da-5ab9-4c34-f5ba-08d3b1559c41
x-microsoft-exchange-diagnostics: 1; DB4PR05MB0941;
 6:NFRVIXdlesmiR5h2A1YhG3a61bDUeJO0XyN/0cc9fx1k35EMQUDy4pkVhxJnRVQsbw32jOYa5uZKjgXMRQXgthvLjJ6bgJ/7EeHmPBe1SN/eDUf1xDKFZQ81FH65T4f5IUx5mOZxeXYzxbgBtPqBJsC0vgz6D0w2Dbw1W01b31ZjbALd6dgInV1RS55t7kkC+QeCfvdEiDBPw+BpdDDwr1VZKvPgvnPud69YUvyd5C5wTDlgppHHMXp0ze7SjKJWLnzpWBM2RmS/HSxgOM8F5Uh/ZnA0xOaZqfx1EJ6j/cvmFxfUZ2Qg2Wix7dYVnbuMkmI62QedveTUa7TArsijWw==;
 5:HIVQW/gb5lhBlrjw92hw6BwPtGBLf1QgWHP2N5X115osW2FpdR4mzUQb6K967AdxiwaG+K9WhMhS4u1fNZN+6Q6GfhCp4B2eLaPFUMBst72E4LZmuIM6ObltAwC7zSAD5WH3KDoPK0NmsjSR9xqEpQ==;
 24:QBtNYJcVSp0mizz0N+FUSWfq+dcYrdu3sm3v4YFqM467hpmOWANWIRJu25JX9GFTL/AiBDr5fW5UwQV2j2sj23wpwBmKwE9yfXpIn/ZJivM=;
 7:7f7+J3owM9hc2DBHx/fKtNVuOmUqsKlUEYfXvYjqmFFHJrRnxghKjIWQvKCCqylLwpjXWDgkq/tFZnzFey05f9I+U4gvLYV5IHTjrlWjFzSU7PP4LxAjZI0WANHee+XloFeFIE93/ik9SD1OvK5qRXIpJfVht3liVBlN4GXjyA4i1ZueaBHIuHDTAoURU7W7f/oxCtL9572qhO0W7GYRKLLKswEFUsz5ybosweAuPKtxmpYCZCxAUauZDSa2nlqh
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR05MB0941;
x-microsoft-antispam-prvs: <DB4PR05MB0941CD5A2D0B196CF03B2833D5090@DB4PR05MB0941.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(21748063052155)(21532816269658); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6055026);
 SRVR:DB4PR05MB0941; BCL:0; PCL:0; RULEID:; SRVR:DB4PR05MB0941; 
x-forefront-prvs: 0010D93EFE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916002)(199003)(51914003)(189002)(92566002)(8676002)(97736004)(77096005)(15975445007)(76576001)(3660700001)(110136002)(107886002)(86362001)(2900100001)(10400500002)(2501003)(3280700002)(19300405004)(7906003)(7846002)(5003600100003)(7696003)(7736002)(74316002)(2906002)(19617315012)(54356999)(50986999)(450100001)(189998001)(106356001)(9686002)(19580395003)(5002640100001)(122556002)(229853001)(586003)(66066001)(19625215002)(11100500001)(9326002)(81156014)(16236675004)(81166006)(551934003)(1730700003)(33656002)(101416001)(68736007)(87936001)(2351001)(3846002)(6116002)(102836003)(105586002)(8936002)(790700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR05MB0941;
 H:DB4PR05MB0941.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_DB4PR05MB0941FC06CBEC427C99A40C80D5090DB4PR05MB0941eurp_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2016 10:56:03.9615 (UTC)
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
X-List-Received-Date: Thu, 21 Jul 2016 14:28:43 -0000

--_000_DB4PR05MB0941FC06CBEC427C99A40C80D5090DB4PR05MB0941eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

We faced an i2c transaction time-out issue on Aspeed 2500 EVB board.
It happens when we try to connect on board LM75 at 0x4d driver to bus 7.

We used https://github.com/openbmc/linux/tree/dev-4.6 kernel and also tried=
 https://github.com/shenki/linux/tree/dev-4.7 kernel.

We also tried to change i2c timeout counter (I2CD08) from 3 bits to 5 bits,=
 according to Aspeed AST2400 to AST2500 migration guideline, but it didn't =
help.

Is that a known issue?
Is there a known solution you can point us to?


Thanks for the assistance,
Shay

--_000_DB4PR05MB0941FC06CBEC427C99A40C80D5090DB4PR05MB0941eurp_
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We faced an i2c transaction time-out issue on Aspeed=
 2500 EVB board.<o:p></o:p></p>
<p class=3D"MsoNormal">It happens when we try to connect on board LM75 at 0=
x4d driver to bus 7.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We used <a href=3D"https://github.com/openbmc/linux/=
tree/dev-4.6">
<span style=3D"color:windowtext;text-decoration:none">https://github.com/op=
enbmc/linux/tree/dev-4.6</span></a> kernel and also tried
<a href=3D"https://github.com/shenki/linux/tree/dev-4.7"><span style=3D"col=
or:windowtext;text-decoration:none">https://github.com/shenki/linux/tree/de=
v-4.7</span></a> kernel.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We also tried to change i2c timeout counter (I2CD08)=
 from 3 bits to 5 bits, according to Aspeed AST2400 to AST2500 migration gu=
ideline, but it didn&#8217;t help.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is that a known issue?<o:p></o:p></p>
<p class=3D"MsoNormal">Is there a known solution you can point us to?<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for the assistance,<o:p></o:p></p>
<p class=3D"MsoNormal">Shay<span style=3D"color:#17365D"><o:p></o:p></span>=
</p>
</div>
</body>
</html>

--_000_DB4PR05MB0941FC06CBEC427C99A40C80D5090DB4PR05MB0941eurp_--
