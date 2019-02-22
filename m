Return-Path: <prvs=949bf1414=Will.Liang@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=949bf1414=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 445Nkw2QdxzDqPF
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 18:48:54 +1100 (AEDT)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 22 Feb 2019 15:48:52 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Fri, 22 Feb
 2019 15:48:50 +0800
Received: from mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381]) by
 mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381%11]) with mapi id
 15.01.1531.004; Fri, 22 Feb 2019 15:48:50 +0800
From: =?utf-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
To: "Stefan Schaeckeler (sschaeck)" <sschaeck@cisco.com>, Andrew Jeffery
 <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: ECC memory of BMC  
Thread-Topic: ECC memory of BMC  
Thread-Index: AQHUya1p/FCQCnvcCUCqyg3eXim5w6XpT5IAgACIXkGAABtkgIAA2LuAgACiq+A=
Date: Fri, 22 Feb 2019 07:48:50 +0000
Message-ID: <2cac43305f8044ff8f94e372b30da637@quantatw.com>
References: <88e05768447d466ca674e12e20c650dc@quantatw.com>
 <96605da0-113a-4d43-994a-f081f30af71e@www.fastmail.com>
 <66dac7974c444060a9b4b1052b00d072@quantatw.com>
 <A87B34D9-87E4-4F33-BA6F-2ACBE10DE593@cisco.com>
 <B5923117-0BB8-4728-9C9F-E8977EE096BF@cisco.com>
In-Reply-To: <B5923117-0BB8-4728-9C9F-E8977EE096BF@cisco.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24446.003
x-tm-as-result: No--17.012800-0.000000-31
x-tm-as-matchedid: 140026-150567-701625-704425-700685-139010-110462-707410-7
 07825-139705-703523-700752-121133-701604-705102-701708-700648-704980-701914
 -186035-105250-708060-701305-708797-701066-703529-702358-701433-706249-7026
 40-121504-121270-711664-708257-704156-188198-105700-707760-139704-702067-85
 2387-700107-707467-700756-148004-148133-20020-20043-42000-42003-63
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
X-List-Received-Date: Fri, 22 Feb 2019 07:48:58 -0000

