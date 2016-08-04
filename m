Return-Path: <shays@mellanox.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0045.outbound.protection.outlook.com [104.47.2.45])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s4rlB41xczDqQs
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 23:44:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b=mGjFec6I; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=h3kgV/Kocpn993Mt6xJwgKfgt/I3h4r+a1uGH9M/zhc=;
 b=mGjFec6I4SUi/xgb6nFM+TpWsYxeEndv9jfaZFgE0RkWUkx57UsuQCKlU5t1rhbkmhnDyDiD6UCitJ7dH49bHQPIyVrh1Eegas6/wp2qq4d5Iz0DkE1vB0VLE9VJ927qWrxOM+Dlp/2aKZRCAm3LcO+b16KT10IQIdbcHcYo1y0=
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com (10.161.249.145) by
 DB4PR05MB0942.eurprd05.prod.outlook.com (10.161.249.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.544.10; Thu, 4 Aug 2016 12:11:52 +0000
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) by
 DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) with mapi id
 15.01.0544.023; Thu, 4 Aug 2016 12:11:51 +0000
From: Shay Slobodkin <shays@mellanox.com>
To: Joel Stanley <joel@jms.id.au>
CC: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Aspeed 2500 EVB i2c transaction time out
Thread-Topic: Aspeed 2500 EVB i2c transaction time out
Thread-Index: AdHjPh18jT8yNP68Tle3f/Ll01NEgAAL8yuAAIyfMnAAG9q6gABwxbfgAO2nJoAAF+j1oAABZG4AAJaewWA=
Date: Thu, 4 Aug 2016 12:11:51 +0000
Message-ID: <DB4PR05MB0941678D6CD51C9DCC5B27E4D5070@DB4PR05MB0941.eurprd05.prod.outlook.com>
References: <DB4PR05MB0941FC06CBEC427C99A40C80D5090@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <CACPK8Xf-jSXs=EcF3tQrC7xeFkKXOhXxPxz=6pBQ9408-uhcHA@mail.gmail.com>
 <DB4PR05MB0941D946BC03E134592BCA21D50C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <1469408379.5468.33.camel@aj.id.au>
 <DB4PR05MB0941D264C3F26B9F9378E78ED50F0@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <1470010405.4428.3.camel@aj.id.au>
 <DB4PR05MB0941DF5F4C384D1DE5429892D5040@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <CACPK8Xc=KJ-KmBvu2c_WxggvLpw7G-j-it1Ld2WR=WnjH4muLg@mail.gmail.com>
