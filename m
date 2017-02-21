Return-Path: <dthompson@mellanox.com>
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40056.outbound.protection.outlook.com [40.107.4.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSWJw2mBYzDqBv
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 06:48:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="Cwc/E1io";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=q3S2UIiLORa/wvBPPDui83IbvU6BSM7wIQvOOpkX7zQ=;
 b=Cwc/E1ioscYkS6424qzYuQ9pX0UukHKFWFSfb0w0N5RVYWHg99f7JMyFtE9Yv1SAHOsBM4/6HJdmjEPMoniShTiIf15gm4+phqWB+o3pSrEXEZiAbZpA9L3Ac5F7tTNEDGw6Hb6BFLMocCVReYVougx5QXOeAGWgswD2vWCwPkI=
Received: from VI1PR0502MB3021.eurprd05.prod.outlook.com (10.175.21.23) by
 VI1PR0502MB3023.eurprd05.prod.outlook.com (10.175.22.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.919.13; Tue, 21 Feb 2017 19:48:41 +0000
Received: from VI1PR0502MB3021.eurprd05.prod.outlook.com ([10.175.21.23]) by
 VI1PR0502MB3021.eurprd05.prod.outlook.com ([10.175.21.23]) with mapi id
 15.01.0919.018; Tue, 21 Feb 2017 19:48:41 +0000
From: David Thompson <dthompson@mellanox.com>
To: Simon Glass <sjg@chromium.org>, Joel Stanley <joel@jms.id.au>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: DSTREAM/DS-5 use on AST2500 EVB
Thread-Topic: DSTREAM/DS-5 use on AST2500 EVB
Thread-Index: AdKJWgUa+yXsGS5zQPaB+0rOhKg7dwAKJ8MAAKAPzwAAHgJusA==
Date: Tue, 21 Feb 2017 19:48:41 +0000
Message-ID: <VI1PR0502MB30213164046E17953F46F482DD510@VI1PR0502MB3021.eurprd05.prod.outlook.com>
References: <VI1PR0502MB30211D216F237DA5240F6FF9DD5D0@VI1PR0502MB3021.eurprd05.prod.outlook.com>
 <CACPK8XdnwsbcJ7nJ4QWXXGnmvhswBaHsnjajAKSURbiZN7ZnUw@mail.gmail.com>
 <CAPnjgZ2LCJXZreRd+FExFmUppOWSnNE1TqhCHYas5jfJvmTM1A@mail.gmail.com>
In-Reply-To: <CAPnjgZ2LCJXZreRd+FExFmUppOWSnNE1TqhCHYas5jfJvmTM1A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dthompson@mellanox.com; 
x-originating-ip: [12.216.194.146]
x-ms-office365-filtering-correlation-id: 41fc84dd-50e8-4b67-6fbf-08d45a92a350
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(48565401081);
 SRVR:VI1PR0502MB3023; 
x-microsoft-exchange-diagnostics: 1; VI1PR0502MB3023;
 7:CttVv8/+J7O5AYzBknU9FCm6IGOMLwYapQThRxlq31RE1pNFzTAv+nT7Y4Baw4SYhjK/tDhvRaMiF9WXjDgGQe1raj96vg9ADgm3hOqclPYXpRjie4DCrgQn7cvm+tWXzUeryIBomebbl6eG+naeYpgj3noAJTbZoJ3IXqtCnae9YRjbFHVWc9e0PWzeb/qRgKmkI6/0JzWNjK58X6O3KX/OoDEjXbuDXwiKV+2z53t03c0WRnD830w5nKT3iqJJXc4xk07fhORtidw3vI63w34uZHjVW0SEOB+znTEO6NLMUByfw+UCl4uNxi+EnP/DRw52WZGrH27CrydaVYaaIA==
x-microsoft-antispam-prvs: <VI1PR0502MB302330D6A34B9741B0CCD919DD510@VI1PR0502MB3023.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(166708455590820)(65623756079841)(211936372134217); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026)(6041248)(20161123555025)(20161123564025)(20161123562025)(20161123560025)(20161123558025)(6072148);
 SRVR:VI1PR0502MB3023; BCL:0; PCL:0; RULEID:; SRVR:VI1PR0502MB3023; 
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(39410400002)(39450400003)(39840400002)(39860400002)(39850400002)(199003)(13464003)(189002)(504964003)(78124002)(24454002)(377454003)(66066001)(77096006)(6506006)(38730400002)(55016002)(25786008)(3280700002)(102836003)(2900100001)(33656002)(7696004)(6246003)(86362001)(9686003)(2950100002)(53546006)(6436002)(122556002)(229853002)(6306002)(53936002)(106356001)(81166006)(305945005)(99286003)(8936002)(101416001)(3660700001)(74316002)(345774005)(68736007)(7736002)(189998001)(81156014)(105586002)(6116002)(5660300001)(3846002)(2906002)(50986999)(8676002)(97736004)(54356999)(4326007)(92566002)(76176999);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0502MB3023;
 H:VI1PR0502MB3021.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2017 19:48:41.5653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3023
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
X-List-Received-Date: Tue, 21 Feb 2017 19:48:50 -0000

VGhhbmsgeW91IGZvciBhbGwgdGhlIHJlcGxpZXMuDQoNClllcywgdGhlIERTVFJFQU0gaXMgYSBo
YXJkd2FyZSBkZWJ1Z2dlciAvIHByb2JlIGZyb20gQVJNLg0KVGhlIERTLTUgaXMgdGhlIEVjbGlw
c2UtYmFzZWQgc29mdHdhcmUgZnJvbnQgZW5kIC8gSURFIGZvciBzb2Z0d2FyZQ0KZGV2ZWxvcG1l
bnQgYW5kIGRlYnVnZ2luZywgYWxzbyBhbiBBUk0gcHJvZHVjdCwgYW5kIHJlcXVpcmVzDQphIGxp
Y2Vuc2UuDQoNClllcywgSSBzcG9rZSB3aXRoIEFzcGVlZCBhbmQgdGhleSBzYWlkIHRoYXQgdGhl
eSBkb24ndCBEU1RSRUFNIG9yDQpEUy01LCB0aGV5IHVzZSBCREkgaGFyZHdhcmUgZGVidWdnZXJz
Lg0KDQpJIHdpbGwgcmV2aWV3IFFFTVUgYW5kIHNlZSBpZiB0aGF0IGNhbiBhZGQgdmFsdWUgdG8g
d2hhdCBJJ20gdHJ5aW5nDQp0byBhY2NvbXBsaXNoIHdpdGggc29mdHdhcmUgZGV2ZWxvcG1lbnQg
YW5kIHRlc3RpbmcuDQoNClRoYW5rcywgRGF2ZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogc2pnQGdvb2dsZS5jb20gW21haWx0bzpzamdAZ29vZ2xlLmNvbV0gT24gQmVoYWxm
IE9mIFNpbW9uIEdsYXNzDQpTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyMSwgMjAxNyAxMjoyNSBB
TQ0KVG86IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQpDYzogRGF2aWQgVGhvbXBzb24g
PGR0aG9tcHNvbkBtZWxsYW5veC5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1Ympl
Y3Q6IFJlOiBEU1RSRUFNL0RTLTUgdXNlIG9uIEFTVDI1MDAgRVZCDQoNCkhpIERhdmlkLA0KDQpP
biAxNyBGZWJydWFyeSAyMDE3IGF0IDE4OjAyLCBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1
PiB3cm90ZToNCj4gSGVsbG8gRGF2aWQsDQo+DQo+IE9uIFNhdCwgRmViIDE4LCAyMDE3IGF0IDY6
NDUgQU0sIERhdmlkIFRob21wc29uIDxkdGhvbXBzb25AbWVsbGFub3guY29tPiB3cm90ZToNCj4+
IERvZXMgYW55b25lIHV0aWxpemUgdG9vbHMgbGlrZSBEU1RSRUFNICYgRFMtNSBmb3IgZGV2ZWxv
cG1lbnQgYW5kIA0KPj4gZGVidWcgb2YgT3BlbkJNQyBzb2Z0d2FyZSBvbg0KPj4gdGhlIEFTVDI1
MDAgRVZCPyAgIEnigJltIGFjdGl2ZWx5IGxvb2tpbmcgdG8gY3JlYXRlLA0KPj4gb3IgYWNxdWly
ZSwgdGhlIHJlcXVpcmVkIERTVFJFQU0vRFMtNSBwbGF0Zm9ybSBjb25maWd1cmF0aW9uIGZpbGVz
IA0KPj4gZm9yIHRoZSBBU1QyNTAwIEVWQiBwbGF0Zm9ybS4NCj4NCj4gSSBoYWQgdG8gc2VhcmNo
IGZvciBEU1RSRUFNLiBJcyB0aGlzIHdoYXQgeW91IGFyZSByZWZlcnJpbmcgdG8/DQo+DQo+ICAN
Cj4gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9wcm9kdWN0cy9zb2Z0d2FyZS1kZXZlbG9wbWVu
dC10b29scy9kZWJ1Zy1wcg0KPiBvYmVzLWFuZC1hZGFwdGVycy9kc3RyZWFtDQo+DQo+IE5vLCB3
ZSBoYXZlIG5vdCB1c2VkIGFueSBJQ0Ugb3IgSlRBRyBpbiBvdXIgZGV2ZWxvcG1lbnQuIFdlIGhh
dmUgbm90IA0KPiB1c2VkIERTLTUgZWl0aGVyLiBQZXJoYXBzIHRyeSB0byBjb250YWN0IEFzcGVl
ZCBkaXJlY3RseT8NCj4NCj4gVGhvc2Ugb2YgdXMgd29ya2luZyBvbiB0aGUgbG93IGxldmVsIHNv
ZnR3YXJlIGhhcyBzdHVjayB0byBvcGVuIHNvdXJjZSANCj4gdG9vbHMuIFdlIGhhdmVuJ3QgaGFk
IGEgcmVxdWlyZW1lbnQgZm9yIGFueSBoYXJkd2FyZSBkZWJ1Z2dpbmcuDQo+DQo+IE91ciBRZW11
IG1vZGVsIG9mIHRoZSBhc3QyNTAwIGFuZCBhc3QyNDAwIFNvQ3MgaXMgcXVpdGUgZGV0YWlsZWQu
IE1vc3QgDQo+IG9mIHRoZSBjb2RlIGlzIHVwc3RyZWFtLCBidXQgaWYgeW91IHdhbnQgdGhlIGxh
dGVzdCB0aGVuIHRha2UgYSBsb29rIA0KPiBhdCBvdXIgcmVwb3NpdG9yeToNCj4NCj4gIGh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuYm1jL3FlbXUNCj4NCj4gQ2hlZXJzLA0KPg0KPiBKb2VsDQo+DQo+
Pg0KPj4NCj4+DQo+PiBEb2VzIGFueW9uZSBoYXZlIHRoZXNlIGNvbmZpZ3VyYXRpb24gZmlsZXMs
IGluY2x1ZGluZw0KPj4NCj4+IHRoZSBmbGFzaCBwcm9ncmFtbWluZyBhbGdvcml0aG0gZmlsZSwg
b3Iga25vdyB3aGVyZQ0KPj4NCj4+IEkgY291bGQgYWNxdWlyZSB0aGVtPyAgSSBoYXZlIGFscmVh
ZHkgcG9zdGVkIHRvIHRoZQ0KPj4NCj4+IEFSTSBjb21tdW5pdHkgYm9hcmRzLCBidXQgbm8gbHVj
ayB0aGVyZS4NCg0KSSd2ZSB1c2VkIGl0IG9uIHF1aXRlIGEgZmV3IHBsYXRmb3Jtcy4gQ2FuIGJl
IHZlcnkgaGFuZHkgZm9yIGJ1Z3MgYW5kIHBlcmZvcm1hbmNlIHByb2ZpbGluZy4NCg0KWW91IHNo
b3VsZCBiZSBhYmxlIHRvIGNyZWF0ZSB0aGUgY29uZmlnIHlvdXJzZWxmLCBhdCBsZWFzdCBmb3Ig
YSBiYXNpYyBzZXR1cC4gSWYgdGhlIGRldmljZSBoYXMgQ29yZVNpZ2h0IHRoZW4gbXVjaCBvZiBp
dCBzaG91bGQgYmUgYXV0b21hdGljLg0KDQotIFNpbW9uDQoNCj4+DQo+Pg0KPj4NCj4+IFRoYW5r
IHlvdSBpbiBhZHZhbmNlLA0KPj4NCj4+IERhdmUNCj4+DQo+Pg0KPj4NCj4+IERhdmlkIFRob21w
c29uDQo+Pg0KPj4gU3IuIFN0YWZmIEVuZ2luZWVyLCBTeXN0ZW0gU1cNCj4+DQo+PiBNZWxsYW5v
eCBUZWNobm9sb2dpZXMNCj4+DQo+PiAxOTAwIFdlc3QgUGFyayBEcml2ZSwgU3VpdGUgMjkwDQo+
Pg0KPj4gV2VzdGJvcm91Z2ggTUEgVVNBIDAxNTgxDQo+Pg0KPj4gRGlyZWN0OiA1MDgtOTgzLTY0
MzkNCj4+DQo+Pg0K
