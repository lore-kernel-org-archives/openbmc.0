Return-Path: <shays@mellanox.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0050.outbound.protection.outlook.com [104.47.2.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ryB4253fyzDqYq
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jul 2016 03:20:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b=eBBfzqhp; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=H80aB5/m0tp5kxfbN7Fyp4+C4V6GE/n2X7C8dzLfn68=;
 b=eBBfzqhpTMygO7zQ1lKrpNY0BnDUGEoebVYgNhEx/6LdLvn3XX3yY3oT38b5TlJOfQLMr/iJZjyC/isPglayMGaadaYz8YD+vMdzrYvC6eiLgJxX2tBi8sTXCteoLlfqxCRi3q5Syb0kKUBn9le/Gz1ntIrMddSezO70/K/p6U4=
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com (10.161.249.145) by
 DB4PR05MB0943.eurprd05.prod.outlook.com (10.161.249.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.544.10; Sun, 24 Jul 2016 11:45:27 +0000
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) by
 DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) with mapi id
 15.01.0544.019; Sun, 24 Jul 2016 11:45:27 +0000
From: Shay Slobodkin <shays@mellanox.com>
To: Joel Stanley <joel@jms.id.au>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Aspeed 2500 EVB i2c transaction time out
Thread-Topic: Aspeed 2500 EVB i2c transaction time out
Thread-Index: AdHjPh18jT8yNP68Tle3f/Ll01NEgAAL8yuAAIyfMnA=
Date: Sun, 24 Jul 2016 11:45:27 +0000
Message-ID: <DB4PR05MB0941D946BC03E134592BCA21D50C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
References: <DB4PR05MB0941FC06CBEC427C99A40C80D5090@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <CACPK8Xf-jSXs=EcF3tQrC7xeFkKXOhXxPxz=6pBQ9408-uhcHA@mail.gmail.com>
In-Reply-To: <CACPK8Xf-jSXs=EcF3tQrC7xeFkKXOhXxPxz=6pBQ9408-uhcHA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shays@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-office365-filtering-correlation-id: e99eccfd-e63b-440e-983c-08d3b3b801eb
x-microsoft-exchange-diagnostics: 1; DB4PR05MB0943;
 6:J0HzdCxd52NZZ/vOf1Qzv4hXZOecsvwNSXJZTKrslQFlHtjY+LVZiCxF+cKxuKOMnvB1UyEzy2m8Kz2Hh8XGw6QHabUZooCTVmzke7vAYVb29hTvCZxERfLjtdlE4ekgnOv3SAvWGXHoA0jtalfYr/qq4RqzqEAkIyvD9s8d0H/LKeZdZ92voOH1Lxlt2Ir6BweBGBqL2TW/mRo/IyoVLnJw3gDXSQSFVSPR6fp1Le+JTMWUAVzhn+HNRceeBK4YOVGfzweirk/++xfRkslEVYZ09ONG0W1Z8v22BN6tYSLzVwNmrd5UTFEtFBOONlEWzCHsgCNmbcds+qMmHf1rhw==;
 5:mYfly/f2f1LCYOHS4p3KtyvHiTuQRdTBYb5LVWZGib+XFc9tzk5Iyc6aRFmO3a9wwbhwNf2iZbc7/Y5FEDNTN+p2ngkAtJc/ZsFmU0nGc0eSZ9ZP6lPUz5rHGW/1M+bJiy0jtreepD5vmKaJnM6fHw==;
 24:xvBoLwSu0k8OmjpcivfXVU3kqHWm6C0HGsiF4o6ST5Dk6VEnDwJbM+Tj4/nJfrLBe6qsCTWOaGXg+fc2Lt/2IvuooGH60jXpv549P62xeIw=;
 7:Nl86N0QgxUczYNGB+A8ZmL05VW/nqMduNFVRtcaGqipX8aTwc83sKLs0xwXCWPWJ71D5L44uVqYIwNi3rVqFpX8HLdQPO8PtFlUjsuoZq9wpbb6s1vfxEYNvDWfvP5ozVkHqDozFQyxkft2PPaiDZvSXU3f2r1aSKhI7U9quezSFmkUjYade3Brz92T9Y4HskKqLH89v3Lln2gZ4eB5j6R+cm0nZfTDKlV2R+7oafllZb1oDZ9r00AuXZJ61sG53
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR05MB0943;
x-microsoft-antispam-prvs: <DB4PR05MB0943B6E8478D8B531AAABF9CD50C0@DB4PR05MB0943.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(65623756079841)(21532816269658); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
 SRVR:DB4PR05MB0943; BCL:0; PCL:0; RULEID:; SRVR:DB4PR05MB0943; 
