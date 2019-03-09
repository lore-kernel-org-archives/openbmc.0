Return-Path: <prvs=96427f3e5=Tony.Lee@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=96427f3e5=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 44GcZr3qW6zDqHV
 for <openbmc@lists.ozlabs.org>; Sat,  9 Mar 2019 19:13:48 +1100 (AEDT)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx01.quantatw.com with ESMTP; 09 Mar 2019 16:11:26 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Sat, 9 Mar 2019
 16:11:25 +0800
Received: from mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381]) by
 mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381%11]) with mapi id
 15.01.1531.004; Sat, 9 Mar 2019 16:11:25 +0800
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: Ed Tanous <ed.tanous@intel.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: How to upload proposal and code for specifying and customizing
 projects?
Thread-Topic: How to upload proposal and code for specifying and customizing
 projects?
Thread-Index: AdTTIPIRPhO1APIASHuF/QKTlnZP6gBOPviAAD28sLAAEExogAAvWD1A
Date: Sat, 9 Mar 2019 08:11:25 +0000
Message-ID: <9466e8868c7d4e58a3dc943728979bf9@quantatw.com>
References: <86e053918f1541f3a7b8f9264355080f@quantatw.com>
 <20190307041941.22vujoizv5prib57@thinkpad>
 <417a986a10d340148fdc010a703ded2e@quantatw.com>
 <f6916b49-6af2-e78b-9e1a-918aaf8f5d61@intel.com>
In-Reply-To: <f6916b49-6af2-e78b-9e1a-918aaf8f5d61@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24476.006
x-tm-as-result: No--8.077400-0.000000-31
x-tm-as-matchedid: 150567-701625-704425-700685-701005-705424-701559-700752-7
 07997-701698-702495-863519-707663-707410-105700-139705-704341-703674-700040
 -700107-139006-700724-106660-707825-701604-700075-139010-705526-704195-7119
 53-780022-700889-704980-709850-701223-700007-709584-700038-705388-708325-70
 5441-702898-703112-702020-139703-702376-704156-702560-703286-899168-190077-
 148004-148133-29106-42000-42003-63-190014
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
X-List-Received-Date: Sat, 09 Mar 2019 08:13:59 -0000

