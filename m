Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.4; helo=cpsmtpb-ews01.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="OQtjcbO7"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews01.kpnxchange.com (cpsmtpb-ews01.kpnxchange.com
 [213.75.39.4])
 by lists.ozlabs.org (Postfix) with ESMTP id 44fRMZ4rtXzDqPF
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 00:27:51 +1000 (AEST)
Received: from cpsps-ews08.kpnxchange.com ([10.94.84.175]) by
 cpsmtpb-ews01.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Wed, 10 Apr 2019 16:27:45 +0200
X-Brand: +YTO/YbK+g==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=CfzZG4jl c=1 sm=1 tr=0 cx=a_idp_e
 a=aIJzBKXFL4aO3PtWP49Erg==:117 a=aIJzBKXFL4aO3PtWP49Erg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=eIHzyqS2sMcA:10 a=IkcTkHD0fZMA:10
 a=xqWC_Br6kY4A:10 a=oexKYjalfGEA:10 a=VnNF1IyMAAAA:8 a=X5F7dNyOAAAA:8
 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=peDeANYtAAAA:20
 a=GtulyUBNBAVYecadZj0A:9 a=QEXdDO2ut3YA:10 a=pS7LufLo7ZPxIL5li5Lt:22
 a=IC2XNlieTeVoXbcui8wp:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.43]) by cpsps-ews08.kpnxchange.com
 over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 10 Apr 2019 16:27:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=mime-version:content-type:message-id:date:subject:to:from;
 bh=abzUu+4xvrIhJHVy/dAbpCM6WHD+x02RWlVHotm1C5M=;
 b=OQtjcbO7xG/h7MuUDzZtQVzFV61mF9bVcDii6z2zD5rJLoX9x2zSG+NnGW3L7/cu8Z8tZNBdbRrb7
 4+JToODYnSMQZJs15kfxRXyji0Y5kY/K58SnJSG0dZ/DGnniSfxknry6JuWU+Xj6oC+hZyimUSwFEE
 4bAacwlRIALXhjVI=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
 by smtp.kpnmail.nl (Halon) with ESMTPS
 id cedda3b7-5b9c-11e9-bda6-005056ab1411;
 Wed, 10 Apr 2019 16:27:45 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Wed, 10 Apr
 2019 16:27:24 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Wed, 10 Apr 2019 16:27:12 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: Matthew Barth <msbarth@linux.ibm.com>, Matt Spinler
 <mspinler@linux.ibm.com>, Lei YU <mine260309@gmail.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: using phosphor-dbus-monitor
Thread-Topic: using phosphor-dbus-monitor
Thread-Index: AdTuEGrG+gJJ+lgAS6eE4IA4ANXSuAAZVliAAAu1tjAACXWxAAAAwpwAADbw/YA=
Date: Wed, 10 Apr 2019 14:27:11 +0000
Message-ID: <eb2c8def113944bfacad1d5aeafb94af@Eltsrv03.Eltan.local>
References: <8daf9ac9deee4bc0808a55733681d67e@Eltsrv03.Eltan.local>
 <cd7788f6-1f41-0ab7-aebf-fed6f2a675d7@linux.ibm.com>
In-Reply-To: <cd7788f6-1f41-0ab7-aebf-fed6f2a675d7@linux.ibm.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Apr 2019 14:27:45.0943 (UTC)
 FILETIME=[90DBEA70:01D4EFA9]
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
X-List-Received-Date: Wed, 10 Apr 2019 14:27:57 -0000

