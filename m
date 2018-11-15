Return-Path: <sharad.khetan@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=sharad.khetan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wRnX0x2VzF3Xd
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 14:34:51 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2018 19:34:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,235,1539673200"; d="scan'208";a="92165114"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga008.jf.intel.com with ESMTP; 14 Nov 2018 19:34:49 -0800
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 14 Nov 2018 19:34:49 -0800
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.160]) by
 FMSMSX109.amr.corp.intel.com ([169.254.15.165]) with mapi id 14.03.0415.000;
 Wed, 14 Nov 2018 19:34:48 -0800
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: 'Jeremy Kerr' <jk@ozlabs.org>, Supreeth Venkatesh
 <Supreeth.Venkatesh@arm.com>, David Thompson <dthompson@mellanox.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Emily Shaffer
 <emilyshaffer@google.com>
CC: Dong Wei <Dong.Wei@arm.com>, "Naidoo, Nilan" <nilan.naidoo@intel.com>
Subject: RE: MCTP protocol support in OpenBMC?
Thread-Topic: MCTP protocol support in OpenBMC?
Thread-Index: AQHUfCJ+M7Deyty5REGMUvn3nKC4jqVP994AgACfbQD//5V/YA==
Date: Thu, 15 Nov 2018 03:34:47 +0000
Message-ID: <865C376D1B77624AAA570EFEF73CE52F94358A8D@fmsmsx118.amr.corp.intel.com>
References: <HE1PR0501MB2666721F6FF033CA4B94D754DD340@HE1PR0501MB2666.eurprd05.prod.outlook.com>
 <799b6a6f-992c-200e-c42c-35d469f696b9@ozlabs.org>
 <AM4PR08MB2788ACA6457591EF7862078880C30@AM4PR08MB2788.eurprd08.prod.outlook.com>
 <7abd75b4-aea0-e08c-126a-582afe4d26c7@ozlabs.org>
In-Reply-To: <7abd75b4-aea0-e08c-126a-582afe4d26c7@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDk2YjA5OTEtODU1NC00YTE5LTgxNzUtMjAxNTI0Yzc0YzgzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVEV0dVhpWnBIaGFkWitjV2pzYk1PKzJnN2QwR3dKZ3IrTU1TVHdFZlFcLzNaSnprTFh1WnFoSHgwMnFPcFlHU0kifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: request-justification,no-action
x-originating-ip: [10.1.200.107]
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
X-List-Received-Date: Thu, 15 Nov 2018 03:34:56 -0000

