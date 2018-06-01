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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40y7QT115KzDrpC
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jun 2018 01:23:42 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Jun 2018 08:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,467,1520924400"; d="scan'208";a="59573089"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by fmsmga004.fm.intel.com with ESMTP; 01 Jun 2018 08:23:39 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.118]) by
 ORSMSX107.amr.corp.intel.com ([169.254.1.167]) with mapi id 14.03.0319.002;
 Fri, 1 Jun 2018 08:23:38 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Alexander Amelkin <a.amelkin@yadro.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Logging user actions
Thread-Topic: Logging user actions
Thread-Index: AQHT9nx4+IQUXMEFwkibxKm1r5YblKRIyB4AgAMDuoD//7E4gA==
Date: Fri, 1 Jun 2018 15:23:38 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169933BDDE358@ORSMSX114.amr.corp.intel.com>
References: <c0569989-b52d-745e-06fb-e92cbb1234c8@yadro.com>
 <5fe8ee1a-d4c3-e5f4-059e-d2f403849d6a@linux.vnet.ibm.com>
 <a29d9411-8000-0361-6e28-c668d2d9923f@yadro.com>
In-Reply-To: <a29d9411-8000-0361-6e28-c668d2d9923f@yadro.com>
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
X-List-Received-Date: Fri, 01 Jun 2018 15:23:45 -0000

