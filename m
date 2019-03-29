Return-Path: <prvs=984c66f94=Hank.Liou@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=984c66f94=hank.liou@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44Vljt10p2zDqGW
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 13:17:01 +1100 (AEDT)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 29 Mar 2019 10:16:59 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 29 Mar
 2019 10:16:57 +0800
Received: from mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc]) by
 mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc%4]) with mapi id
 15.01.1713.004; Fri, 29 Mar 2019 10:16:57 +0800
From: =?big5?B?SGFuayBMaW91ICi8Qq7Kv6sp?= <Hank.Liou@quantatw.com>
To: Patrick Venture <venture@google.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>
Subject: Re: [phosphor-pid-control] scaling issue
Thread-Topic: [phosphor-pid-control] scaling issue
Thread-Index: AQHU5Sj9loI9dbbDpkixezz7G113k6YglgoAgAFDXeo=
Date: Fri, 29 Mar 2019 02:16:57 +0000
Message-ID: <c2d3e4dee25a4c76803c6fec8b99dce4@quantatw.com>
References: <1f94cb30fe624740b2ad67438b643266@quantatw.com>,
 <CAO=notwyQLfY2tEMfydPD9Ku7+e3GJuPguAro0rr_xMJcAmm7g@mail.gmail.com>
In-Reply-To: <CAO=notwyQLfY2tEMfydPD9Ku7+e3GJuPguAro0rr_xMJcAmm7g@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24516.007
x-tm-as-result: No--19.983500-0.000000-31
x-tm-as-matchedid: 90-140026-150567-111600-111604-300151-705718-701827-70263
 8-111605-700074-700264-700732-700345-700450-706065-703674-704341-704156-702
 169-188057-700802-188134-700724-106660-705861-111608-188062-700079-700075-7
 11953-105040-700994-703788-707395-711900-702807-710615-703283-701236-702020
 -707788-709364-700107-863519-188092-148004-148054-22561-42000-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: multipart/alternative;
 boundary="_000_c2d3e4dee25a4c76803c6fec8b99dce4quantatwcom_"
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
X-List-Received-Date: Fri, 29 Mar 2019 02:17:07 -0000

