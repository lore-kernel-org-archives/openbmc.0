Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44KvGj2Sh3zDqNF
 for <openbmc@lists.ozlabs.org>; Fri, 15 Mar 2019 03:26:14 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Mar 2019 09:26:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,478,1544515200"; d="scan'208";a="134357903"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by fmsmga007.fm.intel.com with ESMTP; 14 Mar 2019 09:26:11 -0700
Received: from orsmsx124.amr.corp.intel.com (10.22.240.120) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 14 Mar 2019 09:26:10 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.54]) by
 ORSMSX124.amr.corp.intel.com ([169.254.2.79]) with mapi id 14.03.0415.000;
 Thu, 14 Mar 2019 09:26:10 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Static code analysis tool for openbmc
Thread-Topic: Static code analysis tool for openbmc
Thread-Index: AQHU2YW+F9GDQGq6Xkyp8WQVI93y3qYLT9Dw
Date: Thu, 14 Mar 2019 16:26:10 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345A2E1CF@ORSMSX114.amr.corp.intel.com>
References: <de550e08-2338-9438-6021-b2b6ef130bdd@linux.vnet.ibm.com>
In-Reply-To: <de550e08-2338-9438-6021-b2b6ef130bdd@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzc0ODg0MTQtZmJhOS00ZDlkLWJmMjEtNzE4MzA5ZDUyN2VjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSWZMSHdoREszZzhiaWF6RlZGdGd4K1pKSHdZVGw0ME92bHd6QnZMRDlTSVlXZ25LN3F6OVdRZ05GK0VUZU5wXC8ifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: request-justification,no-action
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
X-List-Received-Date: Thu, 14 Mar 2019 16:26:22 -0000

PiANCj4gSXMgdGhlcmUgYW55IHBsYW4gdG8gdXNlIGFueSBzdGF0aWMgY29kZSBhbmFseXNpcyB0
b29sIGluIG9wZW5ibWM/IEkgZmluZCBvbmUNCj4gb2YgdGhlIHRvb2wgd2hpY2ggaXMgZ29vZCBh
bmQgdXNlZCBpbiBtdWx0aXBsZSBvcGVuc291cmNlIHByb2plY3RzIGlzDQo+ICJjb3Zlcml0eSIu
DQo+IA0KDQpJJ20gaW4gZnVsbCBzdXBwb3J0IG9mIGdldHRpbmcgY292ZXJpdHkgc3RhcnRlZC4g
IEkgaGFkIHNvbWUgdHJvdWJsZXMgd2l0aCBwZXJmb3JtYW5jZSAodGhlIGFuYWx5c2lzIGZvciBh
IHNpbmdsZSBhcHAgdGFrZXMgYSB2ZXJ5IGxvbmcgdGltZSkgYW5kIHVuZXhwZWN0ZWQgZmFsc2Ug
cG9zaXRpdmVzIHdoZW4gSSBhdHRlbXB0ZWQgaXQgYSB3aGlsZSBiYWNrLCBhbmQgZ2F2ZSB1cCBh
dCB0aGUgdGltZS4gIE9uZSBwZXJzb24gYWxzbyBkaWQgZ2V0IHRoZSBGYWNlYm9vayBzdGF0aWMg
YW5hbHl6ZXIsIGluZmVyLCBydW5uaW5nIHJlY2VudGx5IG9uIGFuIE9wZW5CTUMgcHJvamVjdCBh
bmQgaXQgc2VlbWVkIHRvIGdpdmUgc29tZSByZXN1bHRzLCBhYm91dCAxMCUgb2Ygd2hpY2ggd2Vy
ZSBhY3Rpb25hYmxlLCBhbmQgZ2VuZXJhdGVkIHNvbWUgY29tbWl0cyB0byBPcGVuQk1DLiAgSSdt
IG5vdCBzdXJlIEknZCBhZHZvY2F0ZSBmb3IgaXQsIGJ1dCBpdCdzIGNlcnRhaW5seSBhbm90aGVy
IG9wdGlvbi4NCg0KLUVkDQo=
