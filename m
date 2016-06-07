Return-Path: <shays@mellanox.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
 (mail-am1on0061.outbound.protection.outlook.com [157.56.112.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPNCw3lrBzDqG1
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 06:17:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b=aOAMSAH2; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zxaa/jLErVugAvcJz3nIbA+KApP/sGJbkvXUhDlioDY=;
 b=aOAMSAH23w2WWHLCA3H9NOflHyLWUT+KvepqWeRs8eQ8Jtr003rUUwrdCemxiBIAv+glFZRRDYT6s5o2fajAR5zEjkjHmwQ9A0Zsp6PV6Hf6DVHcfI22PIc6g1yaJU0pNsPE2IniY630aao3dRPMfclLj/PKKZ/ONk0QbICsGBk=
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com (10.161.249.145) by
 DB4PR05MB0943.eurprd05.prod.outlook.com (10.161.249.147) with Microsoft SMTP
 Server (TLS) id 15.1.511.8; Tue, 7 Jun 2016 18:43:14 +0000
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) by
 DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) with mapi id
 15.01.0511.010; Tue, 7 Jun 2016 18:43:13 +0000
From: Shay Slobodkin <shays@mellanox.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: AST2500 support questions
Thread-Topic: AST2500 support questions
Thread-Index: AdHA7HEYY0uj8HzxR4WYYkFPsGjdyA==
Date: Tue, 7 Jun 2016 18:43:13 +0000
Message-ID: <DB4PR05MB0941CA88039CFE2BEEA8ECD9D55D0@DB4PR05MB0941.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shays@mellanox.com; 
x-originating-ip: [84.108.116.108]
x-ms-office365-filtering-correlation-id: aa120f55-c5bb-4617-a208-08d38f039525
x-microsoft-exchange-diagnostics: 1; DB4PR05MB0943;
 5:/siJDG/b7P34J3UwhrqbpUrVQrirSVoEVDPRjuA1GTAtz5v6R3SArbqLGpCI0IvtdT6+scsAGchpf3KkroX901TJEsqbKEKI/jO9gXMnfQT+PSibXv49J8mfgs/LznAsrvc4+2OWZ+Z22Se0cMf9ZQ==;
 24:I6C5SYlaVkPIe/gc26MFfLsqHdFWCWsYgAbSP5kDlkzYj0vcHc3RvWNMVUcQg7rYF3H6X6gIjpV2IuSuTbgCimFMxWO0TaT6simUjRwkxYs=;
 7:045MrybKZZ3yvYVxYUxAlWCSedCkwiijBU/txRklS1CB3kuW7T5lJ82ZNNWNKrqmvhf1K/tPcOLooIXlkjVn8CcONV2jdoMB/H+aYVkJWrRKROF2wgMi5upZhObV93NzOirfhDooKIjWPWQrzMnlFwCHtoBzofWuZy5g4PcDSSzXegOGFfGI7tPe0n/DfzjM7wJCv1HunZlXMzQoTse3tMtNffI3zfW8nr72Z28Xjhs=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR05MB0943;
x-microsoft-antispam-prvs: <DB4PR05MB0943C068802D00E3C4E7D665D55D0@DB4PR05MB0943.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(21748063052155)(17755550239193); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
 SRVR:DB4PR05MB0943; BCL:0; PCL:0; RULEID:; SRVR:DB4PR05MB0943; 
