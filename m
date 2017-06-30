Return-Path: <vadimp@mellanox.com>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00057.outbound.protection.outlook.com [40.107.0.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wzP7Y0Z7jzDr5p
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 14:44:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="PcuZwgCU";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QSBpJFi4ddVYNY5JIMyYY5hFRDSe7B+FoIOvFYAjbnI=;
 b=PcuZwgCUzAEyzqRmrxX92lstsDvh2IBNOSPsUVV/62bHT2cUph/ccONvsB7J7r67rSuwh1bYcMXXCbje/klSW6JuUjZPBMCAJ4k8BC7MycIVAF48XFnqhOPNXfCf+U9y80tOU5VvcESjZLqGkItsiQJo3z0g0uLejUJW4RL8FWw=
Received: from AM4PR05MB3330.eurprd05.prod.outlook.com (10.171.187.15) by
 DB5PR05MB1222.eurprd05.prod.outlook.com (10.161.244.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1199.15; Fri, 30 Jun 2017 04:44:01 +0000
Received: from AM4PR05MB3330.eurprd05.prod.outlook.com
 ([fe80::b139:dd6:ef32:aafd]) by AM4PR05MB3330.eurprd05.prod.outlook.com
 ([fe80::b139:dd6:ef32:aafd%13]) with mapi id 15.01.1220.015; Fri, 30 Jun 2017
 04:44:01 +0000
From: Vadim Pasternak <vadimp@mellanox.com>
To: Andrew Jeffery <andrew@aj.id.au>, Mykola Kostenok
 <c_mykolak@mellanox.com>, Joel Stanley <joel@jms.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH linux dev-4.10] aspeed-g5: add gpiolib irqchip support.
Thread-Topic: [PATCH linux dev-4.10] aspeed-g5: add gpiolib irqchip support.
Thread-Index: AQHS8UHCCIreNEtxC0qZUHs9rG2hU6I80sHg
Date: Fri, 30 Jun 2017 04:44:01 +0000
Message-ID: <AM4PR05MB33301315344DDE9F1ED9F775A2D30@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <20170629133239.17711-1-c_mykolak@mellanox.com>
 <1498786763.5203.17.camel@aj.id.au>
In-Reply-To: <1498786763.5203.17.camel@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [46.120.54.214]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR05MB1222;
 7:oFY20ZzfS5kedHOL51nWMcA8kIEVyi+zp3tCcK9WolSOb/cATywlYJJuLNsjQ+ONTSUXtcABLElDxfOtzo9eqyP6L4xtyz9t2o6bH0uQaFzNR1CHXHO8obnZIqfylQvt1lnSdAwoEZymUe2vtRvMXBnkSg5BW+iqL2Mqe9JCwW7QckB2MBczVwIzG+8aiVUwn6tOCyQWLK6i+ONtOKdToto6k06JSozrmj/XImlYsaBn/2qjGmI2Bn9DTTTbEiZzylraCGSXCY5Yo5I1SOGooowAvF/mVgq+7W+2EDAvkpNBherRnzY0j+kH6lh5F953qqsyxGyTxmldqni84XBAHxy8GMbagzGmkGzftEIxrMC9wQ9oJFapG1+D9tbFwmSu0PNZ8KHwtWSWEVK4bpnX9qkkRFFTln0xPBKRTiA2Bvu0aPIEY2F5UNVSaJcknayzuPERGMpt+ye1fl4X99vY2ndcVYM5uNC5P3SqAUURhNLILOHKNIBihA0T/YmKeQO0aGDKuR6E/3PvEkyz2k0R2IDLV5dAKtM8HmAEudGHla/H+kqKpyc7FDnOfdUbahe+wNE51Tbza0NLSgVoF+/pOAJY3xPE3NgcL8Z55i32koGR/kwRo1XNT1wuySq9tMeSRqo41n/r5cExxZm/aJehiQrA86Rl8C3R6qF4f8BEKs93byn4gNEYnzoZ1ojgrJ8JIwZVK5RmJkLorFUTg9p+8EoimEFKOavyD8aT6qLxNgubGeDHLYJQNh5LUg5+bxVsj7DX1d9PsyqFpPsr/b2Qvk2J3zmBf5j3IWYnhkt8qBk=
x-ms-office365-filtering-correlation-id: 2cd847b7-81c7-45d7-7f03-08d4bf72a0e1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(300000503095)(300135400095)(48565401081)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:DB5PR05MB1222; 
x-ms-traffictypediagnostic: DB5PR05MB1222:
x-microsoft-antispam-prvs: <DB5PR05MB122263E061D04D9C1B666D62A2D30@DB5PR05MB1222.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(133145235818549)(236129657087228)(65623756079841)(21532816269658); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6055026)(6041248)(20161123555025)(20161123564025)(20161123560025)(20161123562025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:DB5PR05MB1222; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:DB5PR05MB1222; 
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(6009001)(39450400003)(39410400002)(39860400002)(39840400002)(39400400002)(39850400002)(37524003)(377454003)(377424004)(13464003)(24454002)(305945005)(3846002)(66066001)(3660700001)(9686003)(99286003)(81166006)(74316002)(2906002)(8676002)(6116002)(102836003)(3280700002)(2501003)(5250100002)(5660300001)(55016002)(8936002)(6246003)(6506006)(25786009)(478600001)(7736002)(14454004)(229853002)(6436002)(53936002)(38730400002)(86362001)(33656002)(189998001)(97736004)(2900100001)(50986999)(53546010)(2950100002)(7696004)(76176999)(54356999)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR05MB1222;
 H:AM4PR05MB3330.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:ovrnspm;
 PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2017 04:44:01.2071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR05MB1222
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
X-List-Received-Date: Fri, 30 Jun 2017 04:44:10 -0000

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5i
bWMgW21haWx0bzpvcGVuYm1jLQ0KPiBib3VuY2VzK3lhbml2YWI9bWVsbGFub3guY29tQGxpc3Rz
Lm96bGFicy5vcmddIE9uIEJlaGFsZiBPZiBBbmRyZXcNCj4gSmVmZmVyeQ0KPiBTZW50OiBGcmlk
YXksIEp1bmUgMzAsIDIwMTcgNDozOSBBTQ0KPiBUbzogTXlrb2xhIEtvc3Rlbm9rIDxjX215a29s
YWtAbWVsbGFub3guY29tPjsgSm9lbCBTdGFubGV5DQo+IDxqb2VsQGptcy5pZC5hdT47IG9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGxpbnV4IGRldi00LjEw
XSBhc3BlZWQtZzU6IGFkZCBncGlvbGliIGlycWNoaXAgc3VwcG9ydC4NCj4gDQo+IEhpIE15a29s
YSwNCj4gDQo+IE9uIFRodSwgMjAxNy0wNi0yOSBhdCAxNjozMiArMDMwMCwgTXlrb2xhIEtvc3Rl
bm9rIHdyb3RlOg0KPiA+IFRvIGFsbG93IHN1cHBvcnQgZ3BpbyBjbGFzcyBpbmZyYXN0cnVjdHVy
ZSBmb3IgQXNwZWVkIFNPQy4NCj4gPiBUbyBhbGxvdyBncGlvX3RvX2lycSBjb252ZXJzaW9uLg0K
PiA+DQo+ID4gRW5hYmxlIGlycWNoaXAgYW5kIGxpYmdwaW9faXJxY2hpcCBmb3IgYXNwZWVkLWc1
Lg0KPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNeWtvbGEgS29zdGVub2sgPGNfbXlrb2xha0Bt
ZWxsYW5veC5jb20+DQo+ID4gLS0tDQo+ID4gwqBhcmNoL2FybS9tYWNoLWFzcGVlZC9LY29uZmln
IHwgMyArKysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLWFzcGVlZC9LY29uZmlnDQo+ID4gYi9hcmNoL2Fy
bS9tYWNoLWFzcGVlZC9LY29uZmlnIGluZGV4IGYzZjhjNWM2NThkYi4uZTA5OGI3YTc4MGVlDQo+
IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtL21hY2gtYXNwZWVkL0tjb25maWcNCj4gPiArKysg
Yi9hcmNoL2FybS9tYWNoLWFzcGVlZC9LY29uZmlnDQo+ID4gQEAgLTI3LDYgKzI3LDkgQEAgY29u
ZmlnIE1BQ0hfQVNQRUVEX0c1DQo+ID4gPiDCoAlkZXBlbmRzIG9uIEFSQ0hfTVVMVElfVjYNCj4g
PiA+IMKgCXNlbGVjdCBDUFVfVjYNCj4gPiA+IMKgCXNlbGVjdCBQSU5DVFJMX0FTUEVFRF9HNQ0K
PiA+ID4gKwlzZWxlY3QgR0VORVJJQ19JUlFfQ0hJUA0KPiA+ICsJc2VsZWN0IEdQSU9MSUJfSVJR
Q0hJUA0KPiANCj4gU29ycnksIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgbmVlZCBmb3IgdGhpczsg
Q09ORklHX0dQSU9MSUJfSVJRQ0hJUCBpcw0KPiBhbHJlYWR5IHNlbGVjdGVkIGJ5IENPTkZJR19H
UElPX0FTUEVFRCwgd2hpY2ggaXMgZW5hYmxlZCBieSB0aGUNCj4gYXNwZWVkX2c1X2RlZmNvbmZp
Zy4gSSBkb24ndCB0aGluayB3ZSBuZWVkIHRvIGRvIHRoaXMgaGVyZS4NCj4gDQo+IEZ1cnRoZXIs
IHdoYXQgcHJvYmxlbSBhcmUgeW91IHRyeWluZyB0byBzb2x2ZT8gRnJvbSBteSB0ZXN0aW5nIEdQ
SU8NCj4gaW50ZXJydXB0cyBhcmUgZnVuY3Rpb25hbC4NCj4gDQoNCldlIGhhdmUgdGhlIG51bWJl
ciBvZiBDUExEcyB3aXRoIHRoZSBpbnRlcm5hbCBpbnRlcnJ1cHQgY29udHJvbCBsb2dpYy4gSW50
ZXJydXB0cyBvbiB0b3Agcm91dGVkIHRocm91Z2ggdGhlIHBhcnRpY3VsYXIgR1BJTyB0byBTb0Mu
DQpUaGUgbW90aXZhdGlvbiB3YXMgdG8gc3BlY2lmeSB0b3AgYWdncmVnYXRpb24gaW50ZXJydXB0
IGZvciBDUExEIGRyaXZlciBpbiBEVFMgd2l0aCBHUElPIHBpbiBudW1iZXIgYW5kIGNvbnZlcnQg
aXQgaW4gZHJpdmVyIHdpdGggZ3Bpb190b19pcnEgYW5kIGNvbm5lY3QgaXJxIHRvIENQTEQgaW50
ZXJydXB0IGhhbmRsZXIuDQoNCkNoZWVycywNClZhZGltLg0KDQo+IENoZWVycywNCj4gDQo+IEFu
ZHJldw0KPiANCj4gPiArDQo+ID4gPiDCoAloZWxwDQo+ID4gPiDCoAnCoFNheSB5ZXMgaWYgeW91
IGludGVuZCB0byBydW4gb24gYW4gQXNwZWVkIGFzdDI1MDAgb3Igc2ltaWxhcg0KPiA+ID4gwqAJ
wqBmaWZ0aCBnZW5lcmF0aW9uIEFzcGVlZCBCTUNzLg0K