DQo+IA0KPiBIZWxsbyBXaWxsLA0KPiANCj4gDQo+IE9uZSBtb3JlIHRoaW5nIGFib3V0IGVuYWJs
aW5nIEVDQzoNCj4gDQo+ID4gRUNDIG5lZWRzIHRvIGJlIGVuYWJsZWQgaW4gdS1ib290LiBUaGUg
cmVhc29uIGlzIGV4cGxhaW5lZCBpbiBteSBmaXJzdA0KPiA+IHVwbG9hZCBodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3BhdGNoLzEwNzMyNzY5Lw0KPiA+DQo+ID4gT3VyIHUtYm9vdCBlbmdp
bmVlciBkaWQgaXQgZm9yIHVzLiBJIHNlZSB1LWJvb3QgY29kZSBpcyBmdWxsIG9mICNpZmRlZg0K
PiBDT05GSUdfRFJBTV9FQ0MgYmxvY2tzLg0KPiA+IEluIHRoZW9yeSwgZW5hYmxpbmcgdGhpcyBv
cHRpb24gc2hvdWxkIGJlIGVub3VnaC4NCj4gPg0KPiA+DQo+ID4gLSBBIGdvb2QgaW5kaWNhdGlv
biBvZiBoYXZpbmcgRUNDIHN1Y2Nlc3NmdWxseSBlbmFibGVkIGlzIGxpbnV4IGFjdHVhbGx5DQo+
IGJvb3RpbmcuDQo+ID4gLSBBbm90aGVyIGluZGljYXRpb24gaXMgYXZhaWxhYmxlIG1lbW9yeSBi
ZWluZyA4Lzl0aCBvZiB3aGF0IGl0IHVzZWQNCj4gPiB0byBiZSAoY2hlY2sgL3Byb2MvbWVtaW5m
bykNCj4gPiAtIFRoZW4sIG15IGRyaXZlciBzaG91bGQgbm90IGxvZyBhbnkgZXJyb3JzIGluIGl0
cyBwcm9iZSBmdW5jdGlvbiAoY2hlY2sNCj4gZG1lc2cpLg0KPiANCj4gDQo+IFdoaWxlIHlvdSBo
YXZlIG5vdCBzZXQgdXAgRUNDIG1vZGUgaW4gdS1ib290IHlldCwgeW91IG1pZ2h0IGJlIGFibGUg
dG8gdXNlDQo+IHRoZSBlZGFjIGRyaXZlciBieSByZW1vdmluZyB0aGUgZm9sbG93aW5nIGNvZGUg
aW4gYXNwZWVkX3Byb2JlKCkNCj4gDQo+IAkvKiBiYWlsIG91dCBpZiBFQ0MgbW9kZSBpcyBub3Qg
Y29uZmlndXJlZCAqLw0KPiAJcmVnbWFwX3JlYWQoYXNwZWVkX3JlZ21hcCwgQVNQRUVEX01DUl9D
T05GLCAmcmVnMDQpOw0KPiAJaWYgKCEocmVnMDQgJiBBU1BFRURfTUNSX0NPTkZfRUNDKSkgew0K
PiAJCWRldl9lcnIoJnBkZXYtPmRldiwgIkVDQyBtb2RlIGlzIG5vdCBjb25maWd1cmVkIGluIHUt
Ym9vdFxuIik7DQo+IAkJcmV0dXJuIC1FUEVSTTsNCj4gCX0NCj4gDQo+IFRoaXMgd2lsbCBydW4g
dGhlIHByb2JlIGZ1bmN0aW9uIGhvcGVmdWxseSB0byB0aGUgZW5kIGFuZCBleHBvc2UgdGhlIHN5
c2ZzDQo+IG5vZGVzLg0KPiBJIGhhdmUgbm90IHRlc3RlZCBpdC4gTWF5YmUgeW91IG5lZWQgdG8g
ZnVydGhlciBidXRjaGVyIGRvd24gdGhlIGRyaXZlcj8NCj4gDQo+IA0KPiBZb3UgY2FuIHRoZW4g
aW5qZWN0IGZha2UgZWNjIGVycm9ycyB2aWEgdGhlIGtlcm5lbCBkZWJ1ZyBmcmFtZXdvcms6DQo+
IA0KPiByb290QGFzcGVlZC1hcm06LyMgZWNobyA0MiA+IC9zeXMva2VybmVsL2RlYnVnL2VkYWMv
bWMwL2Zha2VfaW5qZWN0DQo+IA0KPiByb290QGFzcGVlZC1hcm06LyMgZG1lc2cgfCB0YWlsIC0x
DQo+IFsgIDI5My4wMjAwMDBdIEVEQUMgTUMwOiAxIENFIEZBS0UgRVJST1Igb24gbWMjMGNzcm93
IzBjaGFubmVsIzANCj4gKGNzcm93OjAgY2hhbm5lbDowIHBhZ2U6MHgwIG9mZnNldDoweDAgZ3Jh
aW46MCBzeW5kcm9tZToweDAgLSBmb3IgRURBQw0KPiB0ZXN0aW5nIG9ubHkpDQo+IA0KPiByb290
QGFzcGVlZC1hcm06LyMgY2F0IC9zeXMvZGV2aWNlcy9zeXN0ZW0vZWRhYy9tYy9tYzAvY2UqDQo+
IDENCj4gMA0KPiANCj4gDQo+IEJUVywgaGVyZSBhcmUgbXkgbm90ZXMgb24gRURBQyBhbmQgRUND
IG9uIEFzcGVlZCB3aGljaCB5b3UgbWlnaHQgZmluZA0KPiBpbnRlcmVzdGluZzogaHR0cDovL3N0
dWRlbnRzLmVuZ3Iuc2N1LmVkdS9+c3NjaGFlY2svbWlzYy9hc3BlZWQtZWRhYy5odG1sDQo+IA0K
PiANCj4gDQo+IEhvcGUgdGhhdCBoZWxwcywgU3RlZmFuDQoNCkhpIFN0ZWZhbiwNCg0KVGhhbmtz
IGZvciB0aGUgdXBkYXRlZCBpbmZvcm1hdGlvbi4NCkluc3RlYWQgb2YgZXh0ZW5kaW5nIHRoZSBr
ZXJuZWwgc3BhY2UsIHdlIGFyZSBkZXZlbG9waW5nIHNlcnZpY2VzIGluIHVzZXIgc3BhY2UuDQoN
CldpbGwNCg==
