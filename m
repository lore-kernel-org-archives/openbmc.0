Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.10; helo=cpsmtpb-ews07.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="MK7Mqwfy"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews07.kpnxchange.com (cpsmtpb-ews07.kpnxchange.com
 [213.75.39.10])
 by lists.ozlabs.org (Postfix) with ESMTP id 44df0V1hdMzDqH2
 for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2019 17:23:35 +1000 (AEST)
Received: from cpsps-ews08.kpnxchange.com ([10.94.84.175]) by
 cpsmtpb-ews07.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Tue, 9 Apr 2019 09:23:29 +0200
X-Brand: 4ZrJ
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=IeBWplia c=1 sm=1 tr=0 cx=a_idp_e
 a=YnLMpE5S06+Zisl5ga1zfg==:117 a=YnLMpE5S06+Zisl5ga1zfg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=eIHzyqS2sMcA:10 a=IkcTkHD0fZMA:10
 a=xqWC_Br6kY4A:10 a=oexKYjalfGEA:10 a=pGLkceISAAAA:8 a=X5F7dNyOAAAA:8
 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=peDeANYtAAAA:20
 a=0IsbBfV2xGZjmPSfDogA:9 a=QEXdDO2ut3YA:10 a=pS7LufLo7ZPxIL5li5Lt:22
 a=IC2XNlieTeVoXbcui8wp:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.46]) by cpsps-ews08.kpnxchange.com
 over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 9 Apr 2019 09:23:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=mime-version:content-type:message-id:date:subject:to:from;
 bh=KTbJQb0u46cmkhrGCOzPeJtPkgRb8Y2Ws5NAkT48uF0=;
 b=MK7MqwfyzOF+uAYCPlkwrdnZQjiOSHGHzrrOW3jUOw6+xa53IsXrDvqYbKgj26FO3gcm8EV7AVPM1
 BzT1FGbanhLFiYTi+Dj056UfOqkQ4H4RrSiD97lg5yB5J0quqOoHVgdo6FLZfGUjM6Knl/QUj6tkg/
 zE9A24L6cMzZAL10=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
 by smtp.kpnmail.nl (Halon) with ESMTPS
 id 5f64a3c6-5a98-11e9-8484-005056ab7584;
 Tue, 09 Apr 2019 09:23:29 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Tue, 9 Apr
 2019 09:23:10 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Tue, 9 Apr 2019 09:23:10 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: Lei YU <mine260309@gmail.com>, Matthew Barth <msbarth@linux.ibm.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: using phosphor-dbus-monitor
Thread-Topic: using phosphor-dbus-monitor
Thread-Index: AdTuEGrG+gJJ+lgAS6eE4IA4ANXSuAAZVliAAAu1tjA=
Date: Tue, 9 Apr 2019 07:23:09 +0000
Message-ID: <bdc0e08ece734d44b8eebad84eb5db35@Eltsrv03.Eltan.local>
References: <8daf9ac9deee4bc0808a55733681d67e@Eltsrv03.Eltan.local>
 <CAARXrtmt9ObNmmkS2H2Qmon6qXVHiSjVmuyrfLXpzsSqP7j5PA@mail.gmail.com>
In-Reply-To: <CAARXrtmt9ObNmmkS2H2Qmon6qXVHiSjVmuyrfLXpzsSqP7j5PA@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginalArrivalTime: 09 Apr 2019 07:23:29.0728 (UTC)
 FILETIME=[215C0400:01D4EEA5]
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
X-List-Received-Date: Tue, 09 Apr 2019 07:23:40 -0000

