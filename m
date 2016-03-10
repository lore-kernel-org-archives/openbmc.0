Return-Path: <shays@mellanox.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
 (mail-am1on0067.outbound.protection.outlook.com [157.56.112.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5FBC61A02DE
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2016 00:03:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b=hSGIzDki; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ylNm05449eIe/uUlHS8PewCkjnNqbqwhWUqcwXutkNg=;
 b=hSGIzDkiRya0g9dTJZ8GekrL3hkzu1wPGbjE6kACBo+u6nj4GSVfJYe3OusB32I18/Cse4Y6wwRhRWBWJTrI/Scsk/Z2DBiXNFFtCSlWM7uUBMBu6q9jThjuEj4S6koVjsWerwMN2hjPR5TqGHK1n101P89QoFCDe7EPAw07B+0=
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com (10.161.249.145) by
 DB4PR05MB0944.eurprd05.prod.outlook.com (10.161.249.148) with Microsoft SMTP
 Server (TLS) id 15.1.415.20; Thu, 10 Mar 2016 13:03:23 +0000
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) by
 DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) with mapi id
 15.01.0415.024; Thu, 10 Mar 2016 13:03:23 +0000
From: Shay Slobodkin <shays@mellanox.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Assistance adding new system into openbmc project
Thread-Topic: Assistance adding new system into openbmc project
Thread-Index: AdF6tsG1sA6ZATX6RZWAH0oBLaL/cg==
Date: Thu, 10 Mar 2016 13:03:22 +0000
Message-ID: <DB4PR05MB09410DE4CC28F7164F053B26D5B40@DB4PR05MB0941.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=mellanox.com;
x-originating-ip: [193.47.165.251]
x-microsoft-exchange-diagnostics: 1; DB4PR05MB0944;
 5:H0WWYU/pprY2jfNc4fFy5lFNpJRn+yuu3k4YUbpW23yS7xzJ7dXTx+4aFmd6jhX4CXKYouHN4Aqs1IkQ1+RFpOpFBXACgXMYRrh9TdtGq4v0YU0FHcRq98XAcAZTeV24loAsEvigVuge19PIH4AkEA==;
 24:kY/VDv4WbrFD/b33aXO6dVsslWJXPNqqrTEW9wK0HibjdHuLuuDF5eG5LNqaDKC6nM0x6132iMVB0jfhDA5GIH7vsgnbVxx2VuVEcRGs8T8=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR05MB0944;