--_000_c2d3e4dee25a4c76803c6fec8b99dce4quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgUGF0cmljaywNCg0KDQp7DQogICAgInNlbnNvcnMiIDogWw0KICAgICAgICB7DQogICAgICAg
ICAgICAibmFtZSI6ICJmYW4xIiwNCiAgICAgICAgICAgICJ0eXBlIjogImZhbiIsDQogICAgICAg
ICAgICAicmVhZFBhdGgiOiAiL3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycy9mYW5fdGFjaC9m
YW4xIiwNCiAgICAgICAgICAgICJ3cml0ZVBhdGgiOiAiL3N5cy9kZXZpY2VzL3BsYXRmb3JtL2Fo
Yi9haGI6YXBiLzFlNzg2MDAwLnB3bS10YWNoby1jb250cm9sbGVyL2h3bW9uLyoqL3B3bTEiLA0K
ICAgICAgICAgICAgIm1pbiI6IDAsDQogICAgICAgICAgICAibWF4IjogMjU1DQogICAgICAgIH0s
DQogICAgICAgIHsNCiAgICAgICAgICAgICJuYW1lIjogInRlbXAxIiwNCiAgICAgICAgICAgICJ0
eXBlIjogInRlbXAiLA0KICAgICAgICAgICAgInJlYWRQYXRoIjogIi94eXovb3BlbmJtY19wcm9q
ZWN0L3NlbnNvcnMvdGVtcGVyYXR1cmUvdGVtcDEiLA0KICAgICAgICAgICAgIndyaXRlUGF0aCI6
ICIiLA0KICAgICAgICAgICAgIm1pbiI6IDAsDQogICAgICAgICAgICAibWF4IjogMA0KICAgICAg
ICB9DQogICAgXSwNCiAgICAiem9uZXMiIDogWw0KICAgICAgICB7DQogICAgICAgICAgICAiaWQi
OiAxLA0KICAgICAgICAgICAgIm1pblRoZXJtYWxPdXRwdXQiOiAzMDAwLjAsDQogICAgICAgICAg
ICAiZmFpbHNhZmVQZXJjZW50IjogNzUuMCwNCiAgICAgICAgICAgICJwaWRzIjogWw0KICAgICAg
ICAgICAgICAgIHsNCiAgICAgICAgICAgICAgICAgICAgIm5hbWUiOiAiZmFuMSIsDQogICAgICAg
ICAgICAgICAgICAgICJ0eXBlIjogImZhbiIsDQogICAgICAgICAgICAgICAgICAgICJpbnB1dHMi
OiBbImZhbjEiXSwNCiAgICAgICAgICAgICAgICAgICAgInNldHBvaW50IjogOTAuMCwNCiAgICAg
ICAgICAgICAgICAgICAgInBpZCI6IHsNCiAgICAgICAgICAgICAgICAgICAgICAgICJzYW1wbGVQ
ZXJpb2QiOiAwLjEsDQogICAgICAgICAgICAgICAgICAgICAgICAicHJvcG9ydGlvbmFsQ29lZmYi
OiAtMS4wLA0KICAgICAgICAgICAgICAgICAgICAgICAgImludGVncmFsQ29lZmYiOiAtMC4yLA0K
ICAgICAgICAgICAgICAgICAgICAgICAgImZlZWRGd2RPZmZzZXRDb2VmZiI6IDAuMCwNCiAgICAg
ICAgICAgICAgICAgICAgICAgICJmZWVkRndkR2FpbkNvZWZmIjogMC4wMTAsDQogICAgICAgICAg
ICAgICAgICAgICAgICAiaW50ZWdyYWxMaW1pdF9taW4iOiAwLjAsDQogICAgICAgICAgICAgICAg
ICAgICAgICAiaW50ZWdyYWxMaW1pdF9tYXgiOiAwLjAsDQogICAgICAgICAgICAgICAgICAgICAg
ICAib3V0TGltX21pbiI6IDMwLjAsDQogICAgICAgICAgICAgICAgICAgICAgICAib3V0TGltX21h
eCI6IDEwMC4wLA0KICAgICAgICAgICAgICAgICAgICAgICAgInNsZXdOZWciOiAwLjAsDQogICAg
ICAgICAgICAgICAgICAgICAgICAic2xld1BvcyI6IDAuMA0KICAgICAgICAgICAgICAgICAgICB9
DQogICAgICAgICAgICAgICAgfSwNCiAgICAgICAgICAgICAgICB7DQogICAgICAgICAgICAgICAg
ICAgICJuYW1lIjogInRlbXAxIiwNCiAgICAgICAgICAgICAgICAgICAgInR5cGUiOiAidGVtcCIs
DQogICAgICAgICAgICAgICAgICAgICJpbnB1dHMiOiBbInRlbXAxIl0sDQogICAgICAgICAgICAg
ICAgICAgICJzZXRwb2ludCI6IDUwLjAsDQogICAgICAgICAgICAgICAgICAgICJwaWQiOiB7DQog
ICAgICAgICAgICAgICAgICAgICAgICAic2FtcGxlUGVyaW9kIjogMC4xLA0KICAgICAgICAgICAg
ICAgICAgICAgICAgInByb3BvcnRpb25hbENvZWZmIjogLTEuMCwNCiAgICAgICAgICAgICAgICAg
ICAgICAgICJpbnRlZ3JhbENvZWZmIjogLTAuMiwNCiAgICAgICAgICAgICAgICAgICAgICAgICJm
ZWVkRndkT2Zmc2V0Q29lZmYiOiAwLjAsDQogICAgICAgICAgICAgICAgICAgICAgICAiZmVlZEZ3
ZEdhaW5Db2VmZiI6IDAuMDEwLA0KICAgICAgICAgICAgICAgICAgICAgICAgImludGVncmFsTGlt
aXRfbWluIjogMC4wLA0KICAgICAgICAgICAgICAgICAgICAgICAgImludGVncmFsTGltaXRfbWF4
IjogMC4wLA0KICAgICAgICAgICAgICAgICAgICAgICAgIm91dExpbV9taW4iOiA1MDAuMCwNCiAg
ICAgICAgICAgICAgICAgICAgICAgICJvdXRMaW1fbWF4IjogMTUwMC4wLA0KICAgICAgICAgICAg
ICAgICAgICAgICAgInNsZXdOZWciOiAwLjAsDQogICAgICAgICAgICAgICAgICAgICAgICAic2xl
d1BvcyI6IDAuMA0KICAgICAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICAgICAgfQ0KICAg
ICAgICAgICAgXQ0KICAgICAgICB9DQogICAgXQ0KfQ0KDQoNClNpbmNlcmVseSwNCg0KDQpIYW5r
IExpb3UNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IFBhdHJpY2sg
VmVudHVyZSA8dmVudHVyZUBnb29nbGUuY29tPg0KU2VudDogVGh1cnNkYXksIE1hcmNoIDI4LCAy
MDE5IDEwOjMzIFBNDQpUbzogSGFuayBMaW91ICi8Qq7Kv6spDQpDYzogb3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnDQpTdWJqZWN0OiBSZTogW3Bob3NwaG9yLXBpZC1jb250cm9sXSBzY2FsaW5nIGlz
c3VlDQoNCk9uIFRodSwgTWFyIDI4LCAyMDE5IGF0IDM6NTUgQU0gSGFuayBMaW91ICi8Qq7Kv6sp
IDxIYW5rLkxpb3VAcXVhbnRhdHcuY29tPiB3cm90ZToNCj4NCj4gSGkgQWxsLA0KPg0KPg0KPiBU
aGlzIGlzc3VlIGlzIHJlbGF0ZWQgdG8gdGhlIHJlcG9zaXRvcnkgcGhvc3Bob3ItcGlkLWNvbnRy
b2wuDQo+DQo+DQo+IEl0IGlzIGluIGNvbW1pdCBkYnVzcGFzc2l2ZTogYWxsb3cgc2NhbGluZyB0
aGF0IG9uZSBhZGRlZCBzY2FsaW5nIG1lY2hhbmlzbS4gSG93ZXZlciB3aGVuIGl0IGNvbWVzIHRv
IHBpZC5jcHAsIGl0IG1heSBlbmNvdW50ZXIgc2NhbGluZyBtaXNtYXRjaC4gVGhhdCBpcyB0byBz
YXksIChpbiBmYW4gY29udHJvbCBzdGFnZSkgdGhlIHBpZCB0YWtlcyB0aGUgc2NhbGVkIHZhbHVl
cyBhcyBpbnB1dHMsIGJ1dCBpdCB1dGlsaXplcyB1bnNjYWxlZCBzZXRwb2ludHMgcmVzdWx0aW5n
IHdyb25nIGVycm9yIHRlcm1zLiBPciBqdXN0IGNoYW5nZSB0aGUgc2V0cG9pbnQgdmFsdWU/DQoN
CkNhbiB5b3Ugc2hhcmUgeW91ciBjb25maWd1cmF0aW9uPyAgVGhhdCBtaWdodCBzaW1wbGlmeSB0
aGUgY29udmVyc2F0aW9uLg0KDQo+DQo+DQo+IFRoYW5rcywNCj4NCj4NCj4gSGFuayBMaW91DQo+
DQo+IFF1YW50YSBDb21wdXRlciBJbmMuDQo=

