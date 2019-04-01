Return-Path: <prvs=9877b4cea=George.Hung@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=9877b4cea=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44XkC73xg4zDqKy
 for <openbmc@lists.ozlabs.org>; Mon,  1 Apr 2019 18:15:45 +1100 (AEDT)
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx02.quantatw.com with ESMTP; 01 Apr 2019 15:15:44 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 1 Apr 2019
 15:15:43 +0800
Received: from mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc]) by
 mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc%4]) with mapi id
 15.01.1713.004; Mon, 1 Apr 2019 15:15:43 +0800
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>
CC: "OpenBMC Maillist (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: I have no Jenkis build after pushing code to Gerrit
Thread-Topic: I have no Jenkis build after pushing code to Gerrit
Thread-Index: AdToWfdxhqMseamJSCOuMH9sHLnaPw==
Date: Mon, 1 Apr 2019 07:15:43 +0000
Message-ID: <1c72193eaccf493d9192b831a21be539@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: multipart/alternative;
 boundary="_000_1c72193eaccf493d9192b831a21be539quantatwcom_"
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
X-List-Received-Date: Mon, 01 Apr 2019 07:15:48 -0000

--_000_1c72193eaccf493d9192b831a21be539quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

RGVhciBCcmFkLA0KDQpJIGhhdmUgbm8gSmVua2lzIGJ1aWxkIGFmdGVyIHB1c2hpbmcgY29kZSB0
byBHZXJyaXQuIEl0IHJlc3BvbnNlZCChp1VzZXIgbm90IGFwcHJvdmVkLCBzZWUgYWRtaW4sIG5v
IENJoagNCklzIHRoZXJlIHRoZSBjb25maWd1cmF0aW9uIEkgbWlzc2VkIG9yIGl0IG5lY2Vzc2Fy
eSB0byBhZGQgdGhlIHBlcm1pc3Npb24gPw0KDQpUaGFua3MuDQoNCkJlc3QgUmVnYXJkDQpHZW9y
Z2UgSHVuZw0KUmVzZWFyY2ggRGl2aXNpb24gLSBTb2Z0d2FyZSBFbmdpbmVlcg0KQ2xvdWQgQ29t
cHV0aW5nIEJ1c2luZXNzIFVuaXQNClF1YW50YSBDb21wdXRlciBJbmMuDQpFeHQ6IDE2ODMwDQpF
LU1haWwgOiBHZW9yZ2UuSHVuZ0BRdWFudGFUVy5jb208bWFpbHRvOmdlb3JnZS5odW5nQHF1YW50
YXR3LmNvbT4NCg0K

--_000_1c72193eaccf493d9192b831a21be539quantatwcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=B7s=B2=D3=A9=FA=C5=E9;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=B7s=B2=D3=A9=FA=C5=E9";
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Dear Brad,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have no Jenkis build after pu=
shing code to Gerrit. It responsed =A1=A7User not approved, see admin, no C=
I=A1=A8<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is there the configuration I mi=
ssed or it necessary to add the permission ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt;layout-grid-mode:char"=
><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Comic San=
s MS&quot;">Best Regard
<br>
George Hung<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Comic Sans MS&quot;">Research Division - Software Engineer<br>
Cloud Computing Business Unit<br>
Quanta Computer Inc.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Comic Sans MS&quot;">Ext: 16830<br>
E-Mail : </span><span lang=3D"EN-US" style=3D"font-family:&quot;Times New R=
oman&quot;,&quot;serif&quot;"><a href=3D"mailto:george.hung@quantatw.com" t=
itle=3D"blocked::mailto:Fran.Hsu@QuantaTW.com"><span style=3D"font-size:10.=
0pt;font-family:&quot;Comic Sans MS&quot;;color:blue">George.Hung@QuantaTW.=
com</span></a></span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_1c72193eaccf493d9192b831a21be539quantatwcom_--
