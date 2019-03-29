Return-Path: <prvs=98493a395=Will.Liang@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=98493a395=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 44VzKs0QXkzDqQ4
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 22:00:27 +1100 (AEDT)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx01.quantatw.com with ESMTP; 29 Mar 2019 19:00:23 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 29 Mar
 2019 19:00:22 +0800
Received: from mailbx08.quanta.corp ([fe80::7852:659e:2c18:affd]) by
 mailbx08.quanta.corp ([fe80::7852:659e:2c18:affd%11]) with mapi id
 15.01.1713.004; Fri, 29 Mar 2019 19:00:22 +0800
From: =?big5?B?V2lsbCBMaWFuZyAoseelw7liKQ==?= <Will.Liang@quantatw.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
CC: =?big5?B?UmljaGFyZCBUdW5nICi4s6vbq8wp?= <Richard.Tung@quantatw.com>,
 =?big5?B?QnVkZHkgSHVhbmcgKLbApNHCRSk=?= <Buddy.Huang@quantatw.com>,
 =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>, "OpenBMC
 Maillist" <openbmc@lists.ozlabs.org>
Subject: RE: Some questions about "Add option for SEL commands for
 Journal-based SEL entries"
Thread-Topic: Some questions about "Add option for SEL commands for
 Journal-based SEL entries"
Thread-Index: AQHU19zSCrJwuH9O70qgTGRON7RxrKYGKv6AgANEalD//+iIAIAUQhnggAGmuACAAzvasw==
Date: Fri, 29 Mar 2019 11:00:21 +0000
Message-ID: <2bcbf6920bc14c0fa1826ac5b0bde62f@quantatw.com>
References: <b96ecddbcf4d4b098ca22c3be8c8e819@quantatw.com>
 <b4c22fe4-96c6-bf8a-7bf7-184af4122653@linux.intel.com>
 <47dbff997b734d14ada16705068c475e@quantatw.com>
 <8139d4fc-3ce8-e753-c000-db713f3e6a2d@linux.intel.com>
 <0d4048d2cf1b4dda89179a89b2a624e2@quantatw.com>,
 <dc07bda4-f926-1b8f-a157-1b0ecfc59e33@linux.intel.com>
In-Reply-To: <dc07bda4-f926-1b8f-a157-1b0ecfc59e33@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24516.007
x-tm-as-result: No--17.986900-0.000000-31
x-tm-as-matchedid: 140026-150567-111600-111604-300151-705718-701827-702638-1
 11605-700074-700264-700732-700345-700450-700949-188057-188116-700767-703747
 -390299-710799-701914-705861-706065-701604-701837-701594-700079-710078-1052
 50-701236-700107-700075-701618-701708-780014-106230-121108-700016-188019-70
 7415-710739-701305-706290-702169-700862-709251-700490-702609-700838-825159-
 704421-702126-121169-702020-702643-700038-701437-704173-706249-707451-70048
 6-709584-703330-780022-780048-184142-704314-711432-703378-702200-701475-113
 929-111610-139705-704341-703674-700700-711953-705733-700726-704425-700752-1
 87067-111608-188092-899168-190077-190877-148004-148054-22561-24831-29106-42
 000-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: multipart/alternative;
 boundary="_000_2bcbf6920bc14c0fa1826ac5b0bde62fquantatwcom_"
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
X-List-Received-Date: Fri, 29 Mar 2019 11:00:35 -0000

