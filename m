Return-Path: <ed.tanous@intel.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybMr46vvjzDqhg
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 07:36:52 +1100 (AEDT)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2017 12:36:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,389,1505804400"; d="scan'208,217";a="1130931"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by fmsmga004.fm.intel.com with ESMTP; 13 Nov 2017 12:36:48 -0800
Received: from orsmsx105.amr.corp.intel.com ([169.254.2.105]) by
 ORSMSX101.amr.corp.intel.com ([169.254.8.49]) with mapi id 14.03.0319.002;
 Mon, 13 Nov 2017 12:36:47 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: Use of Boost in OpenBMC
Thread-Topic: Use of Boost in OpenBMC
Thread-Index: AdNcvxCgKBGQxUx8RN+3iDIP6IjfWg==
Date: Mon, 13 Nov 2017 20:36:47 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932EAF421E@ORSMSX105.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
Content-Type: multipart/alternative;
 boundary="_000_7E9441B1E5EFFD4681F54958E82169932EAF421EORSMSX105amrcor_"
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
X-List-Received-Date: Mon, 13 Nov 2017 20:36:53 -0000

--_000_7E9441B1E5EFFD4681F54958E82169932EAF421EORSMSX105amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

I'd like to start a discussion around the thoughts about the inclusion of B=
oost headers.  I've heard before that it's a controversial subject.

For record, here's what the style guide currently says:

Boost, QT, etc.

If you give a mouse a cookie...
While, in general, we appreciate reuse over rewriting, we are not using lar=
ge general-purpose libraries such as Boost. Due to 'Code should be performa=
nt: code size' we do not want to utilize the entirety of Boost. If approval=
 is given for a single part of a large general-purpose library it becomes m=
uch more difficult to disapprove of another part of the library. Before lon=
g, we may have effectively approved of the entire library.

We do look for single feature libraries that can be used in place of our ow=
n implementations.

I'd like to start a discussion around challenging a core tenant of this sta=
tement, that approval of one part of the library makes it difficult to disa=
pprove other parts.  I would argue that the overhead of making a library av=
ailable, while still rejecting improper use that effects the project, is mu=
ch lower than rewriting and debugging equivalent "new" components for openb=
mc.

I would like to update the coding style conventions with the below verbiage=
 in regards to boost.

Boost

Use of boost is allowed, under the following circumstances:

1.       Use is done as a header-only library.  This allows unused function=
s and methods to be removed by the compiler at link time, and avoids adding=
 large amounts of overhead and flash usage.

