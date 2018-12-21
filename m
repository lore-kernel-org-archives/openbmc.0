Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43LV9P3vddzDqtR
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 11:38:29 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2018 16:38:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,379,1539673200"; 
 d="scan'208,217";a="109006963"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.10])
 by fmsmga007.fm.intel.com with ESMTP; 20 Dec 2018 16:38:25 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: <venture@google.com>,
	<openbmc@lists.ozlabs.org>
Cc: "Li, Yong B" <yong.b.li@intel.com>
Subject: journal log messages are missing with latest version
Date: Fri, 21 Dec 2018 08:38:24 +0800
Message-ID: <000601d498c5$7c4c2010$74e46030$@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0007_01D49908.8A70E6B0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdSYxXmiiblQVz+yQrqj86VrunkBvg==
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjA1Y2M5ODctZTViMC00YjM2LWJiYzMtNGQ0MzBjNDczYTAxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidEVsZFgyWkdjZDl3OXk4a3Bvd05vSjVCWUFmWUpkVzlQK0RHY2lGYmhaQjJTNW1LYkR0eFFrcWR3Z1pVZ3lvMyJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
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
X-List-Received-Date: Fri, 21 Dec 2018 00:38:34 -0000

This is a multipart message in MIME format.

------=_NextPart_000_0007_01D49908.8A70E6B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

 

Hi Patrick,

 

I encountered a problem after upgrade to the latest opnebmc version:

 

These log messages in ipmid are missing with the "journalctl -f".

 

My tests shows that the blow change is related, after I revert it, I can get
these log messages.

 

Did you meet such issue, or any suggestions/comments to narrow down this
issue?

https://github.com/openbmc/phosphor-logging/commit/59a6b1f27e83066baa6f3711c
88d6a3b9a5c4d49

add sdjournal interface to inject tests

 

Thanks,

Yong


------=_NextPart_000_0007_01D49908.8A70E6B0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
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
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
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
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Hi =
Patrick,<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>I encountered a problem after upgrade to the latest =
opnebmc version:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>These log =
messages in ipmid are missing with the &#8220;journalctl =
-f&#8221;.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>My tests shows that the blow change is related, after =
I revert it, I can get these log messages.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Did you meet =
such issue, or any suggestions/comments to narrow down this =
issue?<o:p></o:p></p><p class=3DMsoNormal> <o:p></o:p></p><p =
class=3DMsoNormal><a =
href=3D"https://github.com/openbmc/phosphor-logging/commit/59a6b1f27e8306=
6baa6f3711c88d6a3b9a5c4d49">https://github.com/openbmc/phosphor-logging/c=
ommit/59a6b1f27e83066baa6f3711c88d6a3b9a5c4d49</a><o:p></o:p></p><p =
class=3DMsoNormal><b><span style=3D'font-size:13.5pt;font-family:"Segoe =
UI",sans-serif;color:#05264C;background:#EAF5FF'>add sdjournal interface =
to inject tests<o:p></o:p></span></b></p><p class=3DMsoNormal><b><span =
style=3D'font-size:13.5pt;font-family:"Segoe =
UI",sans-serif;color:#05264C;background:#EAF5FF'><o:p>&nbsp;</o:p></span>=
</b></p><p class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>Yong<o:p></o:p></p></div></body></html>
------=_NextPart_000_0007_01D49908.8A70E6B0--
