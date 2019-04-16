Return-Path: <kuiying.wang@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jtTC6LhzzDqGG
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 14:59:33 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Apr 2019 21:59:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,355,1549958400"; 
 d="scan'208,217";a="134696589"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga008.jf.intel.com with ESMTP; 15 Apr 2019 21:59:30 -0700
Received: from fmsmsx126.amr.corp.intel.com (10.18.125.43) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 15 Apr 2019 21:59:30 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 FMSMSX126.amr.corp.intel.com (10.18.125.43) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 15 Apr 2019 21:59:29 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.206]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.147]) with mapi id 14.03.0415.000;
 Tue, 16 Apr 2019 12:59:28 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: "wangzqbj@inspur.com" <wangzqbj@inspur.com>
CC: "Li, Yong B" <yong.b.li@intel.com>, "Feist, James"
 <james.feist@intel.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: dbus sensors how to determine power on/off state
Thread-Topic: dbus sensors how to determine power on/off state
Thread-Index: AdT0D+DR4pFry9JHQCOpEfwCm4JZTw==
Date: Tue, 16 Apr 2019 04:59:27 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E7724E4934F5@shsmsx102.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
Content-Type: multipart/alternative;
 boundary="_000_959CAFA1E282D14FB901BE9A7BF4E7724E4934F5shsmsx102ccrcor_"
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
X-List-Received-Date: Tue, 16 Apr 2019 04:59:45 -0000

--_000_959CAFA1E282D14FB901BE9A7BF4E7724E4934F5shsmsx102ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi John,

All patches in https://github.com/Intel-BMC/ currently on Chassis power con=
trol will be upstream to https://github.com/openbmc/<https://github.com/ope=
nbmc/phosphor-dbus-interfaces/blob/a641728c6923d9fb374f973b1c216515a082e21f=
/xyz/openbmc_project/Chassis/Control/Power.interface.yaml#L17> step by step=
.

And all the implementation currently in https://github.com/Intel-BMC/intel-=
chassis-control will be upstream to https://github.com/openbmc/x86-power-co=
ntrol
All the definition in https://github.com/openbmc/phosphor-dbus-interfaces/b=
lob/master/xyz/openbmc_project/Chassis/Control/Power.interface.yaml will be=
 the final definition.

Thanks,
Kwin.


--_000_959CAFA1E282D14FB901BE9A7BF4E7724E4934F5shsmsx102ccrcor_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
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
<p class=3D"MsoNormal">Hi John,<o:p></o:p></p>
<pre>All patches in <a href=3D"https://github.com/Intel-BMC/">https://githu=
b.com/Intel-BMC/</a> currently on Chassis power control will be upstream to=
 <span style=3D"color:black"><a href=3D"https://github.com/openbmc/phosphor=
-dbus-interfaces/blob/a641728c6923d9fb374f973b1c216515a082e21f/xyz/openbmc_=
project/Chassis/Control/Power.interface.yaml#L17">https://github.com/openbm=
c/</a> step by step.<o:p></o:p></span></pre>
<pre><span style=3D"color:black">And all the implementation currently in </=
span><a href=3D"https://github.com/Intel-BMC/intel-chassis-control">https:/=
/github.com/Intel-BMC/intel-chassis-control</a> will be upstream to <a href=
=3D"https://github.com/openbmc/x86-power-control">https://github.com/openbm=
c/x86-power-control</a><span style=3D"color:black"><o:p></o:p></span></pre>
<p class=3D"MsoNormal">All the definition in <a href=3D"https://github.com/=
openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Chassis/Co=
ntrol/Power.interface.yaml">
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc=
_project/Chassis/Control/Power.interface.yaml</a> will be the final definit=
ion.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kwin.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_959CAFA1E282D14FB901BE9A7BF4E7724E4934F5shsmsx102ccrcor_--
