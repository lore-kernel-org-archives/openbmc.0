Return-Path: <prvs=002ed725b=George.Hung@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=002ed725b=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 44jrgM688FzDq6q
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 13:38:19 +1000 (AEST)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx01.quantatw.com with ESMTP; 16 Apr 2019 11:38:16 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 16 Apr
 2019 11:38:15 +0800
Received: from mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc]) by
 mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc%4]) with mapi id
 15.01.1713.004; Tue, 16 Apr 2019 11:38:15 +0800
From: =?utf-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
To: Patrick Venture <venture@google.com>
CC: "OpenBMC Maillist (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>, 
 "emilyshaffer@google.com" <emilyshaffer@google.com>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>,
 "tomjoseph@in.ibm.com" <tomjoseph@in.ibm.com>
Subject: RE: Sending I2C command via google-ipmi i2c
Thread-Topic: Sending I2C command via google-ipmi i2c
Thread-Index: AQHU8TtTbcluPTqM8U6VWcws9ejeS6Y+JFXA
Date: Tue, 16 Apr 2019 03:38:15 +0000
Message-ID: <beecc86d0b8d41b88a96a8b06846a28f@quantatw.com>
References: <81e4866b111a47d991f767df3c6b4b0a@quantatw.com>
 <CAO=notw_E+LJJ5jMmdACajshiTebufgZgwDOGa6op8f1-Phkxw@mail.gmail.com>
In-Reply-To: <CAO=notw_E+LJJ5jMmdACajshiTebufgZgwDOGa6op8f1-Phkxw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24552.004
x-tm-as-result: No--21.577500-0.000000-31
x-tm-as-matchedid: 140026-150567-701625-704425-700685-139006-139010-710556-7
 00648-700574-106660-707451-700075-110462-702643-709584-121169-701053-105250
 -700476-701594-702358-700869-121536-701513-708303-707617-700185-700624-1062
 30-121624-704496-702037-702050-704102-701021-148004-148133-20043-42000-4200
 3-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
