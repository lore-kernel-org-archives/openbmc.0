Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xmXY0NZwzDqj4
 for <openbmc@lists.ozlabs.org>; Sat, 25 Aug 2018 02:13:00 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Aug 2018 09:12:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,283,1531810800"; d="scan'208";a="251658087"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by orsmga005.jf.intel.com with ESMTP; 24 Aug 2018 09:12:58 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Fri, 24 Aug 2018 09:12:58 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX153.amr.corp.intel.com ([169.254.12.242]) with mapi id 14.03.0319.002;
 Fri, 24 Aug 2018 09:12:56 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: "Wang, Kuiying" <kuiying.wang@intel.com>, Kun Yi <kun.yi.731@gmail.com>
CC: "Li, Yong B" <yong.b.li@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Feist, James" <james.feist@intel.com>, "'Andrew
 Geissler'" <geissonator@yahoo.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>, "Jia, Chunhui" <chunhui.jia@intel.com>,
 "Yang, Cheng C" <cheng.c.yang@intel.com>, "Xu, Qiang" <qiang.xu@intel.com>,
 "Mihm, James" <james.mihm@intel.com>, "Nguyen, Hai V"
 <hai.v.nguyen@intel.com>
Subject: RE: Proposal for caching/buffering POST codes list for one boot
 process.
Thread-Topic: Proposal for caching/buffering POST codes list for one boot
 process.
Thread-Index: AdQ7eR/bc73xgP9DTP2CeieN2plWEgAS9P0g
Date: Fri, 24 Aug 2018 16:12:55 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E8216993458353D7@ORSMSX114.amr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249E020C3@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E77249E020C3@shsmsx102.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTkwZjM2ZWItYzI1ZS00YTA1LWE1NTUtZmYwMmVmZDNmYzQwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoic3llb3o5bE9GMXhjT29qSUFyejlpbWFLVzdWdnFSNEhram0yV3hzWlFpaUkrRXh6d1lpY0xTTDB4SysrS21weCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
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
X-List-Received-Date: Fri, 24 Aug 2018 16:13:01 -0000

V291bGQgaXQgbWFrZSBtb3JlIHNlbnNlIHRvIHNpbXBseSBpbmNsdWRlIG11bHRpcGxlIHBvc3Qg
Y29kZSBwYXRocyBvbiBkYnVzPw0KDQoveHl6L29wZW5ibWNfcHJvamVjdC9ob3N0L3Bvc3QvY3Vy
cmVudA0KL3h5ei9vcGVuYm1jX3Byb2plY3QvaG9zdC9wb3N0LzENCi94eXovb3BlbmJtY19wcm9q
ZWN0L2hvc3QvcG9zdC8yDQoNClRoaXMgd291bGQgYWxsb3cgdGhlIGludGVyZmFjZSBpdHNlbGYg
dG8gZGVmaW5lIGFuIGFyYml0cmFyeSBudW1iZXIgb2YgcG9zdCBjb2RlIGNvbGxlY3Rpb25zLCBy
YXRoZXIgdGhhbiBqdXN0IHByZXZpb3VzIGFuZCBjdXJyZW50LiAgSW5pdGlhbGx5LCBwcmV2aW91
cyBhbmQgY3VycmVudCBpcyBsaWtlbHkgYWxsIHdlIG5lZWQsIGJ1dCBpbiB0aGUgZnV0dXJlLCBp
dCBtaWdodCBiZSBnb29kIHRvIHN0b3JlIG1vcmUuDQo=
