Return-Path: <Balaji.B.Rao@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=balaji.b.rao@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="gDcmDRBp"; 
 dkim-atps=neutral
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zMsqP1fc8zF0hP
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jan 2018 05:26:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1516300001; x=1547836001;
 h=from:to:subject:date:message-id:mime-version;
 bh=Id0nXNJhNjIdIwSlT4RuWDoUSDtOcoU3MYCFNBe9R5c=;
 b=gDcmDRBpvagnWcHMV7Upg0UeXN6AhwfyqxlM5lIgT41XEdzE8i/ItStH
 VAFfTEPrkd88MJ6LuoOMrgJ50Fn/97rJzlOWNqz5GuzhdxK/quRcQA9tK
 Y1iAcnlGYGY6Y1th3m3RhzIsIEA1I+3m/XRxqXoWC13fgVfJCMLiiOR5T A=;
IronPort-PHdr: =?us-ascii?q?9a23=3A5hZ4uBDYacajxALv1y2aUyQJP3N1i/DPJgcQr6Af?=
 =?us-ascii?q?oPdwSPT7ocbcNUDSrc9gkEXOFd2Cra4c0qyO6+jJYi8p2d65qncMcZhBBVcuqP?=
 =?us-ascii?q?49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx7xKRR6?=
 =?us-ascii?q?JvjvGo7Vks+7y/2+94fcbglUmTaxe69+IAmrpgjNq8cahpdvJLwswRXTuHtIfO?=
 =?us-ascii?q?pWxWJsJV2Nmhv3+9m98p1+/SlOovwt78FPX7n0cKQ+VrxYES8pM3sp683xtBnM?=
 =?us-ascii?q?VhWA630BWWgLiBVIAgzF7BbnXpfttybxq+Rw1DWGMcDwULs5Xymp4aV2Rx/ykC?=
 =?us-ascii?q?oJNyA3/nzLisJ+j6xboQ6uqBNkzoHOfI2VNuBzcr/Bcd8EQ2dKQ8ZfVzZGAoO5?=
 =?us-ascii?q?d4YCCPcMMvxcr4bnpVsOrAGyCBS2CO3z0DBIgWT70rAk3OQlFQHKxhAvH9ULsH?=
 =?us-ascii?q?nNqtj+KakcUeewzKbSzDXDaetb2Tj86IjUchAhvOqDUahsfsrWzEkiER7OgFaI?=
 =?us-ascii?q?qYH9Pj6Y1f4Bv3aV4uZ+T+6jlm4qpg5rrjWuyMogkpTFip4PxlzZ+ih0zpw5Kc?=
 =?us-ascii?q?O3RUJle9KpEptduzmHO4Z5TM4uWXxktSc7x7EcpJK2cysHxI46yxPfavGKdZWD?=
 =?us-ascii?q?7Aj5W+aLOzh4gWpoeLe4hxmv70et0vb8Vsyo0FZSqSpFj8XMumgN1xPN7siHTe?=
 =?us-ascii?q?Nw8Vm62TmV2Q3f8PxLLl4wlarfMpIhxaMwloYIvkTEAy/2nlj5gLGMekUl4uio?=
 =?us-ascii?q?6+HnY7r8qpCAMI90jxnyMqUomsOhHeQ1KgkDUmuB9eii2rDv41f1TKhKg/A5iK?=
 =?us-ascii?q?XUsZ7XKdwepqGjAg9V1ogj6wy4DzejyNkVgGMILFZfdxKFjojlIUzDLOrkA/il?=
 =?us-ascii?q?hFShiypkyO7CPr3lGJnCMn/DkLL5cbZn90Fc0BYzzcxY559MDbEBOOz8Wknqu9?=
 =?us-ascii?q?zdEhA0KAi0w+f8CNVhzYMSQ2WPA66dMKzIqlCI/fgjI+6WZI8a637BLK1x4Obj?=
 =?us-ascii?q?i3U8kncZfLK1xt0QenSxFO8gJF+WNynCmNAERDMgtw43Tu2sohu4WDl7a3u2W+?=
 =?us-ascii?q?Q34TRtW9HuNpvKWo342O/J5yy8BJADPm0=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FlAQAp5mBahz+a6EReGwEBAQEDAQEBC?=
 =?us-ascii?q?QEBAYJKgU0QdC6cWJFHiT9DCiOESYUvQxQBAQEBAQEBAQEBAhABAQEKCwkIKC+?=
 =?us-ascii?q?COCINBEsqLwEBAQEBAQEBAQEBAQEBARoCDYERXgGBJgEEG4lHZBCrcIlNDCEFh?=
 =?us-ascii?q?lGKHAKCPYUwBZIukUEKiAWNPpQejUqJcIE8NoFzb4J9glMQDIFnjAmBFwEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2FlAQAp5mBahz+a6EReGwEBAQEDAQEBCQEBAYJKgU0QdC6?=
 =?us-ascii?q?cWJFHiT9DCiOESYUvQxQBAQEBAQEBAQEBAhABAQEKCwkIKC+COCINBEsqLwEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBARoCDYERXgGBJgEEG4lHZBCrcIlNDCEFhlGKHAKCPYUwBZI?=
 =?us-ascii?q?ukUEKiAWNPpQejUqJcIE8NoFzb4J9glMQDIFnjAmBFwEBAQ?=