X-List-Received-Date: Tue, 16 Apr 2019 03:38:25 -0000

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXRyaWNrIFZlbnR1cmUgW21h
aWx0bzp2ZW50dXJlQGdvb2dsZS5jb21dDQo+IFNlbnQ6IEZyaWRheSwgQXByaWwgMTIsIDIwMTkg
MTA6MjMgUE0NCj4gVG86IEdlb3JnZSBIdW5nICjmtKrlv6DmlawpDQo+IENjOiBPcGVuQk1DIE1h
aWxsaXN0IChvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcpOyBQYXRyaWNrIFZlbnR1cmUNCj4gKHZl
bnR1cmVAZ29vZ2xlLmNvbSk7IGVtaWx5c2hhZmZlckBnb29nbGUuY29tOw0KPiBiZW5qYW1pbmZh
aXJAZ29vZ2xlLmNvbTsgdmVybm9uLm1hdWVyeUBsaW51eC5pbnRlbC5jb207DQo+IHRvbWpvc2Vw
aEBpbi5pYm0uY29tDQo+IFN1YmplY3Q6IFJlOiBTZW5kaW5nIEkyQyBjb21tYW5kIHZpYSBnb29n
bGUtaXBtaSBpMmMNCj4gDQo+IE9uIFRodSwgQXByIDExLCAyMDE5IGF0IDEwOjQ2IFBNIEdlb3Jn
ZSBIdW5nICjmtKrlv6DmlawpDQo+IDxHZW9yZ2UuSHVuZ0BxdWFudGF0dy5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gSGkgYWxsLA0KPiA+DQo+ID4NCj4gPg0KPiA+IEnigJltIHRyeWluZyB0byBzZW5k
aW5nIGlwbWkgSTJDIGNvbW1hbmQgdmlhIGdvb2dsZS1pcG1pLWkyYyBleHRlbnNpb24sDQo+ID4N
Cj4gPiBidXQgSSB3aWxsIGdldCB0aGUgcmVzcG9uc2UgZXJyb3IsIOKAnFVuc3BlY2lmaWVkIGVy
cm9y4oCdIGZyb20gaXBtaXRvb2wuDQo+ID4NCj4gPg0KPiA+DQo+ID4gVGhlcmUgYXJlIHRoZSBj
b21tYW5kIGFuZCByZXNwb25zZSBleGFtcGxlIGJlbG93Og0KPiA+DQo+ID4NCj4gPg0KPiA+ICMg
aXBtaXRvb2wgcmF3IDB4MmUgMHgwMiAweDc5IDB4MmIgMHgwMCAxIDAgMHg5OCAwIDEgMCAweDk5
IDAgMg0KPiA+DQo+ID4gVW5hYmxlIHRvIHNlbmQgUkFXIGNvbW1hbmQgKGNoYW5uZWw9MHgwIG5l
dGZuPTB4MmUgbHVuPTB4MCBjbWQ9MHgyDQo+ID4gcnNwPTB4ZmYpOiBVbnNwZWNpZmllZCBlcnJv
cg0KPiA+DQo+ID4NCj4gPg0KPiA+IEkgY2hlY2sgdGhlIGVycm9yIG1lc3NhZ2UgZnJvbSBqb3Vy
bmFsIGFuZCBpdCBpbmRpY2F0ZXMgdGhhdCBjYW5ub3Qgb3Blbg0KPiAvZGV2L2kyYy0xMjEgYW5k
IEkgdGhpbmsgaXQgdXNlZCB0aGUgZmlyc3QgYnl0ZSBvZiBJQU5BIG51bWJlciAoMHg3OSkgYXMg
YnVzDQo+IG51bWJlci4NCj4gDQo+IEkgaGF2ZSBhIGxpdHRsZSBicmVha291dCBJIHVzZToNCj4g
aXBtaXRvb2wgLUkgZGJ1cyByYXcgMHgyZSAweDA1IDB4Y2YgMHhjMiAweDAwIDB4MDAgMHgwMiAw
eDAwIDB4MDAgMHgwMA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8LS18ICAg
IHwtLXwgICAgfC0tLS0tLS0tLS0tLXwNCj4gfC0tLS0tLS0tLS0tLS0tLS0tLS0tLS18DQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgfCAgICAgICAgfA0KPiB8ICAg
cmVxQnVmDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgfCAgICAg
ICAgfCBvZW0gZ3JvdXANCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAg
ICB8IGNvbW1hbmQNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBuZXRmbiBm
b3Igb2VtDQo+IA0KPiBTbyAweDJlIGlzIHRoZSBuZXRmbiwgcHJvcGVybHkgcGFyc2VkLg0KPiBT
byAweDAyIGlzIHRoZSBjb21tYW5kLCBwcm9wZXJseSBwYXJzZWQuDQo+IFNvIDB4NzkgMHgyYiAw
eDAwIGlzIHRoZSBPRU0gZ3JvdXANCj4gU28gMHgwMCAxIDAgMHg5OCAwIDEgMCAweDk5IDAgMiBp
cyB0aGUgY29tbWFuZCBwYXlsb2FkDQo+IA0KPiBBcyB5b3Ugc2F5LCBpdCBzb3VuZHMgbGlrZSB0
aGVyZSdzIGEgYnVnIGluIHBhcnNpbmcgdGhlIGxlbmd0aCBvZiB0aGUgT0VNIGdyb3VwDQo+IG51
bWJlci4gIFdlIGhhdmVuJ3QgcmViYXNlZCBvbnRvIHRoZSBuZXdlc3QgaXBtaWQgZG93bnN0cmVh
bSwgc28gd2UNCj4gaGF2ZW4ndCB0ZXN0ZWQgaXQgb3Vyc2VsdmVzLiAgQnV0IHRoaXMgc291bmRz
IGxpa2UgYSBidWcgaW4gdGhlIG5ldyBpcG1pZC4NCj4gDQo+IElJUkMsIHRoZXkgd2VyZW4ndCBw
cm9wZXJseSBoYW5kbGluZyBPRU0gZ3JvdXBzIGFuZCByZWNlbnRseSBmaXhlZCBpdC4NCj4gUGxl
YXNlIHNwZWNpZnkgdGhlIFNIQTEgb2YgdGhlIHBob3NwaG9yLWhvc3QtaXBtaWQgc291cmNlIHlv
dSdyZSB1c2luZyB0bw0KPiBidWlsZCB0aGlzLg0KDQpTSEExIFJldmlzaW9uOiBjNDZmNmNkN2Rj
NDdjY2FmY2QyZTg2ZTE2MGEzMmZlMWJlNDA0ZTdlDQoNCj4gDQo+ID4NCj4gPg0KPiA+DQo+ID4g
SGFzIGFueW9uZSBldmVyIG1ldCB0aGlzIHNpdHVhdGlvbiA/IG9yIHNvbWV0aGluZyBJIGhhdmUg
dG8gY29uZmlndXJlIGZvcg0KPiBwaG9zcGhvci1pcG1pLWhvc3QgLyBnb29nbGUtaXBtaS1pMmMg
Pw0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPiBCZXN0IFJlZ2FyZHMNCj4gPg0KPiA+IEdl
b3JnZSBIdW5nDQoNCg0KQlJzDQoNCkdlb3JnZSBIdW5nDQo=
