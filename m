Return-Path: <prvs=9635c77e4=Tony.Lee@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=9635c77e4=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 44FsRd12DwzDqH2
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 13:50:00 +1100 (AEDT)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx01.quantatw.com with ESMTP; 08 Mar 2019 10:49:52 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Fri, 8 Mar 2019
 10:49:50 +0800
Received: from mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381]) by
 mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381%11]) with mapi id
 15.01.1531.004; Fri, 8 Mar 2019 10:49:50 +0800
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: How to upload proposal and code for specifying and customizing
 projects?
Thread-Topic: How to upload proposal and code for specifying and customizing
 projects?
Thread-Index: AdTTIPIRPhO1APIASHuF/QKTlnZP6gBOPviAAD28sLA=
Date: Fri, 8 Mar 2019 02:49:50 +0000
Message-ID: <417a986a10d340148fdc010a703ded2e@quantatw.com>
References: <86e053918f1541f3a7b8f9264355080f@quantatw.com>
 <20190307041941.22vujoizv5prib57@thinkpad>
In-Reply-To: <20190307041941.22vujoizv5prib57@thinkpad>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24474.000
x-tm-as-result: No--7.884800-0.000000-31
x-tm-as-matchedid: 150567-701625-704425-700685-139010-701177-705526-863519-7
 04195-711953-780022-700889-704980-709850-701223-700007-703674-704341-700038
 -704156-700107-139006-700724-106660-707825-701604-700075-139703-700040-7095
 84-705461-148004-148133-42000-42003-63-190014
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
X-List-Received-Date: Fri, 08 Mar 2019 02:50:06 -0000

