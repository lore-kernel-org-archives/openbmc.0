Return-Path: <prvs=983ff241d=Hank.Liou@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=983ff241d=hank.liou@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44VMG24lRqzDqNg
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 21:54:55 +1100 (AEDT)
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx02.quantatw.com with ESMTP; 28 Mar 2019 18:54:52 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 28 Mar
 2019 18:54:51 +0800
Received: from mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc]) by
 mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc%4]) with mapi id
 15.01.1713.004; Thu, 28 Mar 2019 18:54:51 +0800
From: =?big5?B?SGFuayBMaW91ICi8Qq7Kv6sp?= <Hank.Liou@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [phosphor-pid-control] scaling issue
Thread-Topic: [phosphor-pid-control] scaling issue
Thread-Index: AQHU5Sj9loI9dbbDpkixezz7G113kw==
Date: Thu, 28 Mar 2019 10:54:51 +0000
Message-ID: <1f94cb30fe624740b2ad67438b643266@quantatw.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: multipart/alternative;
 boundary="_000_1f94cb30fe624740b2ad67438b643266quantatwcom_"
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
X-List-Received-Date: Thu, 28 Mar 2019 10:55:07 -0000

--_000_1f94cb30fe624740b2ad67438b643266quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KDQoNClRoaXMgaXNzdWUgaXMgcmVsYXRlZCB0byB0aGUgcmVwb3NpdG9yeSBwaG9z
cGhvci1waWQtY29udHJvbDxodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1waWQt
Y29udHJvbD4uDQoNCg0KSXQgaXMgaW4gY29tbWl0IGRidXNwYXNzaXZlOiBhbGxvdyBzY2FsaW5n
PGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXBpZC1jb250cm9sL2NvbW1pdC83
NWViNzY5ZDM1MTQzNDU0Nzg5OTE4NmY3M2ZmNzBhZTAwZDc5MzRhPiB0aGF0IG9uZSBhZGRlZCBz
Y2FsaW5nIG1lY2hhbmlzbS4gSG93ZXZlciB3aGVuIGl0IGNvbWVzIHRvIHBpZC5jcHA8aHR0cHM6
Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItcGlkLWNvbnRyb2wvYmxvYi9tYXN0ZXIvcGlk
L2VjL3BpZC5jcHA+LCBpdCBtYXkgZW5jb3VudGVyIHNjYWxpbmcgbWlzbWF0Y2guIFRoYXQgaXMg
dG8gc2F5LCAoaW4gZmFuIGNvbnRyb2wgc3RhZ2UpIHRoZSBwaWQgdGFrZXMgdGhlIHNjYWxlZCB2
YWx1ZXMgYXMgaW5wdXRzLCBidXQgaXQgdXRpbGl6ZXMgdW5zY2FsZWQgc2V0cG9pbnRzIHJlc3Vs
dGluZyB3cm9uZyBlcnJvciB0ZXJtcy4gT3IganVzdCBjaGFuZ2UgdGhlIHNldHBvaW50IHZhbHVl
Pw0KDQoNClRoYW5rcywNCg0KDQpIYW5rIExpb3UNCg0KUXVhbnRhIENvbXB1dGVyIEluYy4NCg==

--_000_1f94cb30fe624740b2ad67438b643266quantatwcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
<p>Hi All,</p>
<p><br>
</p>
<p>This issue is related to the&nbsp;repository <a href=3D"https://github.c=
om/openbmc/phosphor-pid-control" class=3D"OWAAutoLink">
phosphor-pid-control</a>.</p>
<p><br>
</p>
<p>It is in commit&nbsp;<span><a href=3D"https://github.com/openbmc/phospho=
r-pid-control/commit/75eb769d351434547899186f73ff70ae00d7934a" class=3D"OWA=
AutoLink">dbuspassive: allow scaling</a>&nbsp;that one&nbsp;added scaling m=
echanism. However when it comes to
<a href=3D"https://github.com/openbmc/phosphor-pid-control/blob/master/pid/=
ec/pid.cpp" class=3D"OWAAutoLink">
pid.cpp</a>, it may encounter scaling mismatch. That is to say, (in fan con=
trol stage)&nbsp;the pid takes the scaled values as inputs, but it utilizes=
 unscaled&nbsp;<span>setpoints resulting&nbsp;wrong error terms. Or just ch=
ange the setpoint value?</span></span></p>
<p><span><span><br>
</span></span></p>
<p><span><span>Thanks,</span></span></p>
<p><span><span><br>
</span></span></p>
<p>Hank Liou</p>
<p>Quanta Computer Inc.</p>
</div>
</body>
</html>

--_000_1f94cb30fe624740b2ad67438b643266quantatwcom_--
