Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 447T5t6MNBzDqL0
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 04:12:27 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2019 09:12:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,411,1544515200"; d="scan'208";a="137067228"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga002.jf.intel.com with ESMTP; 25 Feb 2019 09:12:23 -0800
Received: from orsmsx122.amr.corp.intel.com (10.22.225.227) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 25 Feb 2019 09:12:22 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.37]) by
 ORSMSX122.amr.corp.intel.com ([169.254.11.48]) with mapi id 14.03.0415.000;
 Mon, 25 Feb 2019 09:12:22 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Redfish: Design User authorization.
Thread-Topic: Redfish: Design User authorization.
Thread-Index: AQHUzQ/8ZJgYYU7ANUWGU9vZjmshYqXwvPXQ
Date: Mon, 25 Feb 2019 17:12:21 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E8216993459FE05D@ORSMSX114.amr.corp.intel.com>
References: <b7596cbb-14f6-2d03-6860-840fb2ee7a7f@linux.vnet.ibm.com>
In-Reply-To: <b7596cbb-14f6-2d03-6860-840fb2ee7a7f@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTc1NzhhZGQtZmU5ZC00YjBmLWFiMTItMTEyNmQ3N2RmZGY4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYUZhRDErMUlxaDJBUjlWMlN6YWtxVm5DUjhQdVlDelArT0tUc0ZXYUNCTXlweHlaU0c1Mk50cFZlR3phMzE4RiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
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
X-List-Received-Date: Mon, 25 Feb 2019 17:12:35 -0000

Pg0KPiBIaSBFZCwNCj4gDQo+IFRoaXMgbWFpbCBpcyByZWdhcmRpbmcgdGhlIGF1dGhvcml6YXRp
b24gc3VwcG9ydCBvbiBSZWRmaXNoLg0KPiANCg0KVGhhbmtzIGZvciBwdXNoaW5nIGZvcndhcmQg
b24gdGhpcy4gIEkgdGhpbmsgdGhlIGJlc3QgZmlyc3Qgc3RlcCB3b3VsZCBiZSB0byByZXZpZXcg
dGhlIHBhdGNoc2V0IHRoYXQncyBhbHJlYWR5IGluIHByb2dyZXNzIHRoYXQncyBhZGRpbmcgc29t
ZSBpbmZyYXN0cnVjdHVyZSB0byBkbyBhIGxvdCBvZiB0aGUgdGhpbmdzIHlvdSdyZSBwcm9wb3Np
bmcuICBJZiB5b3UncmUgcHJvcG9zaW5nIGFuIGFsdGVybmF0aXZlIGFwcHJvYWNoIHRoYW4gdGhl
IGV4aXN0aW5nIHJldmlldywgYW5kIEkgbWlzdW5kZXJzdG9vZCwgYXBvbG9naWVzLg0KDQpodHRw
czovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9ibWN3ZWIvKy8xNTgxMw0K
DQpJIHN1c3BlY3QgdGhlIHF1ZXN0aW9ucyB3ZSBuZWVkIHRvIGFuc3dlciBhcmU6DQoxLiBIb3cg
ZG8gd2UgZGV0ZXJtaW5lIGEgdXNlcidzIHJvbGU/DQoyLiBHaXZlbiB0aGF0IHByaXZpbGVnZSBp
cyByZXF1aXJlZCB0byBzZXJ2aWNlIGV2ZXJ5IHJlcXVlc3QsIGRvIHdlIG5lZWQgdG8gY2FjaGUg
aXQsIG9yIGNhbiB3ZSBnbyB0byBkYnVzIGZvciBldmVyeSByZXF1ZXN0Pw0KMy4gSG93IGlzIHRo
ZSBjYWNoZSBpbnZhbGlkYXRlZD8NCg0KSSB0aGluayB0aGUgYnVsayBvZiB0aGUgaW1wbGVtZW50
YXRpb24gd2lsbCBiZSBmaWxsaW5nIG91dCB0aGUgbWV0aG9kIGhlcmU6DQpodHRwczovL2dpdGh1
Yi5jb20vb3BlbmJtYy9ibWN3ZWIvYmxvYi9hMjQ1MjZkY2Y5YWQ4ZGUyZjBiZDlkYmQ1ZmM3NDZh
MTMwMzUxYTIyL3JlZGZpc2gtY29yZS9pbmNsdWRlL3ByaXZpbGVnZXMuaHBwI0wyMjkNCg0KQW5k
IG1vdmluZyByb2xlcyBhd2F5IGZyb20gdGhlIHN0YXRpYyBpbXBsZW1lbnRhdGlvbiwgYXMgeW91
J3ZlIGFscmVhZHkgZGV0ZXJtaW5lZC4NCg0KRG8geW91IGhhdmUgYW55IGludGVudGlvbiB0byBp
bXBsZW1lbnQgUHJpdmlsZWdlUmVnaXN0cnk/DQoNCkxvb2tpbmcgZm9yd2FyZCB0byBzZWVpbmcg
eW91ciB3b3JrIGhlcmUuDQoNCi1FZA0K
