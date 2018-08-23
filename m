Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41x8yN5jNKzF2Py
 for <openbmc@lists.ozlabs.org>; Fri, 24 Aug 2018 02:29:44 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2018 09:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,278,1531810800"; d="scan'208";a="251368040"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2018 09:29:15 -0700
Received: from orsmsx160.amr.corp.intel.com (10.22.226.43) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Thu, 23 Aug 2018 09:29:14 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX160.amr.corp.intel.com ([169.254.13.106]) with mapi id 14.03.0319.002;
 Thu, 23 Aug 2018 09:29:14 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Tom Joseph <tomjose@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: Mapping LDAP group to user roles
Thread-Topic: Mapping LDAP group to user roles
Thread-Index: AQHUOUi3j8iCxBK5KUu3t/pYOILv96TKUQZggAN5xwD//74yIA==
Date: Thu, 23 Aug 2018 16:29:14 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345834D5D@ORSMSX114.amr.corp.intel.com>
References: <1b935f90-dba3-ba95-f6b1-d8d2ff186ee7@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345832E4D@ORSMSX114.amr.corp.intel.com>
 <2d7b2647-cc0a-bcaf-c1fa-d6da05769502@linux.vnet.ibm.com>
In-Reply-To: <2d7b2647-cc0a-bcaf-c1fa-d6da05769502@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODkwZTFlNGEtZGQ3MC00OTE2LWIyNTUtMjFiNGY4ZmQzYjhmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTkQzUUJXZisyMlNvOG9HT0FOc0FvQW91bzJlVWtCUDdrejdvTUdHSk0zc3A1V21FQ1djSlJ5aEd0azBKY3RFVCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
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
X-List-Received-Date: Thu, 23 Aug 2018 16:29:49 -0000

PiA+Pg0KPiA+IEl0IHdvdWxkIGJlIGdyZWF0IGlmIHlvdSBjb3VsZCBkb2N1bWVudCB5b3VyIHBy
b3Bvc2FsIGFzIGEgcGF0Y2ggdG8gdGhlDQo+IGV4aXN0aW5nIHVzZXIgbWFuYWdlbWVudCBkb2N1
bWVudCBoZXJlOg0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2RvY3MvYmxvYi9tYXN0
ZXIvdXNlcl9tYW5hZ2VtZW50Lm1kDQo+IGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54
eXovIy9jL29wZW5ibWMvZG9jcy8rLzEyMDkxLw0KPiA+DQoNClRoaXMgaXMgYSBncmVhdCBzdGFy
dCwgYnV0IGEgbG90IG9mIGRldGFpbCBzZWVtcyB0byBiZSBtaXNzaW5nLiAgWW91IGRvbid0IG1l
bnRpb24gYW55dGhpbmcgb2YgdGhlIHR3byB1c2VyIHJvbGVzIHlvdSBtZW50aW9uZWQgaW4geW91
ciBvcmlnaW5hbCBlbWFpbC4gIEhhcyB0aGF0IGNoYW5nZWQ/ICBJIGRvbid0IHNlZSBhbnkgbWVu
dGlvbiBvZiB0aGUgZGJ1cyBpbnRlcmZhY2UsIGhhcyB0aGF0IGNoYW5nZWQ/ICBJIGRvbid0IHNl
ZSB0aGF0IHlvdSd2ZSBtb2RpZmllZCBhbnkgb2YgdGhlIGxvZ2luIGZsb3dzIGluIHRoZSBkb2N1
bWVudCwgYnV0IHRoZSBMREFQIHNlY3Rpb24gdGFsa3MgYWJvdXQgYXV0aG9yaXppbmcgdXNlcnMg
dmlhIERCdXMsIHdoaWNoIGNlcnRhaW5seSBzaG91bGQgaW5jbHVkZSBjaGFuZ2VzIHRvIHRoZSBm
bG93IGRpYWdyYW1zLg0KDQpJdCB3b3VsZCBiZSBncmVhdCBpZiB5b3UgY291bGQgdGFrZSBhbm90
aGVyIHBhc3MgYXQgdGhpcywgYW5kIHNlZSBpZiB5b3UgY291bGQgYWRkIGEgbGl0dGxlIG1vcmUg
ZGV0YWlsIHRvIHlvdXIgcHJvcG9zYWwuDQoNClRoYW5rcywNCg0KLUVkIA0K
