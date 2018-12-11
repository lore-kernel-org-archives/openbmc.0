Return-Path: <yao.yuan@hxt-semitech.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hxt-semitech.com
 (client-ip=223.203.96.7; helo=barracuda.hxt-semitech.com;
 envelope-from=yao.yuan@hxt-semitech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hxt-semitech.com
Received: from barracuda.hxt-semitech.com (mx01.hxt-semitech.com
 [223.203.96.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DYjD5J4qzDqsJ
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 19:57:02 +1100 (AEDT)
X-ASG-Debug-ID: 1544518615-093b7e254000950001-mgJK9t
Received: from HXTBJIDCEMVIW01.hxtcorp.net ([10.128.0.14]) by
 barracuda.hxt-semitech.com with ESMTP id oZu2KZIfKOF35ebI (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Tue, 11 Dec 2018 16:56:55 +0800 (CST)
X-Barracuda-Envelope-From: yao.yuan@hxt-semitech.com
Received: from HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) by
 HXTBJIDCEMVIW01.hxtcorp.net (10.128.0.14) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Dec 2018 16:56:03 +0800
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6]) by
 HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6%12]) with mapi id
 15.00.1395.000; Tue, 11 Dec 2018 16:56:03 +0800
From: "Yuan, Yao" <yao.yuan@hxt-semitech.com>
To: Lei YU <mine260309@gmail.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: How to operate the gpio
Thread-Topic: How to operate the gpio
X-ASG-Orig-Subj: RE: How to operate the gpio
Thread-Index: AdSRIglwC0lBo/CiRFCLFEn5LdT91///hCuA//9tN+A=
Date: Tue, 11 Dec 2018 08:56:02 +0000
Message-ID: <37665324bacb42728ccfbb5fb270cffd@HXTBJIDCEMVIW02.hxtcorp.net>
References: <8560e4ac81e042deab46bf6b22b2fd1b@HXTBJIDCEMVIW02.hxtcorp.net>
 <CAARXrt=QWwVu5pJEWQr7tZYsrt5QNm88QtVfDd7V88FgUXWpZA@mail.gmail.com>
In-Reply-To: <CAARXrt=QWwVu5pJEWQr7tZYsrt5QNm88QtVfDd7V88FgUXWpZA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.64.1.64]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.128.0.14]
X-Barracuda-Start-Time: 1544518615
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.101:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.4784 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.63564
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
X-List-Received-Date: Tue, 11 Dec 2018 08:57:06 -0000

PiA+IEFuZCBJIGFsc28gZmluZCBhIHB5dGhvbiBzY3JpcHRzIGluIG9ibWM6IGdwaW91dGlsDQo+
ID4NCj4gPiBCdXQgaXQgbmVlZCBpbXBvcnQgb2JtY19zeXN0ZW1fY29uZmlnDQo+ID4NCj4gPiA+
Pj4gaW1wb3J0IG9ibWNfc3lzdGVtX2NvbmZpZw0KPiA+DQo+ID4gVHJhY2ViYWNrIChtb3N0IHJl
Y2VudCBjYWxsIGxhc3QpOg0KPiA+DQo+ID4gICBGaWxlICI8c3RkaW4+IiwgbGluZSAxLCBpbiA8
bW9kdWxlPg0KPiA+DQo+ID4gSW1wb3J0RXJyb3I6IE5vIG1vZHVsZSBuYW1lZCBvYm1jX3N5c3Rl
bV9jb25maWcNCj4gPg0KPiA+DQo+ID4NCj4gPiBEb2VzIGFueW9uZSBrbm93IGhvdyB0byBpbnN0
YWxsIHRoaXMgbW9kdWxlIGluIG9ibWM/DQo+ID4NCj4gPg0KPiA+DQo+ID4gT3IgZG9lcyBhbnlv
bmUga25vdyBhIGJldHRlciB3YXkgdG8gb3BlcmF0ZSB0aGUgZ3Bpbz8NCj4gDQo+IGdwaW91dGls
IGlzIGFuIGNvbnZlbmllbnQgdXRpbCB0byBvcGVyYXRlIGdwaW8gaW4gdXNlciBzcGFjZS4NCj4g
DQo+IFRoZSAib2JtY19zeXN0ZW1fY29uZmlnIiBpcyBzb21ldGhpbmcgbGVnYWN5IGFuZCB3aWxs
IGJlIGRlcHJlY2F0ZWQsIHdoaWNoIGlzDQo+IGluc3RhbGxlZCBieSAid29ya2Jvb2siIHJlY2lw
ZSwgZS5nLiBbUm9tdWx1cyB3b3JrYm9va11bMV0gaXMgZnJvbSBza2VsZXRvbidzDQo+IFJvbXVs
dXMucHksIG9yIGEgZHVtbXkgcHl0aG9uIGNvbmZpZyBkZWZpbmVkIGJ5IFttZXRhLXE3MWxdWzJd
DQoNCkl0IHNlZW1zIEkgc3RpbGwgY2FuJ3QgZmluZCBvYm1jX3N5c3RlbV9jb25maWcgaW4gc2tl
bGV0b24gZ2l0IHRyZWU/DQpEbyB5b3Uga25vdyB3aGVyZSBpcyB0aGUgY29kZSBmb3Igb2JtY19z
eXN0ZW1fY29uZmlnPw0KDQo+IE9wdGlvbmFsbHksIHlvdSBjb3VsZCB0cnkgdG8gcmVtb3ZlIHRo
ZSBkZXBlbmRlbmN5IG9mICJvYm1jX3N5c3RlbV9jb25maWciIGluDQo+IGdwaW91dGlsLCBhbmQg
cGF0Y2hlcyBhcmUgd2VsY29tZSA6RA0KPiANCg0Kb2JtY19zeXN0ZW1fY29uZmlnIGlzIGp1c3Qg
dXNlZCBmb3IgZ2V0IHRoZSBHUElPIGJ5IG5hbWUoTGlrZSBRNCwgRjUgYW5kIHNvIG9uKSwgc28g
aXQncyBlYXN5IHRvIHJlbW92ZSBpZiB3ZSBkb24ndCBuZWVkIGdldCB0aGUgZnVsbCBHUElPIGlu
Zm8gYnkgbmFtZS4oc3VjaCBhcyBieSBncGlvIG51bSkNCkJ1dCBpZiB3ZSBzdGlsbCB3YW50IHRv
IGdldCB0aGUgR1BJTyBmdWxsIGluZm8gYnkgbmFtZSwgd2UgbWF5IG5lZWQgc29tZSBvdGhlciBt
ZWNoYW5pc21zIHRvIGdldCB0aGUgR1BJTyBieSBuYW1lIHdoaWNoIHdpbGwgcmVwbGFjZSB0aGUg
b2JtY19zeXN0ZW1fY29uZmlnLg0KDQpJJ20gbm90IHN1cmUgaXMgdGhlcmUgYW55IG1lY2hhbmlz
bSBpbiBvYm1jIG5vdyB1c2VkIHRvIHJlcGxhY2UgdGhlIG9ibWNfc3lzdGVtX2NvbmZpZz8NCg0K
PiBbMV06DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvdHJlZS9tYXN0ZXIv
bWV0YS1pYm0vbWV0YS1yb211bHVzL3INCj4gZWNpcGVzLXBob3NwaG9yL3dvcmtib29rDQo+IFsy
XToNCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy90cmVlL21hc3Rlci9tZXRh
LXF1YW50YS9tZXRhLXE3MWwvcg0KPiBlY2lwZXMtcGhvc3Bob3Ivd29ya2Jvb2sNCg==
