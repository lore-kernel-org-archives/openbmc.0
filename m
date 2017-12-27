Return-Path: <ed.tanous@intel.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z5vsh1H0BzDqgw
 for <openbmc@lists.ozlabs.org>; Wed, 27 Dec 2017 12:10:11 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Dec 2017 17:10:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,462,1508828400"; d="scan'208";a="190000960"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by fmsmga005.fm.intel.com with ESMTP; 26 Dec 2017 17:10:06 -0800
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 26 Dec 2017 17:10:05 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.57]) by
 ORSMSX159.amr.corp.intel.com ([169.254.11.33]) with mapi id 14.03.0319.002;
 Tue, 26 Dec 2017 17:10:05 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Xo Wang <xow@google.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: Patrick Venture <venture@google.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Request for a development repo
Thread-Topic: Request for a development repo
Thread-Index: AdN6jahyxaxrVgU0Srm5/SNsVR8pOwAWdLyAADSGNoAAFhBvgACmU/3Q
Date: Wed, 27 Dec 2017 01:10:04 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932F4B31A1@ORSMSX114.amr.corp.intel.com>
References: <7E9441B1E5EFFD4681F54958E82169932F4B253F@ORSMSX114.amr.corp.intel.com>
 <CAO=noty9Z6VuPtyuCgSqVeT4jRon4=YfwzHid=8zup50gA8u4w@mail.gmail.com>
 <1513982711.5787.141.camel@fuzziesquirrel.com>
 <CAPH-5w4qt5mUnP0RRh+7vQ0zOmQU=4EqFmB=N=fwfZ9qhY9JEw@mail.gmail.com>
