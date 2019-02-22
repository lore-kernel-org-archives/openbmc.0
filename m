Return-Path: <prvs=949bc9603=Tony.Lee@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=949bc9603=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 640 seconds by postgrey-1.36 at bilbo;
 Fri, 22 Feb 2019 14:25:26 AEDT
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 445Gtt6W4WzDqSl
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 14:25:26 +1100 (AEDT)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 22 Feb 2019 11:14:44 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Fri, 22 Feb
 2019 11:14:41 +0800
Received: from mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381]) by
 mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381%11]) with mapi id
 15.01.1531.004; Fri, 22 Feb 2019 11:14:41 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "emilyshaffer@google.com" <emilyshaffer@google.com>
CC: =?big5?B?QnVkZHkgSHVhbmcgKLbApNHCRSk=?= <Buddy.Huang@quantatw.com>
Subject: Support for NVMe-MI?
Thread-Topic: Support for NVMe-MI?
Thread-Index: AdTKW4APladdDbk7RG6ShkYe6mLkbA==
Date: Fri, 22 Feb 2019 03:14:41 +0000
Message-ID: <7146489c577d4784bd57fa4cb22a65b2@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24446.003
x-tm-as-result: No--16.575400-0.000000-31
x-tm-as-matchedid: 140026-139704-113220-780058-111604-700362-705718-700345-7
 01827-700264-702497-700450-700732-701306-264792-709859-111605-700074-700402
 -700656-700079-139705-111610-704425-707451-708712-703223-709584-702643-1211
 69-706719-102356-188124-700107-188093-148004-148054-20020-30063-42000-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: multipart/alternative;
 boundary="_000_7146489c577d4784bd57fa4cb22a65b2quantatwcom_"
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
X-List-Received-Date: Fri, 22 Feb 2019 03:25:32 -0000

--_000_7146489c577d4784bd57fa4cb22a65b2quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGksDQoNCg0KDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL2lzc3Vlcy8zNDgy
IGlzIGFza2luZyBzdXBwb3J0IGZvciBOVk1lLU1JLg0KDQpOb3csIHdlIGZvdW5kIHRoYXQgR29v
Z2xlIGhhcyBhIHBhY2thZ2UgY2FsbGVkIKGnZ29vZ2xlLWlwbWktaTJjoaguIEl0IHByb3ZpZGVz
IGEgaXBtaSBicmlkZ2UgY29tbWFuZCB3aGljaCBjYW4gZ2V0IHRoZSBkZXZpY2UgZGF0YSB3aGVy
ZSBhcmUgb24gdGhlIGkyYyBidXMuDQoNCg0KDQpUaGVyZSBhcmUgdGhlIGNvbW1hbmQgYW5kIHJl
c3BvbnNlIGV4YW1wbGUgYmVsb3c6DQokIGlwbWl0b29sIC1JIGRidXMgcmF3IDB4MmUgMiAweDc5
IDB4MmIgMHgwMCAxNCAwIDB4ZDQgMCAxIDAgMHhkNSAwIDgNCnJlc3BvbnNlOiA3OSAyYiAwMCAw
NiBiYiBmZiAyYSAwMCAwMCAwMCAyZQ0KJCBpcG1pdG9vbCAtSSBkYnVzIHJhdyAweDJlIDIgMHg3
OSAweDJiIDB4MDAgMTQgMCAweGQ0IDAgMSA4IDB4ZDUgMCAyNA0KcmVzcG9uc2UgOiA3OSAyYiAw
MCAxNiA4MCA4NiA1MCA0OCA0YyA0NiAzNyAzMSAzMSAzNSAzMCAzMA0KUmVzcG9uc2UgaXMgZGVm
aW5lIGluIE5WTSBFeHByZXNzIE1hbmFnZW1lbnQgSW50ZXJmYWNlIFNQRUMNCkl0J3Mgb25seSB1
c2VkIGZvciBpbi1iYW5kIG5vdy4NCg0KSG93IGFib3V0IGFkZGluZyBzdXBwb3J0IGZvciBvdXQt
b2YtYmFuZCBmb3IgdGhpcyB1c2VmdWwgT0VNIGNvbW1hbmQ/DQoNCg0KVGhhbmtzDQpCZXN0IFJl
Z2FyZHMsDQpUb255DQoNCg==

--_000_7146489c577d4784bd57fa4cb22a65b2quantatwcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
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
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"=AF=C2=A4=E5=A6r =A6r=A4=B8";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.a
	{mso-style-name:"=AF=C2=A4=E5=A6r =A6r=A4=B8";
	mso-style-priority:99;
	mso-style-link:=AF=C2=A4=E5=A6r;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><a href=3D"https://github.co=
m/openbmc/openbmc/issues/3482">https://github.com/openbmc/openbmc/issues/34=
82</a> is asking support for NVMe-MI.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Now, we found that Google ha=
s a package called
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;">=
=A1=A7</span><span lang=3D"EN-US">google-ipmi-i2c</span><span lang=3D"EN-US=
" style=3D"font-family:&quot;Courier New&quot;">=A1=A8</span><span lang=3D"=
EN-US">. It provides a ipmi bridge command which can get the device data wh=
ere
 are on the i2c bus.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:black">There are the command a=
nd response example below:</span><span lang=3D"EN-US"><o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US" =
style=3D"font-family:&quot;Arial&quot;,sans-serif">$ ipmitool -I dbus raw 0=
x2e 2 0x79 0x2b 0x00 14 0 0xd4 0 1 0 0xd5 0 8<br>
response: 79 2b 00 06 bb ff 2a 00 00 00 2e<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US" =
style=3D"font-family:&quot;Arial&quot;,sans-serif">$</span><span lang=3D"EN=
-US" style=3D"font-family:&quot;Arial&quot;,sans-serif">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,sans-ser=
if">ipmitool -I dbus raw 0x2e 2 0x79 0x2b 0x00 14 0 0xd4 0 1 8 0xd5 0 24<br=
>
response : 79 2b 00 16 80 86 50 48 4c 46 37 31 31 35 30 30<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US" =
style=3D"font-family:&quot;Arial&quot;,sans-serif">Response is define in NV=
M Express Management Interface SPEC<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">=
It's only used for in-band now.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">How about adding support for=
 out-of-band for this useful OEM command?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tony<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_7146489c577d4784bd57fa4cb22a65b2quantatwcom_--
