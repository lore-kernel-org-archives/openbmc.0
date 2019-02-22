Return-Path: <prvs=949bf1414=Will.Liang@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=949bf1414=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 445M922M4JzDqSx
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 17:37:57 +1100 (AEDT)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 22 Feb 2019 14:37:12 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Fri, 22 Feb
 2019 14:37:10 +0800
Received: from mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381]) by
 mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381%11]) with mapi id
 15.01.1531.004; Fri, 22 Feb 2019 14:37:10 +0800
From: =?utf-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Stefan M Schaeckeler <sschaeck@cisco.com>
CC: "dkodihal@in.ibm.com" <dkodihal@in.ibm.com>
Subject: RE: ECC memory of BMC  
Thread-Topic: ECC memory of BMC  
Thread-Index: AQHUya1p/FCQCnvcCUCqyg3eXim5w6XpT5IAgACIXkGAAJmggIAAlZbQ///E8wCAAADGAIAAj1KA
Date: Fri, 22 Feb 2019 06:37:10 +0000
Message-ID: <ba8b8543707747e191fbf64cb3f81619@quantatw.com>
References: <88e05768447d466ca674e12e20c650dc@quantatw.com>
 <96605da0-113a-4d43-994a-f081f30af71e@www.fastmail.com>
 <66dac7974c444060a9b4b1052b00d072@quantatw.com>
 <8b3b8d3a-9cf5-4f7d-9993-e71fd3cd6e07@www.fastmail.com>
 <8f0d3dec56434a0484f6d5172c036ed4@quantatw.com>
 <EC804DC2-940C-431E-A358-B803CDE93F5C@cisco.com>
 <f2602a79-6d08-4154-936d-d23e5641a7ec@www.fastmail.com>