--_000_c2d3e4dee25a4c76803c6fec8b99dce4quantatwcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI=
 Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p>Hi Patrick,</p>
<p><br>
</p>
<p></p>
<div>{<br>
&nbsp;&nbsp;&nbsp; &quot;sensors&quot; : [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;na=
me&quot;: &quot;fan1&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ty=
pe&quot;: &quot;fan&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;re=
adPath&quot;: &quot;/xyz/openbmc_project/sensors/fan_tach/fan1&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;wr=
itePath&quot;: &quot;/sys/devices/platform/ahb/ahb:apb/1e786000.pwm-tacho-c=
ontroller/hwmon/**/pwm1&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mi=
n&quot;: 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ma=
x&quot;: 255<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;na=
me&quot;: &quot;temp1&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ty=
pe&quot;: &quot;temp&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;re=
adPath&quot;: &quot;/xyz/openbmc_project/sensors/temperature/temp1&quot;,<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;wr=
itePath&quot;: &quot;&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mi=
n&quot;: 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ma=
x&quot;: 0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp; ],<br>
&nbsp;&nbsp;&nbsp; &quot;zones&quot; : [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id=
&quot;: 1,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mi=
nThermalOutput&quot;: 3000.0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;fa=
ilsafePercent&quot;: 75.0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;pi=
ds&quot;: [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;fan1&quot;,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;type&quot;: &quot;fan&quot;,<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;inputs&quot;: [&quot;fan1&quo=
t;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;setpoint&quot;: 90.0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;pid&quot;: {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;sampl=
ePeriod&quot;: 0.1,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;propo=
rtionalCoeff&quot;: -1.0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;integ=
ralCoeff&quot;: -0.2,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;feedF=
wdOffsetCoeff&quot;: 0.0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;feedF=
wdGainCoeff&quot;: <span>0.010</span>,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;integ=
ralLimit_min&quot;: 0.0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;integ=
ralLimit_max&quot;: 0.0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;outLi=
m_min&quot;: 30.0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;outLi=
m_max&quot;: 100.0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;slewN=
eg&quot;: 0.0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;slewP=
os&quot;: 0.0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;temp1&quot;=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;type&quot;: &quot;temp&quot;,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;inputs&quot;: [&quot;temp1&qu=
ot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;setpoint&quot;: 50.0,&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;pid&quot;: {&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;sampl=
ePeriod&quot;: 0.1,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;propo=
rtionalCoeff&quot;: -1.0,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;integ=
ralCoeff&quot;: -0.2,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;feedF=
wdOffsetCoeff&quot;: 0.0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;feedF=
wdGainCoeff&quot;: <span style=3D"font-family: Calibri, Helvetica, sans-ser=
if, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, N=
otoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, Emoj=
iSymbols; font-size: 16px;">
0.010</span>,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;integ=
ralLimit_min&quot;: 0.0,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;integ=
ralLimit_max&quot;: 0.0,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;outLi=
m_min&quot;: 500.0,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;outLi=
m_max&quot;: 1500.0,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;slewN=
eg&quot;: 0.0,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;slewP=
os&quot;: 0.0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; <br>
&nbsp;&nbsp;&nbsp; ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; <br>
}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; <br>
<br>
</div>
<p></p>
<p>Sincerely,</p>
<p><br>
</p>
<p>Hank Liou</p>
<br>
<div style=3D"color:rgb(0,0,0)">
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Patrick Venture &lt=
;venture@google.com&gt;<br>
<b>Sent:</b> Thursday, March 28, 2019 10:33 PM<br>
<b>To:</b> Hank Liou (=BCB=AE=CA=BF=AB)<br>
<b>Cc:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> Re: [phosphor-pid-control] scaling issue</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt">
<div class=3D"PlainText">On Thu, Mar 28, 2019 at 3:55 AM Hank Liou (=BCB=AE=
=CA=BF=AB) &lt;Hank.Liou@quantatw.com&gt; wrote:<br>
&gt;<br>
&gt; Hi All,<br>
&gt;<br>
&gt;<br>
&gt; This issue is related to the repository phosphor-pid-control.<br>
&gt;<br>
&gt;<br>
&gt; It is in commit dbuspassive: allow scaling that one added scaling mech=
anism. However when it comes to pid.cpp, it may encounter scaling mismatch.=
 That is to say, (in fan control stage) the pid takes the scaled values as =
inputs, but it utilizes unscaled setpoints
 resulting wrong error terms. Or just change the setpoint value?<br>
<br>
Can you share your configuration?&nbsp; That might simplify the conversatio=
n.<br>
<br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt;<br>
&gt; Hank Liou<br>
&gt;<br>
&gt; Quanta Computer Inc.<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_c2d3e4dee25a4c76803c6fec8b99dce4quantatwcom_--
