Return-Path: <shays@mellanox.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0041.outbound.protection.outlook.com [104.47.2.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rzmjJ0VhkzDqdx
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 17:25:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b=JmbWwTkH; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=BiNYD8vvsVgzFCulY76jpurRTjtJTiFJx8dpa71hSlY=;
 b=JmbWwTkHXyzBCmlFN2RLcTWjc3dTrMbSoBxaM+tdHKXW9BY3x9IckC3nzgcQh5TvmI45cdemr3PQLXvT8QlT66MpXviZMZF0bcRehW9df6NGGGSNetQUktrochZB2nzbXDOJDapCtTLC3PkdoVKMpVLrBfpjPuW6fYuA08Q0V38=
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com (10.161.249.145) by
 DB4PR05MB0943.eurprd05.prod.outlook.com (10.161.249.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.544.10; Wed, 27 Jul 2016 06:52:12 +0000
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) by
 DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) with mapi id
 15.01.0544.019; Wed, 27 Jul 2016 06:52:12 +0000
From: Shay Slobodkin <shays@mellanox.com>
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Aspeed 2500 EVB i2c transaction time out
Thread-Topic: Aspeed 2500 EVB i2c transaction time out
Thread-Index: AdHjPh18jT8yNP68Tle3f/Ll01NEgAAL8yuAAIyfMnAAG9q6gABwxbfg
Date: Wed, 27 Jul 2016 06:52:12 +0000
Message-ID: <DB4PR05MB0941D264C3F26B9F9378E78ED50F0@DB4PR05MB0941.eurprd05.prod.outlook.com>
References: <DB4PR05MB0941FC06CBEC427C99A40C80D5090@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <CACPK8Xf-jSXs=EcF3tQrC7xeFkKXOhXxPxz=6pBQ9408-uhcHA@mail.gmail.com>
 <DB4PR05MB0941D946BC03E134592BCA21D50C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <1469408379.5468.33.camel@aj.id.au>
In-Reply-To: <1469408379.5468.33.camel@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shays@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-office365-filtering-correlation-id: 963e7a43-924f-4cbe-d6a5-08d3b5ea898e
x-microsoft-exchange-diagnostics: 1; DB4PR05MB0943;
 6:lkj3J5BWjL2VEBtAUXooIKBCDK1DPNFizZwtZF0CjJcef2W62QdAzTUTjjzl3159RavudjRmAQ3BAXq1VMsQzfYjcNpu4ComhcrJ8zPWuUwnh3wvFC6UrLJMMyIF/WB24rNL1yfM9Jx7Brel719lxUE/vLyz2T/WBdMpdo7WFTA2l+Xj7Y7a/lYggUJcBbPNcjr+2kmEoSsEraNGMPWLIQvIaiLhLHh2UhBwONvVseKgh5XhKhTngZ/squDnYg3UeDokWoAddcGdj4dLPoJYijB8ZKDGk5GbwG3r9Em7cygz8zFMVioPqLuxSzSqSL/EQ4CPosFZoIrHKCmggTchkg==;
 5:YDJngJRJJ5zYFkKCb0Zgi5B04AezatvoCxzdMAn7NWBnnmHERkZU2i7D6h/pgh1N8WRTn2edZQw4duO8O6ifl9+Ayk94Cqnt7OW72QhVyHXd9/PQ4K7zGU+CpMQUZi2OLBNyhODKT2EKJr4mcExvdw==;
 24:RwWpkxo4E/PDHwsMnIvlxKYO7gdMCTN02t7jMTeLsVRQECAdvYHt5RftQofGtShVL+UAaXIg13v8isWKszjVHfklmL6o4K9zhKZanL2ZJPU=;
 7:y8gD8hz2nQ3SC2mvVgnW5zEKb8i6Usrg91FpzTbb81wlmtCNXipZe2I4bGA3UkRMIVwUIbSq5D3LjrwvG3doWyYnOdFaUIve1OynFNHpEfydXmllVlo1N2qktgUvztNnu1eQKW794JiaNNWej4VL5zxKcV3NwCykRKBPIInDYF6w3YNzbu2rtomPewiF/Mup8AMM2bFZgo38bhcnONDmVI9AMgxwbkrcMriguzc8qJs3NRVQrVciI9/cT+8Q2OqQ
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR05MB0943;
x-microsoft-antispam-prvs: <DB4PR05MB09431584D4FBB3D8699C0B8BD50F0@DB4PR05MB0943.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(65623756079841);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6055026);
 SRVR:DB4PR05MB0943; BCL:0; PCL:0; RULEID:; SRVR:DB4PR05MB0943; 
