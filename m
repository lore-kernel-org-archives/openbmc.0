Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zz050d9nzDqC3
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 16:10:57 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2018 23:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,298,1531810800"; d="scan'208";a="85512887"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by orsmga001.jf.intel.com with ESMTP; 27 Aug 2018 23:09:38 -0700
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Mon, 27 Aug 2018 23:09:37 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX151.amr.corp.intel.com ([169.254.7.211]) with mapi id 14.03.0319.002;
 Mon, 27 Aug 2018 23:09:37 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: "kunyi731@gmail.com" <kunyi731@gmail.com>
CC: "chunhui.jia@linux.intel.com" <chunhui.jia@linux.intel.com>,
 "venture@google.com" <venture@google.com>, "Wang, Kuiying"
 <kuiying.wang@intel.com>, "Mihm, James" <james.mihm@intel.com>, "Nguyen, Hai
 V" <hai.v.nguyen@intel.com>, "Feist, James" <james.feist@intel.com>, "Jia,
 Chunhui" <chunhui.jia@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Li, Yong B" <yong.b.li@intel.com>, "Yang, Cheng
 C" <cheng.c.yang@intel.com>, "bradleyb@fuzziesquirrel.com"
 <bradleyb@fuzziesquirrel.com>, "Xu, Qiang" <qiang.xu@intel.com>,
 "geissonator@yahoo.com" <geissonator@yahoo.com>, Kun Yi <kunyi@google.com>
Subject: RE: RE: Proposal for caching/buffering POST codes list for one boot
 process.
Thread-Topic: RE: Proposal for caching/buffering POST codes list for one
 boot process.
Thread-Index: AdQ7eR/bc73xgP9DTP2CeieN2plWEgAS9P0gABLBcYAAC9Q38ABnLEB8ABAz9XAAH7rogAAAFs0AAAAfcYAAAgAGIA==
Date: Tue, 28 Aug 2018 06:09:37 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345836607@ORSMSX114.amr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249E020C3@shsmsx102.ccr.corp.intel.com>
 <7E9441B1E5EFFD4681F54958E8216993458353D7@ORSMSX114.amr.corp.intel.com>
 <CAO=notwzyahJ3onTynwoSff6y5NamoHRH_PtdwAyt2sgUNZh_A@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E8216993458355BC@ORSMSX114.amr.corp.intel.com>
 <2018082715593358738018@linux.intel.com>
 <7E9441B1E5EFFD4681F54958E821699345835CCF@ORSMSX114.amr.corp.intel.com>
 <CADNDqJzNhd_ApA83F8BubFUaGfrc2+W8TPw6_9PZCPwUvxH-+Q@mail.gmail.com>
 <CADNDqJwvMaGXCiFGO+3iEgNG=S=BLA=CVgZ8N2-e8m==KMGwbw@mail.gmail.com>
 <CADNDqJw8hnOGP3YEW0eS5CN7BLJ6Gu6tTxSugcJFrzrwYS7EJA@mail.gmail.com>
In-Reply-To: <CADNDqJw8hnOGP3YEW0eS5CN7BLJ6Gu6tTxSugcJFrzrwYS7EJA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGI3MGQ3ZTMtMGYwOS00MmVmLTg2OGEtZWFkNWQ3MGIxZTFkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibzVRZmNWS0dOZzM4WHh6Y0VSMUhDSWtFRnY4WVJmZGgzVU5UeHU1bE8rOWM2YXdcL3VUb2ZNZlBFK3F1TjFkd1AifQ==
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
X-List-Received-Date: Tue, 28 Aug 2018 06:11:02 -0000