SGkgQnJhZCwNCg0KPiBJcyB0aGlzIHBhY2thZ2UgYWxyZWFkeSB3cml0dGVuPyAgV291bGQgeW91
IG1pbmQgZmlsbGluZyBvdXQgYSBkZXNpZ24gdGVtcGxhdGUgZm9yIGl0Pw0KTm8sIHRoZSBwYWNr
YWdlIGlzIG5vdCByZWFkeSB5ZXQuIEkgd2lsbCBmaWxsaW5nIG91dCBhIGRlc2lnbiB0ZW1wbGF0
ZSBmb3IgaXQuDQoNCj4gSSBjYW4gY2VydGFpbmx5IGNyZWF0ZSBhIHF1YW50YS1kYnVzLWludGVy
ZmFjZXMgcmVwb3NpdG9yeSBpZiB5b3UnZCBsaWtlLiAgQnV0IGZpcnN0IC0gSSdtIGp1c3QgY3Vy
aW91cyBhYm91dCB3aGF0IHNvcnRzIG9mIERCdXMgQVBJcyB5b3UgaGF2ZT8gIEFyZSB0aGV5IGFj
dHVhbGx5IHNwZWNpZmljIHRvIFF1YW50YSBtYWNoaW5lcywgb3IgY291bGQgdGhleSBiZSBwdXQg
aW4gcGhvc3Bob3ItZGJ1cy1pbnRlcmZhY2VzPyAgDQpVbmRlcnN0b29kLiBJdCBjYW4gYWxzbyBi
ZSB1c2VkIGZvciB0aGUgbWFjaGluZSBoYXMgTlZNZSBkcml2ZXMgb24gaXQuIFRoZSBBUElzIGNv
dWxkIGJlIHB1dCBpbiBwaG9zcGhvci1kYnVzLWludGVyZmFjZXMuDQpmb3IgZXhhbXBsZSwgInh5
ei5vcGVuYm1jX3Byb2plY3QuTnZtZS5JbmZvcm1hdGlvbuKAnS4gVGhlIHByb3BlcnRpZXMgd2ls
bCBiZSBTZXJpYWxOdW1iZXIsIFZlbmRvcklELCBTbWFydFdhcm5pbmdzLCBTdGF0dXNGbGFncywg
RHJpdmVMaWZlVXNlZC4NCg0KPiBDb3VsZCB5b3UgYnJpZWZseSB0YWxrIGFib3V0IHdoYXQgc29t
ZSBvZiB0aGUgYXBwbGljYXRpb25zIHRoYXQgcHJlc2VudC93b3VsZCBwcmVzZW50IHRoZXNlIEFQ
SXMgZG8/DQpUaGUgYXBwbGljYXRpb24gaXMgdG8gcmV0cmlldmUgaW5mb3JtYXRpb24gb2YgdGhl
IE5WTWUgZGV2aWNlcyBieSBOVk1lLU1JIGNvbW1hbmRzIHZpYSBTTUJ1cyBkaXJlY3RseS4NCg0K
VGhhbmtzDQpCZXN0IFJlZ2FyZHMsDQpUb255DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBCcmFkIEJpc2hvcCBbbWFpbHRvOmJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbV0g
DQpTZW50OiBUaHVyc2RheSwgTWFyY2ggNywgMjAxOSAxMjoyMCBQTQ0KVG86IFRvbnkgTGVlICjm
nY7mloflr4wpIDxUb255LkxlZUBxdWFudGF0dy5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnDQpTdWJqZWN0OiBSZTogSG93IHRvIHVwbG9hZCBwcm9wb3NhbCBhbmQgY29kZSBmb3Ig
c3BlY2lmeWluZyBhbmQgY3VzdG9taXppbmcgcHJvamVjdHM/DQoNCk9uIFR1ZSwgTWFyIDA1LCAy
MDE5IGF0IDA3OjA1OjU5QU0gKzAwMDAsIFRvbnkgTGVlICjmnY7mloflr4wpIHdyb3RlOg0KPkhp
IEJyYWQsDQo+DQo+SSBoYXZlIHR3byBuZXcgcGFja2FnZXMgInBob3NwaG9yLW52bWUiIA0KDQpJ
cyB0aGlzIHBhY2thZ2UgYWxyZWFkeSB3cml0dGVuPyAgV291bGQgeW91IG1pbmQgZmlsbGluZyBv
dXQgYSBkZXNpZ24gdGVtcGxhdGUgZm9yIGl0Pw0KDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJt
Yy9kb2NzL2Jsb2IvbWFzdGVyL2Rlc2lnbnMvZGVzaWduLXRlbXBsYXRlLm1kDQoNCj4gYW5kICJx
dWFudGEtZGJ1cy1pbnRlcmZhY2VzIiBmb3Igc3BlY2lmeWluZyBhbmQgY3VzdG9taXppbmcgcHJv
amVjdHMuDQo+VGhlcmUgd2FzIGEgc2VydmljZSBwb29saW5nIHN0YXR1cyBvZiBOVk1lIGRldmlj
ZXMgaW4gIiBwaG9zcGhvci1udm1lICINCj5hbmQgc2V2ZXJhbCBkLWJ1cyBpbnRlcmZhY2VzIGZv
ciBRdWFudGEgaW4gInF1YW50YS1kYnVzLWludGVyZmFjZXMiLg0KPg0KPjEuIElzIGl0IHdpbGwg
YmUgcHV0IGludG8gYSBuZXcgcmVwb3NpdG9yeSBvciBwdXQgaXQgdW5kZXIgdGhlIG1ldGEtcXVh
bnRhPw0KPjIuIEFzIGZvciB0aGUgcHJvcG9zYWwsIGlzIGl0IHN0aWxsIG5lZWQgdG8gY29tbWl0
IHRvIGdlcnJpdCB1bmRlciBvcGVuYm1jL2RvY3MgPw0KDQpJIGNhbiBjZXJ0YWlubHkgY3JlYXRl
IGEgcXVhbnRhLWRidXMtaW50ZXJmYWNlcyByZXBvc2l0b3J5IGlmIHlvdSdkIGxpa2UuICBCdXQg
Zmlyc3QgLSBJJ20ganVzdCBjdXJpb3VzIGFib3V1dCB3aGF0IHNvcnRzIG9mIERCdXMgQVBJcyB5
b3UgaGF2ZT8gIEFyZSB0aGV5IGFjdHVhbGx5IHNwZWNpZmljIHRvIFF1YW50YSBtYWNoaW5lcywg
b3IgY291bGQgdGhleSBiZSBwdXQgaW4gcGhvc3Bob3ItZGJ1cy1pbnRlcmZhY2VzPyAgDQoNCkRv
IHRoZSBhcHBsaWNhdGlvbnMgdGhhdCBpbXBsZW1lbnQgdGhlIEFQSXMgaW4gcXVhbnRhLWRidXMt
aW50ZXJmYWNlcyBhbHJlYWR5IGV4aXN0IG9yIGFyZSB5b3UgcGxhbm5pbmcgb24gd3JpdGluZyB0
aGVtIGluIHRoZSBmdXR1cmU/DQoNCkNvdWxkIHlvdSBicmllZmx5IHRhbGsgYWJvdXQgd2hhdCBz
b21lIG9mIHRoZSBhcHBsaWNhdGlvbnMgdGhhdCBwcmVzZW50L3dvdWxkIHByZXNlbnQgdGhlc2Ug
QVBJcyBkbz8NCg0KdGh4IC0gYnJhZA0K
