Return-Path: <prvs=9877b4cea=George.Hung@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=9877b4cea=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44Xdsw1wWJzDqLT
 for <openbmc@lists.ozlabs.org>; Mon,  1 Apr 2019 15:00:34 +1100 (AEDT)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 01 Apr 2019 12:00:29 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 1 Apr 2019
 12:00:28 +0800
Received: from mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc]) by
 mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc%4]) with mapi id
 15.01.1713.004; Mon, 1 Apr 2019 12:00:28 +0800
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>
CC: "OpenBMC Maillist (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>, 
 "emilyshaffer@google.com" <emilyshaffer@google.com>,
 "benjaminfair@google.com" <benjaminfair@google.com>
Subject: [phosphor-host-ipmid] register google-ipmi-i2c
Thread-Topic: [phosphor-host-ipmid] register google-ipmi-i2c
Thread-Index: AdToOcM0mgHNXnAeTx+Ko0s6LmNJZg==
Date: Mon, 1 Apr 2019 04:00:28 +0000
Message-ID: <b122af4ade8f43eb9c5b9d737f3a0984@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24524.003
x-tm-as-result: No--32.532900-0.000000-31
x-tm-as-matchedid: 140026-151186-139704-113220-780058-111604-700362-705718-7
 00345-700157-700450-701827-700264-702497-700732-701012-701306-709859-111605
 -700074-700402-700656-303242-701153-102356-700398-707451-702358-701143-7026
 43-703788-711664-701594-707163-709584-701021-848362-705388-704425-188124-70
 0107-700079-703529-704751-702423-106580-121133-863519-301328-712203-111610-
 188093-148004-148054-20020-42000
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: multipart/alternative;
 boundary="_000_b122af4ade8f43eb9c5b9d737f3a0984quantatwcom_"
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
X-List-Received-Date: Mon, 01 Apr 2019 04:00:37 -0000

--_000_b122af4ade8f43eb9c5b9d737f3a0984quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

RGVhciBWZXJub24sDQoNClNpbmNlIHBob3NwaG9yLWhvc3QtaXBtaWQgZG9lc26hpnQgaGF2ZSBJ
MkMgbWFzdGVyIHdyaXRlLXJlYWQgaXBtaSBjb21tYW5kLCB3ZSB3b3VsZCBsaWtlIHRvIHVzZSBn
b29nbGUtaXBtaS1pMmMgaW5zdGVhZC4NCg0KQnV0IHdlIGZvdW5kIHRob3VnaCBpdCBjYW4gYmUg
cmVnaXN0ZXJlZCB0byBwaG9zcGhvci1ob3N0LWlwbWlkICwgaXQgd291bGQgYWx3YXlzIHJlc3Bv
bnNlIDB4ZmYgKFVuc3BlY2lmaWVkIGVycm9yKSB3aGVuIHNlbmRpbmcgY29tbWFuZHMgYnkgaXBt
aXRvb2wuDQoNClRoZSByb290IGNhdXNlIHdlIGZvdW5kIGlzIHRoYXQgaXQgZG9lc26hpnQgaGFu
ZGxlIG9lbSBJQU5BIG51bWJlciBhbmQgdXNlIHRoZW0gYXMgcmVxdWVzdCBkYXRhIGRpcmVjdGx5
Lg0KDQpJcyB0aGVyZSBhbnl0aGluZyBJIGRpZG6hpnQgY29uZmlndXJlIG9yIG5vdGljZSBzbyB0
aGF0IGl0IGNhbqGmdCB3b3JrIG5vcm1hbGx5ID8gQmVjYXVzZSBJIHJlbWVtYmVyIGl0IGNhbiB3
b3JrIG5vcm1hbGx5IGJlZm9yZSBpcG1pZCB1c2luZyB0aGUgbmV3IGFyY2hpdGVjdHVyZS4NCg0K
DQpUaGFua3MuDQoNCkJlc3QgUmVnYXJkDQpHZW9yZ2UgSHVuZw0KUmVzZWFyY2ggRGl2aXNpb24g
LSBTb2Z0d2FyZSBFbmdpbmVlcg0KQ2xvdWQgQ29tcHV0aW5nIEJ1c2luZXNzIFVuaXQNClF1YW50
YSBDb21wdXRlciBJbmMuDQpFeHQ6IDE2ODMwDQpFLU1haWwgOiBHZW9yZ2UuSHVuZ0BRdWFudGFU
Vy5jb208bWFpbHRvOmdlb3JnZS5odW5nQHF1YW50YXR3LmNvbT4NCg0K

--_000_b122af4ade8f43eb9c5b9d737f3a0984quantatwcom_
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
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Dear Vernon,<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Since phosphor-host-ipmid doesn=
=A1=A6t have I2C master write-read ipmi command, we would like to use googl=
e-ipmi-i2c instead.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">But we found though it can be r=
egistered to phosphor-host-ipmid , it would always response 0xff (Unspecifi=
ed error) when sending commands by ipmitool.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The root cause we found is that=
 it doesn=A1=A6t handle oem IANA number and use them as request data direct=
ly.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is there anything I didn=A1=A6t=
 configure or notice so that it can=A1=A6t work normally ? Because I rememb=
er it can work normally before ipmid using the new architecture.<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
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

--_000_b122af4ade8f43eb9c5b9d737f3a0984quantatwcom_--