In-Reply-To: <f2602a79-6d08-4154-936d-d23e5641a7ec@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24446.003
x-tm-as-result: No--22.013900-0.000000-31
x-tm-as-matchedid: 140026-150567-701625-704425-700685-139010-139006-851218-7
 04746-852387-701490-700574-106660-700075-110462-702034-708712-702358-701395
 -704927-703674-704341-700476-708060-701928-703179-188019-711664-121338-1860
 35-780022-709584-707519-703523-701305-704171-148004-148133-20043-42000-4200
 3-63-190014
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
X-List-Received-Date: Fri, 22 Feb 2019 06:37:59 -0000

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IEplZmZl
cnkgW21haWx0bzphbmRyZXdAYWouaWQuYXVdDQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMjIs
IDIwMTkgMTo1NSBQTQ0KPiBUbzogV2lsbCBMaWFuZyAo5qKB5rC46YmJKSA8V2lsbC5MaWFuZ0Bx
dWFudGF0dy5jb20+Ow0KPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IFN0ZWZhbiBNIFNjaGFl
Y2tlbGVyIDxzc2NoYWVja0BjaXNjby5jb20+DQo+IENjOiBka29kaWhhbEBpbi5pYm0uY29tDQo+
IFN1YmplY3Q6IFJlOiBFQ0MgbWVtb3J5IG9mIEJNQw0KPiANCj4gT24gRnJpLCAyMiBGZWIgMjAx
OSwgYXQgMTY6MjIsIFN0ZWZhbiBTY2hhZWNrZWxlciAoc3NjaGFlY2spIHdyb3RlOg0KPiA+IEhp
IFdpbGwsDQo+ID4NCj4gPiDvu79PbiAyLzIxLzE5LCA2OjAwIFBNLCAiV2lsbCBMaWFuZyAo5qKB
5rC46YmJKSIgPFdpbGwuTGlhbmdAcXVhbnRhdHcuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+ID4g
PiA+IFdoYXQgd2Ugd2FudCB0byBkbyBpcyB0byByZWNvcmQgdGhlIEVDQyBldmVudHMgdG8gU0VM
Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gd2UgYXJlIGNvbnNpZGVyaW5nIHRvIGNyZWF0ZSBuZXcg
ZGJ1cyBhbmQgYSBzZXJ2aWNlLg0KPiA+ID4gPg0KPiA+ID4gPiBSaWdodDsgSSB0aGluayB5b3Ug
bmVlZCB0byBjcmVhdGUgYSBuZXcgc2VydmljZSB0aGF0IHBvbGxzIHRoZQ0KPiA+ID4gPiBzeXNm
cyBpbnRlcmZhY2UgZm9yIHRoZSBFREFDIGRldmljZSwgYW5kIHRoZW4gdXNlIHBob3NwaG9yLWxv
Z2dpbmcgdG8NCj4gY3JlYXRlIGVycm9yIGxvZ3MuDQo+ID4gPg0KPiA+ID4gV2UgY29uc2lkZXIg
Y3JlYXRpbmcgdGhlIGZvbGxvd2luZyBvYmplY3RzIGZvciBELUJ1czoNCj4gPiA+IC1idXMgbmFt
ZSA6IC94eXovb3BlbmJtY19wcm9qZWN0L0VDQyAtb2JqZWN0IHBhdGggOg0KPiA+ID4gL3h5ei9v
cGVuYm1jX3Byb2plY3QvRUNDL3N0YXR1cyAtaW50ZXJmYWNlIDoNCj4gPiA+IHh5ei5vcGVuYm1j
X3Byb2plY3QuTWVtb3J5Lk1lbW9yeUVDQw0KPiA+ID4NCj4gPiA+IGFuZCBlcnJvciB0eXBlcyBm
b3IgeHl6OjpvcGVuYm1jX3Byb2plY3Q6Ok1lbW9yeTo6RWNjOjpFcnJvcjo6Y2VDb3VudA0KPiBh
bmQgInVlQ291bnQiDQo+ID4gPiBhbmQgImlzTG9nZ2luZ0xpbWl0UmVhY2hlZCIgZm9yIHBob3Nw
aG9yLWxvZ2dpbmcgZXJyb3IgbWVzc2FnZS4NCj4gPg0KPiA+DQo+ID4gTm90ZSwgdGhlIGRyaXZl
ciBhbHNvIGxvZ3MgdGhlIGFkZHJlc3NlcyBvZiB0aGUgcmVjb3ZlcmFibGUgYW5kDQo+ID4gdW4t
cmVjb3ZlcmFibGUgZXJyb3JzLiBQZXJoYXBzIHlvdSB3YW50IHRvIGV4cG9zZSB0aGVtLCB0b28/
DQo+ID4NCj4gPiBUaGUgZWRhYyBmcmFtZXdvcmsgaXMgdW5mb3J0dW5hdGVseSBub3QgZXhwb3Np
bmcgdGhlbSB0aHJvdWdoIHN5c2ZzLg0KPiA+IFRoZXkgZ2V0IHByaW50ZWQgdGhyb3VnaCAiZWRh
Y19tY19oYW5kbGVfZXJyb3IoKSIgYXMNCj4gPiBwcmludGsoS0VSTl9XQVJOSU5HLCAuLi4pIGFu
ZCBsb29rIGxpa2UNCj4gPg0KPiA+IHJvb3RAYXNwZWVkLWFybTojIGRtZXNnIHwgZ3JlcCBFREFD
DQo+ID4gWyAxNzE4LjkwMDAwMF0gRURBQyBNQzA6IDEgQ0UgYWRkcmVzcyhlcykgbm90IGF2YWls
YWJsZSBvbg0KPiA+IG1jIzBjc3JvdyMwY2hhbm5lbCMwIChjc3JvdzowIGNoYW5uZWw6MCBwYWdl
OjB4MCBvZmZzZXQ6MHgwIGdyYWluOjANCj4gPiBzeW5kcm9tZToweDApDQo+ID4gWyAxNzE4Ljkw
MDAwMF0gRURBQyBNQzA6IDEgQ0Ugb24gbWMjMGNzcm93IzBjaGFubmVsIzAgKGNzcm93OjANCj4g
PiBjaGFubmVsOjAgcGFnZToweDgwMDAwIG9mZnNldDoweDAgZ3JhaW46MCBzeW5kcm9tZToweDAp
DQo+ID4NCj4gPg0KPiA+IEknbSBub3Qgc3VyZSBpZiB0aGVyZSBpcyBhbiBlbGVnYW50IHdheSBm
b3IgdXNlcnNwYWNlIHRvIHJldHJpZXZlIG1lc3NhZ2VzDQo+IGZyb20NCj4gPiB0aGUga2VybmVs
IHJpbmcgYnVmZmVyLg0KPiA+DQo+IA0KPiBMZXRzIG5vdCBzdGFydCBzY3JhcGluZyBkbWVzZy4g
SXQncyBub3QgY29uc2lkZXJlZCBwYXJ0IG9mIHRoZSBrZXJuZWwgQUJJLg0KDQpXZSBkbyBub3Qg
ZXhwb3NlIGVycm9yIG1lc3NhZ2UgZnJvbSBFREFDIGRyaXZlci4gDQoNCldlIG9ubHkgd2FudCB0
byBmZXRjaCByZWNvdmVyYWJsZS91bi1yZWNvdmVyYWJsZSBjb3VudHMgYW5kIHJlY29yZCB0aGUg
RUNDIGxvZy4NClRoZXJlZm9yZSwgd2UgbmVlZCBhIHNlcnZpY2UgdG8gcG9sbCB0aGUgRURBQyBk
cml2ZXIuDQoNCldpbGwNCg==
