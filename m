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
 by lists.ozlabs.org (Postfix) with ESMTPS id 416CFx4pJhzF09q
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jun 2018 04:44:16 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2018 11:44:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,224,1526367600"; d="scan'208";a="67050770"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga002.jf.intel.com with ESMTP; 14 Jun 2018 11:44:12 -0700
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.88]) by
 ORSMSX106.amr.corp.intel.com ([169.254.1.45]) with mapi id 14.03.0319.002;
 Thu, 14 Jun 2018 11:44:12 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: Lei YU <mine260309@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Patrick Venture <venture@google.com>
Subject: RE: Feature request in phosphor-pid-control
Thread-Topic: Feature request in phosphor-pid-control
Thread-Index: AQHUA7Dr/5UDbPiPHkKlpxBjeYcNkKRf/g3ggACNFgD//4uqgA==
Date: Thu, 14 Jun 2018 18:44:11 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E8216993457F640A@ORSMSX113.amr.corp.intel.com>
References: <CAARXrt=XaO=t=UuSDjcgZ=Nkh9J7vTQJPEAMG5=_Ca7ukRVekA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E8216993457F637B@ORSMSX113.amr.corp.intel.com>
 <417F1A7A-09A0-4EF4-AF57-0D90D3135DEB@fuzziesquirrel.com>
In-Reply-To: <417F1A7A-09A0-4EF4-AF57-0D90D3135DEB@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
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
X-List-Received-Date: Thu, 14 Jun 2018 18:44:22 -0000

PiANCj4gSeKAmW0gcHJldHR5IHN1cmUgTWF0dCBCYXJ0aCBhZGRlZCBzdXBwb3J0IGZvcg0KPiB4
eXoub3BlbmJtY19wcm9qZWN0LlN0YXRlLkRlY29yYXRvci5PcGVyYXRpb25hbFN0YXR1cw0KPiB0
byBwaG9zcGhvci1od21vbiBhbHJlYWR5LiAgSXQgY2VydGFpbmx5IGRvZXNu4oCZdCBjb3ZlciBz
b21ldGhpbmcgbGlrZQ0KPiBtYXBwZXIgdGltZW91dHMgdGhvdWdoIChub3Igc2hvdWxkIGl0LCBJ
TU8pLg0KPiANCg0KSW50ZXJlc3RpbmcuLi4uLiAgSSBoYWQgbm8gaWRlYS4gIFRoYXQgSSB0aGlu
ayB0aGF0IHNvbHZlcyBoYWxmIG9mIHRoZSBpc3N1ZSAob3BlcmF0aW9uYWwgdmVyc3VzIG5vdCks
IGJ1dCBzdGlsbCBzZWVtcyB0byBtaXNzIHRoZSBkaXN0aW5jdGlvbiBiZXR3ZWVuIHVuYXZhaWxh
YmxlIGFuZCBlcnJvci4NCg0KV2l0aCB0aGF0IHNhaWQsIGl0IHNvdW5kcyBsaWtlIGl0IG1pZ2h0
IHNvbHZlIHRoZSBpc3N1ZSBpbiB0aGUgY29udGV4dCBvZiB0aGlzIGRpc2N1c3Npb24sIHNvIHRo
YXQncyBwcmV0dHkgY29vbC4NCg0KLUVkDQo=
