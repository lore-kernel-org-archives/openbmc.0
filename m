Return-Path: <Balaji.B.Rao@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.218; helo=esa8.dell-outbound.iphmx.com;
 envelope-from=balaji.b.rao@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="ILqfDB36"; 
 dkim-atps=neutral
Received: from esa8.dell-outbound.iphmx.com (esa8.dell-outbound.iphmx.com
 [68.232.149.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zCskq1pCLzF0Qb
 for <openbmc@lists.ozlabs.org>; Sat,  6 Jan 2018 04:54:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1515174899; x=1546710899;
 h=from:to:subject:date:message-id:mime-version;
 bh=/xt9w6900sRZ0Tep++ggvE5p8rbUygN36FXwgAl8pz4=;
 b=ILqfDB36xxtxguzYlqMul7eTk8y+yubn7SsRs7lX2SfpDdToWz6D+5RF
 bRBYAdxV66GD2pbsS2fVBVzsfXzQrFh5rLuyhEWxkUUre/qeAxGTJW05x
 WxXjuegfzT/U267d12bsFxiklfCTMccVWdpg6VxspHncAIQs17Iu2nq07 g=;
IronPort-PHdr: =?us-ascii?q?9a23=3AGTJ6Xh+TqKntFf9uRHKM819IXTAuvvDOBiVQ1KB3?=
 =?us-ascii?q?0+4cTK2v8tzYMVDF4r011RmVBdyds6oMotGVmpioYXYH75eFvSJKW713fDhBt/?=
 =?us-ascii?q?8rmRc9CtWOE0zxIa2iRSU7GMNfSA0tpCnjYgBaF8nkelLdvGC54yIMFRXjLwp1?=
 =?us-ascii?q?Ifn+FpLPg8it2O2+54Dfbx9UiDahfLh/MAi4oQLNu8cMnIBsMLwxyhzHontJf+?=
 =?us-ascii?q?RZ22ZlLk+Nkhj/+8m94odt/zxftPw9+cFAV776f7kjQrxDEDsmKWE169b1uhTF?=
 =?us-ascii?q?UACC+2ETUmQSkhpPHgjF8BT3VYr/vyfmquZw3jSRMMvrRr42RDui9b9mRh/2hi?=
 =?us-ascii?q?kaKz43/mLZis1sg61Uux+uvQBzw4zObY2JKPZyYKXQds4aS2pbWcZRUjRMD4Sh?=
 =?us-ascii?q?YoQVC+oOJ+RYr4jnq1YTtxewGROjBOT0xzBVmHD22ak63/49HgHB2QwtBtQDu2?=
 =?us-ascii?q?naotXyMacdS+G1zK/QwDXMbvNWxTf96JXTfRw7vf6MWrdwfMzMwkcsDwPIllSd?=
 =?us-ascii?q?pI//Mz+L2OkBrXKX4/dgWO+gkWIqqg98riCyysswkIXFm40Yx17e+Slnz4s5O8?=
 =?us-ascii?q?e0RUx7bNK8DZdduC+XO5FrTs4jQmxkoiU3x70ctZKmfCUHyZIqzAPFZfOdaYiH?=
 =?us-ascii?q?+BfjWf6UITd/mX1qZqqyhw238Ui80u38UdS00EpSoipFjNbMsncN2gTN5cicUP?=
 =?us-ascii?q?Rw8F2t1iuR2ADX7uFIOEc0lbfHK5E6xb4wi5wTvlndEiPsmUX2lK+WdkAr++Sy?=
 =?us-ascii?q?9+vnZbDmqoedN49ylA7+Lrwjl828DOgiLAQDUXaX9f6h2LDj8kD1WrRHg/Munq?=
 =?us-ascii?q?ncqp/aJMAbpqCjAw9S14Yu8wuyAC2i0NsCn3kHLUhJdQ+dg4b1IV7OJ+v1Auqh?=
 =?us-ascii?q?jFSolDdn3ezJPrrkApnVNHjMjK/hfaph605b0Aczyshf6IxSCr4aJfL8RlT8tN?=
 =?us-ascii?q?jZDh8iLwy02PzrCNJ814MaQ22AGbSZPLnVsV+S6eJ8a9WLMdsSoDv7If0uz/rv?=
 =?us-ascii?q?lmMi31gPeaCjxt0Qcn/uTdp8JEDMNVDlht4DECEg+DA3S8TmhVmGFzVUYiDhDO?=
 =?us-ascii?q?oH+jgnBdf+Xs/4TYe3jenZ0Q=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2H8AAB9u09ahz+a6ERdGwEBAQEDAQEBC?=
 =?us-ascii?q?QEBAYJKgVp0Lp0YkUOJO0MKJYRHhQJDFAEBAQEBAQEBAQECEAEBAQgNCQgoL4I?=
 =?us-ascii?q?4Ig0ESyovAQEBAQEBAQEBAQEBAQEBGgINgRFeAQyBEwcBBBuJQ2QQskiKPy0Fh?=
 =?us-ascii?q?BSCFYocgjuCDgyDFgWjXAqHfI0tgiCRb4pfglOJYYE8NoFzb4J9gmOBc32IP4E?=
 =?us-ascii?q?XAQEB?=
X-IPAS-Result: =?us-ascii?q?A2H8AAB9u09ahz+a6ERdGwEBAQEDAQEBCQEBAYJKgVp0Lp0?=
 =?us-ascii?q?YkUOJO0MKJYRHhQJDFAEBAQEBAQEBAQECEAEBAQgNCQgoL4I4Ig0ESyovAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBGgINgRFeAQyBEwcBBBuJQ2QQskiKPy0FhBSCFYocgjuCDgy?=
 =?us-ascii?q?DFgWjXAqHfI0tgiCRb4pfglOJYYE8NoFzb4J9gmOBc32IP4EXAQEB?=
Received: from esa3.dell-outbound2.iphmx.com ([68.232.154.63])
 by esa8.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jan 2018 11:53:51 -0600
From: <Balaji.B.Rao@dell.com>
Received: from ausxippc106.us.dell.com ([143.166.85.156])
 by esa3.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jan 2018 23:53:22 +0600
X-LoopCount0: from 10.166.132.49
X-IronPort-AV: E=Sophos;i="5.46,319,1511848800"; 
 d="scan'208,217";a="196062007"
X-DLP: DLP_GlobalPCIDSS
To: <openbmc@lists.ozlabs.org>
Subject: systemd update for openbmc
Thread-Topic: systemd update for openbmc
Thread-Index: AdOGTg/oY7rfIM2lThaTcoQWJKOnZg==
Date: Fri, 5 Jan 2018 17:53:50 +0000
Message-ID: <16379b3bfc8a4a1ca02a04aa49a60628@ausx13mpc109.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titusconfig: No Restrictions 04051212
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvIiwiaWQiOiIyNGUyOGMwZS05OTkyLTRjZjgtODA1NC05MWFkYTczMTE4NzAiLCJwcm9wcyI6W3sibiI6IkNsYXNzaWZpY2F0aW9uIiwidmFscyI6W3sidmFsdWUiOiJObyBSZXN0cmljdGlvbnMifV19LHsibiI6IlN1YmxhYmVscyIsInZhbHMiOltdfSx7Im4iOiJFeHRlcm5hbENvcnJlc3BvbmRlbmNlIiwidmFscyI6W119XX0sIlN1YmplY3RMYWJlbHMiOltdLCJUTUNWZXJzaW9uIjoiMTYuMi4xMS4wIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImFNWDNPdVwvNWw1RENpY0t4T05XZUhWUTI3VjI5aTVEdTF6aXlwTEJvVjNNPSJ9
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: multipart/alternative;
 boundary="_000_16379b3bfc8a4a1ca02a04aa49a60628ausx13mpc109AMERDELLCOM_"
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Jan 2018 08:35:47 +1100
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
X-List-Received-Date: Fri, 05 Jan 2018 17:55:21 -0000

--_000_16379b3bfc8a4a1ca02a04aa49a60628ausx13mpc109AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

systemd in openbmc repo seems a little outdated making it unable to build w=
ith GNU c++ compilers. Is there a plan to update it? Particularly interesti=
ng is the following fix,

https://github.com/systemd/systemd/commit/aa3288505569433200bfa311ff12d2968=
4a14374

Will systemd be updated anytime soon?

Thanks
Balaji

--_000_16379b3bfc8a4a1ca02a04aa49a60628ausx13mpc109AMERDELLCOM_
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
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal">systemd in openbmc repo seems a little outdated maki=
ng it unable to build with GNU c&#43;&#43; compilers. Is there a plan to up=
date it? Particularly interesting is the following fix,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/systemd/systemd/commit=
/aa3288505569433200bfa311ff12d29684a14374">https://github.com/systemd/syste=
md/commit/aa3288505569433200bfa311ff12d29684a14374</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Will systemd be updated anytime soon?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">Balaji<o:p></o:p></p>
</div>
</body>
</html>

--_000_16379b3bfc8a4a1ca02a04aa49a60628ausx13mpc109AMERDELLCOM_--