SGVsbG8gTWF0dCwNCg0KSSBqdXN0IGZvdW5kIHRoZSByZWFzb24gd2h5IHRoaXMgd2FzbuKAmXQg
d29ya2luZy4gSSBvdmVybG9va2VkIGEgdHlwbyBpbiB0aGUgaW50ZXJmYWNlIDogU2Vuc29ycyBp
bnN0ZWFkIG9mIFNlbnNvci4NCg0KQmVzdCBlcmdhcmRzLA0KDQpXaW0gVmVydm9vcm4NCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1hdHRoZXcgQmFydGggW21haWx0bzptc2Jh
cnRoQGxpbnV4LmlibS5jb21dIA0KU2VudDogVHVlc2RheSwgQXByaWwgOSwgMjAxOSA0OjEyIFBN
DQpUbzogTWF0dCBTcGlubGVyIDxtc3BpbmxlckBsaW51eC5pYm0uY29tPjsgV2ltIFZlcnZvb3Ju
IDx3dmVydm9vcm5AZWx0YW4uY29tPjsgTGVpIFlVIDxtaW5lMjYwMzA5QGdtYWlsLmNvbT4NCkNj
OiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiB1c2luZyBwaG9zcGhvci1k
YnVzLW1vbml0b3INCg0KDQoNCk9uIDQvOS8xOSA4OjUwIEFNLCBNYXR0IFNwaW5sZXIgd3JvdGU6
DQo+IEhpIFdpbSwNCj4gDQo+IElmIHlvdSBjb3VsZCBwb3N0IHlvdXIgWUFNTCBzb21ld2hlcmUs
IEkgY291bGQgdGFrZSBhIGxvb2sgZm9yIGFueSANCj4gb2J2aW91cyBwcm9ibGVtcy4NCklmIHlv
dSBjb3VsZCBhbHNvIHByb3ZpZGUgYSBsaXR0bGUgbW9yZSBkZXRhaWxzIG9uIHRoZSBlcnJvciB5
b3VyIGF0dGVtcHRpbmcgdG8gbG9nIHdvdWxkIGJlIGhlbHBmdWwgKGkuZS4gaXMgdGhlcmUgYSBk
YnVzIGludGVyZmFjZT8pLg0KPiANCj4gT24gNC85LzIwMTkgMjoyMyBBTSwgV2ltIFZlcnZvb3Ju
IHdyb3RlOg0KPj4gSGVsbG8gTGVpLA0KPj4NCj4+IFRoYW5rcyBmb3IgeW91ciByZXNwb25zZS4g
SSBrbm93IHRoaXMgZXhhbXBsZSB0b28gYW5kIGl0IGhlbHBzIGEgYml0IA0KPj4gYnV0IGl0IGRv
ZXNu4oCZdCByZWFsbHkgY2xhcmlmeSBhbGwgaXNzdWVzLg0KPj4NCj4+IEFzIHlvdSd2ZSB3b3Jr
ZWQgd2l0aCB0aGlzIGFzIHdlbGwuIERvIHlvdSB1bmRlcnN0YW5kIHRoZSBtZXRhIGl0ZW0/IA0K
Pj4gVGhlIGV4YW1wbGUgaW5kaWNhdGVzIGl0IGhhcyBkaWZmZXJlbnQgbWVhbmluZyBidXQgZG9l
c24ndCBwcm92aWRlIA0KPj4gYW55IHBvaW50ZXJzIHRvIHdoYXQgdGhvc2UgbWVhbmluZ3MgYXJl
LiBIYXZlIHlvdSBiZWVuIGFibGUgdG8gZmluZCBvdXQ/DQpXaGF0IG1ldGEgaXRlbSBhcmUgeW91
IHJlZmVycmluZyB0bz8NCj4+DQo+PiBCZXN0IFJlZ2FyZHMsDQo+PiBXaW0gVmVydm9vcm4NCj4+
DQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogTGVpIFlVIFttYWlsdG86
bWluZTI2MDMwOUBnbWFpbC5jb21dDQo+PiBTZW50OiBUdWVzZGF5LCBBcHJpbCA5LCAyMDE5IDU6
NDQgQU0NCj4+IFRvOiBXaW0gVmVydm9vcm4gPHd2ZXJ2b29ybkBlbHRhbi5jb20+OyBNYXR0aGV3
IEJhcnRoIA0KPj4gPG1zYmFydGhAbGludXguaWJtLmNvbT4NCj4+IENjOiBvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmcNCj4+IFN1YmplY3Q6IFJlOiB1c2luZyBwaG9zcGhvci1kYnVzLW1vbml0b3IN
Cj4+DQo+Pj4gSSBhbSB0cnlpbmcgdG8gdXNlIHBob3NwaG9yLWRidXMtbW9uaXRvciB0byBjcmVh
dGUgbG9nZ2luZyBvZiBzZW5zb3IgDQo+Pj4gZXhjZXB0aW9ucyBsaWtlIGEgQ3JpdGljYWwgc3Rh
dGUgb24gYSBzcGVjaWZpYyBzZW5zb3IuDQo+Pj4gSSBhbSBhYmxlIHRvIGNyZWF0ZSBhIHNvbHV0
aW9uIHdpdGggYSBidWlsZGluZyB5YW1sIGJ1dCBhdCB0aGUgZW5kIA0KPj4+IGl0IGRvZXNu4oCZ
dCBkZWxpdmVyIG1lIHRoZSBkZXNpcmVkIHJlc3VsdC4NCj4+PiBBcyB0aGVyZSBhcmUgdmVyeSBs
aW1pdGVkIGV4YW1wbGVzIChvbiBhIGZldyBpbiB0aGUgd2l0aGVyc3Bvb24pIGl0IA0KPj4+IGlz
IHZlcnkgaGFyZCB0byBmaWd1cmUgb3V0IHdoZXJlIHRoZSBtaXN0YWtlIGlzLg0KPj4gVGhlcmUg
aXMgYW4gZXhhbXBsZSB5YW1sIGNvbmZpZyBpbiB0aGUgcmVwbzoNCj4+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9vcGVuYm1jL3Bob3NwaG9yLWRidXMtbW9uaXRvci9ibG9iL21hc3Rlci9zcmMvZXhhbQ0K
Pj4gcGxlL2V4YW1wbGUueWFtbA0KPj4NCj4+DQo+PiBBbmQgSSBoYXZlIHRoZSBzYW1lIGZlZWxp
bmcgdGhhdCBpdCdzIGhhcmQgdG8ga25vdyB3aGF0J3Mgd3JvbmcgaWYgDQo+PiBzb21ldGhpbmcg
aXMgd3JvbmcuZWkNCj4+DQo+Pj4gQXJlIHRoZXJlIGFueSB0b29scyB0aGF0IGNhbiBiZSB1c2Vk
IHRvIG1ha2UgdGhpcyBlYXNpZXI/DQo+PiBATWF0dGhldyBCYXJ0aCBDb3VsZCB5b3Uga2luZGx5
IGhlbHAgdG8gYWRkIHNvbWUgZG9jL3Rvb2wgdG8gbWFrZSBpdCANCj4+IGVhc2llciB0byB1c2U/
DQpPcmlnaW5hbGx5LCB0aGUgZXhhbXBsZSB5YW1sIHdhcyBtZWFudCB0byBiZSB0aGUgZG9jdW1l
bnQgd2hpY2ggSSB1bmRlcnN0YW5kIGlzIHByb2JhYmx5IG5vdCB0aGUgZ3JlYXRlc3QgZm9ybSB3
aGVuIGl0IGNvbWVzIHRvIHRoaXMuIA0KVW5mb3J0dW5hdGVseSBlbmhhbmNpbmcgdGhlIGRvY3Vt
ZW50YXRpb24gd291bGQgYmUgYSBsb3cgcHJpb3JpdHkgYXQgdGhpcyB0aW1lIGJ1dCBmZWVsIGZy
ZWUgdG8gY3JlYXRlL3VwZGF0ZSB0aGUgZG9jdW1lbnRhdGlvbiBmcm9tIHlvdXIgZmluZGluZ3Mg
YW5kIHB1c2ggdGhlbSB1cCBmb3IgcmV2aWV3IGlmIHlvdSdkIGxpa2UuDQo+Pg0KPj4+IEFkZGl0
aW9uYWxseSBpcyB0aGlzIHRoZSBjb3JyZWN0IG1ldGhvZCB0byBhY2hpZXZlIHRoaXMgZ29hbCBv
ciANCj4+PiBzaG91bGQgSSB1c2Ugc29tZXRoaW5nIGVsc2UgdG8gZGVmaW5lIGNvbmRpdGlvbnMg
Zm9yIGxvZ2dpbmc/DQo+PiBJIHRoaW5rIHNvLiBUaGlzIHJlcG8gaXMgaW50ZW5kZWQgdG8gd2F0
Y2ggdGhlIGRidXMgYW5kIGRvIHN0dWZmIGFzIA0KPj4geWFtbCBjb25maWcuDQpDb3JyZWN0LiBU
aGlzIHJlcG8gd2FzIGludGVuZGVkIHRvIHBlcmZvcm0gZXJyb3IgbG9nZ2luZyBhbmQvb3Igc3lz
dGVtIGxldmVsIGFjdGlvbnMsIHN1Y2ggYXMgYSBzaHV0ZG93biwgYmFzZWQgb24gb2JqZWN0IHBy
b3BlcnRpZXMgb24gZGJ1cy4NCj4+DQo+Pg0KDQoNCg0K
