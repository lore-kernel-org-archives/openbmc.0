Return-Path: <prvs=980992fdf=Will.Liang@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=980992fdf=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44Sb9y4Tt0zDqGY
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 00:45:21 +1100 (AEDT)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 25 Mar 2019 21:45:19 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 25 Mar
 2019 21:45:17 +0800
Received: from mailbx08.quanta.corp ([fe80::7852:659e:2c18:affd]) by
 mailbx08.quanta.corp ([fe80::7852:659e:2c18:affd%11]) with mapi id
 15.01.1713.004; Mon, 25 Mar 2019 21:45:17 +0800
From: =?big5?B?V2lsbCBMaWFuZyAoseelw7liKQ==?= <Will.Liang@quantatw.com>
To: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Fwd: Repository for phosphor-ecc and phosphor-nvme
Thread-Topic: Repository for phosphor-ecc and phosphor-nvme
Thread-Index: AdTYrXonJsKQH9PWQsuLXOt1+yrxEgFjnQ7wATVDJUo=
Date: Mon, 25 Mar 2019 13:45:17 +0000
Message-ID: <8ABD022A-3F8D-457A-BF55-9F4B33A09C6E@quantatw.com>
References: <cccab160db264695bb086521e722f71f@quantatw.com>
In-Reply-To: <cccab160db264695bb086521e722f71f@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24510.006
x-tm-as-result: No--8.104600-0.000000-31
x-tm-as-matchedid: 140026-150540-701625-704425-700685-106230-700812-703788-1
 39010-702020-700752-707163-700551-703330-700040-139705-704341-703674-700107
 -899168-190077-148004-148133-20043-29106-42000-42003-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="big5"
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
X-List-Received-Date: Mon, 25 Mar 2019 13:45:27 -0000

SGkgQnJhZCwNCndvdWxkIHlvdSBwbGVhc2UgYWR2aXNlIG1lIHdoZW4gdGhlc2UgdHdvIHJlcG9z
aXRvcmllcyBjYW4gYmUgY3JlYXRlZD8NCg0KQlJzLA0KV2lsbA0KDQo+IEhpIEJyYWQsDQo+IA0K
PiBXZSBhcmUgc3RpbGwgd2FpdGluZyBmb3IgeW91ciBoZWxwLg0KPiANCj4gRG8geW91IGhhdmUg
YW55IGNvbmNlcm4gb3Igc3VnZ2VzdGlvbiBhYm91dCBvdXIgcmVxdWVzdD8gDQo+IA0KPiBCUnMs
DQo+IFdpbGwNCj4gDQo+PiANCj4+IEhpIEJyYWQsDQo+PiANCj4+IENvdWxkIHlvdSBoZWxwIGNy
ZWF0ZSByZXBvc2l0b3JpZXMgZm9yICJwaG9zcGhvci1lY2MiIGFuZCAicGhvc3Bob3ItbnZtZSI/
DQo+PiBCb3RoIHByb3Bvc2FscyBhcmUgYWxzbyBwdXNoZWQgdG8gb3BlbWJtYy9kb2NzIG9uIEdl
cnJpdC4NCj4+IA0KPj4gcGhvc3Bob3ItZWNjOg0KPj4gaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1w
cm9qZWN0Lnh5ei8jL2Mvb3BlbmJtYy9kb2NzLysvMTg2ODQvDQo+PiANCj4+IHBob3NwaG9yLW52
bWU6DQo+PiBodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6LyMvYy9vcGVuYm1jL2Rv
Y3MvKy8xOTA2MS8NCj4+IA0KPj4gVGhlc2UgcHJvcG9zYWxzIGFyZSBzdGlsbCB1bmRlciByZXZp
ZXcgb24gR2Vycml0Lg0KPj4gDQo+PiBUaGFua3MsDQo+PiBXaWxsDQo=
