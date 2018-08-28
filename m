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
 by lists.ozlabs.org (Postfix) with ESMTPS id 420P6825ChzF0ph
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 08:47:43 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2018 15:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,300,1531810800"; d="scan'208";a="228429077"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by orsmga004.jf.intel.com with ESMTP; 28 Aug 2018 15:47:37 -0700
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 28 Aug 2018 15:47:37 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX159.amr.corp.intel.com ([169.254.11.207]) with mapi id 14.03.0319.002;
 Tue, 28 Aug 2018 15:47:37 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Patrick Venture <venture@google.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: Two Google-Origin Daemons
Thread-Topic: Two Google-Origin Daemons
Thread-Index: AQHUPxDbGb+SM6zkC0CdC1yTNJ1GOqTVw9tA
Date: Tue, 28 Aug 2018 22:47:35 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345836DDE@ORSMSX114.amr.corp.intel.com>
References: <CAO=notx7e+sfKm3t07-kg3pjrk2H3E5p=jQsZsW=Ekosd7=yyw@mail.gmail.com>
In-Reply-To: <CAO=notx7e+sfKm3t07-kg3pjrk2H3E5p=jQsZsW=Ekosd7=yyw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOWFmZDg2ZGQtNTc2ZC00ZTlmLTg5NTEtZTk0MTc5MmVmYzY2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR1wvQk5BdFY4RWxDUUowbXVvV1wvQUdvZlJxakgxTTZlVXdyOHJweVFwTTMrc3NWNVF0aXRMMElhXC80c01LTDRadyJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: request-justification,no-action
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
X-List-Received-Date: Tue, 28 Aug 2018 22:47:45 -0000

PiBXZSBoYXZlIHR3byBkYWVtb25zICh0byBzdGFydCB3aXRoKSB0aGF0IHdlJ2QgbGlrZSB0byBz
ZW5kIHVwLg0KDQpXaGF0IGRhZW1vbnMgYXJlIHRoZXk/ICBBcmUgdGhleSBnZW5lcmljIGRhZW1v
bnMgdGhhdCBvdGhlcnMgbWlnaHQgYmUgaW50ZXJlc3RlZCBpbiwgb3IgZ29vZ2xlIHNwZWNpZmlj
IHRoaW5ncz8NCg==
