Return-Path: <KFTING@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=kfting@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
X-Greylist: delayed 978 seconds by postgrey-1.36 at bilbo;
 Fri, 24 Aug 2018 16:19:21 AEST
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xWMY5RS9zDqSL
 for <openbmc@lists.ozlabs.org>; Fri, 24 Aug 2018 16:19:21 +1000 (AEST)
Received: from NTILML02.nuvoton.com (212.199.177.21.static.012.net.il
 [212.199.177.21])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w7O5WpGW022958
 for <openbmc@lists.ozlabs.org>; Fri, 24 Aug 2018 08:32:51 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML02.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Fri, 24 Aug
 2018 09:02:49 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Fri, 24 Aug
 2018 14:02:47 +0800
Received: from NTHCML01A.nuvoton.com ([fe80::1170:e239:c9a9:e8b8]) by
 NTHCML01A.nuvoton.com ([fe80::1170:e239:c9a9:e8b8%13]) with mapi id
 15.00.1130.005; Fri, 24 Aug 2018 14:02:47 +0800
From: <KFTING@nuvoton.com>
To: <openbmc@lists.ozlabs.org>
Subject: [IPMBD] ipmbSend handling
Thread-Topic: [IPMBD] ipmbSend handling
Thread-Index: AdQ7bBJlB9GQFmgMREWcf8iZ/yaUkw==
Date: Fri, 24 Aug 2018 06:02:47 +0000
Message-ID: <4b1131fb4e684bca994c5456838c028d@NTHCML01A.nuvoton.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.4.42.63]
Content-Type: multipart/alternative;
 boundary="_000_4b1131fb4e684bca994c5456838c028dNTHCML01Anuvotoncom_"
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 24 Aug 2018 06:19:23 -0000

--_000_4b1131fb4e684bca994c5456838c028dNTHCML01Anuvotoncom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi:

I check the ipmbd implementation from
https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gerrit.openbmc-2Dpro=
ject.xyz_-23_c_openbmc_ipmbbridge_-2B_11130_&d=3DDwICAg&c=3Due8mO8zgC4VZ4q_=
aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3DkGibSCEQz-PilnW-r9KNT7_zWJXJNtnSK5aYZCe7SV=
s&m=3D9vYrt5dE5uTcGZ0xJvXwlc2qHu9SzkgJbpR7h9W0jXE&s=3DxLAMWHrLSU8GJiEb4ObBm=
fmlBhRwK26Z3t4-piFCe1c&e=3D and find out that the IPMB request or response =
messages are passed down to the I2C slave device in the ipmbSend function.

The master device node is /dev/i2c-0 and the slave device node is /sys/bus/=
i2c/devices/0-1010/slave-mqueue in the ipmbbridge implementation.

The direction is always from the master device to the slave device.

In normal IPMB usage case, an IPMB request is sent to the master device (sa=
y /dev/i2c-3) and then the master device sends that IPMB request to the cli=
ent device attached to the master device's bus.

While an IPMB response returns from the client device, the client device us=
es an I2C master-write transfer to send the response back to the request or=
iginator, which is /dev/i2c-3, according to IPMB spec. So the request origi=
nator becomes an I2C slave at this moment.

It seems to me that ipmbSend behavior doesn't get aligned with the descript=
ion of request/response protocol in IPMB spec.

I might misunderstand the ipmbSend behavior and any comment is welcome.

Thank you.

Regards,
Tyrone


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.

--_000_4b1131fb4e684bca994c5456838c028dNTHCML01Anuvotoncom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I check the ipmbd implementatio=
n from<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://urldefense.p=
roofpoint.com/v2/url?u=3Dhttps-3A__gerrit.openbmc-2Dproject.xyz_-23_c_openb=
mc_ipmbbridge_-2B_11130_&amp;d=3DDwICAg&amp;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01=
UFDmisvMR1k-EoDM&amp;r=3DkGibSCEQz-PilnW-r9KNT7_zWJXJNtnSK5aYZCe7SVs&amp;m=
=3D9vYrt5dE5uTcGZ0xJvXwlc2qHu9SzkgJbpR7h9W0jXE&amp;s=3DxLAMWHrLSU8GJiEb4ObB=
mfmlBhRwK26Z3t4-piFCe1c&amp;e">https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__gerrit.openbmc-2Dproject.xyz_-23_c_openbmc_ipmbbridge_-2B_1113=
0_&amp;d=3DDwICAg&amp;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=
=3DkGibSCEQz-PilnW-r9KNT7_zWJXJNtnSK5aYZCe7SVs&amp;m=3D9vYrt5dE5uTcGZ0xJvXw=
lc2qHu9SzkgJbpR7h9W0jXE&amp;s=3DxLAMWHrLSU8GJiEb4ObBmfmlBhRwK26Z3t4-piFCe1c=
&amp;e</a>=3D
 and find out that the IPMB request or response messages are passed down to=
 the I2C slave device in the ipmbSend function.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The master device node is /dev/=
i2c-0 and the slave device node is /sys/bus/i2c/devices/0-1010/slave-mqueue=
 in the ipmbbridge implementation.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The direction is always from th=
e master device to the slave device.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In normal IPMB usage case, an I=
PMB request is sent to the master device (say /dev/i2c-3) and then the mast=
er device sends that IPMB request to the client device attached to the mast=
er device&#8217;s bus.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">While an IPMB response returns =
from the client device, the client device uses an I2C master-write transfer=
 to send the response back to the request originator, which is /dev/i2c-3, =
according to IPMB spec. So the request
 originator becomes an I2C slave at this moment.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">It seems to me that ipmbSend be=
havior doesn&#8217;t get aligned with the description of request/response p=
rotocol in IPMB spec.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I might misunderstand the ipmbS=
end behavior and any comment is welcome.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tyrone<o:p></o:p></span></p>
</div>
<br>
<font face=3D"Arial" color=3D"Black" size=3D"3"><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email
 to such a person, please kindly reply to the sender indicating this fact a=
nd delete all copies of it from your computer and network server immediatel=
y. Your cooperation is highly appreciated. It is advised that any unauthori=
zed use of confidential information
 of Nuvoton is strictly prohibited; and any information in this email irrel=
evant to the official business of Nuvoton shall be deemed as neither given =
nor endorsed by Nuvoton.<br>
</font>
</body>
</html>

--_000_4b1131fb4e684bca994c5456838c028dNTHCML01Anuvotoncom_--
