Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wfYc5gRVzDqC8
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 06:40:03 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2018 13:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,275,1531810800"; d="scan'208";a="82581899"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2018 13:39:51 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX104.amr.corp.intel.com ([169.254.4.237]) with mapi id 14.03.0319.002;
 Wed, 22 Aug 2018 13:39:51 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: 'Alexander Amelkin' <a.amelkin@yadro.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: Proposals for commit log policy
Thread-Topic: Proposals for commit log policy
Thread-Index: AQHUOUrQ7cGpSvgvDECTKY+pPFOBmKTKVDUg
Date: Wed, 22 Aug 2018 20:39:50 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169934583385B@ORSMSX114.amr.corp.intel.com>
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
In-Reply-To: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDQ3MTkzNjgtMmE5ZC00MmE1LTk4NTktMTFjMzhhYzdjZjFiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRGswaFpNMFNyT2lvK2dVc3NMckNUWnNhT1ZDRFlXKzFUZ2pkZlp4ZWQzaW5vVWlRK0l4NTlIalJHR0s0dmVENiJ9
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
X-List-Received-Date: Wed, 22 Aug 2018 20:40:05 -0000

SSdtIG5vdCByZWFsbHkgdW5kZXJzdGFuZGluZyB0aGUgaXNzdWUgaGVyZS4gIElzIHRoZSBsb2cg
aW5mb3JtYXRpb24gbm90IGF2YWlsYWJsZSBpbiB0aGUgaW5kaXZpZHVhbCByZXBvc2l0b3JpZXM/
ICBJcyBpdCBqdXN0IGhhcmQgdG8gcGFyc2U/ICBDb3VsZCB0aGlzIGJlIGF1dG9tYXRlZCwgZWl0
aGVyIHVzaW5nIGEgc2NyaXB0LCBvciBhIGxpc3Qgb2YgcmVwb3NpdG9yaWVzPw0KDQpXaGlsZSBJ
IHRoaW5rIHRoZXJlJ3MgdmFsdWUgaW4gdGhlIGxvZ3MsIEkgZG9uJ3QgdGhpbmsgbWFpbnRhaW5l
cnMgdGltZSBpcyBiZXN0IHVzZWQgYnkgY3JlYXRpbmcgZ2l0IGxvZ3MgbWFudWFsbHkgYWxsIHRo
ZSB0aW1lLCBlc3BlY2lhbGx5IHdoZW4gaXQgc2hvdWxkIGJlIGVhc3kgZW5vdWdoIHRvIHBhcnNl
IHRoZSBnaXQgbG9ncyBiZXR3ZWVuIHRoZSByZWNpcGUgYnVtcHMuICBJJ3ZlIGhhZCB0byBkbyB0
aGlzIGJlZm9yZSB0byBkbyBiaXNlY3RzIGJlZm9yZSwgYW5kIGl0J3Mgbm90IHRvbyBkaWZmaWN1
bHQgb25jZSB5b3UgZ2V0IHRoZSBoYW5nIG9mIGl0Lg0KDQpJIHJlYWxseSBkbyBhcHByZWNpYXRl
IHlvdSBnZW5lcmF0aW5nIGEgcmVhbCBzZXQgb2YgcmVsZWFzZSBub3RlcywgYW5kIEkgd2FudCB0
byBtYWtlIGl0IGVhc3ksIEknZCBqdXN0IHByZWZlciBpZiB3ZSBhcyBhIHByb2plY3QgZGlkbid0
IG1vdmUgd29yayBvbnRvIHRoZSBpbmRpdmlkdWFsIGRldmVsb3BlcnMgdG8gbWFrZSBpdCBoYXBw
ZW4uDQoNCi1FZA0K
