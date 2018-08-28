Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420NWJ1KP7zF09x
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 08:20:58 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2018 15:20:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,300,1531810800"; d="scan'208";a="68595348"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga007.jf.intel.com with ESMTP; 28 Aug 2018 15:20:56 -0700
Received: from orsmsx113.amr.corp.intel.com (10.22.240.9) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 28 Aug 2018 15:20:55 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX113.amr.corp.intel.com ([169.254.9.72]) with mapi id 14.03.0319.002;
 Tue, 28 Aug 2018 15:20:55 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>, Andrew Geissler
 <geissonator@gmail.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Alexander Amelkin
 <a.amelkin@yadro.com>
Subject: RE: Proposals for commit log policy
Thread-Topic: Proposals for commit log policy
Thread-Index: AQHUOUrQ7cGpSvgvDECTKY+pPFOBmKTM6q+AgAiMM4CAAFd8AIAAIeqA///XVkA=
Date: Tue, 28 Aug 2018 22:20:54 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345836D0F@ORSMSX114.amr.corp.intel.com>
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <CACPK8XdtitrjvDpuiPiz_ew03m972ueGRXAhd4kM_z6YSVtL3A@mail.gmail.com>
 <0E782585-1B8A-4BF7-9454-443061BA9C32@fuzziesquirrel.com>
 <CALLMt=rGmZ9-29xWMymUvdCAgVnFzQ+gyZDn3zXnWeR4imSYPA@mail.gmail.com>
 <359bcf51-5732-a65b-4b7e-dba2df0dd375@linux.vnet.ibm.com>
In-Reply-To: <359bcf51-5732-a65b-4b7e-dba2df0dd375@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWQ1YmJkZWMtZGI2Ny00OTllLWI2NmItNGUxOTNkN2Y1MjcwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQjJ6bW4yaGx6bzNwcVFhcWV6OVlKMStFSjZlQnV3ODZ2ZUlheXJjb2FCSDRxUmh6MTlQWWpmMXFuMCs3Nm5CQyJ9
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
X-List-Received-Date: Tue, 28 Aug 2018 22:21:01 -0000

PiANCj4gSSBvYmplY3QgdG9vLiBJIGRvbid0IHRoaW5rIHRoZSBiZW5lZml0IG9mIG1hbnVhbCBi
dW1wcyBpcyB3b3J0aCB0aGUgZWZmb3J0Lg0KPiANCg0KQW5vdGhlciB2b3RlIGZvciAiSSBkb24n
dCB0aGluayBpdCdzIHdvcnRoIHRoZSBlZmZvcnQiLg0KDQpBdXRvbWF0aWMgYnVtcHMga2VlcCB1
cyB1cCB0byBkYXRlIGFuZCBtYWtlIGJyZWFrYWdlcyBoYXBwZW4gYW5kIGdldCBmaXhlZCBmYXN0
ZXIuICBJIHdvdWxkIGFjdHVhbGx5IHByZWZlciB0aGF0IGV2ZXJ5IGdlcnJpdCByZXZpZXcgY3Jl
YXRlcyBhIG1hbnVhbCBidW1wIHRvIG1ha2Ugc3VyZSB0aGUgY29tcGxldGUgc3lzdGVtIGJ1aWxk
cyB3aXRoIHRoZWlyIGdpdmVuIGNvbXBvbmVudCBjaGFuZ2UsIGJ1dCBJIHJlYWxpemUgdGhpcyBp
cyBoYXJkIHRvIGRvLg0KDQotRWQNCg==
