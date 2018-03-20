Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4051wf5Cg9zF1hq
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 16:39:58 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2018 22:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,333,1517904000"; d="scan'208";a="212872760"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by fmsmga006.fm.intel.com with ESMTP; 19 Mar 2018 22:39:54 -0700
Received: from orsmsx163.amr.corp.intel.com (10.22.240.88) by
 ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Mon, 19 Mar 2018 22:39:54 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.126]) by
 ORSMSX163.amr.corp.intel.com ([169.254.9.55]) with mapi id 14.03.0319.002;
 Mon, 19 Mar 2018 22:39:53 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Patrick Venture <venture@google.com>
CC: Ratan K Gupta <ratagupt@in.ibm.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: Sdbusplus-based Shared Library
Thread-Topic: Sdbusplus-based Shared Library
Thread-Index: AQHTv6WIcKkb22Mlh0ufnoKwqRW4yKPX3lWQgACKEICAADOXUA==
Date: Tue, 20 Mar 2018 05:39:52 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932F66E3CA@ORSMSX114.amr.corp.intel.com>
References: <CAO=notwXV+EaWJqV61qkZaDSA3mxMhpXbq3iWUqRp2Qg52wMGA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932F66E12E@ORSMSX114.amr.corp.intel.com>
 <CAO=notwojtUMU920tTuG0-OyhTFGSZc0gAk21D+xSr=Kq1Tjiw@mail.gmail.com>
In-Reply-To: <CAO=notwojtUMU920tTuG0-OyhTFGSZc0gAk21D+xSr=Kq1Tjiw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTc3MWY2NmUtODQzMS00ODY3LTgxMDctMWYyZGVkNDE0ZTE5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IlczUGlDaW9HblVEMmtyVWo5Q0R0UGhreFBXT2ZMMHJVUWdoQXdpRXdpTW89In0=
x-originating-ip: [10.22.254.139]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Mar 2018 05:40:03 -0000

PiANCj4gU28gbXkgdGhpbmtpbmcgd2Fzbid0IGFib3V0IHJlZHVjaW5nIHNpemUgb2YgdGhlIGJp
bmFyeSBidXQgcmF0aGVyIHJlZHVjaW5nDQo+IHRoZSB0b2lsIG9mIG1haW50YWluaW5nIG11bHRp
cGxlIGltcGxlbWVudGF0aW9ucyBvZiB0aGUgc2FtZSBjb2RlLg0KPiANCkFoLiAgSSB0b3RhbGx5
IG1pc3NlZCB0aGUgaW50ZW50LiAgIEkgY291bGQgc2VlIGl0IGFkZGluZyB2YWx1ZSBpZiBpdCB3
YXMganVzdCB0byBhdm9pZCBjb2RlIGR1cGxpY2F0aW9uIGluIGRhZW1vbnMuDQoNCi1FZA0K
