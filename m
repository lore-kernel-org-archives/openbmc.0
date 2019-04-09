Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.13; helo=cpsmtpb-ews08.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="r+69ZvA4"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews08.kpnxchange.com (cpsmtpb-ews08.kpnxchange.com
 [213.75.39.13])
 by lists.ozlabs.org (Postfix) with ESMTP id 44dpnJ3HcMzDqFh
 for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2019 23:59:30 +1000 (AEST)
Received: from cpsps-ews18.kpnxchange.com ([10.94.84.184]) by
 cpsmtpb-ews08.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Tue, 9 Apr 2019 15:59:25 +0200
X-Brand: 4ZrJ
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=CfzZG4jl c=1 sm=1 tr=0 cx=a_idp_e
 a=4/rmT19p7yX2nqNQQg5uwQ==:117 a=4/rmT19p7yX2nqNQQg5uwQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=eIHzyqS2sMcA:10 a=IkcTkHD0fZMA:10
 a=xqWC_Br6kY4A:10 a=oexKYjalfGEA:10 a=VnNF1IyMAAAA:8 a=X5F7dNyOAAAA:8
 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=peDeANYtAAAA:20
 a=eC13HPxcIMaYcxWhQcsA:9 a=QEXdDO2ut3YA:10 a=pS7LufLo7ZPxIL5li5Lt:22
 a=IC2XNlieTeVoXbcui8wp:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.44]) by cpsps-ews18.kpnxchange.com
 over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 9 Apr 2019 15:59:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=mime-version:content-type:message-id:date:subject:to:from;
 bh=VwnZWoLQ2Irl7g2kdKoD+XZzp8Oc6dn4cFpHyyRdHm0=;
 b=r+69ZvA4o1iYSicZIfFZTRGm1NLvJBhnoJKOgb1SzvEGSGPH2UN3bkkn7/D5Mzr96PbI4omO82cU0
 BclAYLZGjVb8E1eU0VvBrtu8993MF7rexVh5dlhx6ZT6kFrFkxSOnB7aemt/GdX9u4OfDQ3sGBCL8t
 AiCDqUsPkis0+gNw=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
 by smtp.kpnmail.nl (Halon) with ESMTPS
 id aeabbd2c-5acf-11e9-871b-005056abf0db;
 Tue, 09 Apr 2019 15:59:25 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Tue, 9 Apr
 2019 15:59:05 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Tue, 9 Apr 2019 15:59:05 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: Matt Spinler <mspinler@linux.ibm.com>, Lei YU <mine260309@gmail.com>,
 Matthew Barth <msbarth@linux.ibm.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: using phosphor-dbus-monitor
Thread-Topic: using phosphor-dbus-monitor
Thread-Index: AdTuEGrG+gJJ+lgAS6eE4IA4ANXSuAAZVliAAAu1tjAACXWxAAAEVeLw
Date: Tue, 9 Apr 2019 13:59:05 +0000
Message-ID: <81591b6a8b784d9fa59773ea5a06ad2e@Eltsrv03.Eltan.local>
References: <8daf9ac9deee4bc0808a55733681d67e@Eltsrv03.Eltan.local>
 <0f2fc6f7-be66-ab65-7b90-b0bdd45d5fcd@linux.ibm.com>
In-Reply-To: <0f2fc6f7-be66-ab65-7b90-b0bdd45d5fcd@linux.ibm.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginalArrivalTime: 09 Apr 2019 13:59:25.0266 (UTC)
 FILETIME=[70C37320:01D4EEDC]
X-RcptDomain: lists.ozlabs.org
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
X-List-Received-Date: Tue, 09 Apr 2019 13:59:35 -0000

