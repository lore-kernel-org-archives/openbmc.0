Return-Path: <nolan.hergert@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vC7n04hMMzDqFR
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 12:23:16 +1100 (AEDT)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP; 30 Jan 2017 17:23:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,312,1477983600"; d="scan'208";a="1089108380"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by orsmga001.jf.intel.com with ESMTP; 30 Jan 2017 17:23:14 -0800
Received: from orsmsx157.amr.corp.intel.com (10.22.240.23) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.248.2; Mon, 30 Jan 2017 17:23:14 -0800
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.118]) by
 ORSMSX157.amr.corp.intel.com ([169.254.9.130]) with mapi id 14.03.0248.002;
 Mon, 30 Jan 2017 17:23:14 -0800
From: "Hergert, Nolan" <nolan.hergert@intel.com>
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "Patrick
 Williams" <patrick@stwcx.xyz>
CC: OpenBMC <openbmc@lists.ozlabs.org>
Subject: RE: GPIO offsets used by userspace
Thread-Topic: GPIO offsets used by userspace
Thread-Index: AQHSe1i01YC9kct4LES1dBLUBDTtwKFRv0FwgACOX4D//3ygwA==
Date: Tue, 31 Jan 2017 01:23:13 +0000
Message-ID: <20F6DE8D093BC149AEF7D895510943F51447A399@ORSMSX101.amr.corp.intel.com>
References: <1485740080.4137.21.camel@aj.id.au>
 <CACPK8XeOQPONhwQ4Q6bPUp7=-AoFArXwCmzDC-tors00i_u=tg@mail.gmail.com>
 <20F6DE8D093BC149AEF7D895510943F51447A0ED@ORSMSX101.amr.corp.intel.com>
 <1485825155.4137.23.camel@aj.id.au>
