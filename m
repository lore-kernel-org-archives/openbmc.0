Return-Path: <prvs=95537dfa2=Fran.Hsu@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=95537dfa2=fran.hsu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4497yz4K7TzDqHh
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 21:27:21 +1100 (AEDT)
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx01.quantatw.com with ESMTP; 28 Feb 2019 18:27:18 +0800
Received: from mailbx06.quanta.corp (10.243.91.101) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Thu, 28 Feb
 2019 18:27:17 +0800
Received: from mailbx06.quanta.corp ([fe80::c71:d9b4:b8c2:41c1]) by
 mailbx06.quanta.corp ([fe80::c71:d9b4:b8c2:41c1%5]) with mapi id
 15.01.1531.004; Thu, 28 Feb 2019 18:27:17 +0800
From: =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>
To: =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH dev-4.19 v3] Fix the name of the include file. It is a
 typo. Signed-off-by: FranHsu <Fran.Hsu@quantatw.com>
Thread-Topic: [PATCH dev-4.19 v3] Fix the name of the include file. It is a
 typo. Signed-off-by: FranHsu <Fran.Hsu@quantatw.com>
Thread-Index: AQHUzoIvSmaWHTs6kU+xaSoLT8yZo6XzygAAgAE5CiA=
Date: Thu, 28 Feb 2019 10:27:16 +0000
Message-ID: <1bfe3d66aa2345dfa1f65310663e263a@quantatw.com>
References: <20190227095233.6655-1-fran.hsu@quantatw.com>
 <3b16cffb-c442-4b1e-aed0-7c45157967e7@www.fastmail.com>
In-Reply-To: <3b16cffb-c442-4b1e-aed0-7c45157967e7@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24460.000
x-tm-as-result: No--14.090100-0.000000-31
x-tm-as-matchedid: 140026-150567-150658-701625-704425-700685-712203-700075-1
 39010-106230-700401-700107-701016-700270-188019-863519-711871-708712-148004
 -148133-20043-42000-42003-63
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
X-List-Received-Date: Thu, 28 Feb 2019 10:27:24 -0000

T24gV2VkLCAyNyBGZWIgMjAxOSwgYXQgMjA6MjYsIGZyYW4uaHN1QHF1YW50YXR3LmNvbSB3cm90
ZToNCj4gRnJvbTogRnJhbkhzdSA8RnJhbi5Ic3VAcXVhbnRhdHcuY29tPg0KPiANCg0KTWlzc2lu
ZyB0aGUgU2lnbmVkLW9mZi1ieSBsaW5lLg0KDQpIb3dldmVyLCB0aGlzIHBhdGNoIHNob3VsZCBi
ZSBzcXVhc2hlZCBpbnRvIHBhdGNoIDEuIFBsZWFzZQ0KZG8gc28gYW5kIHNlbmQgYSB2Mi4NCg0K
Q2hlZXJzLA0KDQpBbmRyZXcNCkhpIEFuZHJldywNCglUaGFua3MsDQo+IC0tLQ0KPiAgYXJjaC9h
cm0vYm9vdC9kdHMvbnV2b3Rvbi1ucGNtNzMwLWdzai5kdHMgfCAyICstDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9h
cmNoL2FybS9ib290L2R0cy9udXZvdG9uLW5wY203MzAtZ3NqLmR0cyANCj4gYi9hcmNoL2FybS9i
b290L2R0cy9udXZvdG9uLW5wY203MzAtZ3NqLmR0cw0KPiBpbmRleCA0MTEzODdlZTJmNjIuLjk5
OGE3ZDQ1MWI3ZCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi1ucGNt
NzMwLWdzai5kdHMNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi1ucGNtNzMwLWdz
ai5kdHMNCj4gQEAgLTMsNyArMyw3IEBADQo+ICANCj4gIC9kdHMtdjEvOw0KPiAgI2luY2x1ZGUg
Im51dm90b24tbnBjbTczMC5kdHNpIg0KPiAtI2luY2x1ZGUgIm51dm90b24tbnBjbTczMy1nc2ot
Z3Bpby5kdHNpIg0KPiArI2luY2x1ZGUgIm51dm90b24tbnBjbTczMC1nc2otZ3Bpby5kdHNpIg0K
PiAgLyB7DQo+ICAJbW9kZWwgPSAiUXVhbnRhIEdTSiBCb2FyZCAoRGV2aWNlIFRyZWUgdjIpKSI7
DQo+ICAJY29tcGF0aWJsZSA9ICJudXZvdG9uLG5wY203NTAiOw0KPiAtLSANCj4gMi4yMS4wDQo+
IA0KPg0K