SGVsbG8gTWF0dCwNCg0KSSBzdHJpcHBlZCBvbmUgZG93biB0byB3aGF0IEkgdGhpbmsgaXMgdGhl
IGJhcmUgbWluaW11bSBhbmQgaW5jbHVkZWQgaXQgaW4gdGhpcyBlbWFpbC4gSSBndWVzcyBvbmNl
IEkgaGF2ZSB0aGlzIHdvcmtpbmcgdGhlIG90aGVycyBzaG91bGQgYmUgZmluZSBhcyB3ZWxsLg0K
DQpCYXNpY2FsbHkgdGhpcyB5YW1sIGRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNlIGJ1dCBJIGV4cGVj
dGVkIHRoaXMgdG8gZ2VuZXJhdGUgam91cm5hbCBlbnRyaWVzLg0KDQotIG5hbWU6IHZvbHRhZ2Ug
c2Vuc29yIHBhdGggZ3JvdXANCiAgY2xhc3M6IGdyb3VwDQogIGdyb3VwOiBwYXRoDQogIG1lbWJl
cnM6DQogICAgLSBtZXRhOiBTRU5TT1INCiAgICAgIHBhdGg6IC94eXovb3BlbmJtY19wcm9qZWN0
L3NlbnNvcnMvdm9sdGFnZS9QVk5OX1BDSF9BVVgNCg0KLSBuYW1lOiBzZW5zb3IgdmFsdWUgZ3Jv
dXANCiAgZGVzY3JpcHRpb246ID4NCiAgICAnc2Vuc29yIHZhbHVlLicNCiAgY2xhc3M6IGdyb3Vw
DQogIGdyb3VwOiBwcm9wZXJ0eQ0KICB0eXBlOiBpbnQ2NA0KICBtZW1iZXJzOg0KICAgIC0gaW50
ZXJmYWNlOiB4eXoub3BlbmJtY19wcm9qZWN0LlNlbnNvcnMuVmFsdWUNCiAgICAgIG1ldGE6IFZP
TFRBR0UNCiAgICAgIHByb3BlcnR5OiBWYWx1ZQ0KDQotIG5hbWU6IHdhdGNoIHNlbnNvciB2YWx1
ZQ0KICBkZXNjcmlwdGlvbjogPg0KICAgICdUcmlnZ2VyIGxvZ2ljIG9uIHNlbnNvciB2YWx1ZS4n
DQogIGNsYXNzOiB3YXRjaA0KICB3YXRjaDogcHJvcGVydHkNCiAgcGF0aHM6IHZvbHRhZ2Ugc2Vu
c29yIHBhdGggZ3JvdXANCiAgcHJvcGVydGllczogc2Vuc29yIHZhbHVlIGdyb3VwDQogIGNhbGxi
YWNrOiBzZW5zb3IgdmFsdWUgY291bnQgY29uZGl0aW9uDQoNCi0gbmFtZTogc2Vuc29yIHZhbHVl
IGNvdW50IGNvbmRpdGlvbg0KICBkZXNjcmlwdGlvbjogPg0KICAgICdjaGVjayBjcml0aWNhbCBj
b25kaXRpb24gb2YgdGhlIHNlbnNvcnMuJw0KICBjbGFzczogY29uZGl0aW9uDQogIGNvbmRpdGlv
bjogY291bnQNCiAgcGF0aHM6IHZvbHRhZ2Ugc2Vuc29yIHBhdGggZ3JvdXANCiAgcHJvcGVydGll
czogc2Vuc29yIHZhbHVlIGdyb3VwDQogIGNhbGxiYWNrOiB2YWx1ZSBoYW5kbGVyIGNhbGxiYWNr
DQogIGNvdW50b3A6ICc+Jw0KICBjb3VudGJvdW5kOiAwDQogIG9wOiAnPicNCiAgYm91bmQ6IDEw
DQogDQotIG5hbWU6IHZhbHVlIGhhbmRsZXIgY2FsbGJhY2sNCiAgZGVzY3JpcHRpb246ID4NCiAg
ICAndmFsdWUgaGFuZGxlciBjYWxsIGJhY2suJw0KICBjbGFzczogY2FsbGJhY2sNCiAgY2FsbGJh
Y2s6IGdyb3VwDQogIG1lbWJlcnM6DQogICAgLSBleGFtcGxlIGpvdXJuYWwgY2FsbGJhY2sgdmFs
dWUNCg0KLSBuYW1lOiBleGFtcGxlIGpvdXJuYWwgY2FsbGJhY2sgdmFsdWUNCiAgZGVzY3JpcHRp
b246ID4NCiAgICBzaW1wbGUgam91cmFsIGVudHJ5LicNCiAgY2xhc3M6IGNhbGxiYWNrDQogIGNh
bGxiYWNrOiBqb3VybmFsDQogIHBhdGhzOiB2b2x0YWdlIHNlbnNvciBwYXRoIGdyb3VwDQogIHBy
b3BlcnRpZXM6IHNlbnNvciB2YWx1ZSBncm91cA0KICBzZXZlcml0eTogSU5GTw0KICBtZXNzYWdl
OiBIZWxsbyB3b3JsZCBmcm9tIFBETSBWYWx1ZSENCg0KQmVzdCByZWdhcmRzLA0KDQpXaW0NCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1hdHQgU3BpbmxlciBbbWFpbHRvOm1z
cGlubGVyQGxpbnV4LmlibS5jb21dIA0KU2VudDogVHVlc2RheSwgQXByaWwgOSwgMjAxOSAzOjUx
IFBNDQpUbzogV2ltIFZlcnZvb3JuIDx3dmVydm9vcm5AZWx0YW4uY29tPjsgTGVpIFlVIDxtaW5l
MjYwMzA5QGdtYWlsLmNvbT47IE1hdHRoZXcgQmFydGggPG1zYmFydGhAbGludXguaWJtLmNvbT4N
CkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiB1c2luZyBwaG9zcGhv
ci1kYnVzLW1vbml0b3INCg0KSGkgV2ltLA0KDQpJZiB5b3UgY291bGQgcG9zdCB5b3VyIFlBTUwg
c29tZXdoZXJlLCBJIGNvdWxkIHRha2UgYSBsb29rIGZvciBhbnkgb2J2aW91cyBwcm9ibGVtcy4N
Cg0KT24gNC85LzIwMTkgMjoyMyBBTSwgV2ltIFZlcnZvb3JuIHdyb3RlOg0KPiBIZWxsbyBMZWks
DQo+DQo+IFRoYW5rcyBmb3IgeW91ciByZXNwb25zZS4gSSBrbm93IHRoaXMgZXhhbXBsZSB0b28g
YW5kIGl0IGhlbHBzIGEgYml0IGJ1dCBpdCBkb2VzbuKAmXQgcmVhbGx5IGNsYXJpZnkgYWxsIGlz
c3Vlcy4NCj4NCj4gQXMgeW91J3ZlIHdvcmtlZCB3aXRoIHRoaXMgYXMgd2VsbC4gRG8geW91IHVu
ZGVyc3RhbmQgdGhlIG1ldGEgaXRlbT8gVGhlIGV4YW1wbGUgaW5kaWNhdGVzIGl0IGhhcyBkaWZm
ZXJlbnQgbWVhbmluZyBidXQgZG9lc24ndCBwcm92aWRlIGFueSBwb2ludGVycyB0byB3aGF0IHRo
b3NlIG1lYW5pbmdzIGFyZS4gSGF2ZSB5b3UgYmVlbiBhYmxlIHRvIGZpbmQgb3V0Pw0KPg0KPiBC
ZXN0IFJlZ2FyZHMsDQo+IFdpbSBWZXJ2b29ybg0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBMZWkgWVUgW21haWx0bzptaW5lMjYwMzA5QGdtYWlsLmNvbV0NCj4gU2Vu
dDogVHVlc2RheSwgQXByaWwgOSwgMjAxOSA1OjQ0IEFNDQo+IFRvOiBXaW0gVmVydm9vcm4gPHd2
ZXJ2b29ybkBlbHRhbi5jb20+OyBNYXR0aGV3IEJhcnRoIA0KPiA8bXNiYXJ0aEBsaW51eC5pYm0u
Y29tPg0KPiBDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+IFN1YmplY3Q6IFJlOiB1c2lu
ZyBwaG9zcGhvci1kYnVzLW1vbml0b3INCj4NCj4+IEkgYW0gdHJ5aW5nIHRvIHVzZSBwaG9zcGhv
ci1kYnVzLW1vbml0b3IgdG8gY3JlYXRlIGxvZ2dpbmcgb2Ygc2Vuc29yIGV4Y2VwdGlvbnMgbGlr
ZSBhIENyaXRpY2FsIHN0YXRlIG9uIGEgc3BlY2lmaWMgc2Vuc29yLg0KPj4gSSBhbSBhYmxlIHRv
IGNyZWF0ZSBhIHNvbHV0aW9uIHdpdGggYSBidWlsZGluZyB5YW1sIGJ1dCBhdCB0aGUgZW5kIGl0
IGRvZXNu4oCZdCBkZWxpdmVyIG1lIHRoZSBkZXNpcmVkIHJlc3VsdC4NCj4+IEFzIHRoZXJlIGFy
ZSB2ZXJ5IGxpbWl0ZWQgZXhhbXBsZXMgKG9uIGEgZmV3IGluIHRoZSB3aXRoZXJzcG9vbikgaXQg
aXMgdmVyeSBoYXJkIHRvIGZpZ3VyZSBvdXQgd2hlcmUgdGhlIG1pc3Rha2UgaXMuDQo+IFRoZXJl
IGlzIGFuIGV4YW1wbGUgeWFtbCBjb25maWcgaW4gdGhlIHJlcG86DQo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9vcGVuYm1jL3Bob3NwaG9yLWRidXMtbW9uaXRvci9ibG9iL21hc3Rlci9zcmMvZXhhbXAN
Cj4gbGUvZXhhbXBsZS55YW1sDQo+DQo+IEFuZCBJIGhhdmUgdGhlIHNhbWUgZmVlbGluZyB0aGF0
IGl0J3MgaGFyZCB0byBrbm93IHdoYXQncyB3cm9uZyBpZiANCj4gc29tZXRoaW5nIGlzIHdyb25n
LmVpDQo+DQo+PiBBcmUgdGhlcmUgYW55IHRvb2xzIHRoYXQgY2FuIGJlIHVzZWQgdG8gbWFrZSB0
aGlzIGVhc2llcj8NCj4gQE1hdHRoZXcgQmFydGggQ291bGQgeW91IGtpbmRseSBoZWxwIHRvIGFk
ZCBzb21lIGRvYy90b29sIHRvIG1ha2UgaXQgZWFzaWVyIHRvIHVzZT8NCj4NCj4+IEFkZGl0aW9u
YWxseSBpcyB0aGlzIHRoZSBjb3JyZWN0IG1ldGhvZCB0byBhY2hpZXZlIHRoaXMgZ29hbCBvciBz
aG91bGQgSSB1c2Ugc29tZXRoaW5nIGVsc2UgdG8gZGVmaW5lIGNvbmRpdGlvbnMgZm9yIGxvZ2dp
bmc/DQo+IEkgdGhpbmsgc28uIFRoaXMgcmVwbyBpcyBpbnRlbmRlZCB0byB3YXRjaCB0aGUgZGJ1
cyBhbmQgZG8gc3R1ZmYgYXMgeWFtbCBjb25maWcuDQo+DQo+DQoNCg0KDQo=