--_000_2bcbf6920bc14c0fa1826ac5b0bde62fquantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgSmFzb24sDQoNCg0KU29ycnkgdG8gYm90aGVyIHlvdSBhZ2Fpbi4NCg0KQWZ0ZXIgc29sdmlu
ZyBzZW5zb3IgdHlwZSBhbmQgZXZlbnQgdHlwZSBwcm9ibGVtIGZvciBkaXNjcmV0ZSBzZW5zb3Io
bWVtb3J5KSAsIEkgZW5jb3VudGVyZWQgYW5vdGhlciBpc3N1ZS4NCkZyb20gdGhlIGNvZGUsIGl0
IHNlZW1zIG9ubHkgc3VwcG9ydCBnZXR0aW5nIHRoZSBzZW5zb3IgbnVtYmVyIG9mIHRocmVzaG9s
ZC1iYXNlZCBzZW5zb3JzLg0KSG93IGRvIEkgZ2V0IHRoZSBzZW5zb3IgIG51bWJlciBvZiBkaXNj
cmV0ZSBzZW5zb3JzPw0KV291bGQgeW91IGhhdmUgYW55IHN1Z2dlc3Rpb24gb3IgcGxhbiB0byBn
ZXQgc2Vuc29yIG51bWJlciBvZiBkaXNjcmV0ZSBzZW5zb3JzPw0KDQoNCkJScywNCldpbGwNCg0K
DQpIaSBXaWxsLA0KDQpZb3UgYXJlIHdlbGNvbWUgdG8gcHVzaCBjaGFuZ2VzIGRpcmVjdGx5IHRv
IEdlcnJpdCBmb3IgcmV2aWV3LiAgSSBkaWQgYQ0KcXVpY2sgY2hlY2sgb2YgdGhlIGNvZGUgYW5k
IGl0IGxvb2tzIG9rYXkgdG8gcHVzaCB3aXRoIG9uZSBtaW5vciBjaGFuZ2UNCm9mIFRIUkVTSExP
RCAtPiBUSFJFU0hPTEQuDQoNClRoYW5rcywNCi1KYXNvbg0KDQpPbiAzLzI2LzIwMTkgODoyOCBQ
TSwgV2lsbCBMaWFuZyAoseelw7liKSB3cm90ZToNCj4gSGkgSmFzb24sDQo+DQo+IEkgaGF2ZSBz
ZWVuIHRoYXQgdGhlIGNvZGUgaGFzIGJlZW4gcmVzb2x2ZWQgZnJvbSB0aGUgY29uZmxpY3QgYW5k
IEkgY2FuDQo+IGJpdGJha2UgaXQgc3VjY2Vzc2Z1bGx5IHRvby4gVGhhbmtzLg0KPg0KPiBBcyBp
bmRpY2F0ZWQgaW4gbXkgcHJldmlvdXMgRW1haWwsICBJIG5lZWQgdGhlICJtZW1vcnkiIHNlbnNv
ciB0eXBlIGFuZA0KPiAic2Vuc29yLXNwZWNpZmljIiBldmVudCB0eXBlLg0KPg0KPiBDb3VsZCB5
b3UgcGxlYXNlIGhlbHAgbWUgdG8gcmV2aWV3IHRoZSBmb2xsb3dpbmcgY2hhbmdlcy4NCj4NCj4g
QW5kaWYgeW91IGRvbid0IGhhdmUgYW55IGNvbmNlcm5zLCBJIHdpbGwgcHVzaCB0aGUgY29kZSB0
byBHZXJyaXQgPg0KPiBzZHJ1dGlscy5ocHAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0NCj4NCj4gc2Vuc29yaGFuZGxlci5ocHAgfCAgOCArKysrKysrKw0KPg0K
PiAyIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvc2RydXRpbHMuaHBwIGIvc2RydXRpbHMuaHBwDQo+DQo+IGluZGV4IGE5
MWYzZWEuLmJmZjI4OTYgMTAwNjQ0DQo+DQo+IC0tLSBhL3NkcnV0aWxzLmhwcA0KPg0KPiArKysg
Yi9zZHJ1dGlscy5ocHANCj4NCj4gQEAgLTIwLDkgKzIwLDEwIEBADQo+DQo+ICNpbmNsdWRlIDxi
b29zdC9jb250YWluZXIvZmxhdF9tYXAuaHBwPg0KPg0KPiAjaW5jbHVkZSA8Y3N0cmluZz4NCj4N
Cj4gI2luY2x1ZGUgPHBob3NwaG9yLWxvZ2dpbmcvbG9nLmhwcD4NCj4NCj4gLQ0KPg0KPiArI2lu
Y2x1ZGUgPHR5cGVzLmhwcD4NCj4NCj4gI3ByYWdtYSBvbmNlDQo+DQo+ICsNCj4NCj4gI2lmZGVm
IEpPVVJOQUxfU0VMDQo+DQo+IHN0cnVjdCBDbXBTdHJWZXJzaW9uDQo+DQo+IHsNCj4NCj4gQEAg
LTc0LDEzICs3NSwxNCBAQCBzdHJ1Y3QgQ21wU3RyDQo+DQo+ICAgICAgIH0NCj4NCj4gfTsNCj4N
Cj4gLWNvbnN0IHN0YXRpYyBib29zdDo6Y29udGFpbmVyOjpmbGF0X21hcDxjb25zdCBjaGFyKiwg
aXBtaV9zZW5zb3JfdHlwZXMsDQo+IENtcFN0cj4NCj4NCj4gLSAgICBzZW5zb3JUeXBlc3t7eyJ0
ZW1wZXJhdHVyZSIsIElQTUlfU0VOU09SX1RFTVB9LA0KPg0KPiAtICAgICAgICAgICAgICAgICB7
InZvbHRhZ2UiLCBJUE1JX1NFTlNPUl9WT0xUQUdFfSwNCj4NCj4gLSAgICAgICAgICAgICAgICAg
eyJjdXJyZW50IiwgSVBNSV9TRU5TT1JfQ1VSUkVOVH0sDQo+DQo+IC0gICAgICAgICAgICAgICAg
IHsiZmFuX3RhY2giLCBJUE1JX1NFTlNPUl9GQU59LA0KPg0KPiAtICAgICAgICAgICAgICAgICB7
ImZhbl9wd20iLCBJUE1JX1NFTlNPUl9GQU59LA0KPg0KPiAtICAgICAgICAgICAgICAgICB7InBv
d2VyIiwgSVBNSV9TRU5TT1JfT1RIRVJ9fX07DQo+DQo+ICtjb25zdCBzdGF0aWMgYm9vc3Q6OmNv
bnRhaW5lcjo6ZmxhdF9tYXA8Y29uc3QgY2hhciosDQo+IHN0ZDo6cGFpcjxpcG1pX3NlbnNvcl90
eXBlcywgaXBtaV9ldmVudF90eXBlcz4sIENtcFN0cj4NCj4NCj4gKyAgICBzZW5zb3JBbmRFdmVu
dFR5cGV7e3sidGVtcGVyYXR1cmUiLA0KPiBzdGQ6Om1ha2VfcGFpcihJUE1JX1NFTlNPUl9URU1Q
LCBUSFJFU0hMT0QpfSwNCj4NCj4gKyAgICAgICAgICAgICAgICAgeyJ2b2x0YWdlIiwgc3RkOjpt
YWtlX3BhaXIoSVBNSV9TRU5TT1JfVk9MVEFHRSwNCj4gVEhSRVNITE9EKX0sDQo+DQo+ICsgICAg
ICAgICAgICAgICAgIHsiY3VycmVudCIsIHN0ZDo6bWFrZV9wYWlyKElQTUlfU0VOU09SX0NVUlJF
TlQsDQo+IFRIUkVTSExPRCl9LA0KPg0KPiArICAgICAgICAgICAgICAgICB7ImZhbl90YWNoIiwg
c3RkOjptYWtlX3BhaXIoSVBNSV9TRU5TT1JfRkFOLCBUSFJFU0hMT0QpfSwNCj4NCj4gKyAgICAg
ICAgICAgICAgICAgeyJmYW5fcHdtIiwgc3RkOjptYWtlX3BhaXIoSVBNSV9TRU5TT1JfRkFOLCBU
SFJFU0hMT0QpfSwNCj4NCj4gKyAgICAgICAgICAgICAgICAgeyJwb3dlciIsIHN0ZDo6bWFrZV9w
YWlyKElQTUlfU0VOU09SX09USEVSLCBUSFJFU0hMT0QpfSwNCj4NCj4gKyAgICAgICAgICAgICAg
ICAgeyJtZW1vcnkiLCBzdGQ6Om1ha2VfcGFpcihJUE1JX1NFTlNPUl9NRU1PUlksDQo+IFNFTlNP
Ul9TUEVDSUZJQyl9fX07DQo+DQo+ICAgaW5saW5lIHN0YXRpYyBzdGQ6OnN0cmluZyBnZXRTZW5z
b3JUeXBlU3RyaW5nRnJvbVBhdGgoY29uc3QNCj4gc3RkOjpzdHJpbmcmIHBhdGgpDQo+DQo+IHsN
Cj4NCj4gQEAgLTEwNSwxMiArMTA3LDExIEBAIGlubGluZSBzdGF0aWMgdWludDhfdCBnZXRTZW5z
b3JUeXBlRnJvbVBhdGgoY29uc3QNCj4gc3RkOjpzdHJpbmcmIHBhdGgpDQo+DQo+IHsNCj4NCj4g
ICAgICAgdWludDhfdCBzZW5zb3JUeXBlID0gMDsNCj4NCj4gICAgICAgc3RkOjpzdHJpbmcgdHlw
ZSA9IGdldFNlbnNvclR5cGVTdHJpbmdGcm9tUGF0aChwYXRoKTsNCj4NCj4gLSAgICBhdXRvIGZp
bmRTZW5zb3IgPSBzZW5zb3JUeXBlcy5maW5kKHR5cGUuY19zdHIoKSk7DQo+DQo+IC0gICAgaWYg
KGZpbmRTZW5zb3IgIT0gc2Vuc29yVHlwZXMuZW5kKCkpDQo+DQo+ICsgICAgYXV0byBmaW5kU2Vu
c29yID0gc2Vuc29yQW5kRXZlbnRUeXBlLmZpbmQodHlwZS5jX3N0cigpKTsNCj4NCj4gKyAgICBp
ZiAoZmluZFNlbnNvciAhPSBzZW5zb3JBbmRFdmVudFR5cGUuZW5kKCkpDQo+DQo+ICAgICAgIHsN
Cj4NCj4gLSAgICAgICAgc2Vuc29yVHlwZSA9IGZpbmRTZW5zb3ItPnNlY29uZDsNCj4NCj4gKyAg
ICAgICAgc2Vuc29yVHlwZSA9IGZpbmRTZW5zb3ItPnNlY29uZC5maXJzdDsNCj4NCj4gICAgICAg
fSAvLyBlbHNlIGRlZmF1bHQgMHgwIFJFU0VSVkVEDQo+DQo+IC0NCj4NCj4gICAgICAgcmV0dXJu
IHNlbnNvclR5cGU7DQo+DQo+IH0NCj4NCj4gQEAgLTEyOCw3ICsxMjksMTQgQEAgaW5saW5lIHN0
YXRpYyB1aW50OF90IGdldFNlbnNvck51bWJlckZyb21QYXRoKGNvbnN0DQo+IHN0ZDo6c3RyaW5n
JiBwYXRoKQ0KPg0KPiBpbmxpbmUgc3RhdGljIHVpbnQ4X3QgZ2V0U2Vuc29yRXZlbnRUeXBlRnJv
bVBhdGgoY29uc3Qgc3RkOjpzdHJpbmcmIHBhdGgpDQo+DQo+IHsNCj4NCj4gICAgICAgLy8gVE9E
TzogQWRkIHN1cHBvcnQgZm9yIGFkZGl0aW9uYWwgcmVhZGluZyB0eXBlcyBhcyBuZWVkZWQNCj4N
Cj4gLSAgICByZXR1cm4gMHgxOyAvLyByZWFkaW5nIHR5cGUgPSB0aHJlc2hvbGQNCj4NCj4gKyAg
ICB1aW50OF90IGV2ZW50VHlwZSA9IDB4MDA7DQo+DQo+ICsgICAgc3RkOjpzdHJpbmcgdHlwZSA9
IGdldFNlbnNvclR5cGVTdHJpbmdGcm9tUGF0aChwYXRoKTsNCj4NCj4gKyAgICBhdXRvIGZpbmRT
ZW5zb3IgPSBzZW5zb3JBbmRFdmVudFR5cGUuZmluZCh0eXBlLmNfc3RyKCkpOw0KPg0KPiArICAg
IGlmIChmaW5kU2Vuc29yICE9IHNlbnNvckFuZEV2ZW50VHlwZS5lbmQoKSkNCj4NCj4gKyAgICB7
DQo+DQo+ICsgICAgICAgIGV2ZW50VHlwZSA9IGZpbmRTZW5zb3ItPnNlY29uZC5zZWNvbmQ7DQo+
DQo+ICsgICAgfQ0KPg0KPiArICAgIHJldHVybiBldmVudFR5cGU7IC8vIHJlYWRpbmcgdHlwZSA9
IHRocmVzaG9sZA0KPg0KPiB9DQo+DQo+ICAgaW5saW5lIHN0YXRpYyBzdGQ6OnN0cmluZyBnZXRQ
YXRoRnJvbVNlbnNvck51bWJlcih1aW50OF90IHNlbnNvck51bSkNCj4NCj4gZGlmZiAtLWdpdCBh
L3NlbnNvcmhhbmRsZXIuaHBwIGIvc2Vuc29yaGFuZGxlci5ocHANCj4NCj4gaW5kZXggZDNiNjM3
OC4uZTQ0OTA3NiAxMDA2NDQNCj4NCj4gLS0tIGEvc2Vuc29yaGFuZGxlci5ocHANCj4NCj4gKysr
IGIvc2Vuc29yaGFuZGxlci5ocHANCj4NCj4gQEAgLTM2LDYgKzM2LDE0IEBAIGVudW0gaXBtaV9z
ZW5zb3JfdHlwZXMNCj4NCj4gICAgICAgSVBNSV9TRU5TT1JfRkFOID0gMHgwNCwNCj4NCj4gICAg
ICAgSVBNSV9TRU5TT1JfT1RIRVIgPSAweDBCLA0KPg0KPiAgICAgICBJUE1JX1NFTlNPUl9UUE0g
PSAweENDLA0KPg0KPiArICAgIElQTUlfU0VOU09SX01FTU9SWSA9IDB4MEMsDQo+DQo+ICt9Ow0K
Pg0KPiArDQo+DQo+ICtlbnVtIGlwbWlfZXZlbnRfdHlwZXMNCj4NCj4gK3sNCj4NCj4gKyAgICBV
TlNQRUNJRklFRCA9IDB4MDAsDQo+DQo+ICsgICAgVEhSRVNITE9EID0gMHgwMSwNCj4NCj4gKyAg
ICBTRU5TT1JfU1BFQ0lGSUMgPSAweDZmLA0KPg0KPiB9Ow0KPg0KPiAgICNkZWZpbmUgTUFYX0RC
VVNfUEFUSCAxMjgNCj4NCj4gQlJzLA0KPg0KPiBXaWxsDQo+DQo+IEhpIFdpbGwsDQo+DQo+IE9u
IDMvMTMvMjAxOSA1OjA1IEFNLCBXaWxsIExpYW5nICix56XDuWIpIHdyb3RlOg0KPj4gSGkgSmFz
b24sDQo+Pg0KPj4gVGhhbmtzIGZvciB5b3VyIHJlc3BvbnNlIQ0KPj4NCj4+IEkgdHJpZWQgdG8g
bW9kaWZ5IHRoZSBjb2RlLCBidXQgSSBlbmNvdW50ZXJlZCBzb21lIHByb2JsZW1zIGFmdGVyIHB1
bGwgdGhlIGNvZGUgZnJvbSBHZXJyaXQuDQo+PiBBZnRlciBJIHB1bGwgeW91ciBjb2RlcyBhbmQg
cnVuICJiaXRiYWtlIG9ibWMtcGhvc3Bob3ItaW1hZ2UgIiBjb21tYW5kLg0KPj4gSXQgd2lsbCBz
aG93cyBFUlJPUjogVGFzayAoL2hvbWUvd2lsbC9vcGVuYm1jL21ldGEtcGhvc3Bob3IvcmVjaXBl
cy1waG9zcGhvci9pcG1pL3Bob3NwaG9yLWlwbWktbmV0X2dpdC5iYjpkb19jb21waWxlKSBmYWls
ZWQgd2l0aCBleGl0IGNvZGUgJzEnDQo+PiBEbyB5b3UgaGF2ZSB0aGlzIGVycm9yPyBPciB3aGF0
IGVsc2UgZG8gSSBuZWVkIHRvIGRvPw0KPg0KPiBTb3JyeSwgaXQncyBiZWVuIGEgd2hpbGUgc2lu
Y2UgSSBidWlsdCB0aGlzIHBhdGNoLCBhbmQgdGhlcmUgaGF2ZSBiZWVuDQo+IHNvbWUgYmlnIGNo
YW5nZXMgdG8gaXBtaWQgc2luY2UgSSBwdXNoZWQgaXQuICBJJ20gbm90IGFibGUgdG8gdGVzdCBp
dA0KPiByaWdodCBub3csIGJ1dCBpdCBtYXkganVzdCBuZWVkIHRvIGJlIHJlYmFzZWQ/DQo+Pg0K
Pj4gSSdtIHNvcnJ5LCBtYXliZSB0aGlzIGlzIGEgZHVtYiBxdWVzdGlvbiBidXQgSSBkb26hpnQg
dW5kZXJzdGFuZCBob3cgeW91IGRlZmluZWQgdGhpcyAiSk9VUk5BTF9TRUwiIHBhcmFtZXRlciBm
cm9tICouYmJhcHBlbmQ/DQo+PiBJIHRyaWVkIGl0IGJ1dCBpdCBzdGlsbCBjYW4ndCBydW4gaW50
byB0aGUgI2lmZGVmIEpPVVJOQUxfU0VMIHBhcnQuDQo+DQo+IFRoZXJlIGFyZSBubyBkdW1iIHF1
ZXN0aW9ucyB3aXRoIFlvY3RvLiA6KSAgWW91IG5lZWQgdG8gYWRkIHRoaXMgbGluZSB0bw0KPiBh
IHBob3NwaG9yLWlwbWktaG9zdF8lLmJiYXBwZW5kOg0KPiBFWFRSQV9PRUNPTkYgPSAiIC0td2l0
aC1qb3VybmFsLXNlbCINCj4NCj4gVGhhdCBzaG91bGQgY2F1c2UgdGhlIGRlZmluZSB0byBiZSBz
ZXQgYnkgYXV0b2NvbmZpZyBkdXJpbmcgdGhlIGJ1aWxkLg0KPg0KPiBUaGFua3MsDQo+IC1KYXNv
bg0KPg0KPj4NCj4+IEJScywNCj4+IFdpbGwNCj4+DQo+Pj4gSGkgV2lsbCwNCj4+Pg0KPj4+IE9u
IDMvMTEvMjAxOSAxMjozOSBBTSwgV2lsbCBMaWFuZyAoseelw7liKSB3cm90ZToNCj4+Pj4gSGkg
SmFzb24sDQo+Pj4+DQo+Pj4+IEkndmUgcmV2aWV3ZWQgdGhlIGNvZGUgeW91IHB1c2hlZCB0bw0K
Pj4+IGdlcnJpdChodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6LyMvYy9vcGVuYm1j
L3Bob3NwaG9yLWhvc3QtaXBtaWQvKw0KPj4+IC8xMjk1MS8pLg0KPj4+Pg0KPj4+DQo+Pj4gSSdt
IG5vdCBzdXJlIGlmIHRoZSBwYXRjaCB3aWxsIGJlIGFwcHJvdmVkIGJ5IHRoZSBtYWludGFpbmVy
cy4gIFNvIHlvdSBhcmUNCj4+PiBhd2FyZSwgd2hpbGUgaXQncyBpbiByZXZpZXcsIEkgaGF2ZSBw
dXNoZWQgdGhlIHNhbWUgY29kZSB0byB0aGUgaW50ZWwtaXBtaS1vZW0NCj4+PiByZXBvc2l0b3J5
Lg0KPj4+DQo+Pj4+IEluIHNkcnV0aWxzLmhwcCwgdGhlIGdldFNlbnNvckV2ZW50VHlwZUZyb21Q
YXRoKCkgaXMgc2V0IFRPRE8gc3RhdHVzLg0KPj4+PiBJZiBJIG5lZWQgb3RoZXIgZXZlbnQgdHlw
ZXMgYW5kIHNlbnNvciB0eXBlcyBmb3IgbXkgcHJvamVjdHMsIGRvIEkNCj4+Pj4gaGF2ZSB0byBj
b21wbGV0ZSB0aGUgY29kZSBhbmQgc2VuZCB5b3UgdGhlIGNvZGU/IE9yIEkganVzdCBwdXNoIGl0
IG15c2VsZj8NCj4+Pj4NCj4+Pg0KPj4+IEknZCBzdWdnZXN0IGJ1aWxkaW5nIHlvdXIgY2hhbmdl
cyBhcyBhIG5ldyBwYXRjaCB0aGF0IGRlcGVuZHMgb24gdGhlIGV4aXN0aW5nDQo+Pj4gcGF0Y2gu
ICBUaGVuIGlmIGl0J3MgYXBwcm92ZWQsIHlvdXIgcGF0Y2ggY2FuIGJlIG1lcmdlZC4gIElmIG5v
dCwgeW91IGNhbiBwb3J0DQo+Pj4gdGhlIGNoYW5nZXMgYXMgbmVlZGVkLg0KPj4+DQo+Pj4gVGhh
bmtzLA0KPj4+IC1KYXNvbg0KPj4+DQo+Pj4+IEZvciBleGFtcGxlLCBvdXIgcHJvamVjdCByZXF1
aXJlcyBhICJtZW1vcnkiIHNlbnNvciB0eXBlIGFuZCBhDQo+Pj4+ICJzZW5zb3Itc3BlY2lmaWMi
IGV2ZW50IHR5cGUsIGJ1dCBJIGFtIGNvbmZ1c2VkIGFib3V0IHdoaWNoIHdheSBpcw0KPj4+IGFj
Y2VwdGFibGUuDQo+Pj4+DQo+Pj4+IEJScywNCj4+Pj4gV2lsbC4NCj4+Pj4NCj4NCg==

