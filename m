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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40n46L1jh9zF284
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 07:23:11 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 May 2018 14:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,412,1520924400"; 
 d="scan'208,217";a="200301195"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
 by orsmga004.jf.intel.com with ESMTP; 17 May 2018 14:23:05 -0700
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
 ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Thu, 17 May 2018 14:23:04 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.24]) by
 ORSMSX111.amr.corp.intel.com ([169.254.12.244]) with mapi id 14.03.0319.002;
 Thu, 17 May 2018 14:23:04 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Yugi Mani <yupalani@microsoft.com>, "Michael.E.Brown@dell.com"
 <Michael.E.Brown@dell.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>,
 "hramasub@in.ibm.com" <hramasub@in.ibm.com>, "Balaji.B.Rao@dell.com"
 <Balaji.B.Rao@dell.com>, "bradleyb@fuzziesquirrel.com"
 <bradleyb@fuzziesquirrel.com>, "pradeep.kumar36@tcs.com"
 <pradeep.kumar36@tcs.com>, "rolfb@us.ibm.com" <rolfb@us.ibm.com>, Chris Ong
 <Chris.Ong@microsoft.com>, Ali Larijani <alirhas@microsoft.com>
Subject: RE: Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group
 working call
Thread-Topic: Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group
 working call
Thread-Index: AdPsYkRv1Xl4DXIGTxCVOcJsabY0fQBvTmKAAAE0gxA=
Date: Thu, 17 May 2018 21:23:04 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169933A0B9D1A@ORSMSX114.amr.corp.intel.com>
References: <0af13b580c2e4930a98204349822a82b@ausx13mps334.AMER.DELL.COM>
 <MWHPR21MB086447F0749C77694C01B331D6910@MWHPR21MB0864.namprd21.prod.outlook.com>
In-Reply-To: <MWHPR21MB086447F0749C77694C01B331D6910@MWHPR21MB0864.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: request-justification,no-action
x-originating-ip: [10.22.254.138]
Content-Type: multipart/alternative;
 boundary="_000_7E9441B1E5EFFD4681F54958E82169933A0B9D1AORSMSX114amrcor_"
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2018 21:23:23 -0000

--_000_7E9441B1E5EFFD4681F54958E82169933A0B9D1AORSMSX114amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It looks like it just got published on Monday in the 2018.1 Schema drop.  Y=
ou're looking for the Assembly schema "Assembly_v1.xml" posted here:

https://www.dmtf.org/sites/default/files/standards/documents/DSP8010_2018.1=
.zip

-Ed

From: Yugi Mani [mailto:yupalani@microsoft.com]
Sent: Thursday, May 17, 2018 1:45 PM
To: Michael.E.Brown@dell.com; Tanous, Ed <ed.tanous@intel.com>; openbmc@lis=
ts.ozlabs.org; Paul.Vancil@dell.com; hramasub@in.ibm.com; Balaji.B.Rao@dell=
.com; bradleyb@fuzziesquirrel.com; pradeep.kumar36@tcs.com; rolfb@us.ibm.co=
m; Chris Ong <Chris.Ong@microsoft.com>; Ali Larijani <alirhas@microsoft.com=
>
Subject: RE: Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group work=
ing call

I am looking for DSP# for FRU Schema that is currently DMTF work in progres=
s.

Paul, Ed,

I remember you mentioning that FRU schema is under review. Do you have the =
DSP# by any chance?

Yugi

From: Michael.E.Brown@dell.com<mailto:Michael.E.Brown@dell.com> <Michael.E.=
Brown@dell.com<mailto:Michael.E.Brown@dell.com>>
Sent: Tuesday, May 15, 2018 8:35 AM
To: ed.tanous@intel.com<mailto:ed.tanous@intel.com>; openbmc@lists.ozlabs.o=
rg<mailto:openbmc@lists.ozlabs.org>; Paul.Vancil@dell.com<mailto:Paul.Vanci=
l@dell.com>; hramasub@in.ibm.com<mailto:hramasub@in.ibm.com>; Balaji.B.Rao@=
dell.com<mailto:Balaji.B.Rao@dell.com>; bradleyb@fuzziesquirrel.com<mailto:=
bradleyb@fuzziesquirrel.com>; pradeep.kumar36@tcs.com<mailto:pradeep.kumar3=
6@tcs.com>; rolfb@us.ibm.com<mailto:rolfb@us.ibm.com>; Chris Ong <Chris.Ong=
@microsoft.com<mailto:Chris.Ong@microsoft.com>>; Ali Larijani <alirhas@micr=
osoft.com<mailto:alirhas@microsoft.com>>; Yugi Mani <yupalani@microsoft.com=
<mailto:yupalani@microsoft.com>>
Subject: Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group working =
call

