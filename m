Return-Path: <c_mykolak@mellanox.com>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0084.outbound.protection.outlook.com [104.47.1.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wx9RQ17kKzDr1r
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 23:50:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="mAluGJMB";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=HvQaFdQU//+4WIRmCDbMIP/B+KnHk/gucHfBnt2bDYA=;
 b=mAluGJMBJnRDnhQo1oaZ11rkOtxZnfP+u1LcTXdL5ZbRCXjtHDrl+sU9A1n9vT0xmUYGoeWBAhKW/LLSQkI8zmRctK64G7Dp6gpgKPm21mlpW4Mowav4rDArKvwRPxWYKjAODzOgApf1HWjj1wWFRnduAygeUFRpM3h1ac85r/c=
Received: from VI1PR05MB3247.eurprd05.prod.outlook.com (10.170.238.16) by
 VI1PR05MB3245.eurprd05.prod.outlook.com (10.170.238.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1199.15; Mon, 26 Jun 2017 13:50:04 +0000
Received: from VI1PR05MB3247.eurprd05.prod.outlook.com
 ([fe80::91da:b346:569d:26a2]) by VI1PR05MB3247.eurprd05.prod.outlook.com
 ([fe80::91da:b346:569d:26a2%13]) with mapi id 15.01.1199.017; Mon, 26 Jun
 2017 13:50:04 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH u-boot v2016.07-aspeed-openbmc] Add WD2 reset support for
 ast-g5
Thread-Topic: [PATCH u-boot v2016.07-aspeed-openbmc] Add WD2 reset support for
 ast-g5
Thread-Index: AQHS7mcvlnzTaDOdmUSWB4NJQ5qbr6I3KHCg
Date: Mon, 26 Jun 2017 13:50:04 +0000
Message-ID: <VI1PR05MB3247279583BDB6A9E13B0281EFDF0@VI1PR05MB3247.eurprd05.prod.outlook.com>
References: <20170524152820.43150-1-c_mykolak@mellanox.com>
 <CACPK8Xfyi=8+ae8TduMnkuh=L11DjWiRUnS82ZJLybVNJQVv7w@mail.gmail.com>
In-Reply-To: <CACPK8Xfyi=8+ae8TduMnkuh=L11DjWiRUnS82ZJLybVNJQVv7w@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR05MB3245;
 7:QnOr2fpJJWa8ElwlFNIh2DI/KRWufPGHXUz32BM2q6usmH6oe26Oz5OGHsf6iH8w+IdJupl7X1a1mVabAX3yyPQghp/mtdU151EtGbCg3dEudi0i+H92ilWPER6ZKR1aSJnja+mrF9hhj+WwZj8i+MvcOM9RQ4OVzdcCCefx4xDhxglquS3dnGHPWbFF1/xuoLqHM86BgJ7uJGkDaGRMgujOmxEivgVHjQ/RVVJraGbEnXxjbD0crqWURt5P4cI5VcaqX4IYrml/pZgo6w9z2g7lB6kROntGQFHIzPKBQulxDrwmrYq3nAGXYOCO+eLt0EmbXfbwDFFTb4XShCBPqcHowmyIlEPQteZhId2DjY+5oFClzXbHFN/w4iRnNVvvR6bFsX8s12NsXPRP2rFD9V6f2huOOl/uEG0nGp3JVBNtu2Cn+xLtU2n1OUU+OOQ/XQK3qIIMGYX7tzZ3Y4wJfW4FS/lzI6u3ecB/OnK0vCSegDQD6Eg+/Z2dw7Pp4jZyF9XEOgebgibU/ZDbfUADHFqswDvrQB3lIbd+TrxYYZ2lc3INITZ/xobPgOGEoDxCDvEGoTfgUf9t+QG70cNzedoE2H2Kk3zphto9DaB9kvJ3RlKeUHugde9AbpNksbYVbGeVa3tFyIVcw1Mtd26BOYCKpP1dBiQpCBWu7T6bYaBn1adbyCT3GZmG9ZVgA4aMiAUMz1OzgnkloBnXOTMyPL12XkLPEfSZPW/8FVi8e42h74LWhay8warm3CinTmWeqhJMMcNe6sVWX/tIPfYllVpsH/ib5LhQzHika3Wt5qE=
x-ms-office365-filtering-correlation-id: 652ca0c6-15f6-418c-dc9d-08d4bc9a3fda
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(300000503095)(300135400095)(48565401081)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095);
 SRVR:VI1PR05MB3245; 
x-ms-traffictypediagnostic: VI1PR05MB3245:
x-microsoft-antispam-prvs: <VI1PR05MB3245D3EC04E4E16AF3903A2DEFDF0@VI1PR05MB3245.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(133145235818549)(236129657087228)(65623756079841); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(3002001)(10201501046)(93006095)(93001095)(6055026)(6041248)(20161123555025)(20161123558100)(20161123564025)(20161123562025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:VI1PR05MB3245; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:VI1PR05MB3245; 
x-forefront-prvs: 0350D7A55D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39850400002)(39860400002)(39410400002)(39400400002)(39840400002)(39450400003)(24454002)(377454003)(13464003)(3660700001)(8676002)(305945005)(8936002)(230783001)(6916009)(25786009)(5660300001)(4326008)(7736002)(14454004)(81166006)(66066001)(478600001)(38730400002)(6116002)(33656002)(6246003)(5250100002)(55016002)(110136004)(9686003)(99286003)(53546010)(102836003)(74316002)(53936002)(7696004)(2906002)(6506006)(3280700002)(229853002)(50986999)(2900100001)(2950100002)(54356999)(189998001)(3846002)(86362001)(76176999)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3245;
 H:VI1PR05MB3247.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2017 13:50:04.6657 (UTC)
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
X-List-Received-Date: Mon, 26 Jun 2017 13:50:11 -0000

