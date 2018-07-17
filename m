Return-Path: <Avi.Fishman@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=avi.fishman@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VDfj4XGtzF3Hb
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 18:56:42 +1000 (AEST)
Received: from NTILML02.nuvoton.com (212.199.177.21.static.012.net.il
 [212.199.177.21])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w6H8QZNl029757
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 11:26:36 +0300
Received: from NTILML02.nuvoton.com (10.190.1.47) by NTILML02.nuvoton.com
 (10.190.1.47) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Tue, 17 Jul
 2018 11:56:34 +0300
Received: from NTILML02.nuvoton.com ([::1]) by NTILML02.nuvoton.com ([::1])
 with mapi id 15.00.1130.005; Tue, 17 Jul 2018 11:56:34 +0300
From: <Avi.Fishman@nuvoton.com>
To: <eajames@linux.vnet.ibm.com>, <avifishman70@gmail.com>
CC: <akashgj91@gmail.com>, <openbmc@lists.ozlabs.org>,
 <Uri.Trichter@nuvoton.com>, <Eyal.Cohen@nuvoton.com>,
 <LCCHEN@nuvoton.com>, <KWLIU@nuvoton.com>
Subject: RE: KVM Support?
Thread-Topic: KVM Support?
Thread-Index: AQHUHM8yXgqQr5aCaEuFETbhETC76qSRr26AgAAQWICAAAqbgIABT+0Q
Date: Tue, 17 Jul 2018 08:56:34 +0000
Message-ID: <161fc7e4e5e84892ae34d5e3979bc775@NTILML02.nuvoton.com>
References: <CAE33tLHVuuMgcEQw1xkGP+H1h_Gxq1Vf0Re2SKjVbPhiAgkxNQ@mail.gmail.com>
 <8df2b64e-b903-caa8-f439-96128f3c9b19@linux.vnet.ibm.com>
 <CAKKbWA7i884rXOd2nKnMKRoOB-sbzwK7YQENGYWiGze-qbN9WA@mail.gmail.com>
 <0b9a54bd-8a52-b24f-fc21-e38940c01e31@linux.vnet.ibm.com>
In-Reply-To: <0b9a54bd-8a52-b24f-fc21-e38940c01e31@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.191.10.146]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Jul 2018 15:02:10 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 08:56:48 -0000

