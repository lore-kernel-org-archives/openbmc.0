Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404L4G381MzF1gm
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 13:44:09 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Mar 2018 19:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,328,1517904000"; d="scan'208";a="40102247"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by orsmga001.jf.intel.com with ESMTP; 18 Mar 2018 19:44:06 -0700
Received: from orsmsx116.amr.corp.intel.com (10.22.240.14) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Sun, 18 Mar 2018 19:44:06 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.126]) by
 ORSMSX116.amr.corp.intel.com ([169.254.7.69]) with mapi id 14.03.0319.002;
 Sun, 18 Mar 2018 19:44:06 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC Redfish working group working call
Thread-Topic: OpenBMC Redfish working group working call
Thread-Index: AQHTuiL+ItfUx6O6+0yGUKIX4/7VHqPM01CggAoQHuA=
Date: Mon, 19 Mar 2018 02:44:05 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932F66DE76@ORSMSX114.amr.corp.intel.com>
References: <85503096.346361520873318075.JavaMail.denimuser@sj1-app-102-17>
 <7E9441B1E5EFFD4681F54958E82169932F66B707@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F66B707@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_PUBLIC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTc4YjMxZTYtZDA5NC00YmM2LWE4MmItMzc5MjM2OGIyYzFkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX1BVQkxJQyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxNS45LjYuNiIsIlRydXN0ZWRMYWJlbEhhc2giOiJKZmdsRGpRMXpzeEpoMXI2YUNiWGgrTHhhR1k0RG1oTXFmZ1ZKN0xrZjZJPSJ9
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
X-List-Received-Date: Mon, 19 Mar 2018 02:44:15 -0000

SSBoYXZlIGdvdHRlbiBudW1lcm91cyByZXNwb25zZXMgdGhhdCBwZW9wbGUgd2lsbCBub3QgYmUg
YWJsZSB0byBtYWtlIHRoZSBPcGVuQm1jIHJlZGZpc2ggd29ya2luZyBncm91cCBtZWV0aW5nIHRv
bW9ycm93IDMvMTgsIG1vc3QgZHVlIHRvIHRyYXZlbCB0byBPQ1AuICBBcyB3ZSBsaWtlbHkgd29u
J3QgaGF2ZSBjcml0aWNhbCBtYXNzLCB0aGUgbWVldGluZyBpcyBkZWZlcnJlZCB0byB0aGUgZm9s
bG93aW5nIHdlZWsgMy8yNiB3aGVyZSBpdCB3aWxsIGJlIHJlc3VtZWQgYXQgdGhlIG5vcm1hbCB0
aW1lLg0KDQpJJ20gbG9va2luZyBmb3J3YXJkIHRvIHNlZWluZyBzb21lIG9mIHlvdSBhdCBPQ1Ah
DQoNCi1FZA0K
