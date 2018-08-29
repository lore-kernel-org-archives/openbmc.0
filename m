Return-Path: <kuiying.wang@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420Y2Q6rXTzF0kx
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 14:45:00 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2018 21:44:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,301,1531810800"; d="scan'208";a="79177565"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga003.jf.intel.com with ESMTP; 28 Aug 2018 21:44:46 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 28 Aug 2018 21:44:46 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 28 Aug 2018 21:44:46 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.226]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.185]) with mapi id 14.03.0319.002;
 Wed, 29 Aug 2018 12:44:44 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: "Tanous, Ed" <ed.tanous@intel.com>, "kunyi731@gmail.com"
 <kunyi731@gmail.com>
CC: "chunhui.jia@linux.intel.com" <chunhui.jia@linux.intel.com>,
 "venture@google.com" <venture@google.com>, "Mihm, James"
 <james.mihm@intel.com>, "Nguyen, Hai V" <hai.v.nguyen@intel.com>, "Feist,
 James" <james.feist@intel.com>, "Jia, Chunhui" <chunhui.jia@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Li, Yong B"
 <yong.b.li@intel.com>, "Yang, Cheng C" <cheng.c.yang@intel.com>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>, "Xu, Qiang"
 <qiang.xu@intel.com>, "geissonator@yahoo.com" <geissonator@yahoo.com>, Kun Yi
 <kunyi@google.com>
Subject: RE: RE: Proposal for caching/buffering POST codes list for one boot
 process.
Thread-Topic: RE: Proposal for caching/buffering POST codes list for one
 boot process.
Thread-Index: AdQ7eR/bc73xgP9DTP2CeieN2plWEgCYt7Gu///7+ICAAIgDgIAAALYAgAAA/ICAAGeegP/+INHQ
Date: Wed, 29 Aug 2018 04:44:43 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E77249E05E02@shsmsx102.ccr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249E020C3@shsmsx102.ccr.corp.intel.com>
 <7E9441B1E5EFFD4681F54958E8216993458353D7@ORSMSX114.amr.corp.intel.com>
 <CAO=notwzyahJ3onTynwoSff6y5NamoHRH_PtdwAyt2sgUNZh_A@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E8216993458355BC@ORSMSX114.amr.corp.intel.com>
 <2018082715593358738018@linux.intel.com>
 <7E9441B1E5EFFD4681F54958E821699345835CCF@ORSMSX114.amr.corp.intel.com>
 <CADNDqJzNhd_ApA83F8BubFUaGfrc2+W8TPw6_9PZCPwUvxH-+Q@mail.gmail.com>
 <CADNDqJwvMaGXCiFGO+3iEgNG=S=BLA=CVgZ8N2-e8m==KMGwbw@mail.gmail.com>
 <CADNDqJw8hnOGP3YEW0eS5CN7BLJ6Gu6tTxSugcJFrzrwYS7EJA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E821699345836607@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345836607@ORSMSX114.amr.corp.intel.com>
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
X-List-Received-Date: Wed, 29 Aug 2018 04:45:03 -0000