SGkgRWRkaWUsDQoNCjEuIFdoZXJlIGlzIHRoZSBKUEVHIEhXIGNvbXByZXNzaW9uIGlzIGRvbmU/
DQphLiBJcyBpdCBpbiB0aGUgVjRMIGRyaXZlcjsgdGhlIFY0TCByZWFkcyB0aGUgZnJhbWUgYnVm
ZmVyIGNvbXByZXNzIGl0IGFuZCBzZW5kIGl0IHZpYSByZWFkKCk/DQpiLiBPciB0aGUgVjRMIHJl
YWRzIHRoZSBmcmFtZSBidWZmZXIgc2VuZCBpdCB2aWEgcmVhZCgpIGFuZCBhbm90aGVyIGRyaXZl
ciBjb21wcmVzcyBpdCBmb3IgdGhlIFZOQyBzZXJ2ZXI/DQoyLiBTaW5jZSBWTkMgUkZCIHN1cHBv
cnRzIGFsc28gb3RoZXIgY29tcHJlc3Npb24gcHJvdG9jb2xzLCBjYW4gd2UgdXNlIG90aGVyIHBy
b3RvY29sIHRoYW4gSlBFRz8gSGV4dGlsZSBmb3IgZXhhbXBsZS4NCjMuIENhbiB3ZSBzZWUgdGhp
cyBkcml2ZXIgYW5kIGFwcGxpY2F0aW9uIGNvZGUgc28gd2UgY2FuIGFkb3B0IHRvIG91ciBIVz8N
Cg0KUmVnYXJkcywNCkF2aQ0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBF
ZGRpZSBKYW1lcyBbbWFpbHRvOmVhamFtZXNAbGludXgudm5ldC5pYm0uY29tXQ0KU2VudDogTW9u
ZGF5LCBKdWx5IDE2LCAyMDE4IDY6MzkgUE0NClRvOiBBdmkgRmlzaG1hbg0KQ2M6IGFrYXNoZ2o5
MUBnbWFpbC5jb207IE9wZW5CTUMgTWFpbGxpc3Q7IElWMDAgVXJpIFRyaWNodGVyOyBJUzIwIEV5
YWwgQ29oZW4NClN1YmplY3Q6IFJlOiBLVk0gU3VwcG9ydD8NCg0KDQoNCk9uIDA3LzE2LzIwMTgg
MTA6MDEgQU0sIEF2aSBGaXNobWFuIHdyb3RlOg0KPiBIaSBFZGRpZSwNCj4NCj4gSXMgaXQgYmFz
ZWQgb24gVjRMIG9yIGFsc28gVk5DPw0KPiBEb2VzIGl0IGhhdmUgSFcgY29tcHJlc3Npb24gb3Ig
U1cgb25seT8NCg0KSGksDQoNClRoZSBkcml2ZXIgaW50ZXJmYWNlIGlzIFY0TDIsIHRob3VnaCBJ
IGFtIGp1c3QgdXNpbmcgcmVhZCgpIGNhbGxzIHJhdGhlcg0KdGhhbiB0aGUgc3RyZWFtaW5nIGlu
dGVyZmFjZS4NClRoZSBuZXR3b3JrIGludGVyZmFjZSBpcyBWTkMsIGRpcmVjdGx5IHNlbmRpbmcg
SlBFR3MgdG8gdGhlIGNsaWVudHMNCnJhdGhlciB0aGFuIHVzaW5nIHRoZSBub3JtYWwgVk5DIGZy
YW1lYnVmZmVyIHVwZGF0ZSBtZXRob2RzLg0KDQpDb21wcmVzc2lvbiBpcyBkb25lIGluIEhXLCBh
bmQgdGhlbiBkZWNvbXByZXNzaW9uIGF0IHRoZSBjbGllbnQuIFNvIENQVQ0KdXNhZ2Ugb24gdGhl
IEJNQyBpcyBrZXB0IGxvdywgdGhvdWdoIGJhbmR3aWR0aCB1c2FnZSBpcyBwcmV0dHkgaGlnaA0K
YmVjYXVzZSBpdCBzZW5kcyB0aGUgd2hvbGUgZnJhbWUgZXZlcnkgdGltZS4gU2VlbXMgdG8gd29y
ayB3aXRoIGFueSBWTkMNCmNsaWVudCB0aGF0IHN1cHBvcnRzIEpQRUcgY29tcHJlc3Npb24uDQoN
CkknbSBjdXJyZW50bHkgd29ya2luZyB0aHJvdWdoIHNvbWUgaW5wdXQgbGF0ZW5jeSBwcm9ibGVt
czsgc2VlbXMgdGhlDQpiYW5kd2lkdGggdXNhZ2UgZm9yIHRoZSBmcmFtZXMgY2F1c2VzIGh1Z2Ug
ZGVsYXlzIGZvciBzZW5kaW5nIHRoZSBpbnB1dA0KZXZlbnRzIGZyb20gdGhlIGNsaWVudCB0byB0
aGUgc2VydmVyLiBPdGhlciB0aGFuIHRoYXQgaXQncyB3b3JraW5nIHdlbGwuDQoNClRoYW5rcywN
CkVkZGllDQoNCj4NCj4gVGhhbmtzLA0KPiBBdmkNCj4gT24gTW9uLCBKdWwgMTYsIDIwMTggYXQg
NTowMyBQTSBFZGRpZSBKYW1lcyA8ZWFqYW1lc0BsaW51eC52bmV0LmlibS5jb20+IHdyb3RlOg0K
Pj4NCj4+DQo+PiBPbiAwNy8xNi8yMDE4IDAxOjM0IEFNLCBBS0FTSCBHIEogd3JvdGU6DQo+Pj4g
SGkgVGVhbSwNCj4+Pg0KPj4+IFBsZWFzZSBzb21lb25lIHNoYXJlIHdoZXRoZXIgS2V5Ym9hcmQg
VmlkZW8gTW91c2UgKEtWTSkgb3ZlciBJUA0KPj4+IGltcGxlbWVudGF0aW9uIGF2YWlsYWJsZSBp
biBPcGVuQk1DID8NCj4+IEhpIEFrYXNoLA0KPj4NCj4+IEl0J3MgaW4gZGV2ZWxvcG1lbnQuLi4g
SWYgeW91IHdhbnQgdG8gaGVscCwgbGV0IG1lIGtub3chIEknbGwgYmUNCj4+IHVwZGF0aW5nIHRo
ZSBtYWlsaW5nIGxpc3Qgd2l0aCBkcml2ZXJzLCBldGMsIHdoZW4gaXQncyBtb3JlIGZ1bmN0aW9u
YWwuDQo+Pg0KPj4gVGhhbmtzLA0KPj4gRWRkaWUNCj4+DQo+Pj4NCj4+Pg0KPj4+IFRoYW5rcyBh
bmQgUmVnYXJkcywNCj4+Pg0KPj4+IEFrYXNoDQoNCg0KDQo9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09DQpUaGUgcHJpdmlsZWdlZCBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gY29u
dGFpbmVkIGluIHRoaXMgZW1haWwgaXMgaW50ZW5kZWQgZm9yIHVzZSBvbmx5IGJ5IHRoZSBhZGRy
ZXNzZWVzIGFzIGluZGljYXRlZCBieSB0aGUgb3JpZ2luYWwgc2VuZGVyIG9mIHRoaXMgZW1haWwu
IElmIHlvdSBhcmUgbm90IHRoZSBhZGRyZXNzZWUgaW5kaWNhdGVkIGluIHRoaXMgZW1haWwgb3Ig
YXJlIG5vdCByZXNwb25zaWJsZSBmb3IgZGVsaXZlcnkgb2YgdGhlIGVtYWlsIHRvIHN1Y2ggYSBw
ZXJzb24sIHBsZWFzZSBraW5kbHkgcmVwbHkgdG8gdGhlIHNlbmRlciBpbmRpY2F0aW5nIHRoaXMg
ZmFjdCBhbmQgZGVsZXRlIGFsbCBjb3BpZXMgb2YgaXQgZnJvbSB5b3VyIGNvbXB1dGVyIGFuZCBu
ZXR3b3JrIHNlcnZlciBpbW1lZGlhdGVseS4gWW91ciBjb29wZXJhdGlvbiBpcyBoaWdobHkgYXBw
cmVjaWF0ZWQuIEl0IGlzIGFkdmlzZWQgdGhhdCBhbnkgdW5hdXRob3JpemVkIHVzZSBvZiBjb25m
aWRlbnRpYWwgaW5mb3JtYXRpb24gb2YgTnV2b3RvbiBpcyBzdHJpY3RseSBwcm9oaWJpdGVkOyBh
bmQgYW55IGluZm9ybWF0aW9uIGluIHRoaXMgZW1haWwgaXJyZWxldmFudCB0byB0aGUgb2ZmaWNp
YWwgYnVzaW5lc3Mgb2YgTnV2b3RvbiBzaGFsbCBiZSBkZWVtZWQgYXMgbmVpdGhlciBnaXZlbiBu
b3IgZW5kb3JzZWQgYnkgTnV2b3Rvbi4NCg==
