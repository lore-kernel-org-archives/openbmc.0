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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41vvZG3ymnzF0hg
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 01:22:58 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2018 08:22:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,270,1531810800"; d="scan'208";a="64887317"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by fmsmga008.fm.intel.com with ESMTP; 21 Aug 2018 08:21:50 -0700
Received: from orsmsx161.amr.corp.intel.com (10.22.240.84) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 21 Aug 2018 08:21:49 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX161.amr.corp.intel.com ([169.254.4.174]) with mapi id 14.03.0319.002;
 Tue, 21 Aug 2018 08:21:49 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Tom Joseph <tomjose@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: Mapping LDAP group to user roles
Thread-Topic: Mapping LDAP group to user roles
Thread-Index: AQHUOUi3j8iCxBK5KUu3t/pYOILv96TKUQZg
Date: Tue, 21 Aug 2018 15:21:49 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345832E4D@ORSMSX114.amr.corp.intel.com>
References: <1b935f90-dba3-ba95-f6b1-d8d2ff186ee7@linux.vnet.ibm.com>
In-Reply-To: <1b935f90-dba3-ba95-f6b1-d8d2ff186ee7@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDk5ZjU1ODEtMGIwMS00YzQ3LWJkYzYtYjdmNWRlNjhjMjA1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZ2V3bmtqNHpYQ3lSN1JwbHFkdWZWVUZrMk1FR2Nqd1wvNVhzSGNKbVpaWDhyU213Q0VpbGlLWWd0M3hHZzJCcjYifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
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
X-List-Received-Date: Tue, 21 Aug 2018 15:23:03 -0000

PiANCj4gV2UgaGF2ZSBhIHJlcXVpcmVtZW50IHRvIGFzc2lnbiByb2xlIHRvIHRoZSBMREFQIHVz
ZXJzLCBzbyBjZXJ0YWluDQo+IG9wZXJhdGlvbnMgY2FuIGJlIHJlc3RyaWN0ZWQgZm9yIHVzZXJz
IHdpdGhvdXQgYWRtaW4gcGVybWlzc2lvbnMuDQo+IA0KDQpJdCB3b3VsZCBiZSBncmVhdCBpZiB5
b3UgY291bGQgZG9jdW1lbnQgeW91ciBwcm9wb3NhbCBhcyBhIHBhdGNoIHRvIHRoZSBleGlzdGlu
ZyB1c2VyIG1hbmFnZW1lbnQgZG9jdW1lbnQgaGVyZToNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
Ym1jL2RvY3MvYmxvYi9tYXN0ZXIvdXNlcl9tYW5hZ2VtZW50Lm1kDQoNCkl0IHdvdWxkIG1ha2Ug
aXQgbXVjaCBlYXNpZXIgdG8gc2VlIHdoYXQgY2hhbmdlcyB5b3UncmUgcHJvcG9zaW5nLiAgR2l2
ZW4gd2hhdCBhbHJlYWR5IGV4aXN0cywgeW91ciBwcm9wb3NhbCBpcyBhIGxpdHRsZSBjb25mdXNp
bmcsIGFzIHRoZXJlJ3MgYWxyZWFkeSBhIG1lY2hhbmlzbSB0byBnZXQgZ3JvdXAgbWVtYmVyc2hp
cCwgYW5kIGRlZmluZWQgdGhlIHVzZXIgcm9sZXMuICBBcmUgeW91IHByb3Bvc2luZyBjaGFuZ2lu
ZyB0aGUgZXhpc3RpbmcgaW50ZXJmYWNlcyB0byB0aGUgbmV3IGdyb3VwIGNvbGxlY3Rpb24gdHlw
ZSBpbnRlcmZhY2U/ICBZb3UncmUgcHJvcG9zaW5nIHR3byB1c2VyIHJvbGVzLCBidXQgd2UgYWxy
ZWFkeSBoYXZlIGRvY3VtZW50ZWQgNCB1c2VyIHJvbGVzLiAgSXMgeW91ciBwcm9wb3NhbCB0byBk
ZWxldGUgdHdvIG9mIHRoZW0/DQoNCkkgdGhpbmsgYWxsIG9mIHRoZXNlIHF1ZXN0aW9ucyB3b3Vs
ZCBiZSBhbnN3ZXJlZCBpZiB5b3UgY291bGQgdXBkYXRlIHRoZSBkb2N1bWVudCBhYm92ZSB3aXRo
IHlvdXIgcHJvcG9zZWQgY2hhbmdlcy4NCg==
