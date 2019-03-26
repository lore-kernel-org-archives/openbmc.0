Return-Path: <prvs=981a4a1c7=Hank.Liou@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=981a4a1c7=hank.liou@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 44T9zn0slxzDqDS
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 23:53:39 +1100 (AEDT)
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx01.quantatw.com with ESMTP; 26 Mar 2019 20:53:35 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 26 Mar
 2019 20:53:34 +0800
Received: from mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc]) by
 mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc%4]) with mapi id
 15.01.1713.004; Tue, 26 Mar 2019 20:53:34 +0800
From: =?big5?B?SGFuayBMaW91ICi8Qq7Kv6sp?= <Hank.Liou@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [phosphor-pid-control] discuss the code in /pid/buildjson.cpp
Thread-Topic: [phosphor-pid-control] discuss the code in /pid/buildjson.cpp
Thread-Index: AQHU49It+E8nyHkZWkix+kYaqumljQ==
Date: Tue, 26 Mar 2019 12:53:34 +0000
Message-ID: <75d8c71fe0684d6ebc3710bada61b79f@quantatw.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24510.006
x-tm-as-result: No-0.357800-0.000000-31
x-tm-as-matchedid: 111600-111604-188119-705718-701827-702638-111605-700074-7
 00264-700732-700345-700450-138503-700949-188116-700057-187067-704496-701604
 -861059-709584-701747-863519-188144-111601-148004-148050-42000-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: multipart/alternative;
 boundary="_000_75d8c71fe0684d6ebc3710bada61b79fquantatwcom_"
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
X-List-Received-Date: Tue, 26 Mar 2019 12:53:42 -0000

--_000_75d8c71fe0684d6ebc3710bada61b79fquantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpTb3JyeSBmb3IgaW5zdWZmaWNpZW50IGluZm8gYWJvdXQgbXkgcXVlc3Rpb24u
DQoNCkkgYW0gcmVhZGluZyB0aGUgc291cmNlIGNvZGUgb2YgL3BpZC9idWlsZGpzb24uY3BwIGlu
IHBob3NwaG9yLXBpZC1jb250cm9sLg0KDQoNCklzIHRoZXJlIGFuIGVycm9yIGluIGxpbmUgNTkg
YW5kIDY5PyBUbyBiZSBwcmVjaXNlLCBJIHRoaW5rIGogc2hvdWxkIGJlIHAgc2luY2Ugb25seSBw
IGhhcyBlbGVtZW50cyBwb3NpdGl2ZUh5c3RlcmVzaXMgYW5kIG5lZ2F0aXZlSHlzdGVyZXNpcy4N
Cg0KU2luY2VyZWx5LA0KDQpIYW5rIExpb3UNClF1YW50YSBDb21wdXRlciBJbmMuDQo=

--_000_75d8c71fe0684d6ebc3710bada61b79fquantatwcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p><span style=3D"font-family: Calibri, Helvetica, sans-serif, serif, Emoji=
Font; font-size: 16px;">Hi all,</span><br style=3D"font-family: Calibri, He=
lvetica, sans-serif, serif, EmojiFont; font-size: 16px;">
<br>
Sorry for&nbsp;<span>insufficient info about my question.</span><br>
<br style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont;=
 font-size: 16px;">
<span style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFon=
t; font-size: 16px;">I am reading the source code of
<span style=3D"color: rgb(0, 111, 201);">/pid/buildjson.cpp</span> in&nbsp;=
<span style=3D"color: rgb(255, 255, 255); background-color: rgb(255, 0, 255=
);"><span style=3D"background-color: rgb(255, 255, 255); color: rgb(0, 111,=
 201);">phosphor-pid-contro</span><span style=3D"background-color: rgb(255,=
 255, 255); color: rgb(0, 111, 201);">l</span></span>.&nbsp;</span></p>
<p><span style=3D"font-family: Calibri, Helvetica, sans-serif, serif, Emoji=
Font; font-size: 16px;"><br>
</span></p>
<p><span style=3D"font-family: Calibri, Helvetica, sans-serif, serif, Emoji=
Font; font-size: 16px;">Is there an error in line 59 and 69? To be precise,=
 I think j should be p since only p has elements positiveHysteresis and neg=
ativeHysteresis.</span><br style=3D"font-family: Calibri, Helvetica, sans-s=
erif, serif, EmojiFont; font-size: 16px;">
<br style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont;=
 font-size: 16px;">
<span style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFon=
t; font-size: 16px;">Sincerely,</span><br style=3D"font-family: Calibri, He=
lvetica, sans-serif, serif, EmojiFont; font-size: 16px;">
<br style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont;=
 font-size: 16px;">
<span style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFon=
t; font-size: 16px;">Hank Liou</span><br style=3D"font-family: Calibri, Hel=
vetica, sans-serif, serif, EmojiFont; font-size: 16px;">
<span style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFon=
t; font-size: 16px;">Quanta Computer Inc.</span><br>
</p>
</div>
</body>
</html>

--_000_75d8c71fe0684d6ebc3710bada61b79fquantatwcom_--
