Return-Path: <prvs=971b26aa4=P.K.Lee@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=971b26aa4=p.k.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44M2jZ2HgKzDqLX
 for <openbmc@lists.ozlabs.org>; Sun, 17 Mar 2019 00:04:58 +1100 (AEDT)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 16 Mar 2019 21:04:55 +0800
Received: from mailbx07.quanta.corp (10.243.91.102) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Mar
 2019 21:04:54 +0800
Received: from mailbx07.quanta.corp ([fe80::9d6:a261:b1d9:59bd]) by
 mailbx07.quanta.corp ([fe80::9d6:a261:b1d9:59bd%4]) with mapi id
 15.01.1713.004; Sat, 16 Mar 2019 21:04:54 +0800
From: =?utf-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: To restrict IPMI commands
Thread-Topic: To restrict IPMI commands
Thread-Index: AQHUylskvUTKJWIDpEOZnUXqsK3TfKXruSqAgCIdtIA=
Date: Sat, 16 Mar 2019 13:04:53 +0000
Message-ID: <9674FC29-B121-444E-A123-E99A31181766@quantatw.com>
References: <939F2F2B-6C7E-4EDE-A755-CFFADAD6F1D3@quantatw.com>
 <20190222200545.GA44612@mauery.jf.intel.com>
In-Reply-To: <20190222200545.GA44612@mauery.jf.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24490.004
x-tm-as-result: No--8.019000-0.000000-31
x-tm-as-matchedid: 140026-150567-701625-704425-700685-700274-700994-707163-7
 00023-105250-705508-703788-700756-707451-702358-702527-709584-701914-139010
 -700648-700075-702050-709908-704421-708797-105640-139705-704341-703674-8991
 68-190077-148004-148133-29106-42000-42003-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
Content-ID: <46EED95112D3E540B247987882F5DC7A@quantatw.com>
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
X-List-Received-Date: Sat, 16 Mar 2019 13:05:07 -0000

SGkgVmVybm9uLA0KDQpUaGFuayB5b3UgZm9yIHByb3ZpZGluZyBhIG5ldyBmaWx0ZXJpbmcgbWVj
aGFuaXNtIHRoYXQgbG9va3MgdmVyeSBmbGV4aWJsZSwgYnV0IEkgaGF2ZSBhIHF1ZXN0aW9uLg0K
SSBoYXZlIHRyaWVkIHRoZSBmaWx0ZXIgdGhhdCBhbGxvd3MgZmlsdGVyaW5nIG9mIGNvbW1hbmRz
IGJ5IHdoaXRlbGlzdEZpbHRlciwgYnV0IHRoZSBjaGFubmVsIG9mIHJlcXVlc3QgbXVzdCBiZSBj
aGFubmVsU3lzdGVtSWZhYyB0byBjaGVjayB0aGUgY29udGVudHMgb2YgdGhlIHdoaXRlbGlzdC4N
CldoYXQgcHV6emxlcyBtZSBpcyB3aHkgY2hhbm5lbFN5c3RlbUlmYWMgaXMgaW4gdGhlIGNvbnN0
cmFpbnQ/IFRoaXMgY29uc3RyYWludCB3aWxsIGNhdXNlIHRoZSB3aGl0ZWxpc3QgdG8gZmFpbCB3
aGVuIHRoZSB1c2VyIGNhbGxzIHRoZSBJUE1JIGNvbW1hbmQgdmlhIHRoZSBMQU4uDQpJZiB0aGUg
dXNlciB3YW50cyB0byB1c2UgdGhlIHdoaXRlbGlzdCB2aXMgdGhlIExBTiwgaXMgdGhlcmUgYSBi
ZXR0ZXIgd2F5IGV4Y2VwdCBmb3IgcmVtb3ZpbmcgdGhlIGNoYW5uZWxTeXN0ZW1JZmFjIHJlc3Ry
aWN0aW9uPw0KRG8gSSBuZWVkIHRvIGNyZWF0ZSBhbm90aGVyIHdoaXRlbGlzdCBmaWx0ZXIgZm9y
IHRoZSBMQU4/DQoNClJlZ2FyZHMsDQpQSw0KDQo+IE9uIEZlYiAyMywgMjAxOSwgYXQgMDQ6MDUs
IFZlcm5vbiBNYXVlcnkgPHZlcm5vbi5tYXVlcnlAbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4g
DQo+IE9uIDIyLUZlYi0yMDE5IDAzOjAzIEFNLCBQLiBLLiBMZWUgKOadjuafj+WvrCkgd3JvdGU6
DQo+PiBIaSwNCj4+IA0KPj4gRG9lcyBhbnlvbmUga25vdyBob3cgdG8gcmVzdHJpY3QgdGhlIElQ
TUkgY29tbWFuZCBleGVjdXRpb24gdmlhIG91dC1vZi1iYW5kPw0KPj4gDQo+PiBJIGtub3cgdGhh
dCB0aGUgSVBNSSBjb21tYW5kcyB2aWEgaW4tYmFuZCBjYW4gdXNlIHRoZSB3aGl0ZWxpc3QgbWVj
aGFuaXNtIHRvIHJlc3RyaWN0IHdoZXRoZXIgdGhlIGNvbW1hbmRzIGNhbiBhY2Nlc3MgdGhlIEJN
QywgYnV0IEkgY2FuJ3QgdXNlIHRoaXMgZm9yIHRoZSBvdXQtb2YtYmFuZC4NCj4+IA0KPj4gSWYg
dGhlcmUgaXMgY3VycmVudGx5IG5vIHJlc3RyaWN0aW9uIG1lY2hhbmlzbSBmb3IgdGhlIG91dC1v
Zi1iYW5kLCBJIHdpbGwgdHJ5IHRvIGFkZCB0aGUgd2hpdGVsaXN0IGZ1bmN0aW9uIGZvciBpdCBq
dXN0IGxpa2UgdGhlIGluLWJhbmQuDQo+IA0KPiBUaGVyZSBpcyBhIG1lY2hhbmlzbSBpbiB0aGUg
d29ya3MgZm9yIHRoaXMgYWxyZWFkeS4gSXQgaXMgYSBnZW5lcmljIGZpbHRlciBwcm92aWRlciB0
aGF0IGFsbG93cyBmaWx0ZXJpbmcgb2YgY29tbWFuZHMgYmFzZWQgb24gYW55IGNyaXRlcmlhLiBT
ZWUgaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvcGhvc3Bob3It
aG9zdC1pcG1pZC8rLzEzODk2IGZvciB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbi4NCj4gDQo+
IC0tVmVybm9uDQoNCg==
