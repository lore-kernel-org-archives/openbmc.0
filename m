Return-Path: <kuiying.wang@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41ky1m738SzDqCF
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 11:42:18 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2018 18:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,453,1526367600"; d="scan'208";a="79481484"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga001.jf.intel.com with ESMTP; 06 Aug 2018 18:41:59 -0700
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Mon, 6 Aug 2018 18:41:59 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Mon, 6 Aug 2018 18:41:59 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.205]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.226]) with mapi id 14.03.0319.002;
 Tue, 7 Aug 2018 09:41:57 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: "geissonator@yahoo.com" <geissonator@yahoo.com>, "tomjoseph@in.ibm.com"
 <tomjoseph@in.ibm.com>, "Tanous, Ed" <ed.tanous@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "yong.b.li@linux.intel.com" <yong.b.li@linux.intel.com>, "Li, Yong B"
 <yong.b.li@intel.com>, "openbmc-ci-admin@ozlabs.org"
 <openbmc-ci-admin@ozlabs.org>, "richard.marian.thomaiyar@linux.intel.com"
 <richard.marian.thomaiyar@linux.intel.com>, "Mihm, James"
 <james.mihm@intel.com>
Subject: RE: Need create a repo for chassis implementation.
Thread-Topic: Need create a repo for chassis implementation.
Thread-Index: AdQeQXGDaDGflwckTomVHE0rc5P9WgFe9Y4AADIpxuABpy3gAACy9Rzg
Date: Tue, 7 Aug 2018 01:41:56 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E77249DE8512@SHSMSX101.ccr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249DD28C6@SHSMSX101.ccr.corp.intel.com>
 <1532513696.11932.8.camel@fuzziesquirrel.com>
 <959CAFA1E282D14FB901BE9A7BF4E77249DD8381@SHSMSX101.ccr.corp.intel.com>
 <9F1ED42F-FCC2-4536-8019-15019BD8D01D@fuzziesquirrel.com>
In-Reply-To: <9F1ED42F-FCC2-4536-8019-15019BD8D01D@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
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
X-List-Received-Date: Tue, 07 Aug 2018 01:42:21 -0000

