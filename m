Return-Path: <Brenden_Lai@jabil.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=jabil.com
 (client-ip=40.107.75.98; helo=nam02-bl2-obe.outbound.protection.outlook.com;
 envelope-from=brenden_lai@jabil.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jabil.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jabil.onmicrosoft.com header.i=@jabil.onmicrosoft.com
 header.b="vYnAThrH"; dkim-atps=neutral
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750098.outbound.protection.outlook.com [40.107.75.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43jjHc54yzzDqSD
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 18:05:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jabil.onmicrosoft.com; 
 s=selector1-jabil-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EAWvf0ANvKUPK9SGmCjWJqpHXX+3t4e36FcrSB5yLQ=;
 b=vYnAThrH3AnDBb5s2HuWm44fTD85W1Yc6IgSDpptGW6ipebFWWJabahrq9Fp5YubnuHSEKMScn1GcRObubsAeqozTi5Mqc6K2J4pntpg2iXDSEG2P4DQuU+L7ZqmbbFArPahc0iZtY1qTLoibVnYqET1AXZ9DWc5J6sy4AvtpWI=
Received: from SN6PR02MB5693.namprd02.prod.outlook.com (20.177.252.17) by
 SN6PR02MB3917.namprd02.prod.outlook.com (52.135.69.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.27; Mon, 21 Jan 2019 07:05:26 +0000
Received: from SN6PR02MB5693.namprd02.prod.outlook.com
 ([fe80::59f9:194e:34f4:584f]) by SN6PR02MB5693.namprd02.prod.outlook.com
 ([fe80::59f9:194e:34f4:584f%4]) with mapi id 15.20.1537.031; Mon, 21 Jan 2019
 07:05:26 +0000
From: Brenden Lai <Brenden_Lai@jabil.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: couple OpenBMC  image build and update  questions
Thread-Topic: couple OpenBMC  image build and update  questions
Thread-Index: AdSxV3yQN54/Qbr6QFq0fLqE6pTJLw==
Date: Mon, 21 Jan 2019 07:05:26 +0000
Message-ID: <SN6PR02MB56937EE5CC255D9D877300A4969F0@SN6PR02MB5693.namprd02.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5Lmh0bWwiIHA9ImM6XHVzZXJzXDE1MzIxNDhcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1lYjE2NjQ0ZS0xZDRhLTExZTktODc5NC1iODhhNjBhMzA2OTFcYW1lLXRlc3RcZWIxNjY0NTAtMWQ0YS0xMWU5LTg3OTQtYjg4YTYwYTMwNjkxYm9keS5odG1sIiBzej0iNjg1NyIgdD0iMTMxOTI1Mjc5MjMwNjEyNjc1IiBoPSI2ZWhJcDBQNnp6N1UrdlV5K0tvZ3hTTjVsaFk9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brenden_Lai@jabil.com; 
x-originating-ip: [165.225.102.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN6PR02MB3917;
 20:/XXfo0mK7Aa16ujaTqmaT0NKlpekViSO1GUPdpQe2y258hMO5zTcpZwfpaaabjK/xq9lBlxuuGgs50sqCgJI2SzDHVXEwUwcTDiYsp+cGuToQonYIOtbQrp6vISlrullUWVjGDcaXh76wvFzNod0+LAvegcZhbx0i12W5FHIoQM=
x-ms-office365-filtering-correlation-id: 3fa74c38-c3d9-4de2-e561-08d67f6ed1e3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:SN6PR02MB3917; 
x-ms-traffictypediagnostic: SN6PR02MB3917:
x-microsoft-antispam-prvs: <SN6PR02MB3917B4EEEB1294A570788721969F0@SN6PR02MB3917.namprd02.prod.outlook.com>
x-forefront-prvs: 0924C6A0D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(39860400002)(136003)(396003)(366004)(189003)(199004)(53754006)(256004)(14444005)(86362001)(7696005)(99286004)(5024004)(478600001)(55236004)(72206003)(6506007)(7736002)(476003)(186003)(80792005)(6306002)(102836004)(26005)(2906002)(1730700003)(81156014)(3846002)(97736004)(2501003)(81166006)(6116002)(10710500007)(8676002)(790700001)(8936002)(316002)(71190400001)(71200400001)(6436002)(7110500001)(55016002)(74316002)(68736007)(6916009)(33656002)(66066001)(2420400007)(15650500001)(14454004)(53936002)(25786009)(54896002)(9686003)(486006)(105586002)(106356001)(66574012)(5640700003)(2351001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR02MB3917;
 H:SN6PR02MB5693.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: jabil.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tEM5dH3EnChXJ5dYw07gb7JAUoixutW6NjSqW/ucJeQE+wYTmL2eo10aDIpTnyatv4aca27q0yQCLQ3Esm5fb8WQuxMo29KeLRfCN1+EPixw8C/M46PBG3xfdp7WZtpE3svrlUO9VhLGSDABNRQahWpyfB628Y5RpMUxrnevzIJT9x9pt2GUunUyxiKCL5VnYA2Y1H5JhO560OLQZH20aEtzhKY5ZlmISAexA7eWFPVr2o8gSnNqx3AH6tWoa56XrXgAk34Xlpw2T8evMvFzkVdU8MtkUbb/svL1Q6uXvD5P82pwrW2JdY0vUX1gnuUPqc57rg6opf8XBzu3BW7cuJ4z5RY82t+xCFQTDZNG64X7tpAO582/Zs6PgiRF75HPTr7PF6ByGRGdoZwewm2uNBI9MqeQCJ8VMt7RxGHD7jY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_SN6PR02MB56937EE5CC255D9D877300A4969F0SN6PR02MB5693namp_"
MIME-Version: 1.0
X-OriginatorOrg: jabil.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa74c38-c3d9-4de2-e561-08d67f6ed1e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2019 07:05:26.2366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc876b21-f134-4c12-a265-8ed26b7f0f3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB3917
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
X-List-Received-Date: Mon, 21 Jan 2019 07:05:34 -0000

--_000_SN6PR02MB56937EE5CC255D9D877300A4969F0SN6PR02MB5693namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgYWxsICwNCiAgICAgICAgICAgICAgIEkgaGF2ZSBkb25lIG15IGZpcnN0IE9wZW5CTUMgYnVp
bGQgd2l0aCB2ZXIgMi42ICwgaXQgZG8gdGFrZSBhIGxvbmcgdGltZSAuDQogICAgICAgICAgICAg
ICBIZXJlIGlzIG15IHF1ZXN0aW9ucyAuDQoNCiAgMS4gIEF0dGFjaCBzY3JlZW5zaG90ICwgV2hp
Y2ggb25lIGlzIHRoZSBCTUMgRlcgaW1hZ2UgIGFmdGVyIGJ1aWxkaW5nPw0KICAyLiAgRG9lcyB0
aGUgaW1hZ2UgZm9yIGJvdGggUUVNVSBhbmQgcmVhbCBtYWNoaW5lID8NCiAgMy4gIEhvdyB0byB1
cGRhdGUgaXQgYnkgcHJvZ3JhbW1pbmcgdG9vbCBsaWtlIFNGNjAwPw0KICA0LiAgRG9lcyBpdCBz
dXBwb3J0IG9ubGluZSB1cGRhdGUgc3VjaCBhcyBBTUkgWUFGVSBmbGFzaCA/oUANCg0KDQpIZXJl
IGlzIHRoZSBvdXRwdXQgb2YgbXkgIGJ1aWxkDQpicmVuZGVuQGJyZW5kZW4tVmlydHVhbEJveDp+
L09DUC9vcGVuYm1jL2J1aWxkL3RtcC9kZXBsb3kvaW1hZ2VzL3FlbXVhcm0kIGxzIG9ibWMqDQpv
Ym1jLXBob3NwaG9yLWRlYnVnLXRhcmJhbGwtcWVtdWFybS0yMDE5MDExOTEyMDYzMC5xZW11Ym9v
dC5jb25mDQpvYm1jLXBob3NwaG9yLWRlYnVnLXRhcmJhbGwtcWVtdWFybS0yMDE5MDExOTEyMDYz
MC5yb290ZnMubWFuaWZlc3QNCm9ibWMtcGhvc3Bob3ItZGVidWctdGFyYmFsbC1xZW11YXJtLTIw
MTkwMTE5MTIwNjMwLnJvb3Rmcy50YXIueHoNCm9ibWMtcGhvc3Bob3ItZGVidWctdGFyYmFsbC1x
ZW11YXJtLTIwMTkwMTE5MTIwNjMwLnRlc3RkYXRhLmpzb24NCm9ibWMtcGhvc3Bob3ItZGVidWct
dGFyYmFsbC1xZW11YXJtLm1hbmlmZXN0DQpvYm1jLXBob3NwaG9yLWRlYnVnLXRhcmJhbGwtcWVt
dWFybS5xZW11Ym9vdC5jb25mDQpvYm1jLXBob3NwaG9yLWRlYnVnLXRhcmJhbGwtcWVtdWFybS50
YXIueHoNCm9ibWMtcGhvc3Bob3ItZGVidWctdGFyYmFsbC1xZW11YXJtLnRlc3RkYXRhLmpzb24N
Cm9ibWMtcGhvc3Bob3ItaW1hZ2UtcWVtdWFybS0yMDE5MDExOTEyMDYzMC5xZW11Ym9vdC5jb25m
DQpvYm1jLXBob3NwaG9yLWltYWdlLXFlbXVhcm0tMjAxOTAxMTkxMjA2MzAucm9vdGZzLmV4dDQN
Cm9ibWMtcGhvc3Bob3ItaW1hZ2UtcWVtdWFybS0yMDE5MDExOTEyMDYzMC5yb290ZnMubWFuaWZl
c3QNCm9ibWMtcGhvc3Bob3ItaW1hZ2UtcWVtdWFybS0yMDE5MDExOTEyMDYzMC5yb290ZnMudGFy
LmJ6Mg0Kb2JtYy1waG9zcGhvci1pbWFnZS1xZW11YXJtLTIwMTkwMTE5MTIwNjMwLnRlc3RkYXRh
Lmpzb24NCm9ibWMtcGhvc3Bob3ItaW1hZ2UtcWVtdWFybS5leHQ0DQpvYm1jLXBob3NwaG9yLWlt
YWdlLXFlbXVhcm0ubWFuaWZlc3QNCm9ibWMtcGhvc3Bob3ItaW1hZ2UtcWVtdWFybS5xZW11Ym9v
dC5jb25mDQpvYm1jLXBob3NwaG9yLWltYWdlLXFlbXVhcm0udGFyLmJ6Mg0Kb2JtYy1waG9zcGhv
ci1pbWFnZS1xZW11YXJtLnRlc3RkYXRhLmpzb24NCg0KQnJlbmRlbiBMYWkNClNSLiBCTUMgRGVz
aWduIEVuZ2luZWVyDQpFJkksIEphYmlsIERlc2lnbiBTZXJ2aWNlcw0KDQo=

--_000_SN6PR02MB56937EE5CC255D9D877300A4969F0SN6PR02MB5693namp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=B7s=B2=D3=A9=FA=C5=E9;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=B7s=B2=D3=A9=FA=C5=E9";
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
	{mso-list-id:1903830963;
	mso-list-type:hybrid;
	mso-list-template-ids:215649264 -1169934874 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.25in;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:1.75in;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.25in;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.75in;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:3.25in;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:3.75in;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.25in;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:4.75in;
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
<p class=3D"MsoNormal">Hi all , <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have done my first OpenBMC build with ve=
r 2.6 , it do take a long time .
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Here is my questions . <o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:.25in;mso-list:l0 level=
1 lfo1">Attach screenshot , Which one is the BMC FW image &nbsp;after build=
ing?
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:.25in;m=
so-list:l0 level1 lfo1">Does the image for both QEMU and real machine ?<o:p=
></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:.25in;mso-l=
ist:l0 level1 lfo1">How to update it by programming tool like SF600?<o:p></=
o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:.25in;mso-list=
:l0 level1 lfo1">Does it support online update such as AMI YAFU flash ?<spa=
n lang=3D"ZH-TW" style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,se=
rif">=A1@</span><o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Here is the output of my&nbsp; build <o:p></o:p></p>
<p class=3D"MsoNormal">brenden@brenden-VirtualBox:~/OCP/openbmc/build/tmp/d=
eploy/images/qemuarm$ ls obmc*<o:p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-debug-tarball-qemuarm-20190119120630.q=
emuboot.conf<o:p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-debug-tarball-qemuarm-20190119120630.r=
ootfs.manifest<o:p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-debug-tarball-qemuarm-20190119120630.r=
ootfs.tar.xz<o:p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-debug-tarball-qemuarm-20190119120630.t=
estdata.json<o:p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-debug-tarball-qemuarm.manifest<o:p></o=
:p></p>
<p class=3D"MsoNormal">obmc-phosphor-debug-tarball-qemuarm.qemuboot.conf<o:=
p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-debug-tarball-qemuarm.tar.xz<o:p></o:p=
></p>
<p class=3D"MsoNormal">obmc-phosphor-debug-tarball-qemuarm.testdata.json<o:=
p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-image-qemuarm-20190119120630.qemuboot.=
conf<o:p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-image-qemuarm-20190119120630.rootfs.ex=
t4<o:p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-image-qemuarm-20190119120630.rootfs.ma=
nifest<o:p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-image-qemuarm-20190119120630.rootfs.ta=
r.bz2<o:p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-image-qemuarm-20190119120630.testdata.=
json<o:p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-image-qemuarm.ext4<o:p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-image-qemuarm.manifest<o:p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-image-qemuarm.qemuboot.conf<o:p></o:p>=
</p>
<p class=3D"MsoNormal">obmc-phosphor-image-qemuarm.tar.bz2<o:p></o:p></p>
<p class=3D"MsoNormal">obmc-phosphor-image-qemuarm.testdata.json<o:p></o:p>=
</p>
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

--_000_SN6PR02MB56937EE5CC255D9D877300A4969F0SN6PR02MB5693namp_--
