Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40N3v06771zF1qT
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 03:00:40 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Apr 2018 10:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,446,1517904000"; d="scan'208";a="33475788"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga008.jf.intel.com with ESMTP; 13 Apr 2018 10:00:34 -0700
Received: from orsmsx160.amr.corp.intel.com (10.22.226.43) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Fri, 13 Apr 2018 10:00:34 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.92]) by
 ORSMSX160.amr.corp.intel.com ([169.254.13.99]) with mapi id 14.03.0319.002;
 Fri, 13 Apr 2018 10:00:34 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: 'Deepak Kodihalli' <dkodihal@linux.vnet.ibm.com>, "geissonator@gmail.com"
 <geissonator@gmail.com>, "gmills@linux.vnet.ibm.com"
 <gmills@linux.vnet.ibm.com>, "jayashankar.padath@in.ibm.com"
 <jayashankar.padath@in.ibm.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: Serial Over Lan in the webui
Thread-Topic: Serial Over Lan in the webui
Thread-Index: AQHT0w4KLfnK0ii3KUWWPsWQbFlPYKP+1Zlg
Date: Fri, 13 Apr 2018 17:00:34 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932F689D5D@ORSMSX114.amr.corp.intel.com>
References: <6bb68901-d843-16eb-02ae-588ce52f91a7@linux.vnet.ibm.com>
In-Reply-To: <6bb68901-d843-16eb-02ae-588ce52f91a7@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: request-justification,no-action
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
X-List-Received-Date: Fri, 13 Apr 2018 17:00:45 -0000