VGhhbmtzIGEgbG90IGZvciB5b3UgYWxsIGNvbW1lbnRzIGFuZCBzdWdnZXN0aW9ucy4NCkxldCBt
ZSBzdW1tYXJ5IGFuZCB1cGRhdGUgbXkgc29sdXRpb24gbm93Lg0KMS4gRGVmaW5lIGFuIGludGVy
ZmFjZSB0byBwb3N0IGNvZGUgbGlzdCAiQ29kZUxpc3QueWFtbCIgaW4gIiBwaG9zcGhvci1kYnVz
LWludGVyZmFjZXMiIHJlcG8uDQogICAgIFVuZGVyIGZvbGRlciAiIHh5ei9vcGVuYm1jX3Byb2pl
Y3QvUG9zdCAvIg0KMi4gRGVmaW5lIGEgcHJvcGVydHkgIlBvc3RDb2RlTGlzdCIgdy8gdHlwZSAi
YXJyYXlbdWludDY0XSIgKHN0ZDo6dmVjdG9yPHVpbnQ2NF90PikNCjMuIERldmVsb3BpbmcgYSBw
b3N0IGNvZGUgY2xpZW50IHRvIG1vbml0b3IgYW5kIGNvbGxlY3QgYWxsIHRoZSBwb3N0IGNvZGVz
Lg0KICAgICAgICBhKS4gZGVmaW5lIGEgIk1BWF9CT09UX0NZQ0xFX05VTSIgdG8gbGltaXQgaG93
IG1hbnkgYm9vdCBjeWNsZSBwb3N0IGNvZGVzIGNhbiBiZSBidWZmZXJlZC4NCiAgICAgICAgYiku
IHdoZW4gYSBwb3N0IGNvZGUgY29tZXMsIHB1c2ggYmFjayB0byB0aGUgZW5kIG9mIENvZGVMaXN0
IGFycmF5Lg0KICAgICAgICBjKS4gd2hlbiBhIGJvb3QgY3ljbGUgZW5kcywgcHVzaCBlbmQgZmxh
ZyBsaWtlICIweGZmZmYgKioqIGZmZmYgIiB0byB0aGUgZW5kIG9mIENvZGVMaXN0IGFycmF5Lg0K
ICAgICAgICBkKS4gd2hlbiBoaXQgdG8gbWF4IGJvb3QgY3ljbGUgbnVtYmVyLCBkZWxldGUgb25l
IGN5Y2xlIHBvc3QgY29kZSBzZXQgYXQgdGhlIGJlZ2lubmluZyBvZiBDb2RlTGlzdCBhcnJheS4N
CiAgICAgICAgZSkuIHNhdmUgQ29kZUxpc3QgcHJvcGVydHkgaW50byBmaWxlIHN5c3RlbSAiIC92
YXIvbGliL3Bob3NwaG9yLXN0YXRlLW1hbmFnZXIvcG9zdENvZGVMaXN0Ig0KNC4gY3JlYXRlIGEg
bmV3IHJlcG8gZm9yIHBvc3QgY29kZSBjbGllbnQgIiBwaG9zcGhvci1ob3N0LXBvc3QtY29kZS1j
bGllbnQiLg0KDQpUaGFua3MsDQpLdWl5aW5nLg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBUYW5vdXMsIEVkIA0KU2VudDogVHVlc2RheSwgQXVndXN0IDI4LCAyMDE4IDI6
MTAgUE0NClRvOiBrdW55aTczMUBnbWFpbC5jb20NCkNjOiBjaHVuaHVpLmppYUBsaW51eC5pbnRl
bC5jb207IHZlbnR1cmVAZ29vZ2xlLmNvbTsgV2FuZywgS3VpeWluZyA8a3VpeWluZy53YW5nQGlu
dGVsLmNvbT47IE1paG0sIEphbWVzIDxqYW1lcy5taWhtQGludGVsLmNvbT47IE5ndXllbiwgSGFp
IFYgPGhhaS52Lm5ndXllbkBpbnRlbC5jb20+OyBGZWlzdCwgSmFtZXMgPGphbWVzLmZlaXN0QGlu
dGVsLmNvbT47IEppYSwgQ2h1bmh1aSA8Y2h1bmh1aS5qaWFAaW50ZWwuY29tPjsgb3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnOyBMaSwgWW9uZyBCIDx5b25nLmIubGlAaW50ZWwuY29tPjsgWWFuZywg
Q2hlbmcgQyA8Y2hlbmcuYy55YW5nQGludGVsLmNvbT47IGJyYWRsZXliQGZ1enppZXNxdWlycmVs
LmNvbTsgWHUsIFFpYW5nIDxxaWFuZy54dUBpbnRlbC5jb20+OyBnZWlzc29uYXRvckB5YWhvby5j
b207IEt1biBZaSA8a3VueWlAZ29vZ2xlLmNvbT4NClN1YmplY3Q6IFJFOiBSRTogUHJvcG9zYWwg
Zm9yIGNhY2hpbmcvYnVmZmVyaW5nIFBPU1QgY29kZXMgbGlzdCBmb3Igb25lIGJvb3QgcHJvY2Vz
cy4NCg0KPiBPYnZpb3VzIGFub3RoZXIgdGhpbmcgd2Ugd291bGQgbmVlZCB0byBjb25zaWRlciBp
cyBwZXJmb3JtYW5jZS4gQSBob3N0IA0KPiBib290aW5nIHNlc3Npb24gY291bGQgcHJvZHVjZSBk
b3plbnMgb3IgaHVuZHJlZHMgb2YgUE9TVCBjb2RlcyBkZXBlbmRpbmcgb24gaG93IHZlcmJvc2Ug
dGhlIEJJT1MgaXMsIGFuZCB3ZSBzaG91bGQgYmUgY2FyZWZ1bCBub3QgdG8gZGVzaWduIHNvbWV0
aGluZyB0aGF0IGNyZWF0ZXMgdG9vIG11Y2ggREJ1cyB0cmFmZmljLiBUaGVzZSBlbWJlZGRlZCBw
cm9jZXNzb3JzIGFyZSBub3QgcGVyZm9ybWFuY2UgPw0KPiBiZWFzdHMgYnkgYW55IG1lYW5zLg0K
DQpJIHdvdWxkIGJlIHJlYWxseSBzdXJwcmlzZWQgaWYgUE9TVCBjb2RlcyB3ZXJlIGV2ZXIgYSBw
ZXJmb3JtYW5jZSBib3R0bGVuZWNrIGV2ZW4gaW4gd2l0aCB0aGUgd29yc3QgaW1wbGVtZW50YXRp
b24gcG9zc2libGUuICBIdW5kcmVkcyBvZiBwb3N0IGNvZGVzIGluIGEgbWludXRlIGlzIHN0aWxs
IG9yZGVycyBvZiBtYWduaXR1ZGUgbGVzcyBkYXRhIHRoYW4gdGhlIHNlbnNvcnMgYXJlIGFscmVh
ZHkgcHVzaGluZyBvdmVyIERCdXMuDQoNCj5PbiBNb24sIEF1ZyAyNywgMjAxOCBhdCA0OjUyIFBN
IEt1biBZaSA8a3VuLnlpLjczMUBnbWFpbC5jb20+IHdyb3RlOg0KPkkgdGhpbmsgdGhlIGNob2lj
ZSBvZiAqd2hlcmUqIHRvIHB1dCBzdWNoIGJ1ZmZlcmluZyB3YXJyYW50cyBzb21lIHRob3VnaHRz
IGFuZCBkZXNpZ24uIEdvaW5nIHRocm91Z2ggd2hhdCBJIGhhdmUgdGhvdWdodDoNCg0KPiAxLiBJ
dCdzIHBvc3NpYmxlIHRvIGltcGxlbWVudCBob3N0IHN0YXRlIGRldGVjdGlvbiBhbmQgaG9zdCBQ
T1NUIGNvZGUgDQo+IGJ1ZmZlcmluZyBhbGwgaW4gYSBjbGllbnQgZGFlbW9uLCB3aGljaCBpcyBh
IGxvbmctbGl2ZWQgcHJvY2VzcyB0aGF0DQo+IC0ga2VlcHMgbGlzdGVuaW5nIHRvIFBPU1QgY29k
ZXMgcHVibGlzaGVkDQo+IC0ga2VlcHMgcG9sbGluZyBob3N0IHN0YXRlDQo+IC0gd2hlbiBob3N0
IHBvd2VyIHN0YXRlIHRvZ2dsZWQsIHdyaXRlIHRoZSBQT1NUIGNvZGVzIHJlY2VpdmVkIHRvIGEg
DQo+IGZpbGUgb24gZGlzaw0KVGhpcyB3b3VsZCBtZWFuIHRoYXQgcGFydGlhbCBib290cywgb3Ig
Ym9vdHMgdGhhdCBoYXZlIG92ZXIgY3VycmVudCBpc3N1ZXMgd291bGRuJ3QgYmUgcGVyc2lzdGVk
IGF0IGFsbC4gIEl0J3MgYSBiaXQgb2YgYW4gaW1wbGVtZW50YXRpb24gZGV0YWlsIGF0IHRoaXMg
cG9pbnQsIGJ1dCBJIHN1c3BlY3Qgd2UncmUgZ29pbmcgdG8gd2FudCB0byBwZXJzaXN0IHBvc3Qg
Y29kZXMgbW9yZSBvZnRlbiB0aGFuIGp1c3QgZXZlcnkgYm9vdC4NCg0KPiBQcm9zIG9mIHRoaXMg
YXBwcm9hY2ggaXMgdGhhdCBzZXJ2ZXIgZGFlbW9ucyBhcmUga2VwdCBzaW1wbGUuIFBPU1QgY29k
ZSBzZXJ2ZXIgZG9lc24ndCBuZWVkIHRvIHRhbGsgdG8gaG9zdCBzdGF0ZSBkYWVtb24gb3IgZXZl
biBhc3N1bWUgaXRzIGV4aXN0ZW5jZS4NCj4gUHJvcyBvZiBidWZmZXJpbmcgb24gc2VydmVyIHNp
ZGU6IHBvdGVudGlhbGx5IHRoZXJlIHdpbGwgYmUgbW9yZSB0aGFuIA0KPiBvbmUgaWRlbnRpdGll
cyBuZWVkaW5nIHRoZSBsaXN0IG9mIFBPU1QgY29kZXMuIElQTUk/IExvZ2dpbmc/IEl0IHdvdWxk
IHJlYWxseSBoZWxwIGlmIHdlIGNhbiBpZGVudGlmeSBzb21lIGNvbmNyZXRlIHVzZSBjYXNlcy4N
CkkgdGhpbmsgd2UgYWxzbyBuZWVkIHRvIGNvbnNpZGVyIHRoYXQgdGhlIFBPU1QgY29kZSBzYXZp
bmcgbWVjaGFuaXNtIHNob3VsZCBiZSB1cCBhcyBzb29uIGFzIHBvc3NpYmxlIGFmdGVyIGJvb3Qg
dG8gbWFrZSBzdXJlIHRoYXQgaW4gdGhlIGNhc2Ugd2hlcmUgcG93ZXIgcmVzdG9yZSBwb2xpY3kg
aXMgc2V0IHRvIE9OLCB3ZSBjYW4gY2FwdHVyZSBhcyBtYW55IHBvc3QgY29kZXMgYXMgcG9zc2li
bGUgZnJvbSB0aGUgaG9zdCBib290aW5nLiAgSW4gcHJldmlvdXMgaW1wbGVtZW50YXRpb25zLCB0
aGlzIG1lYW50IGJ1ZmZlcmluZyBpbiB0aGUga2VybmVsIGRyaXZlciwgYW5kIG1ha2luZyB0aGUg
YXBwbGljYXRpb24gYSBsaWdodHdlaWdodCBzeXN0ZW0gZm9yIHBlcnNpc3RpbmcgUE9TVCBjb2Rl
cywgcmF0aGVyIHRoYW4gYWN0dWFsbHkgY2FwdHVyZSB0aGVtIGl0c2VsZi4NCg0K
