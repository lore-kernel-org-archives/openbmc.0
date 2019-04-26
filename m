Return-Path: <prvs=01264508d=Will.Liang@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=01264508d=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44qwpw19WDzDqX6
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 11:05:55 +1000 (AEST)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 26 Apr 2019 09:05:52 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 26 Apr
 2019 09:05:50 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Fri, 26 Apr 2019 09:05:51 +0800
From: =?utf-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: Repository for phosphor-ecc
Thread-Topic: Repository for phosphor-ecc
Thread-Index: AdT4p7t1cWCax25bRS2sxgB6RBd/jQCX3mvQABYFB4AAGvgHQA==
Date: Fri, 26 Apr 2019 01:05:51 +0000
Message-ID: <70a9f53573c4443ba0d70aa5c3793e59@quantatw.com>
References: <baa383a5f03e417aa0bb21c86022eb9e@quantatw.com>
 <20190425200616.mavvuzbfds75dne3@thinkpad>
In-Reply-To: <20190425200616.mavvuzbfds75dne3@thinkpad>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24572.004
x-tm-as-result: No--20.097700-0.000000-31
x-tm-as-matchedid: 140026-150567-701625-704425-700685-139010-700075-701618-7
 02020-711953-139705-704341-703674-700040-187067-184142-707969-706719-703788
 -701142-106230-184200-852663-700295-121119-704421-701437-705969-863519-7071
 63-899168-190077-148004-148133-20043-24831-29106-42000-42003-63-190014
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Apr 2019 01:06:01 -0000

SGkgQnJhZA0KDQo+IE9uIFRodSwgQXByIDI1LCAyMDE5IGF0IDAxOjQwOjM0QU0gKzAwMDAsIFdp
bGwgTGlhbmcgKOaigeawuOmJiSkgd3JvdGU6DQo+ID5IaSBCcmFkLA0KPiA+DQo+ID5NeSBwcm9w
b3NhbCBoYXMgYmVlbiBtZXJnZWQgYW5kIEkgbmVlZCB5b3VyIGhlbHAgdG8gY3JlYXRlIHRoZSBy
ZXBvc2l0b3J5Lg0KPiA+KGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVu
Ym1jL2RvY3MvKy8xODY4NCkNCj4gDQo+IEhpIFdpbGwNCj4gDQo+IEkndmUgY3JlYXRlZCB0aGUg
cmVwb3NpdG9yeSBvbiBHaXRodWIuICBJIGFtIG5vdCBhYmxlIHRvIGltcG9ydCB0aGUgcmVwb3Np
dG9yeQ0KPiBpbnRvIEdlcnJpdCByaWdodCBub3cgYmVjYXVzZSB0aGUgR2Vycml0L0dpdGh1YiBp
bnRlZ3JhdGlvbiBwbHVnaW4gYnJva2UNCj4gKGFkZGluZyBuZXcgcmVwb3NpdG9yaWVzKSB3aGVu
IHdlIHVwZGF0ZWQgdGhlIEdlcnJpdA0KPiBzZXJ2ZXI6DQo+IGh0dHBzOi8vYnVncy5jaHJvbWl1
bS5vcmcvcC9nZXJyaXQvaXNzdWVzL2RldGFpbD9pZD0xMDY1NyZxPWNvbXBvbmVudCUzQQ0KPiBw
bHVnaW5zJTNFZ2l0aHViJTIwJmNvbHNwZWM9SUQlMjBUeXBlJTIwU3RhcnMlMjBNaWxlc3RvbmUl
MjBTdGF0dXMlDQo+IDIwUHJpb3JpdHklMjBPd25lciUyMFN1bW1hcnkNCj4gDQo+IFBsZWFzZSBs
ZXQgbWUga25vdyB5b3VyIEdpdGh1YiB1c2VybmFtZSBzbyBJIGNhbiBzZW5kIHlvdSBhbiBpbnZp
dGUgdG8gdGhlDQo+IE9wZW5CTUMgR2l0aHViIG9yZ2FuaXphdGlvbiBhbmQgYWRkIHlvdSB0byB0
aGUgbWFpbnRhaW5lcnMgbGlzdCBmb3INCj4gcGhvc3Bob3ItZWNjLg0KDQpNeSBHaXRodWIgdXNl
cm5hbWUgOiBZSExpYW5nODUNCg0KPiBGb3Igbm93IHlvdSBjYW4gZG8gR2l0aHViIHB1bGwgcmVx
dWVzdHMgdG8gcGhvc3Bob3ItZWNjIChhcyB3ZWxsIGFzDQo+IHF1YW50YS1pcG1pLW9lbSkgYW5k
IHdoZW4gd2UgYXJlIGFibGUgdG8gZmlndXJlIG91dCB3aHkgdGhlIEdpdGh1YiBwbHVnaW4NCj4g
c3RvcHBlZCB3b3JraW5nIHdlIGNhbiBkbyB0aGUgaW1wb3J0IG92ZXIgdG8gR2Vycml0Lg0KPiAN
Cj4gdGh4IC0gYnJhZA0KT0shIGkgd2lsbCBkbyBHaXRodWIgcHVsbCByZXF1ZXN0IGZpcnN0LiAN
Cg==
