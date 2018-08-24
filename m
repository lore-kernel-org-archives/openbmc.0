Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xtzJ4ll1zDqrV
 for <openbmc@lists.ozlabs.org>; Sat, 25 Aug 2018 07:03:05 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Aug 2018 14:03:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,284,1531810800"; d="scan'208,217";a="68921019"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
 by orsmga006.jf.intel.com with ESMTP; 24 Aug 2018 14:02:05 -0700
Received: from orsmsx152.amr.corp.intel.com (10.22.226.39) by
 ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Fri, 24 Aug 2018 14:02:05 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX152.amr.corp.intel.com ([169.254.8.164]) with mapi id 14.03.0319.002;
 Fri, 24 Aug 2018 14:02:05 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: SOL Logging
Thread-Topic: SOL Logging
Thread-Index: AdQ768XuiEM9C2PZSeev9pRHOBKrsg==
Date: Fri, 24 Aug 2018 21:02:04 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzFkZDA2ZTctNTZkMi00ZmRmLTlmZTEtMzcxZjJiMGJjZDFiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYjNZS3B3dlRLbTl4VU1qSGxtZHBLeVp3MHlcLzBBWTZtRnN0R2g1SVZCU0Q5ejJcL3RXUjVHdk5tbEtucVkreUdMIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
Content-Type: multipart/alternative;
 boundary="_000_7E9441B1E5EFFD4681F54958E821699345835738ORSMSX114amrcor_"
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
X-List-Received-Date: Fri, 24 Aug 2018 21:03:09 -0000

--_000_7E9441B1E5EFFD4681F54958E821699345835738ORSMSX114amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I would like to start a discussion around the feature of SOL logging, and h=
ow to best implement it.

There is a proposal here https://gerrit.openbmc-project.xyz/#/c/openbmc/pho=
sphor-webui/+/12063/ that proposes dumping the SOL console text buffer from=
 Javascript into a file, and presenting it to the user as a download.  On i=
ts face, it seems to work as designed.  This has some pretty severe limitat=
ions, in that you can only dump the console log from your session, and your=
 session is essentially destroyed when you switch pages in the webui, or hi=
t refresh.  I think this is overly limiting, and of the production BMC stac=
ks that I know of, none of them implement SOL logging in this way.

Instead, other BMCs implement it as a circular buffer inside the BMC itself=
, which allows SOL to log data all the time, not just while the user is log=
ged in.  I think architecting it this way would be much more useful for adm=
ins consuming OpenBMC, and make us more useful as a solution.  Doing it thi=
s way also can make the SOL log available to IPMI and Redfish, as well as a=
 file download, which improves the usability quite a bit.  Most places I se=
e the SOL logging requested is for audit type purposes, which the javascrip=
t based version can't do.

I'm looking for feedback from the community here.  As written, I don't thin=
k the javascript console export is a useful feature given its limitations. =
 Do others agree?  Am I off base?  Are there use models where having a log =
of only the current session is useful?  Should we document the limitations =
so we can respond to bugs in the future?

Thanks,

-Ed

--_000_7E9441B1E5EFFD4681F54958E821699345835738ORSMSX114amrcor_
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
<p class=3D"MsoNormal">I would like to start a discussion around the featur=
e of SOL logging, and how to best implement it.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">There is a proposal here <a href=3D"https://gerrit.o=
penbmc-project.xyz/#/c/openbmc/phosphor-webui/&#43;/12063/">
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/&#43;/12063/<=
/a> that proposes dumping the SOL console text buffer from Javascript into =
a file, and presenting it to the user as a download.&nbsp; On its face, it =
seems to work as designed.&nbsp; This has some
 pretty severe limitations, in that you can only dump the console log from =
your session, and your session is essentially destroyed when you switch pag=
es in the webui, or hit refresh.&nbsp; I think this is overly limiting, and=
 of the production BMC stacks that I
 know of, none of them implement SOL logging in this way.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Instead, other BMCs implement it as a circular buffe=
r inside the BMC itself, which allows SOL to log data all the time, not jus=
t while the user is logged in.&nbsp; I think architecting it this way would=
 be much more useful for admins consuming
 OpenBMC, and make us more useful as a solution.&nbsp; Doing it this way al=
so can make the SOL log available to IPMI and Redfish, as well as a file do=
wnload, which improves the usability quite a bit.&nbsp; Most places I see t=
he SOL logging requested is for audit type
 purposes, which the javascript based version can&#8217;t do.<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m looking for feedback from the community he=
re.&nbsp; As written, I don&#8217;t think the javascript console export is =
a useful feature given its limitations.&nbsp; Do others agree?&nbsp; Am I o=
ff base?&nbsp; Are there use models where having a log of only the
 current session is useful?&nbsp; Should we document the limitations so we =
can respond to bugs in the future?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Ed&nbsp; <o:p></o:p></p>
</div>
</body>
</html>

--_000_7E9441B1E5EFFD4681F54958E821699345835738ORSMSX114amrcor_--
