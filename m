Return-Path: <shays@mellanox.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0070.outbound.protection.outlook.com [104.47.2.70])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s3D7p2YVQzDqTk
 for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2016 08:11:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b=FgyxuYA4; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=G8dvlO5lktXVlt+kdMstOSZi518vdeFeN4JR2Kle8P4=;
 b=FgyxuYA4N7pHKiPF1yaFQXgjQBCJbXair17SAxEuw1CwK5ubi8idnY7SSQn6ZEsD8Kmf2bkNWip+OT1RllhtL19IDqUL2EzDDYEciEfufvDerbZYjU50ZzY4Gb5z3LrqCMM14uIP6ljD6tB/NgNCr3ZJgSnWKmZXer58t1+AOMg=
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com (10.161.249.145) by
 DB4PR05MB0944.eurprd05.prod.outlook.com (10.161.249.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.544.10; Mon, 1 Aug 2016 11:39:59 +0000
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) by
 DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) with mapi id
 15.01.0544.023; Mon, 1 Aug 2016 11:39:59 +0000
From: Shay Slobodkin <shays@mellanox.com>
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Aspeed 2500 EVB i2c transaction time out
Thread-Topic: Aspeed 2500 EVB i2c transaction time out
Thread-Index: AdHjPh18jT8yNP68Tle3f/Ll01NEgAAL8yuAAIyfMnAAG9q6gABwxbfgAO2nJoAAF+j1oA==
Date: Mon, 1 Aug 2016 11:39:59 +0000
Message-ID: <DB4PR05MB0941DF5F4C384D1DE5429892D5040@DB4PR05MB0941.eurprd05.prod.outlook.com>
References: <DB4PR05MB0941FC06CBEC427C99A40C80D5090@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <CACPK8Xf-jSXs=EcF3tQrC7xeFkKXOhXxPxz=6pBQ9408-uhcHA@mail.gmail.com>
 <DB4PR05MB0941D946BC03E134592BCA21D50C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <1469408379.5468.33.camel@aj.id.au>
 <DB4PR05MB0941D264C3F26B9F9378E78ED50F0@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <1470010405.4428.3.camel@aj.id.au>
