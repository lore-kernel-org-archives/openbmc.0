Return-Path: <luke_chen@aspeedtech.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=luke_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
X-Greylist: delayed 1823 seconds by postgrey-1.36 at bilbo;
 Tue, 19 Jun 2018 16:39:13 AEST
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418ywx2tt8zF0Tn
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 16:39:13 +1000 (AEST)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2])
 by twspam01.aspeedtech.com with ESMTP id w5J6AGl2081772
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 14:10:16 +0800 (CST)
 (envelope-from luke_chen@aspeedtech.com)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id w5J69seg081560;
 Tue, 19 Jun 2018 14:09:54 +0800 (CST)
 (envelope-from luke_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Tue, 19 Jun
 2018 14:08:54 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Tue, 19 Jun 2018 14:08:53 +0800
From: Luke Chen <luke_chen@aspeedtech.com>
To: James Mihm <james.mihm@gmail.com>, "andrew@aj.id.au" <andrew@aj.id.au>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Poll - Fall 2018 OpenBMC Hackathon
Thread-Topic: Poll - Fall 2018 OpenBMC Hackathon
Thread-Index: AQHUB5Kk8ACGpOCSaUiHpWiPMe4dEqRnGDcg
Date: Tue, 19 Jun 2018 06:08:52 +0000
Message-ID: <c7333926d7df413ba2bb8c21e3987552@TWMBX02.aspeed.com>
References: <000000000000ebc0ca056ef350df@google.com>
 <1529384519.3876096.1412667488.17D5361D@webmail.messagingengine.com>
 <CADy_Pt2rWNu7NuTfQWfP5T+mzfVW3FCbc_8j_Ss+zOwiy68sRA@mail.gmail.com>
In-Reply-To: <CADy_Pt2rWNu7NuTfQWfP5T+mzfVW3FCbc_8j_Ss+zOwiy68sRA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [114.42.65.238]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DKIM-Results: twmbx02.aspeed.com; dkim=none;
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com w5J69seg081560
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2018 06:39:23 -0000

RGVhciBKYW1lcw0KDQpUaGFuayB5b3UgZm9yIHNlbmRpbmcgbWUgdGhlIGVtYWlsLCBJIGFscmVh
ZHkgZmlsbGVkIG91dCB0aGUgZm9ybS4NCkFuZCBJIGFsc28gc3Vic2NyaWJlZCBvbiBPcGVuQk1D
IGZvciB0aGUgbWFpbGluZyBsaXN0IGp1c3Qgbm93Lg0KDQoNCkJlc3Qgd2lzaGVzDQoNCkx1a2Ug
Q2hlbg0KKE8pIDogKzg4Ni0zLTU3ODk1NjgNCihNKSA6ICs4ODYtOTM1LTU5Mi04OTINCg0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2Vz
K2x1a2VfY2hlbj1hc3BlZWR0ZWNoLmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2Yg
SmFtZXMgTWlobQ0KU2VudDogVHVlc2RheSwgSnVuZSAxOSwgMjAxOCAxOjU3IFBNDQpUbzogYW5k
cmV3QGFqLmlkLmF1DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTog
UG9sbCAtIEZhbGwgMjAxOCBPcGVuQk1DIEhhY2thdGhvbg0KDQpBbmRyZXcsIEdyZWF0IGlkZWEu
Li5qdXN0IGFkZGVkIGVpdGhlciBhbmQgbmVpdGhlci4NCg0KSmFtZXMuDQpPbiBNb24sIEp1biAx
OCwgMjAxOCBhdCAxMDowMiBQTSBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PiB3cm90
ZToNCj4NCj4gT24gVHVlLCAxOSBKdW4gMjAxOCwgYXQgMDk6MjYsIGphbWVzLm1paG1AZ21haWwu
Y29tIHdyb3RlOg0KPiA+IEkndmUgaW52aXRlZCB5b3UgdG8gZmlsbCBvdXQgdGhlIGZvbGxvd2lu
ZyBmb3JtOg0KPiA+IE9wZW5CTUMgSGFja2F0aG9uDQo+ID4NCj4gPiBUbyBmaWxsIGl0IG91dCwg
dmlzaXQ6DQo+ID4gaHR0cHM6Ly9kb2NzLmdvb2dsZS5jb20vZm9ybXMvZC9lLzFGQUlwUUxTZUdu
NXg0WS02dmd1M19BeVkzWXNJcl9KVlU1WUNqTFh1ZnVYeGRUOVF5NnN6NDJRL3ZpZXdmb3JtP2M9
MCZhbXA7dz0xJmFtcDt1c3A9bWFpbF9mb3JtX2xpbmsNCj4gPg0KPiA+IEkmIzM5O3ZlIGludml0
ZWQgeW91IHRvIGZpbGwgb3V0IGEgZm9ybToNCj4gPg0KPiA+IEdvb2dsZSBGb3JtczogQ3JlYXRl
IGFuZCBhbmFseXplIHN1cnZleXMuDQo+DQo+IE1heWJlIHdlIHNob3VsZCBhZGQgJ2VpdGhlcicg
YW5kICduZWl0aGVyJyBvcHRpb25zIHNvIHBlb3BsZSBjYW4gcmVnaXN0ZXIgdGhlaXIgaW50ZXJl
c3QgYXBwcm9wcmlhdGVseT8NCj4NCj4gQ2hlZXJzLA0KPg0KPiBBbmRyZXcNCg==