In-Reply-To: <CAPH-5w4qt5mUnP0RRh+7vQ0zOmQU=4EqFmB=N=fwfZ9qhY9JEw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTRkNmM5MDEtNDA0Ny00Mjk4LWEzMTItNjE2NWRhODNhOWY1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6Ik5TV1wvSEJBR2ZmZ1lWbnFpaUF3YnVqckFBZlRtczNxVmdmV0Qwa09ZSXpJPSJ9
x-originating-ip: [10.22.254.139]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Dec 2017 01:10:16 -0000

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYbyBXYW5nIFttYWlsdG86eG93
QGdvb2dsZS5jb21dDQo+IFNlbnQ6IFNhdHVyZGF5LCBEZWNlbWJlciAyMywgMjAxNyAxOjE3IEFN
DQo+IFRvOiBCcmFkIEJpc2hvcCA8YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPg0KPiBDYzog
UGF0cmljayBWZW50dXJlIDx2ZW50dXJlQGdvb2dsZS5jb20+OyBUYW5vdXMsIEVkDQo+IDxlZC50
YW5vdXNAaW50ZWwuY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+IFN1YmplY3Q6IFJl
OiBSZXF1ZXN0IGZvciBhIGRldmVsb3BtZW50IHJlcG8NCj4gDQo+IEkgd291bGRuJ3QgbWluZCBz
ZWVpbmcgc2VlaW5nIHJlcG9zIHdoZXJlIHRoZSBjb252ZW50aW9ucyBvZiAoYSkgY2VudHJhbGl6
ZWQNCj4gY29kZSByZXZpZXdzIGFuZCAoYikgb25lLXByb2plY3QtcGVyLXJlcG8gYXJlIGJyb2tl
biwgc28gbG9uZyBhcyB0aGV5IGRvbid0DQo+IGRpcmVjdGx5IGFmZmVjdCB0aGUgbWFpbiBPcGVu
Qk1DIGJ1aWxkcyAoaS5lLiBhcmUgbm90IGJlaW5nIG5pZ2h0bHkgdXBkYXRlZA0KPiBpbnRvIHRo
ZSBidWlsZCkgYW5kIHRoZXkncmUgaW50ZW5kZWQgdG8gZXZlbnR1YWxseSBoYXZlIGEgc3RhYmxl
IGhvbWUuDQoNCk9uZSBvZiB0aGUgZ29hbHMgd2l0aCB0aGlzIHJlcG8gaXMgdG8gZW5hYmxlIHRo
ZXNlIGNvbXBvbmVudHMgaW4gb3VyIHBsYXRmb3JtICh0aGF0J3MgY3VycmVudGx5IHVwc3RyZWFt
KS4gIFJpZ2h0IG5vdyB0aGF0IHBsYXRmb3JtIChXRlApIGlzbid0IGluIHRoZSBidWlsZCBzeXN0
ZW0sIGJ1dCBhdCBzb21lIHBvaW50IEkgd291bGQgaG9wZSBpdCBpcy4NCg0KPiANCj4gSSBkb24n
dCBzZWUgbXVjaCB2YWx1ZSBpbiBuYW1pbmcgaXQgYWNjb3JkaW5nIHRvIGEgY29udHJpYnV0aW5n
IG9yZ2FuaXphdGlvbiwNCj4gZXZlbiBpZiBtb3N0IGRldmVsb3BtZW50IGVmZm9ydHMgYXJlIGRl
IGZhY3RvICJvd25lZCIgYnkgc29tZSBjb21wYW55DQo+IG9yIGdyb3VwIG9yIG90aGVyLiBUaGUg
cG9pbnQgaXMgdGhhdCB5b3Ugd2FudCB1bmlsYXRlcmFsDQo+IChpc2gpIGNvbnRyb2wgb3ZlciBz
b21lIGNvZGUgaG9zdGVkIG9uIHRoZSBPcGVuQk1DIEdpdEh1YiBvcmdhbml6YXRpb24NCj4gdGhh
dCBvdGhlciBwZW9wbGUgY2FuIG9ic2VydmUsIHJldmlldywgYW5kIHBhdGNoLCByaWdodD8gSXQg
bWlnaHQgaGVscCB0bw0KPiBhY2hpZXZlIHlvdXIgZ29hbCBvZiBvcGVubmVzcyB0byBvcmdhbml6
ZSB0aGVzZSBsb29zZXIgcmVwb3MgYnkgdGhlaXINCj4gZmVhdHVyZSBhcmVhIHRoYW4gYWNjb3Jk
aW5nIHdobyB0aGVpciBjb250cm9sbGluZyBjb250cmlidXRvcnMgYXJlLg0KPiANCg0KVW5pbGF0
ZXJhbCBjb250cm9sIG1ha2VzIGl0IHNvdW5kIGxpa2Ugd2Ugd2FudCB0b3RhbCBjb250cm9sIG9m
IHRoZSBwcm9qZWN0LiAgSnVzdCB0byBiZSBjbGVhciwgd2Ugd2FudCBfc29tZV8gY29udHJvbCBv
dmVyIGEgc2FuZGJveCBzbyB0aGF0IHdlIGNhbiBidWlsZCB0aGUgY29tcG9uZW50cyB0aGF0IHdl
IGJlbGlldmUgYXJlIG5lZWRlZCBmb3IgdGhlIFdGUCBwbGF0Zm9ybSBpbiB1cHN0cmVhbS4gIEkn
ZCBiZSBvcGVuIHRvIG9yZ2FuaXppbmcgYnkgZmVhdHVyZSBhcmVhIHJhdGhlciB0aGFuIGNvbnRy
b2xsaW5nIGNvbnRyaWJ1dG9ycy4gIEF0IHRoZSBlbmQgb2YgdGhlIGRheSwgdGhlIHJlcG8gaXMg
anVzdCBhIG5hbWUuICBXaGF0IG1hdHRlcnMgaXMgd2hlcmUgdGhlIHB1c2gvbWVyZ2UvY29tbWl0
IHBlcm1pc3Npb25zIGxpZSwgYW5kIGhvdyBxdWlja2x5IHdlIGNhbiBtb3ZlIG9uIG5ldyBmZWF0
dXJlcy4NCg0K
