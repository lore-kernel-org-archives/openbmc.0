Return-Path: <oleksandrs@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=104.47.0.78; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=oleksandrs@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="r61rLj2p";
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0078.outbound.protection.outlook.com [104.47.0.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynZ0c5gZnzDrp4
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 21:49:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=i46Mux8sN5mhiKMWG0DecEo0JrOuacsM4AO33UTMBes=;
 b=r61rLj2pqBp6bnMIf4YSkK2GK28l2jwZIpj3CvkdhSqXLyIPN1nVswE6TPIU/yfq+T7zDN3TiPijlenP6+qSFFNfDX4awy3LiRpiQB7YyCHOuo9lfMCy2PWVLXSl+4dRu2L1WxGrfpLmhVaCnPAzc7ptcr4LDA2QGYg57Z84KO4=
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com (10.165.82.13) by
 AM4PR05MB3331.eurprd05.prod.outlook.com (10.171.187.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.282.5; Thu, 30 Nov 2017 10:49:27 +0000
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::a17d:e2e6:2095:d246]) by AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::a17d:e2e6:2095:d246%17]) with mapi id 15.20.0282.006; Thu, 30 Nov
 2017 10:49:27 +0000
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: Philippe Ombredanne <pombredanne@nexb.com>, Kun Yi <kunyi@google.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "arnd@arndb.de"
 <arnd@arndb.de>, system-sw-low-level <system-sw-low-level@mellanox.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jiri@resnulli.us"
 <jiri@resnulli.us>, Vadim Pasternak <vadimp@mellanox.com>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, LKML <linux-kernel@vger.kernel.org>,
 "openocd-devel-owner@lists.sourceforge.net"
 <openocd-devel-owner@lists.sourceforge.net>, "mec@shout.net" <mec@shout.net>, 
 Jiri Pirko <jiri@mellanox.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "tklauser@distanz.ch" <tklauser@distanz.ch>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [patch v12 2/4] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
Thread-Topic: [patch v12 2/4] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
Thread-Index: AQHTXWmOxItJNl+A6E2rCoN3qQNgbaMsDkYAgACfWICAABxuIA==
Date: Thu, 30 Nov 2017 10:49:27 +0000
Message-ID: <AM4PR0501MB2194FDF093DD241694BE77BFB1380@AM4PR0501MB2194.eurprd05.prod.outlook.com>
References: <1510675867-24276-1-git-send-email-oleksandrs@mellanox.com>
 <1510675867-24276-3-git-send-email-oleksandrs@mellanox.com>
 <CAGMNF6XRwU5QEJhkg-mVwE5zpPigtcGJtRUupZHtcWRdedcsxg@mail.gmail.com>
 <CAOFm3uHg8n4A8opaOC3=pNtM1yJU6iy5Ta8XtGOvqT-Euv=X1w@mail.gmail.com>
