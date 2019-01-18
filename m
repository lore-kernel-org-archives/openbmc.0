Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43hHlt5kQVzDrCl
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jan 2019 10:51:34 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2019 15:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,492,1539673200"; 
 d="scan'208,217";a="135898865"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2019 15:51:28 -0800
Received: from orsmsx115.amr.corp.intel.com (10.22.240.11) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 18 Jan 2019 15:51:28 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.248]) by
 ORSMSX115.amr.corp.intel.com ([169.254.4.145]) with mapi id 14.03.0415.000;
 Fri, 18 Jan 2019 15:51:27 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: TLS cipher suite changes on master
Thread-Topic: TLS cipher suite changes on master
Thread-Index: AdSviIWbW/QAIJJaSBakJCiQWk55bA==
Date: Fri, 18 Jan 2019 23:51:24 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E8216993459B6F13@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzI5NGIxNzctMzQzOS00MzJhLTk4OGUtYTNhYzE2M2ZjNDFhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNWsrM1czbURYckR3R3JQbnNoV2ZvVHUwVzFycjVcLzY4T3JLbm5ieFlHUnhCd1BTck4wM0psZ2g5VzJwREttaDkifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
Content-Type: multipart/alternative;
 boundary="_000_7E9441B1E5EFFD4681F54958E8216993459B6F13ORSMSX114amrcor_"
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
X-List-Received-Date: Fri, 18 Jan 2019 23:51:39 -0000

--_000_7E9441B1E5EFFD4681F54958E8216993459B6F13ORSMSX114amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'd like to draw people's attention to a patchset for bmcweb here:
https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/17390/

This is updating the bmcweb cipher suites to more secure values, and in tur=
n deprecating support for some older framework that we might have as client=
s.  As stated in the patch, we are following OWASP "B" cipher suite recomme=
ndations, although I would like to see us move to "A" in the near future.  =
I have tested several browsers, and several OpenSSL versions, and they seem=
 to work.  I'm bringing attention to this to mention that if people see iss=
ues in HTTPS in the next week or so, they are likely the result of this cha=
nge, and to report them so we can get them resolved.  The most likely culpr=
it is going to be out of date crypto frameworks (think pyCrypto type) that =
don't have support for SHA256.  If we lose compatibility for anything impor=
tant, we need to get it identified so we can roll back the changes, or get =
frameworks up to date.  In most cases, it will give a very unhelpful "Unabl=
e to make secure connection" or "No shared cipher suites" message, which is=
 pretty cryptic if you don't know what to look for.

Hopefully this goes off without a hitch, and this email was unnecessary, bu=
t in the case that I've made an error, hopefully this warning will save peo=
ple some time.

-Ed

--_000_7E9441B1E5EFFD4681F54958E8216993459B6F13ORSMSX114amrcor_
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
<p class=3D"MsoNormal">I&#8217;d like to draw people&#8217;s attention to a=
 patchset for bmcweb here:<o:p></o:p></p>
<p class=3D"MsoNormal">https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcwe=
b/&#43;/17390/<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is updating the bmcweb cipher suites to more se=
cure values, and in turn deprecating support for some older framework that =
we might have as clients.&nbsp; As stated in the patch, we are following OW=
ASP &#8220;B&#8221; cipher suite recommendations, although
 I would like to see us move to &#8220;A&#8221; in the near future.&nbsp; I=
 have tested several browsers, and several OpenSSL versions, and they seem =
to work.&nbsp; I&#8217;m bringing attention to this to mention that if peop=
le see issues in HTTPS in the next week or so, they are likely
 the result of this change, and to report them so we can get them resolved.=
&nbsp; The most likely culprit is going to be out of date crypto frameworks=
 (think pyCrypto type) that don&#8217;t have support for SHA256.&nbsp; If w=
e lose compatibility for anything important, we
 need to get it identified so we can roll back the changes, or get framewor=
ks up to date.&nbsp; In most cases, it will give a very unhelpful &#8220;Un=
able to make secure connection&#8221; or &#8220;No shared cipher suites&#82=
21; message, which is pretty cryptic if you don&#8217;t know what to
 look for.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hopefully this goes off without a hitch, and this em=
ail was unnecessary, but in the case that I&#8217;ve made an error, hopeful=
ly this warning will save people some time.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Ed<o:p></o:p></p>
</div>
</body>
</html>

--_000_7E9441B1E5EFFD4681F54958E8216993459B6F13ORSMSX114amrcor_--