In-Reply-To: <CACPK8Xc=KJ-KmBvu2c_WxggvLpw7G-j-it1Ld2WR=WnjH4muLg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shays@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-office365-filtering-correlation-id: 9152a10a-0e09-4e9d-3451-08d3bc6084b2
x-microsoft-exchange-diagnostics: 1; DB4PR05MB0942;
 6:1aOkAqUyi+G8M+ZMvj7J4Jl1JJq3alDVknZ69FrpbxIWYVVzOpfP7s431Ow17hvFDJ7c4eIpBp/XpqQWa0ssmOfs0IGTT0pJLQGWKKPEjX/RSxH6bwpWMjF/UA41gvcON1PTIybn+FnV1KdsmyDIbQR2Ic/iR98W0h6sZDdzIzEChpMOHE9fQRbL3mJwtGlEvttO3VL1j0leg+UO1uK9MobZp1ES248xVDxVuzKvx3jw8USvNCr3q3xs3qMM+e4X/l8B9Pf1pDm7kM7Sk4uMq5MsndWYj++2+jrmXnjdUogQcX9SauPMTJX5X4Ir4EWhzBYXIDNwsn77ZszEVj3EMg==;
 5:aCYp6ngvLaWnn44MFsfIzbKb3Cod8/2HzUHd6JPVHF9tmpp//lXyEAXA/rQFbBLa37vKL399wdwm+OSzouXmBDP+SR0M0N29sfLpE08+fQMNflXwBPMfeS46lSv0b6S41v6axV21d4umbMa8eQDHKQ==;
 24:gQ8sOPYxUF7iz68nYrNLV8X/Iqj6AN/T+fm1jNtxpsXkM2byJSEpFjQxMDNNn/I5pN/sKLaB0apNpVVLqf6YFE+SWOByfDaMJXTq69ikorU=;
 7:3YIH0DeccVNirNAWacQahCpUxJVZisoC8gzi5qAKSQgSWbe/P0X0qJNhd25KktGhLJvh9O9f9z7r2NWnbZnUPrYb+GED9EDFE4Yv8jXS3GiipEHHa1Pj2YxGivT/yF77sgwneNPbnooe5p8A9a1PnrmB5/uL10c0jrJx+kMg7/CV7iEgLcUPWO8F1+wzxegvMNZu+78dTYhbOTfhimAzI75OeLVIBBuyUbzPC1n2HN5uUyvIrzYnQay+xJzKfuiD
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR05MB0942;
x-microsoft-antispam-prvs: <DB4PR05MB0942655A3DB5E517D63D9BD1D5070@DB4PR05MB0942.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(65623756079841);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
 SRVR:DB4PR05MB0942; BCL:0; PCL:0; RULEID:; SRVR:DB4PR05MB0942; 
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(377454003)(13464003)(24454002)(199003)(189002)(10400500002)(68736007)(8936002)(50986999)(5002640100001)(101416001)(76176999)(76576001)(93886004)(305945005)(19580395003)(86362001)(87936001)(8676002)(77096005)(54356999)(33656002)(551934003)(92566002)(3660700001)(189998001)(9686002)(110136002)(4326007)(81156014)(3846002)(19580405001)(3280700002)(74316002)(66066001)(6116002)(102836003)(122556002)(105586002)(586003)(7696003)(7846002)(2900100001)(2950100001)(106356001)(81166006)(2906002)(97736004)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR05MB0942;
 H:DB4PR05MB0941.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2016 12:11:51.5556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR05MB0942
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
X-List-Received-Date: Thu, 04 Aug 2016 13:44:24 -0000

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogam9lbC5zdGFuQGdtYWls
LmNvbSBbbWFpbHRvOmpvZWwuc3RhbkBnbWFpbC5jb21dIE9uIEJlaGFsZiBPZiBKb2VsDQo+IFN0
YW5sZXkNCj4gU2VudDogTW9uZGF5LCBBdWd1c3QgMDEsIDIwMTYgMzoxOCBQTQ0KPiBUbzogU2hh
eSBTbG9ib2RraW4gPHNoYXlzQG1lbGxhbm94LmNvbT4NCj4gQ2M6IEFuZHJldyBKZWZmZXJ5IDxh
bmRyZXdAYWouaWQuYXU+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gU3ViamVjdDogUmU6
IEFzcGVlZCAyNTAwIEVWQiBpMmMgdHJhbnNhY3Rpb24gdGltZSBvdXQNCj4gDQo+IE9uIE1vbiwg
QXVnIDEsIDIwMTYgYXQgOTowOSBQTSwgU2hheSBTbG9ib2RraW4gPHNoYXlzQG1lbGxhbm94LmNv
bT4NCj4gd3JvdGU6DQo+ID4+IFNvcnJ5IGZvciB0aGUgZGlzdHJhY3Rpb24gaGVyZSwgaXQgd2Fz
IGEgYml0IG9mIGEgbG9uZyBzaG90LiBCdWlsZGluZw0KPiA+PiB0aGF0IGJyYW5jaCB3aXRob3V0
IGZ1cnRoZXIgcGF0Y2hpbmcgcHJvYmFibHkgd291bGQgbm90IGhhdmUgbXV4ZWQNCj4gPj4gd2hh
dCB5b3UgbmVlZGVkLCBidXQgaXQgYWxzbyBzaG91bGQgbm90IGhhdmUgaGFkIHRoZSBidWdzIHlv
dSBwb2ludGVkDQo+ID4+IG91dC4gSSB0aGluayBKb2VsIHdhcyBpbnRlbmRpbmcgdG8gcHVzaCBv
dXQgYSBicmFuY2ggdG8gc3VwcG9ydCB0aGUNCj4gPj4gZXh0cmEgaTJjDQo+ID4+IGJ1cyhlcykg
eW91IG5lZWQuIEpvZWw/DQo+ID4NCj4gPiBUaGFuayB5b3UgQW5kcmV3Lg0KPiA+IEJ5IHRoZSB3
YXksIHdlIGRvIHNlZSBJMkMgdGltZSBvdXQgaXNzdWVzLCB3aGVuIHRyeWluZyB0cmFuc2FjdGlv
bnMgdG8NCj4gTE03NS4NCj4gPg0KPiA+IEpvZWwsIGlzIHRoZXJlIGFueSB1cGRhdGUgcmVnYXJk
aW5nIHRoZSBjb2RlPyBXaGVuIGlzIGl0IHN1cHBvc2VkIHRvIGJlDQo+IHB1Ymxpc2hlZD8NCj4g
PiBXZSBjYW4gYXNzaXN0IHdpdGggdGVzdGluZywgaWYgeW91IGhhdmUgc29tZSBoYWxmIGJhY2tl
ZCBjb2RlIHRvIHNoYXJlLg0KPiANCj4gSSd2ZSBiZWVuIHdvcmtpbmcgb24gaXQsIGJ1dCBvdGhl
ciByZXNwb25zaWJpbGl0aWVzIGhhdmUgYmVlbiBzbG93aW5nIGRvd24NCj4gcHJvZ3Jlc3MuIEkg
ZXhwZWN0IHRvIGdldCBpdCBvdXQgdGhpcyB3ZWVrLiBJIHdpbGwgZW1haWwgdGhlIGxpc3Qgd2hl
biBJIGRvLg0KPiANCj4gSXQgd291bGQgYmUgZ3JlYXQgdG8gc2VlIHlvdXIgcHJvZ3Jlc3MuIFB1
Ymxpc2ggZWFybHksIHB1Ymxpc2ggb2Z0ZW4gOikNCg0KVG90YWxseSBhZ3JlZSB3aXRoIHlvdS4g
V2UgcHJvZ3Jlc3Mgc2xvd2VyIHRoYW4gd2hhdCB3ZSB0aG91Z2h0Lg0KSG9wZWZ1bGx5IHdlIHBs
YW4gdG8gcHVibGlzaCBzb21ldGhpbmcgaW4gdGhlIHdlZWsgYWZ0ZXIgbmV4dCB3ZWVrLg0KDQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiBKb2VsDQo=
