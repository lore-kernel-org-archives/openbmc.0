Return-Path: <maheswari.a@atos.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=atos.net
 (client-ip=193.56.114.164; helo=smtppost.atos.net;
 envelope-from=maheswari.a@atos.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=atos.net
Received: from smtppost.atos.net (smtppost.atos.net [193.56.114.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43L0yR4c9SzDqtl
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 16:42:19 +1100 (AEDT)
Received: from mail1-ext.my-it-solutions.net (mail1-ext.my-it-solutions.net)
 by smarthost5.atos.net with smtp
 (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
 id 0938_2504_3e5d1d6d_07d7_4926_8910_b11881233655;
 Thu, 20 Dec 2018 06:42:12 +0100
Received: from mail3-int.my-it-solutions.net ([10.92.32.10])
 by mail1-ext.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id wBK5gBNw012150
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 06:42:12 +0100
Received: from DEERLM99ETUMSX.ww931.my-it-solutions.net ([10.86.142.96])
 by mail3-int.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id wBK5gB9U016846
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 06:42:11 +0100
Received: from DEFTHW99ETQMSX.ww931.my-it-solutions.net (10.86.142.98) by
 DEERLM99ETUMSX.ww931.my-it-solutions.net (10.86.142.96) with Microsoft SMTP
 Server (TLS) id 14.3.408.0; Thu, 20 Dec 2018 06:42:09 +0100
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (10.86.142.137)
 by hybridsmtp.it-solutions.atos.net (10.86.142.98) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 20 Dec 2018 06:42:06 +0100
Received: from DB7PR02MB4393.eurprd02.prod.outlook.com (20.177.195.218) by
 DB7PR02MB5210.eurprd02.prod.outlook.com (20.178.47.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.22; Thu, 20 Dec 2018 05:42:05 +0000
Received: from DB7PR02MB4393.eurprd02.prod.outlook.com
 ([fe80::d8e4:2dfd:19f5:1b93]) by DB7PR02MB4393.eurprd02.prod.outlook.com
 ([fe80::d8e4:2dfd:19f5:1b93%4]) with mapi id 15.20.1446.020; Thu, 20 Dec 2018
 05:42:04 +0000
From: "A, Maheswari" <maheswari.a@atos.net>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: HELP:Kernel Panic after enabling IIO-HWMON driver in DTS
Thread-Topic: HELP:Kernel Panic after enabling IIO-HWMON driver in DTS
Thread-Index: AdSYIiQPsvkIfzYnTEi0cCFr2wpDRg==
Date: Thu, 20 Dec 2018 05:42:04 +0000
Message-ID: <DB7PR02MB4393FA60E9C00C75DF8FDE0592BF0@DB7PR02MB4393.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=maheswari.a@atos.net; 
x-originating-ip: [125.17.240.232]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR02MB5210;
 6:98hNF5+68b3qCU6mkdUu/JACylYcghwOWaSeQEicljA91A6wPbJXT5AwKRW4Zs+5n6K3+3o6rggLTMJeGrwZAFEfL8/xS4ThTXzYp5s7xw+7RvYMyoUrZ7MxmYRNkXK5/zUGNjw+rly3iGO6GvuugiOpuGvenss70I3mqY+xgNudimgOehpbAzZsqZtcmAJKz2oveA/1avEizDXRSYBe7kC/iBgG/DCk8aZresGba7+blCO3VQu1OnczYPwkBoQEOyVAeFZnsw/Rx+p8dSUKHRceHyxq2eygeWCmsfan9e9GV5Opg6CwvbowGx3t66Kvbrwxr8c8CjI2GODkOtcVEivwRRgF+0N7b9azfArvYri+PZSwnL97cZcDnVon4dI5eJha1rYNuVzF3ABsSbGRJzlZubl/+HMfEnHilH4M3VygR62QOizodo1TipZBufxrswmoLODtTihTOZC4YUMNHw==;
 5:dOL2qAoqgpVGpKkWKue4/bvmUvmhE+Ea10uv6NUKj5zEE1Yb9jgQdJEssl8+b15tCCgFWUh+sx9iW4UQv87U6ymBIOb1bVyIse+SAzqOWN0w+KYpkIFi8OJoyTvU79R7d6I1PhBVGcvYiZs+Os7lhYIwjx80QIDz7CcEcT4xgXY=;
 7:8D8Ec0v3TvIwpDrKkaeMupBZ900tEC/o22nNv1fz16Rl8BV/yDK+IIyct6dYe7neFjNm7bYh77ZLDQm5Q2En8N58quSW4lf3yObmJY48pMknwhBDl54JWSruhX1G4BqDnFHWCowLo2J5XJ4vjmbCPw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 72553f77-2496-4948-6477-08d6663ddf8d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:DB7PR02MB5210; 
x-ms-traffictypediagnostic: DB7PR02MB5210:
x-microsoft-antispam-prvs: <DB7PR02MB5210AD80381536942E09737992BF0@DB7PR02MB5210.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(5005026)(6040522)(2401047)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231475)(944501520)(52105112)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:DB7PR02MB5210; BCL:0; PCL:0; RULEID:; SRVR:DB7PR02MB5210; 
x-forefront-prvs: 0892FA9A88
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(346002)(366004)(396003)(136003)(189003)(199004)(53936002)(2906002)(8676002)(186003)(74316002)(105586002)(165073002)(33656002)(575784001)(7696005)(26005)(9686003)(97736004)(86362001)(71190400001)(45080400002)(54896002)(14444005)(256004)(68736007)(14454004)(6306002)(55016002)(5024004)(71200400001)(8936002)(476003)(6916009)(790700001)(102836004)(316002)(478600001)(6506007)(486006)(66066001)(9326002)(81156014)(81166006)(6116002)(3846002)(106356001)(25786009)(6436002)(99286004)(5660300001)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB7PR02MB5210;
 H:DB7PR02MB4393.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: atos.net does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: ikC7fWzv8XpaI38iJe+kVOClG75EavMWSjuedzMbbUS/eqydaFZxecSEsUnr8uoHfDD7NZW0v+N8h3Bu1t4u/tF+gimBc7KVheG/6GXayIfS5eoNEvRLzANvlYk4oDceuvOl7Pq5toFml7cF8FSgL4iVBt3DTafpd5ETktq/mvh6mjgRrk+zDflo1Iq96KQJ8KNmRd3IEVtcGutGj1yC0IpjohTg1whbKmQSq0HJLjjQW7aB4OrxO3m2mtdk3s37JwYGN7agImBu5tVhr5QtCnOKCMlctn54+8ly0LRStbmqsxt+4aNldyife4ppPL/R
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_DB7PR02MB4393FA60E9C00C75DF8FDE0592BF0DB7PR02MB4393eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 72553f77-2496-4948-6477-08d6663ddf8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2018 05:42:04.7736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB5210
X-OriginatorOrg: atos.net
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
X-List-Received-Date: Thu, 20 Dec 2018 05:42:25 -0000

--_000_DB7PR02MB4393FA60E9C00C75DF8FDE0592BF0DB7PR02MB4393eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,



I have already enabled IIO-HWMON and ASPEED_ADC drivers in linux configurat=
ion file.



Included  changes in my platform DTS file.



    iio-hwmon {

+                compatible =3D "iio-hwmon";

+                io-channels =3D <&adc 12>;

+        };

@@ -334,3 +339,8 @@

+&adc

+{

+       status =3D "okay";

+};



We are getting the below Kernel panic after this IIO-HWMON driver changes i=
n DTS file.



Other platform are using this iio-hwmon driver. Please let us know if anyon=
e faced this same issue.





[    3.761575] =3D=3D=3D=3D 1. IIO_HWMON Probe =3D=3D=3D [    3.765477] Una=
ble to handle kernel paging request at virtual address fffffdfb [    3.7727=
10] pgd =3D f5dd9e82 [    3.775426] [fffffdfb] *pgd=3D9effd861, *pte=3D0000=
0000, *ppte=3D00000000 [    3.781715] Internal error: Oops: 37 [#1] ARM [  =
  3.786073] Modules linked in:

[    3.789148] CPU: 0 PID: 1 Comm: swapper Not tainted 4.18.8 #1 [    3.794=
892] Hardware name: Generic DT based system [    3.799706] PC is at iio_hwm=
on_probe+0xb4/0x3e4 [    3.804235] LR is at   (null) [    3.807207] pc : [<=
804eb7a0>]    lr : [<00000000>] psr: a0000013 [    3.813465] sp : 9e477d70 =
 ip : 9e5b4550  fp : 9e477dbc [    3.818681] r10: 00000000  r9 : 00000000  =
r8 : 80b51d1c [    3.823900] r7 : 9e5b4410  r6 : 9e6f2290  r5 : 00000000  r=
4 : 9e5b4400 [    3.830418] r3 : 00000000  r2 : fffffdfb  r1 : 00000000  r0=
 : fffffdfb [    3.836936] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA =
ARM Segment none [    3.844068] Control: 00c5387d  Table: 9e764008  DAC: 00=
000051 [    3.849811] Process swapper (pid: 1, stack limit =3D 0x2b33fe0f) =
[    3.855639] Stack: (0x9e477d70 to 0x9e478000) [    3.860004] 7d60:      =
                               9e5b4400

9ec1af90 fffffdfb 9e477d88

[    3.868179] 7d80: 8029ea9c 8029ae0c 9e5b4410 7e82968c 9e5b4418

9e5b4410 00000000 80b51d1c

[    3.876361] 7da0: 00000000 80b51d1c 00000000 00000000 9e477ddc

9e477dc0 804488f0 804eb6f8

[    3.884541] [.......]

00000000 00000000 00000000

[    4.023518] 7fe0: 00000000 00000000 00000000 00000000 00000013

00000000 00000000 00000000

[    4.031740] [<804eb7a0>] (iio_hwmon_probe) from [<804488f0>]

(platform_drv_probe+0x58/0xa8)

[    4.040118] [<804488f0>] (platform_drv_probe) from [<80446790>]

(driver_probe_device+0x2f8/0x474)

[    4.048999] [<80446790>] (driver_probe_device) from [<80446a0c>]

(__driver_attach+0x100/0x12c)

[    4.057620] [<80446a0c>] (__driver_attach) from [<804443a4>]

(bus_for_each_dev+0x80/0xc4)

[    4.065802] [<804443a4>] (bus_for_each_dev) from [<80445f14>]

(driver_attach+0x28/0x30)

[    4.073811] [<80445f14>] (driver_attach) from [<8044582c>]

(bus_add_driver+0x154/0x268)

[    4.081832] [<8044582c>] (bus_add_driver) from [<804475f8>]

(driver_register+0x84/0x118)

[    4.089933] [<804475f8>] (driver_register) from [<80448834>]

(__platform_driver_register+0x3c/0x50)

[    4.099003] [<80448834>] (__platform_driver_register) from [<80a26f24>] =
(iio_hwmon_driver_init+0x20/0x28) [    4.108593] [<80a26f24>] (iio_hwmon_dr=
iver_init) from [<80102e20>]

(do_one_initcall+0x4c/0x18c)

[    4.117323] [<80102e20>] (do_one_initcall) from [<80a0116c>]

(kernel_init_freeable+0x1a0/0x270)

[    4.126038] [<80a0116c>] (kernel_init_freeable) from [<806a7e6c>]

(kernel_init+0x18/0x128)

[    4.134315] [<806a7e6c>] (kernel_init) from [<801010e8>]

(ret_from_fork+0x14/0x2c)

[    4.141882] Exception stack(0x9e477fb0 to 0x9e477ff8) [    4.146937] 7fa=
0:                                     00000000

00000000 00000000 00000000

[    4.155112] 7fc0: 00000000 00000000 00000000 00000000 00000000

00000000 00000000 00000000

[    4.163282] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000 =
[    4.169903] Code: e0831083 e5860000 e1a01101 e0802001 (e7901001) [    4.=
176192] ---[ end trace 95853ce787f427d0 ]--- [    4.180830] Kernel panic - =
not syncing: Fatal exception



Thanks

Maheswari A

--_000_DB7PR02MB4393FA60E9C00C75DF8FDE0592BF0DB7PR02MB4393eurp_
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
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">Hi, <o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I have already enabled IIO-HWMON and ASPEED_ADC d=
rivers in linux configuration file.
<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Included &nbsp;changes in my platform DTS file. <=
o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp; iio-hwmon {<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;compatible =3D &quot;iio-hwm=
on&quot;;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; io-channels =3D &lt;&amp;adc=
 12&gt;;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
;<o:p></o:p></p>
<p class=3D"MsoPlainText">@@ -334,3 &#43;339,8 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&amp;adc<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;{<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =
=3D &quot;okay&quot;;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;};<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">We are getting the below Kernel panic after this =
IIO-HWMON driver changes in DTS file.
<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Other platform are using this iio-hwmon driver. P=
lease let us know if anyone faced this same issue.
<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 3.761575] =3D=3D=3D=3D 1. IIO=
_HWMON Probe =3D=3D=3D [&nbsp;&nbsp;&nbsp; 3.765477] Unable to handle kerne=
l paging request at virtual address fffffdfb [&nbsp;&nbsp;&nbsp; 3.772710] =
pgd =3D f5dd9e82 [&nbsp;&nbsp;&nbsp; 3.775426] [fffffdfb] *pgd=3D9effd861, =
*pte=3D00000000, *ppte=3D00000000 [&nbsp;&nbsp;&nbsp; 3.781715]
 Internal error: Oops: 37 [#1] ARM [&nbsp;&nbsp;&nbsp; 3.786073] Modules li=
nked in:<o:p></o:p></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 3.789148] CPU: 0 PID: 1 Comm:=
 swapper Not tainted 4.18.8 #1 [&nbsp;&nbsp;&nbsp; 3.794892] Hardware name:=
 Generic DT based system [&nbsp;&nbsp;&nbsp; 3.799706] PC is at iio_hwmon_p=
robe&#43;0xb4/0x3e4 [&nbsp;&nbsp;&nbsp; 3.804235] LR is at&nbsp;&nbsp; (nul=
l) [&nbsp;&nbsp;&nbsp; 3.807207] pc : [&lt;804eb7a0&gt;]&nbsp;&nbsp;&nbsp;
 lr : [&lt;00000000&gt;] psr: a0000013 [&nbsp;&nbsp;&nbsp; 3.813465] sp : 9=
e477d70&nbsp; ip : 9e5b4550&nbsp; fp : 9e477dbc [&nbsp;&nbsp;&nbsp; 3.81868=
1] r10: 00000000&nbsp; r9 : 00000000&nbsp; r8 : 80b51d1c [&nbsp;&nbsp;&nbsp=
; 3.823900] r7 : 9e5b4410&nbsp; r6 : 9e6f2290&nbsp; r5 : 00000000&nbsp; r4 =
: 9e5b4400 [&nbsp;&nbsp;&nbsp; 3.830418] r3 : 00000000&nbsp; r2
 : fffffdfb&nbsp; r1 : 00000000&nbsp; r0 : fffffdfb [&nbsp;&nbsp;&nbsp; 3.8=
36936] Flags: NzCv&nbsp; IRQs on&nbsp; FIQs on&nbsp; Mode SVC_32&nbsp; ISA =
ARM Segment none [&nbsp;&nbsp;&nbsp; 3.844068] Control: 00c5387d&nbsp; Tabl=
e: 9e764008&nbsp; DAC: 00000051 [&nbsp;&nbsp;&nbsp; 3.849811] Process swapp=
er (pid: 1, stack limit =3D 0x2b33fe0f) [&nbsp;&nbsp;&nbsp;
 3.855639] Stack: (0x9e477d70 to 0x9e478000) [&nbsp;&nbsp;&nbsp; 3.860004] =
7d60:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9e5=
b4400<o:p></o:p></p>
<p class=3D"MsoPlainText"><span lang=3D"DE">9ec1af90 fffffdfb 9e477d88<o:p>=
</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"DE">[&nbsp;&nbsp;&nbsp; 3.868179] 7=
d80: 8029ea9c 8029ae0c 9e5b4410 7e82968c 9e5b4418<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"DE">9e5b4410 00000000 80b51d1c<o:p>=
</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"DE">[&nbsp;&nbsp;&nbsp; 3.876361] 7=
da0: 00000000 80b51d1c 00000000 00000000 9e477ddc<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"DE">9e477dc0 804488f0 804eb6f8<o:p>=
</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"ES">[&nbsp;&nbsp;&nbsp; 3.884541] [=
&#8230;&#8230;.]</span><o:p></o:p></p>
<p class=3D"MsoPlainText">00000000 00000000 00000000<o:p></o:p></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.023518] 7fe0: 00000000 0000=
0000 00000000 00000000 00000013<o:p></o:p></p>
<p class=3D"MsoPlainText">00000000 00000000 00000000<o:p></o:p></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.031740] [&lt;804eb7a0&gt;] =
(iio_hwmon_probe) from [&lt;804488f0&gt;]<o:p></o:p></p>
<p class=3D"MsoPlainText"><span lang=3D"DE">(platform_drv_probe&#43;0x58/0x=
a8)<o:p></o:p></span></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.040118] [&lt;804488f0&gt;] =
(platform_drv_probe) from [&lt;80446790&gt;]<o:p></o:p></p>
<p class=3D"MsoPlainText">(driver_probe_device&#43;0x2f8/0x474)<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.048999] [&lt;80446790&gt;] =
(driver_probe_device) from [&lt;80446a0c&gt;]<o:p></o:p></p>
<p class=3D"MsoPlainText">(__driver_attach&#43;0x100/0x12c)<o:p></o:p></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.057620] [&lt;80446a0c&gt;] =
(__driver_attach) from [&lt;804443a4&gt;]<o:p></o:p></p>
<p class=3D"MsoPlainText">(bus_for_each_dev&#43;0x80/0xc4)<o:p></o:p></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.065802] [&lt;804443a4&gt;] =
(bus_for_each_dev) from [&lt;80445f14&gt;]<o:p></o:p></p>
<p class=3D"MsoPlainText">(driver_attach&#43;0x28/0x30)<o:p></o:p></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.073811] [&lt;80445f14&gt;] =
(driver_attach) from [&lt;8044582c&gt;]<o:p></o:p></p>
<p class=3D"MsoPlainText">(bus_add_driver&#43;0x154/0x268)<o:p></o:p></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.081832] [&lt;8044582c&gt;] =
(bus_add_driver) from [&lt;804475f8&gt;]<o:p></o:p></p>
<p class=3D"MsoPlainText">(driver_register&#43;0x84/0x118)<o:p></o:p></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.089933] [&lt;804475f8&gt;] =
(driver_register) from [&lt;80448834&gt;]<o:p></o:p></p>
<p class=3D"MsoPlainText"><span lang=3D"DE">(__platform_driver_register&#43=
;0x3c/0x50)<o:p></o:p></span></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.099003] [&lt;80448834&gt;] =
(__platform_driver_register) from [&lt;80a26f24&gt;] (iio_hwmon_driver_init=
&#43;0x20/0x28) [&nbsp;&nbsp;&nbsp; 4.108593] [&lt;80a26f24&gt;] (iio_hwmon=
_driver_init) from [&lt;80102e20&gt;]<o:p></o:p></p>
<p class=3D"MsoPlainText">(do_one_initcall&#43;0x4c/0x18c)<o:p></o:p></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.117323] [&lt;80102e20&gt;] =
(do_one_initcall) from [&lt;80a0116c&gt;]<o:p></o:p></p>
<p class=3D"MsoPlainText">(kernel_init_freeable&#43;0x1a0/0x270)<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.126038] [&lt;80a0116c&gt;] =
(kernel_init_freeable) from [&lt;806a7e6c&gt;]<o:p></o:p></p>
<p class=3D"MsoPlainText"><span lang=3D"DE">(kernel_init&#43;0x18/0x128)<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"DE">[&nbsp;&nbsp;&nbsp; 4.134315] [=
&lt;806a7e6c&gt;] (kernel_init) from [&lt;801010e8&gt;]<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText">(ret_from_fork&#43;0x14/0x2c)<o:p></o:p></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.141882] Exception stack(0x9=
e477fb0 to 0x9e477ff8) [&nbsp;&nbsp;&nbsp; 4.146937] 7fa0:&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00000000<o:p></o:p></p>
<p class=3D"MsoPlainText">00000000 00000000 00000000<o:p></o:p></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.155112] 7fc0: 00000000 0000=
0000 00000000 00000000 00000000<o:p></o:p></p>
<p class=3D"MsoPlainText">00000000 00000000 00000000<o:p></o:p></p>
<p class=3D"MsoPlainText">[&nbsp;&nbsp;&nbsp; 4.163282] 7fe0: 00000000 0000=
0000 00000000 00000000 00000013 00000000 [&nbsp;&nbsp;&nbsp; 4.169903] Code=
: e0831083 e5860000 e1a01101 e0802001 (e7901001) [&nbsp;&nbsp;&nbsp; 4.1761=
92] ---[ end trace 95853ce787f427d0 ]--- [&nbsp;&nbsp;&nbsp; 4.180830] Kern=
el panic - not syncing:
 Fatal exception<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Thanks <o:p></o:p></p>
<p class=3D"MsoPlainText">Maheswari A<o:p></o:p></p>
</div>
</body>
</html>

--_000_DB7PR02MB4393FA60E9C00C75DF8FDE0592BF0DB7PR02MB4393eurp_--