SGkgQnJhZCwNClRoYW5rcyBhIGxvdCBmb3IgeW91ciBzdXBwb3J0Lg0KMS4gSSBoYXZlIGFscmVh
ZHkgd3JpdHRlbiB0aGlzIHByb2dyYW0gb24gT3BlbkJNQyBhbmQgdmVyaWZpZWQgaXQgb24gWDg2
IHBsYXRmb3JtIFdGUC4gDQoyLiBObyBuZWVkIGZvciBzcGVjaWZ5IERidXMgQVBJIGZvciB4ODYt
cG93ZXItY29udHJvbCwgYWxsIHRoZSBBUElzIGFyZSBjb21tb24uDQoNCkJUVzoNCkNhbiB5b3Ug
YWRkIG1lIG9yIG90aGVyIEludGVsIG1lbWJlciBpbnRvIHRoZSBtYWludGFpbmVyIGxpc3QgZm9y
IHRoZXNlIHR3byByZXBvcz8NCg0KDQpUaGFua3MsDQpLdWl5aW5nLg0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogQnJhZCBCaXNob3AgW21haWx0bzpicmFkbGV5YkBmdXp6aWVz
cXVpcnJlbC5jb21dIA0KU2VudDogU2F0dXJkYXksIEF1Z3VzdCAwNCwgMjAxOCA0OjA4IEFNDQpU
bzogV2FuZywgS3VpeWluZyA8a3VpeWluZy53YW5nQGludGVsLmNvbT4NCkNjOiBnZWlzc29uYXRv
ckB5YWhvby5jb207IHRvbWpvc2VwaEBpbi5pYm0uY29tOyBUYW5vdXMsIEVkIDxlZC50YW5vdXNA
aW50ZWwuY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyB5b25nLmIubGlAbGludXguaW50
ZWwuY29tOyBMaSwgWW9uZyBCIDx5b25nLmIubGlAaW50ZWwuY29tPjsgb3BlbmJtYy1jaS1hZG1p
bkBvemxhYnMub3JnOyByaWNoYXJkLm1hcmlhbi50aG9tYWl5YXJAbGludXguaW50ZWwuY29tDQpT
dWJqZWN0OiBSZTogTmVlZCBjcmVhdGUgYSByZXBvIGZvciBjaGFzc2lzIGltcGxlbWVudGF0aW9u
Lg0KDQoNCj4gT24gSnVsIDI1LCAyMDE4LCBhdCAxMDozMyBQTSwgV2FuZywgS3VpeWluZyA8a3Vp
eWluZy53YW5nQGludGVsLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBBbmRyZXcsDQo+IEkgYWdyZWUg
dy8geW91IG9uICIgc21hbGxlciwgbW9yZSBzcGVjaWZpYyByZXBvc2l0b3JpZXMiLCB0byBjcmVh
dGUgIiBwaG9zcGhvci1idXR0b25zIiBmb3IgaGFuZGxpbmcgYnV0dG9ucyBhbmQgY3JlYXRlIGRp
ZmZlcmVudCByZXBvIGZvciBwb3dlciBjb250cm9sIGZvciBzcGVjaWZpYyBtYWNoaW5lL2NvbXBh
bnkvaGFyZHdhcmUgbGlrZSAib3BlbnBvd2VyLXBvd2VyLWNvbnRyb2wiIGFuZCAiIHg4Ni1wb3dl
ci1jb250cm9sIi4NCj4gDQo+IEluIGEgd29yZCwgd2UgbmVlZCBjcmVhdGUgMyByZXBvcyBhcyBm
b2xsb3dpbmc6DQo+IHBob3NwaG9yLWJ1dHRvbnMNCg0KY3JlYXRlZC4NCg0KPiBvcGVucG93ZXIt
cG93ZXItY29udHJvbA0KDQpJIGRvbuKAmXQga25vdyBlbm91Z2ggYWJvdXQgdGhlIGRlc2lnbiB0
byBjcmVhdGUgdGhpcyByZXBvc2l0b3J5IHlldC4NCknigJltIGFzc3VtaW5nIHRoYXQgaXMgT0sg
d2l0aCBJbnRlbD8NCg0KPiB4ODYtcG93ZXItY29udHJvbA0KDQpjcmVhdGVkLiAgSSBhcG9sb2dp
emUgZm9yIHRoZSBkZWxheSwgYnV0IHRoZXJlIGlzIGEgZ2VuZXJhbCBsYWNrIG9mIGluZm9ybWF0
aW9uIGhlcmUgdGhhdCBtYWtlcyBtZSB1bmNvbWZvcnRhYmxlLCBhbmQgdGh1cyB0aGUgZGVsYXku
DQoNCkZvciBpbnN0YW5jZSAtIGlzIHRoZXJlIGEgREJ1cyBBUEkgYXNzb2NpYXRlZCB3aXRoIHRo
aXMgcHJvZ3JhbT8NCklmIHNvIC0gd2hhdCBpcyBpdD8gIEhhdmUgeW91IGFscmVhZHkgd3JpdHRl
biB0aGlzIHByb2dyYW0gYW5kIG5vdyB5b3UganVzdCB3YW50IHRvIGhvc3QgaXQgb24gT3BlbkJN
Qz8gIE9yIGlzIGl0IGEgbmV3IHByb2dyYW0/DQoNCj4gDQo+IEJyYWQsDQo+IEkgd2lsbCBub3Qg
c2VuZCBwaWN0dXJlcyBhbmQgYXR0YWNobWVudHMgdG8gdGhlIG1haWwgbGlzdCBpbiB0aGUgZnV0
dXJlLg0KDQp0aGFua3MhDQoNCj4gDQo+IFRoYW5rcywNCj4gS3VpeWluZy4NCg==
