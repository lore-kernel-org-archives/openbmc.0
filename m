Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lHM61g1DzDqfr
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 00:43:28 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2018 07:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,455,1526367600"; d="scan'208";a="74450244"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by fmsmga002.fm.intel.com with ESMTP; 07 Aug 2018 07:43:20 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX109.amr.corp.intel.com ([169.254.11.80]) with mapi id 14.03.0319.002;
 Tue, 7 Aug 2018 07:43:19 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Joseph Reynolds <joseph-reynolds@charter.net>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Re: SSL Certificate management - proposed REST APIs
Thread-Topic: Re: SSL Certificate management - proposed REST APIs
Thread-Index: AQHULhF+Wg6mG9IGMUyI55Kf09ttB6S0WO5g
Date: Tue, 7 Aug 2018 14:43:19 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345829A79@ORSMSX114.amr.corp.intel.com>
References: <mailman.416.1533597083.2968.openbmc@lists.ozlabs.org>
 <2405db7e-2b5f-a8c4-9b1a-c33433110d90@charter.net>
In-Reply-To: <2405db7e-2b5f-a8c4-9b1a-c33433110d90@charter.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiN2Q1OWViMDgtNzAxOC00YzAxLThkMWEtZTU2NzA2MjI1YTg4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiajFSZzFpRUY0dFNnb0JNS2ZPN0l0RVVjZ0ZFY1hzcGRBWlorRTlyVHk1VERaejBaSmhOeGNxQ1h0clFHMThaVyJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 07 Aug 2018 14:43:30 -0000

