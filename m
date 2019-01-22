Return-Path: <Brenden_Lai@jabil.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=jabil.com
 (client-ip=40.107.70.94; helo=nam04-sn1-obe.outbound.protection.outlook.com;
 envelope-from=brenden_lai@jabil.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jabil.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jabil.onmicrosoft.com header.i=@jabil.onmicrosoft.com
 header.b="n4nXHx65"; dkim-atps=neutral
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700094.outbound.protection.outlook.com [40.107.70.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kJYq14QBzDqJq
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 17:34:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jabil.onmicrosoft.com; 
 s=selector1-jabil-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzfPhh0mMpiMGweP6kQLyPI1qnSbGhoISa1wW8hYYOw=;
 b=n4nXHx65D4kVqPvMkEVnNpfwFmNwze+muwFiU0vyp3sE9VI+JLU/2eWFR7EISQ7tnUwE4RH75yb+jO13JvFxvSfnAHrT/SJB4qkr34mO5Q3wqcvBLSbpc9kwrrFvM7wRRK5LEIqwOjONU105aXZvkvWM/I61ZlhCMxuBT5MH0o8=
Received: from SN6PR02MB5693.namprd02.prod.outlook.com (20.177.252.17) by
 SN6PR02MB5616.namprd02.prod.outlook.com (20.177.251.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.24; Tue, 22 Jan 2019 06:34:48 +0000
Received: from SN6PR02MB5693.namprd02.prod.outlook.com
 ([fe80::59f9:194e:34f4:584f]) by SN6PR02MB5693.namprd02.prod.outlook.com
 ([fe80::59f9:194e:34f4:584f%4]) with mapi id 15.20.1537.031; Tue, 22 Jan 2019
 06:34:48 +0000
From: Brenden Lai <Brenden_Lai@jabil.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: build and enviroment questions
Thread-Topic: build and enviroment questions
Thread-Index: AdSyFw4NSN1kiK3bQQOz4TuWWa35KA==
Date: Tue, 22 Jan 2019 06:34:48 +0000
Message-ID: <SN6PR02MB569357D7F6705F757F805F3796980@SN6PR02MB5693.namprd02.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5Lmh0bWwiIHA9ImM6XHVzZXJzXDE1MzIxNDhcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1jZTE2ZjI0NC0xZTBmLTExZTktODc5NS1iODhhNjBhMzA2OTFcYW1lLXRlc3RcY2UxNmYyNDUtMWUwZi0xMWU5LTg3OTUtYjg4YTYwYTMwNjkxYm9keS5odG1sIiBzej0iMTA5NjciIHQ9IjEzMTkyNjEyNDg1MjkyOTI3MyIgaD0iWjZrdWFVV1I3WGlnaTZVb2F2aUFqVS9jL01nPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brenden_Lai@jabil.com; 
x-originating-ip: [165.225.102.65]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN6PR02MB5616;
 20:oKS8i4VmwQxkO14AbSeaW3zBpNq8nUeSe3ZMCrc0RxjQeaXyQe80/Y5vbEHvpQR2apFdLW3KC/8LepR3csGu3nQWndy/RciLI5IfedBF4X6fZq1iehdPzFehjtYOIXWHtr5aPrkYDWt8w/Eo8qRcvlCvsleyUHonuPQM8N94uJA=
x-ms-office365-filtering-correlation-id: 11da54f2-67b3-4fe7-e575-08d68033b517
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:SN6PR02MB5616; 
x-ms-traffictypediagnostic: SN6PR02MB5616:
x-microsoft-antispam-prvs: <SN6PR02MB5616B819B131C78B608F3DBF96980@SN6PR02MB5616.namprd02.prod.outlook.com>
x-forefront-prvs: 0925081676
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(366004)(376002)(136003)(39860400002)(199004)(189003)(53754006)(33656002)(68736007)(97736004)(316002)(80792005)(66066001)(7736002)(6436002)(14444005)(2351001)(256004)(1730700003)(81166006)(81156014)(8676002)(5640700003)(6916009)(55016002)(8936002)(486006)(106356001)(74316002)(6116002)(3846002)(99286004)(105586002)(790700001)(14454004)(25786009)(478600001)(72206003)(86362001)(7696005)(3480700005)(26005)(102836004)(476003)(2501003)(2906002)(71200400001)(71190400001)(6306002)(54896002)(9686003)(53936002)(6506007)(55236004)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR02MB5616;
 H:SN6PR02MB5693.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: jabil.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DJFuw2IIojnuCAqEPwv9/8WgzpYvlMWvtKY6Hjveu0H+Sg3SvSYVUK1ucvvNVagIv8yOXcXCHVUE2kYPYNMERslLkeP24V2ItoFNg9FOJ/fTurndgShlbljYa6NWrONAJyNP/jqRRPxpnlnsNHo6KsmfSMkGxbzXMwC22PglzMnd4NZ+ZHXXgQYRYUX+yxm+h7GtQUsf4L82WKMAWRbJ/D9QIDl6Unm7eJu+SaFWITiBYvt+OfO/sj8tAN8S2sxTvcoje8bic8PCzAi69fLr24iPGPxvgxmThAQ6R1sTLCOoYAD2BAFpPFZUWVavIQdTcjm1roei7WgyAHmUl8CDiu9J5xe6arymiUT+AcimIitxQQPpq9tSbQwQoRElRARwDjm3HsTnpM8DZjS2ypIxAZx2rWHqD0K+XIsGFxES//E=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_SN6PR02MB569357D7F6705F757F805F3796980SN6PR02MB5693namp_"
MIME-Version: 1.0
X-OriginatorOrg: jabil.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11da54f2-67b3-4fe7-e575-08d68033b517
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2019 06:34:48.8112 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc876b21-f134-4c12-a265-8ed26b7f0f3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5616
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
X-List-Received-Date: Tue, 22 Jan 2019 06:34:57 -0000

--_000_SN6PR02MB569357D7F6705F757F805F3796980SN6PR02MB5693namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all ,
I have couple questions about build code

Question 1 :
If  I follow the steps of GITHUB openbmc readme to build code , it always f=
ailed due to bitbake not found as below :
export TEMPLATECONF=3Dmeta-ibm/meta-palmetto/conf

./openbmc-env
brenden@brenden-VirtualBox:~/OCP/openbmc$ bitbake obmc-phosphor-image
WARNING:root:could not open file '/etc/apt/sources.list.d/nodesource.list'
bitbake: command not found

But after I try use :
source ./setup palmetto
Then the build process goes smoothly .What the difference between this two =
method ?

Question 2 :
The build configuration info MACHINE always show "zaius" , even if  build f=
or palmetto and  romulus

Build Configuration:
BB_VERSION           =3D "1.40.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "ubuntu-16.04"
TARGET_SYS           =3D "arm-openbmc-linux-gnueabi"
MACHINE              =3D "zaius"
DISTRO               =3D "openbmc-phosphor"
DISTRO_VERSION       =3D "0.1.0"
TUNE_FEATURES        =3D "arm armv6 thumb arm1176jzs"
TARGET_FPU           =3D "soft"
meta
meta-poky
meta-oe
meta-networking
meta-perl
meta-python
meta-webserver
meta-phosphor
meta-aspeed
meta-openpower
meta-ingrasys
meta-zaius           =3D "master:50ea7cc89521929e29d0836367fa8b06776ce4c2"

Here is my scripts:
For: romulus
source ./setup romulus
bitbake obmc-phosphor-imag
For
               source ./setup palmetto
bitbake obmc-phosphor-imag
Is it a normal behavior or my environment setting wrong ?


Question 3 :
I understand it long time for first build , due to it may install some prer=
equisite
But Why it still take so long time to build while the build target machine =
is different from previous build ?
I saw it take over 5000 task(see below ) just like first build , Does it ma=
ke sense ?

Initialising tasks: 100% |#######################################| Time: 0:=
00:05
Sstate summary: Wanted 1476 Found 0 Missed 1476 Current 345 (0% match, 18% =
complete)
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
Currently  1 running tasks (440 of 5152)   8% |##                          =
    |

Thanks -Brenden





Brenden Lai
SR. BMC Design Engineer
E&I, Jabil Design Services


--_000_SN6PR02MB569357D7F6705F757F805F3796980SN6PR02MB5693namp_
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
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
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
code
	{mso-style-priority:99;
	font-family:"Courier New";}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1024206878;
	mso-list-type:hybrid;
	mso-list-template-ids:-1428018392 -1959858818 67698713 67698715 67698703 6=
7698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.25in;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:1.75in;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.25in;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.75in;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:3.25in;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:3.75in;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.25in;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:4.75in;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all , <o:p></o:p></p>
<p class=3D"MsoNormal">I have couple questions about build code<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Question 1 :<o:p></o:p></p>
<p class=3D"MsoNormal">If &nbsp;I follow the steps of GITHUB openbmc readme=
 to build code , it always failed due to bitbake not found as below :<o:p><=
/o:p></p>
<p class=3D"MsoNormal" style=3D"background:#F6F8FA"><span style=3D"font-siz=
e:10.0pt;font-family:Consolas;color:#24292E;border:none windowtext 1.0pt;pa=
dding:0in">export TEMPLATECONF=3Dmeta-ibm/meta-palmetto/conf<o:p></o:p></sp=
an></p>
<pre style=3D"background:#F6F8FA"><code><span style=3D"font-family:Consolas=
;color:#24292E;border:none windowtext 1.0pt;padding:0in;background:yellow;m=
so-highlight:yellow">./openbmc-env</span></code><span style=3D"font-family:=
Consolas;color:#24292E"><o:p></o:p></span></pre>
<p class=3D"MsoNormal"><i>brenden@brenden-VirtualBox:~/OCP/openbmc$ bitbake=
 obmc-phosphor-image<o:p></o:p></i></p>
<p class=3D"MsoNormal"><i>WARNING:root:could not open file '/etc/apt/source=
s.list.d/nodesource.list'<o:p></o:p></i></p>
<p class=3D"MsoNormal"><i>bitbake: command not found<o:p></o:p></i></p>
<p class=3D"MsoNormal"><i><o:p>&nbsp;</o:p></i></p>
<p class=3D"MsoNormal">But after I try use :<o:p></o:p></p>
<p class=3D"MsoNormal"><i>source ./setup palmetto <o:p></o:p></i></p>
<p class=3D"MsoNormal">Then the build process goes smoothly .What the diffe=
rence between this two method ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Question 2 :<o:p></o:p></p>
<p class=3D"MsoNormal">The build configuration info MACHINE always show &#8=
220;zaius&#8221; , even if &nbsp;build for palmetto and &nbsp;romulus
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Build Configuration:<o:p></o:p></p>
<p class=3D"MsoNormal">BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =3D &quot;1.40.0&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;x86_64-linux&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">NATIVELSBSTRING&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &q=
uot;ubuntu-16.04&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =3D &quot;arm-openbmc-linux-gnueabi&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;zaius&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;openbmc-phosphor&quot;<o:p=
></o:p></p>
<p class=3D"MsoNormal">DISTRO_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D &quot;0.1.0&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; =3D &quot;arm armv6 thumb arm1176jzs&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =3D &quot;soft&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">meta-poky&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">meta-oe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">meta-networking&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p><=
/o:p></p>
<p class=3D"MsoNormal">meta-perl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">meta-python&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">meta-webserver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <=
o:p></o:p></p>
<p class=3D"MsoNormal">meta-phosphor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; <o:p></o:p></p>
<p class=3D"MsoNormal">meta-aspeed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">meta-openpower&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <=
o:p></o:p></p>
<p class=3D"MsoNormal">meta-ingrasys&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; <o:p></o:p></p>
<p class=3D"MsoNormal">meta-zaius&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =3D &quot;master:50ea7cc89521929e29d0836367fa8b06776ce4c=
2&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><i><o:p>&nbsp;</o:p></i></p>
<p class=3D"MsoNormal">Here is my scripts:<o:p></o:p></p>
<p class=3D"MsoNormal"><i>For: romulus<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><i>source ./setup romulus=
<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><i>bitbake obmc-phosphor-=
imag<o:p></o:p></i></p>
<p class=3D"MsoNormal"><i>For <o:p></o:p></i></p>
<p class=3D"MsoNormal"><i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source ./setup </i>palmetto<o:p></o:p><=
/p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><i>bitbake obmc-phosphor-=
imag <o:p>
</o:p></i></p>
<p class=3D"MsoNormal">Is it a normal behavior or my environment setting wr=
ong ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Question 3 :<o:p></o:p></p>
<p class=3D"MsoNormal">I understand it long time for first build , due to i=
t may install some prerequisite
<o:p></o:p></p>
<p class=3D"MsoNormal">But Why it still take so long time to build while th=
e build target machine is different from previous build ?<o:p></o:p></p>
<p class=3D"MsoNormal">I saw it take over 5000 task(see below ) just like f=
irst build , Does it make sense ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Initialising tasks: 100% |##########################=
#############| Time: 0:00:05<o:p></o:p></p>
<p class=3D"MsoNormal">Sstate summary: Wanted 1476 Found 0 Missed 1476 Curr=
ent 345 (0% match, 18% complete)<o:p></o:p></p>
<p class=3D"MsoNormal">NOTE: Executing SetScene Tasks<o:p></o:p></p>
<p class=3D"MsoNormal">NOTE: Executing RunQueue Tasks<o:p></o:p></p>
<p class=3D"MsoNormal">Currently&nbsp; 1 running tasks (440 of <span style=
=3D"background:yellow;mso-highlight:yellow">
5152</span>)&nbsp;&nbsp; 8% |##&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal"><i>Thanks -Brenden<o:p></o:p></i></p>
<p class=3D"MsoNormal"><i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></i></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><i><o:p>&nbsp;</o:p></i></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:10.0pt;color:black">Brenden Lai<br>
SR. BMC Design Engineer<br>
</span><span style=3D"font-size:10.0pt;color:#222222">E&amp;I, Jabil Design=
 Services</span><span style=3D"font-size:10.0pt;color:black"><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SN6PR02MB569357D7F6705F757F805F3796980SN6PR02MB5693namp_--
