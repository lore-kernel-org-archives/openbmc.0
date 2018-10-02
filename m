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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42PvG05M7vzF38n
 for <openbmc@lists.ozlabs.org>; Wed,  3 Oct 2018 08:39:03 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Oct 2018 15:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,333,1534834800"; d="scan'208";a="95918753"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga001.jf.intel.com with ESMTP; 02 Oct 2018 15:38:43 -0700
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 2 Oct 2018 15:38:43 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.194]) by
 ORSMSX155.amr.corp.intel.com ([169.254.7.228]) with mapi id 14.03.0319.002;
 Tue, 2 Oct 2018 15:38:43 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Patrick Venture <venture@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: OEM i2c over IPMI
Thread-Topic: OEM i2c over IPMI
Thread-Index: AQHUWoqk1a5lshazQ0uUAGGdTf00CKUMbKhA
Date: Tue, 2 Oct 2018 22:38:42 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E8216993458541EA@ORSMSX114.amr.corp.intel.com>
References: <CAO=notz0ibE=yZOtg4DE-onDDOWKHvPx_pRTp6OAH7JqRfH3dw@mail.gmail.com>
In-Reply-To: <CAO=notz0ibE=yZOtg4DE-onDDOWKHvPx_pRTp6OAH7JqRfH3dw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: request-justification,no-action
x-originating-ip: [10.22.254.139]
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
X-List-Received-Date: Tue, 02 Oct 2018 22:39:05 -0000

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuYm1jIFttYWlsdG86b3Bl
bmJtYy0NCj4gYm91bmNlcytlZC50YW5vdXM9aW50ZWwuY29tQGxpc3RzLm96bGFicy5vcmddIE9u
IEJlaGFsZiBPZiBQYXRyaWNrDQo+IFZlbnR1cmUNCj4gU2VudDogVHVlc2RheSwgT2N0b2JlciAy
LCAyMDE4IDE6MDAgUE0NCj4gVG86IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZz4NCj4gU3ViamVjdDogT0VNIGkyYyBvdmVyIElQTUkNCj4gDQo+IFdlIGhhdmUgYSBs
aW51eCBrZXJuZWwgZHJpdmVyIGZvciBpMmMtdmlhLWlwbWkgdGhhdCB0aWVzIGludG8NCj4gaHR0
cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8xMjYwNCAtIEknbSBwdXR0aW5nIHRoaXMg
dXBzdHJlYW0gYnV0DQo+IHNpbmNlIGl0J3MgYW4gSVBNSSBPRU0gaGFuZGxlciwgaXQgY2FuIG5p
Y2VseSBnbyBpbnRvIGl0cyBvd24gcmVwb3NpdG9yeSAtIEkgd2FzDQo+IGN1cmlvdXMgaWYgdGhl
cmUgd2FzIGFueSBPcGVuQk1DIGludGVyZXN0PyAgSWYgc28sIHdlIGNhbiBhaW0gZm9yIHRoZQ0K
PiBwaG9zcGhvciBuYW1lc3BhY2UsIG90aGVyd2lzZSBJJ2xsIGp1c3QgYXNrIHRoYXQgaXQgYmUg
cHVzaGVkIGludG8gYSBnb29nbGUNCj4gcmVwby4NCj4gDQoNCldoYXQgZG9lcyB0aGlzIGNvbW1h
bmQgZG8gdGhhdCB0aGUgZXhpc3RpbmcgbWFzdGVyIHdyaXRlLXJlYWQgY29tbWFuZCAoc2VjdGlv
biAyMi4xMSBvZiB0aGUgSVBNSSBzcGVjKSBkb2Vzbid0Pw0KDQpJIGtub3cgb24gcGFzdCBzeXN0
ZW1zIHdlJ3ZlIG9mZmVyZWQgdGhlIE9FTSBJMkMgY29tbWFuZCB0byBnZXQgYXJvdW5kIHRoZSA4
IGNoYW5uZWwgbGltaXQgZm9yIHRoZSBzdG9jayBjb21tYW5kLiAgSSBjYW4ndCB0ZWxsIGlmIHRo
YXQncyB0aGUgY2FzZSB3aXRoIHRoaXMgb25lLCBidXQgd2Ugc2hvdWxkIHByb2JhYmx5IGhhdmUg
YSBzdGF0ZW1lbnQgb24gZXhhY3RseSB3aGF0IHdlJ3JlIHRyeWluZyB0byBzb2x2ZSBjb21wYXJl
ZCB0byB0aGUgSVBNSSBtYXN0ZXIgd3JpdGUgcmVhZC4NCg0KSXQgc2hvdWxkIGFsc28gYmUgbm90
ZWQgdGhhdCBtYXN0ZXIgd3JpdGUtcmVhZCBvcGVucyB1cCBzb21lIHByZXR0eSBzY2FyeSBzZWN1
cml0eSBzY2VuYXJpb3MsIGVzcGVjaWFsbHkgd2hlbiBkb25lIG92ZXIgSVBNSS4gIFdlIHNob3Vs
ZCBwcm9iYWJseSBtYWtlIHN1cmUgaXQncyBpc29sYXRlZCB0byBpdHMgb3duIGxpYnJhcnkgc28g
dGhlIGhpZ2ggc2VjdXJpdHkgc3lzdGVtcyBjYW4gb3B0IG91dCBvZiBpdCBpZiBuZWVkIGJlLg0K
DQotRWQNCg==
