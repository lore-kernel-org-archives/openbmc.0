Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4437cv6HdNzDqFG
 for <openbmc@lists.ozlabs.org>; Tue, 19 Feb 2019 02:50:51 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 07:50:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,385,1544515200"; d="scan'208";a="127382141"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2019 07:50:49 -0800
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 18 Feb 2019 07:50:49 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.37]) by
 ORSMSX156.amr.corp.intel.com ([169.254.8.233]) with mapi id 14.03.0415.000;
 Mon, 18 Feb 2019 07:50:48 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Jeremy Kerr <jk@ozlabs.org>
CC: openbmc <openbmc@lists.ozlabs.org>
Subject: RE: libMCTP
Thread-Topic: libMCTP
Thread-Index: AdTFivAMe8UXP46HS0+7d2VO6bRCEQCKClcAAATkZUA=
Date: Mon, 18 Feb 2019 15:50:48 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E8216993459F4C7B@ORSMSX114.amr.corp.intel.com>
References: <7E9441B1E5EFFD4681F54958E8216993459F28DB@ORSMSX114.amr.corp.intel.com>
 <5b8fc35e971dd654b81843d9df82037bb1c9c2c9.camel@ozlabs.org>
In-Reply-To: <5b8fc35e971dd654b81843d9df82037bb1c9c2c9.camel@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTc0OWVmMGYtYTgxOC00MzRjLWIwMjItYmRjNTcwZGZkNDUyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiT1RFbE10YzF3YUhRMCswNjNDUk0xOHRITUpFcVlnVVNDeHRKQUhBQ1orekhJTVhRUDhRYzF3SldLRFR4bWl3UyJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2019 15:50:57 -0000

PiANCj4gSG93ZXZlciwgaXQgZG9lcyBtYWtlIHJlZm9ybWF0dGluZyBhIGxpdHRsZSB0cmlja3ks
IGFzIGNsYW5nLWZvcm1hdCBkb2Vzbid0DQo+IGhhbmRsZSB0aGF0LiBJIGRvbid0IHdhbnQgdG8g
YmlrZXNoZWQgdGhpcyB0b28gbXVjaCwgYnV0IGlzIHRoYXQgT0sgd2l0aCB5b3U/DQpJJ20gYSBs
b3QgbGVzcyB3b3JyaWVkIGFib3V0IHRoZSBmb3JtYXR0aW5nLiAgV2hhdGV2ZXIgZXZlcnlvbmUg
ZWxzZSB3YW50cyBpcyBmaW5lLiAgQ2xhbmctZm9ybWF0IGlzIHJlYWxseSB1c2VmdWwsIHNvIGl0
J3Mgbm90IGdyZWF0IHRvIGxvc2UsIGl0IGZvciB0aGlzIHJlcG8sIGJ1dCB0aGVyZSBpc24ndCB0
aGF0IG11Y2ggY29kZSB0aGVyZSwgc28gaXQncyBub3QgYSBiaWcgY29uY2VybiBmb3IgbWUuDQoN
Cj4gDQo+IEkndmUgcHV0IHRoZSBwcm9wb3NlZCBjaGFuZ2VzIHVwIGluIGEgJ2Zvcm1hdCcgYnJh
bmNoOg0KPiANCj4gICBodHRwczovL2dpdGh1Yi5jb20vamstb3psYWJzL2xpYm1jdHAvY29tbWl0
cy9mb3JtYXQNCj4gDQo+IElmIHRoYXQncyBhbGwgT0sgdGhlbiBJJ2xsIGZhc3QtZm9yd2FyZCBt
YXN0ZXIgdG8gdGhlcmUuDQoNClllcCwgdGhvc2UgbG9vayBmaW5lIGZvciB0aGUgbW9tZW50Lg0K
DQo+IA0KPiBJIGNhbid0IG1lcmdlIHlvdXIgTlZNRSBjaGFuZ2UgYXMgaXQgaXMgYXQgdGhlIG1v
bWVudCwgYXMgdGhlIGNyYzMyIGZpbGUgaXMNCj4gbGljZW5jZWQgYXMgTEdQTHYyKy4gV2hpbGUg
SSBhbSB3b3JraW5nIHdpdGggb3VyIGZvbGtzIHRvIGdldCBhcHByb3ZhbCBmb3IgbXkNCj4gd29y
ayBsaWJtY3RwIHRvIGJlIGxpY2VuY2VkIGFzIGR1YWwgR1BMK0FwYWNoZS0yLCB0aGlzIHN0aWxs
IHdvdWxkbid0IGNvdmVyDQo+IGluY2x1ZGluZyBjcmMzMi5jIHRoZXJlLiBSb25uaWUgbWlnaHQg
YmUgZmluZSB0byByZWxpY2Vuc2UgaXQgdGhvdWdoIC0gZG8geW91DQo+IHdhbnQgbWUgdG8gYXNr
IGhpbT8NCg0KTGV0IG1lIGdldCBzb21lIG9mIHRoZSBjb21taXRzIGNsZWFuZWQgdXAsIGFuZCBJ
J2xsIHNlbmQgb3V0IHB1bGwgcmVxdWVzdHMuICBXZSBjb3VsZCBhc2sgUm9ubmllIGlmIGhlJ3Mg
b2sgd2l0aCBhIHJlbGljZW5zZSwgYnV0IGl0J3Mgbm90IHRoYXQgZGlmZmljdWx0IHRvIGp1c3Qg
cmVidWlsZCBpdC4gIDk1JSBvZiB0aGF0IGlzIGFuIGF1dG8gZ2VuZXJhdGVkIGZpbGUuIEkganVz
dCB0aGUgZmlyc3QgaW1wbGVtZW50YXRpb24gSSBmb3VuZCwgbW9zdGx5IGFzIHBhcnQgb2YgdHJ5
aW5nIHRvIHZlcmlmeSB0aGUgbXVsdGktcGFja2V0IHN0dWZmIHdhcyB3b3JraW5nIGNvcnJlY3Rs
eS4gIEl0IG5lZWRzIGNsZWFuZWQgdXAgYSBiaXQuDQoNCj4gDQo+IFRoZSBOVk1FICYgc21idXMg
YmFja2VuZHMgbG9vayBnb29kIC0gbGV0IG1lIGtub3cgd2hlbiB5b3UgdGhpbmsNCj4gdGhleSdy
ZSBPSyBmb3IgbWVyZ2luZyB0byBtYXN0ZXIgYW5kIEkgd2lsbCBkbyBzby4NCg0KVGhpcyB3YXMg
c29tZXRoaW5nIEkgd2Fzbid0IHN1cmUgYWJvdXQ7ICBEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gaGF2
ZSBudm1lLW1pIGluIGxpYm1jdHAsIG9yIHNob3VsZCB3ZSBiZSBjcmVhdGluZyBsaWJudm1lPyAg
SSdtIGtpbmRhIHRoaW5raW5nIG9uZSBsaWJyYXJ5IHdvdWxkIGJlIG5pY2UsIEknbSBub3QgYXdh
cmUgb2YgYW55IG90aGVyIHRyYW5zcG9ydHMgdGhhdCBOVk1FLW1pIGNhbiB1c2UsIGFuZCBpdCBk
b2Vzbid0IGVuZCB1cCBiZWluZyBhIGxvdCBtb3JlIGNvZGUuDQoNCi1FZA0K
