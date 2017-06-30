Return-Path: <vadimp@mellanox.com>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0080.outbound.protection.outlook.com [104.47.0.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wzPJc6ccYzDr5r
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 14:52:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="SMEKqzpw";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8SLmA/z5MkjJLDaqFDqrSCPOrYV1ZM9iFyWn2F48CcU=;
 b=SMEKqzpwGnq8yvGDyPrn5LKiNgUjJRvit/R8Mn//CoGvRu9ekpiY0TGdKwypsMpFdXUDGQ2uE3h2XMn17hYC3k9qyucdk8vsgu+KCQPTxM71pRbmpaclMfuHani7RDgwsKoYcyD2z+7I1VVT4k0FuofIsl2S+YtGbU8AmQsDnxI=
Received: from AM4PR05MB3330.eurprd05.prod.outlook.com (10.171.187.15) by
 AM2PR05MB1217.eurprd05.prod.outlook.com (10.163.148.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1220.11; Fri, 30 Jun 2017 04:51:53 +0000
Received: from AM4PR05MB3330.eurprd05.prod.outlook.com
 ([fe80::b139:dd6:ef32:aafd]) by AM4PR05MB3330.eurprd05.prod.outlook.com
 ([fe80::b139:dd6:ef32:aafd%13]) with mapi id 15.01.1220.015; Fri, 30 Jun 2017
 04:51:53 +0000
From: Vadim Pasternak <vadimp@mellanox.com>
To: Andrew Jeffery <andrew@aj.id.au>, Milton Miller II <miltonm@us.ibm.com>,
 Mykola Kostenok <c_mykolak@mellanox.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH linux dev-4.10] aspeed: Set max gpio num.
Thread-Topic: [PATCH linux dev-4.10] aspeed: Set max gpio num.
Thread-Index: AQHS8TjCS4ZOBKKONUKbRhS7J5JORqI8nrGAgAA1+DA=
Date: Fri, 30 Jun 2017 04:51:53 +0000
Message-ID: <AM4PR05MB3330BD0A11C99EF1DD029BCBA2D30@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <20170629133008.13045-1-c_mykolak@mellanox.com>
 <OFC401AD1C.D9F923CA-ON0025814E.007AD5AE-0025814F.000332A5@notes.na.collabserv.com>
 <1498786277.5203.14.camel@aj.id.au>
In-Reply-To: <1498786277.5203.14.camel@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [46.120.54.214]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM2PR05MB1217;
 7:bP67l9IhXyPO5qOdqMN/7+uURWuLhKU1/Wb0V71307fkdJE0aFLqNJJHsClZShoEoUJ498idPFMmGgYWzTCgNP3pWkAQHRsJbqcsuFG2fG0hykrtsHzA7oYo6r1WzSFFf8wCFP+Hc8K59vE+ixxYzZik9ExEgGpLEKUkk2t4NvT3RoesiCMNDtQJjNoabq+gM60mzyX6TtqXbh81VrUS6kcl6+LFih5tfx9AxpMztuPk/6YtfdbAq9EyotXS/CvXT7XoEHoPbxaamN78H6oHCmovDmcBdDFXFHPSKs7DiESuYgEzk00sT5vX8rTgAwiYM3A5VoWvrXhCENKjs+w1ttTVqSuOTrqjIfrtAzUU1//N0AYnkgTsJV+a6wU3kBJti1ewOP1SUzzaQZsF9YHHRZrLCS/CbsvgsQdB4LM2c3JVSB0m6+PoDNuG1pxc8L1pcloUk7IcFIRshqqM394EOgA4WtUAqyIQjXkgI0d1wTY2jy2/K6hKgUZGyJjS7ydl47ZKCUi82Otlf+6ZMVo7it2iQJ16bhrYnQp8JzEcNcMiau4PW1ORH0MUbayINnaGLP68hcj0yx5kdAHSiBuddH00mxMp9aQje3c0XlQFScvXFC2kzpmELLBsywo0YyOkJAbRPiWed/8JN2mnoocUr2cV6XnF7Duy3zw8NVTBJQeb3N9n1wBh7QNwAQnECBNcV7ZlvvwxWqLAu/QH4Ls5670RmuH+GaqGrHi561WJx6TcLK3lHFEj9ev2rHywQxuxM3XW5aeMTk8Z13tqcMI/zP5RMnOU40DBk1frCfHdnis=
x-ms-office365-filtering-correlation-id: ebdf8ea1-9d8d-40c4-adb1-08d4bf73ba42
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:AM2PR05MB1217; 
x-ms-traffictypediagnostic: AM2PR05MB1217:
x-microsoft-antispam-prvs: <AM2PR05MB121719893B8E3CB9D1F939BEA2D30@AM2PR05MB1217.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(133145235818549)(236129657087228)(65623756079841)(274839183919467)(104084551191319);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(100000703101)(100105400095)(6055026)(6041248)(20161123555025)(20161123564025)(20161123558100)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:AM2PR05MB1217; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:AM2PR05MB1217; 
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39840400002)(39860400002)(39850400002)(39400400002)(39410400002)(39450400003)(13464003)(377454003)(24454002)(37524003)(377424004)(305945005)(74316002)(8936002)(575784001)(53546010)(76176999)(54356999)(50986999)(14454004)(33656002)(8676002)(81166006)(7736002)(86362001)(53936002)(189998001)(2950100002)(5250100002)(2900100001)(6246003)(4326008)(3846002)(6636002)(229853002)(102836003)(6116002)(3660700001)(3280700002)(66066001)(6436002)(5660300001)(478600001)(25786009)(8656002)(2906002)(55016002)(6506006)(9686003)(38730400002)(7696004)(99286003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM2PR05MB1217;
 H:AM4PR05MB3330.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2017 04:51:53.1677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM2PR05MB1217
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
X-List-Received-Date: Fri, 30 Jun 2017 04:52:02 -0000

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5i
bWMgW21haWx0bzpvcGVuYm1jLQ0KPiBib3VuY2VzK3lhbml2YWI9bWVsbGFub3guY29tQGxpc3Rz
Lm96bGFicy5vcmddIE9uIEJlaGFsZiBPZiBBbmRyZXcNCj4gSmVmZmVyeQ0KPiBTZW50OiBGcmlk
YXksIEp1bmUgMzAsIDIwMTcgNDozMSBBTQ0KPiBUbzogTWlsdG9uIE1pbGxlciBJSSA8bWlsdG9u
bUB1cy5pYm0uY29tPjsgTXlrb2xhIEtvc3Rlbm9rDQo+IDxjX215a29sYWtAbWVsbGFub3guY29t
Pg0KPiBDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
bGludXggZGV2LTQuMTBdIGFzcGVlZDogU2V0IG1heCBncGlvIG51bS4NCj4gDQo+IE9uIEZyaSwg
MjAxNy0wNi0zMCBhdCAwMDozNCArMDAwMCwgTWlsdG9uIE1pbGxlciBJSSB3cm90ZToNCj4gPiBP
biBKdW5lIDI5IDIwMTcgYXQgODozMSBpbiBzb21lIHRpbWUgem9uZSwgTXlrb2xhIEtvc3Rlbm9r
IHdyb3RlOg0KPiA+ID4NCj4gPiA+IFNldCBtYXhpbXVtIG51bWJlciBvZiBncGlvIGZvciBBUkNI
X0FTUEVFRC4NCj4gPiA+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTXlrb2xhIEtvc3Rlbm9r
IDxjX215a29sYWtAbWVsbGFub3guY29tPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL0tj
b25maWcgYi9hcmNoL2FybS9LY29uZmlnIGluZGV4DQo+ID4gPiAxODZjNGMyMTRlMGEuLjlkMzcz
Njg1YzYyOCAxMDA2NDQNCj4gPiA+IC0tLSBhL2FyY2gvYXJtL0tjb25maWcNCj4gPiA+ICsrKyBi
L2FyY2gvYXJtL0tjb25maWcNCj4gPiA+IEBAIC0xNDkyLDYgKzE0OTIsNyBAQCBjb25maWcgQVJD
SF9OUl9HUElPDQo+ID4gPiAJZGVmYXVsdCAzNTIgaWYgQVJDSF9WVDg1MDANCj4gPiA+IAlkZWZh
dWx0IDI4OCBpZiBBUkNIX1JPQ0tDSElQDQo+ID4gPiAJZGVmYXVsdCAyNjQgaWYgTUFDSF9INDcw
MA0KPiA+ID4gPiA+ICsJZGVmYXVsdCAyMzIgaWYgQVJDSF9BU1BFRUQNCj4gPiA+IAlkZWZhdWx0
IDANCj4gPiA+IAloZWxwDQo+ID4gPiAJwqDCoE1heGltdW0gbnVtYmVyIG9mIEdQSU9zIGluIHRo
ZSBzeXN0ZW0uDQo+ID4NCj4gPg0KPiA+IFRoaXMgaXMgYSBiYWQgaWRlYS4NCj4gDQo+IEkgYWdy
ZWUuDQo+IA0KPiA+IMKgVGhpcyBzZXRzIHRoZSBtYXhpbXVtIHRvdGFsIG51bWJlcg0KPiA+IG9m
IGdwaW9zIHN1cHBvcnRlZCBieSB0aGUga2VybmVsLCBhbmQgc2V0dGluZyBpdCB0byB0aGlzIHZh
bHVlIHdvdWxkDQo+ID4gbm90IGFsbG93IGFueSBzcGFjZSBmb3IgdGhlIHZhcmlvdXMgcGNhIGV4
cGFuZGVycyB0byBkZWZpbmUgYWRkaXRpb25hbA0KPiA+IGdwaW9zLg0KPiA+DQo+ID4gVGhlIGxv
Z2ljIGluIGFzbS1nZW5lcmljL2dwaW8uaCBzYXlzIGlmIHRoZSBDT05GSUcgbnVtYmVyIGlzIDAg
dXNlIDUxMg0KPiA+IGVsc2UgdXNlIHRoZSBzdXBwbGllZCB2YWx1ZS4NCj4gPg0KPiA+IEknbSBn
dWVzc2luZyB0aGlzIHdhcyBtb3RpdmF0ZWQgdG8gbWFrZSB0aGUgZ3BpbyBudW1iZXJzIG1hdGNo
IHdpdGgNCj4gPiB0aGUgY29udHJvbGxlci4NCj4gDQo+IFJpZ2h0OyB3aGF0J3MgbWlzc2luZyBp
cyBhbnkgbWVudGlvbiBvZiB0aGUgbW90aXZhdGlvbi4NCj4gDQo+IE15a29sYTogV2hhdCBwcm9i
bGVtIGFyZSB5b3UgdHJ5aW5nIHRvIHNvbHZlIHdpdGggdGhpcyBwYXRjaD8gQXMgTWlsdG9uDQo+
IG1lbnRpb25zIGl0IG1pZ2h0IGJlIG1ha2luZyB0aGUgR1BJTyBudW1iZXJzIGFsaWduIHdpdGgg
dGhlIGNvbnRyb2xsZXIsIGJ1dA0KPiB3aHkgZG8geW91IG5lZWQgdGhhdD8gSXQgc2hvdWxkIGFs
cmVhZHkgYmUgcG9zc2libGUgdG8gZGVzY3JpYmUgdGhlIHN5c3RlbQ0KPiB3aXRob3V0IHRoaXMg
cGF0Y2guDQo+IA0KPiA+IMKgwqBVbmZvcnR1bmF0ZWx5IHRoZSBncGlvcyBmcm9tDQo+ID4gdGhl
IGRldmljZSB0cmVlIGFyZSBhc3NpZ25lZCBudW1iZXJzIGZyb20gdGhlIGVuZCBvZiB0aGUgbnVt
YmVyIHNwYWNlLg0KPiA+DQo+ID4gSWYgd2UgbmVlZCB0byBhc3NpZ24gYSBzcGVjaWZpYyByYW5n
ZSwgd2Ugc2hvdWxkIHRyeSB0byBkZWZpbmUgYW4NCj4gPiBvcHRpb25hbCBwcm9wZXJ0eSBpbiB0
aGUgZ3BpbyBjaGlwIGJpbmRpbmcgYW5kIGFzc2lnbiB0aGUgdmFsdWUgdG8NCj4gPiBncGlvLWNo
aXAuYmFzZSBpbiBncGlvLWFzcGVlZC5jLCBidXQgSSBhbSBkb3VidGZ1bCB0aGF0IHN1Y2ggYSBw
YXRjaA0KPiA+IHdvdWxkIGJlIGFjY2VwdGVkIHVwc3RyZWFtLg0KPiANCj4gSSB0ZW5kIHRvIGRv
dWJ0IGl0IGFzIHdlbGwuIERlc2NyaWJpbmcgR1BJT3MgaW4gdGhlIGRldmljZXRyZWUgYWx3YXlz
IHVzZXMgdGhlDQo+IEdQSU8gY29udHJvbGxlciBwaGFuZGxlIGZvciBhIGJhc2UgcmVmZXJlbmNl
IGFuZCB0aGUgcGluIG51bWJlcnMgYXJlDQo+IG1hcHBlZCBhdCBydW50aW1lIGFzIHJlcXVpcmVk
Lg0KPiANCj4gSWYgaXQncyBhIHVzZXJzcGFjZSBwcm9ibGVtLCB0aGVuIHRoZXJlIGFyZSBtZWFu
cyB2aWEgc3lzZnMgYW5kIHRoZSBjaGFyZGV2DQo+IEFQSSB0byBkaXNjb3ZlciB3aGljaCBjb250
cm9sbGVyIHlvdSdyZSB0YWxraW5nIHRvIChlLmcuIGNoaXAgbGFiZWxzLCBuYW1lZA0KPiBncGlv
cykuIEVpdGhlciBvZiB0aG9zZSBhcHByb2FjaGVzIHNob3VsZCBzdWZmaWNlLg0KDQpUaGUgbW90
aXZhdGlvbiB0byBjb250cm9sIEdQSU9zIHRob3VnaCBTWVNGUy4NCldlIGhhdmUgYSBjb3VwbGUg
b2YgcmVhc29ucyBmb3IgdGhhdDoNCg0KTmVlZCBpdCB0byBzdXBwb3J0IHByb2R1Y3Rpb24gLSB0
aGV5IHVzZWQgdG8gdmVyaWZ5IGFsbCB0aGUgY29ubmVjdGVkIEdQSU9zLg0KDQpTb21lIEdQSU9z
IHVzZWQgdG8gYWxsb3cgYWNjZXNzIHRvIHJlbW90ZSAgY29tcG9uZW50cyBsaWtlICBOQy1TSSBT
UEkgZmxhc2gsIEJJT1MgU1BJIGZsYXNoLCBKVEFHIGludGVyZmFjZSB0byBDUExEcyBvciBzb21l
IG90aGVycyBkZXZpY2VzLg0KDQpBbmQgd2UgYXJlIGRvaW5nIGl0IHRocm91Z2ggL3N5cy9jbGFz
cy9ncGlvLg0KDQpDaGVlcnMsDQpWYWRpbS4NCj4gDQo+IENoZWVycywNCj4gDQo+IEFuZHJldw0K
PiANCj4gPg0KPiA+IG1pbHRvbg0KPiA+DQo=
