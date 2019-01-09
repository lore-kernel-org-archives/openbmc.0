Return-Path: <ryan_chen@aspeedtech.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Z9md2QJ4zDqDM
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 12:01:03 +1100 (AEDT)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x0910Pss069147;
 Wed, 9 Jan 2019 09:00:25 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Wed, 9 Jan
 2019 09:00:45 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Wed, 9 Jan 2019 09:00:44 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: intel-ipmi-oem_git.bb compiler error
Thread-Topic: intel-ipmi-oem_git.bb compiler error
Thread-Index: AdSnM1LrzGnw9YiESouRH4ckpqRbZv//lz2A//6QSqA=
Date: Wed, 9 Jan 2019 01:00:43 +0000
Message-ID: <ff07dd6794144dfa8ee7431dd98cd9a1@TWMBX02.aspeed.com>
References: <bcd8a8d63a0141929785d792135a4a2f@TWMBX02.aspeed.com>
 <cbf22a18-a320-3a90-d382-0deb72956c99@linux.intel.com>
In-Reply-To: <cbf22a18-a320-3a90-d382-0deb72956c99@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x0910Pss069147
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
X-List-Received-Date: Wed, 09 Jan 2019 01:01:05 -0000

SGVsbG8gUmljaGFyZCwJDQoJR2V0IGl0LiBUaGFua3MgYSBsb3QuDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1jIFttYWlsdG86b3BlbmJtYy1ib3VuY2VzK3J5YW5f
Y2hlbj1hc3BlZWR0ZWNoLmNvbUBsaXN0cy5vemxhYnMub3JnXSBPbiBCZWhhbGYgT2YgVGhvbWFp
eWFyLCBSaWNoYXJkIE1hcmlhbg0KU2VudDogVHVlc2RheSwgSmFudWFyeSA4LCAyMDE5IDc6MDUg
UE0NClRvOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBpbnRlbC1pcG1p
LW9lbV9naXQuYmIgY29tcGlsZXIgZXJyb3INCg0KUHVzaGVkIGEgZml4IGZvciB0aGUgc2FtZS4g
WW91IGNhbiBhcHBseSBpdCBpbiB5b3VyIG9wZW5ibWMvbWV0YS1pbnRlbCwgdGhpcyBzaG91bGQg
Zml4IHlvdXIgcHJvYmxlbS4NCg0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8j
L2Mvb3BlbmJtYy9tZXRhLWludGVsLysvMTcxNTAvDQoNCnJlZ2FyZHMNCg0KUmljaGFyZA0KDQpP
biAxLzgvMjAxOSAyOjQ4IFBNLCBSeWFuIENoZW4gd3JvdGU6DQo+IEhlbGxvIE9wZW5CTUMsDQo+
DQo+IAlXaGVuIEkgYnVpbGQgbWV0YS1zMjYwMHdmLCBpdCBnZXQgZm9sbG93aW5nIGNvbXBpbGVy
IGVycm9yLCBkb2VzIHRoZXJlIGhhdmUgc29tZSBwYXRjaCBmb3IgZml4IGl0Pw0KPg0KPiAJRVJS
T1I6IGludGVsLWlwbWktb2VtLTAuMStnaXRBVVRPSU5DKzUyMzQxZTg1NDMtcjAgZG9fY29tcGls
ZTogDQo+IEZ1bmN0aW9uIGZhaWxlZDogZG9fY29tcGlsZSAobG9nIGZpbGUgaXMgbG9jYXRlZCBh
dCANCj4gL2hvbWUvcnlhbi93b3JrL3Byb2plY3QvYXN0L29wZW5ibWMvb3BlbmJtYy9idWlsZC90
bXAvd29yay9hcm12Ni1vcGVuYg0KPiBtYy1saW51eC1nbnVlYWJpL2ludGVsLWlwbWktb2VtLzAu
MStnaXRBVVRPSU5DKzUyMzQxZTg1NDMtcjAvdGVtcC9sb2cuDQo+IGRvX2NvbXBpbGUuMTUwOTQp
DQo+IEVSUk9SOiBMb2dmaWxlIG9mIGZhaWx1cmUgc3RvcmVkIGluOiANCj4gL2hvbWUvcnlhbi93
b3JrL3Byb2plY3QvYXN0L29wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAvd29yay9hcm12Ni1vcGVu
Yg0KPiBtYy1saW51eC1nbnVlYWJpL2ludGVsLWlwbWktb2VtLzAuMStnaXRBVVRPSU5DKzUyMzQx
ZTg1NDMtcjAvdGVtcC9sb2cuDQo+IGRvX2NvbXBpbGUuMTUwOTQNCj4NCj4gUnlhbg0K
