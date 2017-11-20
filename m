Return-Path: <ed.tanous@intel.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ygfdF0PwtzDrM8
 for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2017 06:57:18 +1100 (AEDT)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2017 11:57:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,429,1505804400"; 
   d="scan'208";a="3997904"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Nov 2017 11:57:13 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.129]) by
 ORSMSX110.amr.corp.intel.com ([169.254.10.110]) with mapi id 14.03.0319.002;
 Mon, 20 Nov 2017 11:57:13 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC community telecon - 11/20 Agenda 
Thread-Topic: OpenBMC community telecon - 11/20 Agenda 
Thread-Index: AQHTYjWNul7PAerkPEKeTmOnw57DiqMdqcYQ
Date: Mon, 20 Nov 2017 19:57:12 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932F4A58B2@ORSMSX114.amr.corp.intel.com>
References: <785099C4-5D19-4341-9F40-3B6A3404EEC8@fuzziesquirrel.com>
In-Reply-To: <785099C4-5D19-4341-9F40-3B6A3404EEC8@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzlkN2MwOGEtMzE2ZS00MTQ4LTg5MDctNDJmMGIxNDNkODhjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IjJJQXNwM2VtS0tRKzRPK2xCYlY4STVzdDhjWkM4SDJOSXBpczByeEVGdjA9In0=
x-originating-ip: [10.22.254.140]
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
X-List-Received-Date: Mon, 20 Nov 2017 19:57:21 -0000

UGxlYXNlIHJlbmFtZS9hcHBlbmQgdG8gY29kZSByZXZpZXcgdmVsb2NpdHk6ICBtYXN0ZXIgYnJh
bmNoIHN0YWJpbGl0eSAoYXNzdW1pbmcgaXQgd2FzIG15IHRvcGljIGZyb20gZW1haWwgbGFzdCB3
ZWVrKQ0KDQpBbHNvLCBwbGVhc2UgYWRkOg0KUnVudGltZSBjb25maWd1cmFiaWxpdHk6DQpJJ2Qg
bGlrZSB0byBoYXZlIGEgZGlzY3Vzc2lvbiBhcm91bmQgb3VyIGRlc2lyZXMgZm9yIHJ1bnRpbWUg
Y29uZmlndXJhYmlsaXR5IGFuZCBydW50aW1lIGRhdGEtZHJpdmVuIHBsYXRmb3JtIGNvbmZpZ3Vy
YXRpb25zLiAgVGhpcyBpbmNsdWRlcyBydW50aW1lIGNvbmZpZ3VyYWJsZSBzZW5zb3JzLCBwbGF0
Zm9ybSBoYXJkd2FyZSBjb25maWd1cmF0aW9uIGNoYW5nZXMsIGFuZCBDaGFzc2lzIGRldGVjdGlv
bi4gIEknZCBsaWtlIHRvIGhhdmUgYSBzaG9ydCBydW5kb3duIG9mIGhvdyB3ZSd2ZSBoYW5kbGVk
IHRoZXNlIHRoaW5ncyBpbiBwYXN0IGNvZGViYXNlcywgYW5kIHNlZSBpZiB0aGVyZSdzIGFueSBh
bGlnbm1lbnQgd2l0aCBvdGhlciBjb21tdW5pdHkgbmVlZHMuDQoNClNlY3VyZSBjb2RpbmcgZ3Vp
ZGVsaW5lczoNCldoYXQgc2VjdXJlIGNvZGluZyBndWlkZWxpbmVzIGFyZSBvdGhlciBncm91cHMv
aW5kaXZpZHVhbHMgdXNpbmc/ICAgIEknZCBsaWtlIHRvIGhhdmUgYW4gb3BlbiBkaXNjdXNzaW9u
IGFib3V0IGhvdyB0byBtb3ZlIHRvd2FyZCBtb3JlIHNlY3VyZSBjb2RpbmcgZ3VpZGVsaW5lcyB3
aXRoIHRoZSBtaW5pbXVtIHBvc3NpYmxlIGludGVycnVwdGlvbiB3aGlsZSBhbGllbmF0aW5nIHRo
ZSBtaW5pbXVtIG51bWJlciBvZiBwZW9wbGUuICBTb21lIHN1YnRvcGljczoNCjEuIENhbiBhbnl0
aGluZyBiZSBlbmZvcmNlZCBhdCB0aGUgbWFzdGVyIGJyYW5jaD8gIA0KMi4gQ2FuIGFueXRoaW5n
IGJlIGVuZm9yY2VkIGJ5IHBvbGljeT8gIChleGFtcGxlOiByZWZlcmVuY2UgY29tcG9uZW50cyBt
dXN0IGJlIHNlY3VyZSkNCjMuIERvZXMgYW55b25lIGhhdmUgZXhwZXJpZW5jZSB3aXRoIGF1dG9t
YXRpbmcgc2VjdXJlIGNvZGluZyBndWlkZWxpbmVzPw0KDQoodG8gYmUgY2xlYXIsIGJ5IHNlY3Vy
ZSBjb2RpbmcgZ3VpZGVsaW5lcyBJIG1lYW4gcmFuZ2UgY2hlY2tlZCBidWZmZXIgaW50ZXJmYWNl
cywgbm90IHVzaW5nIG1lbW9yeSB1bnNhZmUgZnVuY3Rpb25zLCBleGNlcHRpb24gc2FmZSBjb2Rl
LCBhbnRpIHN0YWNrIHNtYXNoaW5nIGNvbXBpbGVyIGZsYWdzLCBlY3QpDQoNClRoYW5rcywNCg0K
LUVkDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmJtYyBbbWFp
bHRvOm9wZW5ibWMtDQo+IGJvdW5jZXMrZWQudGFub3VzPWludGVsLmNvbUBsaXN0cy5vemxhYnMu
b3JnXSBPbiBCZWhhbGYgT2YgQnJhZCBCaXNob3ANCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAy
MCwgMjAxNyAxMToyNyBBTQ0KPiBUbzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnPg0KPiBTdWJqZWN0OiBPcGVuQk1DIGNvbW11bml0eSB0ZWxlY29uIC0gMTEvMjAg
QWdlbmRhDQo+IA0KPiBJQk0gdGVzdGluZyBvdmVydmlldw0KPiBDb2RlIHJldmlldyB2ZWxvY2l0
eQ0KPiBCb29zdA0KPiBPcGVuIE1pYw0KPiDigJTigJTigJTigJTigJTigJTigJTigJTigJQNCj4g
TW9uZGF5LCAxMDowMHBtIEVEVA0KPiA4ODgtNDI2LTY4NDANCj4gcGFzc3dvcmQ6IDg1ODkxMzg5
DQo=
