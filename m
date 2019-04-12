Return-Path: <prvs=998c01c0b=George.Hung@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=998c01c0b=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44gRjT0mjTzDqT9
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 15:46:44 +1000 (AEST)
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx02.quantatw.com with ESMTP; 12 Apr 2019 13:46:40 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 12 Apr
 2019 13:46:40 +0800
Received: from mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc]) by
 mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc%4]) with mapi id
 15.01.1713.004; Fri, 12 Apr 2019 13:46:40 +0800
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: "OpenBMC Maillist (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
CC: "Patrick Venture (venture@google.com)" <venture@google.com>,
 "emilyshaffer@google.com" <emilyshaffer@google.com>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>
Subject: Sending I2C command via google-ipmi i2c
Thread-Topic: Sending I2C command via google-ipmi i2c
Thread-Index: AdTw8EoDd/GzPV2YRl6DkvM55JZalA==
Date: Fri, 12 Apr 2019 05:46:40 +0000
Message-ID: <81e4866b111a47d991f767df3c6b4b0a@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: multipart/alternative;
 boundary="_000_81e4866b111a47d991f767df3c6b4b0aquantatwcom_"
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
X-List-Received-Date: Fri, 12 Apr 2019 05:46:54 -0000

--_000_81e4866b111a47d991f767df3c6b4b0aquantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpJoaZtIHRyeWluZyB0byBzZW5kaW5nIGlwbWkgSTJDIGNvbW1hbmQgdmlhIGdv
b2dsZS1pcG1pLWkyYyBleHRlbnNpb24sDQpidXQgSSB3aWxsIGdldCB0aGUgcmVzcG9uc2UgZXJy
b3IsIKGnVW5zcGVjaWZpZWQgZXJyb3KhqCBmcm9tIGlwbWl0b29sLg0KDQpUaGVyZSBhcmUgdGhl
IGNvbW1hbmQgYW5kIHJlc3BvbnNlIGV4YW1wbGUgYmVsb3c6DQoNCiMgaXBtaXRvb2wgcmF3IDB4
MmUgMHgwMiAweDc5IDB4MmIgMHgwMCAxIDAgMHg5OCAwIDEgMCAweDk5IDAgMg0KVW5hYmxlIHRv
IHNlbmQgUkFXIGNvbW1hbmQgKGNoYW5uZWw9MHgwIG5ldGZuPTB4MmUgbHVuPTB4MCBjbWQ9MHgy
IHJzcD0weGZmKTogVW5zcGVjaWZpZWQgZXJyb3INCg0KSSBjaGVjayB0aGUgZXJyb3IgbWVzc2Fn
ZSBmcm9tIGpvdXJuYWwgYW5kIGl0IGluZGljYXRlcyB0aGF0IGNhbm5vdCBvcGVuIC9kZXYvaTJj
LTEyMSBhbmQgSSB0aGluayBpdCB1c2VkIHRoZSBmaXJzdCBieXRlIG9mIElBTkEgbnVtYmVyICgw
eDc5KSBhcyBidXMgbnVtYmVyLg0KDQpIYXMgYW55b25lIGV2ZXIgbWV0IHRoaXMgc2l0dWF0aW9u
ID8gb3Igc29tZXRoaW5nIEkgaGF2ZSB0byBjb25maWd1cmUgZm9yIHBob3NwaG9yLWlwbWktaG9z
dCAvIGdvb2dsZS1pcG1pLWkyYyA/DQoNCg0KQmVzdCBSZWdhcmRzDQpHZW9yZ2UgSHVuZw0K

--_000_81e4866b111a47d991f767df3c6b4b0aquantatwcom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I=A1=A6m trying to sending ipmi=
 I2C command via google-ipmi-i2c extension,
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">but I will get the response err=
or, =A1=A7Unspecified error=A1=A8 from ipmitool.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">There are the command and respo=
nse example below:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"># ipmitool raw 0x2e 0x02 0x79 0=
x2b 0x00 1 0 0x98 0 1 0 0x99 0 2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Unable to send RAW command (cha=
nnel=3D0x0 netfn=3D0x2e lun=3D0x0 cmd=3D0x2 rsp=3D0xff): Unspecified error<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I check the error message from =
journal and it indicates that cannot open /dev/i2c-121 and I think it used =
the first byte of IANA number (0x79) as bus number.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Has anyone ever met this situat=
ion ? or something I have to configure for phosphor-ipmi-host / google-ipmi=
-i2c ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt;layout-grid-mode:char"=
><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Comic San=
s MS&quot;">Best Regards<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt;layout-grid-mode:char"=
><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Comic San=
s MS&quot;">George Hung<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_81e4866b111a47d991f767df3c6b4b0aquantatwcom_--
