Return-Path: <c_mykolak@mellanox.com>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00081.outbound.protection.outlook.com [40.107.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxB2V0nqmzDr1h
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 00:17:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="hlHB4Jac";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=BXCGDsJz0ncf07AbXVHrhUe4DJU6LfS77+rz6MGPuC4=;
 b=hlHB4Jacd4r/WC8VcXojqp8dProGhV95CumGERTe04ZV1RCOQ42/mCgi54byt1vIQqFGB49uGx32vuPYNK8pjD1LMKhtI8fPIsLE98bv89RDBcrUyH91On8ERXZUCcB9aVvIkrJHBAHKtJ/u/4gFDbyxrJQZyQN29IQUzCqWUrk=
Received: from VI1PR05MB3247.eurprd05.prod.outlook.com (10.170.238.16) by
 VI1PR05MB3247.eurprd05.prod.outlook.com (10.170.238.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1199.15; Mon, 26 Jun 2017 14:17:00 +0000
Received: from VI1PR05MB3247.eurprd05.prod.outlook.com
 ([fe80::91da:b346:569d:26a2]) by VI1PR05MB3247.eurprd05.prod.outlook.com
 ([fe80::91da:b346:569d:26a2%13]) with mapi id 15.01.1199.017; Mon, 26 Jun
 2017 14:17:00 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH u-boot v2016.07-aspeed-openbmc] Add ast-g5 ncsi 2nd boot
 config.
Thread-Topic: [PATCH u-boot v2016.07-aspeed-openbmc] Add ast-g5 ncsi 2nd boot
 config.
Thread-Index: AQHS24Epj6VwZ4Hw1E+hA0gIgKki1aI3EpCAgABDpmA=
Date: Mon, 26 Jun 2017 14:17:00 +0000
Message-ID: <VI1PR05MB3247F1B9D52FE88E0D3D6437EFDF0@VI1PR05MB3247.eurprd05.prod.outlook.com>
References: <20170602091800.189904-1-c_mykolak@mellanox.com>
 <CACPK8XcdZ0L1oc+jC25RDccC78wxa4Ybt3X=RqRuHFjV2+Rs0Q@mail.gmail.com>
In-Reply-To: <CACPK8XcdZ0L1oc+jC25RDccC78wxa4Ybt3X=RqRuHFjV2+Rs0Q@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR05MB3247;
 7:MqWUoGfdhw4+x335GrBLgzIycGkTLMhZc9JWDzn3czn8C/ODroXmrSWRNp3CUQGaJ+dNFh0qL65dhm24IhUmTE5JrlDQH+QBrmro9ftTkXp8Uic4IVuGhD1TgDPSSWUF3S1lmg9/VlxCGzVG+iGozdsQyQ6xeTG8pk9jRt9jxAyht+HIFvLY8fTqpH5pHQ2TSw5lEwD1vGDHepKceu9btKCOge+apUPWBh9CCOe0bJTSallZbZuWPQVtI2EFwbIvuS+no5KLcfajt1yJ2TNrtrfDn06kb59muKi2Hm2H3nc76/cyuRW3NBsfgxvj0kFe9WzV5ZsJkWJnSrC7D8QtotjtYx4/CDexiK1EXwT8KawJcBnjlVb985/d1r5D2+MkzaBaZAVQppKY9GFfKqqWy66dlyQCx9H97ZkR/mZl0bW8iXlHVFTtNkNEaPGKb904jvutO+ByFnmFKOZe12uhbctQsm2DbXB/iwqNXNwCi3/2NdqFJmuyTXmfMHEh/eC5z0hz2EGl6u7cqQuPKt58ocIXZ2/41+IX8bsO7NkfC0o9DprYshZ6yWVvC0XxvrHagDDxzolqKXOtsLQLdkzSLjGHIRHOb24hCnDhrKhVw/9qm0nl2g3L2WN4Vbf3x7vUpmYrbaZ9K62N5/YfTWDXiXn7KcmUl5ggtvLqo1Jn55QCjPw16TQQzDP3ur/3IJR2hSN9gwqjh3xOltJNHbf0dr7a/Xiksf1Y2XE1YJkl3w0dVOpL7KN+RNpXUXdzSagYUAjHw1iVXboD1zDAM8S7gftjhdcMiS8wH72OAecUxL8=
x-ms-office365-filtering-correlation-id: 8d4ad0ca-e054-4301-9739-08d4bc9e02c1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254075)(48565401081)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506067)(300135500095);
 SRVR:VI1PR05MB3247; 
