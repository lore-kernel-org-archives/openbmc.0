Return-Path: <kuiying.wang@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41bbkY6RkhzF0PZ
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 12:33:40 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2018 19:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,403,1526367600"; d="scan'208";a="77889282"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga002.jf.intel.com with ESMTP; 25 Jul 2018 19:33:24 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Wed, 25 Jul 2018 19:33:23 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.57]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.100]) with mapi id 14.03.0319.002;
 Thu, 26 Jul 2018 10:33:22 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "'geissonator@yahoo.com'"
 <geissonator@yahoo.com>
CC: "Tanous, Ed" <ed.tanous@intel.com>, "Li, Yong B" <yong.b.li@intel.com>,
 "'richard.marian.thomaiyar@linux.intel.com'"
 <richard.marian.thomaiyar@linux.intel.com>, "'tomjoseph@in.ibm.com'"
 <tomjoseph@in.ibm.com>, "'openbmc-ci-admin@ozlabs.org'"
 <openbmc-ci-admin@ozlabs.org>, "'adamliyi@msn.com'" <adamliyi@msn.com>,
 "'openbmc@lists.ozlabs.org'" <openbmc@lists.ozlabs.org>,
 "'yong.b.li@linux.intel.com'" <yong.b.li@linux.intel.com>
Subject: RE: Need create a repo for chassis implementation.
Thread-Topic: Need create a repo for chassis implementation.
Thread-Index: AdQeQXGDaDGflwckTomVHE0rc5P9WgFe9Y4AADIpxuA=
Date: Thu, 26 Jul 2018 02:33:21 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E77249DD8381@SHSMSX101.ccr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249DD28C6@SHSMSX101.ccr.corp.intel.com>
 <1532513696.11932.8.camel@fuzziesquirrel.com>
In-Reply-To: <1532513696.11932.8.camel@fuzziesquirrel.com>
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
X-List-Received-Date: Thu, 26 Jul 2018 02:33:42 -0000

