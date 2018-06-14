Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4169QH0WYVzDrnp
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jun 2018 03:21:24 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2018 10:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,222,1526367600"; d="scan'208";a="47146211"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by fmsmga007.fm.intel.com with ESMTP; 14 Jun 2018 10:21:20 -0700
Received: from orsmsx158.amr.corp.intel.com (10.22.240.20) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Thu, 14 Jun 2018 10:21:20 -0700
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.88]) by
 ORSMSX158.amr.corp.intel.com ([169.254.10.35]) with mapi id 14.03.0319.002;
 Thu, 14 Jun 2018 10:21:20 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Lei YU <mine260309@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Patrick Venture <venture@google.com>
Subject: RE: Feature request in phosphor-pid-control
Thread-Topic: Feature request in phosphor-pid-control
Thread-Index: AQHUA7Dr/5UDbPiPHkKlpxBjeYcNkKRf/g3g
Date: Thu, 14 Jun 2018 17:21:19 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E8216993457F637B@ORSMSX113.amr.corp.intel.com>
References: <CAARXrt=XaO=t=UuSDjcgZ=Nkh9J7vTQJPEAMG5=_Ca7ukRVekA@mail.gmail.com>
In-Reply-To: <CAARXrt=XaO=t=UuSDjcgZ=Nkh9J7vTQJPEAMG5=_Ca7ukRVekA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: request-justification,no-action
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
X-List-Received-Date: Thu, 14 Jun 2018 17:21:27 -0000

