Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41690G2dXRzDrpC
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jun 2018 03:02:14 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2018 10:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,222,1526367600"; d="scan'208";a="64604020"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by orsmga001.jf.intel.com with ESMTP; 14 Jun 2018 10:02:10 -0700
Received: from orsmsx161.amr.corp.intel.com (10.22.240.84) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Thu, 14 Jun 2018 10:02:10 -0700
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.88]) by
 ORSMSX161.amr.corp.intel.com ([169.254.4.140]) with mapi id 14.03.0319.002;
 Thu, 14 Jun 2018 10:02:10 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Brad Chou <chou.brad@gmail.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: IPMI KCS support in openbmc Linux
Thread-Topic: IPMI KCS support in openbmc Linux
Thread-Index: AQHUA7k32jKxhMzTKk22wNjw87O3yaRf+O6Q
Date: Thu, 14 Jun 2018 17:02:09 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E8216993457F631F@ORSMSX113.amr.corp.intel.com>
References: <CAPt_=C6axmsy5mByx-Zv6QGi6fT3zG6SW5_WdfcOt7vy_faeQQ@mail.gmail.com>
In-Reply-To: <CAPt_=C6axmsy5mByx-Zv6QGi6fT3zG6SW5_WdfcOt7vy_faeQQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2018 17:02:23 -0000

QnJhZCwNCg0KSSBiZWxpZXZlIHRoZSBvbmx5IGNvbmZpZ3VyYXRpb24gbmVlZGVkIGlzIGluIHRo
ZSBEVFMgZmlsZSBmb3IgeW91ciBwbGF0Zm9ybSwgYWx0aG91Z2ggaWYgeW91J3JlIGdldHRpbmcg
dGhlIC9kZXYvaXBtaS1rY3MgSSBzdXNwZWN0IHRoYXQncyB3b3JraW5nLg0KDQpXaGF0IGJhc2Vi
b2FyZCBhcmUgeW91IHRyeWluZyB0byBwb3J0IE9wZW5CTUMgdG8/ICBBcmUgeW91IHN1cmUgdGhh
dCB0aGUgQklPUyBmb3IgeW91ciBib2FyZCBzdXBwb3J0cyBLQ1MgKGFuZCBub3Qgc29tZXRoaW5n
IGVsc2UgbGlrZSBibG9jayB0cmFuc2Zlcik/DQoNCkkga25vdyBvZiBzb21lIG90aGVyIHBlb3Bs
ZSBvdXRzaWRlIG9mIG15IHRlYW0gdGhhdCB3ZXJlIGFibGUgdG8gZ2V0IHRob3NlIHBhdGNoZXMg
d29ya2luZyBvbiB0aGVpciBwbGF0Zm9ybSwgYW5kIHRoZXkgZGlkbid0IG1lbnRpb24gYW55ICJ0
cmlja3MiIHRvIGdldHRpbmcgaXQgdG8gd29yay4gIFVzdWFsbHkgd2Ugc2ltcGx5IHRlc3Qgd2l0
aCBpcG1pdG9vbCBvciBzaW1pbGFyIGZyb20gdGhlIGhvc3Qgc2lkZSBib290ZWQgaW50byBhbiBP
Uywgb3IgY21kdG9vbCBmcm9tIGEgVUVGSSBzaGVsbC4NCg0KLUVkDQoNCg0KRnJvbTogQnJhZCBD
aG91IFttYWlsdG86Y2hvdS5icmFkQGdtYWlsLmNvbV0gDQpTZW50OiBUaHVyc2RheSwgSnVuZSAx
NCwgMjAxOCAxOjI1IEFNDQpUbzogVGFub3VzLCBFZCA8ZWQudGFub3VzQGludGVsLmNvbT4NCkNj
OiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBJUE1JIEtDUyBzdXBwb3J0
IGluIG9wZW5ibWMgTGludXgNCg0KSGkgRWQsDQpJIGhhdmUgdHJpZWQgdG8gYWRkIHlvdXIgcGF0
Y2hlcy4NCmh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovIy9jLzEwOTQ2Lw0KaHR0
cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8jL2MvMTA5NTEvIA0KDQpBbHNvIGFub3Ro
ZXIgcGF0Y2ggZm9yIGFzcGVlZC1nNS5kdHNpIG9uIA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wYXRjaC8xMDI2MzM2OS8NCg0KTm93LCBJIGNhbiBzZWUgdGhlcmUgYXJlIGtjcyBkZXZp
Y2VzIGluIC9kZXYvaXBtaS1rY3MsIGxvb2tzIGxpa2UgdGhlIGtjcyBkcml2ZXIgaXMgd29ya2lu
Zy4NCkJ1dCBvbiBteSBPRU0geDg2IGJvYXJkLCB0aGUgQklPUyBzdGlsbCBjYW4ndCBjb21tdW5p
Y2F0ZSB3aXRoIEJNQyBieSBrY3MuDQpEbyBJIG5lZWQgdG8gY29uZmlnIGFueXRoaW5nID8NCkFu
eSB0b29sIEkgY2FuIHVzZSB0byB0ZXN0IHRoZSBrY3MgaW50ZXJmYWNlID8NCg0KVGhhbmtzLg0K
DQo=