PiBZZXMsIHRoZSBzcGVjIHNob3VsZCBhbGxvdyBmb3IgdGhlIGNlcnRpZmljYXRlIHRvIG5vdCBi
ZSB0aGVyZS7CoCBDYW4gdGhpcw0KPiBoYXBwZW4gd2hlbiB0aGUgQk1DIGlzIGJlaW5nIHByb3Zp
c2lvbmVkIG9yIGRlY29tbWlzc2lvbmVkLCBhZnRlciB0aGUNCj4gY2VydCBpcyBkZWxldGVkIGFu
ZCBiZWZvcmUgaXQgZ2V0cyByZS1jcmVhdGVkIChpZiBTU0wgaXMgbm90IHJ1bm5pbmcgYnV0IFJF
U1QNCj4gQVBJcyBhcmUgd29ya2luZyksIGFuZCBwb3NzaWJseSB3aGVuIHByb2Nlc3NpbmcgYSBj
ZXJ0aWZpY2F0ZSBzaWduaW5nDQo+IHJlcXVlc3Q/DQpJZiBTU0wgaXMgbm90IHJ1bm5pbmcgYnV0
IHRoZSByZXN0IEFQSXMgYXJlIHdvcmtpbmcgdGhhdCBpcyBhIGJ1ZywgYXMgd2Ugc2hvdWxkbid0
IGJlIHRyYW5zZmVycmluZyBhbnl0aGluZyAoZXNwZWNpYWxseSBTU0wgY2VydGlmaWNhdGVzKSBv
dmVyIGFuIHVuZW5jcnlwdGVkIGxpbmsuICBBbiBvdXRzdGFuZGluZyBDU1IgZG9lc24ndCByZXF1
aXJlIHVzIHRvIGludmFsaWRhdGUgdGhlIG9sZCBjZXJ0aWZpY2F0ZSB0byBjcmVhdGUgaXQuICBJ
ZiB0aGUgY2VydGlmaWNhdGUgaXNuJ3QgdGhlcmUsIHRoZW4gdGhlIFJFU1QgQVBJIGlzIGVmZmVj
dGl2ZWx5IGRvd24sIGFzIHdlIGNhbid0IHNwaW4gdXAgVExTIHNlc3Npb25zIHRvIHVwbG9hZCBu
ZXcga2V5IHNvIHdlJ3JlIGRlYWRsb2NrZWQuDQpJbiB5b3VyIG1pbmQsIGlmIEkgY2FsbCBERUxF
VEUgb24gdGhlIC9zc2wgZW5kcG9pbnQsIHdoYXQgaGFwcGVucz8gIEluIG15IG1pbmQsIC9kZWxl
dGUgY2F1c2VzIGEgcmVnZW5lcmF0aW9uIG9mIHRoZSBzZWxmIHNpZ25lZCBrZXksIHNvIHdlIGNh
biBrZWVwIHRoZSBodHRwcyBpbnRlcmZhY2VzIGZ1bmN0aW9uYWwuDQoNCj4gDQo+IEl0IHNlZW1z
IGxpa2UgdGhlcmUgYXJlIGluY3JlYXNpbmdseSBjb21wbGV4IHVzZSBjYXNlczoNCj4gMS4gQSBT
ZWxmLXNpZ25lZCBTU0wgY2VydGlmaWNhdGUgaXMgY3JlYXRlZCB3aGVuIHRoZXJlIGlzIG5vIG90
aGVyIGNlcnRpZmljYXRlIHRvDQo+IHVzZS7CoCBUaGlzIGlzIHRoZSBjdXJyZW50IGJlaGF2aW9y
Lg0KPiAyLiBTb21lIG90aGVyIHNlcnZlciBjcmVhdGVzIGEgU1NMIGNlcnRpZmljYXRlIGFuZCBj
YXVzZXMgaXQgdG8gYmUgc2lnbmVkDQo+IChlaXRoZXIgYnkgYSB3ZWxsIGtub3duIENlcnRpZmlj
YXRlIEF1dGhvcml0eSBvciBieSBhY3RpbmcgYXMgYSBDQSksIHRoZW4gUFVUcw0KPiB0aGF0IFNT
TCBjZXJ0aWZpY2F0ZSBvbnRvIHRoZSBCTUMuDQo+IDMuIEluZm9ybWF0aW9uIGZvciB0aGUgQ1NS
IGlzIFBVVCBvbnRvIHRoZSBCTUMgd2hpY2ggdGhlbiBjaG9vc2VzIHByaXZhdGUNCj4ga2V5cywg
Y3JlYXRlcyB0aGUgU1NMIENlcnRpZmljYXRlIFNpZ25pbmcgUmVxdWVzdCAoQ1NSKSwgYW5kIGNh
dXNlcyB0aGUgU1NMDQo+IGNlcnRpZmljYXRlIHRvIGJlIHNpZ25lZC7CoCBXaGVuIHRoZSBzaWdu
ZWQgU1NMIGNlcnRpZmljYXRlIHJldHVybnMsIHRoZSBCTUMNCj4gdXNlcyBpdC4NCiMzIHVzZSBj
YXNlIHNlZW1zIGEgbGl0dGxlIG9kZCwgY2FuIHlvdSBleHBsYWluIGl0IGEgbGl0dGxlIG1vcmU/
ICAgIkNhdXNlcyB0aGUgU1NMIGNlcnRpZmljYXRlIHRvIGJlIHNpZ25lZCIgc291bmRzIGEgbG90
IGxpa2Ugc2VsZi1zaWduZWQgaW4gIzEsIGJ1dCB3aXRoIHVzZXIgcHJvdmlkZWQgaW5mb3JtYXRp
b24gaW4gdGhlIENTUi4gIEknbSBub3QgcmVhbGx5IHN1cmUgd2hhdCB0aGlzIHdvdWxkIGRvIGZv
ciBhIHVzZXIsIGFzIHRoZSBjZXJ0IGNoYWluIHN0aWxsIGlzbid0IHRyYWNlYWJsZS4gIFdvdWxk
IHlvdSBtYWtlIGFuIEludGVybWVkaWF0ZSBDQSBhdmFpbGFibGUgZm9yIGRvd25sb2FkLCBzbyB0
aGUgdXNlciBjb3VsZCBhZGQgaXQgdG8gdGhlaXIgcm9vdCBzdG9yZT8NCg0KPiBEb2VzIHRoZSBp
bmZvcm1hdGlvbiBuZWVkZWQgZm9yIHRoZSBDU1IgbmVlZCB0byBiZSBrZXB0IGFyb3VuZCBmb3Ig
cmUtDQo+IHVzZT/CoCBXb3VsZCB0aGUgQ1NSIGl0c2VsZiBldmVyIGJlIHJlLXVzZWQ/DQpJIGNh
bid0IHRoaW5rIG9mIGFueSByZWFzb24gd2h5IGl0IHdvdWxkLiAgQWxsIG9mIHRoZSBpbmZvcm1h
dGlvbiBpbiB0aGUgQ1NSIGlzIGVhc2lseSByZWNyZWF0ZWQuDQo=
