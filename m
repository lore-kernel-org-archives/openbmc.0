Return-Path: <c_mykolak@mellanox.com>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0040.outbound.protection.outlook.com [104.47.0.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xS2bp0FgdzDqvG
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 17:15:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="adjxnuPj";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=uBeuyZimCs2wZJYB97FYVjE/U31jCeR+V8Aos7eTjkQ=;
 b=adjxnuPjaJcXuqq1n4ZynW6kxOeNO1b88KM5oHDW9Hds2xLYMIKBSkMyveuR4l6A+B4VwHHJUQ90pF/Ofr0IxblSi4NXErBtR2Bl3on7F1CvipjTxoCK4h2ybxX0BNrfFWOPialxzf2silfpYH4gfXYPGy99jEr5VrXaz5NmNkA=
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com (10.161.245.11) by
 DB5PR05MB1256.eurprd05.prod.outlook.com (10.162.157.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.1320.16; Wed, 9 Aug 2017 07:15:26 +0000
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::e96a:76a1:8f05:384e]) by DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::e96a:76a1:8f05:384e%18]) with mapi id 15.01.1320.012; Wed, 9 Aug 2017
 07:15:26 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Patrick Venture
 <venture@google.com>, Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz
 <ohado@mellanox.com>
Subject: RE: [patch v3 resend] Documentation: dt-bindings: aspeed-pwm-tacho
 cooling device.
Thread-Topic: [patch v3 resend] Documentation: dt-bindings: aspeed-pwm-tacho
 cooling device.
Thread-Index: AQHTEMU5bCAQV2tSuUSzvpT42FRVvKJ7lVpA
Date: Wed, 9 Aug 2017 07:15:26 +0000
Message-ID: <DB5PR05MB122451EAD6E4A470ED2FCFBEEF8B0@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <20170803084650.22298-1-c_mykolak@mellanox.com>
 <3c427ddd-aab6-13d4-bfb2-ae22848c0d13@roeck-us.net>
In-Reply-To: <3c427ddd-aab6-13d4-bfb2-ae22848c0d13@roeck-us.net>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=c_mykolak@mellanox.com; 
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR05MB1256;
 6:YaSUvdWRp8bOPJYGDyeH5sNNyy7uOQZL8/U9PSRg/TW5rMCzkfItun/+ldtRvatTtMiWkL+CoY1o3D6GJP3aqZvsid1iqKEgGdTRDg6/WfilMM3jXOgU2pihITflTG5k89rUNgPbbviw7BJI/Fazt6nJZcw3ILJ/O77SYS7XwYX6duEoTvnwxT2SVAdo6+lrhObNUl8kXmxMgUDydbzHSVswGNtGhUz7qJdnMCQX50A5ZngP9YHyiuLnU+C/FWSDxERhIO0l1EsX3rLPvRtqzwFsm5LqRaZlyxH06sGmY+3Sq1zNaAAuO9UigiCCnjA201suPeCImmARfOW4CKcIxw==;
 5:NV9QSWVTpA0EK0Ca4NdzrWK8gpvNxPCDlJnqtvL4U7Bq8EAhksIuZ9QmSUo0quFw/Z9aUagz0kWH+KL6cvLgCiltDN49BmjgpO3+z7YWbDI5Mz9GLQ9qryB+7n0Kf2jGwREC5CTtkUhmF/f3r1aX8g==;
 24:eON/7dr9qu3uX6pmiJu4+bgXFjsBk+iy+abmcqwMQ1MgPmZ3WM3z+W9IkYWjsR0gcL89qEFF2taBlz7bSw1gnS/kh2fNJ/QOObTalwM9ejE=;
 7:57hZLdNAZutOqvS1sbcD/tG/wziCOtfzR2FK+Cnfd95Ve4d9/iG66xMf73IY4qN4gS/bxbInnVDX5+BLDrXzA0i6ZT8A8MSI3qLKL3it8PH57Gjg+uUL9zDb/tpvxoRb2QM2/j16yJFKx53WT+5lDQGongNuYeRtCMvVKK5FwvTI3DbBzT6I/aKs0yDOAgOHhBHJdgpuhdYtWp0CvehRj/5/5L7T9zDL1Jhu7x9z3Z4=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 81c1f9be-8b53-443a-0e36-08d4def6687d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:DB5PR05MB1256; 
