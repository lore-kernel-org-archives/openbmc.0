Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.10; helo=cpsmtpb-ews07.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="LF/f0rJ+"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews07.kpnxchange.com (cpsmtpb-ews07.kpnxchange.com
 [213.75.39.10])
 by lists.ozlabs.org (Postfix) with ESMTP id 44jNzf62fFzDqFm
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 19:50:51 +1000 (AEST)
Received: from cpsps-ews14.kpnxchange.com ([10.94.84.181]) by
 cpsmtpb-ews07.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Mon, 15 Apr 2019 11:50:46 +0200
X-Brand: 4ZrJ
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=CfzZG4jl c=1 sm=1 tr=0 cx=a_idp_e
 a=/dHbpd/3q0lrH6oA/zwSgQ==:117 a=/dHbpd/3q0lrH6oA/zwSgQ==:17
 a=eIHzyqS2sMcA:10 a=xqWC_Br6kY4A:10 a=oexKYjalfGEA:10
 a=8SWBkYfPpbeUO7exqZ0A:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8
 a=SSmOFEACAAAA:8 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10
 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10 a=pHzHmUro8NiASowvMSCR:22
 a=n87TN5wuljxrRezIQYnT:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.45]) by cpsps-ews14.kpnxchange.com
 over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 15 Apr 2019 11:50:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=mime-version:content-type:message-id:date:subject:to:from;
 bh=FXJ8Ru3v1BleKcwaNKEfSZmPJu/haNv+vHT2OP07yzM=;
 b=LF/f0rJ+phsg6GTyH9q4ImHFpYS3dtHoma3JRK205BdFL7P1wrXOrAnWcFQoUcNjZcRuYpyVHc1HM
 6XiwjlcatoolppamS4DMIlKj3OKI82tIKVYHGyHjUonB8qk3MUbCmf84tqNfR1UulPDLhJPKtJL5Pl
 QtpbQ3sJF+L9jNvo=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
 by smtp.kpnmail.nl (Halon) with ESMTPS
 id f0ca7bc4-5f63-11e9-8eb5-005056ab7447;
 Mon, 15 Apr 2019 11:50:45 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Mon, 15 Apr
 2019 11:50:22 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Mon, 15 Apr 2019 11:50:22 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: which licenses are allowed for OpenBMC projects
Thread-Topic: which licenses are allowed for OpenBMC projects
Thread-Index: AdTzcAvehfjbpZNJRdCoEuf1eymngQ==
Date: Mon, 15 Apr 2019 09:50:22 +0000
Message-ID: <cfdea58494de44aa8e30b18799b24aa3@Eltsrv03.Eltan.local>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
Content-Type: multipart/alternative;
 boundary="_000_cfdea58494de44aa8e30b18799b24aa3Eltsrv03Eltanlocal_"
MIME-Version: 1.0
X-OriginalArrivalTime: 15 Apr 2019 09:50:45.0934 (UTC)
 FILETIME=[B2A08CE0:01D4F370]
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
X-List-Received-Date: Mon, 15 Apr 2019 09:50:58 -0000

--_000_cfdea58494de44aa8e30b18799b24aa3Eltsrv03Eltanlocal_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I have a non-technical question about the OpenBMC project.

If we create a custom implementation for an OpenBMC project which we delive=
r to a customer can we include parts that are under a BSD or a proprietary =
license? In this case the Yocto files would be in the tree but the code pul=
led in could be binary or a BSD repository?

For us it's important to make sure we understand correctly what the possibi=
lities are.

Best regards,

Wim Vervoorn


--_000_cfdea58494de44aa8e30b18799b24aa3Eltsrv03Eltanlocal_
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
<p class=3D"MsoNormal">I have a non-technical question about the OpenBMC pr=
oject.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If we create a custom implementation for an OpenBMC =
project which we deliver to a customer can we include parts that are under =
a BSD or a proprietary license? In this case the Yocto files would be in th=
e tree but the code pulled in could
 be binary or a BSD repository?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For us it&#8217;s important to make sure we understa=
nd correctly what the possibilities are.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best regards,<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
Wim Vervoorn<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_cfdea58494de44aa8e30b18799b24aa3Eltsrv03Eltanlocal_--