SGkgQW5kcmV3LA0KSSBhZ3JlZSB3LyB5b3Ugb24gIiBzbWFsbGVyLCBtb3JlIHNwZWNpZmljIHJl
cG9zaXRvcmllcyIsIHRvIGNyZWF0ZSAiIHBob3NwaG9yLWJ1dHRvbnMiIGZvciBoYW5kbGluZyBi
dXR0b25zIGFuZCBjcmVhdGUgZGlmZmVyZW50IHJlcG8gZm9yIHBvd2VyIGNvbnRyb2wgZm9yIHNw
ZWNpZmljIG1hY2hpbmUvY29tcGFueS9oYXJkd2FyZSBsaWtlICJvcGVucG93ZXItcG93ZXItY29u
dHJvbCIgYW5kICIgeDg2LXBvd2VyLWNvbnRyb2wiLg0KDQpJbiBhIHdvcmQsIHdlIG5lZWQgY3Jl
YXRlIDMgcmVwb3MgYXMgZm9sbG93aW5nOg0KcGhvc3Bob3ItYnV0dG9ucw0Kb3BlbnBvd2VyLXBv
d2VyLWNvbnRyb2wNCng4Ni1wb3dlci1jb250cm9sICANCg0KQnJhZCwNCkkgd2lsbCBub3Qgc2Vu
ZCBwaWN0dXJlcyBhbmQgYXR0YWNobWVudHMgdG8gdGhlIG1haWwgbGlzdCBpbiB0aGUgZnV0dXJl
Lg0KDQpUaGFua3MsDQpLdWl5aW5nLg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBicmFkbGV5YkBiYWpvci5mdXp6aWVzcXVpcnJlbC5jb20gW21haWx0bzpicmFkbGV5YkBi
YWpvci5mdXp6aWVzcXVpcnJlbC5jb21dIE9uIEJlaGFsZiBPZiBCcmFkIEJpc2hvcA0KU2VudDog
V2VkbmVzZGF5LCBKdWx5IDI1LCAyMDE4IDY6MTUgUE0NClRvOiBXYW5nLCBLdWl5aW5nIDxrdWl5
aW5nLndhbmdAaW50ZWwuY29tPjsgJ29wZW5ibWNAbGlzdHMub3psYWJzLm9yZycgPG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZz4NCkNjOiAnZ2Vpc3NvbmF0b3JAeWFob28uY29tJyA8Z2Vpc3NvbmF0
b3JAeWFob28uY29tPjsgVGFub3VzLCBFZCA8ZWQudGFub3VzQGludGVsLmNvbT47ICd5b25nLmIu
bGlAbGludXguaW50ZWwuY29tJyA8eW9uZy5iLmxpQGxpbnV4LmludGVsLmNvbT47ICdyaWNoYXJk
Lm1hcmlhbi50aG9tYWl5YXJAbGludXguaW50ZWwuY29tJyA8cmljaGFyZC5tYXJpYW4udGhvbWFp
eWFyQGxpbnV4LmludGVsLmNvbT47ICd0b21qb3NlcGhAaW4uaWJtLmNvbScgPHRvbWpvc2VwaEBp
bi5pYm0uY29tPjsgJ29wZW5ibWMtY2ktYWRtaW5Ab3psYWJzLm9yZycgPG9wZW5ibWMtY2ktYWRt
aW5Ab3psYWJzLm9yZz47ICdhZGFtbGl5aUBtc24uY29tJyA8YWRhbWxpeWlAbXNuLmNvbT4NClN1
YmplY3Q6IFJlOiBOZWVkIGNyZWF0ZSBhIHJlcG8gZm9yIGNoYXNzaXMgaW1wbGVtZW50YXRpb24u
DQoNCk9uIFdlZCwgMjAxOC0wNy0xOCBhdCAwMjo0NiArMDAwMCwgV2FuZywgS3VpeWluZyB3cm90
ZToNCj4gSGkgQnJhZC9BbmRyZXcsDQo+ICANCj4gQXMgd2UgZGlzY3Vzc2VkLCBJIHdpbGwgdXBn
cmFkZSBDaGFzc2lzIGJhc2VkIG9uIEMrKyAmIHNkYnVzcGx1cyBieSAzIA0KPiBzdGVwcy4NCj4g
Tm93LCB0aGUgc3RlcCAxIGlzIGFsbW9zdCByZWFkeSAoUGF0Y2ggZ290IHR3byArMSksIHNvIHdl
IGNhbiBtb3ZlIG9uIA0KPiB0aGUgc3RlcCAyIOKAnHVwc3RyZWFtIHRoZSBjaGFzc2lzIGltcGxl
bWVudGF0aW9u4oCdLg0KPiBDYW4geW91IGhlbHAgY3JlYXRlIGEgcmVwbyDigJxjaGFzc2lzLW1h
bmFnZXLigJ0gZm9yIGNoYXNzaXMgDQo+IGltcGxlbWVudGF0aW9uPw0KDQpIaSBLdWl5aW5nDQoN
CkFuZHJldyB0cmllZCB0byByZXBseSB0byB5b3VyIG5vdGUgYnV0IGl0IHdhcyBib3VuY2VkIGJ5
IHRoZSBsaXN0IGZvciBiZWluZyB0b28gYmlnLiAgSW4gdGhlIGZ1dHVyZSBwbGVhc2UgZG9uJ3Qg
c2VuZCBwaWN0dXJlcyBvciBhdHRhY2htZW50cyB0byB0aGUgbGlzdC4gIEknbGwgaW5zZXJ0IEFu
ZHJldydzIHJlcGx5IGhlcmUuDQoNCnRoeCAtIGJyYWQNCg0KSGkgS3VpeWluZywgdGhhbmtzIGZv
ciByZWZhY3RvcmluZyB0aGVzZSBza2VsZXRvbiByZXBvc2l0b3JpZXMuIFdpdGhpbiBvcGVuYm1j
LCB3ZSB0cnkgdG8gaGF2ZSBzbWFsbGVyLCBtb3JlIHNwZWNpZmljIHJlcG9zaXRvcmllcy4gU28g
SSdtIHdvbmRlcmluZyBpZiBpbnN0ZWFkIHdlIHNob3VsZCBjcmVhdGUgYSByZXBvIHNwZWNpZmlj
YWxseSBmb3IgaGFuZGxpbmcgYnV0dG9ucyBvbiBvcGVuYm1jIG1hY2hpbmVzOg0KcGhvc3Bob3It
YnV0dG9ucw0KDQpUaGUgcHljaGFzc2lzY3RsIGZ1bmN0aW9uIGhhcyBhbGwgYmVlbiBkZXByZWNh
dGVkIGJ5IHBob3NwaG9yLXN0YXRlLSBtYW5hZ2VyIGludGVyZmFjZXMgKGV4Y2VwdCB0aGUgYnV0
dG9uIGV2ZW50IG1vbml0b3JpbmcpLiAgSSdkIHZvdGUgd2UganVzdCBwdXQgdGhlIGJ1dHRvbiBh
Y3Rpb25zIGluIHRoZSBuZXcgcGhvc3Bob3ItYnV0dG9uIHJlcG8gKGkuZS4NCmNhbGxpbmcgdGhl
IGFwcHJvcHJpYXRlIHN5c3RlbWQgdGFyZ2V0cykNCg0KVGhlIHBvd2VyIGNvbnRyb2wgZnVuY3Rp
b24gaXMgYSBiaXQgbW9yZSBjb21wbGljYXRlZC4gIEl0IGNvdWxkIGJlIHNwZWNpZmljIHRvIGEg
bWFjaGluZSwgc3BlY2lmaWMgdG8gYSBjb21wYW55LCBvciBzcGVjaWZpYyB0byB0aGUgdHlwZSBv
ZiBoYXJkd2FyZS4gIFRoZSBkZXNpZ24gdGhlcmUgaXMgdG8gaGF2ZSBhIGNvbW1vbiBkYnVzIEFQ
SSBhbmQgdGhlbiBhIHJlcG8gZm9yIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMuICBUaGUgY29k
ZSBpbiBza2VsZXRvbi9vcC0gcHdyY3RsL3Bvd2VyX2NvbnRyb2xfb2JqLmMgd2FzIEkgYmVsaWV2
ZSBhdHRlbXB0ZWQgdG8gYmUgd3JpdHRlbiBpbiBhIGdlbmVyaWMgd2F5IGJ1dCBiYXNlZCBvbiB5
b3VyIGluZm8gYmVsb3csIHNlZW1zIGxpa2UgZm9yIG5vdyB3ZSBuZWVkIHR3byBuZXcgcmVwb3Np
dG9yaWVzPw0KDQpvcGVucG93ZXItcG93ZXItY29udHJvbA0KeDg2LXBvd2VyLWNvbnRyb2wgIA0K
DQpBbmRyZXcNCg0KPiAgDQo+IE1vcmUgaW5mbyBhdHRhY2hlZDoNCj4gDQo+ICANCj4gICAgICAg
IA0KPiBUaGFua3MsDQo+IEt1aXlpbmcuDQo=
