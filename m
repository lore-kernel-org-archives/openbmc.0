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
 by lists.ozlabs.org (Postfix) with ESMTPS id 420PP42DkZzDr4h
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 09:00:38 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2018 16:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,300,1531810800"; d="scan'208";a="258858001"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by fmsmga006.fm.intel.com with ESMTP; 28 Aug 2018 16:00:33 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 28 Aug 2018 16:00:33 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX153.amr.corp.intel.com ([169.254.12.242]) with mapi id 14.03.0319.002;
 Tue, 28 Aug 2018 16:00:33 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Rebecca Broekhuis <beccabroek@gmail.com>, "jk@ozlabs.org" <jk@ozlabs.org>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: SOL Logging
Thread-Topic: SOL Logging
Thread-Index: AdQ768XuiEM9C2PZSeev9pRHOBKrsgCdlf6AADs4lwAACyVWoA==
Date: Tue, 28 Aug 2018 23:00:32 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345836E07@ORSMSX114.amr.corp.intel.com>
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
 <d94fd642-a114-1ed8-aa89-e2951848adbb@ozlabs.org>
 <CABzWfrk0XZy0SibsaUqqBDWzXa9uXSsioeF7z1HWXOts=M3y=g@mail.gmail.com>
In-Reply-To: <CABzWfrk0XZy0SibsaUqqBDWzXa9uXSsioeF7z1HWXOts=M3y=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDk1MDBhOWYtNTgwMS00YjFjLWJkMmQtNjMxNmNlYWYwZTQyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiK3dFdmF3TzVwektOTGVlUldoWUVoNHZsbnNIMDIzdXBqR3hXdWtRS1JyenVKcjhGRlB3NnIrSEdtR205NzlXaSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
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
X-List-Received-Date: Tue, 28 Aug 2018 23:00:41 -0000

PiBZb3UgbWVudGlvbmVkIHRoZSBwb3NzaWJpbGl0eSBvZiBwcmUtcG9wdWxhdGluZyB0aGUgc2Ny
b2xsYmFjayBidWZmZXIgb2YgdGhlIGNvbnNvbGUgaW50ZXJmYWNlLiBJIGFtIHdvbmRlcmluZyBp
ZiB5b3UgaGF2ZSBhbnkgbW9yZSBpbmZvcm1hdGlvbiBhYm91dA0KID4gaG93IGRpZmZpY3VsdCB0
aGlzIHdvdWxkIGJlIHRvIGltcGxlbWVudC4gT3VyIGNvbmNlcm4gd2hlbiB0aGlua2luZyBhYm91
dCBkb2luZyB0aGlzIHdhcyBob3cgY29tcGxleCBpdCBtaWdodCBnZXQgdG8gZmV0Y2ggdGhlIGZp
bGUgYW5kIHBvcHVsYXRlIHRoZSBjb25zb2xlDQo+IHdoaWxlIGF0IHRoZSBzYW1lIHRpbWUgcmVj
ZWl2aW5nIG1lc3NhZ2VzIGJ5IHdlYnNvY2tldCB3aXRob3V0IG1pc3NpbmcgYW55IG1lc3NhZ2Vz
LiBBbnkgaW5zaWdodCBvbiB0aGlzPw0KDQpJIGRvbid0IHRoaW5rIHRoZSBoYXJkIHBhcnQgaXMg
cmVhZGluZyBpbiB0aGUgZmlsZSBhbmQgcGxheWluZyBpdCBiYWNrLiAgSSB0aGluayB0aGUgaGFy
ZCBwYXJ0IGlzIHRoYXQgdGhlIGNoYXJhY3RlcnMgdGhhdCBjaGFuZ2VkIHRoZSBzY3JlZW4gc3Rh
dGUgbWF5IGhhdmUgYWxyZWFkeSBzY3JvbGxlZCBwYXN0IHRoZSBlbmQgb2YgdGhlIGJ1ZmZlciwg
aW4gd2hpY2ggY2FzZSwgeW91J3ZlIGxvc3QgdGhlIGRhdGEgdGhhdCB5b3UgbmVlZCB0byBwcm9w
ZXJseSBwYWludCB0aGUgc2NyZWVuLiAgSSB3b3VsZCBsaWtlbHkgYmUgYmV0dGVyIHRoYW4gbm90
aGluZywgYnV0IG1pZ2h0IG5vdCBiZSBlbm91Z2g/DQoNCldpdGggdGhhdCBzYWlkLCBpc24ndCB0
aGlzIGV4YWN0bHkgdGhlIHVzZSBjYXNlIHRoYXQgc2NyZWVuIG9yIHRtdXggaGF2ZT8gIElzIHRo
ZXJlIGNvZGUgd2UgY291bGQgc3RlYWwgYW5kIGRyb3AgaW50byBvYm1jLWNvbnNvbGUgZnJvbSBv
bmUgb2YgdGhvc2UgdGhhdCB0cmFja3MgdGhlIHNjcmVlbiBzdGF0ZSwgYW5kIG9uIHRoZSBjb25u
ZWN0aW9uIG9mIGEgbmV3IGNsaWVudCwgYmxhc3RzIHRoZSBzY3JlZW4gc3RhdGUgZG93biBzbyB0
aGF0IGl0IG1hdGNoZXMgZXhhY3RseT8NCg==