SGVsbG8gTGVpLA0KDQpUaGFua3MgZm9yIHlvdXIgcmVzcG9uc2UuIEkga25vdyB0aGlzIGV4YW1w
bGUgdG9vIGFuZCBpdCBoZWxwcyBhIGJpdCBidXQgaXQgZG9lc27igJl0IHJlYWxseSBjbGFyaWZ5
IGFsbCBpc3N1ZXMuDQoNCkFzIHlvdSd2ZSB3b3JrZWQgd2l0aCB0aGlzIGFzIHdlbGwuIERvIHlv
dSB1bmRlcnN0YW5kIHRoZSBtZXRhIGl0ZW0/IFRoZSBleGFtcGxlIGluZGljYXRlcyBpdCBoYXMg
ZGlmZmVyZW50IG1lYW5pbmcgYnV0IGRvZXNuJ3QgcHJvdmlkZSBhbnkgcG9pbnRlcnMgdG8gd2hh
dCB0aG9zZSBtZWFuaW5ncyBhcmUuIEhhdmUgeW91IGJlZW4gYWJsZSB0byBmaW5kIG91dD8NCg0K
QmVzdCBSZWdhcmRzLA0KV2ltIFZlcnZvb3JuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBMZWkgWVUgW21haWx0bzptaW5lMjYwMzA5QGdtYWlsLmNvbV0gDQpTZW50OiBUdWVz
ZGF5LCBBcHJpbCA5LCAyMDE5IDU6NDQgQU0NClRvOiBXaW0gVmVydm9vcm4gPHd2ZXJ2b29ybkBl
bHRhbi5jb20+OyBNYXR0aGV3IEJhcnRoIDxtc2JhcnRoQGxpbnV4LmlibS5jb20+DQpDYzogb3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogdXNpbmcgcGhvc3Bob3ItZGJ1cy1t
b25pdG9yDQoNCj4gSSBhbSB0cnlpbmcgdG8gdXNlIHBob3NwaG9yLWRidXMtbW9uaXRvciB0byBj
cmVhdGUgbG9nZ2luZyBvZiBzZW5zb3IgZXhjZXB0aW9ucyBsaWtlIGEgQ3JpdGljYWwgc3RhdGUg
b24gYSBzcGVjaWZpYyBzZW5zb3IuDQo+IEkgYW0gYWJsZSB0byBjcmVhdGUgYSBzb2x1dGlvbiB3
aXRoIGEgYnVpbGRpbmcgeWFtbCBidXQgYXQgdGhlIGVuZCBpdCBkb2VzbuKAmXQgZGVsaXZlciBt
ZSB0aGUgZGVzaXJlZCByZXN1bHQuDQo+IEFzIHRoZXJlIGFyZSB2ZXJ5IGxpbWl0ZWQgZXhhbXBs
ZXMgKG9uIGEgZmV3IGluIHRoZSB3aXRoZXJzcG9vbikgaXQgaXMgdmVyeSBoYXJkIHRvIGZpZ3Vy
ZSBvdXQgd2hlcmUgdGhlIG1pc3Rha2UgaXMuDQoNClRoZXJlIGlzIGFuIGV4YW1wbGUgeWFtbCBj
b25maWcgaW4gdGhlIHJlcG86DQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1k
YnVzLW1vbml0b3IvYmxvYi9tYXN0ZXIvc3JjL2V4YW1wbGUvZXhhbXBsZS55YW1sDQoNCkFuZCBJ
IGhhdmUgdGhlIHNhbWUgZmVlbGluZyB0aGF0IGl0J3MgaGFyZCB0byBrbm93IHdoYXQncyB3cm9u
ZyBpZiBzb21ldGhpbmcgaXMgd3JvbmcuZWkNCg0KPiBBcmUgdGhlcmUgYW55IHRvb2xzIHRoYXQg
Y2FuIGJlIHVzZWQgdG8gbWFrZSB0aGlzIGVhc2llcj8NCg0KQE1hdHRoZXcgQmFydGggQ291bGQg
eW91IGtpbmRseSBoZWxwIHRvIGFkZCBzb21lIGRvYy90b29sIHRvIG1ha2UgaXQgZWFzaWVyIHRv
IHVzZT8NCg0KPiBBZGRpdGlvbmFsbHkgaXMgdGhpcyB0aGUgY29ycmVjdCBtZXRob2QgdG8gYWNo
aWV2ZSB0aGlzIGdvYWwgb3Igc2hvdWxkIEkgdXNlIHNvbWV0aGluZyBlbHNlIHRvIGRlZmluZSBj
b25kaXRpb25zIGZvciBsb2dnaW5nPw0KDQpJIHRoaW5rIHNvLiBUaGlzIHJlcG8gaXMgaW50ZW5k
ZWQgdG8gd2F0Y2ggdGhlIGRidXMgYW5kIGRvIHN0dWZmIGFzIHlhbWwgY29uZmlnLg0KDQoNCg==
