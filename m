Return-Path: <james.mihm@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=james.mihm@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44P3CF59mTzDqJ7
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 06:34:07 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 12:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,245,1549958400"; 
 d="scan'208,217";a="328733595"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by fmsmga006.fm.intel.com with ESMTP; 19 Mar 2019 12:34:03 -0700
Received: from orsmsx163.amr.corp.intel.com (10.22.240.88) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 19 Mar 2019 12:34:02 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.66]) by
 ORSMSX163.amr.corp.intel.com ([169.254.9.144]) with mapi id 14.03.0415.000;
 Tue, 19 Mar 2019 12:34:02 -0700
From: "Mihm, James" <james.mihm@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Intel-BMC on github
Thread-Topic: Intel-BMC on github
Thread-Index: AdTeaIztTZQU6HRgQ0CG/FVrHj/P9Q==
Date: Tue, 19 Mar 2019 19:34:02 +0000
Message-ID: <C599FC839619124CAC44E062ABB7DFE2D7A61D0F@ORSMSX115.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODJiN2YxZWQtYzVlMi00NjU1LWEzMGYtOWNjOTI0MjhlMTcxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR3JFc1dYZ3F5c3hZeFFDbnhQZW1pSlRTbktDUExvTnc3dmR0YVwvWDZFcEkzOWFQeVJ6SFEyQTgzTFNOUkhZXC85In0=
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
Content-Type: multipart/alternative;
 boundary="_000_C599FC839619124CAC44E062ABB7DFE2D7A61D0FORSMSX115amrcor_"
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 19 Mar 2019 19:34:19 -0000

--_000_C599FC839619124CAC44E062ABB7DFE2D7A61D0FORSMSX115amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Intel announces that its internal repository based on the OpenBMC project i=
s being made public on github under the organization name of Intel-BMC.

Intel is sharing the latest internal repositories in response to requests f=
rom partners and customers to be able to build an OpenBMC firmware image th=
at will run on an existing Intel server platform. The repositories include =
content that has not yet been upstreamed to the LF OpenBMC project.

Currently the only supported platform is the Wolf Pass platform (S2600WF). =
Support for more platforms will be added in the future.

The Intel-BMC can be found at https://github.com/Intel-BMC<https://github.c=
om/Intel-BMC/openbmc>.
For further information, please refer to the readme file (https://github.co=
m/Intel-BMC/openbmc/blob/intel/README.md).

James Mihm
Intel DCG BMC Core Firmware
(503) 264-5129


--_000_C599FC839619124CAC44E062ABB7DFE2D7A61D0FORSMSX115amrcor_
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
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
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
<p class=3D"MsoNormal">Intel announces that its internal repository based o=
n the OpenBMC project is being made public on github under the organization=
 name of Intel-BMC.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Intel is sharing the latest internal repositories in=
 response to requests from partners and customers to be able to build an Op=
enBMC firmware image that will run on an existing Intel server platform. Th=
e repositories include content that
 has not yet been upstreamed to the LF OpenBMC project. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Currently the only supported platform is the Wolf Pa=
ss platform (S2600WF). Support for more platforms will be added in the futu=
re.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The Intel-BMC can be found at <a href=3D"https://git=
hub.com/Intel-BMC/openbmc">
https://github.com/Intel-BMC</a>. <o:p></o:p></p>
<p class=3D"MsoNormal">For further information, please refer to the readme =
file (<a href=3D"https://github.com/Intel-BMC/openbmc/blob/intel/README.md"=
>https://github.com/Intel-BMC/openbmc/blob/intel/README.md</a>).<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
mic Sans MS&quot;;color:navy">James Mihm</span><span style=3D"font-family:&=
quot;Arial&quot;,sans-serif">
</span><br>
<span style=3D"font-family:&quot;Comic Sans MS&quot;;color:navy">Intel DCG =
BMC Core Firmware</span><br>
<span style=3D"font-size:10.0pt;font-family:&quot;Comic Sans MS&quot;;color=
:navy">(503) 264-5129</span>
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_C599FC839619124CAC44E062ABB7DFE2D7A61D0FORSMSX115amrcor_--
