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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zzMF1bX0zDrRN
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 16:27:34 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2018 23:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,298,1531810800"; d="scan'208";a="66513921"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by fmsmga008.fm.intel.com with ESMTP; 27 Aug 2018 23:27:24 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX105.amr.corp.intel.com ([169.254.2.117]) with mapi id 14.03.0319.002;
 Mon, 27 Aug 2018 23:27:19 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Kun Yi <kunyi@google.com>, Patrick Venture <venture@google.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, William Kennington
 <wak@google.com>
Subject: RE: Announcing gpioplus
Thread-Topic: Announcing gpioplus
Thread-Index: AQHUOccyfjaloMebF0q9b5NpP2lt3qTMQtEAgAhhNoCAABbLUA==
Date: Tue, 28 Aug 2018 06:27:18 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E8216993458366AD@ORSMSX114.amr.corp.intel.com>
References: <CAPnigKkG1C-80T-7c18oSAC_s5CpEN2XbaCOY2u9g1jqVv_fmg@mail.gmail.com>
 <CAO=notwK9fhqSTjHpMZYMmUrJZFKfNKW9m83KiT9Vun-rY3R3g@mail.gmail.com>
 <CAGMNF6UdPH89t=eyqG=O0bOh63DtXbfkxLqRWSOhXeXuikLv3g@mail.gmail.com>
In-Reply-To: <CAGMNF6UdPH89t=eyqG=O0bOh63DtXbfkxLqRWSOhXeXuikLv3g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODFhNjAyY2EtZDI4MS00MGJhLWEzMTQtZjM1MmU0OTQyNzJkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMzYzN09iR04xR0V3SFBwWTVGT0kxUXlwNklMc04yUnhTVFhjSjdiUUltWU1LaUF0VTkxVUU3d2hua3Y3QTdpRiJ9
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
X-List-Received-Date: Tue, 28 Aug 2018 06:27:38 -0000

SSB0aGluayB0aGUgbW9zdCBlZmZlY3RpdmUgd2F5IHRvIGdldCB0aGlzIG1vdmluZyB3b3VsZCBi
ZSB0byBzdGFydCBzZW5kaW5nIHB1bGwgcmVxdWVzdHMgdG8gdGhlIGV4aXN0aW5nIHBsYWNlcyB0
aGF0IHlvdSB0aGluayB3b3VsZCBiZW5lZml0IGZyb20gdGhpcyBsaWJyYXJ5LiAgVGhhdCB3b3Vs
ZCBnaXZlIGNvbmNyZXRlIGV4YW1wbGVzIG9mIGl0cyB1c2UsIGFuZCBwcm92ZSBpdHMgdXNlZnVs
bmVzcyBhIGxvdCBtb3JlIHRoYW4gYW55dGhpbmcgZWxzZS4gIEl0IHdvdWxkIGFsc28gYmUgYSBn
cmVhdCBhbnN3ZXIgdG8gIldoeSBkbyB3ZSBuZWVkIHlldCBhbm90aGVyIGxpYnJhcnk/IiBhcyBJ
J20gZ3Vlc3NpbmcgaXQgd291bGQgc2hvdyBjb25zaWRlcmFibHkgcmVkdWNlZCBjb21wbGV4aXR5
IG9yIG1vcmUgZmxleGliaWxpdHkgb3ZlciBkZWFsaW5nIHdpdGggcmF3IEdQSU8sIHdoaWNoIEkn
bSBob3Bpbmcgd291bGQgYmUgYXBwYXJlbnQgaW4gdGhlIGNvZGUgcmV2aWV3cy4gIEl0IHdvdWxk
IGFsc28gZ2l2ZSBzb21lIGdyZWF0IHBvcnRpbmcgZXhhbXBsZXMgZm9yIHRob3NlIGxvb2tpbmcg
YXQgcG9ydGluZyB0aGluZ3Mgb3ZlciB0byB0aGUgbGlicmFyeS4NCg0KLUVkDQo=
