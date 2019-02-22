Return-Path: <prvs=949bf1414=Will.Liang@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=949bf1414=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 677 seconds by postgrey-1.36 at bilbo;
 Fri, 22 Feb 2019 13:11:28 AEDT
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 445FFX5Hm6zDqSm
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 13:11:27 +1100 (AEDT)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 22 Feb 2019 10:00:07 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Fri, 22 Feb
 2019 10:00:01 +0800
Received: from mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381]) by
 mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381%11]) with mapi id
 15.01.1531.004; Fri, 22 Feb 2019 10:00:01 +0800
From: =?utf-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
CC: Stefan M Schaeckeler <sschaeck@cisco.com>, "dkodihal@in.ibm.com"
 <dkodihal@in.ibm.com>
Subject: RE: ECC memory of BMC  
Thread-Topic: ECC memory of BMC  
Thread-Index: AQHUya1p/FCQCnvcCUCqyg3eXim5w6XpT5IAgACIXkGAAJmggIAAlZbQ
Date: Fri, 22 Feb 2019 02:00:01 +0000
Message-ID: <8f0d3dec56434a0484f6d5172c036ed4@quantatw.com>
References: <88e05768447d466ca674e12e20c650dc@quantatw.com>
 <96605da0-113a-4d43-994a-f081f30af71e@www.fastmail.com>
 <66dac7974c444060a9b4b1052b00d072@quantatw.com>
 <8b3b8d3a-9cf5-4f7d-9993-e71fd3cd6e07@www.fastmail.com>
In-Reply-To: <8b3b8d3a-9cf5-4f7d-9993-e71fd3cd6e07@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24442.002
x-tm-as-result: No--10.849200-0.000000-31
x-tm-as-matchedid: 140026-150567-701625-704425-700685-139010-700075-110462-7
 00107-702020-702643-708060-702034-708712-702358-701395-704927-703674-704341
 -700476-780022-148004-148133-42000-42003-63
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
X-List-Received-Date: Fri, 22 Feb 2019 02:11:30 -0000

PiANCj4gT24gVGh1LCAyMSBGZWIgMjAxOSwgYXQgMTc6NTcsIFdpbGwgTGlhbmcgKOaigeawuOmJ
iSkgd3JvdGU6DQo+ID4NCj4gPiBIaSBBbmRyZXcsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHlvdXIg
cmVzcG9uc2UuDQo+ID4NCj4gPiBXZSBoYXZlIGFsc28gZm91bmQgRURBQyBkcml2ZXIuDQo+ID4N
Cj4gPiBXaGF0IHdlIHdhbnQgdG8gZG8gaXMgdG8gcmVjb3JkIHRoZSBFQ0MgZXZlbnRzIHRvIFNF
TC4NCj4gPg0KPiA+IHdlIGFyZSBjb25zaWRlcmluZyB0byBjcmVhdGUgbmV3IGRidXMgYW5kIGEg
c2VydmljZS4NCj4gDQo+IFJpZ2h0OyBJIHRoaW5rIHlvdSBuZWVkIHRvIGNyZWF0ZSBhIG5ldyBz
ZXJ2aWNlIHRoYXQgcG9sbHMgdGhlIHN5c2ZzIGludGVyZmFjZSBmb3INCj4gdGhlIEVEQUMgZGV2
aWNlLCBhbmQgdGhlbiB1c2UgcGhvc3Bob3ItbG9nZ2luZyB0byBjcmVhdGUgZXJyb3IgbG9ncy4g
DQoNCg0KV2UgY29uc2lkZXIgY3JlYXRpbmcgdGhlIGZvbGxvd2luZyBvYmplY3RzIGZvciBELUJ1
czoNCi1idXMgbmFtZSA6IC94eXovb3BlbmJtY19wcm9qZWN0L0VDQw0KLW9iamVjdCBwYXRoIDog
L3h5ei9vcGVuYm1jX3Byb2plY3QvRUNDL3N0YXR1cw0KLWludGVyZmFjZSA6IHh5ei5vcGVuYm1j
X3Byb2plY3QuTWVtb3J5Lk1lbW9yeUVDQw0KDQphbmQgZXJyb3IgdHlwZXMgZm9yIHh5ejo6b3Bl
bmJtY19wcm9qZWN0OjpNZW1vcnk6OkVjYzo6RXJyb3I6OmNlQ291bnQgYW5kICJ1ZUNvdW50Ig0K
YW5kICJpc0xvZ2dpbmdMaW1pdFJlYWNoZWQiIGZvciBwaG9zcGhvci1sb2dnaW5nIGVycm9yIG1l
c3NhZ2UuDQoNCiBJJ20gbm90DQo+IG11Y2ggb2YgYSB1c2Vyc3BhY2UgZ3V5LCBzbyBJJ3ZlIENj
J2VkIERlZXBhayB3aG8gbWlnaHQgYmUgYWJsZSB0byBoZWxwIG9uDQo+IHRoYXQgIGZyb250Lg0K
Pg0KDQo+IEFuZHJldw0K