In-Reply-To: <1485825155.4137.23.camel@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jan 2017 01:23:17 -0000

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFuZHJldyBKZWZmZXJ5IFttYWlsdG86
YW5kcmV3QGFqLmlkLmF1XSANClNlbnQ6IE1vbmRheSwgSmFudWFyeSAzMCwgMjAxNyA1OjEzIFBN
DQpUbzogSGVyZ2VydCwgTm9sYW4gPG5vbGFuLmhlcmdlcnRAaW50ZWwuY29tPjsgSm9lbCBTdGFu
bGV5IDxqb2VsQGptcy5pZC5hdT47IFBhdHJpY2sgV2lsbGlhbXMgPHBhdHJpY2tAc3R3Y3gueHl6
Pg0KQ2M6IE9wZW5CTUMgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFJlOiBH
UElPIG9mZnNldHMgdXNlZCBieSB1c2Vyc3BhY2UNCg0KSGkgTm9sYW4hDQoNCk9uIFR1ZSwgMjAx
Ny0wMS0zMSBhdCAwMDo1MCArMDAwMCwgSGVyZ2VydCwgTm9sYW4gd3JvdGU6DQo+IENvcnJlY3Qg
bWUgaWYgSSdtIHdyb25nLCBidXQgSSB0aGluayB0aGUgbWFpbnRhaW5lcnMgYXJlIG1vdmluZyBh
d2F5IA0KPiBmcm9tIGxpdGVyYWwgZ3BpbyBudW1iZXJzIHRvIG5hbWVkIGRlc2NyaXB0b3JzICgi
ZGlza19sZWQiKSBpbiB0aGUgDQo+IGRldmljZSB0cmVlLCBhcyB3ZSdyZSBtb3ZpbmcgdG8gbW9y
ZSBkeW5hbWljIGhhcmR3YXJlIA0KPiBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvNTMzNjMyLy4g
TGludXMgV2FsbGVpaidzIHRhbGsgd2FzIGhlbHBmdWzCoMKgDQo+IGZvciBtZSB0b286DQo+IGh0
dHA6Ly9lbGludXgub3JnL2ltYWdlcy85LzliL0dQSU9fZm9yX0VuZ2luZWVyc19hbmRfTWFrZXJz
LnBkZg0KDQpZb3UncmUgcmlnaHQsIGFuZCB0aGF0J3Mgd2hhdCB3ZSBzaG91bGQgYmUgYWltaW5n
IGZvciBpZiBzb21lb25lIGhhcyB0aGUgdGltZSB0byBkbyB0aGUgd29yay4gSW4gdGhlIHNob3J0
IHRlcm0sIHdlICpjYW4qIGp1c3QgY2hhbmdlIHRoZSBoYWNreSBvZmZzZXQgbnVtYmVycyB0aGF0
IGFscmVhZHkgZXhpc3QgaW4gdGhlIHVzZXJzcGFjZSB0byB3b3JrIGFyb3VuZCB0aGUgcHJvYmxl
bS4gSXQncyBkaXN0YXN0ZWZ1bCwgYnV0IG5vdCB3b3JzZSB0aGFuIHdoYXQgd2UgYWxyZWFkeSBo
YXZlLg0KDQpQYXRyaWNrOiBEaWQgeW91IGhhdmUgYW55IHBsYW5zIGZvciByZXdvcmtpbmcgdGhl
IHVzZXJzcGFjZSBiaXRzPw0KDQpDaGVlcnMsDQoNCkFuZHJldw0KDQpQUzogcGxlYXNlIHRyeSB0
byByZXBseSBpbi1saW5lIHJhdGhlciB0aGFuIHRvcC1wb3N0aW5nLCB0aGF0IHdheSB0aGUgY29u
dGV4dCBvZiB0aGUgY29udmVyc2F0aW9uIGlzIGEgYml0IGVhc2llciB0byB0cmFjay4NCg0KR2xh
ZCB0bywgdGhhbmtzIGZvciB0aGUgaGVhZHMgdXAuIA0KDQo+IA0KPiBOb2xhbg0KPiANCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmJtYyBbbWFpbHRvOm9wZW5ibWMt
Ym91bmNlcytub2xhbi5oZXJnZXJ0PWludGVsLmNvbUBsaXN0cy5vDQo+IHpsYWJzLm9yZ10gT24g
QmVoYWxmIE9mIEpvZWwgU3RhbmxleQ0KPiBTZW50OiBNb25kYXksIEphbnVhcnkgMzAsIDIwMTcg
NDoyNiBQTQ0KPiBUbzogQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4NCj4gQ2M6IE9w
ZW5CTUMgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCj4gU3ViamVjdDogUmU6IEdQSU8gb2Zm
c2V0cyB1c2VkIGJ5IHVzZXJzcGFjZQ0KPiANCj4gT24gTW9uLCBKYW4gMzAsIDIwMTcgYXQgMTI6
MDQgUE0sIEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+DQo+IHdyb3RlOg0KPiA+IEhp
IGFsbCwNCj4gPiANCj4gPiBKdXN0IGEgaGVhZHMgdXAgdGhhdCB3aGVuIHRoZSBsaW5rZWQgcGF0
Y2ggaXMgcHVsbGVkIGludG8gdGhlIA0KPiA+IE9wZW5CTUMga2VybmVsIGl0IHdpbGwgYnJlYWsg
b3VyIHVzZXJzcGFjZS4gV2Ugd2lsbCBuZWVkIHRvIA0KPiA+IHN5bmNocm9uaXNlIHRoZSBrZXJu
ZWwgYnVtcCB3aXRoIHRoZSBmaXhlcyBmb3IgdGhlIG1hY2hpbmUgY29uZmlncyANCj4gPiB0byB1
cGRhdGUgdGhlIG1hZ2ljIEdQSU8gb2Zmc2V0IG51bWJlci4NCj4gPiANCj4gPiBodHRwczovL2xr
bWwub3JnL2xrbWwvMjAxNy8xLzI2Lzc4Ng0KPiA+IA0KPiA+IFRoZSBtYWdpYyBvZmZzZXQgaXMg
ZXNzZW50aWFsbHkgNTEyLShuZ3Bpb3MpIChJIGRvbid0IGtub3cgd2h5LCBidXQgDQo+ID4gdGhh
dCdzIHRoZSBiZWhhdmlvdXIpLCBhbmQgdGhpcyBub3cgdmFyaWVzIGJldHdlZW4gQVNUMjQwMCBh
bmQNCj4gPiBBU1QyNTAwDQo+ID4gc3lzdGVtcyBkdWUgdG8gdGhlIEFTVDI1MDAgaGF2aW5nIGFu
IGV4dHJhIGJhbmssIGFuZCBhbHNvIGJlY2F1c2UgDQo+ID4gdGhlDQo+ID4gQVNUMjQwMCBoYXMg
YSAiaG9sZSIgYXQgdGhlIGVuZCBvZiBpdHMgR1BJTyBudW1iZXIgc3BhY2UuDQo+IA0KPiBDYW4g
eW91IHN1Z2dlc3QgYSB3YXkgdG8gZGV0ZWN0IHRoaXMgZnJvbSB1c2Vyc3BhY2U/DQo+IA0KPiBX
b3VsZCB1c2luZyB0aGUgY2hhcmRldiBhcGkgbWFrZSB0aGlzIGVhc2llcj8NCj4gDQo+IENoZWVy
cywNCj4gDQo+IEpvZWwNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCj4gb3BlbmJtYyBtYWlsaW5nIGxpc3QNCj4gb3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnDQo+IGh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9vcGVuYm1jDQo=
