Return-Path: <c_mykolak@mellanox.com>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0073.outbound.protection.outlook.com [104.47.0.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wx9yK1300zDr1h
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 00:13:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="ofbQlabk";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=HFZ0qhI+dks+HOMSojkbQrMtYwIhmwIdTrkAWPMHA4A=;
 b=ofbQlabkb9uTuwGosH5XgQoEe1KJzJISv/MAaUZMi2rrLaZL0+TgWeS6KN1K+v+ZFLaVGsLvDYuVlyjyMLC387jly9KsyN3hie+LXgQISnesQjaPgZUyqVzN+Fu+RxE5OPk1IOwUVATNJxe0CXGWXjZle68GsHqraY6GuwXvmxQ=
Received: from VI1PR05MB3247.eurprd05.prod.outlook.com (10.170.238.16) by
 VI1PR05MB3245.eurprd05.prod.outlook.com (10.170.238.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1199.15; Mon, 26 Jun 2017 14:13:23 +0000
Received: from VI1PR05MB3247.eurprd05.prod.outlook.com
 ([fe80::91da:b346:569d:26a2]) by VI1PR05MB3247.eurprd05.prod.outlook.com
 ([fe80::91da:b346:569d:26a2%13]) with mapi id 15.01.1199.017; Mon, 26 Jun
 2017 14:13:23 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH u-boot v2016.07-aspeed-openbmc] Aspeed: ast-g5 change
 configuration order to allow 2-nd boot
Thread-Topic: [PATCH u-boot v2016.07-aspeed-openbmc] Aspeed: ast-g5 change
 configuration order to allow 2-nd boot
Thread-Index: AQHS7mUw/ziBzfga1kq1DTSu9XbTlKI3HNxggAAMYwCAAART0A==
Date: Mon, 26 Jun 2017 14:13:23 +0000
Message-ID: <VI1PR05MB324700C9591FCFBB1BE03846EFDF0@VI1PR05MB3247.eurprd05.prod.outlook.com>
References: <20170602091701.189794-1-c_mykolak@mellanox.com>
 <CACPK8Xc4PJ-NmZfN=vi4t4Tc6yauZ=wp3vfkbNWiB4RdSWgEVg@mail.gmail.com>
 <VI1PR05MB3247D186793DAD7F1CB37EEDEFDF0@VI1PR05MB3247.eurprd05.prod.outlook.com>
 <CACPK8XefYSpZA9D8SfLDW=7vXuHuxth1G+x40XAhZVYwSs=zOQ@mail.gmail.com>
In-Reply-To: <CACPK8XefYSpZA9D8SfLDW=7vXuHuxth1G+x40XAhZVYwSs=zOQ@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR05MB3245;
 7:vhiyGLDxSRwmq+lT8sSQh6lqJBBc5SsNORCo0+Bh+f4+StxIOc1jZZACgg2qytEimd3BJX0cIe+ihXCSbDCM8OBb4laoufHrcJoYaBkpsHMDWzekkFnsyO47xr5dny8gYhE4YId/Of71SQ7+j+RAZ1RzEaJztAjpIn58LOvR8xBl/wHXV9m0sKsJieRBGZj1Mcw6Bz/Rm9FeTApDli8BvWkH+LiX5wQmpRKmxsicZMU6y0GPIfQJ324qPDAKOs/MeRSFLo09Uat9s55VpABRlb5J8hyu5FabulhItXTUyUoGRqCs0h6lm8TaBFNaUD5ba6m65tNTviUjuyv7Kgo4eSKGNKquOzmyBRpyetHqG+x+QDJiqhLcXJuB1iRhhvZNXj71ajshy9KIjJgQFSZcR6KxKA+i+k1Za0TzJdXKmjdZIB1ihIlyWTUFwR2S5lthuodZurePN7egbfhg2SrhRtsfFp+ueaUO4W72BMvb+5iGVA6W8MlFZq0pCcBMUsKkuy11qeEhRTWVIfAp4VMNEDrO12KUYrWac0wo3gJ+0Eeu03XCbEfCeIyDRku9+ikH+hOG1OvcPZrwtY6pI6HYAIOt7HhaFMAS2ifaAkBxV4aHZsjMQ2kM9flkmAm2zus9QRZDasGlIveu9xqo4KM4Q8IfqKOFNHxUf6kguD7a1F1i8Vj3OX54CL8VvZ9myPVnjtZ2V0jRFExtrZurkD6IZ6suGCXPbfKA7Q/miFVEWVhimdUDgfi7zcZ4QS8znS/vKZrh4FKaG4qQ5wwPMQscNVIuQ3umLAOsZGEgQSKXGt8=
x-ms-office365-filtering-correlation-id: caa75da8-0f60-48d2-165c-08d4bc9d8178
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(300000503095)(300135400095)(48565401081)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095);
 SRVR:VI1PR05MB3245; 
