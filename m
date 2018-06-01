Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40y6Bv5YLRzDrpC
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jun 2018 00:28:35 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Jun 2018 07:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,467,1520924400"; d="scan'208";a="233819236"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
 by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2018 07:28:30 -0700
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
 ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Fri, 1 Jun 2018 07:28:30 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.118]) by
 ORSMSX112.amr.corp.intel.com ([169.254.3.228]) with mapi id 14.03.0319.002;
 Fri, 1 Jun 2018 07:28:29 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: AKASH G J <akashgj91@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: IPMI and Redfish support in openbmc Linux
Thread-Topic: IPMI and Redfish support in openbmc Linux
Thread-Index: AQHT+Yo94LXYlSBvmE6ly+mZldteZaRLdGEQ
Date: Fri, 1 Jun 2018 14:28:29 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169933BDDE2FA@ORSMSX114.amr.corp.intel.com>
References: <CAE33tLHGzttgZG7b0kg8bn5XNFN6q=xcheiQhpFUu5FM0ABGig@mail.gmail.com>
In-Reply-To: <CAE33tLHGzttgZG7b0kg8bn5XNFN6q=xcheiQhpFUu5FM0ABGig@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
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
X-List-Received-Date: Fri, 01 Jun 2018 14:28:41 -0000

QSBzdWJzZXQgb2YgSXBtaSAyLjAgaXMgcHJvdmlkZWQgYnkgdGhlIElwbWkgZGFlbW9ucyBoZXJl
Og0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItaG9zdC1pcG1pZA0KaHR0cHM6
Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItbmV0LWlwbWlkDQoNCk5ldCBJUE1JIHN1cHBv
cnRzIHRoZSBvdXQgb2YgYmFuZCBpcG1pIG92ZXIgbmV0d29yay4gIEhvc3QgaXBtaSBzdXBwb3J0
cyBpbiBiYW5kIGlwbWkgb3ZlciBrY3Mgb3IgYmxvY2sgdHJhbnNmZXIuDQoNClRoZXJlIGFyZSBz
ZXZlcmFsIHNlcnZlcnMgdGhhdCBzdXBwb3J0IFJlZGZpc2gsIGFuZCB3ZSBoYXZlIGEgd29ya2lu
ZyBncm91cCB0aGF0IG1lZXRzIHdlZWtseSB0byB0YWxrIHRocm91Z2ggdGVjaG5pY2FsIGlzc3Vl
cyBlYWNoIHdlZWssIHdoaWNoIHlvdSdyZSB3ZWxjb21lIHRvIGF0dGVuZC4gIFRoZSBvbmx5IG9u
ZSBjaGVja2VkIGludG8gdGhlIHVwc3RyZWFtIHByb2plY3QgaXMgYm1jd2ViLiAgSWYgeW91IG5l
ZWQgaGVscCBnZXR0aW5nIGl0IHN0YXJ0ZWQsIEknbSBoYXBweSB0byBoZWxwLg0KaHR0cHM6Ly9n
aXRodWIuY29tL29wZW5ibWMvYm1jd2ViDQoNClllcywgaXBtaXRvb2wgd29ya3MgY29tcGlsZXMg
Zm9yIHRoZSB0YXJnZXQsIGFuZCBpbmNsdWRlcyBhbiBleHRyYSB0cmFuc3BvcnQgdG8gYmUgYWJs
ZSB0byBjb25uZWN0IGRpcmVjdGx5IHRvIGRidXMgYW5kIGRvIGlwbWkgdHJhbnNhY3Rpb25zIGZy
b20gdGhlcmUuDQoNCi1FZA0KDQpGcm9tOiBvcGVuYm1jIFttYWlsdG86b3BlbmJtYy1ib3VuY2Vz
K2VkLnRhbm91cz1pbnRlbC5jb21AbGlzdHMub3psYWJzLm9yZ10gT24gQmVoYWxmIE9mIEFLQVNI
IEcgSg0KU2VudDogRnJpZGF5LCBKdW5lIDEsIDIwMTggMjoyMyBBTQ0KVG86IG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZw0KU3ViamVjdDogSVBNSSBhbmQgUmVkZmlzaCBzdXBwb3J0IGluIG9wZW5i
bWMgTGludXgNCg0KSGkgVGVhbSwNCg0KSSBidWlsZCB0aGUgTGludXggaW1hZ2UgdXNpbmcgdGhl
IHN0ZXBzIGdpdmVuIGluIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMsIHRhcmdl
dCBtYWNoaW5lIGFzIFphaXVzLiBXaGV0aGVyIHN1cHBvcnQgaXMgYXZhaWxhYmxlIGZvciBJUE1J
IDIuMCBhbmQgUmVkZmlzaCBpbnRlcmZhY2U/IElzIGl0IHBvc3NpYmxlIHRvIHVzZSBpcG1pdG9v
bCBpbiB0aGUgY3Jvc3MgY29tcGlsZWQgTGludXg/DQo=
