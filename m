Return-Path: <yao.yuan@hxt-semitech.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hxt-semitech.com
 (client-ip=223.203.96.7; helo=barracuda.hxt-semitech.com;
 envelope-from=yao.yuan@hxt-semitech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hxt-semitech.com
Received: from barracuda.hxt-semitech.com (mx01.hxt-semitech.com
 [223.203.96.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Cn953lDQzDqvj
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 13:30:00 +1100 (AEDT)
X-ASG-Debug-ID: 1544408991-093b7e716227110001-mgJK9t
Received: from HXTBJIDCEMVIW01.hxtcorp.net ([10.128.0.14]) by
 barracuda.hxt-semitech.com with ESMTP id HwvPPliMVK05ahaN (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Mon, 10 Dec 2018 10:29:51 +0800 (CST)
X-Barracuda-Envelope-From: yao.yuan@hxt-semitech.com
Received: from HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) by
 HXTBJIDCEMVIW01.hxtcorp.net (10.128.0.14) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 10 Dec 2018 10:28:59 +0800
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6]) by
 HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6%12]) with mapi id
 15.00.1395.000; Mon, 10 Dec 2018 10:28:59 +0800
From: "Yuan, Yao" <yao.yuan@hxt-semitech.com>
To: Ed Tanous <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: How to enable bmcweb in openbmc
Thread-Topic: How to enable bmcweb in openbmc
X-ASG-Orig-Subj: RE: How to enable bmcweb in openbmc
Thread-Index: AQHUjnUYTS2ybxO2MEKpaIxiHJh7jqV3QQMg
Date: Mon, 10 Dec 2018 02:28:59 +0000
Message-ID: <c1e0242f155f4d8aae62bfa3a1d38f9d@HXTBJIDCEMVIW02.hxtcorp.net>
References: <b5a3f14c40c04288ab7347f707904f3c@HXTBJIDCEMVIW02.hxtcorp.net>
 <31e4f1a6-2e90-8dbf-4261-13d6827e0d8a@intel.com>
In-Reply-To: <31e4f1a6-2e90-8dbf-4261-13d6827e0d8a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.64.1.64]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.128.0.14]
X-Barracuda-Start-Time: 1544408991
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.101:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.4996 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.63459
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
X-List-Received-Date: Mon, 10 Dec 2018 02:30:02 -0000

