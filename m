Return-Path: <vadimp@mellanox.com>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0060.outbound.protection.outlook.com [104.47.0.60])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sDjMy3Lj6zDr5t
 for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2016 18:39:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b=cXMTmp6b; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=l+MdE6I5HTteeP8CTdMahFgNPSY5a6rBp3uvZ8Jzc4s=;
 b=cXMTmp6b3fBrtxreEbswPWFkGRstBdagdttb6p3c5KsZE7aCrlvF7xBgmH8NBfFLLgSdelYl9PGPhEnY+Dmg+JEYdlMf8tK48CvzW6yLjlTuQHS2zQIkfJXWTkFyitYe1p5CcdnAhJyqJIJMucFQud65nOKGbvymtOa5rHwbpE8=
Received: from AM5PR0501MB2097.eurprd05.prod.outlook.com (10.167.215.14) by
 AM4PR0501MB2753.eurprd05.prod.outlook.com (10.172.216.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.549.15; Wed, 17 Aug 2016 06:06:01 +0000
Received: from AM5PR0501MB2097.eurprd05.prod.outlook.com ([10.167.215.14]) by
 AM5PR0501MB2097.eurprd05.prod.outlook.com ([10.167.215.14]) with
 mapi id 15.01.0549.027; Wed, 17 Aug 2016 06:06:00 +0000
From: Vadim Pasternak <vadimp@mellanox.com>
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jiri Pirko
 <jiri@mellanox.com>, Michael Shych <michaelsh@mellanox.com>
Subject: RE: [dev-4.7 patch 5/5] arch/arm: introduce support for Mallanox evb
 aspeed 2500 config and dts flavors
Thread-Topic: [dev-4.7 patch 5/5] arch/arm: introduce support for Mallanox evb
 aspeed 2500 config and dts flavors
Thread-Index: AQHR8sxrtzRu3dk5DUiJCIDmmBfgf6BMpqAAgAABu/CAAAhFAIAAAnEQ
Date: Wed, 17 Aug 2016 06:06:00 +0000
Message-ID: <AM5PR0501MB209735B93C5DDB37EAD5FB43A2140@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1470812613-51011-1-git-send-email-vadimp@mellanox.com>
 <CACPK8XeYAMWCZpQ+TrZuwxuxfCzzCCkoq5wCdk8HuPyhFVzBBw@mail.gmail.com>
 <AM5PR0501MB2097FD63488A7D938298B753A2140@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <CACPK8XfWdp=8tGE9UFJTR_6aWK=tUonpZtNtwVhBhH6L-FSgBw@mail.gmail.com>
In-Reply-To: <CACPK8XfWdp=8tGE9UFJTR_6aWK=tUonpZtNtwVhBhH6L-FSgBw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-office365-filtering-correlation-id: 78aac8be-bddd-42b7-c6ad-08d3c6649041
x-microsoft-exchange-diagnostics: 1; AM4PR0501MB2753;
 6:VLSYyk0oYUhXdP0MvzABRFg0GugbZl5zr67UmXemKVRpKX/6raqMfXzuXqQtx6KXcpqvI4gqhxVsjtELSoTE0kPDH8/RR1W5TZwj5+cKgD5ZXrm02vYhRNbpkcJZ64f5qsyFO2Ng+FWwE9yN+KGzpCjRDK4w3LmZMVohsrvJqW16nx6vxBjcz5BSSULeFyrN7PdzThwxINHU2PYO/axlk5F5FPNhQJMk4AnaR3bugj6qVX/cOAHGoXAjO6byfsdfN9r+GXemL9lHdlXW/oFt1xwrTlZYA3fo0Mqz8Tzs7JfaF34HMVC0nWxuHRFaNJuixwFIq37DIkrnkA9Ph+VKRw==;
 5:sle3+TpA013rQwLUuZTy/0hmLVqMdXrhrnkLxZwhVMOZJ+bX2M3Q9haEXi+sdAeJ6Kc+YmsJBrNzELNdX7PGIt+W7KoHtKXW2Huzvhrro+UgyGLEGIuU/oaJR2BeR955POlJy9YLYJT+C78g5YW6CQ==;
 24:BgAh4zZSNrYPtePWrQ3xILk7Qc8V71Tib5C/aEbjehLUS5GNT2sSAp+8rqeeV6gr4tydBkh2eCdpd+2LnUaqrbpgIcJ5Wm0OTTNHXS044mc=;
 7:CKnF8NClDO/qxQcjsGdn1Xud4EBe42Z2XwevFY7oAfvOJW4kUCTQFdAFjnkj0rsddFnJB3mUues4+r1+lhIiK7+tIF0/ztHBEHDQG61iVixlL2PcusdyqdZTFVQjWh5yQXmdKsEq6jN+YYfBcnvNRM5zPPZeSZoGv9EBxdp/IVBNO7Gku9zQ5I6ajGCSu6mXJtpWuhjE9oJUOfVumGjFiZjuOSI6jFvoPkolHGiMo3o8dBtnRDtW2IZMXvyqL1L+
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM4PR0501MB2753;
x-microsoft-antispam-prvs: <AM4PR0501MB27535568F47B2F6737050097A2140@AM4PR0501MB2753.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(65623756079841);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
 SRVR:AM4PR0501MB2753; BCL:0; PCL:0; RULEID:; SRVR:AM4PR0501MB2753; 
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(51884002)(45984002)(13464003)(24454002)(199003)(189002)(377454003)(8936002)(4001430100002)(33656002)(93886004)(66066001)(50986999)(81166006)(19580395003)(106116001)(101416001)(8676002)(87936001)(86362001)(19580405001)(76576001)(76176999)(305945005)(81156014)(107886002)(3280700002)(97736004)(9686002)(10400500002)(54356999)(77096005)(2950100001)(3660700001)(68736007)(110136002)(2900100001)(189998001)(3846002)(6116002)(5002640100001)(102836003)(122556002)(2906002)(4326007)(586003)(92566002)(106356001)(7736002)(7846002)(74316002)(105586002)(7696003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR0501MB2753;
 H:AM5PR0501MB2097.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2016 06:06:00.6919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0501MB2753
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
X-List-Received-Date: Wed, 17 Aug 2016 08:39:59 -0000

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogam9lbC5zdGFuQGdtYWls
LmNvbSBbbWFpbHRvOmpvZWwuc3RhbkBnbWFpbC5jb21dIE9uIEJlaGFsZiBPZiBKb2VsDQo+IFN0
YW5sZXkNCj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMTcsIDIwMTYgODo0OSBBTQ0KPiBUbzog
VmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbWVsbGFub3guY29tPg0KPiBDYzogT3BlbkJNQyBNYWls
bGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPjsgSmlyaSBQaXJrbw0KPiA8amlyaUBtZWxs
YW5veC5jb20+OyBNaWNoYWVsIFNoeWNoIDxtaWNoYWVsc2hAbWVsbGFub3guY29tPg0KPiBTdWJq
ZWN0OiBSZTogW2Rldi00LjcgcGF0Y2ggNS81XSBhcmNoL2FybTogaW50cm9kdWNlIHN1cHBvcnQg
Zm9yIE1hbGxhbm94IGV2Yg0KPiBhc3BlZWQgMjUwMCBjb25maWcgYW5kIGR0cyBmbGF2b3JzDQo+
IA0KPiBPbiBXZWQsIEF1ZyAxNywgMjAxNiBhdCAzOjAxIFBNLCBWYWRpbSBQYXN0ZXJuYWsgPHZh
ZGltcEBtZWxsYW5veC5jb20+DQo+IHdyb3RlOg0KPiA+PiA+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtZzUtbWx4LmR0c2kNCj4gPj4gPiBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2FzcGVlZC1nNS1tbHguZHRzaQ0KPiA+PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4+ID4g
aW5kZXggMDAwMDAwMC4uMGY0Y2NlOQ0KPiA+PiA+IC0tLSAvZGV2L251bGwNCj4gPj4gPiArKysg
Yi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUtbWx4LmR0c2kNCj4gPj4gPiBAQCAtMCwwICsx
LDQyOSBAQA0KPiA+PiA+ICsjaW5jbHVkZSAic2tlbGV0b24uZHRzaSINCj4gPj4gPiArDQo+ID4+
ID4gKy8gew0KPiA+PiA+ICsgICAgICAgbW9kZWwgPSAiQXNwZWVkIEJNQyI7DQo+ID4+ID4gKyAg
ICAgICBjb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNTAwIjsNCj4gPj4gPiArICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDE+Ow0KPiA+PiA+ICsgICAgICAgI3NpemUtY2VsbHMgPSA8MT47DQo+ID4+
ID4gKyAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZ2aWM+Ow0KPiA+PiA+ICsNCj4gPj4NCj4g
Pj4gVGhpcyBsb29rcyB0byBiZSBhIGNvcHkgb2YgdGhlIGV4aXN0aW5nIGFzcGVlZC1nNS5kdHNp
LiBZb3Ugc2hvdWxkDQo+ID4+IGluY2x1ZGUgdGhhdCBpbiB5b3VyIC5kdHMgZmlsZSBpbnN0ZWFk
IG9mIGR1cGxpY2F0aW5nIGl0Lg0KPiA+DQo+ID4gV2UgaGF2ZSBpbiB0aGlzIGZpbGUgcGVjaSwg
anRhZywgcHdtIGFuZCB3ZSBhcmUgYWRkaW5nIG5vdyB1c2IuDQo+IA0KPiBZb3UgY2FuIGFkZCB0
aGVzZSBkZXZpY2VzIHRvIHRoZSBhc3BlZWQtZzUuZHRzaSBhbmQgc2V0IHRoZW0gdG8gZGlzYWJs
ZWQgc28gdGhlDQo+IG90aGVyIHN5c3RlbXMgaWdub3JlIHRoZSBleHRyYSBkZXZpY2VzLg0KPiAN
Cj4gWW91IGNhbiB0aGVuIHNldCB0aGVtIHRvIGVuYWJsZWQgd2l0aCBzdGF0dXMgPSAib2theSIg
aW4geW91ciAuZHRzIGFzIHlvdSBoYXZlDQo+IGRvbmUgd2l0aCBpMmMsIGV0Yy4NCj4gDQo+ID4g
V2UgYWxzbyB3YW50ZWQgdG8gY2hhbmdlIGludGVycnVwdCBsZXZlbCBzZW5zaXRpdml0eSB0byBM
RVZFTF9ISUdILg0KPiA+IEN1cnJlbnRseSwgdXNpbmcgYXNwZWVkLWc1IHdlIGFyZSBnZXR0aW5n
IGFsbCBpbnRlcnJ1cHRzICBhcyBlZGdlLiBBY2NvcmRpbmcgdG8NCj4gZGF0YXNoZWV0IG1vc3Qg
c2hvdWxkIGJlIGxldmVsLiBQb3NzaWJseSB0aGlzIGlzIGEgcmVhc29uIG9mIEkyQyBmYWlsdXJl
ICh3aGljaCB3ZQ0KPiBleHBlcmllbmNlZCBhbHNvIHdpdGggNC43KS4NCj4gDQo+IElJUkMgdGhl
IGlycSBkcml2ZXIgZG9lc24ndCBoYXZlIHN1cHBvcnQgZm9yIHNwZWNpZnlpbmcgdGhlIGludGVy
cnVwdCBhcyBlZGdlIG9yDQo+IGxldmVsLiBUaGlzIGlzIGFuIGVuaGFuY2VtZW50IHRoYXQgbmVl
ZHMgdG8gYmUgbWFkZSB0byB0aGUgZHJpdmVyIGJlZm9yZSB5b3UNCj4gY2FuIHNwZWNpZnkgaXQg
aW4gdGhlIGRldmljZSB0cmVlLg0KPiANCj4gPj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29u
Zmlncy9tbHhfYm1jX2RlZmNvbmZpZw0KPiA+PiA+IGIvYXJjaC9hcm0vY29uZmlncy9tbHhfYm1j
X2RlZmNvbmZpZw0KPiA+PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4+ID4gaW5kZXggMDAw
MDAwMC4uYjM4MWRjNQ0KPiA+PiA+IC0tLSAvZGV2L251bGwNCj4gPj4gPiArKysgYi9hcmNoL2Fy
bS9jb25maWdzL21seF9ibWNfZGVmY29uZmlnDQo+ID4+DQo+ID4+IFVwc3RyZWFtIGRvIG5vdCBs
aWtlIGFkZGluZyBtYW55IGRlZmNvbmZpZ3MuIFdlIGhhdmUgb25lIGZvciB0aGUNCj4gPj4gYXN0
MjUwMCBhbmQgb25lIGZvciB0aGUgYXN0MjQwMCBzZXJpZXMuIEkgc3VnZ2VzdCBhZGRpbmcgb3B0
aW9ucyB0bw0KPiA+PiB0aGUgYXNwZWVkX2c1X2RlZmNvbmZpZy4NCj4gPg0KPiA+IFdlIGhhdmUg
YSBiaWcgZ2FwIGJldHdlZW4gYXNwZWVkX2c1X2RlZmNvbmZpZyBhbmQgb3VyIGZsYXZvciBvZiB0
aGF0IChMRUQsDQo+IFNXSVRDSERFVikuIEFsc28gd2Ugd291bGQgbGlrZSB0byBnZXQgcmlkIG9m
IHVzaW5nIEpGRlMyIGFuZCBtb3ZlIHRvIFVCSS4NCj4gPiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0
byBhZGQgYWxsIHRoYXQgdG8gYXNwZWVkX2c1X2RlZmNvbmZpZz8NCj4gDQo+IFRoZXJlIGFyZSB0
d28gd2F5cyB5b3UgY2FuIGNvbmZpZ3VyZSB0aGUga2VybmVsLiBPbmUgaXMgdG8gaGF2ZSB0aGUg
ZGVmY29uZmlnIGluDQo+IHRoZSBrZXJuZWwgdHJlZSB0aGF0IGlzIGEgc3VwZXJzZXQgb2YgdGhl
IHJlcXVpcmVtZW50cyBmb3IgYWxsIHN5c3RlbXMuDQo+IA0KPiBUaGUgb3RoZXIgaXMgdG8gaGF2
ZSBhIGtlcm5lbCBjb25maWd1cmF0aW9uIHNwZWNpZmljIHRvIHlvdXIgYm9hcmQgaW4gdGhlIHlv
Y3RvDQo+IHRyZWUuIFRoaXMgb3B0aW9uIGFsbG93cyBldmVyeW9uZSB0byBidWlsZCBhIHNtYWxs
ZXIga2VybmVsIHRoYXQgbWVldHMgdGhlIG5lZWRzDQo+IG9mIHRoZWlyIEJNQy4gVGhpcyBpcyB0
aGUgb3B0aW9uIHRoYXQgdGhlIGV4aXN0aW5nIGJvYXJkcyBjdXJyZW50bHkgc3VwcG9ydC4NCj4g
DQo+IE5vIG1hdHRlciB3aGljaCBvcHRpb24geW91IGNob3NlLCBJIHN1Z2dlc3Qgc2VuZGluZyBh
IHBhdGNoIHRvDQo+IGFzcGVlZF9nNV9kZWZjb25maWcgdGhhdCBlbmFibGVzIGFsbCBvZiB0aGUg
dGhlIGZ1bmN0aW9uYWxpdHkgeW91IHVzZS4NCj4gVGhpcyB3YXkgSSBjYW4gdGVzdCB0aGF0IGl0
IGJ1aWxkcyBjb3JyZWN0bHkgd2hlbiBtb2RpZnlpbmcgdGhlIGtlcm5lbC4NCj4gDQo+ID4gQnkg
dGhlIHdheSwgSSBzZWUgdGhhdCBpbiA0LjcgdXBzdHJlYW0geW91IGFscmVhZHkgYWRkZWQgc29t
ZSBtaW5pbWFsIHN0dWZmDQo+IGZvciBBc3BlZWQgU29DLg0KPiA+IERvIHlvdSBoYXZlIHNvbWUg
cGxhbiByZWdhcmRpbmcgdXBzdHJlYW0gb3RoZXIgc3R1ZmYgdG8ga2VybmVsPw0KPiANCj4gWWVz
LiBJIGludGVuZCB0byBtZXJnZSBhbGwgb2YgdGhlIGRyaXZlcnMgdXBzdHJlYW0uDQo+IA0KPiA+
IFdoZW4geW91IHRoaW5rIGl0IGNvdWxkIGhhcHBlbj8NCj4gDQo+IFdlIGhhdmUgd2F0Y2hkb2cg
YW5kIGlycSBjb250cm9sbGVyIGluIDQuOC4NCj4gDQo+IDQuOSB3aWxsIGhhdmUgY2xvY2tzb3Vy
Y2UsIGdwaW8gYW5kIHBpbm11eC4NCj4gDQo+IEJyZW5kYW4gaXMgd29ya2luZyBvbiBpMmMgd2hp
Y2ggSSBob3BlIHdpbGwgYmUgcmVhZHkgaW4gdGltZSBmb3IgaW5jbHVzaW9uIGluIDQuOS4NCj4g
DQo+IFdlIGFsc28gaGF2ZSBidCwgY2xvY2ssIG10ZCBhbmQgdnVhcnQgZHJpdmVycyB0aGF0IG5l
ZWQgcmV2aWV3IGFuZCBzdWJtaXNzaW9uLiBJDQo+IGhvcGUgdG8gZ2V0IGFzIG1hbnkgYXMgcG9z
c2libGUgaW50byA0LjkuDQo+IA0KPiA+IEFuZCBhcmUgeW91IGdvaW5nIHRvIHN1Ym1pdCB1cHN0
cmVhbSBhbGwgQXNwZWVkIGZpbGVzIHRvZ2V0aGVyIG9yIHlvdSBhcmUNCj4gcGxhbm5pbmcgdG8g
ZG8gaXQgaW4gc29tZSBwYXJ0aWN1bGFyIG9yZGVyPw0KPiANCj4gQXMgZWFjaCBvZiB0aGUgZHJp
dmVycyBhcmUgZ29pbmcgdG8gZGlmZmVyZW50IG1haW50YWluZXJzLCB0aGV5IGRvIG5vdCBoYXZl
IGFueQ0KPiBkZXBlbmRlbmN5IG9uIGVhY2ggb3RoZXIuIFRoZXkgY2FuIGdvIHVwIHdoZW4gdGhl
eSBhcmUgcmVhZHkuDQo+IA0KDQpHcmVhdCwNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIg
ZGV0YWlsZWQgYW5zd2Vycy4NCkknbGwgcmUtd29yayB0aGUgcGF0Y2hlcyBhY2NvcmRpbmcgdG8g
eW91ciBjb21tZW50IGFuZCByZS1zdWJtaXQgdGhlbS4NCg0KQXMgSSB1bmRlcnN0YW5kIHlvdSBk
b24ndCBuZWVkIHBlY2ksIGp0YWcsIHB3bSwgdXNiIGF0IHRoZSBtb21lbnQuDQpDb3VsZCB3ZSBz
dWJtaXQgdGhlc2UgbW9kdWxlIGZvciB1cHN0cmVhbSByZXZpZXcgYWZ0ZXIgeW91ciBhcHByb3Zh
bCBieSBvdXJzZWx2ZXM/DQoNCldoYXQgYWJvdXQgUlRDIGFuZCBTUEkgc3R1ZmY/DQoNCj4gQ2hl
ZXJzLA0KPiANCj4gSm9lbA0KDQpDaGVlcnMsDQpWYWRpbS4NCg==