Meeting minutes for 5/14
*         Pavel presented POC for implementing custom Redfish endpoints and=
 attributes/properties
*         DBUS based approach where individual processes put custom Redfish=
 interfaces on dbus and bmcweb notices them and adds them to the tree.

--
Michael

-----Original Appointment-----
From: Tanous, Ed [mailto:ed.tanous@intel.com]
Sent: Monday, April 16, 2018 12:40 PM
To: Tanous, Ed; OpenBMC Maillist; Brown, Michael E; Vancil, Paul; Hariharas=
ubramanian Ramasubramanian; Rao, Balaji B; Brad Bishop; pradeep.kumar36@tcs=
.com<mailto:pradeep.kumar36@tcs.com>; rolfb@us.ibm.com<mailto:rolfb@us.ibm.=
com>; Chris.Ong@microsoft.com<mailto:Chris.Ong@microsoft.com>; alirhas@micr=
osoft.com<mailto:alirhas@microsoft.com>; yupalani@microsoft.com<mailto:yupa=
lani@microsoft.com>
Subject: OpenBMC Redfish working group working call
When: Monday, May 14, 2018 2:00 PM-3:00 PM (UTC-08:00) Pacific Time (US & C=
anada).
Where: Skype Meeting



Due to the problems with Blue Jeans we had last week, and the fact that we =
don't seem to use the video conference feature, lets switch back to Skype. =
 Unfortunately, BlueJeans doesn't give an easy way to send out cancelations=
, and my account is in a state of flux,
Description:
Per meeting decision, this meeting invite is for the "OpenBMC Redfish worki=
ng group". This
working group will meet every Monday at 4pm CST and publish meeting minutes=
 to the mailing
list. The working group is open to anybody who would like to participate in=
 development of
Redfish on OpenBMC.


Base agenda:

Call for opens
Presentation of frameworks
Discussion of Redfish on OpenBMC



