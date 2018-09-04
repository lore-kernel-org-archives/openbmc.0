Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=permerror (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 424TyV0M05zF3Ln
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 00:40:14 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2018 07:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,329,1531810800"; d="scan'208";a="70234612"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
 by orsmga007.jf.intel.com with ESMTP; 04 Sep 2018 07:40:10 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
 ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 4 Sep 2018 07:40:10 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX153.amr.corp.intel.com ([169.254.12.242]) with mapi id 14.03.0319.002;
 Tue, 4 Sep 2018 07:40:09 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Patrick Venture <venture@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: Style for PointerAlignment
Thread-Topic: Style for PointerAlignment
Thread-Index: AQHUQWAbjt7XmXrOjEWVCYGF5jI+4KTgN31Q
Date: Tue, 4 Sep 2018 14:40:08 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169934583A5E3@ORSMSX114.amr.corp.intel.com>
References: <CAO=notz036fNDt7M_4Ev9gy87RAJES1pqshZm4haUHSF2KoU8w@mail.gmail.com>
In-Reply-To: <CAO=notz036fNDt7M_4Ev9gy87RAJES1pqshZm4haUHSF2KoU8w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMTE1MTk5NGEtYzNiNS00Mjc2LTk5NzQtZDFhZDhmM2JiNmM2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSEZnVmpsNE5ubTRiTFBcLzVyUzJHQVRiUmFWWkpBY1dOMlpJS2hNUkRVNDdNZ093SXdpRGtaN2ROTitPWjMwV3gifQ==
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
X-List-Received-Date: Tue, 04 Sep 2018 14:40:18 -0000

PiANCj4gSSBub3RpY2VkIHRoZSBleGFtcGxlIC5jbGFuZy1mb3JtYXQgaW4gdGhlIGRvY3MvY3Bw
IHN0eWxlIGd1aWRlIGhhcyBib3RoDQo+IHZhbHVlcyBmb3IgUG9pbnRlckFsaWdubWVudC4gIFdo
aWNoIGlzIGNvcnJlY3Q/ICBJIGJlbGlldmUgaXQncyBMZWZ0IHNvIHRoYXQgaXQNCj4gcGFpcnMg
d2l0aCB0aGUgdHlwZSwgcGVyIHRoZSBvdGhlciBsaW5lcyBpbiB0aGUgc3R5bGUgZ3VpZGUuDQo+
IA0KPiBQYXRyaWNrDQoNClNvdW5kcyBnb29kIHRvIG1lLg0KDQotRWQNCg==
