Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z5Jy92MswzDrW5
 for <openbmc@lists.ozlabs.org>; Tue, 26 Dec 2017 12:57:04 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Dec 2017 17:57:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,457,1508828400"; d="scan'208,217";a="14551479"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.73])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Dec 2017 17:57:00 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: <openbmc@lists.ozlabs.org>
Subject: Kernel oops error
Date: Tue, 26 Dec 2017 09:56:59 +0800
Message-ID: <000501d37dec$d18b5680$74a20380$@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0006_01D37E2F.DFAFF610"
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdN97LyH5dguzZPoQFKKZ60bAwrdrw==
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjkwMGZhOWMtYTE3Yy00MWE2LWFmNmMtYzA4MGMzMDA3OWZmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IkVaUEFZWXVzajJ0emFMSitBUmJVeU1veDU4OW9pYmRGOXc3QlNBM0RCQmM9In0=
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
X-List-Received-Date: Tue, 26 Dec 2017 01:57:06 -0000

This is a multipart message in MIME format.

------=_NextPart_000_0006_01D37E2F.DFAFF610
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

Sometimes I received the below error message when reboot the ast2500(With
the latest kernel version). Does anyone have the similar issue? How to
narrow down such problem? 

 

[  472.770000] Unable to handle kernel NULL pointer dereference at virtual
address 00000000

[  472.770000] pgd = 80004000

[  472.770000] [00000000] *pgd=00000000

