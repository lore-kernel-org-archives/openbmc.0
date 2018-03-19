Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404kxc6Mj3zF1Vk
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 05:24:49 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2018 11:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,331,1517904000"; d="scan'208";a="212971106"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by fmsmga005.fm.intel.com with ESMTP; 19 Mar 2018 11:24:44 -0700
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Mon, 19 Mar 2018 11:24:44 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.126]) by
 ORSMSX112.amr.corp.intel.com ([169.254.3.31]) with mapi id 14.03.0319.002;
 Mon, 19 Mar 2018 11:24:44 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Patrick Venture <venture@google.com>, Ratan K Gupta <ratagupt@in.ibm.com>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: Sdbusplus-based Shared Library
Thread-Topic: Sdbusplus-based Shared Library
Thread-Index: AQHTv6WIcKkb22Mlh0ufnoKwqRW4yKPX3lWQ
Date: Mon, 19 Mar 2018 18:24:44 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932F66E12E@ORSMSX114.amr.corp.intel.com>
References: <CAO=notwXV+EaWJqV61qkZaDSA3mxMhpXbq3iWUqRp2Qg52wMGA@mail.gmail.com>
In-Reply-To: <CAO=notwXV+EaWJqV61qkZaDSA3mxMhpXbq3iWUqRp2Qg52wMGA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDk1MTc4ODEtZmMzYy00YzdiLTgxNDUtMzljYmY3ZGUwZjgxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6Ink2QnFqMkpOXC9hTUk1bWpzYXVKY0c4S0RUWFdFMUZZYWVkMWw2dERmVEhvPSJ9
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
X-List-Received-Date: Mon, 19 Mar 2018 18:24:53 -0000

SGF2ZSB5b3UgdHJpZWQgcHJvdG90eXBpbmcgdG8gc2VlIGhvdyBtdWNoIHNwYWNlIHlvdSdsbCBz
YXZlPyAgSSBzdXNwZWN0IGl0IHdvbid0IGJlIGEgbG90IGZvciBhIGZldyByZWFzb25zLg0KDQox
LiBBIGxvdCBvZiBzZGJ1c3BsdXMgaXMgdGVtcGxhdGUgaW5zdGFudGlhdGlvbnMsIGFuZCB1bmxl
c3Mgd2UgZm9yd2FyZCBkZWNsYXJlIGEgbnVtYmVyIG9mIGJhc2UgdGVtcGxhdGUgaW5zdGFudGlh
dGlvbnMgZm9yIHVzZSBpbiB0aGUgc2hhcmVkIGxpYnJhcnksIG1vc3Qgb2YgdGhlIGFwcGxpY2F0
aW9uIGNvZGUgd2lsbCBlbmQgdXAgaW4gdGhlIGJpbmFyeSBhbnl3YXkuDQoyLiBTZGJ1cyBjYWxs
cyBpbnRvIGxpYnN5c3RlbWQsIHdoaWNoIGlzIGFscmVhZHkgYSBzaGFyZWQgbGlicmFyeS4NCjMu
IFRoZSBmaWxlc3lzdGVtIGlzIGFscmVhZHkgY29tcHJlc3NlZCwgc28gSSBzdXNwZWN0IHRoYXQg
YW55IGR1cGxpY2F0ZWQgbWV0aG9kcyB0aGF0IGFyZW4ndCBpbmxpbmVkIHdpbGwgaGF2ZSB0aGUg
c2FtZSBiaW5hcnkgY29kZSBwYXR0ZXJuIGFuZCBnZXQgZHVwbGljYXRlZCBieSB0aGUgc3F1YXNo
ZnMgZmlsZXN5c3RlbS4NCg0KVGhvc2UgYXJlIGFsbCB0aGUgcmVhc29ucyB3aHkgSSBoYXZlbid0
IHJlYWxseSBsb29rZWQgaW50byBpdCBmb3IgdGhlIGRidXMgc3R1ZmY7ICBJIGNhbid0IHNwZWFr
IHRvIHRoZSB0aW1lciBzdHVmZiwgYnV0IEkgc3VzcGVjdCB0aGUgd2lucyBpbiBzaXplIHRoZXJl
IGFyZSBnb2luZyB0byBiZSBzbWFsbC4NCg0KTm9ybWFsIGRpc2NsYWltZXIsIG9uIHRoaXMgc3Bl
Y2lmaWMgbGlicmFyeSwgSSBoYXZlbid0IHByb3RvdHlwZWQgYW55dGhpbmcsIGp1c3QgZG9uZSBi
YWNrIG9mIHRoZSBuYXBraW4gZ3Vlc3Nlcywgc28gSSBjb3VsZCB2ZXJ5IGVhc2lseSBiZSBtaXNz
aW5nIHNvbWV0aGluZyBoZXJlLg0KDQotRWQNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBvcGVuYm1jIFttYWlsdG86b3BlbmJtYy0NCj4gYm91bmNlcytlZC50YW5vdXM9
aW50ZWwuY29tQGxpc3RzLm96bGFicy5vcmddIE9uIEJlaGFsZiBPZiBQYXRyaWNrDQo+IFZlbnR1
cmUNCj4gU2VudDogTW9uZGF5LCBNYXJjaCAxOSwgMjAxOCAxMDoxMiBBTQ0KPiBUbzogUmF0YW4g
SyBHdXB0YSA8cmF0YWd1cHRAaW4uaWJtLmNvbT47IEJyYWQgQmlzaG9wDQo+IDxicmFkbGV5YkBm
dXp6aWVzcXVpcnJlbC5jb20+OyBPcGVuQk1DIE1haWxsaXN0DQo+IDxvcGVuYm1jQGxpc3RzLm96
bGFicy5vcmc+DQo+IFN1YmplY3Q6IFNkYnVzcGx1cy1iYXNlZCBTaGFyZWQgTGlicmFyeQ0KPiAN
Cj4gV2UgaGF2ZSBhIGxvdCBvZiBkdXBsaWNhdGlvbiBhY3Jvc3MgZGFlbW9ucyB1c2luZyBzZGJ1
c3BsdXMsIGFuZCBubyBuZXcNCj4gdXRpbGl0eSBsaWJyYXJ5LiAgVG8gYXZvaWQgZXZlcnkgZGFl
bW9uIGhhdmluZyB0aGVpciBvd24gdGltZXIgb2JqZWN0LCBhbmQNCj4gdGhlaXIgb3duIHRoaXMg
b3IgdGhhdCwgSSBzdWdnZXN0IHdlIGNyZWF0ZSB0aGlzIHNoYXJlZCBsaWJyYXJ5Lg0KPiANCj4g
VGhvdWdodHM/ICBXZSBjYW4gc3RhcnQgc2ltcGxlLCBqdXN0IGhhdmUgYSB0aW1lciBvYmplY3Qg
aW4gdGhlcmUsIGFuZCB0aGVuDQo+IHRoZSBuZXcgdGltZXJzIGJlaW5nIGludHJvZHVjZWQgdG8g
cGhvc3Bob3ItaHdtb24gYW5kIHBob3NwaG9yLWhvc3QtDQo+IGlwbWlkIGNhbiBiZSB0aGUgZmly
c3QgY3VzdG9tZXJzLg0KPiANCj4gUGF0cmljaw0K