DQoNCkJlc3QgcmVnYXJkcy4gTXlrb2xhIEtvc3Rlbm9rLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IGpvZWwuc3RhbkBnbWFpbC5jb20gW21haWx0bzpqb2VsLnN0YW5A
Z21haWwuY29tXSBPbiBCZWhhbGYgT2YgSm9lbA0KPiBTdGFubGV5DQo+IFNlbnQ6IE1vbmRheSwg
SnVuZSAyNiwgMjAxNyAxOjMwIFBNDQo+IFRvOiBNeWtvbGEgS29zdGVub2sgPGNfbXlrb2xha0Bt
ZWxsYW5veC5jb20+DQo+IENjOiBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdS1ib290IHYyMDE2LjA3LWFzcGVlZC1vcGVu
Ym1jXSBBZGQgV0QyIHJlc2V0DQo+IHN1cHBvcnQgZm9yIGFzdC1nNQ0KPiANCj4gT24gVGh1LCBN
YXkgMjUsIDIwMTcgYXQgMTI6NTggQU0sIE15a29sYSBLb3N0ZW5vaw0KPiA8Y19teWtvbGFrQG1l
bGxhbm94LmNvbT4gd3JvdGU6DQo+ID4gQWRkIHN1cHBvcnQgZm9yIFdBVENIRE9HX1JFU0VUIG1h
Y3JvIGZvciBhc3BlZWQgZzUgYm9hcmRzDQo+IA0KPiBBcyBJIHVuZGVyc3RhbmQgaXQsIHdpdGgg
dGhpcyBjaGFuZ2Ugd2UgY2FuIGhhdmUgdGhlIHdhdGNoZG9nIGVuYWJsZWQgZnJvbQ0KPiBib290
IGJ1dCBhbHNvIGhhdmUgdS1ib290IHBhdCB0aGUgd2F0Y2hkb2cgd2hlbiBkcm9wcGluZyB0byB0
aGUgY29uc29sZT8NCj4gDQoNClllcywgaXRzIGFsbG93IHRvIHN0b3AgaW4gdS1ib290IGNsaSBh
bmQgZG8gbm90IHJlYm9vdCBpZiBXRFQyIGVuYWJsZWQuDQpXZSBhbHNvIG5lZWQgdG8gYWRkIENP
TkZJR19IV19XQVRDSERPRyBkZWZpbmUgdG8gbWFrZSBpdCB3b3JrLg0KDQo+IFRoaXMgaXMgZ3Jl
YXQhDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTXlrb2xhIEtvc3Rlbm9rIDxjX215a29s
YWtAbWVsbGFub3guY29tPg0KPiANCj4gTWVyZ2VkIHRvIHYyMDE2LjA3LWFzcGVlZC1vcGVuYm1j
Lg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gSm9lbA0KPiANCj4gPiAtLS0NCj4gPiAgYm9hcmQvYXNw
ZWVkL2FzdC1nNS9hc3QtZzUuYyB8IDE0ICsrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYm9hcmQvYXNwZWVk
L2FzdC1nNS9hc3QtZzUuYw0KPiA+IGIvYm9hcmQvYXNwZWVkL2FzdC1nNS9hc3QtZzUuYyBpbmRl
eCBkYTc5ZDdiNzlhLi40MTJiNjMyYTQxIDEwMDY0NA0KPiA+IC0tLSBhL2JvYXJkL2FzcGVlZC9h
c3QtZzUvYXN0LWc1LmMNCj4gPiArKysgYi9ib2FyZC9hc3BlZWQvYXN0LWc1L2FzdC1nNS5jDQo+
ID4gQEAgLTQ2LDMgKzQ2LDE3IEBAIGludCBib2FyZF9ldGhfaW5pdChiZF90ICpiZCkNCj4gPiAg
ICAgICAgICByZXR1cm4gYXNwZWVkbmljX2luaXRpYWxpemUoYmQpOyAgfSAgI2VuZGlmDQo+ID4g
Kw0KPiA+ICsvKkNhbGxlZCBieSBtYWNybyBXQVRDSERPR19SRVNFVCovDQo+ID4gKyNpZiBkZWZp
bmVkKENPTkZJR19IV19XQVRDSERPRykNCj4gPiArDQo+ID4gKyNkZWZpbmUgQVNUX1dEVDJfUkVT
VEFSVF9SRUcgMHgyOCAvKldEVDIgQ291bnRlciBSZXN0YXJ0DQo+IFJlZ2lzdGVyKi8NCj4gPiAr
I2RlZmluZSBBU1RfV0RUMl9SRVNUQVJUX1NFVCAweDQ3NTUgLypXRFQyIFJlc3RhcnQgQ291bnRl
cg0KPiA+ICtwcm9ncmFtbWluZyB2YWx1ZSovDQo+ID4gKw0KPiA+ICt2b2lkIGh3X3dhdGNoZG9n
X3Jlc2V0KHZvaWQpDQo+ID4gK3sNCj4gPiArICAgICAgIC8qcmVzdGFydCBXRDIgdGltZXIqLw0K
PiA+ICsgICAgICAgd3JpdGVsKEFTVF9XRFQyX1JFU1RBUlRfU0VULCBBU1RfQkFTRV9XRCB8DQo+
ID4gK0FTVF9XRFQyX1JFU1RBUlRfUkVHKTsgfQ0KPiA+ICsNCj4gPiArI2VuZGlmIC8qIENPTkZJ
R19XQVRDSERPRyAqLw0KPiA+IC0tDQo+ID4gMi4xMS4wDQo+ID4NCg==
