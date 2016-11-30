Return-Path: <deanna.shih@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tT1gS4KPmzDw1c
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 11:36:20 +1100 (AEDT)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP; 29 Nov 2016 16:36:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,719,1473145200"; 
 d="scan'208,217";a="197196288"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2016 16:36:17 -0800
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.248.2; Tue, 29 Nov 2016 16:36:17 -0800
Received: from orsmsx110.amr.corp.intel.com ([169.254.10.244]) by
 ORSMSX112.amr.corp.intel.com ([169.254.3.163]) with mapi id 14.03.0248.002;
 Tue, 29 Nov 2016 16:36:17 -0800
From: "Shih, Deanna" <deanna.shih@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Roadmap for AST2500?
Thread-Topic: Re: Roadmap for AST2500?
Thread-Index: AdJKoQTAnsXe806LTBuMR5AcELVdLw==
Date: Wed, 30 Nov 2016 00:36:17 +0000
Message-ID: <5051234241C6FC48A7CDB8BFB480285A9ABEB10F@ORSMSX110.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
Content-Type: multipart/alternative;
 boundary="_000_5051234241C6FC48A7CDB8BFB480285A9ABEB10FORSMSX110amrcor_"
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 30 Nov 2016 11:50:49 +1100
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
X-List-Received-Date: Wed, 30 Nov 2016 00:36:21 -0000

--_000_5051234241C6FC48A7CDB8BFB480285A9ABEB10FORSMSX110amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NC-SI is working in U-boot? Could you provide some details on supporting NC=
-SI interface in u-boot and ast2500 specifically.

Thanks,
Deanna

--_000_5051234241C6FC48A7CDB8BFB480285A9ABEB10FORSMSX110amrcor_
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
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:ZH-TW;}
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
	font-family:"Calibri",sans-serif;
	mso-fareast-language:ZH-TW;}
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
<p class=3D"MsoNormal">NC-SI is working in U-boot? Could you provide some d=
etails on supporting NC-SI interface in u-boot and ast2500 specifically.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Deanna<o:p></o:p></p>
</div>
</body>
</html>

--_000_5051234241C6FC48A7CDB8BFB480285A9ABEB10FORSMSX110amrcor_--
