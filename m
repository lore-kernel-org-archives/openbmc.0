Return-Path: <ed.tanous@intel.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLMht3Cp1zDqZq
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 03:45:32 +1100 (AEDT)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP; 23 Oct 2017 09:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,424,1503385200"; d="scan'208";a="326636520"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by fmsmga004.fm.intel.com with ESMTP; 23 Oct 2017 09:44:56 -0700
Received: from orsmsx163.amr.corp.intel.com (10.22.240.88) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Mon, 23 Oct 2017 09:44:55 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.2.105]) by
 ORSMSX163.amr.corp.intel.com ([169.254.9.51]) with mapi id 14.03.0319.002;
 Mon, 23 Oct 2017 09:44:54 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: =?utf-8?B?RGF2aWQgTcO8bGxlciAoRUxTT0ZUIEFHKQ==?= <d.mueller@elsoft.ch>,
 OpenBMC <openbmc@lists.ozlabs.org>
Subject: RE: PECI API?
Thread-Topic: PECI API?
Thread-Index: AQHTSkvjZyYdvTj9NU2EAZyK3ScfnKLxp1rg
Date: Mon, 23 Oct 2017 16:44:53 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932EAECC2A@ORSMSX105.amr.corp.intel.com>
References: <2971e0b7-6339-35f6-b0e3-1901020ed46a@elsoft.ch>
In-Reply-To: <2971e0b7-6339-35f6-b0e3-1901020ed46a@elsoft.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
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
X-List-Received-Date: Mon, 23 Oct 2017 16:45:35 -0000

V2UgaGFkIGxvb2tlZCBhdCBidWlsZGluZyBvbmUsIGFuZCBoYWQgb25lIHByb3RvdHlwZWQgZm9y
IGEgc2ltcGxlIHJlYWQvd3JpdGUgaW50ZXJmYWNlLCBidXQgd2Ugd2VyZSBvbiB0aGUgZmVuY2Ug
YWJvdXQgd2hldGhlciBzdWNoIGEgbG93IGxldmVsIGNvbnRyb2wgKFBFQ0kgcmVhZC93cml0ZSkg
c2hvdWxkIGJlIHB1dCBvbiBkYnVzIGF0IGFsbCBmb3Igc2VjdXJpdHkgcmVhc29ucywgZXNwZWNp
YWxseSB3aGVuIHRoZSBkcml2ZXJzIHJlYWQvd3JpdGUgQVBJIGlzbid0IHRoYXQgZGlmZmljdWx0
IHRvIHVzZS4NCg0KV2hhdCBhcmUgeW91IGxvb2tpbmcgYXQgZG9pbmcgd2l0aCBpdD8NCg0KLUVk
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1jIFttYWlsdG86b3Bl
bmJtYy1ib3VuY2VzK2VkLnRhbm91cz1pbnRlbC5jb21AbGlzdHMub3psYWJzLm9yZ10gT24gQmVo
YWxmIE9mIERhdmlkIE3DvGxsZXIgKEVMU09GVCBBRykNClNlbnQ6IFNhdHVyZGF5LCBPY3RvYmVy
IDIxLCAyMDE3IDE6NTcgQU0NClRvOiBPcGVuQk1DIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+
DQpTdWJqZWN0OiBQRUNJIEFQST8NCg0KSGVsbG8NCg0KSXMgYW55b25lIHdvcmtpbmcgb24gYW4g
QVBJIGRlZmluaXRpb24gZm9yIFBFQ0k/DQoNCg0KRGF2ZQ0K