In-Reply-To: <CAOFm3uHg8n4A8opaOC3=pNtM1yJU6iy5Ta8XtGOvqT-Euv=X1w@mail.gmail.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandrs@mellanox.com; 
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM4PR05MB3331;
 6:dEEe0Mst1uk5ohbb+S3D8BwX4NZdx81QC5s+XrdLPKZ5ajp17L25sHezXOwyfxWkqz4m4KESU6/s5aiXblBsWyxAU2bGxdAujddgCYK5MonSmR4HMZCBEy7/PrBuo+77i7TqfB+3JXGidHjEU7fu5r5LcPyoMKEfdZPCfsWXXf57iS68/JTZiAIG6qHk5qwGxE2Ttwx6I+utHphCTbXVU6QEuoPwNF7L5PqF5WmsEfxzLoZvsuwGWXP0m2WzkRc3z+kgiHfL1fyLRpbD4kfs7IwQemFVxTAx5OwYlpJoXYIG0RAAUZ0bEvkkCadOqvOtaXx87LVDuv1m0T/jGIkNIyamwA0budOsLaIOYsiysvw=;
 5:b09JzkdrVtyzzhm0I9MCb7CqH+RjD/RD2hEPKj3Q+T/lJ54CWgLpdV6xV5G1xDQ8BO/JNcilCiBn7wnBWiousVpz0noqubsTZnxGUrF7HHnFfhTpetn6poy7dfts8o80jX1++VDE96EOTiCxGZHzUXeBf3MPm/Zxo70d9+nl82o=;
 24:wLUFUKcAIEx7c1LAncJbTb+VQLvdN/UcoNpteLz0sveAiJVYA9CfH24cBk7GhfuNiJ/YgG9Lq2z/4iIm1lxxOoSRyQ7G4p6JgMYCkpohHkg=;
 7:UYtr/s2AreNumvllXoPsDyOLYgSQyL/NRmxCxZLyeejxfwKDyN/DDT/i7yyNKw5DNc4YxYr7bMAFQYHNLXgWStU1qnVguL6i5FjY+QqT/1/kwaGxhzlqcPcFHfIS+xjqt5zktkzpq9uHgygsXdXPAmyM+3iOz7U7djSlcrTLDMiNEAtRFHuKxsVW+OxJybZXr104V7/QMCyooYzsKu3+5y+fjLx3uxVb2gY4ChlG6VhtteixJOOCGVb/WCNUVFxT
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2294e08f-29b1-46a2-d66d-08d537e006f8
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(48565401081)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603284);
 SRVR:AM4PR05MB3331; 
x-ms-traffictypediagnostic: AM4PR05MB3331:
x-microsoft-antispam-prvs: <AM4PR05MB3331E308FC99D525E615B877B1380@AM4PR05MB3331.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(143289334528602)(9452136761055)(65623756079841)(258649278758335)(211936372134217)(42262312472803)(153496737603132);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040450)(2401047)(5005006)(8121501046)(3002001)(3231022)(920507027)(93006095)(93001095)(10201501046)(6055026)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123558100)(20161123562025)(20161123555025)(6072148)(201708071742011);
 SRVR:AM4PR05MB3331; BCL:0; PCL:0; RULEID:(100000803101)(100110400095);
 SRVR:AM4PR05MB3331; 
x-forefront-prvs: 05079D8470
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39860400002)(376002)(346002)(366004)(13464003)(199003)(189002)(24454002)(74316002)(50986010)(101416001)(54356010)(102836003)(6116002)(2900100001)(3846002)(76176010)(33656002)(7696005)(7736002)(97736004)(305945005)(478600001)(34040400001)(2906002)(7416002)(8676002)(3280700002)(14454004)(99286004)(3660700001)(5660300001)(189998001)(55016002)(4326008)(5250100002)(53546010)(316002)(53936002)(66066001)(9686003)(81166006)(81156014)(6436002)(229853002)(6506006)(6246003)(8936002)(86362001)(110136005)(54906003)(105586002)(106356001)(93886005)(25786009)(2950100002)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR05MB3331;
 H:AM4PR0501MB2194.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2294e08f-29b1-46a2-d66d-08d537e006f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2017 10:49:27.0872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR05MB3331
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Nov 2017 10:49:38 -0000