SGkgRWQsDQogDQpXZSBrbm93IHRoYXQgdGhlIGFib3ZlIHByb3Bvc2FsIGNhbiBnZXQgbW9yZSBm
dWxseSBpbmZvcm1hdGlvbiBhbmQgaW4gbW9zdCBjYXNlcyBpdCBtYXRjaGVzLg0KQnV0IG91ciBk
ZXNpZ24gaXMgdG8gcHJvdmlkZSBhIHNpbXBsZSB3YXkgdG8gZ2V0IGJhc2ljIHBhcmFtZXRlcnMg
KHN1Y2ggYXMgdmVuZG9yIElELCBzZXJpYWwgbnVtYmVycywgZXRjLikgdmlhIFNNYnVzDQphbmQg
aXQgaXMgbm90IGEgcXVhbnRhIHNwZWNpZmljIGZlYXR1cmUuIEN1cnJlbnRseSwgaXQgb25seSBu
ZWVkcyB0aGUgZmVhdHVyZSB0byByZXRyaWV2ZSBOVk1lIGRyaXZlcyBpbmZvcm1hdGlvbiB3aXRo
b3V0IE1DVFAuDQpIZXJlIGlzIHRoZSBwcm9wb3NhbC4gaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1w
cm9qZWN0Lnh5ei8jL2Mvb3BlbmJtYy9kb2NzLysvMTkwNjEvDQoNClRoYW5rcw0KQmVzdCBSZWdh
cmRzLA0KVG9ueQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRWQgVGFub3Vz
IFttYWlsdG86ZWQudGFub3VzQGludGVsLmNvbV0gDQpTZW50OiBTYXR1cmRheSwgTWFyY2ggOSwg
MjAxOSAxOjM0IEFNDQpUbzogVG9ueSBMZWUgKOadjuaWh+WvjCkgPFRvbnkuTGVlQHF1YW50YXR3
LmNvbT47IEJyYWQgQmlzaG9wIDxicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+DQpDYzogb3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogSG93IHRvIHVwbG9hZCBwcm9wb3Nh
bCBhbmQgY29kZSBmb3Igc3BlY2lmeWluZyBhbmQgY3VzdG9taXppbmcgcHJvamVjdHM/DQoNCg0K
DQpPbiAzLzcvMTkgNjo0OSBQTSwgVG9ueSBMZWUgKOadjuaWh+WvjCkgd3JvdGU6DQo+IEhpIEJy
YWQsDQo+IA0KPiANCj4+IEkgY2FuIGNlcnRhaW5seSBjcmVhdGUgYSBxdWFudGEtZGJ1cy1pbnRl
cmZhY2VzIHJlcG9zaXRvcnkgaWYgeW91J2QgbGlrZS4gIEJ1dCBmaXJzdCAtIEknbSBqdXN0IGN1
cmlvdXMgYWJvdXQgd2hhdCBzb3J0cyBvZiBEQnVzIEFQSXMgeW91IGhhdmU/ICBBcmUgdGhleSBh
Y3R1YWxseSBzcGVjaWZpYyB0byBRdWFudGEgbWFjaGluZXMsIG9yIGNvdWxkIHRoZXkgYmUgcHV0
IGluIHBob3NwaG9yLWRidXMtaW50ZXJmYWNlcz8gIA0KPiBVbmRlcnN0b29kLiBJdCBjYW4gYWxz
byBiZSB1c2VkIGZvciB0aGUgbWFjaGluZSBoYXMgTlZNZSBkcml2ZXMgb24gaXQuIFRoZSBBUElz
IGNvdWxkIGJlIHB1dCBpbiBwaG9zcGhvci1kYnVzLWludGVyZmFjZXMuDQo+IGZvciBleGFtcGxl
LCAieHl6Lm9wZW5ibWNfcHJvamVjdC5Odm1lLkluZm9ybWF0aW9u4oCdLiBUaGUgcHJvcGVydGll
cyB3aWxsIGJlIFNlcmlhbE51bWJlciwgVmVuZG9ySUQsIFNtYXJ0V2FybmluZ3MsIFN0YXR1c0Zs
YWdzLCBEcml2ZUxpZmVVc2VkLg0KDQpUaGVyZSBpcyBhbHJlYWR5IHNvbWUgaW5pdGlhbCB3b3Jr
IHRvIGRvIHRoaXMsIGFuZCB0aGlzIGlzIGRlZmluaXRlbHkgbm90IGEgcXVhbnRhIHNwZWNpZmlj
IGZlYXR1cmUuICBJdCBzaG91bGQgbm90IGJlIHB1dCBpbiBxdWFudGEtZGJ1cy1pbnRlcmZhY2Vz
LiAgVGhlIGRlc2lnbiBkb2N1bWVudCBiZWxvdyBpcyBsYXlpbmcgdGhlIGdyb3VuZCB3b3JrIHRv
IGVuYWJsZSBOVk1lLU1JLiAgSXQgYmUgZ3JlYXQgaWYgeW91IGNvdWxkIGhlbHAgdG8gcmV2aWV3
IGl0IGJlZm9yZSBpbXBsZW1lbnRpbmcgYW55dGhpbmcsIG9yIHB1c2hpbmcgeW91ciBvd24gZGVz
aWduIGRvYy4NCmh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovIy9jL29wZW5ibWMv
ZG9jcy8rLzE4MDMxLw0KDQpUaGUgbG9uZyB0ZXJtIGludGVudGlvbiBpcyB0aGF0IHRoaXMgd2ls
bCBiZSBpbXBsZW1lbnRlZCBhcyBwYXJ0IG9mIHRoZSB4eXoub3BlbmJtY19wcm9qZWN0LkFzc2V0
IGludGVyZmFjZSwgYW5kIGxlYXZlIHRoZSBOVk1lIGluZm9ybWF0aW9uIHRvIGFuIE5WTUUtc3Bl
Y2lmaWMgQVBJLg0KDQo+IA0KPj4gQ291bGQgeW91IGJyaWVmbHkgdGFsayBhYm91dCB3aGF0IHNv
bWUgb2YgdGhlIGFwcGxpY2F0aW9ucyB0aGF0IHByZXNlbnQvd291bGQgcHJlc2VudCB0aGVzZSBB
UElzIGRvPw0KPiBUaGUgYXBwbGljYXRpb24gaXMgdG8gcmV0cmlldmUgaW5mb3JtYXRpb24gb2Yg
dGhlIE5WTWUgZGV2aWNlcyBieSBOVk1lLU1JIGNvbW1hbmRzIHZpYSBTTUJ1cyBkaXJlY3RseS4N
Cj4gDQo+IFRoYW5rcw0KPiBCZXN0IFJlZ2FyZHMsDQo+IFRvbnkNCg0KSXQgd291bGQgaGVscCBh
IGxvdCBpZiB5b3UgY291bGQgaGVscCB0byByZXZpZXcgc29tZSBvZiB0aGUgY29kZSByZXZpZXdz
IGluIHByb2dyZXNzIHRoYXQgYXJlIHdvcmtpbmcgdGhyb3VnaCBOVk1lLU1JLiAgVGhhdCB3aWxs
IGFjY2VsZXJhdGUgTlZNZSBzdXBwb3J0IGZhc3RlciB0aGFuIHN0YXJ0aW5nIG92ZXIgZnJvbSBz
Y3JhdGNoLg0KDQotRWQNCg==