x-forefront-prvs: 0016DEFF96
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(377454003)(189002)(377424004)(24454002)(199003)(13464003)(66066001)(76576001)(3846002)(68736007)(6116002)(102836003)(586003)(3660700001)(8676002)(9686002)(3280700002)(86362001)(87936001)(76176999)(33656002)(54356999)(50986999)(122556002)(551934003)(5001770100001)(105586002)(189998001)(97736004)(92566002)(15975445007)(93886004)(2900100001)(2950100001)(101416001)(2906002)(11100500001)(19580405001)(19580395003)(77096005)(8936002)(81156014)(81166006)(74316002)(7696003)(5003600100003)(7736002)(10400500002)(4326007)(7846002)(5002640100001)(106356001)(305945005);
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2016 06:52:12.2735 (UTC)
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
X-List-Received-Date: Wed, 27 Jul 2016 07:25:10 -0000

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBKZWZmZXJ5IFttYWlsdG86YW5kcmV3QGFqLmlkLmF1XQ0KPiBTZW50OiBNb25kYXksIEp1bHkg
MjUsIDIwMTYgNDowMCBBTQ0KPiBUbzogU2hheSBTbG9ib2RraW4gPHNoYXlzQG1lbGxhbm94LmNv
bT47IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQo+IENjOiBvcGVuYm1jQGxpc3RzLm96
bGFicy5vcmcNCj4gU3ViamVjdDogUmU6IEFzcGVlZCAyNTAwIEVWQiBpMmMgdHJhbnNhY3Rpb24g
dGltZSBvdXQNCj4gDQo+IEhpIFNoYXksDQo+IA0KPiBPbiBTdW4sIDIwMTYtMDctMjQgYXQgMTE6
NDUgKzAwMDAsIFNoYXkgU2xvYm9ka2luIHdyb3RlOg0KPiA+ID4NCj4gPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBqb2VsLnN0YW5AZ21haWwuY29tIFttYWlsdG86
am9lbC5zdGFuQGdtYWlsLmNvbV0gT24gQmVoYWxmIE9mDQo+ID4gPiBKb2VsIFN0YW5sZXkNCj4g
PiA+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDIxLCAyMDE2IDc6MzYgUE0NCj4gPiA+IFRvOiBTaGF5
IFNsb2JvZGtpbiA8c2hheXNAbWVsbGFub3guY29tPg0KPiA+ID4gQ2M6IG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IEFzcGVlZCAyNTAwIEVWQiBpMmMgdHJhbnNh
Y3Rpb24gdGltZSBvdXQNCj4gPiBIZWxsbyBKb2VsLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3Vy
IGFuc3dlci4NCj4gPiBVbnRpbCB3ZSBtZXJnZSBmcm9tIHJlbW90ZSB0aGUgbmV3IGtlcm5lbCB0
cmVlcyB5b3Ugd2lsbCBwdXNoLCBJIHdhcw0KPiA+IHdvbmRlcmluZyB3aHkgaW4gYXNwZWVkLmMg
Zm9yIEVWQiB3ZSBoYXZlIHRoZSBiZWxvdyBtYXBwaW5nICh0aGVyZSBpcw0KPiBubyBpMmMgYnVz
IGhlcmUpOg0KPiANCj4gIm5vIGkyYyBidXMgaGVyZSI/IGlmIHlvdSBtZWFuIGF0IDFlNmUyMDAw
IHlvdSBhcmUgcmlnaHQgLSBpdCdzIHRoZSBiYXNlDQo+IGFkZHJlc3Mgb2YgdGhlIFNDVS4gSW4g
dGhpcyBjYXNlIGl0J3MgdGVsbGluZyB0aGUgcGluY3RybCBzdWJzeXN0ZW0gd2hpY2ggcGluLQ0K
PiBjb250cm9sbGVyIHNob3VsZCBiZSB1c2VkIHRvIGFmZmVjdCB0aGUgbXV4IGNvbmZpZ3VyYXRp
b24gcmVxdWVzdC4NCj4gT3RoZXJ3aXNlLCB0aGVyZSBhcmUgMTQgSTJDIGJ1c2VzLCBzbyAzLCA0
IGFuZCA5IGFyZSB2YWxpZC4NCj4gDQo+ID4gc3RhdGljIHN0cnVjdCBwaW5jdHJsX21hcCBhc3Qy
NTAwX21hcHBpbmdbXSBfX2luaXRkYXRhID0gew0KPiA+IMKgwqDCoMKgwqDCoMKgwqBQSU5fTUFQ
X01VWF9HUk9VUF9ERUZBVUxUKCJpMmMtOCIsICIxZTZlMjAwMC5waW5tdXgiLCBOVUxMLA0KPiA+
ICJJMkM5IiksDQo+ID4gwqDCoMKgwqDCoMKgwqDCoFBJTl9NQVBfTVVYX0dST1VQX0RFRkFVTFQo
ImkyYy0zIiwgIjFlNmUyMDAwLnBpbm11eCIsIE5VTEwsDQo+ID4gIkkyQzQiKSwNCj4gPiDCoMKg
wqDCoMKgwqDCoMKgUElOX01BUF9NVVhfR1JPVVBfREVGQVVMVCgiaTJjLTIiLCAiMWU2ZTIwMDAu
cGlubXV4IiwgTlVMTCwNCj4gPiAiSTJDMyIpLCB9Ow0KPiA+DQo+ID4gV2hpbGUgZm9yIFBhbG1l
dHRvLCB3ZSBoYXZlIHRoZSBiZWxvdyBzZXQgKHdpdGggbm8gc2hpZnQgbGlrZSBpbiBFVkI6DQo+
ID4gaTJjLXggLSBJMkMoeCsxKSkNCj4gPiDCoMKgwqDCoMKgwqDCoMKgUElOX01BUF9NVVhfR1JP
VVBfREVGQVVMVCgiaTJjLTMiLCAiMWU2ZTIwMDAucGlubXV4IiwgTlVMTCwNCj4gPiAiSTJDMyIp
LA0KPiA+IMKgwqDCoMKgwqDCoMKgwqBQSU5fTUFQX01VWF9HUk9VUF9ERUZBVUxUKCJpMmMtNCIs
ICIxZTZlMjAwMC5waW5tdXgiLCBOVUxMLA0KPiA+ICJJMkM0IiksDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoFBJTl9NQVBfTVVYX0dST1VQX0RFRkFVTFQoImkyYy01IiwgIjFlNmUyMDAwLnBpbm11eCIs
IE5VTEwsDQo+ID4gIkkyQzUiKSwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgUElOX01BUF9NVVhfR1JP
VVBfREVGQVVMVCgiaTJjLTYiLCAiMWU2ZTIwMDAucGlubXV4IiwgTlVMTCwNCj4gPiAiSTJDNiIp
LA0KPiA+IMKgwqDCoMKgwqDCoMKgwqBQSU5fTUFQX01VWF9HUk9VUF9ERUZBVUxUKCJpMmMtNyIs
ICIxZTZlMjAwMC5waW5tdXgiLCBOVUxMLA0KPiA+ICJJMkM3IiksDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoFBJTl9NQVBfTVVYX0dST1VQX0RFRkFVTFQoImkyYy04IiwgIjFlNmUyMDAwLnBpbm11eCIs
IE5VTEwsDQo+ID4gIkkyQzgiKSwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgUElOX01BUF9NVVhfR1JP
VVBfREVGQVVMVCgiaTJjLTgiLCAiMWU2ZTIwMDAucGlubXV4IiwgTlVMTCwNCj4gPiAiSTJDOSIp
LA0KPiA+DQo+ID4gTWF5YmUgdW5kZXJzdGFuZGluZyB0aGlzIGNvdWxkIGJlIG9mIHNvbWUgbW9y
ZSBhc3Npc3RhbmNlIGZvciB1cy4NCj4gDQo+IExvb2tzIGxpa2UgdGhlcmUgaXMgYSBidWcgd2l0
aCB0aGUgcGFsbWV0dG8gY29uZmlndXJhdGlvbjsgdGhlIEkyQ3ggc3RyaW5ncyBhcmUNCj4gdGhl
IHZhbHVlcyBmcm9tIHRoZSBkYXRhc2hlZXQgYW5kIGFyZSAxIGluZGV4ZWQsIHdoaWxlIHRoZSBM
aW51eCBkZXZpY2VzIGFyZQ0KPiAwIGluZGV4ZWQsIGFuZCBzbyB0aGV5IHNob3VsZCBiZSBvZmZz
ZXQuDQo+IA0KPiBJdCdzIHVuZm9ydHVuYXRlIHRoYXQgdGhpcyBtYWRlIGl0IGludG8gdGhlIG9w
ZW5ibWMvbGludXggdHJlZXMuIFRoZSBwYXRjaGVzDQo+IHdlcmUgdmVyeSBtdWNoIGhhbGYtYmFr
ZWQgYW5kIHdlIHdlcmUgdXNpbmcgdGhlbSBmb3IgYW4gaW50ZXJuYWwgYnJpbmctdXANCj4gb24g
YW4gYXN0MjUwMDsgd2Ugd2VyZW4ndCBwYXlpbmcgZW5vdWdoIGF0dGVudGlvbiB0byB0aGUgYXN0
MjQwMA0KPiBjb25maWd1cmF0aW9uIGFuZCB0aGlzIGhhcyBzbGlwcGVkIHRocm91Z2guDQo+IA0K
PiBJJ3ZlIG1lbnRpb25lZCB0byBKb2VsIHRoZSBpZGVhIG9mIGJhY2tpbmcgb3V0IHRoZSBiYWQg
cGluY3RybCBwYXRjaGVzLg0KPiBTb21lIHdlcmUgcmV2ZXJ0ZWQgcmVjZW50bHksIHRob3VnaCB0
aGV5IHJlbW92ZWQgdGhlIEdQSU8gZHJpdmVyIGhvb2tzDQo+IGFuZCBub3QgdGhlIG11eCBncm91
cCBtYWNyb3MgYWJvdmUuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBBbmRyZXcNCj4gDQo+IFBTOiBp
ZiB5b3UgYXJlIGludGVyZXN0ZWQgaW4gdGVzdGluZyB0aGUgbW9zdCByZWNlbnQgcGluY3RybCBw
YXRjaGVzIHRoZXkgYXJlDQo+IGF2YWlsYWJsZSBhdCBbMV0uIEhvd2V2ZXIsIHRoZXkncmUgYmFz
ZWQgb24gdXBzdHJlYW0gYW5kIHNvIHdpbGwgbmVlZCBhIGJpdCBvZg0KPiBtYXNzYWdpbmcgdG8g
aW50ZWdyYXRlIHRoZW0gd2l0aCB0aGUgb3BlbmJtYy9saW51eCBrZXJuZWwsIGZvciBpbnN0YW5j
ZQ0KPiBhZGRpbmcgdGhlIEkyQyBtdXggcmVxdWVzdHMgdG8gdGhlIEkyQyBkZXZpY2V0cmVlIG5v
ZGVzLg0KPiANCj4gWzFdwqBodHRwczovL2dpdGh1Yi5jb20vYW1ib2FyL2xpbnV4L2NvbW1pdHMv
YXNwZWVkLXBpbmN0cmwtNC43LXJjNw0KDQpUaGFuayB5b3UuIFdlIHRyaWVkIHRvIHVzZSB0aGlz
IHBpbmN0cmwsIHdpdGggbm8gbHVjay4NCkN1cnJlbnRseSB3ZSBhcmUgc3RpbGwgdXNpbmcga2Vy
bmVsIDQuNiBhbmQgd2UgcmVjZWl2ZSB0cmFuc2FjdGlvbiB0aW1lIG91dCBmb3IgTE03NS4NCldl
IGFyZSBwZW5kaW5nIEpvZWwncyA0LjcuMyB3aGVuIGl0IGlzIGRvbmUuDQoNClRoYW5rcywNClNo
YXkNCg==
