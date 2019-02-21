Return-Path: <prvs=948077aa3=Will.Liang@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=948077aa3=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 444mJM1kHKzDqLp
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 18:27:12 +1100 (AEDT)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 21 Feb 2019 15:27:11 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Thu, 21 Feb
 2019 15:27:09 +0800
Received: from mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381]) by
 mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381%11]) with mapi id
 15.01.1531.004; Thu, 21 Feb 2019 15:27:09 +0800
From: =?big5?B?V2lsbCBMaWFuZyAoseelw7liKQ==?= <Will.Liang@quantatw.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
CC: Stefan M Schaeckeler <sschaeck@cisco.com>
Subject: RE: ECC memory of BMC  
Thread-Topic: ECC memory of BMC  
Thread-Index: AQHUya1p/FCQCnvcCUCqyg3eXim5w6XpT5IAgACIXkE=
Date: Thu, 21 Feb 2019 07:27:09 +0000
Message-ID: <66dac7974c444060a9b4b1052b00d072@quantatw.com>
References: <88e05768447d466ca674e12e20c650dc@quantatw.com>,
 <96605da0-113a-4d43-994a-f081f30af71e@www.fastmail.com>
In-Reply-To: <96605da0-113a-4d43-994a-f081f30af71e@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24442.002
x-tm-as-result: No--23.796200-0.000000-31
x-tm-as-matchedid: 90-140026-150567-111600-111604-300151-705718-701827-70263
 8-111605-700074-700264-700732-700345-700450-700107-303156-704425-700802-188
 134-851218-423396-420223-423232-421240-852387-413034-111608-188062-188057-7
 00079-700075-702898-709584-703523-708060-701618-706204-703372-139705-700648
 -700490-111610-707410-780022-704577-707997-700038-188092-148004-148054-2256
 1-42000-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: multipart/alternative;
 boundary="_000_66dac7974c444060a9b4b1052b00d072quantatwcom_"
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
X-List-Received-Date: Thu, 21 Feb 2019 07:27:16 -0000

--_000_66dac7974c444060a9b4b1052b00d072quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQW5kcmV3LA0KDQoNClRoYW5rcyBmb3IgeW91ciByZXNwb25zZS4NCg0KDQpXZSBoYXZlIGFs
c28gZm91bmQgRURBQyBkcml2ZXIuDQoNCldoYXQgd2Ugd2FudCB0byBkbyBpcyB0byByZWNvcmQg
dGhlIEVDQyBldmVudHMgdG8gU0VMLg0KDQoNCndlIGFyZSBjb25zaWRlcmluZyB0byBjcmVhdGUg
bmV3IGRidXMgYW5kIGEgc2VydmljZS4NCg0KDQpEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnM/
DQoNCg0KQlJzLA0KDQpXaWxsDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQqx
SKXzqsw6IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+DQqxSKXzpOm0wTogMjAxOaZ+
MqTrMjGk6SCkVaTIIDAzOjEwDQqmrKXzqsw6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgV2ls
bCBMaWFuZyAoseelw7liKQ0KsMaluzogU3RlZmFuIE0gU2NoYWVja2VsZXINCqVEpq46IFJlOiBF
Q0MgbWVtb3J5IG9mIEJNQw0KDQpPbiBUaHUsIDIxIEZlYiAyMDE5LCBhdCAxNzoxNiwgV2lsbCBM
aWFuZyAoseelw7liKSB3cm90ZToNCj4NCj4gSGksDQo+DQo+IHdlIGFyZSB0cnlpbmcgdG8gZW5h
YmxlIEVDQyBvbiBCTUMgbWVtb3J5Lg0KPg0KPiBpcyB0aGVyZSBhbnkgZXhpc3Qgc29sdXRpb24g
b24gQk1DPw0KDQpXZWxsLCBmb3Igd2hhdCBpdCdzIHdvcnRoIGEga2VybmVsIGRyaXZlciBoYXMg
YmVlbiBzdWJtaXR0ZWQgdXBzdHJlYW0gYW5kIGlzDQpxdWV1ZWQgZm9yIHRoZSA1LjEgbWVyZ2Ug
d2luZG93Og0KDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9icC9icC5naXQvY29tbWl0Lz9oPWZvci1uZXh0JmlkPTliN2U2MjQyZWU0ZWZjZDdmOWVmNjk5
YmYxOTY1ZTNhNTM0M2YyMTYNCg0KVGhlIHBhdGNoIGRvZXMgc2F5IGl0IG5lZWRzIGJvb3Rsb2Fk
ZXIgc3VwcG9ydCB0aG91Z2gsIGFuZCBJJ20gbm90IGV4YWN0bHkNCnN1cmUgd2hhdCB0aGF0IGlu
dm9sdmVzLiBJJ3ZlIGFkZGVkIFN0ZWZhbiB0byBDYywgbWF5YmUgaGUgY2FuIHByb3ZpZGUgc29t
ZQ0KaW5zaWdodC4NCg0KQW5kcmV3DQo=

--_000_66dac7974c444060a9b4b1052b00d072quantatwcom_
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
<p>Hi Andrew,</p>
<p><br>
</p>
<p>Thanks for your response.</p>
<p><br>
</p>
<p>We have also found EDAC driver.</p>
<p>What we want to do is to record the ECC events to SEL.</p>
<p><br>
</p>
<p>we are considering to create new dbus and a service.</p>
<p><br>
</p>
<p>Do you have any suggestions?<br>
</p>
<br>
<p>BRs,</p>
<p>Will<br>
</p>
<div style=3D"color: rgb(0, 0, 0);">
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>=B1H=A5=F3=AA=CC:</b> Andrew =
Jeffery &lt;andrew@aj.id.au&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2019=A6~2=A4=EB21=A4=E9 =A4U=A4=C8 03:10<br>
<b>=A6=AC=A5=F3=AA=CC:</b> openbmc@lists.ozlabs.org; Will Liang (=B1=E7=A5=
=C3=B9b)<br>
<b>=B0=C6=A5=BB:</b> Stefan M Schaeckeler<br>
<b>=A5D=A6=AE:</b> Re: ECC memory of BMC </font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Thu, 21 Feb 2019, at 17:16, Will Liang (=B1=E7=
=A5=C3=B9b) wrote:<br>
&gt;&nbsp; <br>
&gt; Hi,<br>
&gt;&nbsp; <br>
&gt; we are trying to enable ECC on BMC memory.<br>
&gt;&nbsp; <br>
&gt; is there any exist solution on BMC?<br>
<br>
Well, for what it's worth a kernel driver has been submitted upstream and i=
s<br>
queued for the 5.1 merge window:<br>
<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/commit=
/?h=3Dfor-next&amp;id=3D9b7e6242ee4efcd7f9ef699bf1965e3a5343f216" id=3D"LPl=
nk600669" previewremoved=3D"true">https://git.kernel.org/pub/scm/linux/kern=
el/git/bp/bp.git/commit/?h=3Dfor-next&amp;id=3D9b7e6242ee4efcd7f9ef699bf196=
5e3a5343f216</a><br>
<br>
The patch does say it needs bootloader support though, and I'm not exactly<=
br>
sure what that involves. I've added Stefan to Cc, maybe he can provide some=
<br>
insight.<br>
<br>
Andrew<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_66dac7974c444060a9b4b1052b00d072quantatwcom_--
