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
 by lists.ozlabs.org (Postfix) with ESMTPS id 420bqz0fGbzDrJ7
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 16:51:09 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2018 23:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,301,1531810800"; d="scan'208";a="68685584"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by orsmga007.jf.intel.com with ESMTP; 28 Aug 2018 23:50:55 -0700
Received: from orsmsx160.amr.corp.intel.com (10.22.226.43) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 28 Aug 2018 23:50:54 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX160.amr.corp.intel.com ([169.254.13.106]) with mapi id 14.03.0319.002;
 Tue, 28 Aug 2018 23:50:54 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Lei YU <mine260309@gmail.com>, William Kennington <wak@google.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "james.feist@linux.intel.com"
 <james.feist@linux.intel.com>
Subject: RE: Header inclusion ordering style addition
Thread-Topic: Header inclusion ordering style addition
Thread-Index: AQHUPvWw9pbGG4QcyE+P1jSU+NeRh6TV53uAgAAFGwCAAKydAP//sWQA
Date: Wed, 29 Aug 2018 06:50:54 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169934583716B@ORSMSX114.amr.corp.intel.com>
References: <CAO=notzut2sd4GZvA3gMzoB+J7g48nXnXKONhnwNfJC8jPWPAg@mail.gmail.com>
 <c3d8f4e3-86e2-8fae-5c6e-49632262b8a9@linux.intel.com>
 <CAPnigK=420eP_9d04FMCyvCzyoDB=f7i+ZbNMkxa5kGL9avd3A@mail.gmail.com>
 <CAARXrt=Mq9PFZ-ia9pE5WKxbSUYatx9R9Uj7Bum1AHiyFvP5VQ@mail.gmail.com>
In-Reply-To: <CAARXrt=Mq9PFZ-ia9pE5WKxbSUYatx9R9Uj7Bum1AHiyFvP5VQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTg3NGYzYjItMTJhZC00OWQ3LWJkZmQtYWIwYzgyZjRlMDZmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoienZ5VTlUTFdIVXQ4TjJaZHhTTlJXMGlYeG14b0l1QWpYU2t6WHo0UnpRN0pGdTNja2Rwb2MrWWV3ekpobUtWayJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
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
X-List-Received-Date: Wed, 29 Aug 2018 06:51:12 -0000

PiANCj4gVGhlcmUgaXMgY2VydGFpbiBjYXNlIHRoYXQgYSBoZWFkZXIgZmlsZSBpcyBleHBlY3Rl
ZCB0byBiZSBpbmNsdWRlZCBiZWZvcmUNCj4gb3RoZXJzLCBlLmcuIGNvbmZpZy5oIGdlbmVyYXRl
ZCBieSBhdXRvdG9vbCBzaGFsbCBiZSBpbmNsdWRlZCBiZWZvcmUgb3RoZXINCj4gbG9jYWwgaGVh
ZGVyIGZpbGVzLCB0byBlbnN1cmUgdGhhdCB0aGUgY29uZmlncyBhcmUgY29ycmVjdGx5IGRlZmlu
ZWQuDQo+IEUuZy4NCj4gDQo+ICAgICAjaW5jbHVkZSAiY29uZmlnLmgiDQo+ICAgICAjaW5jbHVk
ZSAiYmFyLmhwcCINCj4gDQo+IFdpbGwgY2xhbmctZm9ybWF0IHJlLWZvcm1hdCB0aGUgb3JkZXIg
b24gdGhlIGFib3ZlIGNhc2U/IElmIHllcywgSSBoYXZlDQo+IGNvbmNlcm4gdGhhdCBpdCBjb3Vs
ZCBpbnRyb2R1Y2UgaXNzdWVzLCBlLmcuIGNvbXBpbGUgZXJyb3IgYWJvdXQgdW5kZWZpbmVkDQo+
IHN5bWJvbHMuDQo+IElmIGNsYW5nLWZvcm1hdCBoYW5kbGVzIGl0IHdlbGwsIGl0J3MgZ3JlYXQh
DQoNCklmIGNsYW5nLWZvcm1hdCBpcyB0b2xkIHRvIG9wZXJhdGUgdGhpcyB3YXksIGl0IHdpbGwu
ICBJdCB1c2VzIHJlZ2V4IG1hdGNoZWQgInByaW9yaXRpZXMiIHRoZW4gZmFsbHMgYmFjayB0byBh
bHBoYWJldGljYWwuICBJZiBjb25maWcuaCBuZWVkcyB0byBiZSBmaXJzdCwgaXQganVzdCBuZWVk
cyB0byBiZSBwdXQgaW4gdGhlIGFwcHJvcHJpYXRlIHNwb3QgaW4gdGhlIC5jbGFuZy1mb3JtYXQg
ZmlsZSB0aGF0IGV2ZXJ5b25lIHVzZXMuDQoNCkkgYWdyZWUgd2l0aCB0aGUgb3RoZXIgc2VudGlt
ZW50cyB0aGF0IHNvIGxvbmcgYXMgaXQncyBkb25lIHZpYSBjbGFuZy1mb3JtYXQsIGZlZWwgZnJl
ZSB0byBpbXBvc2Ugd2hhdGV2ZXIgaGVhZGVyIG9yZGVyIGlzIGRlc2lyZWQuDQo=