V2UndmUgaGFkIGEgZmV3IGRpc2N1c3Npb25zIGFib3V0IHRoaXMgaW4gcHJldmlvdXMgY29kZSBy
ZXZpZXdzLiAgSSB0aGluayB0aGUgY29uY2x1c2lvbiB3YXMgdGhhdCB3ZSBuZWVkIHRvIGFkZCBh
ICJzdGF0dXMiIGZpZWxkL2ludGVyZmFjZSB0byBzZW5zb3JzLCBzbyB3ZSBjYW4gcmVwb3J0IE9L
L1VuYXZhaWxhYmxlL0Vycm9yIHN0YXR1c2VzIG91dHNpZGUgb2YgdGhlIGV4aXN0aW5nIHZhbHVl
IGludGVyZmFjZS4gIFNvIGZhciBhcyBJIGtub3csIG5vIG9uZSBoYXMgcHJvcG9zZWQgb25lIG9m
IHRoZXNlIHlldCwgYnV0IEkgd291bGQgaGFwcGlseSBoZWxwIHJldmlldyBhIHBhdGNoLg0KDQpB
bHNvLCAobm90IFBhdHJpY2spIEkgd291bGQgc3VwcG9ydCBhIHBhcmFtZXRlciBpbiBwaG9zcGhv
ci1waWQtY29udHJvbCB0aGF0IG1ha2VzIHNlbnNvcnMgb3B0aW9uYWwuICBUaGUgb25seSBwYXJ0
IHRoYXQgd29ycmllcyBtZSBoZXJlIGlzIHRoYXQgdGhlcmUgaXMgYSBiaWcgZGlmZmVyZW5jZSBh
dCBhIHN5c3RlbSBsZXZlbCBiZXR3ZWVuICJ1bmF2YWlsYWJsZSIgYW5kICJmYXVsdGVkIiwgYnV0
IEkgdGhpbmsgdGhhdCBjb3VsZCBiZSBlYXNpbHkgZml4ZWQgaW4gYSBmdXR1cmUgcGF0Y2hzZXQg
aWYgd2UgZ2V0IHRoZSBmdWxsIERCdXMgc3VwcG9ydCBmb3Igc3RhdHVzIGludGVyZmFjZXMuDQoN
Ci1FZA0KDQoNCg0KDQoNCkZyb206IG9wZW5ibWMgW21haWx0bzpvcGVuYm1jLWJvdW5jZXMrZWQu
dGFub3VzPWludGVsLmNvbUBsaXN0cy5vemxhYnMub3JnXSBPbiBCZWhhbGYgT2YgTGVpIFlVDQpT
ZW50OiBUaHVyc2RheSwgSnVuZSAxNCwgMjAxOCAxMjoyNCBBTQ0KVG86IE9wZW5CTUMgTWFpbGxp
c3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz47IFBhdHJpY2sgVmVudHVyZSA8dmVudHVyZUBn
b29nbGUuY29tPg0KU3ViamVjdDogRmVhdHVyZSByZXF1ZXN0IGluIHBob3NwaG9yLXBpZC1jb250
cm9sDQoNClRoaXMgZW1haWwgaXMgYWJvdXQgYSBmZWF0dXJlIHJlcXVlc3QgaW4gcGhvc3Bob3It
cGlkLWNvbnRyb2wsIHRoYXQgdG8gc3VwcG9ydA0Kb3B0aW9uYWwgc2Vuc29ycy4NCkl0IGlzIG1l
bnRpb25lZCBpbiBjb21tZW50IG9mIGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXov
Iy9jLzExMDAzLw0KDQpCYWNrZ3JvdW5kOg0KQ3VycmVudCBwaG9zcGhvci1waWQtY29udHJvbCBj
aGVja3MgdGhlIHRlbXBlcmF0dXJlIHNlbnNvcnMgYW5kIGNhbGN1bGF0ZSB0aGUNCmV4cGVjdGVk
IGZhbiBzcGVlZC4NCkl0IGFzc3VtZXMgdGhlIHRlbXBlcmF0dXJlIHNlbnNvcnMgYXJlIGFsd2F5
cyBhdmFpbGFibGUuIEFuZCBpZiB0aGUgc2Vuc29yIGlzDQpub3QgdGhlcmUsIHRoZSBzZXJ2aWNl
IHRocm93cyBleGNlcHRpb25zLg0KDQpUaGUgZmVhdHVyZSByZXF1ZXN0Og0KSSB3b3VsZCBsaWtl
IHBob3NwaG9yLXBpZC1jb250cm9sIHRvIHN1cHBvcnQgIm9wdGlvbmFsIiBzZW5zb3JzLCB0aGF0
IGl0IG1heQ0KYmUgdW5hdmFpbGFibGUgd2hlbiBzeXN0ZW0gaXMgcnVubmluZy4NClN1Y2ggc2Vu
c29yIGlzIGNvdW50ZWQgd2hlbiBpdCBpcyBhdmFpbGFibGUsIGFuZCBpcyBpZ25vcmVkIHdoZW4g
aXQgaXMNCm1pc3NpbmcuDQoNCkFuIHVzZSBjYXNlOg0KSSB3YW50IHRvIGFkanVzdCBmYW4gc3Bl
ZWQgYmFzZWQgb24gY3B1IGNvcmUgb3IgZGltbSB0ZW1wZXJhdHVyZS4NCkZvciBhIHR5cGljYWwg
T3BlblBPV0VSIFA5IHN5c3RlbSwgdGhlcmUgY291bGQgYmUgYXQgbW9zdCA0OCBjb3JlcywgYnV0
IHRoZXkNCmNhbiBiZSBtaXNzaW5nIGRlcGVuZGluZyBvbiB0aGUgQ1BVLCBlLmcuIGlmIGEgc3lz
dGVtIGlzIHBsdWdnZWQgQ1BVcyB3aXRoIDIyDQpjb3JlcywgNCBjb3JlcyB0ZW1wZXJhdHVyZSB3
aWxsIGJlIG1pc3NpbmcuIEFuZCBpbiBydW4gdGltZSwgYSBjb3JlIG1heSBiZQ0KZ2FyZGVkIGlm
IGl0IGhhcyBwcm9ibGVtIGl0IHdpbGwgYmUgbWlzc2luZyBhcyB3ZWxsLg0KVGhlIHNhbWUgZm9y
IGRpbW1zLCBmb3IgYSBzeXN0ZW0gd2l0aCBhdCBtb3N0IDE2IGRpbW1zLCBpdCBkZXBlbmRzIG9u
IGhvdyBtYW55DQpkaW1tcyBhcmUgYXR0YWNoZWQuDQpJbiBzdWNoIGNhc2UsIHRoZSBjb25maWcg
d2lsbCBzcGVjaWZ5IGFsbCB0aGUgdGVtcGVyYXR1cmVzIGZvciBjcHUgY29yZXMgYW5kDQpkaW1t
cywgYW5kIHBob3NwaG9yLXBpZC1jb250cm9sIHNoYWxsIGlnbm9yZSB0aGUgbWlzc2luZyB0ZW1w
ZXJhdHVyZXMuDQoNClBhdHJpY2ssIHdoYXQgZG8geW91IHRoaW5rIGFib3V0IHN1Y2ggY2FzZT8N
Cg0KVGhhbmtzIQ0K
