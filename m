Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wXtq3QC9zF3bw
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 18:24:49 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2018 23:24:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,235,1539673200"; 
 d="scan'208,217";a="108421159"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.0])
 by orsmga001.jf.intel.com with ESMTP; 14 Nov 2018 23:24:45 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: <openbmc@lists.ozlabs.org>
Cc: "Li, Yong B" <yong.b.li@intel.com>
Subject: qemu does not work for the latest image?
Date: Thu, 15 Nov 2018 15:24:40 +0800
Message-ID: <000201d47cb4$495ee3e0$dc1caba0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0003_01D47CF7.57838370"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdR8s/uqUaGfk68LTvK3NyD7nMAi/w==
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWY5OGM2ODUtN2VmNy00ZjVjLWI0NjItZDk2NTEzZGE5ODlkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZVMzdFFwd2NjZitQRGE5amp0d3dDcjh2WU5vek5KeUVlaThEQmdJd0QyT2RGNUVIT1wvejRud0IyN3JSQ3ZVYWsifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: request-justification,no-action
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
X-List-Received-Date: Thu, 15 Nov 2018 07:24:52 -0000

This is a multipart message in MIME format.

------=_NextPart_000_0003_01D47CF7.57838370
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

 

Previously I can use qemu to test these built images, but it does not work
now and get the below error messages:

 

Just want to know if there is any command/options changes? Or it does not
support now?

 

qemu-system-arm -m 256 -M witherspoon-bmc -nographic -drive
file=tmp/deploy/images/witherspoon/obmc-phosphor-image-poon.ubi.mtd,format=r
aw,if=mtd

qemu-system-arm: Aspeed iBT has no chardev backend

 

 

U-Boot 2016.07 (Nov 15 2018 - 06:18:37 +0000)

 

       Watchdog enabled

DRAM:  240 MiB

Flash: 32 MiB

*** Warning - bad CRC, using default environment

 

In:    serial

Out:   serial

Err:   serial

Net:   aspeednic#0

Error: aspeednic#0 address not set.

 

Hit any key to stop autoboot:  0

ubi0: attaching mtd1

ubi0: scanning is finished

UBI init error 12

Error, no UBI device/partition selected!

Wrong Image Format for bootm command

ERROR: can't get kernel image!

 

 

Thanks,

Yong


------=_NextPart_000_0003_01D47CF7.57838370
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
class=3DMsoNormal>Hi All,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Previously I =
can use qemu to test these built images, but it does not work now and =
get the below error messages:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Just want to =
know if there is any command/options changes? Or it does not support =
now?<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>qemu-system-arm -m 256 -M witherspoon-bmc -nographic =
-drive =
file=3Dtmp/deploy/images/witherspoon/obmc-phosphor-image-poon.ubi.mtd,for=
mat=3Draw,if=3Dmtd<o:p></o:p></p><p class=3DMsoNormal>qemu-system-arm: =
Aspeed iBT has no chardev backend<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>U-Boot =
2016.07 (Nov 15 2018 - 06:18:37 +0000)<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Watchdog =
enabled<o:p></o:p></p><p class=3DMsoNormal>DRAM:&nbsp; 240 =
MiB<o:p></o:p></p><p class=3DMsoNormal>Flash: 32 MiB<o:p></o:p></p><p =
class=3DMsoNormal>*** Warning - bad CRC, using default =
environment<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>In:&nbsp;&nbsp;&nbsp; serial<o:p></o:p></p><p =
class=3DMsoNormal>Out:&nbsp;&nbsp; serial<o:p></o:p></p><p =
class=3DMsoNormal>Err:&nbsp;&nbsp; serial<o:p></o:p></p><p =
class=3DMsoNormal>Net:&nbsp;&nbsp; aspeednic#0<o:p></o:p></p><p =
class=3DMsoNormal>Error: aspeednic#0 address not set.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Hit any key =
to stop autoboot:&nbsp; 0<o:p></o:p></p><p class=3DMsoNormal>ubi0: =
attaching mtd1<o:p></o:p></p><p class=3DMsoNormal>ubi0: scanning is =
finished<o:p></o:p></p><p class=3DMsoNormal>UBI init error =
12<o:p></o:p></p><p class=3DMsoNormal>Error, no UBI device/partition =
selected!<o:p></o:p></p><p class=3DMsoNormal>Wrong Image Format for =
bootm command<o:p></o:p></p><p class=3DMsoNormal>ERROR: can't get kernel =
image!<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>Yong<o:p></o:p></p></div></body></html>
------=_NextPart_000_0003_01D47CF7.57838370--