SSBzZW50IHlvdSBhIGZldyByZXBsaWVzIG9uIElSQywgbm90IHN1cmUgaWYgeW91IHNhdyBhbnkg
b2YgdGhlbS4gIFNvbWUgaWRlYXMgYXJlIGJlbG93Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IERlZXBhayBLb2RpaGFsbGkgW21haWx0bzpka29kaWhhbEBsaW51eC52
bmV0LmlibS5jb21dDQo+IFNlbnQ6IEZyaWRheSwgQXByaWwgMTMsIDIwMTggMjo1OSBBTQ0KPiBU
bzogZ2Vpc3NvbmF0b3JAZ21haWwuY29tOyBUYW5vdXMsIEVkIDxlZC50YW5vdXNAaW50ZWwuY29t
PjsNCj4gZ21pbGxzQGxpbnV4LnZuZXQuaWJtLmNvbTsgamF5YXNoYW5rYXIucGFkYXRoQGluLmli
bS5jb207IEJyYWQgQmlzaG9wDQo+IDxicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+DQo+IENj
OiBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQo+IFN1YmplY3Q6
IFNlcmlhbCBPdmVyIExhbiBpbiB0aGUgd2VidWkNCj4gDQo+IEJhc2VkIG9uIG15IGludmVzdGln
YXRpb24sIGl0IG1pZ2h0IG5vdCBiZSBwb3NzaWJsZSB0byBnZXQgdGhlIFNPTCB3b3JraW5nIGlu
DQo+IHRoZSBVSSB2aWEgdGhlIGxhdHRlciBzY2VuYXJpby4gVGhpcyBpcyBiZWNhdXNlIGl0IGRv
ZXNuJ3Qgc2VlbSB0byBiZSBwb3NzaWJsZSB0bw0KPiBpbXBsZW1lbnQgYW4gc3NoIGNsaWVudCB3
aXRoIGNsaWVudC1zaWRlIGh0bWwgYW5kIGphdmFzY3JpcHQgdGhhdCBhIGJyb3dzZXINCj4gY2Fu
IHJ1biBieSBpdHNlbGYsIGFuZCB0aGF0J3MgYmVjYXVzZSBqYXZhc2NyaXB0IHJ1bm5pbmcgaW4g
dGhlIGJyb3dzZXIgZG9lc24ndA0KPiBoYXZlIHJhdyB0Y3AvaXAgc29ja2V0IHN1cHBvcnQuDQoN
ClRvIG15IHVuZGVyc3RhbmRpbmcsIHRoZXJlIGlzIG5vIHdheSB0byBpbXBsZW1lbnQgYnJvd3Nl
ciBXZWJVSSBiYXNlZCBTU0ggaW4gZWl0aGVyIHNjZW5hcmlvIHdpdGhvdXQgYSBzZXBhcmF0ZSBj
b252ZXJzaW9uIHRvIHdlYnNvY2tldHMsIGFzIEkgZG8gbm90IGJlbGlldmUgdGhlcmUgaXMgYW55
IGJyb3dzZXIgc3VwcG9ydCBmb3IgdGhlIGxvdyBsZXZlbCBzb2NrZXQgYWNjZXNzIHlvdSBuZWVk
IHRvIGRpcmVjdGx5IGNvbm5lY3QgdG8gYW4gU1NIIHNvY2tldC4gIEFzIHlvdSBzYWlkLCB5b3Ug
YXJlIHJ1bm5pbmcgYW4gaW50ZXJtZWRpYXJ5IG9uIHlvdXIgZGV2ZWxvcG1lbnQgc3lzdGVtIHRv
IGRvIHRoaXMgbm93LCB3aGljaCBkb2Vzbid0IHdvcmsgd2hlbiBkZXBsb3lpbmcgdG8gdGhlIHBs
YXRmb3JtLg0KDQo+IA0KPiBTbyB0aGUgcXVlc3Rpb24gaXMgaG93IGRvIHdlIHNvbHZlIHRoaXMg
d2hlbiB0aGUgd2VidWkgY29kZSBpcyBzZXJ2ZWQgYnkNCj4gdGhlIEJNQz8NCg0KWW91IHdpbGwg
bmVlZCBzb21lIHdheSB0byB0cmFuc2ZlciBldmVudHMgKHRleHQpIHRvIHRoZSBicm93c2VyLiAg
SW4gb3JkZXIsIG15IHBlcnNvbmFsIHByZWZlcmVuY2Ugd291bGQgYmU6DQoNCjEuIEJ1aWxkIGEg
ZGFlbW9uIHRoYXQgaXMgY2FwYWJsZSBvZiBmb3J3YXJkaW5nIHNvY2tldC1saWtlIGluZm9ybWF0
aW9uIG92ZXIgYW4gYXV0aGVudGljYXRlZCB3ZWJzb2NrZXQuICBUaGVyZSBhcmUgc2V2ZXJhbCBl
eGFtcGxlcyBvZiBob3cgdG8gZG8gdGhpcywgQm1jd2ViIGhhcyBhbiBleGFtcGxlIG9mIHNlbmRp
bmcgVk5DLWxpa2UgcHJvdG9jb2xzIG92ZXIgYW4gYXV0aGVudGljYXRlZCB3ZWJzb2NrZXQuICBS
ZXN0LWRidXMgaGFzIGEgd2Vic29ja2V0IGZvciB0cmFuc2ZlcnJpbmcgZGJ1cyBldmVudGluZyBp
bmZvLiAgWW91IGNvdWxkIHVzZSBlaXRoZXIgb2YgdGhlc2UgYXMgYW4gZXhhbXBsZSBvZiBob3cg
dG8gYnVpbGQgeW91ciBvd24uDQoyLiBVc2Ugc29tZXRoaW5nIGxpa2UgU1NFIHRvIHRyYW5zZmVy
IHRoZSBidWZmZXJzIGFuZCBmb3J3YXJkIHRoZSBldmVudHMuDQpodHRwczovL2RldmVsb3Blci5t
b3ppbGxhLm9yZy9lbi1VUy9kb2NzL1dlYi9BUEkvU2VydmVyLXNlbnRfZXZlbnRzL1VzaW5nX3Nl
cnZlci1zZW50X2V2ZW50cw0KMy4gVXNlIGxvbmcgcG9sbGluZyBvbiBhIHJlc3QgYXBpIHRvIHRy
YW5zZmVyIGJ1ZmZlcnMuDQpodHRwczovL3d3dy5wdWJudWIuY29tL2Jsb2cvMjAxNC0xMi0wMS1o
dHRwLWxvbmctcG9sbGluZy8NCg0KPiBJcyBhbnlvbmUgYXdhcmUgb2YgYSBwdXJlIGNsaWVudC1z
aWRlIGphdmFzY3JpcHQgYmFzZWQgc3NoIGNsaWVudD8gSWYNCj4gbm90LCB3ZSdkIGhhdmUgdG8g
cnVuIE5vZGUgb3Igc29tZXRoaW5nIGVxdWl2YWxlbnQgb24gdGhlIEJNQw0KWW91IGFyZSBmcmVl
IHRvIGRvIHdoYXQgeW91IHdhbnQsIGJ1dCBJIHdvdWxkbuKAmXQgcmVjb21tZW5kIHRoaXMgcm91
dGUsIGFuZCB3b3VsZCByZXNpc3QgYW55IGF0dGVtcHRzIHRvIHB1dCBpdCBpbiBhbiB1cHN0cmVh
bSBjb21wb25lbnQgcGF0Y2hzZXQuICBOb2RlSlMgaXMgdmVyeSBoZWF2eXdlaWdodCBmb3IgcnVu
bmluZyBvbiB0aGUgQk1DIGhhcmR3YXJlLCBpbiBib3RoIGZsYXNoIHVzYWdlIGFuZCBzdGFydHVw
IHRpbWUsIGFzIGl0J3Mgaml0IGNvbXBpbGluZyBpdHMgc291cmNlcyB1c2luZyBWOC4gIEZvciBz
b21ldGhpbmcgcmVsYXRpdmVseSBzaW1wbGUgKGZvcndhcmRpbmcgYSBzZXJpYWwgaW50ZXJmYWNl
IHRvIGEgd2Vic29ja2V0KSBJIGRvIG5vdCBiZWxpZXZlIHRoZSBpbmZyYXN0cnVjdHVyZSBjb3N0
IG9mIG1haW50YWluaW5nIG5vZGVqcyBvbiB0aGUgQk1DIGlzIHdhcnJhbnRlZC4NCg0KPiwgb3Ig
aGF2ZQ0KPiB0aGUgUkVTVCBzZXJ2ZXIgYWN0IGFzIGEgcHJveHkgc2VydmVyIGJldHdlZW4gdGhl
IHRlcm1pbmFsIHdyaXRpbmcgdG8gYQ0KPiBzb2NrZXQgdGhhdCB0aGUgcmVzdCBzZXJ2ZXIgY2Fu
IGludGVyY2VwdCBhbmQgY29udmVydCB0byBzc2ggcGFja2V0cy4gQW55DQo+IG90aGVyIHRob3Vn
aHRzIG9uIGhvdyB0aGlzIGNhbiBiZSBhY2hpZXZlZD8NCg0KSSB3b3VsZCByZWNvbW1lbmQgZ29p
bmcgYSBsZXZlbCBkZWVwZXIsIGFuZCBhdm9pZCBTU0ggYWx0b2dldGhlci4gIERpcmVjdGx5IGNv
bm5lY3QgdGhlIHdlYnNvY2tldCB0byB0aGUgaW50ZXJmYWNlIHRoYXQgdGhlIFNTSCBkYWVtb24g
aXMgc291cmNpbmcgc2VyaWFsIGZyb20uYA0K