x-ms-office365-filtering-correlation-id: 3b47e2ff-b397-49ea-ac7f-08d348e45c92
x-microsoft-antispam-prvs: <DB4PR05MB0944C15D39A685ABDD109DB9D5B40@DB4PR05MB0944.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001);
 SRVR:DB4PR05MB0944; BCL:0; PCL:0; RULEID:; SRVR:DB4PR05MB0944; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(54356999)(15975445007)(76576001)(77096005)(16236675004)(19300405004)(2501003)(1220700001)(2351001)(2900100001)(92566002)(86362001)(87936001)(5004730100002)(229853001)(3660700001)(110136002)(107886002)(189998001)(3280700002)(10400500002)(74316001)(5008740100001)(33656002)(586003)(1096002)(6116002)(102836003)(19580395003)(3846002)(5002640100001)(50986999)(450100001)(81166005)(19625215002)(11100500001)(66066001)(2906002)(122556002)(790700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR05MB0944;
 H:DB4PR05MB0941.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
Content-Type: multipart/alternative;
 boundary="_000_DB4PR05MB09410DE4CC28F7164F053B26D5B40DB4PR05MB0941eurp_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2016 13:03:22.9731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR05MB0944
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Mar 2016 13:03:36 -0000

--_000_DB4PR05MB09410DE4CC28F7164F053B26D5B40DB4PR05MB0941eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

We are newbies for the openbmc project, read through the manuals and would =
like to work under the ast2520 system.
We have several questions regarding the tree structure and building.

Reading the manuals and from our understanding, we suggest the following tr=
ee additions to support our system.
Please let us know if you find the below as the complete and correct additi=
ons.

=3D=3D=3D=3D=3D=3D=3D=3D=3D

root
|-- meta-openbmc-bsp
|   `-- meta-aspeed
|       |-- conf
|       |   `-- layer.conf
|       `-- meta-ast2520 (New SoC)
|           |-- conf
|           |   |-- layer.conf
|           |   `-- machine
|           |       `-- include
|           |           `-- ast2520.inc
|           |-- recipes-bsp
|           |   `-- u-boot
|           |       |-- files
|           |       |   |-- config.patch
|           |       |   |-- fw_env.config
|           |       |   `-- patch-2013.07
|           |       |       |-- 0000-u-boot-aspeed-064.patch (Exist)
|           |       |       |-- 0001-u-boot-openbmc.patch (Exist)
|           |       |       `-- 0002-u-boot-aspeed_2520_2500.patch (Patch w=
ith 2500-2520 u-boot support)
|           |       |-- u-boot-fw-utils_2013.07%.bbappend

|           |       `-- u-boot_2013.07%.bbappend
|           |-- recipes-kernel
|           |   `-- linux
|           |       |-- linux-obmc
|           |       |   |-- defconfig
|           |       |   |-- files
|           |       |       `-- patch-4.3-dev (Or later, temporary till cod=
e upstream)
|           |       |           |-- 0000-kernel-aspeed_soc_2520.patch (Patc=
h with 2520 SoC support)
|           |       |           |-- 0001-kernel-aspeed_2500_2520_dts.patch =
(Patch with basic dts support)
|           |       |   `-- hwmon.cfg
|           |       `-- linux-obmc_%.bbappend
|           `-- recipes.txt
|-- meta-openbmc-x86-machines
|   `-- meta-mellanox
|   |   |-- conf
|   |   |   |-- layer.conf
|   |   |   `-- machine
|   |   |       `-- include
|   |   |           `-- mellanox.inc
|   |   `-- meta-mellanox-edr
|   |       |-- conf
|   |       |   |-- layer.conf
|   |       |   `-- machine
|   |       |       `-- include
|   |       |           `-- mellanox.inc
|   |       |-- recipes-kernel
|   |       |   `-- linux
|   |       |       |-- linux-obmc
|   |       |       |   |-- files
|   |       |       |       `-- patch-4.3-dev (Or later, temporary till cod=
e upstream)
|   |       |       |          |-- 0002-kernel-mellanox-dts.patch (Patch wi=
th Mellanox dts support)
|   |       |       |   |-- mellanox-edr.cfg
|   |       |       |   `-- mellanox-edr.dts
|   |       |       `-- linux-obmc_%.bbappend
|   |       `-- recipes.txt

=3D=3D=3D=3D=3D=3D=3D=3D=3D

Also, should we add a "local.conf.sample" file under the "meta-openbmc-x86-=
machines/conf" path?
If so, we were wondering about the following variables under the local.conf=
.sample file (we took the phosphor one as example):
PACKAGE_CLASSES ?=3D "package_rpm"
SANITY_TESTED_DISTROS_append ?=3D " RedHatEnterpriseWorkstation-6.*"
EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
USER_CLASSES ?=3D "buildstats image-mklibs image-prelink"
PATCHRESOLVE =3D "noop"
BB_DISKMON_DIRS =3D "\
    STOPTASKS,${TMPDIR},1G,100K \
    STOPTASKS,${DL_DIR},1G,100K \
    STOPTASKS,${SSTATE_DIR},1G,100K \
    STOPTASKS,/tmp,100M,100K \
    ABORT,${TMPDIR},100M,1K \
    ABORT,${DL_DIR},100M,1K \
    ABORT,${SSTATE_DIR},100M,1K \
    ABORT,/tmp,10M,1K"

Guess we should use the "genericx86-64" as MACHINE variable

We were wondering what specific "oe-init-build-env" and similar files we sh=
ould change, in order for the project to compile.

Cheers,
Shay

--_000_DB4PR05MB09410DE4CC28F7164F053B26D5B40DB4PR05MB0941eurp_
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
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are newbies for the openbmc project, read through=
 the manuals and would like to work under the ast2520 system.<o:p></o:p></p=
>
<p class=3D"MsoNormal">We have several questions regarding the tree structu=
re and building.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Reading the manuals and from our understanding, we s=
uggest the following tree additions to support our system.<o:p></o:p></p>
<p class=3D"MsoNormal">Please let us know if you find the below as the comp=
lete and correct additions.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">root<o:p></o:p></p>
<p class=3D"MsoNormal">|-- meta-openbmc-bsp<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; `-- meta-aspeed<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-- conf<o:p><=
/o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; =
`-- layer.conf<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `-- meta-ast25=
20 (New SoC)<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |-- conf<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp; |-- layer.conf<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp; `-- machine<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `-- include<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`--=
 ast2520.inc<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |-- recipes-bsp<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp; `-- u-boot<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-- files<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; |-- config.pa=
tch<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; |-- fw_env.co=
nfig<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; `-- patch-201=
3.07<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |-- 0000-u-boot-aspeed-064.patch (Exist)<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |-- 0001-u-boot-openbmc.patch (Exist)<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; `-- 0002-u-boot-aspeed_2520_2500.patch (Patch with 2500-2520 u-b=
oot support)<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;|-- u-boot-fw-utils_2013.07=
%.bbappend<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `-- u-boot_2013.07%.bbappen=
d<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |-- recipes-kernel<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp; `-- linux<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-- linux-obmc<o:p></o:p></=
p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; |-- defconfig=
<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; |-- files<o:p=
></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; `-- patch-4.3-dev (Or later, temporary till code upstream)<o:p><=
/o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-- 0000-kernel-aspeed_soc_2520.patch (P=
atch with 2520 SoC support)<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-- 0001-kernel-aspeed_2500_2520_dts.pat=
ch (Patch with basic dts support)<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; `-- hwmon.cfg=
<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `-- linux-obmc_%.bbappend<o=
:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; `-- recipes.txt<o:p></o:p></p>
<p class=3D"MsoNormal">|-- meta-openbmc-x86-machines<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; `-- meta-mellanox<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp; |-- conf<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp; |&nbsp;&nbsp; |-- layer.=
conf<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp; |&nbsp; &nbsp;`-- machin=
e<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; `-- include<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `-- mellanox.inc<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp; `-- meta-mellanox-edr<o:=
p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|-- conf<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp; |-- layer.conf<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp; `-- machine<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `-- include<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `-- mellanox.=
inc<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|-- recipes-kernel<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp; `-- linux<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-- linux-obmc<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; |-- files<o:p></o:p></p=
>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 `-- patch-4.3-dev (Or later, temporary till code upstream)<o:p></o:p></p>
<p class=3D"MsoNormal">| &nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; |-- 0002-kernel-mellanox-dts.patch (Patch with Mellanox =
dts support)<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; |-- mellanox-edr.cfg<o:=
p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; `-- mellanox-edr.dts<o:=
p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `-- linux-obmc_%.bbappend<o:p></o:p><=
/p>
<p class=3D"MsoNormal">|&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
`-- recipes.txt<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Also, should we add a &#8220;local.conf.sample&#8221=
; file under the &#8220;meta-openbmc-x86-machines/conf&#8221; path?<o:p></o=
:p></p>
<p class=3D"MsoNormal">If so, we were wondering about the following variabl=
es under the local.conf.sample file (we took the phosphor one as example):<=
o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">PACKAGE_CLASSES ?=3D &quo=
t;package_rpm&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">SANITY_TESTED_DISTROS_app=
end ?=3D &quot; RedHatEnterpriseWorkstation-6.*&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">EXTRA_IMAGE_FEATURES =3D =
&quot;debug-tweaks&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">USER_CLASSES ?=3D &quot;b=
uildstats image-mklibs image-prelink&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">PATCHRESOLVE =3D &quot;no=
op&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">BB_DISKMON_DIRS =3D &quot=
;\<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp; STOPTA=
SKS,${TMPDIR},1G,100K \<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp; STOPTA=
SKS,${DL_DIR},1G,100K \<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp; STOPTA=
SKS,${SSTATE_DIR},1G,100K \<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp; STOPTA=
SKS,/tmp,100M,100K \<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp; ABORT,=
${TMPDIR},100M,1K \<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp; ABORT,=
${DL_DIR},100M,1K \<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp; ABORT,=
${SSTATE_DIR},100M,1K \<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp; ABORT,=
/tmp,10M,1K&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Guess we should use the &#8220;genericx86-64&#8221; =
as MACHINE variable<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We were wondering what specific &#8220;oe-init-build=
-env&#8221; and similar files we should change, in order for the project to=
 compile.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Cheers,<o:p></o:p></p>
<p class=3D"MsoNormal">Shay<o:p></o:p></p>
</div>
</body>
</html>

--_000_DB4PR05MB09410DE4CC28F7164F053B26D5B40DB4PR05MB0941eurp_--
