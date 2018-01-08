Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.229; helo=esa6.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="dEYJAUsa"; 
 dkim-atps=neutral
Received: from esa6.dell-outbound.iphmx.com (esa6.dell-outbound.iphmx.com
 [68.232.149.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zFkV71g7PzDqHN
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2018 05:35:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1515436527; x=1546972527;
 h=from:to:subject:date:message-id:mime-version;
 bh=DTs7E6rkvk7xEB+Zn6DAlDjcXqpNWVMw7zv6pSpHY0Q=;
 b=dEYJAUsaKjQ9vUTLQu12dSef6U4cqCfxaVsW+9R1GAD3OOrj8tRvi/25
 Y/wOX+Cs92sT/9zo4YLmOPA5AUIJ9wK5MCYh48SxdbnnYkri2M6hx3Zc/
 swN7wW3GVrJ0LFH5guWejY8RL/YpG6SFv59EQ/z1JPugXUCMYHksqZUqt o=;
IronPort-PHdr: =?us-ascii?q?9a23=3AKG0QOhCDiOinHVZV0jajUyQJP3N1i/DPJgcQr6Af?=
 =?us-ascii?q?oPdwSPvzpsbcNUDSrc9gkEXOFd2Cra4c0qyO6+jJYi8p2d65qncMcZhBBVcuqP?=
 =?us-ascii?q?49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx7xKRR6?=
 =?us-ascii?q?JvjvGo7Vks+7y/2+94fcbglUmTaxe69+IAmrpgjNq8cahpdvJLwswRXTuHtIfO?=
 =?us-ascii?q?pWxWJsJV2Nmhv3+9m98p1+/SlOovwt78FPX7n0cKQ+VrxYES8pM3sp683xtBnM?=
 =?us-ascii?q?VhWA630BWWgLiBVIAgzF7BbnXpfttybxq+Rw1DWGMcDwULs5Xymp4aV2Rx/ykC?=
 =?us-ascii?q?oJNyA3/nzLisJ+j6xboQ6uqBNkzoHOfI2VNuBzcr/Bcd8EQ2dKQ8ZfVzZGAoO5?=
 =?us-ascii?q?d4YCCO0PPedEoIn9vVQBsx++CROjCu/11zJInHj23KM80+k6DA7JwgggH9YUvH?=
 =?us-ascii?q?vIq9X1Mb4fXOaox6fL1TXOd/Jb1DTn5ITWfB0tv+uAUa9wfMfe00UiEwDIgk2N?=
 =?us-ascii?q?pYD5JT+Zy+sAvmaB4+Z9Vu+jkW0qpgBprjSyycohhJPFip8Ux13F7yl13Yk4KN?=
 =?us-ascii?q?6iREJlf9KpHp1dvDyAOYRsWMMtWWRotT4/yr0BpJG0YjAHyI8ixx7Dc/yHdJWI?=
 =?us-ascii?q?4g77WOaRPzh4gHVldaqhiBap60etxffwWdSq31ZOqipJi97Mtm0R1xPI7ciHV/?=
 =?us-ascii?q?198Vq/1TqV1gDT8uFEIUU7lKbBN5EhxbswmoISsUTFACD2hF37ga6Ve0k+5OSl?=
 =?us-ascii?q?5frrbq/7qpKcOIJ4kAXzP6c2lsy6G+s4MwwOX2aB+eS70b3u5Ur3QLRWgf02iK?=
 =?us-ascii?q?bWrpTaKd4UqKKjHgJVyIEj6hi5Dzq9zdsXg30HLFZfdB2biIjpPknCIOrkAven?=
 =?us-ascii?q?n1SsjDBryujBPr35HJrNKGPMkLL9crtm705cyREzzcxE555ODbEAIfbzVVXqu9?=
 =?us-ascii?q?zDFBM5NBa0w+m0QOl6g9cZQW+JCKqSGKfTqkOToOU9J+CGf8kSojmreNY/4Pu7?=
 =?us-ascii?q?2Vo4kl8UcK3v8N09cnenGNxqLkGdJ3Hrh4FSQi8xogMiQbmy2xW5WjlJaiPqUg?=
 =?us-ascii?q?=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EoAQBGuVNah2Ka6ERdGgEBAQEBAgEBA?=
 =?us-ascii?q?QEIAQEBAYJKgUsQdC6dB4QDjUCHfYIBColzQhUBAQEBAQEBAQEBAhABAQEKCwk?=
 =?us-ascii?q?IKC+COCKCbhBeATVxAQQbFIkxZLF5imWGNYM/iAeBBA2CDgyDFgWjXgqVK5QSl?=
 =?us-ascii?q?xeBPDWBdG+CfYIDAQsBU4FzilCBFwEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2EoAQBGuVNah2Ka6ERdGgEBAQEBAgEBAQEIAQEBAYJKgUs?=
 =?us-ascii?q?QdC6dB4QDjUCHfYIBColzQhUBAQEBAQEBAQEBAhABAQEKCwkIKC+COCKCbhBeA?=
 =?us-ascii?q?TVxAQQbFIkxZLF5imWGNYM/iAeBBA2CDgyDFgWjXgqVK5QSlxeBPDWBdG+CfYI?=
 =?us-ascii?q?DAQsBU4FzilCBFwEBAQ?=
Received: from esa4.dell-outbound2.iphmx.com ([68.232.154.98])
 by esa6.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2018 12:35:24 -0600
From: <Michael.E.Brown@dell.com>
Received: from ausxipps301.us.dell.com ([143.166.148.223])
 by esa4.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2018 00:35:24 +0600
X-LoopCount0: from 10.166.136.210
X-IronPort-AV: E=Sophos;i="5.46,330,1511848800"; 
 d="scan'208,217";a="110626461"
X-DLP: DLP_GlobalPCIDSS
To: <openbmc@lists.ozlabs.org>
Subject: NonRoot discussion at Hackathon - call for input
Thread-Topic: NonRoot discussion at Hackathon - call for input
Thread-Index: AdOIrl+8QooGqY0qRvefNc8ZHLG1lQ==
Date: Mon, 8 Jan 2018 18:35:23 +0000
Message-ID: <4d8698c2591544cb98b06faa527935b2@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: multipart/alternative;
 boundary="_000_4d8698c2591544cb98b06faa527935b2ausx13mps334AMERDELLCOM_"
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
X-List-Received-Date: Mon, 08 Jan 2018 18:35:28 -0000

--_000_4d8698c2591544cb98b06faa527935b2ausx13mps334AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello (again) to everybody going to the hackathon. I'm currently scheduled =
for an hour talk on Thursday on root/nonroot security.

What would be the best way to make this hour the most productive hour we ca=
n have on this topic?

My background: I led the conversion effort for Dell IDRAC to move our entir=
e infrastructure away from running daemons as root, and instead run each da=
emon under a distinct user account. I provided technical backstop as indivi=
dual teams took over the efforts for their daemons and provided training an=
d design support to ensure that the effort went as smoothly as possible. Ou=
r currently shipping Dell IDRAC has most of this work present in our shippi=
ng product, with a few remaining daemons rolling into upcoming releases.

What I might suggest would be helpful:

-          Slides on examples

o   Running daemon

o   Setting up user accounts for daemons

o   Setting up tmpfiles rules

o   Setting up DBUS security

o   Udev rules to set up /dev/ permissions and ownership (if needed)

-          Hands-on: actually hacking live on some daemons to try to get so=
me converted to non-root

I'm open to using this hour however people feel it would be most helpful an=
d will get some slides written to cover some of the above.

Thoughts?

--
Michael Brown
Dell EMC

--_000_4d8698c2591544cb98b06faa527935b2ausx13mps334AMERDELLCOM_
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
/* List Definitions */
@list l0
	{mso-list-id:68117380;
	mso-list-type:hybrid;
	mso-list-template-ids:1572790378 687348188 67698691 67698693 67698689 6769=
8691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
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
<p class=3D"MsoNormal">Hello (again) to everybody going to the hackathon. I=
&#8217;m currently scheduled for an hour talk on Thursday on root/nonroot s=
ecurity.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What would be the best way to make this hour the mos=
t productive hour we can have on this topic?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My background: I led the conversion effort for Dell =
IDRAC to move our entire infrastructure away from running daemons as root, =
and instead run each daemon under a distinct user account. I provided techn=
ical backstop as individual teams
 took over the efforts for their daemons and provided training and design s=
upport to ensure that the effort went as smoothly as possible. Our currentl=
y shipping Dell IDRAC has most of this work present in our shipping product=
, with a few remaining daemons rolling
 into upcoming releases.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What I might suggest would be helpful:<o:p></o:p></p=
>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Slides on examples<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:1.25in;text-indent:-.25i=
n;mso-list:l0 level2 lfo1">
<![if !supportLists]><span style=3D"font-family:&quot;Courier New&quot;"><s=
pan style=3D"mso-list:Ignore">o<span style=3D"font:7.0pt &quot;Times New Ro=
man&quot;">&nbsp;&nbsp;
</span></span></span><![endif]>Running daemon<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:1.25in;text-indent:-.25i=
n;mso-list:l0 level2 lfo1">
<![if !supportLists]><span style=3D"font-family:&quot;Courier New&quot;"><s=
pan style=3D"mso-list:Ignore">o<span style=3D"font:7.0pt &quot;Times New Ro=
man&quot;">&nbsp;&nbsp;
</span></span></span><![endif]>Setting up user accounts for daemons<o:p></o=
:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:1.25in;text-indent:-.25i=
n;mso-list:l0 level2 lfo1">
<![if !supportLists]><span style=3D"font-family:&quot;Courier New&quot;"><s=
pan style=3D"mso-list:Ignore">o<span style=3D"font:7.0pt &quot;Times New Ro=
man&quot;">&nbsp;&nbsp;
</span></span></span><![endif]>Setting up tmpfiles rules<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:1.25in;text-indent:-.25i=
n;mso-list:l0 level2 lfo1">
<![if !supportLists]><span style=3D"font-family:&quot;Courier New&quot;"><s=
pan style=3D"mso-list:Ignore">o<span style=3D"font:7.0pt &quot;Times New Ro=
man&quot;">&nbsp;&nbsp;
</span></span></span><![endif]>Setting up DBUS security<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:1.25in;text-indent:-.25i=
n;mso-list:l0 level2 lfo1">
<![if !supportLists]><span style=3D"font-family:&quot;Courier New&quot;"><s=
pan style=3D"mso-list:Ignore">o<span style=3D"font:7.0pt &quot;Times New Ro=
man&quot;">&nbsp;&nbsp;
</span></span></span><![endif]>Udev rules to set up /dev/ permissions and o=
wnership (if needed)<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Hands-on: actually hacking live on some daemons to =
try to get some converted to non-root<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m open to using this hour however people fee=
l it would be most helpful and will get some slides written to cover some o=
f the above.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thoughts?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">--<br>
Michael Brown<o:p></o:p></p>
<p class=3D"MsoNormal">Dell EMC<o:p></o:p></p>
</div>
</body>
</html>

--_000_4d8698c2591544cb98b06faa527935b2ausx13mps334AMERDELLCOM_--
