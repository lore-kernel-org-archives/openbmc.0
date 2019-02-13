Return-Path: <pravinashj@ami.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.40; helo=atlmailgw1.ami.com;
 envelope-from=pravinashj@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
X-Greylist: delayed 907 seconds by postgrey-1.36 at bilbo;
 Thu, 14 Feb 2019 10:47:04 AEDT
Received: from atlmailgw1.ami.com (atlmailgw1.ami.com [63.147.10.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440GQc36yxzDqGh
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 10:47:03 +1100 (AEDT)
X-AuditID: ac1060b2-773ff70000002bc0-f3-5c64a8e96490
Received: from atlms2.us.megatrends.com (atlms2.us.megatrends.com
 [172.16.96.152])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 43.98.11200.9E8A46C5; Wed, 13 Feb 2019 18:31:53 -0500 (EST)
Received: from ATLMS1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605]) by
 atlms2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb%12]) with mapi id
 14.03.0415.000; Wed, 13 Feb 2019 18:31:53 -0500
From: Pravinash Jeyapaul <pravinashj@ami.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Request to create meta-ami layer
Thread-Topic: Request to create meta-ami layer
Thread-Index: AdTD9AiUi7wx86UUSCe+83XCfOKpaQ==
Date: Wed, 13 Feb 2019 23:31:52 +0000
Message-ID: <172B3E99B822FF48BA79AD354B1F1F59012585AF47@atlms1.us.megatrends.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.100.4]
Content-Type: multipart/alternative;
 boundary="_000_172B3E99B822FF48BA79AD354B1F1F59012585AF47atlms1usmegat_"
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleLIzCtJLcpLzFFi42JZI5AwQ/flipQYg2f/jC1OtbxgcWD0OD9j
 IWMAY1QDo01iXl5+SWJJqkJKanGyrVJAUWZZYnKlkkJmiq2SoZJCQU5icmpual6JrVJiQUFq
 XoqSHZcCBrABKsvMU0jNS85PycxLt1XyDPbXtbAwtdQ1VLILyUhVyMxLyy/KTSzJzM9TSM7P
 KwGqTk0BiiokdHFmvPyvUrBWtGLf5i+sDYyfhboYOTkkBEwkfj06yQJiCwnsYpKYtFS5i5EL
 yD7MKDG5cSc7SIJNQFfi9dQWZhBbRMBSYsmDdjYQW1hAU6L1QQcjRFxP4uStbjYY+23nJLB6
 FgFViW0f34PV8AoEShxa3gVWwyggJvH91BomEJtZQFzi1pP5TBAHCUgs2XOeGcIWlXj5+B8r
 hK0gsWHtB3aI+nyJo20LWCFmCkqcnPmEZQKj4Cwko2YhKZuFpAwiriOxYPcnNghbW2LZwtfM
 MPaZA4+ZkMUXMLKvYhRKLMnJTczMSS831EvMzdRLzs/dxAiJ8U07GFsumh9iFOBgVOLhdZ+e
 EiPEmlhWXJl7iFGCg1lJhFd+MlCINyWxsiq1KD++qDQntfgQoxMwWCYyS3GDYggY5fHGBgZS
 ojCOoYmZibmRuaGlibmxsZI4b77apyghgXRg0slOTS1ILYIZwsTBKdXAuFlb5IPOdiHbwk2q
 wUdPMYU+uXNYTt/4xqpI18mLS+wEWXUjb12atf2C9tWg0NdrP8XPPDRbzmF1g/fnhqsJDj3P
 72eY8kV+s18t/DvSbIJ9LYO/o4aCeqx25YbmTast7HXOyPOsXrKt9kGt9twTqRErJr80TmL6
 dGmDePrm3NNTT9+dcHrVISWW4oxEQy3mouJEAAHo2GAUAwAA
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
X-List-Received-Date: Wed, 13 Feb 2019 23:47:05 -0000

--_000_172B3E99B822FF48BA79AD354B1F1F59012585AF47atlms1usmegat_
Content-Type: text/plain; charset="us-ascii"
content-transfer-encoding: quoted-printable

Hi Brad,

Thank you for accepting CCLA from American Megatrends Inc (AMI). Can you ple=
ase create meta-ami layer?
To begin with, we want to add few machines.

Regards,
Pravinash


Please consider the environment before printing this email.

The information contained in this message may be confidential and proprietar=
y to American Megatrends, Inc.  This communication is intended to be read on=
ly by the individual or entity to whom it is addressed or by their designee.=
 If the reader of this message is not the intended recipient, you are on not=
ice that any distribution of this message, in any form, is strictly prohibit=
ed.  Please promptly notify the sender by reply e-mail or by telephone at 77=
0-246-8600, and then delete or destroy all copies of the transmission.

--_000_172B3E99B822FF48BA79AD354B1F1F59012585AF47atlms1usmegat_
Content-Type: text/html; charset="us-ascii"
content-transfer-encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micro=
soft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" xm=
lns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://w=
ww.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
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
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoNormal">Hi Brad,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you for accepting CCLA from American Megatrends=
 Inc (AMI). Can you please create meta-ami layer?<o:p></o:p></p>
<p class=3D"MsoNormal">To begin with, we want to add few machines.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Pravinash<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<font color=3D"#009900" face=3D"Webdings" size=3D"4">P</font><font
  color=3D"#009900" face=3D"verdana,arial,helvetica" size=3D"2"> <strong>Ple=
ase
consider the environment before printing this email</strong></font>
<p>The information contained in this message may be confidential and proprie=
tary to American Megatrends, Inc.  This communication is intended to be read=
 only by the individual or entity to whom it is addressed or by their design=
ee. If the reader of this message is not the intended recipient, you are on=
 notice that any distribution of this message, in any form, is strictly proh=
ibited.  Please promptly notify the sender by reply e-mail or by telephone a=
t 770-246-8600, and then delete or destroy all copies of the transmission.</=
p>
</body>
</html>

--_000_172B3E99B822FF48BA79AD354B1F1F59012585AF47atlms1usmegat_--
