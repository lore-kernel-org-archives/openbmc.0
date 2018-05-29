Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wKkg2dStzDr4N
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 03:01:19 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 May 2018 10:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,457,1520924400"; d="scan'208";a="54875412"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by orsmga003.jf.intel.com with ESMTP; 29 May 2018 10:01:13 -0700
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 29 May 2018 10:01:13 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.118]) by
 ORSMSX159.amr.corp.intel.com ([169.254.11.44]) with mapi id 14.03.0319.002;
 Tue, 29 May 2018 10:01:12 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: Gerrit +1 policy
Thread-Topic: Gerrit +1 policy
Thread-Index: AQHT90xHV2Z3ECcBmEC57Th+9XCmYqRHVimA//+YtmA=
Date: Tue, 29 May 2018 17:01:12 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169933BDDB5C5@ORSMSX114.amr.corp.intel.com>
References: <CACPK8Xc_gTiJaCUzDiG6aNOu7rF6gU3e_oc-bd19bOswju7yTw@mail.gmail.com>
 <CAO=notx8OwkJrKf6LhhDZ=_-96e+C0y=REtFEPLfDbdWxLDQSw@mail.gmail.com>
In-Reply-To: <CAO=notx8OwkJrKf6LhhDZ=_-96e+C0y=REtFEPLfDbdWxLDQSw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
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
X-List-Received-Date: Tue, 29 May 2018 17:01:32 -0000

KzEuDQoNCkkndmUgYmVlbiBoaXQgd2l0aCB0aGUgc2FtZSB0aGluZyBwcmV2aW91c2x5Lg0KDQot
RWQNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuYm1jIFttYWls
dG86b3BlbmJtYy0NCj4gYm91bmNlcytlZC50YW5vdXM9aW50ZWwuY29tQGxpc3RzLm96bGFicy5v
cmddIE9uIEJlaGFsZiBPZiBQYXRyaWNrDQo+IFZlbnR1cmUNCj4gU2VudDogVHVlc2RheSwgTWF5
IDI5LCAyMDE4IDk6MTIgQU0NCj4gVG86IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQo+
IENjOiBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQo+IFN1Ympl
Y3Q6IFJlOiBHZXJyaXQgKzEgcG9saWN5DQo+IA0KPiArMiENCj4gDQo+IE9uIFR1ZSwgTWF5IDI5
LCAyMDE4IGF0IDU6NTMgQU0sIEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+IHdyb3RlOg0K
PiA+IEkgZ2V0IGZydXN0cmF0ZWQgYnkgR2Vycml0IHJlbW92aW5nICsxcyBmcm9tIHBhdGNoZXMg
d2hlbiBJIG1ha2UgYQ0KPiA+IHNtYWxsIGNoYW5nZSB0byB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+
ID4NCj4gPiBUaGlzIGlzIGEgY29uZmlndXJhYmxlIG9wdGlvbiBpbiBHZXJyaXQ6DQo+ID4NCj4g
PiBodHRwczovL2dlcnJpdC1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9Eb2N1bWVudGF0aW9uL2Nv
bmZpZy1sYWJlbHMuaHRtDQo+ID4gbCNsYWJlbF9jb3B5QWxsU2NvcmVzSWZOb0NvZGVDaGFuZ2UN
Cj4gPg0KPiA+IEkgd291bGQgbGlrZSB0byBwcm9wb3NlIHdlIGNoYW5nZSB0aGlzIHNldHRpbmcg
dG8gdHJ1ZS4NCj4gPg0KPiA+IFRoZSBkb3duc2lkZSBpcyBzb21lb25lIGNvdWxkIHJhZGljYWxs
eSBjaGFuZ2UgdGhlIGNvbnRlbnQgb2YgdGhlaXINCj4gPiBjb21taXQgbWVzc2FnZSB0aGF0IHlv
dSd2ZSArMSdkLiBIb3dldmVyIHRoZSBtYWludGFpbmVyIHN0aWxsIGdldHMgYQ0KPiA+IGNoYW5j
ZSB0byBwdWxsIHNvbWVvbmUgdXAgb24gdGhpcyBpZiB0aGV5IHRoaW5rIHNvbWVvbmUgaGFzIHB1
bGxlZCBhDQo+ID4gc3dpZnQgb25lLg0KPiA+DQo+ID4gSWYgdGhlcmUgYXJlIHNvbWUgcmVwb3Np
dG9yaWVzIHRoYXQgd291bGQgbGlrZSB0byBtYWludGFpbiB0aGUgc3RhdHVzDQo+ID4gcXVvLCB0
aGlzIGNvdWxkIGJlIGRvbmUgYXQgdGhlIHRvcCBsZXZlbCwgc28gdGhhdCBhbGwgcmVwb3NpdG9y
aWVzDQo+ID4gaW5oZXJpdCB0aGUgbmV3IGRlZmF1bHQsIGJ1dCB3b3VsZCBhbGxvdyBmb3IgaW5k
aXZpZHVhbCBwcm9qZWN0cyB0bw0KPiA+IG92ZXJyaWRlIHRoZSBzZXR0aW5nIGlmIHRoZXkgZGVz
aXJlZC4NCj4gPg0KPiA+IENoZWVycywNCj4gPg0KPiA+IEpvZWwNCg==
