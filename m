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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43LKdH0yy5zDr0Q
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 05:13:37 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2018 10:13:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,378,1539673200"; d="scan'208";a="103526136"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga008.jf.intel.com with ESMTP; 20 Dec 2018 10:13:35 -0800
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 20 Dec 2018 10:13:35 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.59]) by
 ORSMSX159.amr.corp.intel.com ([169.254.11.100]) with mapi id 14.03.0415.000;
 Thu, 20 Dec 2018 10:13:34 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Vijay Khemka <vijaykhemka@fb.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: Testing Phosphor-pid-control
Thread-Topic: Testing Phosphor-pid-control
Thread-Index: AQHUmIxTP8xlE76TH0O3H+2xLU7rIaWH5/IQ
Date: Thu, 20 Dec 2018 18:13:34 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345985566@ORSMSX114.amr.corp.intel.com>
References: <DFD47DF5-0CAE-4968-AF01-76B5884C2D58@fb.com>
In-Reply-To: <DFD47DF5-0CAE-4968-AF01-76B5884C2D58@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjhhNjQ3M2EtZmVhNy00M2MyLTk3NDktNjAxMGVlMzU5ZDUyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidE04akJsbUY1N1wvdlJcL3h3cjFXMTVzNVwvZ1lpVDNDNkp6UmlpTTg5YklLYVVpTFZiN3BkbDV1cmc5aGRJRXp4byJ9
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
X-List-Received-Date: Thu, 20 Dec 2018 18:13:40 -0000

QXNzdW1pbmcgeW914oCZcmUgdXNpbmcgZGJ1cy1zZW5zb3JzICh3aGljaCBJ4oCZbSBwcmV0dHkg
c3VyZSB5b3UgYXJlKToNCg0KU3VwcG9ydCBmb3Igb3ZlcnJpZGluZyBzZW5zb3IgdmFsdWVzIHdh
cyByZWNlbnRseSBsYW5kZWQgaW4gdGhpcyBjb21taXQ6DQpodHRwczovL2dlcnJpdC5vcGVuYm1j
LXByb2plY3QueHl6LyMvYy9vcGVuYm1jL2RidXMtc2Vuc29ycy8rLzE2MTc3Lw0KDQpPdmVycmlk
aW5nIGEgc2Vuc29yIHZhbHVlIHdpdGggYSAiZmFrZSIgc2Vuc29yIHJlYWRpbmcgc2hvdWxkIGJl
IGFzIGVhc3kgYXMgc2ltcGx5IGNhbGxpbmcgU2V0UHJvcGVydHkgb24gdGhlIGRidXMgaW50ZXJm
YWNlLg0KDQpFeGFtcGxlIGFzIHRlc3RlZCBvbiBteSBzeXN0ZW0gKHlvdXIgcGF0aCBuYW1lcyBt
YXkgdmFyeSkNCmRidXMtc2VuZCAtLXN5c3RlbSAtLXByaW50LXJlcGx5IC0tZGVzdD14eXoub3Bl
bmJtY19wcm9qZWN0LkNQVVNlbnNvciAveHl6L29wZW5ibWNfcHJvamVjdC9zZW5zb3JzL3RlbXBl
cmF0dXJlL0NvcmVfMV9DUFUwIG9yZy5mcmVlZGVza3RvcC5EQnVzLlByb3BlcnRpZXMuU2V0IHN0
cmluZzp4eXoub3BlbmJtY19wcm9qZWN0LlNlbnNvci5WYWx1ZSBzdHJpbmc6VmFsdWUgdmFyaWFu
dDpkb3VibGU6MS4wDQoNCmFuZCB2ZXJpZnkgYnkgcmVhZGluZyBpdCBiYWNrIG91dDoNCg0KZGJ1
cy1zZW5kIC0tc3lzdGVtIC0tcHJpbnQtcmVwbHkgLS1kZXN0PXh5ei5vcGVuYm1jX3Byb2plY3Qu
Q1BVU2Vuc29yIC94eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMvdGVtcGVyYXR1cmUvQ29yZV8x
X0NQVTAgb3JnLmZyZWVkZXNrdG9wLkRCdXMuUHJvcGVydGllcy5HZXRBbGwgc3RyaW5nOnh5ei5v
cGVuYm1jX3Byb2plY3QuU2Vuc29yLlZhbHVlDQoNCm1ldGhvZCByZXR1cm4gdGltZT0xNTQzMjY3
ODEyLjQ1ODE2OSBzZW5kZXI9OjEuMTYgLT4gZGVzdGluYXRpb249OjEuMTUzIHNlcmlhbD02Mzk4
IHJlcGx5X3NlcmlhbD0yDQogICBhcnJheSBbDQogICAgICBkaWN0IGVudHJ5KA0KICAgICAgICAg
c3RyaW5nICJNYXhWYWx1ZSINCiAgICAgICAgIHZhcmlhbnQgICAgICAgICAgICAgZG91YmxlIDEy
Nw0KICAgICAgKQ0KICAgICAgZGljdCBlbnRyeSgNCiAgICAgICAgIHN0cmluZyAiTWluVmFsdWUi
DQogICAgICAgICB2YXJpYW50ICAgICAgICAgICAgIGRvdWJsZSAtMTI4DQogICAgICApDQogICAg
ICBkaWN0IGVudHJ5KA0KICAgICAgICAgc3RyaW5nICJWYWx1ZSINCiAgICAgICAgIHZhcmlhbnQg
ICAgICAgICAgICAgZG91YmxlIDENCiAgICAgICkNCiAgIF0NCg==
