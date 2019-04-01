Return-Path: <prvs=9877b4cea=George.Hung@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=9877b4cea=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 44XcSs5GCRzDqML
 for <openbmc@lists.ozlabs.org>; Mon,  1 Apr 2019 13:57:09 +1100 (AEDT)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx01.quantatw.com with ESMTP; 01 Apr 2019 10:57:05 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 1 Apr 2019
 10:57:03 +0800
Received: from mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc]) by
 mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc%4]) with mapi id
 15.01.1713.004; Mon, 1 Apr 2019 10:57:03 +0800
From: =?utf-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
CC: Joel Stanley <joel@jms.id.au>, Emily Shaffer <emilyshaffer@google.com>,
 "benjaminfair@google.com" <benjaminfair@google.com>, "ofer.eilon@nuvoton.com"
 <ofer.eilon@nuvoton.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Avi Fishman <avi.fishman@nuvoton.com>, "Tomer
 Maimon" <tomer.maimon@nuvoton.com>
Subject: RE: [PATCH dev-5.0 v1] EDAC: Add Nuvoton NPCM7xx EDAC driver
Thread-Topic: [PATCH dev-5.0 v1] EDAC: Add Nuvoton NPCM7xx EDAC driver
Thread-Index: AQHU5hhS9CtDFosQUEOty5nEiheZuKYmm9og
Date: Mon, 1 Apr 2019 02:57:03 +0000
Message-ID: <1f425e1ca6a74a119d058050a147141a@quantatw.com>
References: <20190329085433.27583-1-george.hung@quantatw.com>
 <980e1d8a-4275-cd33-925f-5d8e9f1a1ade@molgen.mpg.de>
In-Reply-To: <980e1d8a-4275-cd33-925f-5d8e9f1a1ade@molgen.mpg.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24524.003
x-tm-as-result: No--15.995200-0.000000-31
x-tm-as-matchedid: 140026-150567-701625-704425-700685-701153-139010-700075-1
 10462-704421-708060-106230-700476-303277-700756-780048-707997-700767-700398
 -105250-702829-702426-704318-188019-700016-703529-704410-139504-148004-1481
 33-42000-42003-63
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
X-List-Received-Date: Mon, 01 Apr 2019 02:57:19 -0000

RGVhciBQYXVsLA0KDQo+IEZpcnN0IHF1ZXN0aW9uLCBkaWQgeW91IHNlbmQgdGhpcyB1cHN0cmVh
bSBhbHJlYWR5PyBTZWUgZW50cnkgRURBQy1DT1JFDQo+IGluIGBNQUlOVEFJTkVSU2AuDQoNCk5v
LCBJIGRvbid0IHNlbmQgaXQgdG8gdXBzdHJlYW0geWV0Lg0KDQo+IA0KPiBPbiAwMy8yOS8xOSAw
OTo1NCwgR2VvcmdlIEh1bmcgd3JvdGU6DQo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBOdXZvdG9u
IE5QQ003eHggU29DIEVEQUMgZHJpdmVyDQo+IA0KPiBDb3VsZCB5b3UgcGxlYXNlIGFkZCB0aGUg
ZGF0YXNoZWV0IG5hbWUgYW5kIHZlcnNpb24gdG8gdGhlIGNvbW1pdA0KPiBtZXNzYWdlLg0KDQpP
SywgSSB3aWxsIGFkZCB0aGUgZGF0YXNoZWV0IGluZm9ybWF0aW9uIHRvIHRoZSBjb21taXQgbWVz
c2FnZS4NCg0KZGF0YXNoZWV0Og0KIkNhZGVuY2UgRERSIENvbnRyb2xsZXIgVXNlcuKAmXMgTWFu
dWFsIEZvciBERFIzICYgRERSNCBNZW1vcmllcyINCg0KPiBBbHNvLCBob3cgZGlkIHlvdSB0ZXN0
IHRoaXM/DQoNClRoZSBkYXRhc2hlZXQgcHJvdmlkZSB0aGUgZm9yY2luZyBhbiBFQ0MgZXJyb3Ig
ZXZlbnQgbWV0aG9kOg0KDQpXcml0ZSBhIHZhbHVlIHRvIHRoZSB4b3JfY2hlY2tfYml0cyBwYXJh
bWV0ZXIgdGhhdCB3aWxsIHRyaWdnZXIgYW4gRUNDIGV2ZW50DQpvbmNlIHRoYXQgd29yZCBpcyBy
ZWFkLg0KDQpGb3IgZXhhbXBsZSwgdG8gZm9yY2UgYSBzaW5nbGUtYml0IGNvcnJlY3RhYmxlIGVy
cm9yIG9uIGJpdCAwIG9mIHRoZSB1c2VyLXdvcmQgc3BhY2Ugc2hvd24sDQp3cml0ZSAweDc1IGlu
dG8gdGhhdCBieXRlIG9mIHRoZSB4b3JfY2hlY2tfYml0cyBwYXJhbWV0ZXIuDQoobWVtIGJhc2U6
IDB4ZjA4MjQwMDAsIHJlZ2lzdGVyOiAweDE3OCkuDQoNCiMgZGV2bWVtIDB4ZjA4MjQxNzggMzIg
MHg3NTAxDQoNClRvIGZvcmNlIGEgZG91YmxlLWJpdCB1bi1jb3JyZWN0YWJsZSBlcnJvciBmb3Ig
dGhlIHVzZXItd29yZCBzcGFjZSwgd3JpdGUgMHgwMyBpbnRvIHRoYXQNCmJ5dGUgb2YgdGhlIHhv
cl9jaGVja19iaXRzIHBhcmFtZXRlci4NCg0KIyBkZXZtZW0gMHhmMDgyNDE3OCAzMiAweDMwMQ0K
DQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBIdW5nIDxnZW9yZ2UuaHVuZ0BxdWFudGF0
dy5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9lZGFjL25wY203eHgtc2RyYW0tZWRh
Yy50eHQgICAgICB8ICAxNyArDQo+ID4gIGRyaXZlcnMvZWRhYy9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgNyArDQo+ID4gIGRyaXZlcnMvZWRhYy9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ID4gIGRyaXZlcnMvZWRhYy9ucGNtN3h4X2VkYWMu
YyAgICAgICAgICAgICAgICAgICB8IDQyNA0KPiArKysrKysrKysrKysrKysrKysNCj4gPiAgNCBm
aWxlcyBjaGFuZ2VkLCA0NDkgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQN
Cj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2VkYWMvbnBjbTd4eC1zZHJhbS1l
ZGFjLnR4dA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9lZGFjL25wY203eHhfZWRh
Yy5jDQo+IA0KPiBDb3VsZCB5b3UgcGxlYXNlIGFsc28gYWRkIGFuIGVudHJ5IHRvIHRoZSBmaWxl
IGBNQUlOVEFJTkVSU2A/DQoNClllcywgSSB3aWxsIGFkZCB0aGUgZmlsZSwgYE1BSU5UQUlORVJT
YCB0byB0aGUgcGF0Y2guDQoNCj4gDQo+IFvigKZdDQo+IA0KPiANCj4gS2luZCByZWdhcmRzLA0K
PiANCj4gUGF1bA0KDQpCUnMNCg0KR2VvcmdlDQoNCg==