VGhuYWtzIGZvciBwb2ludCANCg0KQmVzdCBSZWdhcmRzLA0KT2xla3NhbmRyIFNoYW1yYXkNCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGlsaXBwZSBPbWJyZWRhbm5l
IFttYWlsdG86cG9tYnJlZGFubmVAbmV4Yi5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJl
ciAzMCwgMjAxNyAxMDoyMSBBTQ0KPiBUbzogS3VuIFlpIDxrdW55aUBnb29nbGUuY29tPg0KPiBD
YzogT2xla3NhbmRyIFNoYW1yYXkgPG9sZWtzYW5kcnNAbWVsbGFub3guY29tPjsgR3JlZyBLcm9h
aC1IYXJ0bWFuDQo+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IGFybmRAYXJuZGIuZGU7
IHN5c3RlbS1zdy1sb3ctbGV2ZWwgPHN5c3RlbS0NCj4gc3ctbG93LWxldmVsQG1lbGxhbm94LmNv
bT47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBqaXJpQHJlc251bGxpLnVzOw0KPiBWYWRp
bSBQYXN0ZXJuYWsgPHZhZGltcEBtZWxsYW5veC5jb20+OyBsaW51eC1hcGlAdmdlci5rZXJuZWwu
b3JnOw0KPiBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+OyBMS01M
IDxsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZz47IG9wZW5vY2QtZGV2ZWwtb3duZXJA
bGlzdHMuc291cmNlZm9yZ2UubmV0Ow0KPiBtZWNAc2hvdXQubmV0OyBKaXJpIFBpcmtvIDxqaXJp
QG1lbGxhbm94LmNvbT47IHJvYmgrZHRAa2VybmVsLm9yZzsgbGludXgtDQo+IHNlcmlhbEB2Z2Vy
Lmtlcm5lbC5vcmc7IHRrbGF1c2VyQGRpc3RhbnouY2g7IE1hdXJvIENhcnZhbGhvIENoZWhhYg0K
PiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQu
bmV0PjsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0
OiBSZTogW3BhdGNoIHYxMiAyLzRdIGRyaXZlcnM6IGp0YWc6IEFkZCBBc3BlZWQgU29DIDI0eHgg
YW5kIDI1eHgNCj4gZmFtaWxpZXMgSlRBRyBtYXN0ZXIgZHJpdmVyDQo+IA0KPiBPbiBXZWQsIE5v
diAyOSwgMjAxNyBhdCAxMTo1MSBQTSwgS3VuIFlpIDxrdW55aUBnb29nbGUuY29tPiB3cm90ZToN
Cj4gPiBPbiBUdWUsIE5vdiAxNCwgMjAxNyBhdCA4OjExIEFNLCBPbGVrc2FuZHIgU2hhbXJheQ0K
PiA+IDxvbGVrc2FuZHJzQG1lbGxhbm94LmNvbT4gd3JvdGU6DQo+IFtdDQo+ID4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2p0YWcvanRhZy1hc3BlZWQuYyBiL2RyaXZlcnMvanRhZy9qdGFnLWFzcGVl
ZC5jDQo+ID4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAuLmE2ZTI0MTcNCj4g
Pj4gLS0tIC9kZXYvbnVsbA0KPiA+PiArKysgYi9kcml2ZXJzL2p0YWcvanRhZy1hc3BlZWQuYw0K
PiA+PiBAQCAtMCwwICsxLDc4MiBAQA0KPiA+PiArLyoNCj4gPj4gKyAqIGRyaXZlcnMvanRhZy9h
c3BlZWQtanRhZy5jDQo+ID4+ICsgKg0KPiA+PiArICogQ29weXJpZ2h0IChjKSAyMDE3IE1lbGxh
bm94IFRlY2hub2xvZ2llcy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4NCj4gPj4gKyAqIENvcHlyaWdo
dCAoYykgMjAxNyBPbGVrc2FuZHIgU2hhbXJheSA8b2xla3NhbmRyc0BtZWxsYW5veC5jb20+DQo+
ID4+ICsgKg0KPiA+PiArICogUmVsZWFzZWQgdW5kZXIgdGhlIEdQTHYyIG9ubHkuDQo+ID4+ICsg
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+PiArICovDQo+IA0KPiBJIHRo
aW5rIHRoZSBTUERYIGlkIHNob3VsZCBiZSBvbiB0aGUgZmlyc3QgbGluZSBhcyByZXF1ZXN0ZWQg
YnkgTGludXMgYW5kDQo+IGRvY3VtZW50ZWQgYnkgVGhvbWFzICh0Z2x4KSBhbmQgR3JlZyAoZ3Jl
Zy1raCkuIEFuZCBpdCBzaG91bGQgdXNlIC8vDQo+IGNvbW1lbnRzLCBlLmc6DQo+IA0KPiAvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiANCj4gU2VlIHRoZSB0aHJlYWRzIGRp
c2N1c3NpbmcgYWxsIHRoZXNlLg0KPiANCj4gDQo+IC0tDQo+IENvcmRpYWxseQ0KPiBQaGlsaXBw
ZSBPbWJyZWRhbm5lDQo=