Received: from esa3.dell-outbound2.iphmx.com ([68.232.154.63])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2018 12:26:36 -0600
From: <Balaji.B.Rao@dell.com>
Received: from ausxipps306.us.dell.com ([143.166.148.156])
 by esa3.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jan 2018 00:25:21 +0600
X-LoopCount0: from 10.166.132.23
X-IronPort-AV: E=Sophos;i="5.46,378,1511848800"; 
 d="scan'208,217";a="201228587"
X-DLP: DLP_GlobalPCIDSS
To: <openbmc@lists.ozlabs.org>
Subject: Kernel Panic Issue on Witherspoon
Thread-Topic: Kernel Panic Issue on Witherspoon
Thread-Index: AdOQiXTSNw0r1YkQS626WJKIEwMKTQ==
Date: Thu, 18 Jan 2018 18:26:33 +0000
Message-ID: <4148cf3295bb4a61b0cf7374574e4f4f@ausx13mpc109.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titusconfig: No Restrictions 04051212
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvIiwiaWQiOiJhN2M3ZjBiZC0zZTk2LTQwZTgtYmM1YS00NzllMDE2YTViZjUiLCJwcm9wcyI6W3sibiI6IkNsYXNzaWZpY2F0aW9uIiwidmFscyI6W3sidmFsdWUiOiJObyBSZXN0cmljdGlvbnMifV19LHsibiI6IlN1YmxhYmVscyIsInZhbHMiOltdfSx7Im4iOiJFeHRlcm5hbENvcnJlc3BvbmRlbmNlIiwidmFscyI6W119XX0sIlN1YmplY3RMYWJlbHMiOltdLCJUTUNWZXJzaW9uIjoiMTYuMi4xMS4wIiwiVHJ1c3RlZExhYmVsSGFzaCI6Im9YcUNVVlFrb2ljUWxVekxaczNIK0RCWDhDQ3RVZ05cL1ZmcWpad2NiV1ZvPSJ9
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: multipart/alternative;
 boundary="_000_4148cf3295bb4a61b0cf7374574e4f4fausx13mpc109AMERDELLCOM_"
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jan 2018 18:26:42 -0000

--_000_4148cf3295bb4a61b0cf7374574e4f4fausx13mpc109AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Folks,

I'm seeing kernel panic on witherspoon when I do a build locally. I traced =
the signature to the issue shown below,

https://github.com/openbmc/openbmc/issues/2474

But I don't see any recommendation to get over it. Any help / pointer is de=
eply appreciated. The kernel panic that I see is as follows,

