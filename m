Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KlRg6zTnzDqsG
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 06:33:15 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2018 11:33:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,373,1539673200"; d="scan'208";a="100011284"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by orsmga007.jf.intel.com with ESMTP; 19 Dec 2018 11:33:13 -0800
Received: from orsmsx115.amr.corp.intel.com (10.22.240.11) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 19 Dec 2018 11:33:13 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.59]) by
 ORSMSX115.amr.corp.intel.com ([169.254.4.23]) with mapi id 14.03.0415.000;
 Wed, 19 Dec 2018 11:33:13 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: "Shreyas Chandrashekar (shrchand)" <shrchand@cisco.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: "Guhan Balasubramanian (gubalasu)" <gubalasu@cisco.com>
Subject: RE: Use MilliAmps for IPMI tool
Thread-Topic: Use MilliAmps for IPMI tool
Thread-Index: AQHUl8ymCQmEMU7mS0eLpjHFq4IuuaWGbkhQ
Date: Wed, 19 Dec 2018 19:33:12 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345984003@ORSMSX114.amr.corp.intel.com>
References: <85D37044-F771-4019-A66F-0762AD59BF1F@cisco.com>
In-Reply-To: <85D37044-F771-4019-A66F-0762AD59BF1F@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZGNkNGIxNzktMjA4Yy00MzhhLWFiOTUtZWU1ZTg5OTE0MjJlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVFhRSjdcL2hvMkpOZllWWjhkcXNFZTVhVmh4YVZiWGpUSnVqWDhxbFpseU9ZSFd2TEh3QTVaOEFUOWtEam5MRkMifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
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
X-List-Received-Date: Wed, 19 Dec 2018 19:33:20 -0000

PklQTUkgdG9vbCBpcyBiZWluZyB1c2VkIHRvIHByb2JlIGFuZCBnZXQgdGhlIHZhcmlvdXMgc2Vu
c29yIHZhbHVlcyBmcm9tIGJtYy4gSG93ZXZlciwgYWZ0ZXIgcmVhZGluZyB0aHJvdWdoIHRoZSBJ
UE1JIHNwZWMgdGhlcmUgaXMgbm8gc3VwcG9ydCBmb3IgbWlsbGlBbXBlcmVzIG9yIG1pbGxpVm9s
dHMuDQogDQpJJ20gbm90IHJlYWxseSBzdXJlIGhvdyB0byBjYW1lIHRvIHRoaXMgY29uY2x1c2lv
bi4gIFllcywgdGhlcmUgaXMgbm8gIm1pbGxpYW1wIiB1bml0IGluIHRoZSB1bml0IGNvZGVzIHRh
YmxlLCBidXQgSSB3b3VsZG4ndCBleHBlY3QgdGhlcmUgdG8gYmUgZ2l2ZW4gaG93IElQTUkgc2Vu
c29yIHNjYWxpbmcgd29ya3MuICBGb3IgbGluZWFyIHNjYWxpbmcgbW9kZSAod2hpY2ggaXMgYWxs
IG9wZW5ibWMgc3VwcG9ydHMgdG9kYXkpIHZhbHVlIHNjYWxpbmcgaXMgc2V0IGJ5IE0gYW5kIEIg
dmFsdWVzIGluIGEgdHlwZSAxIFNEUiByZWNvcmQuICBTZXR0aW5nIGFuIE0gdmFsdWUgb2YgMTAw
MCBhbmQgYSB1bml0cyBmbGFnIG9mIFZvbHRzIHdvdWxkIGVmZmVjdGl2ZWx5IGdpdmUgeW91ICJt
aWxsaXZvbHRzIiByZXNvbHV0aW9uLg0KDQpBbm90aGVyIG9wdGlvbiBoZXJlIHdvdWxkIGJlIHRv
IHVzZSBsb2dhcml0aG1pYyBzY2FsaW5nLCB3aGljaCB3b3VsZCBnaXZlIHlvdSBiZXR0ZXIgcmVz
b2x1dGlvbiBpbiB0aGUgbG93ZXIgZW5kIG9mIHRoZSBzcGVjdHJ1bSAoZXNwZWNpYWxseSB1c2Vm
dWwgaW4gdGhlIGNhc2Ugb2YgbWlsbGl2b2x0cykuICBJZiB0aGlzIGlzIHNvbWV0aGluZyB5b3Un
ZCBsaWtlIHRvIHB1cnN1ZSwgdGhlcmUncyBsaWtlbHkgc29tZSBwZW9wbGUgb24gdGhpcyBsaXN0
IHRoYXQgY291bGQgcG9pbnQgeW91IHRvIHdoZXJlIHRoYXQgY2FwYWJpbGl0eSBjb3VsZCBiZSBh
ZGRlZC4NCg0KU29tZSBzZWN0aW9ucyBvZiB0aGUgSVBNSSBzcGVjIHRvIHJlZmVyZW5jZSBmb3Ig
dGhlIGFib3ZlDQoNCjM2LjMgU2Vuc29yIFJlYWRpbmcgQ29udmVyc2lvbiBGb3JtdWxhDQozNi40
LjIgUmVzb2x1dGlvbi4NCjQzLjEgU0RSIFR5cGUgMDFoLCBGdWxsIHNlbnNvciByZWNvcmQsIGJ5
dGVzIDI1OjI4DQoNClRoZXJlIGhhcyBiZWVuIHNvbWUgZWZmb3J0IG1hZGUgdG8gbWFrZSB0aGVz
ZSB2YWx1ZXMgY2FsY3VsYXRlZCBhdXRvbWF0aWNhbGx5IGJhc2VkIG9uIHRoZSBtYXhpbXVtIGFu
ZCBtaW5pbXVtIHZhbHVlIHJlYWRpbmdzIGluIHRoZSBEQnVzIGludGVyZmFjZSwgd2hpY2ggbWFr
ZXMgdGhpcyBwcm9jZXNzIGZhciBsZXNzIGVycm9yIHByb25lLiAgSWYgdGhpcyBraW5kIG9mIHRo
aW5nIGlzIGltcG9ydGFudCB0byB5b3UsIEkgd291bGQgaGlnaGx5IHJlY29tbWVuZCByZXZpZXdp
bmcgYW5kIGFkZGluZyB5b3VyIG9waW5pb24gdG8gdGhvc2UgcGF0Y2hlcy4NCg0KLUVkDQo=
