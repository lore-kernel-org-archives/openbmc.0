Return-Path: <yao.yuan@hxt-semitech.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hxt-semitech.com
 (client-ip=223.203.96.7; helo=barracuda.hxt-semitech.com;
 envelope-from=yao.yuan@hxt-semitech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hxt-semitech.com
Received: from barracuda.hxt-semitech.com (mx01.hxt-semitech.com
 [223.203.96.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DX2R4KjkzDqcg
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 18:41:50 +1100 (AEDT)
X-ASG-Debug-ID: 1544514101-093b7e13c602200001-mgJK9t
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([10.128.0.15]) by
 barracuda.hxt-semitech.com with ESMTP id KqcjgHdMa1mg0gEr (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO) for
 <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 15:41:41 +0800 (CST)
X-Barracuda-Envelope-From: yao.yuan@hxt-semitech.com
Received: from HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) by
 HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Dec 2018 15:40:49 +0800
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6]) by
 HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6%12]) with mapi id
 15.00.1395.000; Tue, 11 Dec 2018 15:40:49 +0800
From: "Yuan, Yao" <yao.yuan@hxt-semitech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How to operate the gpio
Thread-Topic: How to operate the gpio
X-ASG-Orig-Subj: How to operate the gpio
Thread-Index: AdSRIglwC0lBo/CiRFCLFEn5LdT91w==
Date: Tue, 11 Dec 2018 07:40:49 +0000
Message-ID: <8560e4ac81e042deab46bf6b22b2fd1b@HXTBJIDCEMVIW02.hxtcorp.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.64.1.64]
Content-Type: multipart/alternative;
 boundary="_000_8560e4ac81e042deab46bf6b22b2fd1bHXTBJIDCEMVIW02hxtcorpn_"
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.128.0.15]
X-Barracuda-Start-Time: 1544514101
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.101:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No,
 SCORE=-2.02 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=HTML_MESSAGE
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.63560
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.00 HTML_MESSAGE           BODY: HTML included in message
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
X-List-Received-Date: Tue, 11 Dec 2018 07:41:53 -0000

--_000_8560e4ac81e042deab46bf6b22b2fd1bHXTBJIDCEMVIW02hxtcorpn_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I have a scripts to enable console, it will write the gpio:
#Control UART mux for obmc-console-client
echo 325 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio325/direction
cat /sys/class/gpio/gpio325/direction
echo 0 > /sys/class/gpio/gpio325/value
obmc-console-client
echo 1 > /sys/class/gpio/gpio325/value

It seems very tedious that I have to do export every time in the scripts.

In openbmc, if I want to operate the gpio,
I have to
1, echo the gpio num to /sys.class/gpio/export
2, echo the direction to /sys.class/gpio/gpio*.direction
3, read or write the value from the value.

So it seems I need a script use to export some of the gpios at first?

And I also find a python scripts in obmc: gpioutil
But it need import obmc_system_config
>>> import obmc_system_config
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ImportError: No module named obmc_system_config

Does anyone know how to install this module in obmc?

Or does anyone know a better way to operate the gpio?

Thanks.

Best Regards,
Yao.


--_000_8560e4ac81e042deab46bf6b22b2fd1bHXTBJIDCEMVIW02hxtcorpn_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
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
	font-family:DengXian;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:DengXian;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
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
=3D"EN-US" style=3D"color:#1F497D">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">I have a scripts to enable console, it w=
ill write the gpio:<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">#Control UART mux for obmc-console-clien=
t<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">echo 325 &gt; /sys/class/gpio/export<o:p=
></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">echo out &gt; /sys/class/gpio/gpio325/di=
rection<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">cat /sys/class/gpio/gpio325/direction<o:=
p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">echo 0 &gt; /sys/class/gpio/gpio325/valu=
e<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">obmc-console-client<o:p></o:p></span></p=
>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">echo 1 &gt; /sys/class/gpio/gpio325/valu=
e<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">It seems very tedious that I have to do =
export every time in the scripts.<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">In openbmc, if I want to operate the gpi=
o,<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">I have to<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">1, echo the gpio num to /sys.class/gpio/=
export<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">2, echo the direction to /sys.class/gpio=
/gpio*.direction<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">3, read or write the value from the valu=
e.<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">So it seems I need a script use to expor=
t some of the gpios at first?<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">And I also find a python scripts in obmc=
: gpioutil<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">But it need import obmc_system_config<o:=
p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">&gt;&gt;&gt; import obmc_system_config<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">Traceback (most recent call last):<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">&nbsp; File &quot;&lt;stdin&gt;&quot;, l=
ine 1, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">ImportError: No module named obmc_system=
_config<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">Does anyone know how to install this mod=
ule in obmc?<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">Or does anyone know a better way to oper=
ate the gpio?<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">Best Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"color:#1F497D">Yao.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_8560e4ac81e042deab46bf6b22b2fd1bHXTBJIDCEMVIW02hxtcorpn_--