[    5.420000] fe00            2067 ubiblock0_1
[    5.420000]  (driver?)
[    5.420000] No filesystem could mount root, tried:
[    5.420000]  squashfs
[    5.420000]
[    5.420000] Kernel panic - not syncing: VFS: Unable to mount root fs on =
unknown-block(254,0)
[    5.420000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.10.17-72b52ebab574=
eaf0bcd2256ae16a25976a37c407 #1
[    5.420000] Hardware name: ASpeed SoC
[    5.420000] [<80010080>] (unwind_backtrace) from [<8000d934>] (show_stac=
k+0x20/0x24)
[    5.420000] [<8000d934>] (show_stack) from [<801dbf2c>] (dump_stack+0x20=
/0x28)
[    5.420000] [<801dbf2c>] (dump_stack) from [<800a4a40>] (panic+0xc8/0x26=
4)
[    5.420000] [<800a4a40>] (panic) from [<8059056c>] (mount_block_root+0x2=
88/0x300)
[    5.420000] [<8059056c>] (mount_block_root) from [<80590740>] (mount_roo=
t+0x60/0x7c)
[    5.420000] [<80590740>] (mount_root) from [<805908c8>] (prepare_namespa=
ce+0x16c/0x1d0)
[    5.420000] [<805908c8>] (prepare_namespace) from [<805900b0>] (kernel_i=
nit_freeable+0x184/0x1cc)
[    5.420000] [<805900b0>] (kernel_init_freeable) from [<803fe480>] (kerne=
l_init+0x18/0x104)
[    5.420000] [<803fe480>] (kernel_init) from [<8000a5e8>] (ret_from_fork+=
0x14/0x2c)

Thanks
balaji


--_000_4148cf3295bb4a61b0cf7374574e4f4fausx13mpc109AMERDELLCOM_
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
<p class=3D"MsoNormal">Folks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m seeing kernel panic on witherspoon when I =
do a build locally. I traced the signature to the issue shown below,
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">https://github.com/openbmc/openbmc/issues/2474<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But I don&#8217;t see any recommendation to get over=
 it. Any help / pointer is deeply appreciated. The kernel panic that I see =
is as follows,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000] fe00&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2067 ubiblock0_1<o:p></o:p=
></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000]&nbsp; (driver?)<o:p></=
o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000] No filesystem could mo=
unt root, tried:<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000]&nbsp; squashfs<o:p></o=
:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000]<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000] Kernel panic - not syn=
cing: VFS: Unable to mount root fs on unknown-block(254,0)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000] CPU: 0 PID: 1 Comm: sw=
apper Not tainted 4.10.17-72b52ebab574eaf0bcd2256ae16a25976a37c407 #1<o:p><=
/o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000] Hardware name: ASpeed =
SoC<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000] [&lt;80010080&gt;] (un=
wind_backtrace) from [&lt;8000d934&gt;] (show_stack&#43;0x20/0x24)<o:p></o:=
p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000] [&lt;8000d934&gt;] (sh=
ow_stack) from [&lt;801dbf2c&gt;] (dump_stack&#43;0x20/0x28)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000] [&lt;801dbf2c&gt;] (du=
mp_stack) from [&lt;800a4a40&gt;] (panic&#43;0xc8/0x264)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000] [&lt;800a4a40&gt;] (pa=
nic) from [&lt;8059056c&gt;] (mount_block_root&#43;0x288/0x300)<o:p></o:p><=
/p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000] [&lt;8059056c&gt;] (mo=
unt_block_root) from [&lt;80590740&gt;] (mount_root&#43;0x60/0x7c)<o:p></o:=
p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000] [&lt;80590740&gt;] (mo=
unt_root) from [&lt;805908c8&gt;] (prepare_namespace&#43;0x16c/0x1d0)<o:p><=
/o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000] [&lt;805908c8&gt;] (pr=
epare_namespace) from [&lt;805900b0&gt;] (kernel_init_freeable&#43;0x184/0x=
1cc)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000] [&lt;805900b0&gt;] (ke=
rnel_init_freeable) from [&lt;803fe480&gt;] (kernel_init&#43;0x18/0x104)<o:=
p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 5.420000] [&lt;803fe480&gt;] (ke=
rnel_init) from [&lt;8000a5e8&gt;] (ret_from_fork&#43;0x14/0x2c)<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">balaji<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_4148cf3295bb4a61b0cf7374574e4f4fausx13mpc109AMERDELLCOM_--
