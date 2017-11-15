Return-Path: <ed.tanous@intel.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (unknown [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ycdP11jCKzDqpF
 for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2017 08:51:12 +1100 (AEDT)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2017 13:50:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,401,1505804400"; d="scan'208,217";a="3099789"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
 by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2017 13:50:59 -0800
Received: from orsmsx162.amr.corp.intel.com (10.22.240.85) by
 ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Wed, 15 Nov 2017 13:50:59 -0800
Received: from orsmsx105.amr.corp.intel.com ([169.254.2.105]) by
 ORSMSX162.amr.corp.intel.com ([169.254.3.44]) with mapi id 14.03.0319.002;
 Wed, 15 Nov 2017 13:50:59 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: Gerrit code review velocity
Thread-Topic: Gerrit code review velocity
Thread-Index: AdNeW4QE+jeJyWieRkWNNunvA3j38Q==
Date: Wed, 15 Nov 2017 21:50:58 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932EAF506B@ORSMSX105.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2Q1Nzk4NjEtZmUyOS00MGJkLTlmNTgtNTE2ZDJjZmNjNDQ4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IkFGZEhTbXkyY0RQeHFRR29xbTFXcnhoY24wcDhCOU5tUHo0TFp2Vm80clU9In0=
x-originating-ip: [10.22.254.138]
Content-Type: multipart/alternative;
 boundary="_000_7E9441B1E5EFFD4681F54958E82169932EAF506BORSMSX105amrcor_"
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
X-List-Received-Date: Wed, 15 Nov 2017 21:51:18 -0000

--_000_7E9441B1E5EFFD4681F54958E82169932EAF506BORSMSX105amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is there anywhere that the SLAs and formats for how community code reviews =
are conducted?

I'm having some concerns around the code merge velocity on both sides of th=
e spectrum, and I thought I'd see what everyone's thoughts were on the matt=
er.

A great example of these concerns is below.  First and foremost, I'm not pi=
cking on this specific committer here, this seems to be a greater issue.
https://gerrit.openbmc-project.xyz/#/c/7925/

This patchset was pushed last night, approved by a single developer, and me=
rged by the submitter <24 hours later.  Considering this is a "phosphor" re=
ference component, changes an architecture level change (supporting multipl=
e HWmon clients) and doesn't seem to have any supporting unit tests, I'm co=
ncerned at the velocity that it was moved through the progression, and into=
 master.

Considering that we had some discussions on this specific change before, I =
would've liked to have input, and I'm sure others in the community would've=
 as well, but were not given the opportunity.  Do we have  a process for ho=
w long code review->test->merge should take, and what process it should fol=
low?

On the other end of the spectrum, I see code commits where the last activit=
y was several months ago, and do not see anyone picking it up, nor any forw=
ard progress on merging.  Is there a process defined for abandoning commits=
?

If the answer to all of these questions is, "no" or "nothing written down" =
I'm happy to put down some of my thoughts on integration rules down in a sp=
ec-like form, and see if we can come up with something that everyone is hap=
py with.

Thanks,

-Ed


--_000_7E9441B1E5EFFD4681F54958E82169932EAF506BORSMSX105amrcor_
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
<p class=3D"MsoNormal">Is there anywhere that the SLAs and formats for how =
community code reviews are conducted?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m having some concerns around the code merge=
 velocity on both sides of the spectrum, and I thought I&#8217;d see what e=
veryone&#8217;s thoughts were on the matter.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">A great example of these concerns is below.&nbsp; Fi=
rst and foremost, I&#8217;m not picking on this specific committer here, th=
is seems to be a greater issue.<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://gerrit.openbmc-project.xyz/#/c/79=
25/">https://gerrit.openbmc-project.xyz/#/c/7925/</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This patchset was pushed last night, approved by a s=
ingle developer, and merged by the submitter &lt;24 hours later.&nbsp; Cons=
idering this is a &#8220;phosphor&#8221; reference component, changes an ar=
chitecture level change (supporting multiple HWmon clients)
 and doesn&#8217;t seem to have any supporting unit tests, I&#8217;m concer=
ned at the velocity that it was moved through the progression, and into mas=
ter.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Considering that we had some discussions on this spe=
cific change before, I would&#8217;ve liked to have input, and I&#8217;m su=
re others in the community would&#8217;ve as well, but were not given the o=
pportunity.&nbsp; Do we have&nbsp; a process for how long code
 review-&gt;test-&gt;merge should take, and what process it should follow?<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">On the other end of the spectrum, I see code commits=
 where the last activity was several months ago, and do not see anyone pick=
ing it up, nor any forward progress on merging.&nbsp; Is there a process de=
fined for abandoning commits?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If the answer to all of these questions is, &#8220;n=
o&#8221; or &#8220;nothing written down&#8221; I&#8217;m happy to put down =
some of my thoughts on integration rules down in a spec-like form, and see =
if we can come up with something that everyone is happy with.<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Ed <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_7E9441B1E5EFFD4681F54958E82169932EAF506BORSMSX105amrcor_--