x-forefront-prvs: 09669DB681
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(45074003)(199003)(189002)(9326002)(9686002)(450100001)(2906002)(81156014)(81166006)(66066001)(68736007)(54356999)(50986999)(92566002)(19300405004)(2501003)(19580395003)(8676002)(105586002)(6116002)(74316001)(1730700003)(8936002)(106356001)(3846002)(122556002)(102836003)(586003)(790700001)(76576001)(229853001)(97736004)(33656002)(86362001)(5003600100002)(16236675004)(77096005)(19617315012)(5004730100002)(15975445007)(101416001)(5008740100001)(3660700001)(107886002)(10400500002)(19625215002)(2351001)(87936001)(2900100001)(5002640100001)(189998001)(3280700002)(110136002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR05MB0943;
 H:DB4PR05MB0941.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_DB4PR05MB0941CA88039CFE2BEEA8ECD9D55D0DB4PR05MB0941eurp_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2016 18:43:13.5254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR05MB0943
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
X-List-Received-Date: Tue, 07 Jun 2016 20:17:52 -0000

--_000_DB4PR05MB0941CA88039CFE2BEEA8ECD9D55D0DB4PR05MB0941eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Following the latest great news of adding support for AST2500 into main cod=
e, we boost up our work to align with yours.
Several questions regarding our current status, appreciate the assistance h=
opefully it will be merged into openbmc code as well soon.

1. We were trying to fetch latest code from origin, hoping AST2500 will be =
inside already.
After fetch, we couldn't find the new AST2500 addition under:
meta-openbmc-bsp/meta-aspeed/ or meta-openbmc-machines/
Is it held somewhere else, on a different git branch?


2. We have loaded ast2500-evb with aspped-ast2500-evb.dtb file on aspeed ev=
b, but we faced some problems with DTB.
We tried kernels 4.6 and 4.7 from:
<https://github.com/shenki/linux/tree/dev-4.7>
<https://github.com/openbmc/linux/tree/dev-4.6>

We tried to boot it with uImage and separate DTB image using the command 'b=
ootm <KERNEL_ADDR> - <DTB_ADDR>'
but the kernel seems to halt during boot, the only messages we got were:

## Booting kernel from Legacy Image at 83000000 ...
   Image Name:   Linux-4.7.0-rc1-12701-gca25849-d
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2102392 Bytes =3D 2 MiB
   Load Address: 80800000
   Entry Point:  80800000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 82000000
   Booting using the fdt blob at 0x82000000
   Loading Kernel Image ... OK
OK
   Loading Device Tree to 9eb7b000, end 9eb7f971 ... OK
Starting kernel ...
Uncompressing Linux... done, booting the kernel.

We added CONFIG_OF_LIBFDT to ast-g5.h and it allow us to get to boot with a=
 separate DTB file (aspeed-ast2500-evb.dtb) as seen above.

We also tried to boot zImage, we failed with the following message (for tha=
t we added CONFIG_CMD_BOOTZ to u-boot config):

ast# bootz 0x83000000

Our initial try, we received this output:

Starting kernel ...
Uncompressing Linux... done, booting the kernel.
no ATAGS support: can't continue

Then we added CONFFIG_ATAGS to kernel config and failed with the below:

Starting kernel ...
Uncompressing Linux... done, booting the kernel.
Error: unrecognized/unsupported machine ID (r1 =3D 0x000022b8).
Available machine support:
ID (hex)        NAME
ffffffff        Generic DT based system
ffffffff        ASpeed SoC


Which u-boot command do you suggest for booting with DTB file?
How did you guys managed to boot?

3. We saw in a latest updates that there is a new u-boot https://github.com=
/legoater/u-boot/tree/v2016.05-ast2500.
Is it stable enough for using it?

Thank you guys for the great support,
Shay

--_000_DB4PR05MB0941CA88039CFE2BEEA8ECD9D55D0DB4PR05MB0941eurp_
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
<p class=3D"MsoNormal">Following the latest great news of adding support fo=
r AST2500 into main code, we boost up our work to align with yours.<o:p></o=
:p></p>
<p class=3D"MsoNormal">Several questions regarding our current status, appr=
eciate the assistance hopefully it will be merged into openbmc code as well=
 soon.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1. We were trying to fetch latest code from origin, =
hoping AST2500 will be inside already.<o:p></o:p></p>
<p class=3D"MsoNormal">After fetch, we couldn&#8217;t find the new AST2500 =
addition under:<o:p></o:p></p>
<p class=3D"MsoNormal">meta-openbmc-bsp/meta-aspeed/ or meta-openbmc-machin=
es/<o:p></o:p></p>
<p class=3D"MsoNormal">Is it held somewhere else, on a different git branch=
?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">2. We have loaded ast2500-evb with aspped-ast2500-ev=
b.dtb file on aspeed evb, but we faced some problems with DTB.<o:p></o:p></=
p>
<p class=3D"MsoNormal">We tried kernels 4.6 and 4.7 from:<o:p></o:p></p>
<p class=3D"MsoNormal">&lt;<a href=3D"https://github.com/shenki/linux/tree/=
dev-4.7">https://github.com/shenki/linux/tree/dev-4.7</a>&gt;<o:p></o:p></p=
>
<p class=3D"MsoNormal">&lt;<a href=3D"https://github.com/openbmc/linux/tree=
/dev-4.6">https://github.com/openbmc/linux/tree/dev-4.6</a>&gt;<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We tried to boot it with uImage and separate DTB ima=
ge using the command &#8216;bootm &lt;KERNEL_ADDR&gt; - &lt;DTB_ADDR&gt;&#8=
217;<o:p></o:p></p>
<p class=3D"MsoNormal">but the kernel seems to halt during boot, the only m=
essages we got were:
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">## Booting kernel from Le=
gacy Image at 83000000 ...<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp; Image Name:&=
nbsp;&nbsp; Linux-4.7.0-rc1-12701-gca25849-d<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp; Image Type:&=
nbsp;&nbsp; ARM Linux Kernel Image (uncompressed)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp; Data Size:&n=
bsp;&nbsp;&nbsp; 2102392 Bytes =3D 2 MiB<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp; Load Address=
: 80800000<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp; Entry Point:=
&nbsp; 80800000<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp; Verifying Ch=
ecksum ... OK<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">## Flattened Device Tree =
blob at 82000000<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp; Booting usin=
g the fdt blob at 0x82000000<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp; Loading Kern=
el Image ... OK<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">OK<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp; Loading Devi=
ce Tree to 9eb7b000, end 9eb7f971 ... OK<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Starting kernel ...<o:p><=
/o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Uncompressing Linux... do=
ne, booting the kernel.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We added CONFIG_OF_LIBFDT to ast-g5.h and it allow u=
s to get to boot with a separate DTB file (aspeed-ast2500-evb.dtb) as seen =
above.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We also tried to boot zImage, we failed with the fol=
lowing message (for that we added CONFIG_CMD_BOOTZ to u-boot config):<o:p><=
/o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">ast# bootz 0x83000000<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Our initial try, we received this output:<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Starting kernel ...<o:p><=
/o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Uncompressing Linux... do=
ne, booting the kernel.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">no ATAGS support: can't c=
ontinue<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Then we added CONFFIG_ATAGS to kernel config and fai=
led with the below:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Starting kernel ...<o:p><=
/o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Uncompressing Linux... do=
ne, booting the kernel.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Error: unrecognized/unsup=
ported machine ID (r1 =3D 0x000022b8).<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Available machine support=
:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">ID (hex)&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; NAME<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">ffffffff&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; Generic DT based system<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">ffffffff&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ASpeed SoC<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Which u-boot command do you suggest for booting with=
 DTB file?<o:p></o:p></p>
<p class=3D"MsoNormal">How did you guys managed to boot? <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">3. We saw in a latest updates that there is a new u-=
boot <a href=3D"https://github.com/legoater/u-boot/tree/v2016.05-ast2500">
https://github.com/legoater/u-boot/tree/v2016.05-ast2500</a>.<o:p></o:p></p=
>
<p class=3D"MsoNormal">Is it stable enough for using it?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you guys for the great support,<o:p></o:p></p>
<p class=3D"MsoNormal">Shay<o:p></o:p></p>
</div>
</body>
</html>

--_000_DB4PR05MB0941CA88039CFE2BEEA8ECD9D55D0DB4PR05MB0941eurp_--