In-Reply-To: <1470010405.4428.3.camel@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shays@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-office365-filtering-correlation-id: 0088f0c7-4de6-4acc-7a42-08d3ba0091d4
x-microsoft-exchange-diagnostics: 1; DB4PR05MB0944;
 6:JyZb580uerdKwm3VWttTI2U4ojqKinFS2AnAxSJXlgmMfkAv96HkJYyViJ4NpILfZo+aontxFJp19ya0vmOGME4+YMl4UHO2R/nQQQwTD8H8KDIeBHTIpG+XH2iwCW8Epci3wDb9BfRfVwt61JFJKlcwAzfpnfWQX7UJJ0LVb3YMgeI+J5uMd668JJhjgA4xdVPyaLpii1kaMBG2008zucCrHMM+MNPCyVjZQU6wB2EDgQ74Y5vubX4yum6JZoHetB3rDXmcV/lN4nq9+Wl0aEA/4PFDjklyefRigkbjw2eotFeLQD63x1GAOXEJHVQBAhtYHL5/edrP/9Jchb/NIg==;
 5:EJynVAODEpziN4AR7yBLJnl92aOlrjjt9y3oXKjxLQh/mQPZhuvKYNlps4LF9l4c7CXUs46RE5goBOtIAKOeT0en0P2V8ZxRzyElZSNqXmx8I5ggBoWiMpodjxBbshwFmuL90JFUvJtYAKfIh5lIxg==;
 24:SHdGA/gBc0gq+zuwvIbD9pTTIyqVRdakItSuJ1CJjldHv4Z9d86NQHTBQfb41/MBc8d2/eFqCSKxbMnYy4Gc0rBtX64ZK2eucIvE4JdiIZk=;
 7:5l84Eu9pjTZG/1jPwKRNKPV1uj1BRRRg+gEQ3mDpRXoV31IKQMTHKu6TCyP54mHKPJeqWa0pzNkOfEbyxp9PUB5hj8iFygZR5ZN0f6GCh8N6uz8J9ve4DXAMHL5j+bXrScvACft195ETrmS9rs74fOz8Qi5H6Ekp0mPJJ2Mg3gTuSDe+7vxGd/k68nkpznkGzG6YR1lDG+2g7f73XNiOPUIOUBrCs1A0TPL3mCIvb3ogUG5i9FfLZYSHNdhPvRdp
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR05MB0944;
x-microsoft-antispam-prvs: <DB4PR05MB0944F39D92A4B82580F101B2D5040@DB4PR05MB0944.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(65623756079841);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6055026);
 SRVR:DB4PR05MB0944; BCL:0; PCL:0; RULEID:; SRVR:DB4PR05MB0944; 
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(377424004)(199003)(13464003)(24454002)(189002)(377454003)(105586002)(122556002)(97736004)(93886004)(5001770100001)(8676002)(305945005)(81166006)(7736002)(9686002)(8936002)(81156014)(3280700002)(106356001)(7846002)(3660700001)(7696003)(68736007)(74316002)(189998001)(92566002)(101416001)(33656002)(86362001)(551934003)(586003)(10400500002)(87936001)(2906002)(19580395003)(4326007)(19580405001)(76576001)(66066001)(77096005)(3846002)(50986999)(76176999)(15975445007)(54356999)(102836003)(6116002)(2900100001)(11100500001)(2950100001)(5002640100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR05MB0944;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2016 11:39:59.5697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR05MB0944
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
X-List-Received-Date: Mon, 01 Aug 2016 22:11:35 -0000

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBKZWZmZXJ5IFttYWlsdG86YW5kcmV3QGFqLmlkLmF1XQ0KPiBTZW50OiBNb25kYXksIEF1Z3Vz
dCAwMSwgMjAxNiAzOjEzIEFNDQo+IFRvOiBTaGF5IFNsb2JvZGtpbiA8c2hheXNAbWVsbGFub3gu
Y29tPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4NCj4gQ2M6IG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogQXNwZWVkIDI1MDAgRVZCIGkyYyB0cmFuc2FjdGlv
biB0aW1lIG91dA0KPiANCj4gSGkgU2hheSwNCj4gDQo+IE9uIFdlZCwgMjAxNi0wNy0yNyBhdCAw
Njo1MiArMDAwMCwgU2hheSBTbG9ib2RraW4gd3JvdGU6DQo+ID4gPiBQUzogaWYgeW91IGFyZSBp
bnRlcmVzdGVkIGluIHRlc3RpbmcgdGhlIG1vc3QgcmVjZW50IHBpbmN0cmwgcGF0Y2hlcw0KPiA+
ID4gdGhleSBhcmUgYXZhaWxhYmxlIGF0IFsxXS4gSG93ZXZlciwgdGhleSdyZSBiYXNlZCBvbiB1
cHN0cmVhbSBhbmQgc28NCj4gPiA+IHdpbGwgbmVlZCBhIGJpdCBvZiBtYXNzYWdpbmcgdG8gaW50
ZWdyYXRlIHRoZW0gd2l0aCB0aGUNCj4gPiA+IG9wZW5ibWMvbGludXgga2VybmVsLCBmb3IgaW5z
dGFuY2UgYWRkaW5nIHRoZSBJMkMgbXV4IHJlcXVlc3RzIHRvIHRoZQ0KPiBJMkMgZGV2aWNldHJl
ZSBub2Rlcy4NCj4gPiA+DQo+ID4gPiBbMV3CoGh0dHBzOi8vZ2l0aHViLmNvbS9hbWJvYXIvbGlu
dXgvY29tbWl0cy9hc3BlZWQtcGluY3RybC00LjctcmM3DQo+ID4NCj4gPiBUaGFuayB5b3UuIFdl
IHRyaWVkIHRvIHVzZSB0aGlzIHBpbmN0cmwsIHdpdGggbm8gbHVjay4NCj4gPiBDdXJyZW50bHkg
d2UgYXJlIHN0aWxsIHVzaW5nIGtlcm5lbCA0LjYgYW5kIHdlIHJlY2VpdmUgdHJhbnNhY3Rpb24g
dGltZSBvdXQNCj4gZm9yIExNNzUuDQo+ID4gV2UgYXJlIHBlbmRpbmcgSm9lbCdzIDQuNy4zIHdo
ZW4gaXQgaXMgZG9uZS4NCj4gDQo+IFNvcnJ5IGZvciB0aGUgZGlzdHJhY3Rpb24gaGVyZSwgaXQg
d2FzIGEgYml0IG9mIGEgbG9uZyBzaG90LiBCdWlsZGluZyB0aGF0IGJyYW5jaA0KPiB3aXRob3V0
IGZ1cnRoZXIgcGF0Y2hpbmcgcHJvYmFibHkgd291bGQgbm90IGhhdmUgbXV4ZWQgd2hhdCB5b3Ug
bmVlZGVkLA0KPiBidXQgaXQgYWxzbyBzaG91bGQgbm90IGhhdmUgaGFkIHRoZSBidWdzIHlvdSBw
b2ludGVkIG91dC4gSSB0aGluayBKb2VsIHdhcw0KPiBpbnRlbmRpbmcgdG8gcHVzaCBvdXQgYSBi
cmFuY2ggdG8gc3VwcG9ydCB0aGUgZXh0cmEgaTJjDQo+IGJ1cyhlcykgeW91IG5lZWQuIEpvZWw/
DQoNClRoYW5rIHlvdSBBbmRyZXcuDQpCeSB0aGUgd2F5LCB3ZSBkbyBzZWUgSTJDIHRpbWUgb3V0
IGlzc3Vlcywgd2hlbiB0cnlpbmcgdHJhbnNhY3Rpb25zIHRvIExNNzUuDQoNCkpvZWwsIGlzIHRo
ZXJlIGFueSB1cGRhdGUgcmVnYXJkaW5nIHRoZSBjb2RlPyBXaGVuIGlzIGl0IHN1cHBvc2VkIHRv
IGJlIHB1Ymxpc2hlZD8NCldlIGNhbiBhc3Npc3Qgd2l0aCB0ZXN0aW5nLCBpZiB5b3UgaGF2ZSBz
b21lIGhhbGYgYmFja2VkIGNvZGUgdG8gc2hhcmUuDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IEFu
ZHJldw0K
