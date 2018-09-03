Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 423hpX2ShLzF38x
 for <openbmc@lists.ozlabs.org>; Mon,  3 Sep 2018 17:45:38 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2018 00:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,324,1531810800"; d="scan'208,217";a="82511333"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.71])
 by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2018 00:45:35 -0700
From: "Yong Li" <yong.b.li@linux.intel.com>
To: <openbmc@lists.ozlabs.org>
Subject: watchdog error during host power on
Date: Mon, 3 Sep 2018 15:45:34 +0800
Message-ID: <000001d4435a$19767be0$4c6373a0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0001_01D4439D.279A7F30"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdRDWf2YcVWItDVMQwOY2Dxcz8YGHA==
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTYxNDYxOTItYTBiMy00YzI1LTllMWUtODA2OWJlOTkxZjA0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVzVUZHNyd3V3dG5CeU1Gd0VHSW5ySTFGXC82NW5rNjhwVU5oXC9JVndoRVVQaWpOczFOTVpDU0UxSjZHUVRDbnl6In0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2018 07:45:41 -0000

This is a multipart message in MIME format.

------=_NextPart_000_0001_01D4439D.279A7F30
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

 

I received the below error message during host power on, and the watchdog
service does not started:

obmc-enable-host-watchdog[1956]: Error finding
'/xyz/openbmc_project/watchdog/host0' service: No such file or directory

 

It seems that the below services need to be serialized. 

obmc-enable-host-watchdog@0.service

phosphor-watchdog@poweron.service

 

phosphor-watchdog@poweron.service <mailto:phosphor-watchdog@poweron.service>
needs to be start firstly, then obmc-enable-host-watchdog@0.service.

 

I found below items in obmc-enable-host-watchdog@0.service
<mailto:obmc-enable-host-watchdog@0.service> , but they cannot fix the issue

Wants=mapper-wait@-xyz-openbmc_project-watchdog-host%i.service

After=mapper-wait@-xyz-openbmc_project-watchdog-host%i.service
<mailto:After=mapper-wait@-xyz-openbmc_project-watchdog-host%25i.service> 

 

Any suggestions/comments?

 

Thanks,

Yong 


------=_NextPart_000_0001_01D4439D.279A7F30
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
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I received =
the below error message during host power on, and the watchdog service =
does not started:<o:p></o:p></p><p =
class=3DMsoNormal>obmc-enable-host-watchdog[1956]: Error finding =
'/xyz/openbmc_project/watchdog/host0' service: No such file or =
directory<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>It seems that the below services need to be =
serialized. <o:p></o:p></p><p =
class=3DMsoNormal>obmc-enable-host-watchdog@0.service<o:p></o:p></p><p =
class=3DMsoNormal>phosphor-watchdog@poweron.service<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><a =
href=3D"mailto:phosphor-watchdog@poweron.service">phosphor-watchdog@power=
on.service</a> needs to be start firstly, then =
obmc-enable-host-watchdog@0.service.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I found =
below items in <a =
href=3D"mailto:obmc-enable-host-watchdog@0.service">obmc-enable-host-watc=
hdog@0.service</a>, but they cannot fix the issue<o:p></o:p></p><p =
class=3DMsoNormal>Wants=3Dmapper-wait@-xyz-openbmc_project-watchdog-host%=
i.service<o:p></o:p></p><p class=3DMsoNormal><a =
href=3D"mailto:After=3Dmapper-wait@-xyz-openbmc_project-watchdog-host%25i=
.service">After=3Dmapper-wait@-xyz-openbmc_project-watchdog-host%i.servic=
e</a><o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Any suggestions/comments?<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p class=3DMsoNormal>Yong =
<o:p></o:p></p></div></body></html>
------=_NextPart_000_0001_01D4439D.279A7F30--
