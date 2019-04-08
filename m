Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.13; helo=cpsmtpb-ews08.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="CIPDc7IU"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews08.kpnxchange.com (cpsmtpb-ews08.kpnxchange.com
 [213.75.39.13])
 by lists.ozlabs.org (Postfix) with ESMTP id 44dBTT2WjFzDqFZ
 for <openbmc@lists.ozlabs.org>; Mon,  8 Apr 2019 23:43:37 +1000 (AEST)
Received: from cpsps-ews01.kpnxchange.com ([10.94.84.168]) by
 cpsmtpb-ews08.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Mon, 8 Apr 2019 15:43:31 +0200
X-Brand: +YTO/YbK+g==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=FsrUAFjq c=1 sm=1 tr=0 cx=a_idp_e
 a=YnLMpE5S06+Zisl5ga1zfg==:117 a=YnLMpE5S06+Zisl5ga1zfg==:17
 a=eIHzyqS2sMcA:10 a=xqWC_Br6kY4A:10 a=oexKYjalfGEA:10
 a=cSfiejd8TR4Vru4FoyIA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8
 a=SSmOFEACAAAA:8 a=aMOTY0kcs8ohME4JZqMA:9 a=gKO2Hq4RSVkA:10
 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.46]) by cpsps-ews01.kpnxchange.com
 over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 8 Apr 2019 15:43:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=mime-version:content-type:message-id:date:subject:to:from;
 bh=vqY99w41UBNzH19oQzfdr13HwxtV2xMtnFbEbIk4FtQ=;
 b=CIPDc7IU9+/gmpY64l/BqqowqFZxA17Sd4H3Z/fnjdv9JWdK6rfW6afzbV9VCY7uaw9J4FZh899tb
 8Ym2M7Uma1mdIxMD5l6P5p22OwoCiC/eiUJICaFAaXHv5DgTfYKIzIdBTZrWcvmqPWToaoIvMPcGjf
 62pedYAS0sLXhcOA=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
 by smtp.kpnmail.nl (Halon) with ESMTPS
 id 4c87b8a3-5a04-11e9-8484-005056ab7584;
 Mon, 08 Apr 2019 15:43:32 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Mon, 8 Apr
 2019 15:42:59 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Mon, 8 Apr 2019 15:42:41 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: using phosphor-dbus-monitor
Thread-Topic: using phosphor-dbus-monitor
Thread-Index: AdTuEGrG+gJJ+lgAS6eE4IA4ANXSuA==
Date: Mon, 8 Apr 2019 13:42:40 +0000
Message-ID: <8daf9ac9deee4bc0808a55733681d67e@Eltsrv03.Eltan.local>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
Content-Type: multipart/alternative;
 boundary="_000_8daf9ac9deee4bc0808a55733681d67eEltsrv03Eltanlocal_"
MIME-Version: 1.0
X-OriginalArrivalTime: 08 Apr 2019 13:43:32.0564 (UTC)
 FILETIME=[0E7EE940:01D4EE11]
X-RcptDomain: lists.ozlabs.org
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
X-List-Received-Date: Mon, 08 Apr 2019 13:43:44 -0000

--_000_8daf9ac9deee4bc0808a55733681d67eEltsrv03Eltanlocal_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to use phosphor-dbus-monitor to create logging of sensor except=
ions like a Critical state on a specific sensor.

I am able to create a solution with a building yaml but at the end it doesn=
't deliver me the desired result.

As there are very limited examples (on a few in the witherspoon) it is very=
 hard to figure out where the mistake is.

Are there any tools that can be used to make this easier?

Additionally is this the correct method to achieve this goal or should I us=
e something else to define conditions for logging?

Best regards,

Wim Vervoorn


--_000_8daf9ac9deee4bc0808a55733681d67eEltsrv03Eltanlocal_
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying to use phosphor-dbus-monitor to create l=
ogging of sensor exceptions like a Critical state on a specific sensor.<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am able to create a solution with a building yaml =
but at the end it doesn&#8217;t deliver me the desired result.<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As there are very limited examples (on a few in the =
witherspoon) it is very hard to figure out where the mistake is.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Are there any tools that can be used to make this ea=
sier? <o:p>
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Additionally is this the correct method to achieve t=
his goal or should I use something else to define conditions for logging?<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best regards,<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
Wim Vervoorn<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_8daf9ac9deee4bc0808a55733681d67eEltsrv03Eltanlocal_--