x-ms-traffictypediagnostic: DB5PR05MB1256:
x-exchange-antispam-report-test: UriScan:(9452136761055)(65623756079841)(211936372134217)(153496737603132); 
x-microsoft-antispam-prvs: <DB5PR05MB1256E2EE4262013CD8CAA6CBEF8B0@DB5PR05MB1256.eurprd05.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(3002001)(93006095)(93001095)(10201501046)(920507026)(6055026)(6041248)(20161123555025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123558100)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:DB5PR05MB1256; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:DB5PR05MB1256; 
x-forefront-prvs: 0394259C80
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39450400003)(39840400002)(39860400002)(39410400002)(39850400002)(39400400002)(189002)(24454002)(377454003)(13464003)(199003)(6436002)(106356001)(3280700002)(50986999)(54356999)(76176999)(2900100001)(9686003)(99286003)(55016002)(54906002)(33656002)(74316002)(34040400001)(6116002)(97736004)(3660700001)(66066001)(8936002)(101416001)(68736007)(102836003)(229853002)(478600001)(86362001)(6506006)(7696004)(3846002)(81156014)(189998001)(2501003)(8676002)(2950100002)(2906002)(81166006)(305945005)(107886003)(38730400002)(6246003)(25786009)(53546010)(105586002)(14454004)(4326008)(230783001)(53936002)(7736002)(5250100002)(5660300001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR05MB1256;
 H:DB5PR05MB1224.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2017 07:15:26.1492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR05MB1256
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
X-List-Received-Date: Wed, 09 Aug 2017 07:15:35 -0000

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJvZWNrIFttYWls
dG86bGludXhAcm9lY2stdXMubmV0XQ0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCA5LCAyMDE3
IDc6MDkgQU0NCj4gVG86IE15a29sYSBLb3N0ZW5vayA8Y19teWtvbGFrQG1lbGxhbm94LmNvbT47
IFJvYiBIZXJyaW5nDQo+IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZw0KPiBDYzogSmFnaGF0aGlzd2FyaSBSYW5rYXBwYWdvdW5kZXIgTmF0YXJhamFuIDxq
YWdodUBnb29nbGUuY29tPjsNCj4gb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBQYXRyaWNrIFZl
bnR1cmUgPHZlbnR1cmVAZ29vZ2xlLmNvbT47IFZhZGltDQo+IFBhc3Rlcm5hayA8dmFkaW1wQG1l
bGxhbm94LmNvbT47IE9oYWQgT3ogPG9oYWRvQG1lbGxhbm94LmNvbT4NCj4gU3ViamVjdDogUmU6
IFtwYXRjaCB2MyByZXNlbmRdIERvY3VtZW50YXRpb246IGR0LWJpbmRpbmdzOiBhc3BlZWQtcHdt
LQ0KPiB0YWNobyBjb29saW5nIGRldmljZS4NCj4gDQo+IE9uIDA4LzAzLzIwMTcgMDE6NDYgQU0s
IE15a29sYSBLb3N0ZW5vayB3cm90ZToNCj4gPiBJdCdzIGFkZCBzdXBwb3J0IGZvciBjb29saW5n
IGRldmljZSBjcmVhdGlvbiB0byBhc3BlZWQtcHdtLXRhY2hvLg0KPiA+IENvb2xpbmcgZGV2aWNl
IGNvdWxkIGJlIGJvdW5kIHRvIGEgdGhlcm1hbCB6b25lIGZvciB0aGUgdGhlcm1hbA0KPiA+IGNv
bnRyb2wuDQo+ID4NCj4gPiB2MSAtPiB2MjoNCj4gPiAgIC0gRml4IGNvbW1pdCBtZXNzYWdlLg0K
PiA+IHYyIC0+IHYzOg0KPiA+ICAgUG9pbnRlZCBvdXQgYnkgUm9iIEhlcnJpbmc6DQo+ID4gICAt
IFB1dCBjb29saW5nLWxldmVscyB1bmRlciBmYW4gc3Vibm9kZXMuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBNeWtvbGEgS29zdGVub2sgPGNfbXlrb2xha0BtZWxsYW5veC5jb20+DQo+IA0KPiBE
aWQgUm9iIGV2ZXIgQWNrIHRoaXMgcGF0Y2ggPw0KPiANCj4gTm90ZSB5b3UgZGlkbid0IGNvcHkg
dGhlIGh3bW9uIG1haWxpbmcgbGlzdCwgd2hpY2ggZG9lc24ndCBleGFjdGx5IGhlbHAgdG8NCj4g
a2VlcCB0cmFjayBvZiBpdCwgYW5kIEkgbWF5IGhhdmUgbG9zdCBSb2IncyBBY2suIE15IGFwb2xv
Z2llcyBpZiB0aGF0IGlzIHRoZQ0KPiBjYXNlLg0KPiANCj4gR3VlbnRlcg0KDQpIaSwgR3VlbnRl
ci4gDQoNCk5vLCBSb2IgSGVycmluZyBkaWQgbm90IGFjayBwYXRjaCB5ZXQuIEp1c3QgY29tbWVu
dC4NCg0KWWVzLCBzaW5jZSBJIHNwbGl0IGluaXRpYWwgcGF0Y2ggdG8gMiBwYXRjaGVzLCBJIGhh
dmUgc2VudCBvbmUgdG8geW91IGFuZCBod21vbiBtYWlsIGxpc3QsDQphbmQgYW5vdGhlciB0byBS
b2IgYW5kIGRldmljZXRyZWUgbWFpbCBsaXN0LiBBbmQgYWRkZWQgeW91IGJvdGggdG8gY2MuDQpB
bSBJIG5lZWQgdG8gYWRkIGJvdGggbWFpbCBsaXN0cyB0byBib3RoIHBhdGNoZXMgaW4gc3VjaCBj
YXNlcz8NCg0KQmVzdCByZWdhcmRzLCBNeWtvbGEgS29zdGVub2suDQo=
