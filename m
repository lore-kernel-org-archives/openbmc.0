Return-Path: <pengms1@lenovo.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.210; helo=mail1.bemta23.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zFjC3XCgzDq6y
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 19:11:06 +1100 (AEDT)
Received: from [67.219.247.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-d.us-east-1.aws.symcld.net id A8/46-09496-79F726C5;
 Tue, 12 Feb 2019 08:11:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleJIrShJLcpLzFFi42LJePGQSXd6fVK
 MQfMyZYtTLS9YHBg9zs9YyBjAGMWamZeUX5HAmtHedpS5YJ1ixbs1bA2Mu+S6GLk4hASeM0qs
 bZ3NBuHMZZRY92kRYxcjJwebgJbEwv97mEBsEQFLiSUP2oGKODiEBRwlpjyyhwi7STzuvsgOY
 etJXHu6jRnEZhFQlXje9x8szivgI3Hv9W+wMYwCYhLfT60Bs5kFxCXmTpvFCmJLCAhILNlznh
 nCFpV4+fgfK8gqCQF5iS2zBCHK8yT2LNvLCjFSUOLkzCcsExgFZiGZNAtJ2SwkZRBxHYkFuz+
 xQdjaEssWvmaGsc8ceMyELL6AkX0Vo3lSUWZ6RkluYmaOrqGBga6hoRGQ1jU0M9JLrNJN0Sst
 1k1NLC7RNdRLLC/WK67MTc5J0ctLLdnECIyMlAKuRTsY3y1NP8QoycGkJMp7PTApRogvKT+lM
 iOxOCO+qDQntfgQowwHh5IEL2cdUE6wKDU9tSItMwcYozBpCQ4eJRFe7VqgNG9xQWJucWY6RO
 oUoyVH38Znc5k5ttwHkbtApBBLXn5eqpQ4bzzIPAGQhozSPLhxsDRyiVFWSpiXkYGBQYinILU
 oN7MEVf4VozgHo5IwLyvIFJ7MvBK4ra+ADmICOohLIQHkoJJEhJRUA6NVl/S/sC3zdX8wfrW6
 WO0w/4ZR4s7UWPXDC99Ep+6Q2MibczDjxgJ5kXv3E1NiTVjdd7UZHX7O/DXiHFPTT0Ue2wObv
 M6t3iQ+nSUzJWWFVlmy5ledWzsSdm94Xxv28aZh0FEHK9FvDX/i/GNyA3UkWaZ+1LM6FtXjaz
 99S7eL3MN5hQ82+CuxFGckGmoxFxUnAgAkwQ1UHgMAAA==
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-5.tower-426.messagelabs.com!1549959063!1700203!1
X-Originating-IP: [104.232.225.2]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20431 invoked from network); 12 Feb 2019 08:11:03 -0000
Received: from unknown (HELO maesmtp01.lenovo.com) (104.232.225.2)
 by server-5.tower-426.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted
 SMTP; 12 Feb 2019 08:11:03 -0000
Received: from CNMAILEX02.lenovo.com (unknown [10.96.80.2]) by
 maesmtp01.lenovo.com with smtp
 (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-SHA384)
 id 463e_f3bc_22204512_cb59_4041_89f2_898343c4035d;
 Tue, 12 Feb 2019 08:11:02 +0000
Received: from CNMAILEX01.lenovo.com ([169.254.9.132]) by
 CNMAILEX02.lenovo.com ([10.96.80.2]) with mapi id 14.03.0415.000; Tue, 12 Feb
 2019 16:10:04 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How should we have our own releases and version numbers?
Thread-Topic: How should we have our own releases and version numbers?
Thread-Index: AdTCqFacC12jibo+Sd+yRJsfgPp14Q==
Date: Tue, 12 Feb 2019 08:10:02 +0000
Message-ID: <264283F7338E734E863366C752FEABBC2D222A13@CNMAILEX01.lenovo.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.19.89]
Content-Type: multipart/alternative;
 boundary="_000_264283F7338E734E863366C752FEABBC2D222A13CNMAILEX01lenov_"
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 12 Feb 2019 08:11:12 -0000

--_000_264283F7338E734E863366C752FEABBC2D222A13CNMAILEX01lenov_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

We would like to have a specific Fw version numbers when release image and =
see the firmware revision from ipmi get device command (0x06, 0x01), thus w=
e created os-release.bbappend<https://github.com/LenovoHS/openbmc/blob/mast=
er/meta-lenovo/meta-hr630/recipes-core/os-release/os-release.bbappend> file=
, but the version_id property can't be overwritten by our bbappend file. Co=
uld someone give me an advice?

Thanks.
Andrew

--_000_264283F7338E734E863366C752FEABBC2D222A13CNMAILEX01lenov_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW">Hi All,<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">We would like to have a specific Fw =
version numbers when release image and see the firmware revision from ipmi =
get device command (0x06, 0x01), thus we created
<a href=3D"https://github.com/LenovoHS/openbmc/blob/master/meta-lenovo/meta=
-hr630/recipes-core/os-release/os-release.bbappend">
os-release.bbappend</a> file, but the version_id property can't be overwrit=
ten by our bbappend file. Could someone give me an advice?<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Andrew</span><span lang=3D"EN-US" st=
yle=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso-fare=
ast-language:ZH-TW"><o:p></o:p></span></p>
</div>
</body>
</html>

--_000_264283F7338E734E863366C752FEABBC2D222A13CNMAILEX01lenov_--