SGkgSmVyZW15LA0KV2UgYXJlIHZlcnkgaW50ZXJlc3RlZC4gTmlsYW4gcHJlc2VudGVkIE1DVFAg
aW4gdGhlIEhhY2thdGhvbiBhbmQgaGFzIGJlZW4gd29ya2luZyBvbiB0aGUgTUNUUCBhcmNoaXRl
Y3R1cmUgZm9yIEludGVsIHBsYXRmb3Jtcy4gSXQgd2lsbCBiZSBnb29kIHRvIHdvcmsgdG9nZXRo
ZXIuDQoNClRoYW5rcywNCi1TaGFyYWQNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogb3BlbmJtYyBbbWFpbHRvOm9wZW5ibWMtYm91bmNlcytzaGFyYWQua2hldGFuPWludGVs
LmNvbUBsaXN0cy5vemxhYnMub3JnXSBPbiBCZWhhbGYgT2YgSmVyZW15IEtlcnINClNlbnQ6IFRo
dXJzZGF5LCBOb3ZlbWJlciAxNSwgMjAxOCA5OjQ0IEFNDQpUbzogU3VwcmVldGggVmVua2F0ZXNo
IDxTdXByZWV0aC5WZW5rYXRlc2hAYXJtLmNvbT47IERhdmlkIFRob21wc29uIDxkdGhvbXBzb25A
bWVsbGFub3guY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBFbWlseSBTaGFmZmVyIDxl
bWlseXNoYWZmZXJAZ29vZ2xlLmNvbT4NCkNjOiBEb25nIFdlaSA8RG9uZy5XZWlAYXJtLmNvbT4N
ClN1YmplY3Q6IFJlOiBNQ1RQIHByb3RvY29sIHN1cHBvcnQgaW4gT3BlbkJNQz8NCg0KSGkgYWxs
LA0KDQo+IFdlIChAIGFybSkgYXJlIGFsc28gaW50ZXJlc3RlZCBpbiBjb250cmlidXRpbmcgTUNU
UCB0byBPcGVuQk1DLg0KDQpPSywgc3VwZXIhDQoNCj4gV2Ugd291bGQgbGlrZSB0byBjb2xsYWJv
cmF0ZSB3aXRoIE9wZW5CTUMgZm9sa3MgIHdobyBhcmUgaW50ZXJlc3RlZCBpbiB0aGlzIHRvcGlj
LiAobWF5YmUgZm9ybSBhIFdvcmtncm91cCB0byBkaXNjdXNzIHRoaXMpLg0KDQpQZXJzb25hbGx5
LCBJJ2QgcHJlZmVyICpub3QqIHRvIGZvcm0gYSB3b3JrZ3JvdXAgYXQgdGhlIG1vbWVudDsgd2Ug
Y2FuIA0KZGlzY3VzcyB0aGluZ3MgaGVyZSBvbiB0aGUgbGlzdCwgcmF0aGVyIHRoYW4gc2VwYXJh
dGluZyB0aG9zZSANCmNvbnZlcnNhdGlvbnMgZnJvbSB0aGUgcmVzdCBvZiB0aGUgT3BlbkJNQyBj
b21tdW5pdHkuIEkgYWxzbyBkb24ndCB0aGluayANCndlIG5lZWQgYW55IG9mIHRoZSBmb3JtYWxp
dHkgb2YgYSB3b3JrZ3JvdXAgYXQgdGhpcyBzdGFnZS4NCg0KRXNzZW50aWFsbHksIGZvcm1pbmcg
YSBXRyBqdXN0IG1lYW5zIHdlJ2QgaGF2ZSBtZWV0aW5ncyBhbmQgYSBzZXBhcmF0ZSANCm1haWxp
bmcgbGlzdC4gVGhlIGZvcm1lciBtZWFucyB0aGF0IHNvbWUgYXR0ZW5kZWVzIG9mIHRoZSBXRyBo
YXZlIHRvIA0KaGF2ZSBsYXRlIG5pZ2h0cyB0byBhdHRlbmQsIGFuZCB0aGUgbGF0dGVyIHNlcGFy
YXRlcyB0aGUgTUNUUCANCmRpc2N1c3Npb25zIGZyb20gdGhlIHJlc3Qgb2YgT3BlbkJNQy4NCg0K
SG93ZXZlciwgd2UgY2FuIGNlcnRhaW5seSByZXZpc2l0IHRoaXMgaWYgY29uZGl0aW9ucyB3YXJy
YW50IGl0Lg0KDQpMZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhbnkgc3Ryb25nIG9waW5pb25zIG9u
ZSB3YXkgb3IgdGhlIG90aGVyLg0KDQpXaXRoIHRoYXQgaW4gbWluZCwgYW5kIHNpbmNlIGEgZmV3
IGZvbGtzIGhhdmUgZXhwcmVzc2VkIGludGVyZXN0LCBJJ2xsIA0Kc2hhcmUgc29tZSBvZiBteSBp
bml0aWFsIHNrZXRjaGVzIHRvIHRoaXMgbGlzdCBzb29uLiBJJ2xsIGJlIHN1cmUgdG8gDQppbmNs
dWRlIE1DVFAgaW4gdGhlIHN1YmplY3QgdG8gbWFrZSB0aGluZ3MgZmluZGFibGUuDQoNCkNoZWVy
cywNCg0KDQpKZXJlbXkNCg==