[  472.770000] Internal error: Oops: 80000007 [#1] ARM

[  472.770000] CPU: 0 PID: 946 Comm: klogd Not tainted
4.10.17-7422acad49264653b7895c252806a8074e1029c7 #2

[  472.770000] Hardware name: ASpeed SoC

[  472.770000] task: 9d1cb000 task.stack: 9d40a000

[  472.770000] PC is at 0x0

[  472.770000] LR is at __wake_up_common+0x60/0x9c

[  472.770000] pc : [<00000000>]    lr : [<80040e0c>]    psr: 20000093

[  472.770000] sp : 9d40bd00  ip : 9d0bfff4  fp : 9d40bd34

[  472.770000] r10: 00000001  r9 : 00000000  r8 : 00000000

[  472.770000] r7 : 9d4ab8e0  r6 : 00000000  r5 : 00000000  r4 : fffffff4

[  472.770000] r3 : 00000000  r2 : 00000000  r1 : 00000001  r0 : 9d0bfff4

[  472.770000] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment
user

[  472.770000] Control: 00c5387d  Table: 9cb28008  DAC: 00000055

[  472.770000] Process klogd (pid: 946, stack limit = 0x9d40a188)

[  472.770000] Stack: (0x9d40bd00 to 0x9d40c000)

[  472.770000] bd00: 800e01d8 00000000 9d40bd2c 20000013 9d1a8900 00000001
9d1a8990 9d40bd68

[  472.770000] bd20: 9d1a8990 00000008 9d40bd54 9d40bd38 800410b8 80040db8
00000000 9d40bd48

[  472.770000] bd40: 800410b8 9d1a86c0 9d40bd64 9d40bd58 80337934 80041094
9d40bd94 9d40bd68

[  472.770000] bd60: 803d0394 80337904 00000000 00000000 9e37a2e0 9e37a300
9e3ab048 9e41e570

[  472.770000] bd80: 00000000 9e37a300 9d40bdac 9d40bd98 803d0438 803d01d0
9e37a2e0 9e37a300

[  472.770000] bda0: 9d40bdc4 9d40bdb0 80335388 803d0418 9c9facc0 9e37a300
9d40bdd4 9d40bdc8

[  472.770000] bdc0: 80335418 80335368 9d40be14 9d40bdd8 800e810c 80335408
00000000 00000000

[  472.770000] bde0: 9e4bb980 9c9facc8 9d12d040 9d1cb2e0 9d1cb000 00000000
80659e80 9c9faa40

[  472.770000] be00: 9d12d074 00010600 9d40be24 9d40be18 800e82a4 800e8084
9d40be4c 9d40be28

[  472.770000] be20: 80031f2c 800e8298 9d1cb000 00000000 ffffe000 9d12d040
00000000 9d12d074

[  472.770000] be40: 9d40be6c 9d40be50 8001b398 80031ebc 0000000f 00000000
9d40beac 0000000f

[  472.770000] be60: 9d40be84 9d40be70 8001ba9c 8001b124 00000000 4b24ca30
9d40bec4 9d40be88

[  472.770000] be80: 800254f0 8001ba5c 9d40bec8 9d1f4ac0 9ca2f540 9d40a000
9d40a000 9d40bfb0

[  472.770000] bea0: 4b24ca30 9d40bec8 00000000 4b24ca34 9d40a000 00000000
9d40bf8c 9d40bec8

[  472.770000] bec0: 8000ccf0 800252e8 9d40bef4 9d40bed8 80024954 80024870
9d40a000 0000000f

[  472.770000] bee0: 00000000 fffffffa 000003b2 00000000 00000000 00000000
00000000 00000000

[  472.770000] bf00: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000

[  472.770000] bf20: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000

[  472.770000] bf40: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 80025a30

[  472.770000] bf60: 00000000 9d40a000 8000a6e4 9d40bfb0 000000af 8000a6e4
9d40a000 00000000

[  472.770000] bf80: 9d40bfac 9d40bf90 8000d1d4 8000cc28 00000000 7ed07b90
000aed68 000000af

[  472.770000] bfa0: 00000000 9d40bfb0 8000a58c 8000d134 00000000 7ed07b90
00000000 00000008

[  472.770000] bfc0: 00000000 7ed07b90 000aed68 000000af 0000000a 00000000
000b0d70 0000000f

[  472.770000] bfe0: 00000020 7ed07b90 ffffffff 4b24ca34 00000010 00000002
00000000 00000000

[  472.770000] [<80040e0c>] (__wake_up_common) from [<800410b8>]
(__wake_up+0x30/0x3c)

[  472.770000] [<800410b8>] (__wake_up) from [<80337934>]
(sock_def_wakeup+0x3c/0x40)

[  472.770000] [<80337934>] (sock_def_wakeup) from [<803d0394>]
(unix_release_sock+0x1d0/0x248) // 0x803378f8+0x1d0=0x80337AC8

[  472.770000] [<803d0394>] (unix_release_sock) from [<803d0438>]
(unix_release+0x2c/0x3c)

[  472.770000] [<803d0438>] (unix_release) from [<80335388>]
(sock_release+0x2c/0xa0)

[  472.770000] [<80335388>] (sock_release) from [<80335418>]
(sock_close+0x1c/0x24)

[  472.770000] [<80335418>] (sock_close) from [<800e810c>]
(__fput+0x94/0x1c4)

[  472.770000] [<800e810c>] (__fput) from [<800e82a4>] (____fput+0x18/0x1c)

[  472.770000] [<800e82a4>] (____fput) from [<80031f2c>]
(task_work_run+0x7c/0xa0)

[  472.770000] [<80031f2c>] (task_work_run) from [<8001b398>]
(do_exit+0x280/0x8e8)

[  472.770000] [<8001b398>] (do_exit) from [<8001ba9c>]
(do_group_exit+0x4c/0xb4)

[  472.770000] [<8001ba9c>] (do_group_exit) from [<800254f0>]
(get_signal+0x214/0x580)

[  472.770000] [<800254f0>] (get_signal) from [<8000ccf0>]
(do_signal+0xd4/0x3dc)

[  472.770000] [<8000ccf0>] (do_signal) from [<8000d1d4>]
(do_work_pending+0xac/0xbc)

[  472.770000] [<8000d1d4>] (do_work_pending) from [<8000a58c>]
(slow_work_pending+0xc/0x20)

[  472.770000] Code: bad PC value

 

Thanks,

Yong

 


------=_NextPart_000_0006_01D37E2F.DFAFF610
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
span.EmailStyle18
	{mso-style-type:personal;
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Hi,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Sometimes I =
received the below error message when reboot the ast2500(With the latest =
kernel version). Does anyone have the similar issue? How to narrow down =
such problem? <o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>[&nbsp; =
472.770000] Unable to handle kernel NULL pointer dereference at virtual =
address 00000000<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] =
pgd =3D 80004000<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] =
[00000000] *pgd=3D00000000<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; =
472.770000] Internal error: Oops: 80000007 [#1] ARM<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] CPU: 0 PID: 946 Comm: klogd Not =
tainted 4.10.17-7422acad49264653b7895c252806a8074e1029c7 =
#2<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] Hardware name: =
ASpeed SoC<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] task: =
9d1cb000 task.stack: 9d40a000<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; =
472.770000] PC is at 0x0<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; =
472.770000] LR is at __wake_up_common+0x60/0x9c<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] pc : =
[&lt;00000000&gt;]&nbsp;&nbsp;&nbsp; lr : =
[&lt;80040e0c&gt;]&nbsp;&nbsp;&nbsp; psr: 20000093<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] sp : 9d40bd00&nbsp; ip : =
9d0bfff4&nbsp; fp : 9d40bd34<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; =
472.770000] r10: 00000001&nbsp; r9 : 00000000&nbsp; r8 : =
00000000<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] r7 : =
9d4ab8e0&nbsp; r6 : 00000000&nbsp; r5 : 00000000&nbsp; r4 : =
fffffff4<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] r3 : =
00000000&nbsp; r2 : 00000000&nbsp; r1 : 00000001&nbsp; r0 : =
9d0bfff4<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] Flags: =
nzCv&nbsp; IRQs off&nbsp; FIQs on&nbsp; Mode SVC_32&nbsp; ISA ARM&nbsp; =
Segment user<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] =
Control: 00c5387d&nbsp; Table: 9cb28008&nbsp; DAC: =
00000055<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] Process =
klogd (pid: 946, stack limit =3D 0x9d40a188)<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] Stack: (0x9d40bd00 to =
0x9d40c000)<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bd00: =
800e01d8 00000000 9d40bd2c 20000013 9d1a8900 00000001 9d1a8990 =
9d40bd68<o:p></o:p></p><p class=3DMsoNormal>[ &nbsp;472.770000] bd20: =
9d1a8990 00000008 9d40bd54 9d40bd38 800410b8 80040db8 00000000 =
9d40bd48<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bd40: =
800410b8 9d1a86c0 9d40bd64 9d40bd58 80337934 80041094 9d40bd94 =
9d40bd68<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bd60: =
803d0394 80337904 00000000 00000000 9e37a2e0 9e37a300 9e3ab048 =
9e41e570<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bd80: =
00000000 9e37a300 9d40bdac 9d40bd98 803d0438 803d01d0 9e37a2e0 =
9e37a300<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bda0: =
9d40bdc4 9d40bdb0 80335388 803d0418 9c9facc0 9e37a300 9d40bdd4 =
9d40bdc8<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bdc0: =
80335418 80335368 9d40be14 9d40bdd8 800e810c 80335408 00000000 =
00000000<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bde0: =
9e4bb980 9c9facc8 9d12d040 9d1cb2e0 9d1cb000 00000000 80659e80 =
9c9faa40<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] be00: =
9d12d074 00010600 9d40be24 9d40be18 800e82a4 800e8084 9d40be4c =
9d40be28<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] be20: =
80031f2c 800e8298 9d1cb000 00000000 ffffe000 9d12d040 00000000 =
9d12d074<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] be40: =
9d40be6c 9d40be50 8001b398 80031ebc 0000000f 00000000 9d40beac =
0000000f<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] be60: =
9d40be84 9d40be70 8001ba9c 8001b124 00000000 4b24ca30 9d40bec4 =
9d40be88<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] be80: =
800254f0 8001ba5c 9d40bec8 9d1f4ac0 9ca2f540 9d40a000 9d40a000 =
9d40bfb0<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bea0: =
4b24ca30 9d40bec8 00000000 4b24ca34 9d40a000 00000000 9d40bf8c =
9d40bec8<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bec0: =
8000ccf0 800252e8 9d40bef4 9d40bed8 80024954 80024870 9d40a000 =
0000000f<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bee0: =
00000000 fffffffa 000003b2 00000000 00000000 00000000 00000000 =
00000000<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bf00: =
00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bf20: =
00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bf40: =
00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
80025a30<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bf60: =
00000000 9d40a000 8000a6e4 9d40bfb0 000000af 8000a6e4 9d40a000 =
00000000<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bf80: =
9d40bfac 9d40bf90 8000d1d4 8000cc28 00000000 7ed07b90 000aed68 =
000000af<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bfa0: =
00000000 9d40bfb0 8000a58c 8000d134 00000000 7ed07b90 00000000 =
00000008<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bfc0: =
00000000 7ed07b90 000aed68 000000af 0000000a 00000000 000b0d70 =
0000000f<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] bfe0: =
00000020 7ed07b90 ffffffff 4b24ca34 00000010 00000002 00000000 =
00000000<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; 472.770000] =
[&lt;80040e0c&gt;] (__wake_up_common) from [&lt;800410b8&gt;] =
(__wake_up+0x30/0x3c)<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; =
472.770000] [&lt;800410b8&gt;] (__wake_up) from [&lt;80337934&gt;] =
(sock_def_wakeup+0x3c/0x40)<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; =
472.770000] [&lt;80337934&gt;] (sock_def_wakeup) from [&lt;803d0394&gt;] =
(unix_release_sock+0x1d0/0x248) // =
0x803378f8+0x1d0=3D0x80337AC8<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; =
472.770000] [&lt;803d0394&gt;] (unix_release_sock) from =
[&lt;803d0438&gt;] (unix_release+0x2c/0x3c)<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] [&lt;803d0438&gt;] (unix_release) =
from [&lt;80335388&gt;] (sock_release+0x2c/0xa0)<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] [&lt;80335388&gt;] (sock_release) =
from [&lt;80335418&gt;] (sock_close+0x1c/0x24)<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] [&lt;80335418&gt;] (sock_close) =
from [&lt;800e810c&gt;] (__fput+0x94/0x1c4)<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] [&lt;800e810c&gt;] (__fput) from =
[&lt;800e82a4&gt;] (____fput+0x18/0x1c)<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] [&lt;800e82a4&gt;] (____fput) from =
[&lt;80031f2c&gt;] (task_work_run+0x7c/0xa0)<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] [&lt;80031f2c&gt;] (task_work_run) =
from [&lt;8001b398&gt;] (do_exit+0x280/0x8e8)<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] [&lt;8001b398&gt;] (do_exit) from =
[&lt;8001ba9c&gt;] (do_group_exit+0x4c/0xb4)<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] [&lt;8001ba9c&gt;] (do_group_exit) =
from [&lt;800254f0&gt;] (get_signal+0x214/0x580)<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] [&lt;800254f0&gt;] (get_signal) =
from [&lt;8000ccf0&gt;] (do_signal+0xd4/0x3dc)<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] [&lt;8000ccf0&gt;] (do_signal) =
from [&lt;8000d1d4&gt;] (do_work_pending+0xac/0xbc)<o:p></o:p></p><p =
class=3DMsoNormal>[&nbsp; 472.770000] [&lt;8000d1d4&gt;] =
(do_work_pending) from [&lt;8000a58c&gt;] =
(slow_work_pending+0xc/0x20)<o:p></o:p></p><p class=3DMsoNormal>[&nbsp; =
472.770000] Code: bad PC value<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>Yong<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_0006_01D37E2F.DFAFF610--