2.       Implementers should include the lowest level header required to so=
lve the problem at hand.  This allows uses to be found and moved forward wh=
en new standards are available, as well as reduce compile times, and decrea=
se the possibility of accidental use.  (ie, #include <boost/container/flat_=
map.hpp>  not #include <boost/container.hpp>)

3.       The module used should not have an equivalent in the std namespace=
 that meets the same requirements for implementation or clarity:  For examp=
le, std::chrono should be preferred over boost::chrono.  std::array over bo=
ost::array.

4.       Use does not conflict with any of the core tenants of this coding =
standard (clarity, modern practices, or performance)


Some examples of libraries in boost that (I believe) would be useful for op=
enbmc:
Boost containers (flat_map, flat_set, ect)
                Among other things, this module provides standards complian=
t containers backed by a sorted vector.  This allows a reduced memory footp=
rint over using std::set or std::map, and in certain use cases can be more =
performant, or lower memory usage.

Boost asio
                This module provides C++ level networking, sockets, SSL, an=
d asynchronous frameworks that are not available in C++ today.  It has been=
 proposed as a Networking TS to the C++ standards committee.  http://www.op=
en-std.org/jtc1/sc22/wg21/docs/papers/2017/n4656.pdf  This use would likely=
 align us with moving toward compliant standards in the future.

Boost string
                Implementations of common string operations not present in =
the standard library.  String join, split, case insensitive compare ect.


I'd like to see what other people opinions are on the matter, and see if we=
 can reach a consensus.

Thanks,

-Ed



--_000_7E9441B1E5EFFD4681F54958E82169932EAF421EORSMSX105amrcor_
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
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:512570835;
	mso-list-type:hybrid;
	mso-list-template-ids:1715101776 1387923650 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
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
<p class=3D"MsoNormal">All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;d like to start a discussion around the thou=
ghts about the inclusion of Boost headers.&nbsp; I&#8217;ve heard before th=
at it&#8217;s a controversial subject.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For record, here&#8217;s what the style guide curren=
tly says:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><b><i>Boost, QT, etc.<o:p=
></o:p></i></b></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><i><o:p>&nbsp;</o:p></i><=
/p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><i>If you give a mouse a =
cookie...<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><i>While, in general, we =
appreciate reuse over rewriting, we are not using large general-purpose lib=
raries such as Boost. Due to 'Code should be performant: code size' we do n=
ot want to utilize the entirety of Boost.
 If approval is given for a single part of a large general-purpose library =
it becomes much more difficult to disapprove of another part of the library=
. Before long, we may have effectively approved of the entire library.<o:p>=
</o:p></i></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><i><o:p>&nbsp;</o:p></i><=
/p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><i>We do look for single =
feature libraries</i> that can be used in place of our own implementations.=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;d like to start a discussion around challeng=
ing a core tenant of this statement, that approval of one part of the libra=
ry makes it difficult to disapprove other parts.&nbsp; I would argue that t=
he overhead of making a library available, while
 still rejecting improper use that effects the project, is much lower than =
rewriting and debugging equivalent &#8220;new&#8221; components for openbmc=
.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I would like to update the coding style conventions =
with the below verbiage in regards to boost.<o:p></o:p></p>
<p class=3D"MsoNormal"><i><o:p>&nbsp;</o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><b><i>Boost<o:p></o:p></i=
></b></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><i><o:p>&nbsp;</o:p></i><=
/p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><i>Use of boost is allowe=
d, under the following circumstances:<o:p></o:p></i></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><i><span style=3D"mso-list:Ignore">1.<span style=3D"fo=
nt:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></i><![endif]><i>Use is done as a header-only library.&nbsp; =
This allows unused functions and methods to be removed by the compiler at l=
ink time, and avoids adding large amounts of overhead and flash usage.<o:p>=
</o:p></i></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><i><span style=3D"mso-list:Ignore">2.<span style=3D"fo=
nt:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></i><![endif]><i>Implementers should include the lowest level=
 header required to solve the problem at hand.&nbsp; This allows uses to be=
 found and moved forward when new standards are available, as well as reduc=
e compile times, and decrease the possibility
 of accidental use.&nbsp; (ie, #include &lt;boost/container/flat_map.hpp&gt=
;&nbsp; not #include &lt;boost/container.hpp&gt;)<o:p></o:p></i></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><i><span style=3D"mso-list:Ignore">3.<span style=3D"fo=
nt:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></i><![endif]><i>The module used should not have an equivalen=
t in the std namespace that meets the same requirements for implementation =
or clarity:&nbsp; For example, std::chrono should be preferred over boost::=
chrono.&nbsp; std::array over boost::array.<o:p></o:p></i></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><i><span style=3D"mso-list:Ignore">4.<span style=3D"fo=
nt:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></i><![endif]><i>Use does not conflict with any of the core t=
enants of this coding standard (clarity, modern practices, or performance)<=
o:p></o:p></i></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Some examples of libraries in boost that (I believe)=
 would be useful for openbmc:<o:p></o:p></p>
<p class=3D"MsoNormal">Boost containers (flat_map, flat_set, ect)<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Among other things, this module prov=
ides standards compliant containers backed by a sorted vector.&nbsp; This a=
llows a reduced memory footprint over using std::set or std::map, and in ce=
rtain use cases can be more performant,
 or lower memory usage.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Boost asio<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This module provides C&#43;&#43; lev=
el networking, sockets, SSL, and asynchronous frameworks that are not avail=
able in C&#43;&#43; today.&nbsp; It has been proposed as a Networking TS to=
 the C&#43;&#43; standards committee.&nbsp;
<a href=3D"http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/n4656.pd=
f">http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/n4656.pdf</a>&nb=
sp; This use would likely align us with moving toward compliant standards i=
n the future.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Boost string<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Implementations of common string ope=
rations not present in the standard library.&nbsp; String join, split, case=
 insensitive compare ect.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;d like to see what other people opinions are=
 on the matter, and see if we can reach a consensus.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Ed<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_7E9441B1E5EFFD4681F54958E82169932EAF421EORSMSX105amrcor_--
