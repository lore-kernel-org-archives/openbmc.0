Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.90; helo=esa1.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="xV2z+0aN"; 
 dkim-atps=neutral
Received: from esa1.dell-outbound.iphmx.com (esa1.dell-outbound.iphmx.com
 [68.232.153.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcsrc16jRzF1CC
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 09:12:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1518127492; x=1549663492;
 h=from:cc:to:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aB3JChXHQNt85MqY5S7+NlmRkEuEipbxx+kQ7Vx96zk=;
 b=xV2z+0aNzcZ7WGPdIQ/sHNyj6uajlAQI8nKjt9w847DVivn1T0Y/P12I
 JiGOPrilCYD33Okpf5QH2TW2VSHrm3L9maRGrz9Mu2paVc8warIgV4KwP
 CzYAZKclRPa035aFqVhHq1N4dCPzOfRA4Hr0Dbs+aEpu16cnxAgO1Fx9D 0=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EPAQDSyXxah8qZ6ERdGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQnEHAoCoNbmEuCAo9eiAyBQEMKGAuFGAIaghVYFAECAQEBAQE?=
 =?us-ascii?q?BAgECEAEBAQoLCQgoL4I4IhFLKTABAQEBAQEBAQEBAQEBAQEBARgCDTAtAQEBA?=
 =?us-ascii?q?QIBASIROgsMBAIBCBEEAQEBAgIjAwICAiYeAQgIAgQBEggTiCCBcggQr06CJ4h?=
 =?us-ascii?q?6ggoBAQEBAQEBAQIBAQEBAQEBAQEBARgFgQ+DbYIVhm2DIwwEgTwBEgEmM4Jdg?=
 =?us-ascii?q?mUFiAOSIYoHCQqIFIdAQoVTgieKQIdgjXyKEIE8NjBTcHBSgkYSglOCEngBAQG?=
 =?us-ascii?q?LLYElgRcBAQE?=
X-IPAS-Result: =?us-ascii?q?A2EPAQDSyXxah8qZ6ERdGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?nEHAoCoNbmEuCAo9eiAyBQEMKGAuFGAIaghVYFAECAQEBAQEBAgECEAEBAQoLC?=
 =?us-ascii?q?QgoL4I4IhFLKTABAQEBAQEBAQEBAQEBAQEBARgCDTAtAQEBAQIBASIROgsMBAI?=
 =?us-ascii?q?BCBEEAQEBAgIjAwICAiYeAQgIAgQBEggTiCCBcggQr06CJ4h6ggoBAQEBAQEBA?=
 =?us-ascii?q?QIBAQEBAQEBAQEBARgFgQ+DbYIVhm2DIwwEgTwBEgEmM4JdgmUFiAOSIYoHCQq?=
 =?us-ascii?q?IFIdAQoVTgieKQIdgjXyKEIE8NjBTcHBSgkYSglOCEngBAQGLLYElgRcBAQE?=
Received: from esa2.dell-outbound2.iphmx.com ([68.232.153.202])
 by esa1.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Feb 2018 16:04:48 -0600
From: <Michael.E.Brown@dell.com>
Cc: <rolfb@us.ibm.com>, <ed.tanous@intel.com>, <jwcarman@us.ibm.com>,
 <yupalani@microsoft.com>, <Paul.Vancil@dell.com>, <pradeep.kumar36@tcs.com>,
 <alirhas@microsoft.com>, <bradleyb@fuzziesquirrel.com>,
 <openbmc@lists.ozlabs.org>, <Balaji.B.Rao@dell.com>
Received: from ausxipps310.us.dell.com ([143.166.148.211])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Feb 2018 04:08:15 +0600
X-LoopCount0: from 10.166.135.98
X-IronPort-AV: E=Sophos;i="5.46,480,1511848800"; d="scan'208";a="128925737"
X-DLP: DLP_GlobalPCIDSS
To: <venture@google.com>, <joel@jms.id.au>
Subject: RE: Mailing list posting guidelines
Thread-Topic: Mailing list posting guidelines
Thread-Index: AQHTn1qps41K8R2NCke/me6zZrvGiaOYlUqAgAKiV4D//9qQcA==
Date: Thu, 8 Feb 2018 22:12:37 +0000
Message-ID: <1c422ecd21c149e9b08cf9230e8c08b3@ausx13mps334.AMER.DELL.COM>
References: <8E21FD04-4E06-4757-818F-E6CF7771265B@fuzziesquirrel.com>
 <CACPK8XeSdhqMYhEug7FCYKwgn5wDe0spvDeyR==tCEGjAoaSsg@mail.gmail.com>
 <CAO=notwHgKGhnJgCo39i5JBszcXkHrozxEZut41ATsk7iSN4jg@mail.gmail.com>
In-Reply-To: <CAO=notwHgKGhnJgCo39i5JBszcXkHrozxEZut41ATsk7iSN4jg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Feb 2018 22:12:49 -0000

VGhpcyBpcyBhbGwgcmVhbGx5IG5pY2UsIGJ1dCwgdG8gcXVvdGUgdGhlIG9wZW5zdGFjayBndWlk
ZWxpbmVzOg0KDQpPdXRsb29rDQpEb24ndCB1c2UgaXQhDQoNClNvbWUgb2YgdXMgYXJlIGZvcmNl
ZCB0byB1c2Ugb3V0bG9vayB0aHJvdWdoIG5vIGZhdWx0IG9mIG91ciBvd24sIGFuZCBoYXZlIG5v
IGFjY2VzcyB0byBnbWFpbC9ldGMgd2hpbGUgYXQgd29yayB0byBkbyBhbHRlcm5hdGl2ZSBjbGll
bnRzLg0KDQpUaGUgcG9zdGluZyBndWlkZWxpbmVzIGFyZSBhIHZlcnkgbGFyZ2UgYmFycmllciB0
byBlbnRyeSBhbmQgaHVnZSBzb3VyY2Ugb2Ygc3RyZXNzIHRvIHBlb3BsZSB3YW50aW5nIHRvIHBh
cnRpY2lwYXRlIChzcGVha2luZyBvbiBteSBiZWhhbGYgYnV0IGFsc28gb24gYmVoYWxmIG9mIHNl
dmVyYWwgb3RoZXJzIHdobyBoYXZlIGFwcHJvYWNoZWQgbWUgYWJvdXQgdGhpcykuIEFzIGEgc3Ry
b25nIG9wZW4gc291cmNlIGFkdm9jYXRlLCB0aGlzIHJlYWxseSBib3RoZXJzIG1lIHRvIHNheSwg
YnV0IHBlb3BsZSBuZWVkIHRvIGdldCBvdmVyIHRoZW1zZWx2ZXMgYWJvdXQgdGhpcy4gWWVzLCBp
dCdzIG11Y2ggZWFzaWVyIHRvIGZvbGxvdyBpZiB5b3UgaGF2ZSBhIHNhbmUgZW1haWwgY2xpZW50
IHRoYXQgY2FuIGJvdHRvbSBwb3N0LCBidXQgbWFueSBvZiB1cyBkb24ndCBoYXZlIHRoYXQgb3B0
aW9uLCBhbmQgdGhlIHRob3VnaHQgb2Ygc2V0dGluZyB1cCBhbHRlcm5hdGl2ZSBjbGllbnRzIGZv
ciBldmVyeWJvZHkgd2FudGluZyB0byBwYXJ0aWNpcGF0ZSBpcy4uLiB1bndvcmthYmxlLg0KDQpN
eSBzZXR1cCBmb3IgcG9zdGluZyB0byB0aGUgbWFpbGluZyBsaXN0IGlzIGJleW9uZCBsdWRpY3Jv
dXMgKEludm9sdmluZyB0d28gc2VwYXJhdGUgU1NIIHR1bm5lbHMgdG8gZGlmZmVyZW50IG1hY2hp
bmVzIGFuZCBNdXR0KSwgYW5kIEknbSBub3Qgd2lsbGluZyB0byBmb3JjZSB0aGF0IG9uIGV2ZXJ5
Ym9keSBoZXJlLiBBbHNvLCBiZWNhdXNlIEkgZG9uJ3QgYWx3YXlzIGhhdmUgYWNjZXNzIHRvIHRo
YXQgbWFjaGluZSwgaXQgbWVhbnMgSSBjYW5ub3QgcmVzcG9uZCB0byBhbnl0aGluZyBmb3IgbGFy
Z2UgcGFydHMgb2YgdGhlIGRheS4NCg0KSXMgdGhlcmUgYSBwcm9kdWN0aXZlIHNvbHV0aW9uIHRv
IHRoaXMgaW5zb2x1YmxlIHByb2JsZW0/DQotLQ0KTWljaGFlbA0KDQpUb3AgcG9zdGVkIG9uIHB1
cnBvc2UuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1jIFttYWls
dG86b3BlbmJtYy1ib3VuY2VzK21pY2hhZWwuZS5icm93bj1kZWxsLmNvbUBsaXN0cy5vemxhYnMu
b3JnXSBPbiBCZWhhbGYgT2YgUGF0cmljayBWZW50dXJlDQpTZW50OiBUaHVyc2RheSwgRmVicnVh
cnkgOCwgMjAxOCAxMjoxNiBQTQ0KVG86IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQpD
Yzogcm9sZmJAdXMuaWJtLmNvbTsgVGFub3VzLCBFZCA8ZWQudGFub3VzQGludGVsLmNvbT47IGp3
Y2FybWFuQHVzLmlibS5jb207IFl1Z2kgTWFuaSA8eXVwYWxhbmlAbWljcm9zb2Z0LmNvbT47IFZh
bmNpbCwgUGF1bCA8UGF1bF9WYW5jaWxARGVsbC5jb20+OyBwcmFkZWVwLmt1bWFyMzZAdGNzLmNv
bTsgYWxpcmhhc0BtaWNyb3NvZnQuY29tOyBCcmFkIEJpc2hvcCA8YnJhZGxleWJAZnV6emllc3F1
aXJyZWwuY29tPjsgT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPjsg
UmFvLCBCYWxhamkgQiA8QmFsYWppX0JfUmFvQGRlbGwuY29tPg0KU3ViamVjdDogUmU6IE1haWxp
bmcgbGlzdCBwb3N0aW5nIGd1aWRlbGluZXMNCg0KT24gVHVlLCBGZWIgNiwgMjAxOCBhdCA2OjAy
IFBNLCBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PiB3cm90ZToNCj4gT24gV2VkLCBGZWIg
NywgMjAxOCBhdCAxOjE0IEFNLCBCcmFkIEJpc2hvcCA8YnJhZGxleWJAZnV6emllc3F1aXJyZWwu
Y29tPiB3cm90ZToNCj4+IEl0IHdhcyBwb2ludGVkIG91dCB0byBtZSB0aGF0IHRoZSBSZWRmaXNo
IHRocmVhZCB3YXMgaGFyZCB0byBmb2xsb3cgDQo+PiBhbG9uZyAoYXMgaW4sIGhhcmQgdG8gcmVh
ZCkuDQo+Pg0KPj4gSSBqdXN0IHdhbnRlZCB0byBoaWdobGlnaHQgdGhhdCB0aGVyZSBhcmUgbWFp
bGluZyBsaXN0IHBvc3RpbmcgDQo+PiBndWlkZWxpbmVzIGRlc2lnbmVkIHRvIGNvbWJhdCB0aGlz
LiAgSGVyZeKAmXMgYSBnb29kIG92ZXJ2aWV3IC0gcGF5IA0KPj4gcGFydGljdWxhciBhdHRlbnRp
b24gdG8gdGhlIHNlY3Rpb25zIG9uIHBsYWluIHRleHQsIHRvcCBwb3N0aW5nLCBhbmQgcXVvdGlu
ZzoNCj4+DQo+PiBodHRwczovL2ZlZG9yYXByb2plY3Qub3JnL3dpa2kvTWFpbGluZ19saXN0X2d1
aWRlbGluZXMjUHJvcGVyX3Bvc3RpbmcNCj4+IF9zdHlsZQ0KPg0KPiBUaGFua3MgQnJhZC4gSW4g
YWRkaXRpb24sIE9wZW5TdGFjayBoYXMgc29tZSBnb29kIHF1YWxpdHkgZGV0YWlsZWQgDQo+IGRv
Y3VtZW50YXRpb24gdGhhdCBJIHdvdWxkIHJlY29tbWVuZDoNCj4NCj4gIGh0dHBzOi8vd2lraS5v
cGVuc3RhY2sub3JnL3dpa2kvTWFpbGluZ0xpc3RFdGlxdWV0dGUNCg0KSGlsYXJpb3VzIGV4YW1w
bGVzLiAgQmx1ZSBzdWNrcyEgOkQgQnV0IGhlbHBmdWwuDQoNCj4NCj4gQ2hlZXJzLA0KPg0KPiBK
b2VsDQoNClRoYW5rcw0K
