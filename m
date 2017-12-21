Return-Path: <ed.tanous@intel.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z2hG26qZFzF07V
 for <openbmc@lists.ozlabs.org>; Fri, 22 Dec 2017 06:16:35 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Dec 2017 11:16:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,437,1508828400"; d="scan'208,217";a="14643546"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by fmsmga004.fm.intel.com with ESMTP; 21 Dec 2017 11:16:31 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.57]) by
 ORSMSX109.amr.corp.intel.com ([169.254.11.160]) with mapi id 14.03.0319.002;
 Thu, 21 Dec 2017 11:16:30 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Request for a development repo
Thread-Topic: Request for a development repo
Thread-Index: AdN6jahyxaxrVgU0Srm5/SNsVR8pOw==
Date: Thu, 21 Dec 2017 19:16:30 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932F4B253F@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
Content-Type: multipart/alternative;
 boundary="_000_7E9441B1E5EFFD4681F54958E82169932F4B253FORSMSX114amrcor_"
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
X-List-Received-Date: Thu, 21 Dec 2017 19:16:43 -0000

--_000_7E9441B1E5EFFD4681F54958E82169932F4B253FORSMSX114amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In the hope of being more open with our development process, we'd like to c=
reate a repo for hosting work-in-progress applications, and applications th=
at don't really fit into the other repositories.  Internally, we have such =
a repository, informally named proving ground, where we try to build out co=
ncepts to test new applications, modes, and put the things that are specifi=
c to our platform that don't really fit anywhere else.  An example of a com=
ponent that would be contained in here would be this: https://gerrit.openbm=
c-project.xyz/#/c/8197/

With the goal of being more open, we'd like to find a way to make these pro=
totypes available to the community sooner, and have our machine targets bui=
ld some of the components while still in development.  The options we've co=
nsidered thusfar are:


1.       Acquire a repository under github/openbmc, possibly called intel, =
possibly called something more company agnostic.  Here we would put our pro=
totypes, and things that we would like to enable on our platforms.

2.       Start our own repository on 01.org (Intels open source repository)=
 and simply make our platform recipes in openbmc point to it.

3.       Create repositories for each component under openbmc, and define a=
 faster SLA and process for requesting new repos.

4.       Continue with our internal fork, and publish prototypes to reposit=
ories once they fit some definition of "done".

My personal preference would be #1, but I'm curious if anyone has any thoug=
hts on other opinions on how this should be done, or have better options th=
at we haven't thought of yet.

Thanks,

-Ed

--_000_7E9441B1E5EFFD4681F54958E82169932F4B253FORSMSX114amrcor_
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
	{mso-list-id:1283418812;
	mso-list-type:hybrid;
	mso-list-template-ids:-852468002 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
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
<p class=3D"MsoNormal">In the hope of being more open with our development =
process, we&#8217;d like to create a repo for hosting work-in-progress appl=
ications, and applications that don&#8217;t really fit into the other repos=
itories.&nbsp; Internally, we have such a repository,
 informally named proving ground, where we try to build out concepts to tes=
t new applications, modes, and put the things that are specific to our plat=
form that don&#8217;t really fit anywhere else.&nbsp; An example of a compo=
nent that would be contained in here would
 be this: <a href=3D"https://gerrit.openbmc-project.xyz/#/c/8197/">https://=
gerrit.openbmc-project.xyz/#/c/8197/</a>
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">With the goal of being more open, we&#8217;d like to=
 find a way to make these prototypes available to the community sooner, and=
 have our machine targets build some of the components while still in devel=
opment.&nbsp; The options we&#8217;ve considered thusfar
 are:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">1.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Acquire a repository under github/openbmc, possibly=
 called intel, possibly called something more company agnostic.&nbsp; Here =
we would put our prototypes, and things that we would like to enable on our=
 platforms.<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">2.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Start our own repository on 01.org (Intels open sou=
rce repository) and simply make our platform recipes in openbmc point to it=
.<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">3.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Create repositories for each component under openbm=
c, and define a faster SLA and process for requesting new repos.<o:p></o:p>=
</p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">4.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Continue with our internal fork, and publish protot=
ypes to repositories once they fit some definition of &#8220;done&#8221;.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My personal preference would be #1, but I&#8217;m cu=
rious if anyone has any thoughts on other opinions on how this should be do=
ne, or have better options that we haven&#8217;t thought of yet.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Ed<o:p></o:p></p>
</div>
</body>
</html>

--_000_7E9441B1E5EFFD4681F54958E82169932F4B253FORSMSX114amrcor_--
