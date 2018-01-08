Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.218; helo=esa8.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="WoaXn9z0"; 
 dkim-atps=neutral
Received: from esa8.dell-outbound.iphmx.com (esa8.dell-outbound.iphmx.com
 [68.232.149.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zFkJY3JNYzF0Q3
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2018 05:27:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1515436029; x=1546972029;
 h=from:to:subject:date:message-id:mime-version;
 bh=l9+OJE/1Gah/PMUw4TtRsaemFr0bXKJeO4xUUvWG+8A=;
 b=WoaXn9z0TQgkh50X42e1Q4lWZXLVTRTZ+mLApGjAOg0O51xdMVNUnR2F
 owO3YZubKtNNFnZ9poOAG68j3TvGyR7UZrk2ijMuQAgdyxZcQwIDzMJJU
 Wt2ZnaRmwpY4+WhByxiB0otYV3/D+v2Wvu9BaZrcKIVTQc1v4pV5XwuFm Q=;
IronPort-PHdr: =?us-ascii?q?9a23=3ArgvbixSupRocEF7QO7BDicJijtpsv+yvbD5Q0YIu?=
 =?us-ascii?q?jvd0So/mwa69bBWN2/xhgRfzUJnB7Loc0qyK6/mmATRIyK3CmUhKSIZLWR4BhJ?=
 =?us-ascii?q?detC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBxrwKxd+?=
 =?us-ascii?q?KPjrFY7OlcS30P2594HObwlSizexfa5+IA+qoQnNq8IbnZZsJqEtxxXTv3BGYf?=
 =?us-ascii?q?5WxWRmJVKSmxbz+MK994N9/ipTpvws6ddOXb31cKokQ7NYCi8mM30u683wqRbD?=
 =?us-ascii?q?VwqP6WACXWgQjxFFHhLK7BD+Xpf2ryv6qu9w0zSUMMHqUbw5Xymp4qF2QxHqlS?=
 =?us-ascii?q?gHLSY0/mHJhMJtkKJVrhGvpx1jzIHbe4yaLuZyfqHHcN8GWWZNQMBcXDFBDIOm?=
 =?us-ascii?q?aIsPCvIMMOFfoYn8u1QOrQGxCheoBO/1xTFEnGL73bc90+UvFwHLxxEvEMwKsH?=
 =?us-ascii?q?TQttn6KKASUeWswaTO0D7NbOtW1C/85YXLaBwtv/+BUaxqfcbMyUQiGBnJg1GT?=
 =?us-ascii?q?pID9Ij+Zyv4Bv3WU4uduT+6jlm0qpxtyrzWu3ssgl4bEi4wPxlzZ9Ch0wZw5Kc?=
 =?us-ascii?q?C3RUN4e9KoDZtduiCcOoBrWM0tWXtotzw/yrAevJ67ezUFx4o/yh7EbvyHb5CI?=
 =?us-ascii?q?4hX+VOaNOTt4hGxqeLa4hxuq70eg0ffzW8au3FlXsCVFlt3MumkK1xzO9siIUf?=
 =?us-ascii?q?x9/lqn2TmSyQzf8OBEIVg0lareJJ8t2KI/lp0WsUjbHy/2nlv5jLOOe0gl+eWk?=
 =?us-ascii?q?8frrb7v4qpOGKoN5ig7zPr4ql8G8Geg4NxIBX2mf+eSyzr3j+kj5Ta1NgP03jq?=
 =?us-ascii?q?bZsIrVKtofpqKjDAFZyJsu6wy4Dzao1tQVhmQII0xBeBKDlYTmJ1bOIPXgAfel?=
 =?us-ascii?q?n1usiCtrx+zBPrD5BZXNNmbMkLH6crZ490FR0w4zzdFE55JIEbENOvXzW071tN?=
 =?us-ascii?q?PCFRA5KBa4w+H9CNVyhcsiXjfbBbeUNqnXuneM5/kzOK+Ldoscsi27LOIqsa3A?=
 =?us-ascii?q?l3g8zAs4fKKp1JYTLl3+NO5hPEOxbXfohpEKFmJc7Vl2d/DjlFDXCW0bXH21Ra?=
 =?us-ascii?q?9pvjw=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EoAQCvtlNah2Ka6ERdGgEBAQEBAgEBA?=
 =?us-ascii?q?QEIAQEBAYJKgUsQdC6dB4QDjUCJfgqJc0MUAQEBAQEBAQEBAQIQAQEBCgsJCCg?=
 =?us-ascii?q?vgjgigm4QXgGBJgEEGwyJOWSyGIpkhjWMV4IODIMWBYpwmG4KlSuUEpcXgTw2g?=
 =?us-ascii?q?XNvgn2CAwEBCAIBQxAMgWeKUIEXAQEB?=
X-IPAS-Result: =?us-ascii?q?A2EoAQCvtlNah2Ka6ERdGgEBAQEBAgEBAQEIAQEBAYJKgUs?=
 =?us-ascii?q?QdC6dB4QDjUCJfgqJc0MUAQEBAQEBAQEBAQIQAQEBCgsJCCgvgjgigm4QXgGBJ?=
 =?us-ascii?q?gEEGwyJOWSyGIpkhjWMV4IODIMWBYpwmG4KlSuUEpcXgTw2gXNvgn2CAwEBCAI?=
 =?us-ascii?q?BQxAMgWeKUIEXAQEB?=
Received: from esa4.dell-outbound2.iphmx.com ([68.232.154.98])
 by esa8.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2018 12:27:05 -0600
From: <Michael.E.Brown@dell.com>
Received: from ausxipps306.us.dell.com ([143.166.148.156])
 by esa4.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2018 00:27:04 +0600
X-LoopCount0: from 10.166.136.210
X-IronPort-AV: E=Sophos;i="5.46,330,1511848800"; 
 d="scan'208,217";a="196804814"
X-DLP: DLP_GlobalPCIDSS
To: <openbmc@lists.ozlabs.org>
Subject: SELinux discussion at Hackathon - call for input
Thread-Topic: SELinux discussion at Hackathon - call for input
Thread-Index: AdOIrjAMnz3M73//SiKbQbJffTRl1Q==
Date: Mon, 8 Jan 2018 18:27:03 +0000
Message-ID: <016614e372d440c0b2f0970d048bd477@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: multipart/alternative;
 boundary="_000_016614e372d440c0b2f0970d048bd477ausx13mps334AMERDELLCOM_"
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
X-List-Received-Date: Mon, 08 Jan 2018 18:27:10 -0000

--_000_016614e372d440c0b2f0970d048bd477ausx13mps334AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello to everybody who is going to the hackathon. I currently am scheduled =
for an hour to talk about SELinux on Wed.

What would people like to know? What is the best possible use of this hour,=
 and what does everybody want to walk away with at the end?

My background: I led the implementation of a full SELinux policy implementa=
tion for Dell IDRAC which will be delivered in our product starting later t=
his year. I did the initial work of setting up the implementation strategy,=
 did much of the initial work to get everything building, and then supervis=
ed the implementation. Where I'm less strong right now is actual details of=
 writing policy, as I've largely let our lead devs on the selinux team writ=
e the actual policy for the past 2 years of implementation effort.

What I might suggest would be helpful:

-          Outline of build requirements for selinux

-          Example implementation strategy

-          Example project development rules for dealing with selinux

However, I'm completely open on this to talk about whatever the community f=
olks would find helpful. I can do a slideware presentation or a Q&A format,=
 or a mix of both.

Thoughts? How can I make this something everybody takes away something posi=
tive from?
--
Michael Brown
Dell EMC

--_000_016614e372d440c0b2f0970d048bd477ausx13mps334AMERDELLCOM_
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
	{mso-list-id:492262502;
	mso-list-type:hybrid;
	mso-list-template-ids:-919855306 207390292 67698691 67698693 67698689 6769=
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
<p class=3D"MsoNormal">Hello to everybody who is going to the hackathon. I =
currently am scheduled for an hour to talk about SELinux on Wed.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What would people like to know? What is the best pos=
sible use of this hour, and what does everybody want to walk away with at t=
he end?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My background: I led the implementation of a full SE=
Linux policy implementation for Dell IDRAC which will be delivered in our p=
roduct starting later this year. I did the initial work of setting up the i=
mplementation strategy, did much of
 the initial work to get everything building, and then supervised the imple=
mentation. Where I&#8217;m less strong right now is actual details of writi=
ng policy, as I&#8217;ve largely let our lead devs on the selinux team writ=
e the actual policy for the past 2 years of
 implementation effort.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What I might suggest would be helpful:<o:p></o:p></p=
>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Outline of build requirements for selinux<o:p></o:p=
></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Example implementation strategy<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>Example project development rules for dealing with =
selinux<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">However, I&#8217;m completely open on this to talk a=
bout whatever the community folks would find helpful. I can do a slideware =
presentation or a Q&amp;A format, or a mix of both.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thoughts? How can I make this something everybody ta=
kes away something positive from?<o:p></o:p></p>
<p class=3D"MsoNormal">--<o:p></o:p></p>
<p class=3D"MsoNormal">Michael Brown<o:p></o:p></p>
<p class=3D"MsoNormal">Dell EMC<o:p></o:p></p>
</div>
</body>
</html>

--_000_016614e372d440c0b2f0970d048bd477ausx13mps334AMERDELLCOM_--