x-ms-traffictypediagnostic: VI1PR05MB3247:
x-microsoft-antispam-prvs: <VI1PR05MB3247249575AF044D7237246AEFDF0@VI1PR05MB3247.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(236129657087228)(65623756079841);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(100000703101)(100105400095)(6055026)(6041248)(20161123564025)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:VI1PR05MB3247; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:VI1PR05MB3247; 
x-forefront-prvs: 0350D7A55D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39840400002)(39860400002)(39410400002)(39450400003)(39400400002)(39850400002)(24454002)(377454003)(13464003)(5660300001)(4326008)(33656002)(110136004)(478600001)(5250100002)(2950100002)(55016002)(81166006)(6246003)(3846002)(6116002)(102836003)(8676002)(76176999)(54356999)(189998001)(6436002)(8936002)(50986999)(7696004)(6916009)(53546010)(99286003)(7736002)(66066001)(86362001)(9686003)(25786009)(229853002)(38730400002)(305945005)(3280700002)(3660700001)(6506006)(53936002)(14454004)(74316002)(2900100001)(230783001)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3247;
 H:VI1PR05MB3247.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2017 14:17:00.1303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3247
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
X-List-Received-Date: Mon, 26 Jun 2017 14:17:07 -0000

DQoNCkJlc3QgcmVnYXJkcy4gTXlrb2xhIEtvc3Rlbm9rLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IGpvZWwuc3RhbkBnbWFpbC5jb20gW21haWx0bzpqb2VsLnN0YW5A
Z21haWwuY29tXSBPbiBCZWhhbGYgT2YgSm9lbA0KPiBTdGFubGV5DQo+IFNlbnQ6IE1vbmRheSwg
SnVuZSAyNiwgMjAxNyAxOjEzIFBNDQo+IFRvOiBNeWtvbGEgS29zdGVub2sgPGNfbXlrb2xha0Bt
ZWxsYW5veC5jb20+DQo+IENjOiBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdS1ib290IHYyMDE2LjA3LWFzcGVlZC1vcGVu
Ym1jXSBBZGQgYXN0LWc1IG5jc2kgMm5kDQo+IGJvb3QgY29uZmlnLg0KPiANCj4gT24gRnJpLCBK
dW4gMiwgMjAxNyBhdCA2OjQ4IFBNLCBNeWtvbGEgS29zdGVub2sNCj4gPGNfbXlrb2xha0BtZWxs
YW5veC5jb20+IHdyb3RlOg0KPiA+IEFkZCBuY3NpIDJuZCBib290IGFzcGVlZCBnNSBjb25maWd1
cmF0aW9uIGhlYWRlci4NCj4gPiBJdCBiYXNlZCBvbiBhc3QtZzUtbmNzaS5oIGV4dGVuZGVkIHdp
dGggZGVmaW5lcyBmb3IgbWVtdGVzdC4NCj4gDQo+IEkgd2FzIGhvcGluZyB0byBtZXJnZSB0aGVz
ZSBjaGFuZ2VzIGludG8gdGhlIG5vcm1hbCBjb25maWd1cmF0aW9ucywgaW5zdGVhZA0KPiBvZiBo
YXZpbmcgYSBzZXBhcmF0ZSBjb25maWcuDQo+IA0KPiBUaGUgb25seSBkaWZmZXJlbmNlIGlzIHRo
ZSBwcmVzZW5jZSBvZiB0aGUgU1lTX01FTVRFU1QgZGVmaW5lcy4NCj4gDQo+ID4gKy8qIHBsYXRm
b3JtLlMgc2V0dGluZ3MgKi8NCj4gPiArI2RlZmluZSAgICAgICAgQ09ORklHX0RSQU1fRUNDX1NJ
WkUgICAgICAgICAgICAweDEwMDAwMDAwDQo+ID4gKw0KPiA+ICsjZGVmaW5lIENPTkZJR19TWVNf
TUVNVEVTVF9TSVpFICAgICAgICAxMjggKiAxMDI0ICogMTAyNCAvKiAxMjhNQiAqLw0KPiA+ICsj
ZGVmaW5lIENPTkZJR19TWVNfTUVNVEVTVF9TVEFSVCAgICAgICBDT05GSUdfU1lTX1NEUkFNX0JB
U0UNCj4gPiArI2RlZmluZSBDT05GSUdfU1lTX01FTVRFU1RfRU5EIChDT05GSUdfU1lTX01FTVRF
U1RfU1RBUlQgKw0KPiA+ICtDT05GSUdfU1lTX01FTVRFU1RfU0laRSkNCj4gDQo+IEkgd2FzIGxv
b2tpbmcgYXQgdGhlIHUtYm9vdCB0cmVlLCBhbmQgaXQgYXBwZWFycyB0aGF0IHRoZXNlIFNZU19N
RU1URVNUDQo+IGRlZmluZXMgYXJlIHVzZWQgYnkgdGhlIG10ZXN0IGNvbW1hbmQsIGFuZCB0aGUg
bXRlc3QgY29tbWFuZCBpcw0KPiBkZXByZWNhdGVkOg0KPiANCj4gDQo+IDIuIFRoZSAibXRlc3Qi
IGNvbW1hbmQuDQo+IA0KPiAgICBUaGlzIGlzIHByb2JhYmx5IHRoZSBiZXN0IGtub3duIG1lbW9y
eSB0ZXN0IHV0aWxpdHkgaW4gVS1Cb290Lg0KPiAgICBVbmZvcnR1bmF0ZWx5LCBpdCBpcyBhbHNv
IHRoZSBtb3N0IHByb2JsZW1hdGljLCBhbmQgdGhlIG1vc3QNCj4gICAgdXNlbGVzcyBvbmUuDQo+
IA0KPiAgICBCZWNhdXNlIG9mIHRoZXNlIGlzc3VlcywgdGhlICJtdGVzdCIgY29tbWFuZCBpcyBj
b25zaWRlcmVkIGRlcHJlLQ0KPiAgICBjYXRlZC4gIEl0IHNob3VsZCBub3QgYmUgZW5hYmxlZCBp
biBtb3N0IG5vcm1hbCBwb3J0cyBvZiBVLUJvb3QsDQo+ICAgIGVzcGVjaWFsbHkgbm90IGluIHBy
b2R1Y3Rpb24uICBJZiB5b3UgcmVhbGx5IG5lZWQgYSBtZW1vcnkgdGVzdCwNCj4gICAgdGhlbiBz
ZWUgMS4gYW5kIDMuIGFib3ZlIHJlc3AuIGJlbG93Lg0KPiANCj4gQXJlIHlvdSBzdXJlIHRoYXQg
eW91IHdhbnQgdG8gZW5hYmxlIHRoZSBtdGVzdCBjb21tYW5kPw0KPiANCg0KV2UgYWRkZWQgbXRl
c3QsIGJlY2F1c2UgaXQgd2FzIHRoZSBwcm9kdWN0aW9uIHJlcXVpcmVtZW50Lg0KRm9sbG93aW5n
IHRoZSByZWZlcmVuY2UgZnJvbSB1LWJvb3QgeW91IHBvaW50ZWQgb3V0Og0KKzMuIFRoZSBtb3N0
IHRob3JvdWdoIG1lbW9yeSB0ZXN0IGZhY2lsaXR5IGlzIGF2YWlsYWJsZSBhcyBwYXJ0IG9mIHRo
ZQ0KKyAgIFBPU1QgKFBvd2VyLU9uIFNlbGYgVGVzdCkgc3ViLXN5c3RlbSwgc2VlICJwb3N0L2Ry
aXZlcnMvbWVtb3J5LmMiLg0KSSBzZWUgdGhhdCAgaW4gcG9zdC9NYWtlZmlsZSB0aGVyZSBpcyBu
byBlbnRyeSBmb3IgQVJNDQpvYmotJChDT05GSUdfQVJNKSArPSBjcHUvYXJtLw0KDQpJ4oCZbGwg
Y2hlY2sgaXQuIElmIGl04oCZcyB3b3JrIOKAkyB3b3VsZCBiZSBnb29kIHdpdGggdXMuDQoNCj4g
Q2hlZXJzLA0KPiANCj4gSm9lbA0KPiANCj4gDQo+ID4gKw0KPiA+ICsjZW5kaWYgLyogX19BU1Rf
RzVfTkNTSV8yQk9PVF9DT05GSUdfSCAqLw0KPiA+IC0tDQo+ID4gMi4xMS4wDQo+ID4NCg==
