Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Ktkf0T2CzDqkW
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 12:01:45 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2018 17:01:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,374,1539673200"; d="scan'208";a="119824921"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Dec 2018 17:01:41 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.59]) by
 ORSMSX107.amr.corp.intel.com ([169.254.1.51]) with mapi id 14.03.0415.000;
 Wed, 19 Dec 2018 17:01:41 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: "Shreyas Chandrashekar (shrchand)" <shrchand@cisco.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: "Guhan Balasubramanian (gubalasu)" <gubalasu@cisco.com>
Subject: RE: Use MilliAmps for IPMI tool
Thread-Topic: Use MilliAmps for IPMI tool
Thread-Index: AQHUl8ymCQmEMU7mS0eLpjHFq4IuuaWGbkhQgAAqHQCAADMgIA==
Date: Thu, 20 Dec 2018 01:01:40 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E8216993459845B3@ORSMSX114.amr.corp.intel.com>
References: <85D37044-F771-4019-A66F-0762AD59BF1F@cisco.com>
 <7E9441B1E5EFFD4681F54958E821699345984003@ORSMSX114.amr.corp.intel.com>
 <72407329-3C6C-4265-8D57-9A104B66DEE5@cisco.com>
In-Reply-To: <72407329-3C6C-4265-8D57-9A104B66DEE5@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTE3ZWU0MTEtOWZiMS00ZTBkLTgwZmMtOTE0YzMyYWQ1OWU2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNDFXZ2JhS3VrOUhidGV3akFtbkIwSXk0RXNVVmJYcjdmWmQ2MHVSQ2JsakVEV1RiMTBvckpRc0g2MmdUaGt6SCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
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
X-List-Received-Date: Thu, 20 Dec 2018 01:01:47 -0000

PiANCj4gV2UgYXJlIGxvb2tpbmcgYXQgaGF2aW5nIG1pbGxpYW1wIGFuZCBtaWxsaXZvbHRzIHVu
aXRzIGluIHRoZSB1bml0IGNvZGUgdGFibGUuIElzDQo+IHRoZXJlIGFueXdheSB0byBnZXQgdGhh
dCBzdXBwb3J0PyBUaGF0IHdheSwgd2Ugd2lsbCBiZSBhYmxlIHRvIGRpc3BsYXkgdGhlDQo+IHZh
bHVlcyBpbiBtaWxsaXZvbHRzIGFuZCBtaWxsaWFtcHMuDQo+IA0KDQpXaGF0IHByb2JsZW0gYXJl
IHlvdSB0cnlpbmcgdG8gc29sdmUgd2l0aCB0aGF0IGNoYW5nZT8gIFRoZSBJUE1JIHNwZWMgaXMg
bW9yZSByaWdpZCB0aGFuIGl0IG9uY2Ugd2FzLCBhbmQgZm9yIGEgdXNlIGNhc2UgdGhhdCBpcyBh
bHJlYWR5IGNvdmVyZWQsIEkgd291bGQgYmUgc3VycHJpc2VkIGlmIHlvdSBjb3VsZCBnZXQgaXQg
YWRkZWQsIGFuZCBnZXQgYWxsIHRoZSB0b29scyBhbmQgYmluZGluZ3MgdG8gYWRkIHN1cHBvcnQu
DQo=