PiBPYnZpb3VzIGFub3RoZXIgdGhpbmcgd2Ugd291bGQgbmVlZCB0byBjb25zaWRlciBpcyBwZXJm
b3JtYW5jZS4gQSBob3N0IGJvb3Rpbmcgc2Vzc2lvbiBjb3VsZCBwcm9kdWNlIGRvemVucyBvciBo
dW5kcmVkcyBvZiBQT1NUIGNvZGVzIGRlcGVuZGluZyBvbiBob3cgDQo+IHZlcmJvc2UgdGhlIEJJ
T1MgaXMsIGFuZCB3ZSBzaG91bGQgYmUgY2FyZWZ1bCBub3QgdG8gZGVzaWduIHNvbWV0aGluZyB0
aGF0IGNyZWF0ZXMgdG9vIG11Y2ggREJ1cyB0cmFmZmljLiBUaGVzZSBlbWJlZGRlZCBwcm9jZXNz
b3JzIGFyZSBub3QgcGVyZm9ybWFuY2UgPw0KPiBiZWFzdHMgYnkgYW55IG1lYW5zLg0KDQpJIHdv
dWxkIGJlIHJlYWxseSBzdXJwcmlzZWQgaWYgUE9TVCBjb2RlcyB3ZXJlIGV2ZXIgYSBwZXJmb3Jt
YW5jZSBib3R0bGVuZWNrIGV2ZW4gaW4gd2l0aCB0aGUgd29yc3QgaW1wbGVtZW50YXRpb24gcG9z
c2libGUuICBIdW5kcmVkcyBvZiBwb3N0IGNvZGVzIGluIGEgbWludXRlIGlzIHN0aWxsIG9yZGVy
cyBvZiBtYWduaXR1ZGUgbGVzcyBkYXRhIHRoYW4gdGhlIHNlbnNvcnMgYXJlIGFscmVhZHkgcHVz
aGluZyBvdmVyIERCdXMuDQoNCj5PbiBNb24sIEF1ZyAyNywgMjAxOCBhdCA0OjUyIFBNIEt1biBZ
aSA8a3VuLnlpLjczMUBnbWFpbC5jb20+IHdyb3RlOg0KPkkgdGhpbmsgdGhlIGNob2ljZSBvZiAq
d2hlcmUqIHRvIHB1dCBzdWNoIGJ1ZmZlcmluZyB3YXJyYW50cyBzb21lIHRob3VnaHRzIGFuZCBk
ZXNpZ24uIEdvaW5nIHRocm91Z2ggd2hhdCBJIGhhdmUgdGhvdWdodDoNCg0KPiAxLiBJdCdzIHBv
c3NpYmxlIHRvIGltcGxlbWVudCBob3N0IHN0YXRlIGRldGVjdGlvbiBhbmQgaG9zdCBQT1NUIGNv
ZGUgYnVmZmVyaW5nIGFsbCBpbiBhIGNsaWVudCBkYWVtb24sIHdoaWNoIGlzIGEgbG9uZy1saXZl
ZCBwcm9jZXNzIHRoYXQNCj4gLSBrZWVwcyBsaXN0ZW5pbmcgdG8gUE9TVCBjb2RlcyBwdWJsaXNo
ZWQNCj4gLSBrZWVwcyBwb2xsaW5nIGhvc3Qgc3RhdGUNCj4gLSB3aGVuIGhvc3QgcG93ZXIgc3Rh
dGUgdG9nZ2xlZCwgd3JpdGUgdGhlIFBPU1QgY29kZXMgcmVjZWl2ZWQgdG8gYSBmaWxlIG9uIGRp
c2sNClRoaXMgd291bGQgbWVhbiB0aGF0IHBhcnRpYWwgYm9vdHMsIG9yIGJvb3RzIHRoYXQgaGF2
ZSBvdmVyIGN1cnJlbnQgaXNzdWVzIHdvdWxkbid0IGJlIHBlcnNpc3RlZCBhdCBhbGwuICBJdCdz
IGEgYml0IG9mIGFuIGltcGxlbWVudGF0aW9uIGRldGFpbCBhdCB0aGlzIHBvaW50LCBidXQgSSBz
dXNwZWN0IHdlJ3JlIGdvaW5nIHRvIHdhbnQgdG8gcGVyc2lzdCBwb3N0IGNvZGVzIG1vcmUgb2Z0
ZW4gdGhhbiBqdXN0IGV2ZXJ5IGJvb3QuDQoNCj4gUHJvcyBvZiB0aGlzIGFwcHJvYWNoIGlzIHRo
YXQgc2VydmVyIGRhZW1vbnMgYXJlIGtlcHQgc2ltcGxlLiBQT1NUIGNvZGUgc2VydmVyIGRvZXNu
J3QgbmVlZCB0byB0YWxrIHRvIGhvc3Qgc3RhdGUgZGFlbW9uIG9yIGV2ZW4gYXNzdW1lIGl0cyBl
eGlzdGVuY2UuDQo+IFByb3Mgb2YgYnVmZmVyaW5nIG9uIHNlcnZlciBzaWRlOiBwb3RlbnRpYWxs
eSB0aGVyZSB3aWxsIGJlIG1vcmUgdGhhbiBvbmUgaWRlbnRpdGllcyBuZWVkaW5nIHRoZSBsaXN0
IG9mIFBPU1QgY29kZXMuIElQTUk/IExvZ2dpbmc/IEl0IHdvdWxkIHJlYWxseSBoZWxwIGlmIHdl
IGNhbiANCj4gaWRlbnRpZnkgc29tZSBjb25jcmV0ZSB1c2UgY2FzZXMuDQpJIHRoaW5rIHdlIGFs
c28gbmVlZCB0byBjb25zaWRlciB0aGF0IHRoZSBQT1NUIGNvZGUgc2F2aW5nIG1lY2hhbmlzbSBz
aG91bGQgYmUgdXAgYXMgc29vbiBhcyBwb3NzaWJsZSBhZnRlciBib290IHRvIG1ha2Ugc3VyZSB0
aGF0IGluIHRoZSBjYXNlIHdoZXJlIHBvd2VyIHJlc3RvcmUgcG9saWN5IGlzIHNldCB0byBPTiwg
d2UgY2FuIGNhcHR1cmUgYXMgbWFueSBwb3N0IGNvZGVzIGFzIHBvc3NpYmxlIGZyb20gdGhlIGhv
c3QgYm9vdGluZy4gIEluIHByZXZpb3VzIGltcGxlbWVudGF0aW9ucywgdGhpcyBtZWFudCBidWZm
ZXJpbmcgaW4gdGhlIGtlcm5lbCBkcml2ZXIsIGFuZCBtYWtpbmcgdGhlIGFwcGxpY2F0aW9uIGEg
bGlnaHR3ZWlnaHQgc3lzdGVtIGZvciBwZXJzaXN0aW5nIFBPU1QgY29kZXMsIHJhdGhlciB0aGFu
IGFjdHVhbGx5IGNhcHR1cmUgdGhlbSBpdHNlbGYuDQoNCg==
