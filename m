Return-Path: <kuiying.wang@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 425XKB03k6zF09c
 for <openbmc@lists.ozlabs.org>; Thu,  6 Sep 2018 17:30:04 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2018 00:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,337,1531810800"; d="scan'208";a="72023311"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 06 Sep 2018 00:29:59 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Thu, 6 Sep 2018 00:29:59 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Thu, 6 Sep 2018 00:29:58 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.226]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.16]) with mapi id 14.03.0319.002;
 Thu, 6 Sep 2018 15:29:56 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "geissonator@yahoo.com"
 <geissonator@yahoo.com>
CC: "kunyi731@gmail.com" <kunyi731@gmail.com>, "Mihm, James"
 <james.mihm@intel.com>, "Tanous, Ed" <ed.tanous@intel.com>, "Li, Yong B"
 <yong.b.li@intel.com>, "Feist, James" <james.feist@intel.com>, "Jia, Chunhui"
 <chunhui.jia@intel.com>, "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Xu, Qiang"
 <qiang.xu@intel.com>, "Yang, Cheng C" <cheng.c.yang@intel.com>,
 "chunhui.jia@linux.intel.com" <chunhui.jia@linux.intel.com>, "Nguyen, Hai V"
 <hai.v.nguyen@intel.com>
Subject: About new gpio API in linux/gpio.h adopted by kernel 4.8
Thread-Topic: About new gpio API in linux/gpio.h adopted by kernel 4.8
Thread-Index: AdRFsoAZzxmWWfOISWukV16CyY/HkQ==
Date: Thu, 6 Sep 2018 07:29:55 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E77249E0C0B0@shsmsx102.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
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
X-List-Received-Date: Thu, 06 Sep 2018 07:30:07 -0000