--_000_2bcbf6920bc14c0fa1826ac5b0bde62fquantatwcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p>Hi Jason,</p>
<p><br>
</p>
<p></p>
<div>Sorry to bother you again.</div>
<div><br>
</div>
<div><span><span>After solving sensor type and event type problem for discr=
ete sensor(memory) , I encountered another issue.</span></span></div>
<div><span><span><span style=3D"font-family: Calibri, Helvetica, sans-serif=
, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, Not=
oColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiS=
ymbols; font-size: 16px;">From the code, it seems only support getting the
 sensor number of threshold-based sensors.</span><br>
</span></span></div>
<div><span>How do I get the sensor&nbsp; number of discrete sensors?</span>=
<br>
</div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont,=
 &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji,=
 &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font=
-size: 16px;"><span>Would you have any
<span style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quo=
t;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quo=
t;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size=
: 16px;">
suggestion or&nbsp;</span>plan&nbsp;to get sensor number of discrete sensor=
s?</span><br>
</span></div>
<div><br>
</div>
<p></p>
BRs,
<div>Will<br>
<div style=3D"color: rgb(0, 0, 0);">
<div>
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr">
<div><br>
</div>
<div><br>
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi Will,<br>
<br>
You are welcome to push changes directly to Gerrit for review.&nbsp; I did =
a <br>
quick check of the code and it looks okay to push with one minor change <br=
>
of THRESHLOD -&gt; THRESHOLD.<br>
<br>
Thanks,<br>
-Jason<br>
<br>
On 3/26/2019 8:28 PM, Will Liang (=B1=E7=A5=C3=B9b) wrote:<br>
&gt; Hi Jason,<br>
&gt; <br>
&gt; I have seen that the code has been resolved from the conflict and I ca=
n <br>
&gt; bitbake it successfully too. Thanks.<br>
&gt; <br>
&gt; As indicated in my previous Email,&nbsp;&nbsp;I need the &quot;memory&=
quot; sensor type and&nbsp; <br>
&gt; &quot;sensor-specific&quot; event type.<br>
&gt; <br>
&gt; Could you please help me to review the following changes.<br>
&gt; <br>
&gt; Andif you don't have any concerns, I will push the code to Gerrit &gt;=
<br>
&gt; sdrutils.hpp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 34 &#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;-------------<br>
&gt; <br>
&gt; sensorhandler.hpp |&nbsp; 8 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<b=
r>
&gt; <br>
&gt; 2 files changed, 29 insertions(&#43;), 13 deletions(-)<br>
&gt; <br>
&gt; diff --git a/sdrutils.hpp b/sdrutils.hpp<br>
&gt; <br>
&gt; index a91f3ea..bff2896 100644<br>
&gt; <br>
&gt; --- a/sdrutils.hpp<br>
&gt; <br>
&gt; &#43;&#43;&#43; b/sdrutils.hpp<br>
&gt; <br>
&gt; @@ -20,9 &#43;20,10 @@<br>
&gt; <br>
&gt; #include &lt;boost/container/flat_map.hpp&gt;<br>
&gt; <br>
&gt; #include &lt;cstring&gt;<br>
&gt; <br>
&gt; #include &lt;phosphor-logging/log.hpp&gt;<br>
&gt; <br>
&gt; -<br>
&gt; <br>
&gt; &#43;#include &lt;types.hpp&gt;<br>
&gt; <br>
&gt; #pragma once<br>
&gt; <br>
&gt; &#43;<br>
&gt; <br>
&gt; #ifdef JOURNAL_SEL<br>
&gt; <br>
&gt; struct CmpStrVersion<br>
&gt; <br>
&gt; {<br>
&gt; <br>
&gt; @@ -74,13 &#43;75,14 @@ struct CmpStr<br>
&gt; <br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; <br>
&gt; };<br>
&gt; <br>
&gt; -const static boost::container::flat_map&lt;const char*, ipmi_sensor_t=
ypes, <br>
&gt; CmpStr&gt;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; sensorTypes{{{&quot;temperature&quot;, IPMI_SENSOR=
_TEMP},<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;voltage&quot;, IPMI_SENSOR_VOLTAGE},<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;current&quot;, IPMI_SENSOR_CURRENT},<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;fan_tach&quot;, IPMI_SENSOR_FAN},<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;fan_pwm&quot;, IPMI_SENSOR_FAN},<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;power&quot;, IPMI_SENSOR_OTHER}}};<br>
&gt; <br>
&gt; &#43;const static boost::container::flat_map&lt;const char*, <br>
&gt; std::pair&lt;ipmi_sensor_types, ipmi_event_types&gt;, CmpStr&gt;<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; sensorAndEventType{{{&quot;temperature&quot;, =
<br>
&gt; std::make_pair(IPMI_SENSOR_TEMP, THRESHLOD)},<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;voltage&quot;, std::make_pair(IPMI_S=
ENSOR_VOLTAGE, <br>
&gt; THRESHLOD)},<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;current&quot;, std::make_pair(IPMI_S=
ENSOR_CURRENT, <br>
&gt; THRESHLOD)},<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;fan_tach&quot;, std::make_pair(IPMI_=
SENSOR_FAN, THRESHLOD)},<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;fan_pwm&quot;, std::make_pair(IPMI_S=
ENSOR_FAN, THRESHLOD)},<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;power&quot;, std::make_pair(IPMI_SEN=
SOR_OTHER, THRESHLOD)},<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;memory&quot;, std::make_pair(IPMI_SE=
NSOR_MEMORY, <br>
&gt; SENSOR_SPECIFIC)}}};<br>
&gt; <br>
&gt;&nbsp; &nbsp;inline static std::string getSensorTypeStringFromPath(cons=
t <br>
&gt; std::string&amp; path)<br>
&gt; <br>
&gt; {<br>
&gt; <br>
&gt; @@ -105,12 &#43;107,11 @@ inline static uint8_t getSensorTypeFromPath(=
const <br>
&gt; std::string&amp; path)<br>
&gt; <br>
&gt; {<br>
&gt; <br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; uint8_t sensorType =3D 0;<br>
&gt; <br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; std::string type =3D getSensorTypeStrin=
gFromPath(path);<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; auto findSensor =3D sensorTypes.find(type.c_str())=
;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; if (findSensor !=3D sensorTypes.end())<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; auto findSensor =3D sensorAndEventType.find(ty=
pe.c_str());<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; if (findSensor !=3D sensorAndEventType.end())<=
br>
&gt; <br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sensorType =3D findSensor-=
&gt;second;<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sensorType =3D findSen=
sor-&gt;second.first;<br>
&gt; <br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; } // else default 0x0 RESERVED<br>
&gt; <br>
&gt; -<br>
&gt; <br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; return sensorType;<br>
&gt; <br>
&gt; }<br>
&gt; <br>
&gt; @@ -128,7 &#43;129,14 @@ inline static uint8_t getSensorNumberFromPath=
(const <br>
&gt; std::string&amp; path)<br>
&gt; <br>
&gt; inline static uint8_t getSensorEventTypeFromPath(const std::string&amp=
; path)<br>
&gt; <br>
&gt; {<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;// TODO: Add support for additional rea=
ding types as needed<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; return 0x1; // reading type =3D threshold<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; uint8_t eventType =3D 0x00;<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; std::string type =3D getSensorTypeStringFromPa=
th(path);<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; auto findSensor =3D sensorAndEventType.find(ty=
pe.c_str());<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; if (findSensor !=3D sensorAndEventType.end())<=
br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; {<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eventType =3D findSens=
or-&gt;second.second;<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; }<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; return eventType; // reading type =3D threshol=
d<br>
&gt; <br>
&gt; }<br>
&gt; <br>
&gt;&nbsp; &nbsp;inline static std::string getPathFromSensorNumber(uint8_t =
sensorNum)<br>
&gt; <br>
&gt; diff --git a/sensorhandler.hpp b/sensorhandler.hpp<br>
&gt; <br>
&gt; index d3b6378..e449076 100644<br>
&gt; <br>
&gt; --- a/sensorhandler.hpp<br>
&gt; <br>
&gt; &#43;&#43;&#43; b/sensorhandler.hpp<br>
&gt; <br>
&gt; @@ -36,6 &#43;36,14 @@ enum ipmi_sensor_types<br>
&gt; <br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; IPMI_SENSOR_FAN =3D 0x04,<br>
&gt; <br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; IPMI_SENSOR_OTHER =3D 0x0B,<br>
&gt; <br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; IPMI_SENSOR_TPM =3D 0xCC,<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; IPMI_SENSOR_MEMORY =3D 0x0C,<br>
&gt; <br>
&gt; &#43;};<br>
&gt; <br>
&gt; &#43;<br>
&gt; <br>
&gt; &#43;enum ipmi_event_types<br>
&gt; <br>
&gt; &#43;{<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; UNSPECIFIED =3D 0x00,<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; THRESHLOD =3D 0x01,<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; SENSOR_SPECIFIC =3D 0x6f,<br>
&gt; <br>
&gt; };<br>
&gt; <br>
&gt;&nbsp; &nbsp;#define MAX_DBUS_PATH 128<br>
&gt; <br>
&gt; BRs,<br>
&gt; <br>
&gt; Will<br>
&gt; <br>
&gt; Hi Will,<br>
&gt; <br>
&gt; On 3/13/2019 5:05 AM, Will Liang (=B1=E7=A5=C3=B9b) wrote:<br>
&gt;&gt; Hi Jason,<br>
&gt;&gt; <br>
&gt;&gt; Thanks for your response!<br>
&gt;&gt; <br>
&gt;&gt; I tried to modify the code, but I encountered some problems after =
pull the code from Gerrit.<br>
&gt;&gt; After I pull your codes and run &quot;bitbake obmc-phosphor-image =
&quot; command.<br>
&gt;&gt; It will shows ERROR: Task (/home/will/openbmc/meta-phosphor/recipe=
s-phosphor/ipmi/phosphor-ipmi-net_git.bb:do_compile) failed with exit code =
'1'<br>
&gt;&gt; Do you have this error? Or what else do I need to do?<br>
&gt; <br>
&gt; Sorry, it's been a while since I built this patch, and there have been=
<br>
&gt; some big changes to ipmid since I pushed it.&nbsp; I'm not able to tes=
t it<br>
&gt; right now, but it may just need to be rebased?<br>
&gt;&gt; <br>
&gt;&gt; I'm sorry, maybe this is a dumb question but I don=A1=A6t understa=
nd how you defined this &quot;JOURNAL_SEL&quot; parameter from *.bbappend?<=
br>
&gt;&gt; I tried it but it still can't run into the #ifdef JOURNAL_SEL part=
.<br>
&gt; <br>
&gt; There are no dumb questions with Yocto. :)&nbsp; You need to add this =
line to<br>
&gt; a phosphor-ipmi-host_%.bbappend:<br>
&gt; EXTRA_OECONF =3D &quot; --with-journal-sel&quot;<br>
&gt; <br>
&gt; That should cause the define to be set by autoconfig during the build.=
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; -Jason<br>
&gt; <br>
&gt;&gt; <br>
&gt;&gt; BRs,<br>
&gt;&gt; Will<br>
&gt;&gt; <br>
&gt;&gt;&gt; Hi Will,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 3/11/2019 12:39 AM, Will Liang (=B1=E7=A5=C3=B9b) wrote:<br=
>
&gt;&gt;&gt;&gt; Hi Jason,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I've reviewed the code you pushed to<br>
&gt;&gt;&gt; gerrit(<a href=3D""></a>https://gerrit.openbmc-project.xyz/#/c=
/openbmc/phosphor-host-ipmid/&#43;<br>
&gt;&gt;&gt; /12951/).<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I'm not sure if the patch will be approved by the maintainers.=
&nbsp; So you are<br>
&gt;&gt;&gt; aware, while it's in review, I have pushed the same code to th=
e intel-ipmi-oem<br>
&gt;&gt;&gt; repository.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; In sdrutils.hpp, the getSensorEventTypeFromPath() is set T=
ODO status.<br>
&gt;&gt;&gt;&gt; If I need other event types and sensor types for my projec=
ts, do I<br>
&gt;&gt;&gt;&gt; have to complete the code and send you the code? Or I just=
 push it myself?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I'd suggest building your changes as a new patch that depends =
on the existing<br>
&gt;&gt;&gt; patch.&nbsp; Then if it's approved, your patch can be merged.&=
nbsp; If not, you can port<br>
&gt;&gt;&gt; the changes as needed.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt; -Jason<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; For example, our project requires a &quot;memory&quot; sen=
sor type and a<br>
&gt;&gt;&gt;&gt; &quot;sensor-specific&quot; event type, but I am confused =
about which way is<br>
&gt;&gt;&gt; acceptable.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; BRs,<br>
&gt;&gt;&gt;&gt; Will.<br>
&gt;&gt;&gt;&gt;<br>
&gt; <br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_2bcbf6920bc14c0fa1826ac5b0bde62fquantatwcom_--
