Return-Path: <Brenden_Lai@jabil.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=jabil.com
 (client-ip=40.107.71.111; helo=nam05-by2-obe.outbound.protection.outlook.com;
 envelope-from=brenden_lai@jabil.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=jabil.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jabil.com header.i=@jabil.com header.b="Ux9Qqll8"; 
 dkim-atps=neutral
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710111.outbound.protection.outlook.com [40.107.71.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43qNk26lfPzDqWr
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 23:59:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jabil.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdaLeS9DgmKtmqMmb69v6KkvsB2w7tQfELmE1Ms2WZc=;
 b=Ux9Qqll86dYiC8O+9T54bPHEGObnwUF+LznWM3Be18+bnkyyJupY6cxS+icU6/S4XR7f1t4Muo5bc45eqWog7ldfCuyzEOpjKA8YWrHpUCWUWNjLfSz0+Kv7O3G9G2i5/huclAsaTqV4z29V2pADiCN2cWM30nQKs5zbZEZ2fWg=
Received: from SN6PR02MB5693.namprd02.prod.outlook.com (20.177.252.17) by
 SN6PR02MB4958.namprd02.prod.outlook.com (52.135.116.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.17; Wed, 30 Jan 2019 12:59:34 +0000
Received: from SN6PR02MB5693.namprd02.prod.outlook.com
 ([fe80::40f4:6107:9cdc:3271]) by SN6PR02MB5693.namprd02.prod.outlook.com
 ([fe80::40f4:6107:9cdc:3271%2]) with mapi id 15.20.1580.017; Wed, 30 Jan 2019
 12:59:34 +0000
From: Brenden Lai <Brenden_Lai@jabil.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: about toolchain selection
Thread-Topic: about toolchain selection
Thread-Index: AdS4mfxlhTU5GLVbTPKdZuvqcRDKjA==
Date: Wed, 30 Jan 2019 12:59:33 +0000
Message-ID: <SN6PR02MB569348097B12E3C37722251F96900@SN6PR02MB5693.namprd02.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5Lmh0bWwiIHA9ImM6XHVzZXJzXDE1MzIxNDhcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1lMWVhMjU3Yy0yNDhlLTExZTktODc5Yi1iODhhNjBhMzA2OTFcYW1lLXRlc3RcZTFlYTI1N2QtMjQ4ZS0xMWU5LTg3OWItYjg4YTYwYTMwNjkxYm9keS5odG1sIiBzej0iMTA3NzkiIHQ9IjEzMTkzMzI2NzcxNjE1MzQ4MCIgaD0iN01jZExjNm04NHFBdkZMWWZOK0VsK25yclIwPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brenden_Lai@jabil.com; 
x-originating-ip: [2001:b011:300b:30ea:19dc:1369:9c27:4458]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN6PR02MB4958;
 20:OwluL8vL0paxroDYUHK6WzB9rLqXwRSfJAMpGL9eL056um/4rSjqwwh2Qlz2uA9Ri44pMHUmlejpABK7AHSQekDHjj2gzCkc+xyCT4MhIrh3AlMWamRiYxtY1rhyX93NrpE8NvsEh+UYMOl09jFahcIOgDVjJ77BRiMuZpAilLA=
x-ms-office365-filtering-correlation-id: 7c4417b3-bd1d-409c-021d-08d686b2c837
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:SN6PR02MB4958; 
x-ms-traffictypediagnostic: SN6PR02MB4958:
x-microsoft-antispam-prvs: <SN6PR02MB49586C0E439D8F23808CD05396900@SN6PR02MB4958.namprd02.prod.outlook.com>
x-forefront-prvs: 0933E9FD8D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(366004)(376002)(39860400002)(396003)(53754006)(199004)(189003)(74316002)(72206003)(7116003)(3480700005)(6436002)(106356001)(80792005)(486006)(25786009)(99286004)(478600001)(102836004)(86362001)(7696005)(97736004)(6506007)(14454004)(68736007)(256004)(53936002)(54896002)(8936002)(5640700003)(6306002)(7736002)(105586002)(9686003)(8676002)(1730700003)(81166006)(316002)(2351001)(790700001)(33656002)(46003)(186003)(6116002)(81156014)(55016002)(71200400001)(2501003)(71190400001)(476003)(2906002)(6916009)(133083001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR02MB4958;
 H:SN6PR02MB5693.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: jabil.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +ATdpcYqZK5z99TzS3bSH0MugzQ8V4r/psww0QnCX8BQXWdBLVkVZssEhC81J/GzafzP7pdH7KOvZ1mTQpJ9Qq8x0q7Xn26R0o7mIC/S13kwA7pwR2m7BMKNJpGYk3dQ67lIlYSvNyFGnU7ZFOy6jDxZL7/XGNb0xkqI5npnQ426V+NO+RUiSYIbg6ebILRKIpy9J8D/Vcqx8mgJYyGhcXK61mdA+R9FfkukdoSY/p6ty+LnvJz6r5LDJc3tlKzNa1dtje8NIh/s/iqTC1RUEnVHeMbds7s7xD12PTe2KuzHITaTzK2wYujJa2L9At8IaGtEduW8J4PMzGP32UNZ7Wh+mTeaPqp/4HbZu8phKGdGRdCAbLCdvY+rwp+QPoU14Fjq9++UEJuVOdtrMN/BaSjFsbn+gr0ReYmSN9oNg7I=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR02MB569348097B12E3C37722251F96900SN6PR02MB5693namp_"
MIME-Version: 1.0
X-OriginatorOrg: jabil.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4417b3-bd1d-409c-021d-08d686b2c837
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2019 12:59:33.9521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc876b21-f134-4c12-a265-8ed26b7f0f3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4958
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
X-List-Received-Date: Wed, 30 Jan 2019 12:59:40 -0000

--_000_SN6PR02MB569348097B12E3C37722251F96900SN6PR02MB5693namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi all ,

I am curious about how bitbake knows which toolchain should be use for spec=
ific architecture.
Then I try to find certain build tool (ex: arm-openbmc-linux-gnueabi-strip)=
, Surprisingly , it located in a lot of recipe folders as below

./build/tmp/work/armv6-openbmc-linux-gnueabi/python-pytest/3.4.2-r0/recipe-=
sysroot-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-=
gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/python-pytest/3.4.2-r0/recipe-=
sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-=
strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/udev-aspeed-vuart/1.0-r1/recip=
e-sysroot-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linu=
x-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/udev-aspeed-vuart/1.0-r1/recip=
e-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueab=
i-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/nbd/3.17-r0/recipe-sysroot-nat=
ive/usr/libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/8.2=
.0/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/nbd/3.17-r0/recipe-sysroot-nat=
ive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/op-proc-control/1.0+gitAUTOINC=
+729521fef4-r1/recipe-sysroot-native/usr/libexec/arm-openbmc-linux-gnueabi/=
gcc/arm-openbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/op-proc-control/1.0+gitAUTOINC=
+729521fef4-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-=
openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/base-passwd/3.5.29-r0/recipe-s=
ysroot-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-g=
nueabi/8.2.0/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/base-passwd/3.5.29-r0/recipe-s=
ysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-s=
trip
./build/tmp/work/armv6-openbmc-linux-gnueabi/pixman/1_0.34.0-r0/recipe-sysr=
oot-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnue=
abi/8.2.0/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/pixman/1_0.34.0-r0/recipe-sysr=
oot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-stri=
p
./build/tmp/work/armv6-openbmc-linux-gnueabi/net-snmp/5.8-r0/recipe-sysroot=
-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi=
/8.2.0/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/net-snmp/5.8-r0/recipe-sysroot=
-native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/liblogging/1.0.6-r0/recipe-sys=
root-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnu=
eabi/8.2.0/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/liblogging/1.0.6-r0/recipe-sys=
root-native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-str=
ip
./build/tmp/work/armv6-openbmc-linux-gnueabi/libpcre/8.42-r0/recipe-sysroot=
-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi=
/8.2.0/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/libpcre/8.42-r0/recipe-sysroot=
-native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-dbus-monitor/1.0+gitA=
UTOINC+12789e6c66-r1/recipe-sysroot-native/usr/libexec/arm-openbmc-linux-gn=
ueabi/gcc/arm-openbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-dbus-monitor/1.0+gitA=
UTOINC+12789e6c66-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueab=
i/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-user-manager/1.0+gitA=
UTOINC+f5c2df5eef-r1/recipe-sysroot-native/usr/libexec/arm-openbmc-linux-gn=
ueabi/gcc/arm-openbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-user-manager/1.0+gitA=
UTOINC+f5c2df5eef-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueab=
i/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/slpd-lite/1.0+gitAUTOINC+a5928=
88328-r1/recipe-sysroot-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc/ar=
m-openbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/slpd-lite/1.0+gitAUTOINC+a5928=
88328-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbm=
c-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/pdbg/2.0+gitAUTOINC+59ebe397a3=
-r0/recipe-sysroot-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc/arm-ope=
nbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/pdbg/2.0+gitAUTOINC+59ebe397a3=
-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-lin=
ux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/openldap/2.4.46-r0/recipe-sysr=
oot-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnue=
abi/8.2.0/arm-openbmc-linux-gnueabi-strip
./build/tmp/work/armv6-openbmc-linux-gnueabi/openldap/2.4.46-r0/recipe-sysr=
oot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-stri=
p


  1.  Does it make sense for duplicate toolchain ?
  2.  How to write recipe to add new packages(ex:Net-snmp , ipmitool ) into=
 OpenBmc ?



Brenden Lai
SR. BMC Design Engineer
E&I, Jabil Design Services


--_000_SN6PR02MB569348097B12E3C37722251F96900SN6PR02MB5693namp_
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
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
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
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:274799189;
	mso-list-type:hybrid;
	mso-list-template-ids:-1630920740 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi all ,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am curious about how bitbake knows which toolchain=
 should be use for specific architecture.
<o:p></o:p></p>
<p class=3D"MsoNormal">Then I try to find certain build tool (ex: arm-openb=
mc-linux-gnueabi-strip), Surprisingly , it located in a lot of recipe folde=
rs as below<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/python-=
pytest/3.4.2-r0/recipe-sysroot-native/usr/libexec/arm-openbmc-linux-gnueabi=
/gcc/arm-openbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip<o:p></=
o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/python-=
pytest/3.4.2-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm=
-openbmc-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/udev-as=
peed-vuart/1.0-r1/recipe-sysroot-native/usr/libexec/arm-openbmc-linux-gnuea=
bi/gcc/arm-openbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip<o:p>=
</o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/udev-as=
peed-vuart/1.0-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/a=
rm-openbmc-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/nbd/3.1=
7-r0/recipe-sysroot-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc/arm-op=
enbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/nbd/3.1=
7-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-li=
nux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/op-proc=
-control/1.0&#43;gitAUTOINC&#43;729521fef4-r1/recipe-sysroot-native/usr/lib=
exec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/8.2.0/arm-open=
bmc-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/op-proc=
-control/1.0&#43;gitAUTOINC&#43;729521fef4-r1/recipe-sysroot-native/usr/bin=
/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/base-pa=
sswd/3.5.29-r0/recipe-sysroot-native/usr/libexec/arm-openbmc-linux-gnueabi/=
gcc/arm-openbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip<o:p></o=
:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/base-pa=
sswd/3.5.29-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-=
openbmc-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/pixman/=
1_0.34.0-r0/recipe-sysroot-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc=
/arm-openbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip<o:p></o:p>=
</p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/pixman/=
1_0.34.0-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-ope=
nbmc-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/net-snm=
p/5.8-r0/recipe-sysroot-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc/ar=
m-openbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip<o:p></o:p></p=
>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/net-snm=
p/5.8-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbm=
c-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/liblogg=
ing/1.0.6-r0/recipe-sysroot-native/usr/libexec/arm-openbmc-linux-gnueabi/gc=
c/arm-openbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip<o:p></o:p=
></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/liblogg=
ing/1.0.6-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-op=
enbmc-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/libpcre=
/8.42-r0/recipe-sysroot-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc/ar=
m-openbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip<o:p></o:p></p=
>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/libpcre=
/8.42-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbm=
c-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/phospho=
r-dbus-monitor/1.0&#43;gitAUTOINC&#43;12789e6c66-r1/recipe-sysroot-native/u=
sr/libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/8.2.0/ar=
m-openbmc-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/phospho=
r-dbus-monitor/1.0&#43;gitAUTOINC&#43;12789e6c66-r1/recipe-sysroot-native/u=
sr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-strip<o:p></o:p>=
</p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/phospho=
r-user-manager/1.0&#43;gitAUTOINC&#43;f5c2df5eef-r1/recipe-sysroot-native/u=
sr/libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/8.2.0/ar=
m-openbmc-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/phospho=
r-user-manager/1.0&#43;gitAUTOINC&#43;f5c2df5eef-r1/recipe-sysroot-native/u=
sr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-strip<o:p></o:p>=
</p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/slpd-li=
te/1.0&#43;gitAUTOINC&#43;a592888328-r1/recipe-sysroot-native/usr/libexec/a=
rm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/8.2.0/arm-openbmc-li=
nux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/slpd-li=
te/1.0&#43;gitAUTOINC&#43;a592888328-r1/recipe-sysroot-native/usr/bin/arm-o=
penbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/pdbg/2.=
0&#43;gitAUTOINC&#43;59ebe397a3-r0/recipe-sysroot-native/usr/libexec/arm-op=
enbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-g=
nueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/pdbg/2.=
0&#43;gitAUTOINC&#43;59ebe397a3-r0/recipe-sysroot-native/usr/bin/arm-openbm=
c-linux-gnueabi/arm-openbmc-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/openlda=
p/2.4.46-r0/recipe-sysroot-native/usr/libexec/arm-openbmc-linux-gnueabi/gcc=
/arm-openbmc-linux-gnueabi/8.2.0/arm-openbmc-linux-gnueabi-strip<o:p></o:p>=
</p>
<p class=3D"MsoNormal">./build/tmp/work/armv6-openbmc-linux-gnueabi/openlda=
p/2.4.46-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-ope=
nbmc-linux-gnueabi-strip<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">Does it make sense for duplicate toolchain ?<o:p></o:p></li><li class=
=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 lfo1">How=
 to write recipe to add new packages(ex:Net-snmp , ipmitool ) into OpenBmc =
?<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:10.0pt;color:black">Brenden Lai<br>
SR. BMC Design Engineer<br>
</span><span style=3D"font-size:10.0pt;color:#222222">E&amp;I, Jabil Design=
 Services</span><span style=3D"font-size:10.0pt;color:black"><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SN6PR02MB569348097B12E3C37722251F96900SN6PR02MB5693namp_--