PiANCj4gSXQgd291bGQgYmUgZ3JlYXQgaWYgd2Ugd2VyZW4ndCB1c2luZyBELUJ1cyBhdCBhbGwg
b3IgaWYgd2UgaGFkIGFsbCB1c2VyIA0KPiBpbnRlcmZhY2VzIGNvbm5lY3RlZCB0byBzb21lIGNl
bnRyYWwgaHViIHNvIHRoYXQgYWNjb3VudGluZyBpbmZvcm1hdGlvbiANCj4gd2FzIGF2YWlsYWJs
ZSB0byB0aGF0IGh1YiBhbmQgaXQgY291bGQgbG9nIGFsbCB1c2VyIHJlcXVlc3RzIGJlZm9yZSB0
cmFuc2xhdGluZw0KPiB0aGVtIGZ1cnRoZXIgdG8gRC1CdXMuDQo+IA0KPiBEb24ndCBJQk0sIEdv
b2dsZSwgSW50ZWwgYW5kIG90aGVyIGJpZyBndXlzIHdhbnQgdG8gbG9nIHVzZXIgYWN0aW9ucz8N
Cj4gSXQncyBxdWl0ZSBzdHJhbmdlIHRvIG5vdCBoYXZlIHRoaXMgZnVuY3Rpb25hbGl0eSBpbiBP
cGVuQk1DIGFuZCwgd2hhdCBpcw0KPiBtb3JlIGltcG9ydGFudCwgbm90IGhhdmUgdGhlIGFyY2hp
dGVjdHVyYWwgcG9zc2liaWxpdHkgdG8gcHJvcGVybHkgKGluIGEgc2luZ2xlDQo+IHBsYWNlKSBp
bXBsZW1lbnQgaXQuIEl0IGZlZWxzIGxpa2UgSSdtIGp1c3QgbWlzc2luZyBzb21ldGhpbmcuDQo+
IA0KPiBBbGV4YW5kZXIuDQoNCkRvZXMgSW50ZWwgd2FudCBvdXIgc3lzdGVtcyB0byBiZSBhYmxl
IHRvIGxvZyB1c2VyIGFjdGlvbnM/ICBZZXMuICBXaXRoIHRoYXQgc2FpZCwgSSdtIG5vdCByZWFs
bHkgZm9sbG93aW5nIHdoeSB0aGlzIGNvdWxkbid0IGJlIGRvbmUgb3ZlciBkYnVzLCBhbmQgd2h5
IGEgImNlbnRyYWwgaHViIiBhcyB5b3UgY2FsbCBpdCB3b3VsZCBtYWtlIHRoZSB0YXNrIGFueSBl
YXNpZXIuICBBbHNvLCBzbyB5b3UncmUgYXdhcmUsIGRidXMtZGFlbW9uICh0aGUgZW50aXR5IHRo
YXQgY29ubmVjdHMgLyBhdXRoZW50aWNhdGVzIGFuZCBhdXRob3JpemVzIGFsbCBkYnVzIGNvbm5l
Y3Rpb25zIGFuZCBtZXNzYWdlcykgY291bGQgdmVyeSBlYXNpbHkgYmUgY2FsbGVkIGEgImNlbnRy
YWwgaHViIiBhbmQgY291bGQgYmUgcGF0Y2hlZCB0byBsb2cgZXZlcnkgZGJ1cyBhY3Rpb24gaWYg
dGhhdCB3YXMgdGhlIHJvdXRlIHlvdSB3YW50ZWQgdG8gZ28gZG93bi4NCg0KSSBkb24ndCByZWFs
bHkgbGlrZSBEQnVzOyBJIGZpbmQgaXQgZGlmZmljdWx0IHRvIHVzZSwgYW5kIG1vcmUgaW1wb3J0
YW50bHkgZGlmZmljdWx0IHRvIHRlYWNoIHRvIHBlb3BsZS4gIEJ1dCBpdCdzIHdoYXQgd2UgaGF2
ZSB0b2RheSwgYW5kIHNvIGZhciBhcyBJIGNhbiB0ZWxsLCBpdCBpcyBjYXBhYmxlIG9mIHNlcnZp
bmcgdGhlIHB1cnBvc2VzIHdlIG5lZWQgaXQgdG8gc2VydmUsIGluY2x1ZGluZyB0aGUgbG9nZ2lu
ZyBmZWF0dXJlcyB3ZSBuZWVkIHRvIGJ1aWxkIGluIHRoZSBmdXR1cmUuICBJZiB5b3UgaGF2ZSBh
IHN1Z2dlc3Rpb24gZm9yIGEgYmV0dGVyIElQQyBkZXNpZ24sIGFuZCBhcmUgd2lsbGluZyB0byBt
b3ZlIGFsbCBvZiB0aGUgZXhpc3RpbmcgZGFlbW9ucyBvdmVyIHRvIGl0LCBJJ20gc3VyZSBzb21l
IHBlb3BsZSB3b3VsZCBiZSB3aWxsaW5nIHRvIGhlYXIgdG8geW91IG91dCwgYnV0IEkgZG9uJ3Qg
dGhpbmsgbG9nZ2luZyBiZWluZyBkaWZmaWN1bHQgdG8gaW1wbGVtZW50IGp1c3RpZmllcyB0aGF0
IGtpbmQgb2YgbWFqb3IgY2hhbmdlIGZvciB0aGUgcHJvamVjdC4NCg0KQ2FuIHlvdSBleHBhbmQg
YSBsaXR0bGUgb24geW91ciBjb21tZW50IHRoYXQgZGJ1cyBkb2Vzbid0IGhhdmUgYW55IGFjY291
bnRpbmcgaW4gaXRzIG1lc3NhZ2VzIHNpZ25hbHM/ICBJdCBoYXMgdGltaW5nIGluZm9ybWF0aW9u
LCBhcyB3ZWxsIGFzIHVzZXIgaW5mb3JtYXRpb24uICBXZXJlIHlvdSBob3BpbmcgZm9yIGEgInJl
cXVlc3RlZCBmcm9tIGludGVyZmFjZSIgdHlwZSBmaWVsZD8gIFRvZGF5IGV2ZXJ5IGRhZW1vbiBp
cyBydW5uaW5nIGFzIHJvb3QsIGFuZCBub3QgYXV0aG9yaXppbmcgYXMgYSBzcGVjaWZpYyBzeXN0
ZW0gdXNlciwgc28gdGhhdCBhdXRob3JpemF0aW9uIGluZm8gaXMgbm90IHZlcnkgdXNlZnVsLCBi
dXQgdGhhdCBjb3VsZCBiZSBjaGFuZ2VkIHdpdGggYSBnb29kIHVuZGVyc3RhbmRpbmcgb2YgdGhl
IHBlcm1pc3Npb25zIHN5c3RlbSwgYW5kIGEgZ29vZCB1bmRlcnN0YW5kaW5nIG9mIGRidXMsIGFu
ZCBieSBtYWtpbmcgdGhlIGRhZW1vbnMgcnVuIGFzIG5vbi1yb290LiAgV2UgYXJlIGluIHRoZSBw
cm9jZXNzIG9mIHRyeWluZyB0byBkbyB0aGlzIGFueXdheSBmb3IgYm1jd2ViLCBhbGJlaXQgZm9y
IGRpZmZlcmVudCByZWFzb25zLCBidXQgdGhlIGNvbmNlcHQgc2hvdWxkIGJlIHNpbWlsYXIuDQoN
CkFub3RoZXIgZGVzaWduIHRoYXQgY291bGQgYmUgYXR0ZW1wdGVkIGNvdWxkIGJlIHRvIGFkZCBh
IG5ldyBzaWduYWwgbmFtZWQgInVzZXIgYWN0aW9uIiB0aGF0IHdlIGNvdWxkIHBsdW1iIGludG8g
YWxsIHRoZSB1c2VyIGZhY2luZyBkYWVtb25zIHRoYXQgd291bGQgcG9wdWxhdGUgdGhlIGluZm9y
bWF0aW9uIHRvIHRoZSBsb2dnaW5nIGRhZW1vbi4gIEFsbCB0aGUgdXNlci1mYWNpbmcgZGFlbW9u
cyB3b3VsZCB0aGVuIGJlIHJlcXVpcmVkIHRvIHNlbmQgdGhhdCBzaWduYWwgKGVpdGhlciBhdXRv
bWF0aWNhbGx5IHZpYSB0aGUgc2RidXNwbHVzIGJpbmRpbmdzLCBvciBtYW51YWxseSkgb24gYSB1
c2VyIGFjdGlvbi4gIFdoaWxlIG5vdCB0aGUgaWRlYWwgc29sdXRpb24sIGl0IHNlZW1zIGxpa2Ug
aXQgd291bGQgc29sdmUgdGhlIHByb2JsZW0gd2l0aCBnZW5lcmF0aW5nIHRvbyBtYW55IHN5c3Rl
bSBpbnRlcm5hbCBldmVudHMsIGFuZCB3b3VsZCBtYWtlIHdoYXQgd2UncmUgbG9nZ2luZyB2ZXJ5
IGV4cGxpY2l0LiAgQWxzbywgd2UgY291bGQgYXR0YWNoIHdoYXRldmVyIGluZm9ybWF0aW9uIHdl
IHNlZSBmaXQuDQoNCkknbSBzdXJlIG90aGVyIGhhdmUgaWRlYXMgb24gaG93IHRvIG1ha2UgdGhp
cyB3b3JrLiAgSW4gc2hvcnQsIEkgd291bGQgbXVjaCByYXRoZXIgc3BlbmQgcmVzb3VyY2VzIG9u
IG1ha2luZyB0aGUgY3VycmVudCBzb2x1dGlvbiB3ZSBoYXZlIHdvcmsgZm9yIGFsbCB1c2UgY2Fz
ZXMsIGV2ZW4gaWYgaXQncyBub3QgYSBiZWF1dGlmdWwgYXJjaGl0ZWN0dXJlLCB0aGFuIGF0dGVt
cHRpbmcgdG8gcmVjcmVhdGUgd2hhdCB3ZSBoYXZlIHVzaW5nIGFub3RoZXIgSVBDLg0KDQotRWQN
Cg==