x-forefront-prvs: 0013079544
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(377454003)(51914003)(24454002)(189002)(13464003)(199003)(3280700002)(3846002)(102836003)(68736007)(6116002)(19580405001)(19580395003)(87936001)(101416001)(76176999)(54356999)(76576001)(50986999)(586003)(3660700001)(8676002)(9686002)(10400500002)(86362001)(92566002)(11100500001)(5002640100001)(106356001)(122556002)(97736004)(189998001)(66066001)(551934003)(33656002)(81156014)(4326007)(8936002)(81166006)(105586002)(15975445007)(77096005)(2900100001)(305945005)(7696003)(2906002)(2950100001)(7846002)(110136002)(5003600100003)(7736002)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR05MB0943;
 H:DB4PR05MB0941.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2016 11:45:27.4631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR05MB0943
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Jul 2016 17:20:53 -0000

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGpvZWwuc3RhbkBnbWFpbC5j
b20gW21haWx0bzpqb2VsLnN0YW5AZ21haWwuY29tXSBPbiBCZWhhbGYgT2YgSm9lbA0KPiBTdGFu
bGV5DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDIxLCAyMDE2IDc6MzYgUE0NCj4gVG86IFNoYXkg
U2xvYm9ka2luIDxzaGF5c0BtZWxsYW5veC5jb20+DQo+IENjOiBvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmcNCj4gU3ViamVjdDogUmU6IEFzcGVlZCAyNTAwIEVWQiBpMmMgdHJhbnNhY3Rpb24gdGlt
ZSBvdXQNCg0KSGVsbG8gSm9lbCwNCg0KVGhhbmtzIGZvciB5b3VyIGFuc3dlci4NClVudGlsIHdl
IG1lcmdlIGZyb20gcmVtb3RlIHRoZSBuZXcga2VybmVsIHRyZWVzIHlvdSB3aWxsIHB1c2gsIEkg
d2FzIHdvbmRlcmluZyB3aHkgaW4gYXNwZWVkLmMgZm9yIEVWQiB3ZSBoYXZlIHRoZSBiZWxvdyBt
YXBwaW5nICh0aGVyZSBpcyBubyBpMmMgYnVzIGhlcmUpOiANCnN0YXRpYyBzdHJ1Y3QgcGluY3Ry
bF9tYXAgYXN0MjUwMF9tYXBwaW5nW10gX19pbml0ZGF0YSA9IHsNCiAgICAgICAgUElOX01BUF9N
VVhfR1JPVVBfREVGQVVMVCgiaTJjLTgiLCAiMWU2ZTIwMDAucGlubXV4IiwgTlVMTCwgIkkyQzki
KSwNCiAgICAgICAgUElOX01BUF9NVVhfR1JPVVBfREVGQVVMVCgiaTJjLTMiLCAiMWU2ZTIwMDAu
cGlubXV4IiwgTlVMTCwgIkkyQzQiKSwNCiAgICAgICAgUElOX01BUF9NVVhfR1JPVVBfREVGQVVM
VCgiaTJjLTIiLCAiMWU2ZTIwMDAucGlubXV4IiwgTlVMTCwgIkkyQzMiKSwgfTsNCg0KV2hpbGUg
Zm9yIFBhbG1ldHRvLCB3ZSBoYXZlIHRoZSBiZWxvdyBzZXQgKHdpdGggbm8gc2hpZnQgbGlrZSBp
biBFVkI6IGkyYy14IC0gSTJDKHgrMSkpDQogICAgICAgIFBJTl9NQVBfTVVYX0dST1VQX0RFRkFV
TFQoImkyYy0zIiwgIjFlNmUyMDAwLnBpbm11eCIsIE5VTEwsICJJMkMzIiksDQogICAgICAgIFBJ
Tl9NQVBfTVVYX0dST1VQX0RFRkFVTFQoImkyYy00IiwgIjFlNmUyMDAwLnBpbm11eCIsIE5VTEws
ICJJMkM0IiksDQogICAgICAgIFBJTl9NQVBfTVVYX0dST1VQX0RFRkFVTFQoImkyYy01IiwgIjFl
NmUyMDAwLnBpbm11eCIsIE5VTEwsICJJMkM1IiksDQogICAgICAgIFBJTl9NQVBfTVVYX0dST1VQ
X0RFRkFVTFQoImkyYy02IiwgIjFlNmUyMDAwLnBpbm11eCIsIE5VTEwsICJJMkM2IiksDQogICAg
ICAgIFBJTl9NQVBfTVVYX0dST1VQX0RFRkFVTFQoImkyYy03IiwgIjFlNmUyMDAwLnBpbm11eCIs
IE5VTEwsICJJMkM3IiksDQogICAgICAgIFBJTl9NQVBfTVVYX0dST1VQX0RFRkFVTFQoImkyYy04
IiwgIjFlNmUyMDAwLnBpbm11eCIsIE5VTEwsICJJMkM4IiksDQogICAgICAgIFBJTl9NQVBfTVVY
X0dST1VQX0RFRkFVTFQoImkyYy04IiwgIjFlNmUyMDAwLnBpbm11eCIsIE5VTEwsICJJMkM5Iiks
DQoNCk1heWJlIHVuZGVyc3RhbmRpbmcgdGhpcyBjb3VsZCBiZSBvZiBzb21lIG1vcmUgYXNzaXN0
YW5jZSBmb3IgdXMuDQoNCj4gDQo+IEhlbGxvIFNoYXksDQo+IA0KPiBPbiBUaHUsIEp1bCAyMSwg
MjAxNiBhdCA4OjI2IFBNLCBTaGF5IFNsb2JvZGtpbiA8c2hheXNAbWVsbGFub3guY29tPg0KPiB3
cm90ZToNCj4gPiBIaSwNCj4gPg0KPiA+IFdlIGZhY2VkIGFuIGkyYyB0cmFuc2FjdGlvbiB0aW1l
LW91dCBpc3N1ZSBvbiBBc3BlZWQgMjUwMCBFVkIgYm9hcmQuDQo+ID4NCj4gPiBJdCBoYXBwZW5z
IHdoZW4gd2UgdHJ5IHRvIGNvbm5lY3Qgb24gYm9hcmQgTE03NSBhdCAweDRkIGRyaXZlciB0byBi
dXMgNy4NCj4gPg0KPiA+IFdlIHVzZWQgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvbGludXgv
dHJlZS9kZXYtNC42IGtlcm5lbCBhbmQgYWxzbw0KPiA+IHRyaWVkDQo+ID4gaHR0cHM6Ly9naXRo
dWIuY29tL3NoZW5raS9saW51eC90cmVlL2Rldi00Ljcga2VybmVsLg0KPiANCj4gSSBrbm93IHRo
YXQgY29tbXVuaWNhdGlvbiB3aXRoIHRoZSBsbTc1IGRvZXMgd29yayAtIEkndmUgaGFkIGl0IHdv
cmtpbmcNCj4gaGVyZSBvbiBhIG15IGFzdDI1MDBldmItZGRyNC4NCj4gDQo+IFRoZSBzdGF0ZSBv
ZiB0aGVzZSB0d28ga2VybmVsIHRyZWVzIGlzIG5vdCBncmVhdCBhdCB0aGlzIHRpbWUuIEkgcGxh
biB0byBwdXNoIGENCj4gbmV3IHRyZWUgbmV4dCB3ZWVrIGJhc2VkIG9uIHRoZSByZWxlYXNlZCA0
Ljcga2VybmVsIHdpdGggb3VyIG5ldyBwaW5tdXgNCj4gZHJpdmVyLCB3aGljaCBpcyB0aGUgY29y
cmVjdCB3YXkgdG8gZW5zdXJlIHBpbnMgYXJlIGNvbmZpZ3VyZWQgY29ycmVjdGx5Lg0KPiANCj4g
SWYgeW91IGNhbiB3YWl0IHVudGlsIHRoZW4geW91IHNob3VsZCBoYXZlIG1vcmUgc3VjY2Vzcy4g
U29ycnkgZm9yIHRoZSBoYXNzbGUuDQoNCldlIHdpbGwgd2FpdCBmb3IgeW91ciBhZGRpdGlvbnMg
YW5kIG1lcmdlIG9uY2UgcmVhZHkuDQpUaGFuayB5b3UuDQoNCj4gDQo+IENoZWVycywNCj4gDQo+
IEpvZWwNCj4gDQo+ID4NCj4gPg0KPiA+DQo+ID4gV2UgYWxzbyB0cmllZCB0byBjaGFuZ2UgaTJj
IHRpbWVvdXQgY291bnRlciAoSTJDRDA4KSBmcm9tIDMgYml0cyB0byA1DQo+ID4gYml0cywgYWNj
b3JkaW5nIHRvIEFzcGVlZCBBU1QyNDAwIHRvIEFTVDI1MDAgbWlncmF0aW9uIGd1aWRlbGluZSwg
YnV0DQo+ID4gaXQgZGlkbuKAmXQgaGVscC4NCj4gPg0KPiA+DQo+ID4NCj4gPiBJcyB0aGF0IGEg
a25vd24gaXNzdWU/DQo+ID4NCj4gPiBJcyB0aGVyZSBhIGtub3duIHNvbHV0aW9uIHlvdSBjYW4g
cG9pbnQgdXMgdG8/DQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhl
IGFzc2lzdGFuY2UsDQo+ID4NCj4gPiBTaGF5DQo+ID4NCj4gPg0KPiA+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gb3BlbmJtYyBtYWlsaW5nIGxp
c3QNCj4gPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gPiBodHRwczovL2xpc3RzLm96bGFi
cy5vcmcvbGlzdGluZm8vb3BlbmJtYw0KPiA+DQo=
