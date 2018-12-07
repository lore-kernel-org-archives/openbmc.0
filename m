Return-Path: <yao.yuan@hxt-semitech.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hxt-semitech.com
 (client-ip=223.203.96.7; helo=barracuda.hxt-semitech.com;
 envelope-from=yao.yuan@hxt-semitech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hxt-semitech.com
X-Greylist: delayed 1178 seconds by postgrey-1.36 at bilbo;
 Fri, 07 Dec 2018 19:57:23 AEDT
Received: from barracuda.hxt-semitech.com (mx01.hxt-semitech.com
 [223.203.96.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43B5vR4p1hzDrfb
 for <openbmc@lists.ozlabs.org>; Fri,  7 Dec 2018 19:57:21 +1100 (AEDT)
X-ASG-Debug-ID: 1544171829-093b7e7162028c0001-mgJK9t
Received: from HXTBJIDCEMVIW01.hxtcorp.net ([10.128.0.14]) by
 barracuda.hxt-semitech.com with ESMTP id rQnctaMY6pX83pLp (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO) for
 <openbmc@lists.ozlabs.org>; Fri, 07 Dec 2018 16:37:09 +0800 (CST)
X-Barracuda-Envelope-From: yao.yuan@hxt-semitech.com
Received: from HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) by
 HXTBJIDCEMVIW01.hxtcorp.net (10.128.0.14) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 7 Dec 2018 16:36:18 +0800
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6]) by
 HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6%12]) with mapi id
 15.00.1395.000; Fri, 7 Dec 2018 16:36:18 +0800
From: "Yuan, Yao" <yao.yuan@hxt-semitech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How to enable bmcweb  in openbmc
Thread-Topic: How to enable bmcweb  in openbmc
X-ASG-Orig-Subj: How to enable bmcweb  in openbmc
Thread-Index: AdSOBxJn4cTEuSqPQuu5xtQOj1a51g==
Date: Fri, 7 Dec 2018 08:36:17 +0000
Message-ID: <b5a3f14c40c04288ab7347f707904f3c@HXTBJIDCEMVIW02.hxtcorp.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.64.1.64]
Content-Type: multipart/alternative;
 boundary="_000_b5a3f14c40c04288ab7347f707904f3cHXTBJIDCEMVIW02hxtcorpn_"
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.128.0.14]
X-Barracuda-Start-Time: 1544171829
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.101:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -1.82
X-Barracuda-Spam-Status: No,
 SCORE=-1.82 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=BSF_SC0_SA038b, HTML_MESSAGE
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.63238
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.00 HTML_MESSAGE           BODY: HTML included in message
 0.20 BSF_SC0_SA038b         Custom Rule SA038b
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
X-List-Received-Date: Fri, 07 Dec 2018 08:57:24 -0000

--_000_b5a3f14c40c04288ab7347f707904f3cHXTBJIDCEMVIW02hxtcorpn_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm new here and want to enable openbmc on my server.

It seems the bmcweb server didn't running on my openbmc or even not yet bui=
ld the module in openbmc.
So I think the bmcweb is not default build and running in openbmc.
Do I need add some configure options or some others to support bmcweb in op=
enbmc?

Now I'm success to build the openbmc and run it on a server with aspeed2500=
 bmc.

I can login openbmc and also ssh on it.
But I can't access the webui by browser.


This site can't be reached

10.64.5.0 refused to connect.

Try:

  *   Checking the connection
  *   Checking the proxy and the firewall<chrome-error://chromewebdata/#but=
tons>
ERR_CONNECTION_REFUSED


Thanks.

Best Regards,
Yao.


--_000_b5a3f14c40c04288ab7347f707904f3cHXTBJIDCEMVIW02hxtcorpn_
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
	{font-family:\5B8B\4F53;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:\7B49\7EBF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@\7B49\7EBF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@\5B8B\4F53";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:\7B49\7EBF;}
h1
	{mso-style-priority:9;
	mso-style-link:"Heading 1 Char";
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:24.0pt;
	font-family:\5B8B\4F53;
	font-weight:bold;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:\5B8B\4F53;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:\7B49\7EBF;
	color:windowtext;}
span.Heading1Char
	{mso-style-name:"Heading 1 Char";
	mso-style-priority:9;
	mso-style-link:"Heading 1";
	font-family:\5B8B\4F53;
	font-weight:bold;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:\7B49\7EBF;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:450443829;
	mso-list-template-ids:-1601158206;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">I&#8217;m new here and want to enable op=
enbmc on my server.<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">It seems the bmcweb server didn&#8217;t =
running on my openbmc or even not yet build the module in openbmc.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">So I think the bmcweb is not default bui=
ld and running in openbmc.<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">Do I need add some configure options or =
some others to support bmcweb in openbmc?<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">Now I&#8217;m success to build the openb=
mc and run it on a server with aspeed2500 bmc.<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">I can login openbmc and also ssh on it.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">But I can&#8217;t access the webui by br=
owser.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<h1 style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:12.0pt;m=
argin-left:0cm;mso-line-height-alt:15.0pt;background:white">
<span lang=3D"EN-US" style=3D"font-size:19.0pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif;color:#333333;font-weight:normal">This site can&#8217;t be =
reached<o:p></o:p></span></h1>
<p style=3D"background:white;font-variant-ligatures: normal;font-variant-ca=
ps: normal;orphans: 2;text-align:start;widows: 2;-webkit-text-stroke-width:=
 0px;text-decoration-style: initial;text-decoration-color: initial;word-spa=
cing:0px">
<strong><span lang=3D"EN-US" style=3D"font-size:11.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#646464">10.64.5.0</span></strong><span lang=
=3D"EN-US" style=3D"font-size:11.5pt;font-family:&quot;Segoe UI&quot;,sans-=
serif;color:#646464">&nbsp;refused to connect.<o:p></o:p></span></p>
<p style=3D"background:white;margin-block-end: 0px"><span lang=3D"EN-US" st=
yle=3D"font-size:11.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#=
646464">Try:<o:p></o:p></span></p>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:#646464;mso-margin-top-alt:auto;mso-=
margin-bottom-alt:auto;text-align:left;mso-list:l0 level1 lfo1;background:w=
hite">
<span lang=3D"EN-US" style=3D"font-size:11.5pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif">Checking the connection<o:p></o:p></span></li><li class=3D=
"MsoNormal" style=3D"color:#646464;mso-margin-top-alt:auto;mso-margin-botto=
m-alt:auto;text-align:left;mso-list:l0 level1 lfo1;background:white">
<span lang=3D"EN-US" style=3D"font-size:11.5pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif"><a href=3D"chrome-error://chromewebdata/#buttons"><span st=
yle=3D"color:#1155CC">Checking the proxy and the firewall</span></a><o:p></=
o:p></span></li></ul>
<p class=3D"MsoNormal" style=3D"background:white"><span lang=3D"EN-US" styl=
e=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#646=
464;text-transform:uppercase">ERR_CONNECTION_REFUSED<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">Best Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">Yao.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_b5a3f14c40c04288ab7347f707904f3cHXTBJIDCEMVIW02hxtcorpn_--