...........................................................................=
..............................................................
--> Join Skype Meeting<https://na01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fmeet.intel.com%2Fed.tanous%2FSQH2DRH7&data=3D02%7C01%7Cyup=
alani%40microsoft.com%7Ce22ddc99a41b4c35429808d5ba797578%7C72f988bf86f141af=
91ab2d7cd011db47%7C1%7C0%7C636619953187357226&sdata=3D9ypBXFg7y2A3%2Fx2FSHf=
2fWTOJABSMuvMt2BAei21lz4%3D&reserved=3D0>
Trouble Joining? Try Skype Web App<https://na01.safelinks.protection.outloo=
k.com/?url=3Dhttps%3A%2F%2Fmeet.intel.com%2Fed.tanous%2FSQH2DRH7%3Fsl%3D1&d=
ata=3D02%7C01%7Cyupalani%40microsoft.com%7Ce22ddc99a41b4c35429808d5ba797578=
%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C636619953187367239&sdata=3D8H=
cwfwNU5Vic9cFLmzKqvYi4VO05X%2BZvwnlHPEh6FeQ%3D&reserved=3D0>
Join by phone
+1(916)356-2663 (or your local bridge access #) Choose bridge 5.<tel:+1(916=
)356-2663%20(or%20your%20local%20bridge%20access%20#)%20Choose%20bridge%205=
.> (Global)                English (United States)
Find a local number<https://na01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fdial.intel.com&data=3D02%7C01%7Cyupalani%40microsoft.com%7Ce22d=
dc99a41b4c35429808d5ba797578%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6=
36619953187367239&sdata=3DO5OJe99iv9KPzApWfI7aj2kOoInlAOLI%2BPhuLKqziSs%3D&=
reserved=3D0>

Conference ID: 205576574
Forgot your dial-in PIN?<https://na01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fdial.intel.com&data=3D02%7C01%7Cyupalani%40microsoft.com%7=
Ce22ddc99a41b4c35429808d5ba797578%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C=
0%7C636619953187377247&sdata=3DBjPZggjvZ0XbugnpPrRDNksMtByRRN6cdjzPSlB8ZaU%=
3D&reserved=3D0> |Help<https://na01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fo15.officeredir.microsoft.com%2Fr%2FrlidLync15%3Fclid%3D10=
33%26p1%3D5%26p2%3D2009&data=3D02%7C01%7Cyupalani%40microsoft.com%7Ce22ddc9=
9a41b4c35429808d5ba797578%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6366=
19953187387255&sdata=3DPkk8BwwbOeJq8J%2BAXNgFNJtu13yJEalYFhQEKaWVfdY%3D&res=
erved=3D0>

[!OC([1033])!]
...........................................................................=
..............................................................




--_000_7E9441B1E5EFFD4681F54958E82169933A0B9D1AORSMSX114amrcor_
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
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:1.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
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
	{mso-list-id:385221800;
	mso-list-template-ids:-1149736148;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:1018046636;
	mso-list-template-ids:-313483180;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">It looks like it just =
got published on Monday in the 2018.1 Schema drop.&nbsp; You&#8217;re looki=
ng for the Assembly schema &#8220;Assembly_v1.xml&#8221; posted here:<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">https://www.dmtf.org/s=
ites/default/files/standards/documents/DSP8010_2018.1.zip<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-Ed<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Yugi Mani [mailto:yupalani@microsoft.co=
m] <br>
<b>Sent:</b> Thursday, May 17, 2018 1:45 PM<br>
<b>To:</b> Michael.E.Brown@dell.com; Tanous, Ed &lt;ed.tanous@intel.com&gt;=
; openbmc@lists.ozlabs.org; Paul.Vancil@dell.com; hramasub@in.ibm.com; Bala=
ji.B.Rao@dell.com; bradleyb@fuzziesquirrel.com; pradeep.kumar36@tcs.com; ro=
lfb@us.ibm.com; Chris Ong &lt;Chris.Ong@microsoft.com&gt;;
 Ali Larijani &lt;alirhas@microsoft.com&gt;<br>
<b>Subject:</b> RE: Meeting Minutes 5/14 -- RE: OpenBMC Redfish working gro=
up working call<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am looking for DSP# for FRU Schema that is current=
ly DMTF work in progress.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Paul, Ed, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I remember you mentioning that FRU schema is under r=
eview. Do you have the DSP# by any chance?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Yugi<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> <a href=3D"mailto:Michael.E.Brown@dell.=
com">Michael.E.Brown@dell.com</a> &lt;<a href=3D"mailto:Michael.E.Brown@del=
l.com">Michael.E.Brown@dell.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, May 15, 2018 8:35 AM<br>
<b>To:</b> <a href=3D"mailto:ed.tanous@intel.com">ed.tanous@intel.com</a>; =
<a href=3D"mailto:openbmc@lists.ozlabs.org">
openbmc@lists.ozlabs.org</a>; <a href=3D"mailto:Paul.Vancil@dell.com">Paul.=
Vancil@dell.com</a>;
<a href=3D"mailto:hramasub@in.ibm.com">hramasub@in.ibm.com</a>; <a href=3D"=
mailto:Balaji.B.Rao@dell.com">
Balaji.B.Rao@dell.com</a>; <a href=3D"mailto:bradleyb@fuzziesquirrel.com">b=
radleyb@fuzziesquirrel.com</a>;
<a href=3D"mailto:pradeep.kumar36@tcs.com">pradeep.kumar36@tcs.com</a>; <a =
href=3D"mailto:rolfb@us.ibm.com">
rolfb@us.ibm.com</a>; Chris Ong &lt;<a href=3D"mailto:Chris.Ong@microsoft.c=
om">Chris.Ong@microsoft.com</a>&gt;; Ali Larijani &lt;<a href=3D"mailto:ali=
rhas@microsoft.com">alirhas@microsoft.com</a>&gt;; Yugi Mani &lt;<a href=3D=
"mailto:yupalani@microsoft.com">yupalani@microsoft.com</a>&gt;<br>
<b>Subject:</b> Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group w=
orking call<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Meeting minutes for 5/=
14</span><o:p></o:p></p>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:0in;text-indent:-.25in;mso-list:l1 level1 lfo2">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:#1F497D"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0=
pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">Pavel presente=
d POC for implementing custom Redfish endpoints and attributes/properties<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:0in;text-indent:-.25in;mso-list:l0 level1 lfo4">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:#1F497D"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0=
pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">DBUS based app=
roach where individual processes put custom Redfish interfaces on dbus and =
bmcweb notices them and adds them to the tree.<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;</span><o:p></o:=
p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">--</span><o:p></o:p></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Michael</span><o:p></o=
:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;</span><o:p></o:=
p></p>
</div>
<div>
<p class=3D"MsoNormal">-----Original Appointment-----<br>
<b>From:</b> Tanous, Ed [<a href=3D"mailto:ed.tanous@intel.com">mailto:ed.t=
anous@intel.com</a>]
<br>
<b>Sent:</b> Monday, April 16, 2018 12:40 PM<br>
<b>To:</b> Tanous, Ed; OpenBMC Maillist; Brown, Michael E; Vancil, Paul; Ha=
riharasubramanian Ramasubramanian; Rao, Balaji B; Brad Bishop;
<a href=3D"mailto:pradeep.kumar36@tcs.com">pradeep.kumar36@tcs.com</a>; <a =
href=3D"mailto:rolfb@us.ibm.com">
rolfb@us.ibm.com</a>; <a href=3D"mailto:Chris.Ong@microsoft.com">Chris.Ong@=
microsoft.com</a>;
<a href=3D"mailto:alirhas@microsoft.com">alirhas@microsoft.com</a>; <a href=
=3D"mailto:yupalani@microsoft.com">
yupalani@microsoft.com</a><br>
<b>Subject:</b> OpenBMC Redfish working group working call<br>
<b>When:</b> Monday, May 14, 2018 2:00 PM-3:00 PM (UTC-08:00) Pacific Time =
(US &amp; Canada).<br>
<b>Where:</b> Skype Meeting<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a name=3D"BM_BEGIN"></a><a name=3D"BM__InsertRtfSav=
edPosition"></a><a name=3D"_InsertRtfSavedPosition"></a><span style=3D"font=
-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif">&nbsp;</span><o=
:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Due to the problems with Blue Jeans we had last week=
, and the fact that we don&#8217;t seem to use the video conference feature=
, lets switch back to Skype.&nbsp; Unfortunately, BlueJeans doesn&#8217;t g=
ive an easy way to send out cancelations, and my account
 is in a state of flux, <o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Description:<br>
Per meeting decision, this meeting invite is for the &#8220;OpenBMC Redfish=
 working group&#8221;. This<br>
working group will meet every Monday at 4pm CST and publish meeting minutes=
 to the mailing<br>
list. The working group is open to anybody who would like to participate in=
 development of<br>
Redfish on OpenBMC.<br>
&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><br>
Base agenda:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Call for opens<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Presentation of frameworks<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Discussion of Redfish on OpenBMC<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;color:#404040">......=
...........................................................................=
........................................................</span><o:p></o:p><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><a name=3D"OutJoinLink"></a><span style=3D"font-size=
:14.0pt;font-family:Wingdings;color:#0066CC">&agrave;</span><span style=3D"=
font-size:14.0pt;color:#0066CC">
<a href=3D"https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fmeet.intel.com%2Fed.tanous%2FSQH2DRH7&amp;data=3D02%7C01%7Cyupalani%40mi=
crosoft.com%7Ce22ddc99a41b4c35429808d5ba797578%7C72f988bf86f141af91ab2d7cd0=
11db47%7C1%7C0%7C636619953187357226&amp;sdata=3D9ypBXFg7y2A3%2Fx2FSHf2fWTOJ=
ABSMuvMt2BAei21lz4%3D&amp;reserved=3D0">
<span style=3D"font-size:16.0pt">Join Skype Meeting</span></a></span><span =
style=3D"font-size:14.0pt;color:black">&nbsp;
</span><a name=3D"OutSharedNoteBorder"></a><span style=3D"font-size:14.0pt;=
color:#0066CC">&nbsp;&nbsp;
</span><a name=3D"OutSharedNoteLink"></a><o:p></o:p></p>
</div>
<div style=3D"margin-top:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Trouble Joining? <a=
 href=3D"https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fmeet.intel.com%2Fed.tanous%2FSQH2DRH7%3Fsl%3D1&amp;data=3D02%7C01%7Cyupala=
ni%40microsoft.com%7Ce22ddc99a41b4c35429808d5ba797578%7C72f988bf86f141af91a=
b2d7cd011db47%7C1%7C0%7C636619953187367239&amp;sdata=3D8HcwfwNU5Vic9cFLmzKq=
vYi4VO05X%2BZvwnlHPEh6FeQ%3D&amp;reserved=3D0">
<span style=3D"color:#0066CC">Try Skype Web App</span></a><u> </u></span><o=
:p></o:p></p>
</div>
<div style=3D"margin-top:12.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:13.0pt">Join by phone</span=
><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"tel:&#43;1(916)356-2663%20(or%20your%20lo=
cal%20bridge%20access%20#) Choose bridge 5."><span style=3D"font-size:10.0p=
t;color:#0066CC">&#43;1(916)356-2663 (or your local bridge access #) Choose=
 bridge 5.</span></a><span style=3D"font-size:10.0pt">
 (Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; English (United States) </span><o:p></o:p></p>
</div>
<div style=3D"margin-top:2.0pt">
<p class=3D"MsoNormal"><a href=3D"https://na01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fdial.intel.com&amp;data=3D02%7C01%7Cyupalani%40mi=
crosoft.com%7Ce22ddc99a41b4c35429808d5ba797578%7C72f988bf86f141af91ab2d7cd0=
11db47%7C1%7C0%7C636619953187367239&amp;sdata=3DO5OJe99iv9KPzApWfI7aj2kOoIn=
lAOLI%2BPhuLKqziSs%3D&amp;reserved=3D0"><span style=3D"font-size:10.0pt;col=
or:#0066CC">Find
 a local number</span></a> <o:p></o:p></p>
</div>
<div style=3D"margin-top:2.0pt">
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div style=3D"margin-top:2.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Conference ID: 2055=
76574</span><o:p></o:p></p>
</div>
<div style=3D"margin-top:2.0pt">
<p class=3D"MsoNormal"><a href=3D"https://na01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fdial.intel.com&amp;data=3D02%7C01%7Cyupalani%40mi=
crosoft.com%7Ce22ddc99a41b4c35429808d5ba797578%7C72f988bf86f141af91ab2d7cd0=
11db47%7C1%7C0%7C636619953187377247&amp;sdata=3DBjPZggjvZ0XbugnpPrRDNksMtBy=
RRN6cdjzPSlB8ZaU%3D&amp;reserved=3D0"><span style=3D"font-size:10.0pt;color=
:#0066CC">Forgot
 your dial-in PIN?</span></a><span style=3D"font-size:3.0pt"> </span>|<a hr=
ef=3D"https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fo1=
5.officeredir.microsoft.com%2Fr%2FrlidLync15%3Fclid%3D1033%26p1%3D5%26p2%3D=
2009&amp;data=3D02%7C01%7Cyupalani%40microsoft.com%7Ce22ddc99a41b4c35429808=
d5ba797578%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C636619953187387255&=
amp;sdata=3DPkk8BwwbOeJq8J%2BAXNgFNJtu13yJEalYFhQEKaWVfdY%3D&amp;reserved=
=3D0"><span style=3D"font-size:10.0pt;color:#0066CC">Help</span></a><span s=
tyle=3D"font-size:3.0pt">&nbsp;&nbsp;&nbsp;&nbsp;
</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><sub><span style=3D"font-size:8.0pt;color:#CFCFCF">[=
!OC([1033])!]</span></sub><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;color:#404040">......=
...........................................................................=
........................................................</span><o:p></o:p><=
/p>
</div>
<div style=3D"margin-top:10.0pt">
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_7E9441B1E5EFFD4681F54958E82169933A0B9D1AORSMSX114amrcor_--