x-ms-traffictypediagnostic: VI1PR05MB3245:
x-microsoft-antispam-prvs: <VI1PR05MB32452D9A6787521EFE5AE9AAEFDF0@VI1PR05MB3245.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(133145235818549)(236129657087228)(189930954265078)(65623756079841)(48057245064654)(45079756050767);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(100000703101)(100105400095)(6055026)(6041248)(20161123562025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123558100)(20161123555025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:VI1PR05MB3245; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:VI1PR05MB3245; 
x-forefront-prvs: 0350D7A55D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39450400003)(39840400002)(39860400002)(39410400002)(39850400002)(39400400002)(24454002)(377454003)(13464003)(74316002)(102836003)(2906002)(6506006)(3280700002)(7696004)(53936002)(110136004)(55016002)(6116002)(38730400002)(6246003)(5250100002)(33656002)(99286003)(53546010)(9686003)(6306002)(45080400002)(575784001)(189998001)(6436002)(76176999)(3846002)(86362001)(50986999)(229853002)(2950100002)(54356999)(2900100001)(8676002)(3660700001)(8936002)(305945005)(14454004)(478600001)(81166006)(93886004)(66066001)(966005)(6916009)(25786009)(230783001)(7736002)(4326008)(5660300001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3245;
 H:VI1PR05MB3247.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2017 14:13:23.2382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3245
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
X-List-Received-Date: Mon, 26 Jun 2017 14:13:30 -0000

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGpvZWwuc3RhbkBnbWFpbC5j
b20gW21haWx0bzpqb2VsLnN0YW5AZ21haWwuY29tXSBPbiBCZWhhbGYgT2YgSm9lbA0KPiBTdGFu
bGV5DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAyNiwgMjAxNyA0OjQ5IFBNDQo+IFRvOiBNeWtvbGEg
S29zdGVub2sgPGNfbXlrb2xha0BtZWxsYW5veC5jb20+DQo+IENjOiBPcGVuQk1DIE1haWxsaXN0
IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdS1ib290
IHYyMDE2LjA3LWFzcGVlZC1vcGVuYm1jXSBBc3BlZWQ6IGFzdC1nNQ0KPiBjaGFuZ2UgY29uZmln
dXJhdGlvbiBvcmRlciB0byBhbGxvdyAyLW5kIGJvb3QNCj4gDQo+IE9uIE1vbiwgSnVuIDI2LCAy
MDE3IGF0IDExOjE2IFBNLCBNeWtvbGEgS29zdGVub2sNCj4gPGNfbXlrb2xha0BtZWxsYW5veC5j
b20+IHdyb3RlOg0KPiA+IFRoYW5rcyBmb3IgeW91ciBhdHRlbnRpb24uDQo+ID4NCj4gPiBCZXN0
IHJlZ2FyZHMuIE15a29sYSBLb3N0ZW5vay4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+PiBGcm9tOiBqb2VsLnN0YW5AZ21haWwuY29tIFttYWlsdG86am9lbC5zdGFu
QGdtYWlsLmNvbV0gT24gQmVoYWxmIE9mDQo+ID4+IEpvZWwgU3RhbmxleQ0KPiA+PiBTZW50OiBN
b25kYXksIEp1bmUgMjYsIDIwMTcgMToxNSBQTQ0KPiA+PiBUbzogTXlrb2xhIEtvc3Rlbm9rIDxj
X215a29sYWtAbWVsbGFub3guY29tPg0KPiA+PiBDYzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHUtYm9vdCB2MjAx
Ni4wNy1hc3BlZWQtb3BlbmJtY10gQXNwZWVkOiBhc3QtZzUNCj4gPj4gY2hhbmdlIGNvbmZpZ3Vy
YXRpb24gb3JkZXIgdG8gYWxsb3cgMi1uZCBib290DQo+ID4+DQo+ID4+IE9uIEZyaSwgSnVuIDIs
IDIwMTcgYXQgNjo0NyBQTSwgTXlrb2xhIEtvc3Rlbm9rDQo+ID4+IDxjX215a29sYWtAbWVsbGFu
b3guY29tPiB3cm90ZToNCj4gPj4gPiArY29uZmlnIEZJUk1XQVJFXzJORF9CT09UDQo+ID4+ID4g
KyAgICAgICBib29sICJGaXJtd2FyZSBzZWNvbmQgYm9vdCBXRDIgZW5hYmxlLiINCj4gPj4gPiAr
ICAgICAgIGRlZmF1bHQgbg0KPiA+Pg0KPiA+PiBMb29raW5nIGF0IHRoZSBtb3N0IHJlY2VudCBw
bGF0Zm9ybS5TIGZvciB0aGUgRzU6DQo+ID4+DQo+ID4+DQo+IC8qKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+ID4+ICoqKioqKioqKioq
KioqKioqKioqDQo+ID4+ICBEaXNhYmxlIFdEVDIgZm9yIDJuZCBib290IGZ1bmN0aW9uDQo+ID4+
DQo+ID4+DQo+ICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioNCj4gPj4gKioqKioqKioqKioqKioqKioqKiovDQo+ID4+IC8qDQo+ID4+ICNp
Zm5kZWYgQ09ORklHX0ZJUk1XQVJFXzJORF9CT09UDQo+ID4+ICAgICBsZHIgICByMCwgPTB4MWU3
ODUwMmMNCj4gPj4gICAgIG1vdiAgIHIxLCAjMA0KPiA+PiAgICAgc3RyICAgcjEsIFtyMF0NCj4g
Pj4gI2VuZGlmDQo+ID4+DQo+ID4+IEJ5IHNldHRpbmcgdGhpcyBvcHRpb24gd2UgZGlzYWJsZSB0
aGlzIGNvZGUsIHNvIHdlIGRvIG5vdCBjbGVhciB0aGUNCj4gPj4gV0RUMiBzdGF0dXMgcmVnaXN0
ZXIuDQo+ID4+DQo+ID4+IFRoZSBoZWxwIHRleHQgZm9yIHlvdXIgS2NvbmZpZyBvcHRpb24gaXMg
Y29uZnVzaW5nOyBJIHdvdWxkIHRoaW5rDQo+ID4+IHRoYXQgaXQgbWVhbnMgd2UgZW5hYmxlIFdE
VDIuDQo+ID4+DQo+ID4+IENhbiB5b3UgY2xhcmlmeT8NCj4gPj4NCj4gPg0KPiA+IFdlIGNhbiBj
aGFuZ2UgaGVscCB0ZXh0IHRvICJGaXJtd2FyZSBzZWNvbmQgYm9vdCBzdXBwb3J0IGVuYWJsZSIu
DQo+ID4gQnkgZGVmYXVsdCBhZnRlciBwb3dlciB1cCBXRFQyIGVuYWJsZWQuIFRoaXMgY29kZSBk
aXNhYmxlIFdEVDIgaW4gdS0NCj4gYm9vdC4NCj4gPiBTbyB3aGVuIENPTkZJR19GSVJNV0FSRV8y
TkRfQk9PVCBkZWZpbmVkIC0gV0RUMiBub3QgZGlzYWJsZWQgaW4NCj4gdS1ib290Lg0KPiANCj4g
T2suIFRoZSBjdXJyZW50IHZlcnNpb24gb2YgcGxhdGZvcm0uUyBoYXMgdGhpcyBlbnRpcmUgY2h1
bmsgY29tbWVudGVkIG91dCwNCj4gc28gdGhlIHN0YXRlIG9mIENPTkZJR19GSVJNV0FSRV8yTkRf
Qk9PVCBpcyBpcnJlbGV2YW50Lg0KPiANCj4gDQo+IGh0dHBzOi8vZW1lYTAxLnNhZmVsaW5rcy5w
cm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXQNCj4gaHViLmNvbSUy
Rm9wZW5ibWMlMkZ1LQ0KPiBib290JTJGYmxvYiUyRmVkOWU0YWJiZjNmMGFhYjM0OGJjNjRkNTQz
OWFhZGRhMDNmNDJlNGMlMkZhcmNoJTJGDQo+IGFybSUyRm1hY2gtDQo+IGFzcGVlZCUyRnBsYXRm
b3JtX2c1LlMlMjNMNjEyJmRhdGE9MDIlN0MwMSU3Q2NfbXlrb2xhayU0MG1lbGxhbg0KPiBveC5j
b20lN0MxZDFiOWFjYzBjNmE0YzZkMTljYzA4ZDRiYzlhMzU4NSU3Q2E2NTI5NzFjN2QyZTRkOWJh
NmE0ZA0KPiAxNDkyNTZmNDYxYiU3QzAlN0MwJTdDNjM2MzQwODE3OTIzOTEwOTMxJnNkYXRhPTdo
YjVXaWNCU0cwNmIxJTINCj4gRk5zTGdCZzFkTiUyQkdpd0F5anVDcnpzY2Nna04lMkI4JTNEJnJl
c2VydmVkPTANCj4gDQo+IERvIHlvdSBuZWVkIFdEVDIgZGlzYWJsZWQgaW4gdS1ib290PyBXaXRo
IHlvdXIgb3RoZXIgY2hhbmdlcyBhcHBsaWVkIHlvdQ0KPiBzaG91bGQgYmUgYWJsZSB0byBkcm9w
IHRvIHRoZSBwcm9tcHQsIGV0YywgYW5kIHRoZSB3YXRjaGRvZyBpcyBzZXJ2aWNlZC4NCg0KU29y
cnksIEkgbWlzc2VkIHRoYXQgdGhpcyBjb2RlIHdhcyBjb21tZW50ZWQgb3V0Lg0KTm8sIHdlIG5l
ZWQgV0RUMiBlbmFibGVkLiBTbyBpdHMgb2sgZm9yIHVzLg0KVGhhbmtzLg0KDQpCZXN0IHJlZ2Fy
ZHMuIE15a29sYSBLb3N0ZW5vay4NCg0K
