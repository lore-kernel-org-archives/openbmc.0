Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41sRmw2zvVzDqm6
 for <openbmc@lists.ozlabs.org>; Sat, 18 Aug 2018 01:23:42 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Aug 2018 08:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,251,1531810800"; d="scan'208";a="66015338"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by orsmga008.jf.intel.com with ESMTP; 17 Aug 2018 08:23:22 -0700
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Fri, 17 Aug 2018 08:23:21 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX112.amr.corp.intel.com ([169.254.3.2]) with mapi id 14.03.0319.002;
 Fri, 17 Aug 2018 08:23:21 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Streaming logs via rsyslog
Thread-Topic: Streaming logs via rsyslog
Thread-Index: AQHUNUr9fBTXRF4uy0S7mMqGM/Z9uaTCrYUAgAFE0QCAAC9XAP//7sVA
Date: Fri, 17 Aug 2018 15:23:21 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345832152@ORSMSX114.amr.corp.intel.com>
References: <1c87c6bc-0f3b-73f2-e2a5-4b6ad7180f99@linux.vnet.ibm.com>
 <046e8fe9-1465-49ee-2170-0d06cd013218@intel.com>
 <b5f05749-ee42-a53c-5da2-f2fe04eaafd9@linux.vnet.ibm.com>
 <066e4ef8-a411-16bf-548a-b7698188f189@linux.vnet.ibm.com>
In-Reply-To: <066e4ef8-a411-16bf-548a-b7698188f189@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDcyNmQ3ODEtYTY0Ny00MDA1LTlmZDctZGEyZjcwZjUxMDg5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRWhXYkFQaE9hcWpjZWJSZVBlMUFVWXlkVmRENDNXUVZYWk5iTE03bVlcL2ZYeHBacG5OWWhRWnJTQXpMbHhFMncifQ==
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
X-List-Received-Date: Fri, 17 Aug 2018 15:23:45 -0000

PiANCj4gSSB3YXMganVzdCBwb2ludGVkIG91dCB0aGF0IEJ1c3lib3ggaXRzZWxmIGlzIEdQTHYy
LCBzbyByc3lzbG9nIGJlaW5nDQo+IEdQTHYzIHNlZW1zIHRvIGJlIHVzYWJsZSB3aXRob3V0IGFu
eSBjb25jZXJuPw0KPiANCg0KR1BMdjIgYW5kIEdQTHYzIGFyZSB2ZXJ5IGRpZmZlcmVudCBsaWNl
bnNlcyBpbiBzb21lIHJlc3BlY3RzLiAgRm9yIGEgZGlmZmVyZW50IHByb2R1Y3QsIHdlIGp1c3Qg
d2VudCB0aHJvdWdoIHRoaXMgZGlzY3Vzc2lvbiBhYm91dCB1c2luZyByc3lzbG9nIHNwZWNpZmlj
YWxseSwgYW5kIHRoZSBjb25jbHVzaW9uIHdhcyB0aGF0IHdlIGNvdWxkbid0IHVzZSBpdCBnaXZl
biB0aGUgbGljZW5zZSByZXN0cmljdGlvbnMsIGJ1dCBJIGRvbid0IGtub3cgdGhlIHNwZWNpZmlj
IGRldGFpbHMuICBJZiB5b3UgZ3V5cyBmaW5kIGEgd2F5IGFyb3VuZCB0aG9zZSByZXN0cmljdGlv
bnMsIGl0IHdvdWxkIGJlIGdvb2QgdG8ga25vdy4NCg0KVGhlIHRlYW0gdGhhdCBkaWQgdGhlIGFu
YWx5c2lzIGlzIG91dCB0b2RheSwgYnV0IEkgY2FuIHRyeSB0byBmaW5kIG1vcmUgbmV4dCB3ZWVr
Lg0KDQotRWQNCg==
