Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xs1D1VtGzDqrV
 for <openbmc@lists.ozlabs.org>; Sat, 25 Aug 2018 05:34:36 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Aug 2018 12:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,283,1531810800"; d="scan'208";a="86160788"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by orsmga002.jf.intel.com with ESMTP; 24 Aug 2018 12:33:39 -0700
Received: from orsmsx152.amr.corp.intel.com (10.22.226.39) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Fri, 24 Aug 2018 12:33:39 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX152.amr.corp.intel.com ([169.254.8.164]) with mapi id 14.03.0319.002;
 Fri, 24 Aug 2018 12:33:38 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Patrick Venture <venture@google.com>
CC: "Wang, Kuiying" <kuiying.wang@intel.com>, "kun.yi.731@gmail.com"
 <kun.yi.731@gmail.com>, "Mihm, James" <james.mihm@intel.com>, "Nguyen, Hai V"
 <hai.v.nguyen@intel.com>, "Feist, James" <james.feist@intel.com>, "Jia,
 Chunhui" <chunhui.jia@intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, "Li, Yong B" <yong.b.li@intel.com>, "Yang, Cheng
 C" <cheng.c.yang@intel.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, "Xu,
 Qiang" <qiang.xu@intel.com>, "geissonator@yahoo.com" <geissonator@yahoo.com>
Subject: RE: Proposal for caching/buffering POST codes list for one boot
 process.
Thread-Topic: Proposal for caching/buffering POST codes list for one boot
 process.
Thread-Index: AdQ7eR/bc73xgP9DTP2CeieN2plWEgAS9P0gABLBcYAAC9Q38A==
Date: Fri, 24 Aug 2018 19:33:38 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E8216993458355BC@ORSMSX114.amr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249E020C3@shsmsx102.ccr.corp.intel.com>
 <7E9441B1E5EFFD4681F54958E8216993458353D7@ORSMSX114.amr.corp.intel.com>
 <CAO=notwzyahJ3onTynwoSff6y5NamoHRH_PtdwAyt2sgUNZh_A@mail.gmail.com>
In-Reply-To: <CAO=notwzyahJ3onTynwoSff6y5NamoHRH_PtdwAyt2sgUNZh_A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMGUxY2FkNjYtOWFlZi00NWJlLTkzY2MtOTQyNDVmY2U0ZTY1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiazd4OFBENzUxNkxPSlBPNFJ0bkRiekxLVm1FN21PTGVoQmpqRmlFNTloOXBcLzhwZ05VVWpjc05ISDVZbE1NY1MifQ==
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
X-List-Received-Date: Fri, 24 Aug 2018 19:34:41 -0000

PiANCj4gSSBsaWtlIHRoaXMgYXBwcm9hY2gsIGJ1dCBvbmUgd291bGQgbmVlZCB0byBlbnVtZXJh
dGUgdGhlIHRyZWUgdG8ga25vdyBob3cNCj4gbWFueSB0aGVyZSBhcmUgY2FjaGVkIGF2YWlsYWJs
ZS4gIEFsYmVpdCwgbWF5YmUgdGhhdCdzIHRyaXZpYWwgOkQNCg0KQSBEQnVzIGNhbGwgdG8gT2Jq
ZWN0bWFwcGVyICB3b3VsZCB0ZWxsIHlvdSBob3cgbWFueSBvYmplY3RzIHlvdSBoYXZlLg0KR2V0
U3VidHJlZSAgcGF0aDoveHl6L29wZW5ibWNfcHJvamVjdC9ob3N0L3Bvc3QgZGVwdGg6IDAgaW50
ZXJmYWNlcyBbInh5ei5vcGVuYm1jX3Byb2plY3QuSG9zdC5TdGF0ZS5Cb290LlJhdyJdIHdvdWxk
IGdldCB5b3UgYSBsaXN0IG9mIGFsbCBQb3N0IGNvZGUgaW50ZXJmYWNlcw0KRGVwZW5kaW5nIG9u
IHRoZSBjb250ZXh0IHlvdSBtaWdodCBhbHNvIGJlIGFibGUgdG8gZ2V0IGF3YXkgd2l0aCBqdXN0
IEdldFN1YnRyZWVQYXRocy4NCg0KSSB3b3VsZG4ndCBjYWxsIGl0IHRyaXZpYWwsIGJ1dCBpdCBm
YWxscyBpbiB0aGUgY2F0ZWdvcnkgb2YgZG9hYmxlLg0KDQpBbHRlcm5hdGl2ZWx5LCBpZiB5b3Ug
a25vdyB5b3UgbmVlZCBhbGwgb2YgdGhlbSBmb3Igd2hhdGV2ZXIgcmVzcG9uc2UgeW91J3JlIGJ1
aWxkaW5nLCBHZXRNYW5hZ2VkT2JqZWN0cyB0byB0aGUgUG9zdCBjb2RlIGRhZW1vbiBkaXJlY3Rs
eSB3b3VsZCBzYXZlIHlvdSBhIHJvdW5kIHRyaXAgdGhyb3VnaCBEQnVzLg0KDQoNCg==
