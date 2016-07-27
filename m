Return-Path: <prafulla.deuskar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by lists.ozlabs.org (Postfix) with ESMTP id 3s05rr63GXzDqZw
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 06:17:47 +1000 (AEST)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP; 27 Jul 2016 13:17:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; 
 d="scan'208,217";a="740617402"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2016 13:17:46 -0700
Received: from orsmsx161.amr.corp.intel.com (10.22.240.84) by
 ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server (TLS)
 id 14.3.248.2; Wed, 27 Jul 2016 13:17:44 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.122]) by
 ORSMSX161.amr.corp.intel.com ([169.254.4.17]) with mapi id 14.03.0248.002;
 Wed, 27 Jul 2016 13:17:44 -0700
From: "Deuskar, Prafulla" <prafulla.deuskar@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: REST API support on AST 2500 EVB
Thread-Topic: REST API support on AST 2500 EVB
Thread-Index: AdHoQwFgTD26saWFSHC5hJDMT1j5jA==
Date: Wed, 27 Jul 2016 20:17:43 +0000
Message-ID: <86BC2638B1D5DA48B2AEFCA5BCA462667134F6D9@ORSMSX115.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYWZmZmUzYjItZDU5OC00ZGI4LTg5ZDAtNGI1YjFjNjQ1ZWJmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IlN3XC80SVhMcVwvRVkzTDFadHA2eUxLeEp3WEc1WlhhcWtHVyt5T0l2RGRuYz0ifQ==
x-ctpclassification: CTP_IC
x-originating-ip: [10.22.254.139]
Content-Type: multipart/alternative;
 boundary="_000_86BC2638B1D5DA48B2AEFCA5BCA462667134F6D9ORSMSX115amrcor_"
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2016 20:17:49 -0000

--_000_86BC2638B1D5DA48B2AEFCA5BCA462667134F6D9ORSMSX115amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello -

Does the OpenBMC code support REST API as documented here?
https://github.com/openbmc/docs/blob/master/rest-api.md

Looks like obmc-rest is running (according to "ps") and there are services =
listening on ports 22, 3000, 2200 and 443 ("netstat -lntu").

Any pointers appreciated.

Thanks,
Prafulla



--_000_86BC2638B1D5DA48B2AEFCA5BCA462667134F6D9ORSMSX115amrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:dt=3D"uuid:C2F4101=
0-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://schemas.microsoft.com/offi=
ce/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
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
<p class=3D"MsoNormal">Hello &#8211; <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Does the OpenBMC code support REST API as documented=
 here?<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/docs/blob/mast=
er/rest-api.md">https://github.com/openbmc/docs/blob/master/rest-api.md</a>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Looks like obmc-rest is running (according to &#8220=
;ps&#8221;) and there are services listening on ports 22, 3000, 2200 and 44=
3 (&#8220;netstat &#8211;lntu&#8221;).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any pointers appreciated.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Prafulla<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_86BC2638B1D5DA48B2AEFCA5BCA462667134F6D9ORSMSX115amrcor_--
