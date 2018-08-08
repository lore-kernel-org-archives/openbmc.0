Return-Path: <kuiying.wang@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lZ4g6cCszDqhV
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 11:46:58 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2018 18:46:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,456,1526367600"; d="scan'208";a="79822258"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga001.jf.intel.com with ESMTP; 07 Aug 2018 18:46:56 -0700
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 7 Aug 2018 18:46:56 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx101.amr.corp.intel.com (10.18.124.199) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 7 Aug 2018 18:46:55 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.226]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.240]) with mapi id 14.03.0319.002;
 Wed, 8 Aug 2018 09:46:52 +0800
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
Thread-Index: AdQeQXGDaDGflwckTomVHE0rc5P9WgFe9Y4AADIpxuABpy3gAACy9RzgAAZZyIAALGzR0A==
Date: Wed, 8 Aug 2018 01:46:51 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E77249DF10AB@shsmsx102.ccr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249DD28C6@SHSMSX101.ccr.corp.intel.com>
 <1532513696.11932.8.camel@fuzziesquirrel.com>
 <959CAFA1E282D14FB901BE9A7BF4E77249DD8381@SHSMSX101.ccr.corp.intel.com>
 <9F1ED42F-FCC2-4536-8019-15019BD8D01D@fuzziesquirrel.com>
 <959CAFA1E282D14FB901BE9A7BF4E77249DE8512@SHSMSX101.ccr.corp.intel.com>
 <84A1C7CA-5072-4D0A-BC25-9EB8717E5AC5@fuzziesquirrel.com>
In-Reply-To: <84A1C7CA-5072-4D0A-BC25-9EB8717E5AC5@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODBmNzgwOWItMDQ0ZC00MGZjLWE3YjEtMmVmY2ExZmE1YWQ0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYzl6ZnN3NENycWlPOGg5emdsTFZ4bVE3clwvN1pzdDg2V0dmdmJ0dFA3U2hiUHZNb0g5SUI0XC8yQW1pWXhjdmNRIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: request-justification,no-action
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
X-List-Received-Date: Wed, 08 Aug 2018 01:47:01 -0000

SGkgQnJhZCwNCk9rLCBJIHdpbGwgZG8gdGhhdC4NCg0KVGhhbmtzLA0KS3VpeWluZy4NCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJyYWQgQmlzaG9wIFttYWlsdG86YnJhZGxl
eWJAZnV6emllc3F1aXJyZWwuY29tXSANClNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCA3LCAyMDE4IDg6
MzQgUE0NClRvOiBXYW5nLCBLdWl5aW5nIDxrdWl5aW5nLndhbmdAaW50ZWwuY29tPg0KQ2M6IGdl
aXNzb25hdG9yQHlhaG9vLmNvbTsgdG9tam9zZXBoQGluLmlibS5jb207IFRhbm91cywgRWQgPGVk
LnRhbm91c0BpbnRlbC5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IHlvbmcuYi5saUBs
aW51eC5pbnRlbC5jb207IExpLCBZb25nIEIgPHlvbmcuYi5saUBpbnRlbC5jb20+OyBvcGVuYm1j
LWNpLWFkbWluQG96bGFicy5vcmc7IHJpY2hhcmQubWFyaWFuLnRob21haXlhckBsaW51eC5pbnRl
bC5jb207IE1paG0sIEphbWVzIDxqYW1lcy5taWhtQGludGVsLmNvbT4NClN1YmplY3Q6IFJlOiBO
ZWVkIGNyZWF0ZSBhIHJlcG8gZm9yIGNoYXNzaXMgaW1wbGVtZW50YXRpb24uDQoNCg0KPiBPbiBB
dWcgNiwgMjAxOCwgYXQgOTo0MSBQTSwgV2FuZywgS3VpeWluZyA8a3VpeWluZy53YW5nQGludGVs
LmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBCcmFkLA0KPiBUaGFua3MgYSBsb3QgZm9yIHlvdXIgc3Vw
cG9ydC4NCj4gMS4gSSBoYXZlIGFscmVhZHkgd3JpdHRlbiB0aGlzIHByb2dyYW0gb24gT3BlbkJN
QyBhbmQgdmVyaWZpZWQgaXQgb24gWDg2IHBsYXRmb3JtIFdGUC4gDQo+IDIuIE5vIG5lZWQgZm9y
IHNwZWNpZnkgRGJ1cyBBUEkgZm9yIHg4Ni1wb3dlci1jb250cm9sLCBhbGwgdGhlIEFQSXMgYXJl
IGNvbW1vbi4NCj4gDQo+IEJUVzoNCj4gQ2FuIHlvdSBhZGQgbWUgb3Igb3RoZXIgSW50ZWwgbWVt
YmVyIGludG8gdGhlIG1haW50YWluZXIgbGlzdCBmb3IgdGhlc2UgdHdvIHJlcG9zPw0KDQpQbGVh
c2UgYWRkIGEgTUFJTlRBSU5FUlMgZmlsZSBpbiBvbmUgb2YgeW91ciBwYXRjaGVzIGFuZCBJ4oCZ
bGwgYWRkIHRob3NlIGluZGl2aWR1YWxzIHRvIHRoZSBuZWNlc3NhcnkgZ3JvdXBzLg0KDQo+IA0K
PiANCj4gVGhhbmtzLA0KPiBLdWl5aW5nLg0K