SGkgQnJhZC9BbmRyZXcsDQpJIGZvdW5kIHRoZSBuZXcgZ3BpbyBBUEkgYWRvcHRlZCBieSBrZXJu
ZWwgNC44LCBpcyBub3QgZnVsbHkgcmVhZHksIGFsbCB0aGUgbGluZXMgYXJlICJ1bm5hbWVkIi4N
CklmIHRoYXQgd2UgY2Fubm90IHN3aXRjaCB0byBpdCBub3cuIA0KT3IgdGhlcmUgaXMgc3BlY2lh
bCBrZXJuZWwgYmFzZWQgY29uZmlndXJhdGlvbiBJIGhhdmUgdG8gZG8/DQoNCnJvb3RAd29sZnBh
c3M6L3RtcCMgLi9ncGlvZGV0ZWN0DQpncGlvY2hpcDAgW1NHUElPQV0gKDggbGluZXMpDQpncGlv
Y2hpcDEgW1NHUElPQl0gKDggbGluZXMpDQpncGlvY2hpcDEwIFsxZTc4MDAwMC5ncGlvXSAoMjMy
IGxpbmVzKQ0KZ3Bpb2NoaXAyIFtTR1BJT0NdICg4IGxpbmVzKQ0KZ3Bpb2NoaXAzIFtTR1BJT0Rd
ICg4IGxpbmVzKQ0KZ3Bpb2NoaXA0IFtTR1BJT0VdICg4IGxpbmVzKQ0KZ3Bpb2NoaXA1IFtTR1BJ
T0ZdICg4IGxpbmVzKQ0KZ3Bpb2NoaXA2IFtTR1BJT0ddICg4IGxpbmVzKQ0KZ3Bpb2NoaXA3IFtT
R1BJT0hdICg4IGxpbmVzKQ0KZ3Bpb2NoaXA4IFtTR1BJT0ldICg4IGxpbmVzKQ0KZ3Bpb2NoaXA5
IFtTR1BJT0pdICg4IGxpbmVzKQ0Kcm9vdEB3b2xmcGFzczovdG1wIyAuL2dwaW9pbmZvIC9kZXYv
Z3Bpb2NoaXAxDQpncGlvY2hpcDEgLSA4IGxpbmVzOg0KICAgICAgICBsaW5lICAgMDogICAgICB1
bm5hbWVkICAgICAgIHVudXNlZCAgb3V0cHV0ICBhY3RpdmUtaGlnaA0KICAgICAgICBsaW5lICAg
MTogICAgICB1bm5hbWVkICAgICAgIHVudXNlZCAgb3V0cHV0ICBhY3RpdmUtaGlnaA0KICAgICAg
ICBsaW5lICAgMjogICAgICB1bm5hbWVkICAgICAgIHVudXNlZCAgb3V0cHV0ICBhY3RpdmUtaGln
aA0KICAgICAgICBsaW5lICAgMzogICAgICB1bm5hbWVkICAgICAgIHVudXNlZCAgb3V0cHV0ICBh
Y3RpdmUtaGlnaA0KICAgICAgICBsaW5lICAgNDogICAgICB1bm5hbWVkICAgICAgIHVudXNlZCAg
b3V0cHV0ICBhY3RpdmUtaGlnaA0KICAgICAgICBsaW5lICAgNTogICAgICB1bm5hbWVkICAgICAg
IHVudXNlZCAgb3V0cHV0ICBhY3RpdmUtaGlnaA0KICAgICAgICBsaW5lICAgNjogICAgICB1bm5h
bWVkICAgICAgIHVudXNlZCAgb3V0cHV0ICBhY3RpdmUtaGlnaA0KICAgICAgICBsaW5lICAgNzog
ICAgICB1bm5hbWVkICAgICAgIHVudXNlZCAgb3V0cHV0ICBhY3RpdmUtaGlnaA0Kcm9vdEB3b2xm
cGFzczovdG1wIyAuL2dwaW9pbmZvIC9kZXYvZ3Bpb2NoaXAxMA0KZ3Bpb2NoaXAxMCAtIDIzMiBs
aW5lczoNCiAgICAgICAgbGluZSAgIDA6ICAgICAgdW5uYW1lZCAgICAgICB1bnVzZWQgICBpbnB1
dCAgYWN0aXZlLWhpZ2gNCiAgICAgICAgbGluZSAgIDE6ICAgICAgdW5uYW1lZCAgICAgICB1bnVz
ZWQgICBpbnB1dCAgYWN0aXZlLWhpZ2gNCiAgICAgICAgbGluZSAgIDI6ICAgICAgdW5uYW1lZCAg
ICAgICB1bnVzZWQgICBpbnB1dCAgYWN0aXZlLWhpZ2gNCiAgICAgICAgbGluZSAgIDM6ICAgICAg
dW5uYW1lZCAgICAgICB1bnVzZWQgICBpbnB1dCAgYWN0aXZlLWhpZ2gNCiAgICAgICAgbGluZSAg
IDQ6ICAgICAgdW5uYW1lZCAgICAgICB1bnVzZWQgICBpbnB1dCAgYWN0aXZlLWhpZ2gNCiAgICAg
ICAgbGluZSAgIDU6ICAgICAgdW5uYW1lZCAgICAgICB1bnVzZWQgICBpbnB1dCAgYWN0aXZlLWhp
Z2gNCiAgICAgICAgbGluZSAgIDY6ICAgICAgdW5uYW1lZCAgICAgICB1bnVzZWQgICBpbnB1dCAg
YWN0aXZlLWhpZ2gNCiAgICAgICAgbGluZSAgIDc6ICAgICAgdW5uYW1lZCAgICAgICB1bnVzZWQg
ICBpbnB1dCAgYWN0aXZlLWhpZ2gNCiAgICAgICAgbGluZSAgIDg6ICAgICAgdW5uYW1lZCAgICAg
ICB1bnVzZWQgICBpbnB1dCAgYWN0aXZlLWhpZ2gNCiAgICAgICAgbGluZSAgIDk6ICAgICAgdW5u
YW1lZCAgICAgICB1bnVzZWQgICBpbnB1dCAgYWN0aXZlLWhpZ2gNCiAgICAgICAgbGluZSAgMTA6
ICAgICAgdW5uYW1lZCAgICAgICB1bnVzZWQgICBpbnB1dCAgYWN0aXZlLWhpZ2gNCiAgICAgICAg
bGluZSAgMTE6ICAgICAgdW5uYW1lZCAgICAgICB1bnVzZWQgICBpbnB1dCAgYWN0aXZlLWhpZ2gN
CiAgICAgICAgbGluZSAgMTI6ICAgICAgdW5uYW1lZCAgICAgICB1bnVzZWQgICBpbnB1dCAgYWN0
aXZlLWhpZ2gNCiAgICAgICAgbGluZSAgMTM6ICAgICAgdW5uYW1lZCAgICAgICB1bnVzZWQgICBp
bnB1dCAgYWN0aXZlLWhpZ2gNCiAgICAgICAgbGluZSAgMTQ6ICAgICAgdW5uYW1lZCAgICAgICB1
bnVzZWQgICBpbnB1dCAgYWN0aXZlLWhpZ2gNCiAgICAgICAgbGluZSAgMTU6ICAgICAgdW5uYW1l
ZCAgICAgICB1bnVzZWQgICBpbnB1dCAgYWN0aXZlLWhpZ2gNCiAgICAgICAgbGluZSAgMTY6ICAg
ICAgdW5uYW1lZCAgICAgICB1bnVzZWQgICBpbnB1dCAgYWN0aXZlLWhpZ2gNCnJvb3RAd29sZnBh
c3M6L3RtcCMgLi9ncGlvZ2V0IC9kZXYvZ3Bpb2NoaXAxMCAyMTkNCi4vZ3Bpb2dldDogZXJyb3Ig
cmVhZGluZyBHUElPIHZhbHVlczogRGV2aWNlIG9yIHJlc291cmNlIGJ1c3kNCg0KVGhhbmtzLA0K
S3VpeWluZy4NCg==
