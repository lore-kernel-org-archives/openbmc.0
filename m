Return-Path: <nolan.hergert@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vC72w0x3TzDq5f
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 11:50:13 +1100 (AEDT)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP; 30 Jan 2017 16:50:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,312,1477983600"; d="scan'208";a="928375733"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by orsmga003.jf.intel.com with ESMTP; 30 Jan 2017 16:50:00 -0800
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.118]) by
 ORSMSX107.amr.corp.intel.com ([10.22.240.5]) with mapi id 14.03.0248.002;
 Mon, 30 Jan 2017 16:50:00 -0800
From: "Hergert, Nolan" <nolan.hergert@intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
CC: OpenBMC <openbmc@lists.ozlabs.org>
Subject: RE: GPIO offsets used by userspace
Thread-Topic: GPIO offsets used by userspace
Thread-Index: AQHSe1i01YC9kct4LES1dBLUBDTtwKFRv0Fw
Date: Tue, 31 Jan 2017 00:50:00 +0000
Message-ID: <20F6DE8D093BC149AEF7D895510943F51447A0ED@ORSMSX101.amr.corp.intel.com>
References: <1485740080.4137.21.camel@aj.id.au>
 <CACPK8XeOQPONhwQ4Q6bPUp7=-AoFArXwCmzDC-tors00i_u=tg@mail.gmail.com>
In-Reply-To: <CACPK8XeOQPONhwQ4Q6bPUp7=-AoFArXwCmzDC-tors00i_u=tg@mail.gmail.com>
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
X-List-Received-Date: Tue, 31 Jan 2017 00:50:16 -0000

Q29ycmVjdCBtZSBpZiBJJ20gd3JvbmcsIGJ1dCBJIHRoaW5rIHRoZSBtYWludGFpbmVycyBhcmUg
bW92aW5nIGF3YXkgZnJvbSBsaXRlcmFsIGdwaW8gbnVtYmVycyB0byBuYW1lZCBkZXNjcmlwdG9y
cyAoImRpc2tfbGVkIikgaW4gdGhlIGRldmljZSB0cmVlLCBhcyB3ZSdyZSBtb3ZpbmcgdG8gbW9y
ZSBkeW5hbWljIGhhcmR3YXJlIGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy81MzM2MzIvLiBMaW51
cyBXYWxsZWlqJ3MgdGFsayB3YXMgaGVscGZ1bCAgZm9yIG1lIHRvbzogaHR0cDovL2VsaW51eC5v
cmcvaW1hZ2VzLzkvOWIvR1BJT19mb3JfRW5naW5lZXJzX2FuZF9NYWtlcnMucGRmIA0KDQpOb2xh
bg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyBbbWFpbHRvOm9w
ZW5ibWMtYm91bmNlcytub2xhbi5oZXJnZXJ0PWludGVsLmNvbUBsaXN0cy5vemxhYnMub3JnXSBP
biBCZWhhbGYgT2YgSm9lbCBTdGFubGV5DQpTZW50OiBNb25kYXksIEphbnVhcnkgMzAsIDIwMTcg
NDoyNiBQTQ0KVG86IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+DQpDYzogT3BlbkJN
QyA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogUmU6IEdQSU8gb2Zmc2V0cyB1
c2VkIGJ5IHVzZXJzcGFjZQ0KDQpPbiBNb24sIEphbiAzMCwgMjAxNyBhdCAxMjowNCBQTSwgQW5k
cmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4gd3JvdGU6DQo+IEhpIGFsbCwNCj4NCj4gSnVz
dCBhIGhlYWRzIHVwIHRoYXQgd2hlbiB0aGUgbGlua2VkIHBhdGNoIGlzIHB1bGxlZCBpbnRvIHRo
ZSBPcGVuQk1DIA0KPiBrZXJuZWwgaXQgd2lsbCBicmVhayBvdXIgdXNlcnNwYWNlLiBXZSB3aWxs
IG5lZWQgdG8gc3luY2hyb25pc2UgdGhlIA0KPiBrZXJuZWwgYnVtcCB3aXRoIHRoZSBmaXhlcyBm
b3IgdGhlIG1hY2hpbmUgY29uZmlncyB0byB1cGRhdGUgdGhlIG1hZ2ljIA0KPiBHUElPIG9mZnNl
dCBudW1iZXIuDQo+DQo+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE3LzEvMjYvNzg2DQo+DQo+
IFRoZSBtYWdpYyBvZmZzZXQgaXMgZXNzZW50aWFsbHkgNTEyLShuZ3Bpb3MpIChJIGRvbid0IGtu
b3cgd2h5LCBidXQgDQo+IHRoYXQncyB0aGUgYmVoYXZpb3VyKSwgYW5kIHRoaXMgbm93IHZhcmll
cyBiZXR3ZWVuIEFTVDI0MDAgYW5kIEFTVDI1MDAgDQo+IHN5c3RlbXMgZHVlIHRvIHRoZSBBU1Qy
NTAwIGhhdmluZyBhbiBleHRyYSBiYW5rLCBhbmQgYWxzbyBiZWNhdXNlIHRoZQ0KPiBBU1QyNDAw
IGhhcyBhICJob2xlIiBhdCB0aGUgZW5kIG9mIGl0cyBHUElPIG51bWJlciBzcGFjZS4NCg0KQ2Fu
IHlvdSBzdWdnZXN0IGEgd2F5IHRvIGRldGVjdCB0aGlzIGZyb20gdXNlcnNwYWNlPw0KDQpXb3Vs
ZCB1c2luZyB0aGUgY2hhcmRldiBhcGkgbWFrZSB0aGlzIGVhc2llcj8NCg0KQ2hlZXJzLA0KDQpK
b2VsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kb3Bl
bmJtYyBtYWlsaW5nIGxpc3QNCm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KaHR0cHM6Ly9saXN0
cy5vemxhYnMub3JnL2xpc3RpbmZvL29wZW5ibWMNCg==
