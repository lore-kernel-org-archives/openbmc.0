Return-Path: <Swapna.M3@dell.com>
X-Greylist: delayed 613 seconds by postgrey-1.36 at bilbo;
 Tue, 29 Aug 2017 16:01:14 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="FAacCYns"; 
 dkim-atps=neutral
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhJ0p6b7gzDqRM
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 16:01:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1503986475; x=1535522475;
 h=from:to:subject:date:message-id:mime-version;
 bh=5kzofX3+olkO8t2kBFtDEo3RXNof8VjuSu2v1y/Qhqg=;
 b=FAacCYnsC2sbLAJZO5RpzkJB+80UVt5dxvkGT/MvniBKFHmuJReslhab
 1DKgglMpqfOjgIqiHpmH2Jfng2edWuxKPNty9yYjX7f+ZYf4PN3zvUhTj
 tLw2zhQN3mbCoiWpjBx0QjHaDcRpQRtLI48Hn1neQaj0OuH2/87SorNZU 4=;
Received: from esa6.dell-outbound2.iphmx.com ([68.232.154.99])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2017 00:50:58 -0500
From: <Swapna.M3@dell.com>
Received: from ausc60pc101.us.dell.com ([143.166.85.206])
 by esa6.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2017 11:50:58 +0600
X-LoopCount0: from 10.175.218.62
X-IronPort-AV: E=Sophos;i="5.41,443,1498539600"; 
 d="scan'208,217";a="1146891015"
X-DLP: DLP_GlobalPCIDSS
To: <openbmc@lists.ozlabs.org>
Subject: OpenBMC issues
Thread-Topic: OpenBMC issues
Thread-Index: AdMgipERRrkWFpUrToubqGeJtjZ4Zw==
Date: Tue, 29 Aug 2017 05:50:46 +0000
Message-ID: <76fff282c45a440bb794bea3c7f1a812@BLRX13MDC414.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [163.244.186.30]
Content-Type: multipart/alternative;
 boundary="_000_76fff282c45a440bb794bea3c7f1a812BLRX13MDC414AMERDELLCOM_"
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 30 Aug 2017 01:19:22 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Aug 2017 06:01:16 -0000

--_000_76fff282c45a440bb794bea3c7f1a812BLRX13MDC414AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

In OpenBMC we found driver stability issues. Is that because of OEM vendors=
 or any other reason for the stability issue?



Regards,
Swapna

--_000_76fff282c45a440bb794bea3c7f1a812BLRX13MDC414AMERDELLCOM_
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
<p class=3D"MsoNormal">Hi <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In OpenBMC we found driver stability issues. Is that=
 because of OEM vendors or any other reason for the stability issue?<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Swapna<o:p></o:p></p>
</div>
</body>
</html>

--_000_76fff282c45a440bb794bea3c7f1a812BLRX13MDC414AMERDELLCOM_--
