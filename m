Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.94; helo=esa3.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="n68QnE+0"; 
 dkim-atps=neutral
Received: from esa3.dell-outbound.iphmx.com (esa3.dell-outbound.iphmx.com
 [68.232.153.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zL53g3142zF0TF
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 07:46:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1516049163; x=1547585163;
 h=from:to:subject:date:message-id:mime-version;
 bh=hCpTRimnnfmBpPPPHK0BxYIOfE4UiUkEPJeN/zSEKho=;
 b=n68QnE+0jS+eC7uHjH3oiT8Mgq1cH0NGU8NiRJwOri9F12Vyoqs/FUZg
 cgmBNS1NSr4JHmGdvCQY7KwnOd0mBknyvf9JbP8G//y31TOhdRAWjMfwp
 QlGOk6ebfCj0/IQGn7jlNzacKdbmrLzOh2MrIkF58g3Jp+jGcyB6KZ6dW Q=;
IronPort-PHdr: =?us-ascii?q?9a23=3A6TOQkBwcDmUxxU/XCy+O+j09IxM/srCxBDY+r6Qd?=
 =?us-ascii?q?1OITIJqq85mqBkHD//Il1AaPAd2Craocw8Pt8InYEVQa5piAtH1QOLdtbDQizf?=
 =?us-ascii?q?ssogo7HcSeAlf6JvO5JwYzHcBFSUM3tyrjaRsdF8nxfUDdrWOv5jAOBBr/KRB1?=
 =?us-ascii?q?JuPoEYLOksi7ze+/94HObwlSmDaxfa55IQmrownWqsQYm5ZpJLwryhvOrHtIeu?=
 =?us-ascii?q?BWyn1tKFmOgRvy5dq+8YB6/ShItP0v68BPUaPhf6QlVrNYFygpM3o05MLwqxbO?=
 =?us-ascii?q?SxaE62YGXWUXlhpIBBXF7A3/U5zsvCb2qvZx1S+HNsDwULs6Wymt771zRRHoli?=
 =?us-ascii?q?kJKiI5/m/UhMxxkK1UrwmsqAZjz47WeoyZKOZycr3bcNgHRWRBRMFRVylZD467?=
 =?us-ascii?q?aIUPDvYOPeZCoIbjo1sCtxSwCROxCeP1zT9JiHn20LYn3Os/FQHG2BYsEM4JsH?=
 =?us-ascii?q?TRtdj4MroZX+OtzKTQzDjObOla1Snz5YTWaBwtvPGBULxqfcbP1UUjChvJgkiM?=
 =?us-ascii?q?pYD/Ij+Y2eoAv3KG4+djT+6iiG8qpxlsrjWgyMogkJTFi4MUx1ze6Cl0z4U4Kc?=
 =?us-ascii?q?emREJnYNOpFoZbuTuAOItsWMwiRnlluCM9yrIbp5G2ZDMKyJE7xx7HbPyHbpSI?=
 =?us-ascii?q?7grjVOmPJTd4g2pod6ykhxmo7ESs0PDzWdew0FZOtyZFlcTMtmwW2BzU98iHTO?=
 =?us-ascii?q?Zy8lm71TaOzwDT6uREIE8umaXHLJ4hx6Y8lpsVsUvdAi/7gET7gayMekk69OWk?=
 =?us-ascii?q?9f7rbqjmq5KSLYN4lB3yPrk2lsy6G+s4MwwOX2aB+eS70b3u5Ur3QLRWgf02iK?=
 =?us-ascii?q?bWrpTaKd4UqKKjHgJVyIEj6hi5Dzq9zdsXg30HLFZfdB2biIjpPknCIOrkAven?=
 =?us-ascii?q?n1SsjDBryujBPr35HJrNKGPMkLL9crtm705cyREzzcxE555ODbEAIfbzVVXqu9?=
 =?us-ascii?q?zDFBM5NBa0w+m0QOl6g9cZQW+JCKqSGKfTqkOToOU9J+CGf8kSojmreNY/4Pu7?=
 =?us-ascii?q?2Vo4kl8UcK3v8N09cnenGNxqLkGdJ3Hrh4FSQi8xogMiQbmy2xW5WjlJaiPqUg?=
 =?us-ascii?q?=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HCAQBMEl1ah8mZ6ERcGwEBAQEDAQEBC?=
 =?us-ascii?q?QEBAYJKgU0QdC6dD4J+gQSNQooACooOQhUBAQEBAQEBAQEBAhABAQEKCwkIKC+?=
 =?us-ascii?q?COCKCUS1eAUBmAQQbiUdkqxmJe4ZRg0CCeItUBYo9mScKgXWTQ4IikXeKaIw9g?=
 =?us-ascii?q?Tw1gXRvgn2CAwxEEAyBZ4xtgRcBAQE?=
X-IPAS-Result: =?us-ascii?q?A2HCAQBMEl1ah8mZ6ERcGwEBAQEDAQEBCQEBAYJKgU0QdC6?=
 =?us-ascii?q?dD4J+gQSNQooACooOQhUBAQEBAQEBAQEBAhABAQEKCwkIKC+COCKCUS1eAUBmA?=
 =?us-ascii?q?QQbiUdkqxmJe4ZRg0CCeItUBYo9mScKgXWTQ4IikXeKaIw9gTw1gXRvgn2CAwx?=
 =?us-ascii?q?EEAyBZ4xtgRcBAQE?=
Received: from esa1.dell-outbound2.iphmx.com ([68.232.153.201])
 by esa3.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2018 14:45:59 -0600
From: <Michael.E.Brown@dell.com>
Received: from ausc60ps301.us.dell.com ([143.166.148.206])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2018 02:45:55 +0600
X-LoopCount0: from 10.166.136.217
X-IronPort-AV: E=Sophos;i="5.46,365,1511848800"; 
 d="scan'208,217";a="1083401332"
X-DLP: DLP_GlobalPCIDSS
To: <openbmc@lists.ozlabs.org>
Subject: Notes from Non-root presentation/demo
Thread-Topic: Notes from Non-root presentation/demo
Thread-Index: AdOLAGRR7+KoyfjcScyC/TxqKwSWyAABLHYg
Date: Mon, 15 Jan 2018 20:46:02 +0000
Message-ID: <4526c79274ff4780b3b2e79fd816379f@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: multipart/alternative;
 boundary="_000_4526c79274ff4780b3b2e79fd816379fausx13mps334AMERDELLCOM_"
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jan 2018 20:46:08 -0000

--_000_4526c79274ff4780b3b2e79fd816379fausx13mps334AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Here are the notes from the non-root presentation that we did last week.

TODO: send doc patches. (AI: Michael)

Phosphor-systemd bbclass - ties together these steps. Need more info here.
Add snippet to add udev rule for group ownership.

Overall:

-          Every daemon should run as its own user

-          Use common group ownership to control access to files that must =
be accessed by multiple daemons

-          Usually don't need to use ACLs, if you think you need them, prob=
ably should rethink things

-          Use group owner on /dev/ entries to control which daemons can op=
en which hardware

-          Udev usually has "reasonable" ownership groups that you can use.=
 Slightly prefer just using those unless they are grossly inappropriate. (l=
ess work)

-          Use udev rule addons to adjust group/owner for dev entries if ab=
solutely necessary

-          For network listening daemons: use the systemd port units to let=
 systemd listen for you. (systemd socket activation)

-          Use systemd-tmpfiles to set up runtime paths with the correct pe=
rmissions

-          Use useradd-staticids bbclass to add users

Code:

-          "most" code doesn't need to change. Except for daemons that do i=
nteresting things like listen on network ports. Use socket activation there

-          Use systemd bus activation for dbus services, where possible

-          Use systemd to specify user to run as, where possible. This mean=
s that your code can't have any vulnerabilities before you drop root becaus=
e it's never root.

-          Use systemd daemon model (don't fork). Makes debugging easier.

-          System calls that are likely to fail when you switch from root t=
o non-root: open(), access(), stat()

o   Grep for open and variants to prep

Implementation

-          Run service from command line: strace -o /tmp/output.txt -f /pat=
h/to/service -service-options

-          Look through output.txt to see failing system calls


Putting it in the build:

-          Add user in recipe
# users and group for the Policy Daemons
GROUPADD_PARAM_${PN} =3D " -o -g 974 policy "
USERADD_PARAM_${PN} =3D "-u 987 -M -s /bin/false -o -g policy policyd"


-          Update systemd service file
User=3Dpolicyd
Group=3Dpolicyd
SupplementaryGroups=3Dfoo bar baz


-          Add systemd-tmpfiles

-          Add udev rules if necessary

-          PROFIT

Project ideas:

-          Non-root working group?

-          Requirements for all new daemons to be non-root before acceptanc=
e?

-          Remediation ideas for current code?

--_000_4526c79274ff4780b3b2e79fd816379fausx13mps334AMERDELLCOM_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1098410543;
	mso-list-type:hybrid;
	mso-list-template-ids:-1838658966 -709865212 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.25in;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.75in;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.25in;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.75in;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:3.25in;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:3.75in;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.25in;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.75in;
	text-indent:-.25in;
	font-family:Wingdings;}
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Here are the notes fro=
m the non-root presentation that we did last week.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">TODO: send doc patches=
. (AI: Michael)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Phosphor-systemd bbcla=
ss &#8211; ties together these steps. Need more info here.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Add snippet to add ude=
v rule for group ownership.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Overall:<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Every daemon should run as its own user<o:p></o:p><=
/p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Use common group ownership to control access to fil=
es that must be accessed by multiple daemons<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Usually don&#8217;t need to use ACLs, if you think =
you need them, probably should rethink things<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Use group owner on /dev/ entries to control which d=
aemons can open which hardware<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Udev usually has &#8220;reasonable&#8221; ownership=
 groups that you can use. Slightly prefer just using those unless they are =
grossly inappropriate. (less work)<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Use udev rule addons to adjust group/owner for dev =
entries if absolutely necessary<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>For network listening daemons: use the systemd port=
 units to let systemd listen for you. (systemd socket activation)<o:p></o:p=
></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Use systemd-tmpfiles to set up runtime paths with t=
he correct permissions<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Use useradd-staticids bbclass to add users<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Code:<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>&#8220;most&#8221; code doesn&#8217;t need to chang=
e. Except for daemons that do interesting things like listen on network por=
ts. Use socket activation there<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Use systemd bus activation for dbus services, where=
 possible<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Use systemd to specify user to run as, where possib=
le. This means that your code can&#8217;t have any vulnerabilities before y=
ou drop root because it&#8217;s never root.<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Use systemd daemon model (don&#8217;t fork). Makes =
debugging easier.<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>System calls that are likely to fail when you switc=
h from root to non-root: open(), access()<span style=3D"color:#1F497D">, st=
at()</span><o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:1.25in;text-indent:-.25i=
n;mso-list:l0 level2 lfo2">
<![if !supportLists]><span style=3D"font-family:&quot;Courier New&quot;"><s=
pan style=3D"mso-list:Ignore">o<span style=3D"font:7.0pt &quot;Times New Ro=
man&quot;">&nbsp;&nbsp;
</span></span></span><![endif]>Grep for open and variants to prep<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Implementation<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Run service from command line: strace &#8211;o /tmp=
/output.txt &#8211;f /path/to/service &#8211;service-options<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Look through output.txt to see failing system calls=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Putting it in the build:<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Add user in recipe<o:p></o:p></p>
<p class=3D"MsoNormal"># users and group for the Policy Daemons<o:p></o:p><=
/p>
<p class=3D"MsoNormal">GROUPADD_PARAM_${PN} =3D &quot; -o -g 974 policy &qu=
ot;<o:p></o:p></p>
<p class=3D"MsoNormal">USERADD_PARAM_${PN} =3D &quot;-u 987 -M -s /bin/fals=
e -o -g policy policyd&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Update systemd service file<o:p></o:p></p>
<p class=3D"MsoNormal">User=3Dpolicyd<o:p></o:p></p>
<p class=3D"MsoNormal">Group=3Dpolicyd<o:p></o:p></p>
<p class=3D"MsoNormal">SupplementaryGroups=3Dfoo bar baz<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Add systemd-tmpfiles<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Add udev rules if necessary<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>PROFIT<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Project ideas:<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Non-root working group?<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Requirements for all new daemons to be non-root bef=
ore acceptance?<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Remediation ideas for current code? <o:p></o:p></p>
</div>
</body>
</html>

--_000_4526c79274ff4780b3b2e79fd816379fausx13mps334AMERDELLCOM_--
