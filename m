Return-Path: <nilan.naidoo@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=nilan.naidoo@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43B1XZ2M3SzDrdc
 for <openbmc@lists.ozlabs.org>; Fri,  7 Dec 2018 16:40:43 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Dec 2018 21:40:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,324,1539673200"; d="scan'208";a="257531234"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by orsmga004.jf.intel.com with ESMTP; 06 Dec 2018 21:40:40 -0800
Received: from orsmsx122.amr.corp.intel.com ([169.254.11.147]) by
 ORSMSX103.amr.corp.intel.com ([169.254.5.249]) with mapi id 14.03.0415.000;
 Thu, 6 Dec 2018 21:40:40 -0800
From: "Naidoo, Nilan" <nilan.naidoo@intel.com>
To: Jeremy Kerr <jk@ozlabs.org>, openbmc <openbmc@lists.ozlabs.org>
CC: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>, David Thompson
 <dthompson@mellanox.com>, Emily Shaffer <emilyshaffer@google.com>, Dong Wei
 <Dong.Wei@arm.com>, Andrew Geissler <geissonator@gmail.com>
Subject: RE: Initial MCTP design proposal
Thread-Topic: Initial MCTP design proposal
Thread-Index: AQHUjdZYZngH62qlC0Oe/pVC3VgkIKVynVUAgACiX4D//3xdIA==
Date: Fri, 7 Dec 2018 05:40:40 +0000
Message-ID: <471CB8EC3D4A874BBFE213C33E2BC2170E8C9648@ORSMSX122.amr.corp.intel.com>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <471CB8EC3D4A874BBFE213C33E2BC2170E8C95D6@ORSMSX122.amr.corp.intel.com>
 <b6a65831e47d25a624835a895b8af935f321999d.camel@ozlabs.org>
In-Reply-To: <b6a65831e47d25a624835a895b8af935f321999d.camel@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: request-justification,no-action
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2RjNDQyMTgtOWNmYS00YmFjLTg3ZmMtOGYyNTU5Y2RjY2UxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVW1yank2V09LRTFiWDlITmMzQkdXR24xUFwvTFpRclwvbzVVNnJnVFJaTUdiaHVhS0YwblwvalBPekZ0Vm9uRnZYSyJ9
x-ctpclassification: CTP_NT
x-originating-ip: [10.22.254.138]
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
X-List-Received-Date: Fri, 07 Dec 2018 05:40:47 -0000

SGkgSmVyZW15LA0KDQpUaGUgQVNQRUVEIGRvZXMgaGF2ZSAgaGFyZHdhcmUgc3VwcG9ydCBmb3Ig
UENJZSBWRE0gdmlhIHRoZSBNQ1RQIENvbnRyb2xsZXIgYmxvY2suIA0KDQpOaWxhbg0KDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBKZXJlbXkgS2VyciBbbWFpbHRvOmprQG96
bGFicy5vcmddIA0KU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDYsIDIwMTggOTowNyBQTQ0KVG86
IE5haWRvbywgTmlsYW4gPG5pbGFuLm5haWRvb0BpbnRlbC5jb20+OyBvcGVuYm1jIDxvcGVuYm1j
QGxpc3RzLm96bGFicy5vcmc+DQpDYzogU3VwcmVldGggVmVua2F0ZXNoIDxTdXByZWV0aC5WZW5r
YXRlc2hAYXJtLmNvbT47IERhdmlkIFRob21wc29uIDxkdGhvbXBzb25AbWVsbGFub3guY29tPjsg
RW1pbHkgU2hhZmZlciA8ZW1pbHlzaGFmZmVyQGdvb2dsZS5jb20+OyBEb25nIFdlaSA8RG9uZy5X
ZWlAYXJtLmNvbT47IEFuZHJldyBHZWlzc2xlciA8Z2Vpc3NvbmF0b3JAZ21haWwuY29tPg0KU3Vi
amVjdDogUmU6IEluaXRpYWwgTUNUUCBkZXNpZ24gcHJvcG9zYWwNCg0KSGkgTmlsYW4sDQoNClRo
YW5rcyBmb3IgdGFraW5nIGEgbG9vay4NCg0KPiBBcyBmYXIgYXMgdGhlIGZlYXR1cmVzIHRoYXQg
bmVlZCB0byBiZSBzdXBwb3J0ZWQsIHdlIGFyZSBpbml0aWFsbHkgDQo+IGludGVyZXN0ZWQgaW4g
UENJZSBWRE0gYW5kIFNNQnVzL0kyQyBoYXJkd2FyZSBiaW5kaW5ncy4NCg0KT0ssIHN1cmUgdGhp
bmcuIElzIHRoaXMgb24gQVNQRUVEIGhhcmR3YXJlPw0KDQo+ICAgVGhlIEJNQyB3aWxsIGFsc28g
bmVlZCB0byBiZSB0aGUgQnVzIG93bmVyIGZvciB0aGUgaW50ZXJmYWNlcy4NCj4gIEl0IGlzIG5v
dCBjbGVhciB0byBiZSB5ZXQgaWYgd2Ugd291bGQgYWxzbyBuZWVkIGJyaWRnaW5nIGZvciBvdXIg
DQo+IGluaXRpYWwgdXNlIGNhc2VzLg0KDQpZZXMsIEkgdGhpbmsgdGhpcyBtYXRjaGVzIG91ciBk
ZXNpZ25zIHRvbzsgSSBkb24ndCBzZWUgdXMgbmVlZGluZyBicmlkZ2luZyBhdCBwcmVzZW50Lg0K
DQo+ICAgVGhlIG1lc3NhZ2UgdHlwZXMgdGhhdCB3ZSBuZWVkIHRvIHN1cHBvcnQgYXJlIE5WTWUt
U0ksIFBMRE0gYW5kIA0KPiBWZW5kb3IgRGVmaW5lZCAtIFBDSSAoMHg3RSkuIFdlIGN1cnJlbnRs
eSBkb24ndCBoYXZlIGEgc3Ryb25nIG5lZWQgZm9yIA0KPiBzdXBwb3J0aW5nIHRoZSBob3N0IGlu
dGVyZmFjZS4NCg0KT2gsIGludGVyZXN0aW5nLCBJIGRpZG4ndCBleHBlY3QgZm9sa3MgdG8gYmUg
dXNpbmcgTUNUUCBidXQgbm90IGluY2x1ZGluZyB0aGUgaG9zdCBjaGFubmVsLiBUaGVyZSdzIG5v
IGlzc3VlIHdpdGggdGhhdCwgc28gSSdsbCB1cGRhdGUgdGhlIHdvcmRpbmcgc28gaXQncyBjbGVh
ciB0aGF0IHRoaXMgY2FuIGJlIGFjY29tbW9kYXRlZC4NCg0KQ2hlZXJzLA0KDQoNCkplcmVteQ0K
DQo=
