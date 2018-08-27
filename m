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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zbqr5vNkzDq5k
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 01:47:32 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2018 08:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,295,1531810800"; d="scan'208";a="83770104"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by fmsmga004.fm.intel.com with ESMTP; 27 Aug 2018 08:45:55 -0700
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Mon, 27 Aug 2018 08:45:54 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX155.amr.corp.intel.com ([169.254.7.64]) with mapi id 14.03.0319.002;
 Mon, 27 Aug 2018 08:45:54 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: chunhui.jia <chunhui.jia@linux.intel.com>, Patrick Venture
 <venture@google.com>
CC: "Wang, Kuiying" <kuiying.wang@intel.com>, "Mihm, James"
 <james.mihm@intel.com>, "Nguyen, Hai V" <hai.v.nguyen@intel.com>, "Feist,
 James" <james.feist@intel.com>, "Jia, Chunhui" <chunhui.jia@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Li, Yong B"
 <yong.b.li@intel.com>, "Yang, Cheng C" <cheng.c.yang@intel.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>, "Xu, Qiang" <qiang.xu@intel.com>,
 "kun.yi.731@gmail.com" <kun.yi.731@gmail.com>, "geissonator@yahoo.com"
 <geissonator@yahoo.com>
Subject: RE: RE: Proposal for caching/buffering POST codes list for one boot
 process.
Thread-Topic: RE: Proposal for caching/buffering POST codes list for one
 boot process.
Thread-Index: AdQ7eR/bc73xgP9DTP2CeieN2plWEgAS9P0gABLBcYAAC9Q38ABnLEB8ABAz9XA=
Date: Mon, 27 Aug 2018 15:45:53 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345835CCF@ORSMSX114.amr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249E020C3@shsmsx102.ccr.corp.intel.com>, 
 <7E9441B1E5EFFD4681F54958E8216993458353D7@ORSMSX114.amr.corp.intel.com>,
 <CAO=notwzyahJ3onTynwoSff6y5NamoHRH_PtdwAyt2sgUNZh_A@mail.gmail.com>,
 <7E9441B1E5EFFD4681F54958E8216993458355BC@ORSMSX114.amr.corp.intel.com>
 <2018082715593358738018@linux.intel.com>
In-Reply-To: <2018082715593358738018@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2E3MDkyZDQtODBiMy00MWNkLWI3OGYtNDczMGU2NTg2OWJkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWnkwblg4aDhpNWI3RHVKSmljdzVrQ2JTeUYwQzJDMnFhSng3XC9GVG5ENzJlcXpYMkV1ZmpvVXRCSkhOZ0g3czMifQ==
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
X-List-Received-Date: Mon, 27 Aug 2018 15:47:37 -0000

PiBDb3VsZCB5b3UgY29uZmlybSBpZiB0aGUgIi94eXovb3BlbmJtY19wcm9qZWN0L2hvc3QvcG9z
dC8xIiB0aGF0IHdlIHRhbGtlZCBoZXJlIGNvbnRhaW5zIGEgbGlzdCBvZiBwb3N0IGNvZGUgZm9y
IG9uZSBjeWNsZT/CoA0KDQpDb3JyZWN0LiAgRWFjaCBvbmUgd291bGQgY29udGFpbiBhIGxpc3Qg
b2YgUE9TVCBjb2RlcyBmb3IgdGhhdCBib290Lg0KDQotRWQNCg==