SGkgRWQgJiBBbmRyZXcsDQoNClRoYW5rcyBmb3IgeW91ciByZXBseSwNCg0KSXQncyB2ZXJ5IGhl
bHBmdWwgYW5kIEkgY2FuIHJ1biBpdCBvbiBteSBvYm1jIHN1Y2Nlc3NmdWxseSBub3cuDQoNClRo
YW5rcy4NCg0KQmVzdCBSZWdhcmRzLA0KWWFvLg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBFZCBUYW5vdXMgW21haWx0bzplZC50YW5vdXNAaW50ZWwuY29tXSANClNlbnQ6
IDIwMTjlubQxMuaciDjml6UgNTo0MQ0KVG86IFl1YW4sIFlhbyA8eWFvLnl1YW5AaHh0LXNlbWl0
ZWNoLmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IEhvdyB0byBl
bmFibGUgYm1jd2ViIGluIG9wZW5ibWMNCg0KDQpPbiAxMi83LzE4IDEyOjM2IEFNLCBZdWFuLCBZ
YW8gd3JvdGU6DQo+DQo+IEhpIGFsbCwNCj4NCj4gwqANCj4NCj4gSeKAmW0gbmV3IGhlcmUgYW5k
IHdhbnQgdG8gZW5hYmxlIG9wZW5ibWMgb24gbXkgc2VydmVyLg0KPg0KPiDCoA0KPg0KQXQgdGhp
cyBwb2ludCwgYm1jd2ViIGlzIG5vdCB0aGUgZGVmYXVsdCBpbXBsZW1lbnRhdGlvbiBmb3IgdGhl
IHByb2plY3QuwqAgQmFzZWQgb24gdGhlIGRpc2N1c3Npb25zIHdpdGggb3RoZXIgcGVvcGxlLCBt
YWtpbmcgaXQgdGhlIGRlZmF1bHQgaW1wbGVtZW50YXRpb24gc2VlbXMgdG8gYmUgdGhlIGRpcmVj
dGlvbiB3ZSdyZSBoZWFkaW5nLCBidXQgdGhlcmUgYXJlIGEgZmV3IHJvYWRibG9ja3MgdG8gZ2V0
IHRocm91Z2ggYmVmb3JlIHdlIGNhbiBtYWtlIHRoYXQgYSByZWFsaXR5Lg0KDQpGb3IgdGhlIG1v
bWVudCwgdGhlcmUgYXJlIGEgZmV3IGRpZmZlcmVudCB3YXlzIHRvIHJ1biBibWN3ZWIsIGVhY2gg
aGF2ZSB0aGVpciBiZW5lZml0cyBhbmQgcGl0ZmFsbHMuDQoNCjEuIFN0YW5kYWxvbmUsIGFzIGEg
cmVwbGFjZW1lbnQgZm9yIHBob3NwaG9yLXJlc3QuDQoNCsKgwqDCoCBUaGlzIGlzIHRoZSBvcHRp
b24gSSBnZW5lcmFsbHkgY2hvb3NlLCBnaXZlbiBpdCdzIHRoZSBzaW1wbGVzdCBmcm9tIGEgY29u
ZmlndXJhdGlvbiBwZXJzcGVjdGl2ZS7CoCBBZGRpbmcgaXQgdG8geW91ciBidWlsZCBjYW4gYmUg
YWNjb21wbGlzaGVkIHRlbXBvcmFyaWx5IGJ5IGFkZGluZyB0aGUgYmVsb3cgbGluZSB0byB5b3Vy
IGJ1aWxkL2NvbmYvbG9jYWwuY29uZiBmaWxlDQoNCklNQUdFX0lOU1RBTExfYXBwZW5kID0gIiBi
bWN3ZWIiDQoNCkZvciBjb21wYXRpYmlsaXR5IHdpdGggcGhvc3Bob3ItcmVzdCwgYnkgZGVmYXVs
dCB0aGlzIHdpbGwgbGF1bmNoIGJtY3dlYiBvbiBwb3J0IDg4My7CoCBJZiB5b3UnZCBsaWtlIHRv
IGxhdW5jaCBpdCBvbiBwb3J0IDQ0Mywgd2hpY2ggaXMgbW9yZSBzdGFuZGFyZCwgb3ZlcnJpZGUg
b3IgcmVwbGFjZSB0aGlzIGZpbGUgaGVyZToNCg0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
b3BlbmJtYy9ibG9iLzI5OGM0MzI4ZmQyMGZjZDc2NDVkYTE1NjVjMTQzYjFiNjY4ZWY1NDEvbWV0
YS1waG9zcGhvci9yZWNpcGVzLXBob3NwaG9yL2ludGVyZmFjZXMvYm1jd2ViL2JtY3dlYi5zb2Nr
ZXQjTDUNCg0KQW5kIHJlbW92ZSBwaG9zcGhvci1yZXN0IGZyb20geW91ciBidWlsZCBieSBlaXRo
ZXIgY29tbWVudGluZyBpdCBvdXQgaGVyZToNCg0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
b3BlbmJtYy9ibG9iLzI5OGM0MzI4ZmQyMGZjZDc2NDVkYTE1NjVjMTQzYjFiNjY4ZWY1NDEvbWV0
YS1waG9zcGhvci9yZWNpcGVzLXBob3NwaG9yL3BhY2thZ2Vncm91cHMvcGFja2FnZWdyb3VwLW9i
bWMtYXBwcy5iYiNMNDANCg0KT3IgYWRkIHRoZSBsaW5lOg0KDQpJTUFHRV9JTlNUQUxMX3JlbW92
ZSAiIHBob3NwaG9yLXJlc3QiIHRvIHlvdXIgbG9jYWwuY29uZg0KDQpPbiB0aGUgbmV4dCBib290
IGFmdGVyIGxvYWRpbmcgdGhpcywgYm1jd2ViIHNob3VsZCBnZW5lcmF0ZSBzZWxmLXNpZ25lZCBr
ZXlzIGFuZCBib290IHVwLsKgIElmIHlvdSBzdGlsbCBoYXZlIHRyb3VibGVzLCBydW5uaW5nIHRo
ZSBjb21tYW5kICJqb3VybmFsY3RsIC11IGJtY3dlYiIgbWlnaHQgZ2l2ZSB5b3Ugc29tZSBoaW50
cyBhcyB0byB3aGF0cyB3cm9uZy4NCg0KDQoyLiBUaGUgc2Vjb25kIG9wdGlvbiBpcyB0byBydW4g
Ym1jd2ViIGJlaGluZCBhbiBuZ2lueCByZXZlcnNlIHByb3h5LiBUaGlzIGlzIGhvdyB0aGUgSUJN
IHN5c3RlbXMgYXJlIHNldCB1cCBjdXJyZW50bHkuwqAgSW4gZXNzZW5jZSwgYm1jd2ViIGlzIHBy
b3hpZWQgYmVoaW5kIG5naW54IGZvciBhbGwgdXJscyBtYXRjaGluZyB0aGUgL3JlZGZpc2ggcm91
dGVzLsKgIEJNQ3dlYiBpcyBsYXVuY2hlZCBpbiBodHRwIG1vZGUgKG5vdCBodHRwcykgYW5kIGFs
bCB0aGluZ3MgYXJlIHJvdXRlZCB0aHJvdWdoIG5naW54LsKgIElmIHlvdSB3YW50IHRvIGdvIHRo
aXMgcm91dGUsIEknZCByZWNvbW1lbmQgdGFraW5nIGEgbG9vayBhdCB0aGUgbWV0YS1pYm0gbGF5
ZXIsIGluIHRoZSBuZ2lueCBhbmQgYm1jd2ViIGZvbGRlcnMuDQoNCg0KSWYgeW91IG5lZWQgbW9y
ZSBoZWxwIGluIGNsb3Nlci10by1yZWFsdGltZSwgdGhlcmUgYXJlIHNldmVyYWwgb2YgdXMNCnRo
YXQga25vdyB0aGlzIHN0dWZmIHByZXR0eSB3ZWxsIHRoYXQgaGFuZyBvdXQgaW4gdGhlIElSQyBj
aGFubmVsLg0KDQpHb29kIGx1Y2ssIGFuZCBsZXQgdXMga25vdyBpZiB5b3UgbmVlZCBhbnkgbW9y
ZSBoZWxwLg0KDQotRWQNCg0K
