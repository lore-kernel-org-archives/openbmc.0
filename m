Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420Nxn2k5YzF0QC
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 08:40:28 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2018 15:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,300,1531810800"; d="scan'208";a="252696113"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by orsmga005.jf.intel.com with ESMTP; 28 Aug 2018 15:40:25 -0700
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
 ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 28 Aug 2018 15:40:25 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX156.amr.corp.intel.com ([169.254.8.73]) with mapi id 14.03.0319.002;
 Tue, 28 Aug 2018 15:40:25 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Alexander Amelkin <a.amelkin@yadro.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: Proposals for commit log policy
Thread-Topic: Proposals for commit log policy
Thread-Index: AQHUOUrQ7cGpSvgvDECTKY+pPFOBmKTKVDUggAMppYCACErRIA==
Date: Tue, 28 Aug 2018 22:40:25 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345836D67@ORSMSX114.amr.corp.intel.com>
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <7E9441B1E5EFFD4681F54958E82169934583385B@ORSMSX114.amr.corp.intel.com>
 <ab12144e-3faf-2756-b7d7-16a294b2c7ee@yadro.com>
In-Reply-To: <ab12144e-3faf-2756-b7d7-16a294b2c7ee@yadro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNmNlNjBhYTUtMTg5YS00OGNkLWJlZDctY2M4YzU0ZDk5MjQzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMHh1QnBERVRHZjg0amVka24yYlc1QzRrSlJxWUlyNFN5YlVPV3pqRXZMa0QyWVZPd1FZTFpNSm9rUzg5ZjhvKyJ9
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
X-List-Received-Date: Tue, 28 Aug 2018 22:40:30 -0000

RG8geW91IGhhdmUgYW4gZXhhbXBsZSBvZiB0aGUgdmVyc2lvbiB0byB2ZXJzaW9uIGxvZ3MgdGhh
dCBhcmUgdGhlIHJlc3VsdCBvZiB0aGUgIjMgZnVsbCBkYXlzIGNvbnRpZ3VvdXNseSBvZiBhIHF1
YWxpZmllZCBlbmdpbmVlciIgdGhhdCB5b3UncmUgYXNraW5nIHRoZSBjb21tdW5pdHkgdG8gaGVs
cCB5b3UgY3JlYXRlPyAgSSBzdXNwZWN0IGlmIHRoZXkgd2VyZSBwdWJsaXNoZWQgKGZvcmdpdmUg
bWUgaWYgdGhleSBhbHJlYWR5IGFyZSBhbmQgSSd2ZSBqdXN0IG1pc3NlZCB0aGVtKSBiYWNrIHRv
IHRoZSBwcm9qZWN0IHNvbWV3aGVyZSwgYW5kIHBlb3BsZSBmb3VuZCB2YWx1ZSwgaXQgbWlnaHQg
aGVscCB0aGUgdmFsdWUgcHJvcG9zaXRpb24gZm9yIGRldmVsb3BlcnMgYSBsb3QgbW9yZS4gIFJp
Z2h0IG5vdyBJJ20gc2VlaW5nIHRoYXQgaXMgd291bGQgYmUgYSBsb3Qgb2Ygd29yayBvbiB0aGUg
cGFydCBvZiBjb2RlIHJldmlld3MsIGZvciBvbmx5IGEgbWlub3IgZ2Fpbi4gIFRoaXMgaXMgY29t
aW5nIGZyb20gc29tZW9uZSB3aG8gaGFzIHdyaXR0ZW4gcmVsZWFzZSBub3RlcyBhIGxvdC4gIEkg
ZmluZCB0aGUgbW9zdCB2YWx1ZSBpbiByZWxlYXNlIG5vdGVzIHRvIGJlIGEgY29uc2lzdGVudCB0
b25lLCBsYW5ndWFnZSwgYW5kIGZpbHRlcmluZywgd2l0aCBhIGxldmVsIG9mIGFic3RyYWN0aW9u
IHRoYXQgaXMgaGlnaCBlbm91Z2ggdG8gYmUgdXNlZnVsLiAgSSdkIGJlIHN1cnByaXNlZCBpZiB3
ZSB3ZXJlIGFibGUgdG8gZ2V0IHRoYXQga2luZCBvZiBjb25zaXN0ZW5jeSBmcm9tIGFsbCB0aGUg
cGVvcGxlIG9uIHRoZSBwcm9qZWN0IG9mIHZhcnlpbmcgYmFja2dyb3VuZHMuDQoNCkFub3RoZXIg
dGhpbmcgdG8gY29uc2lkZXIgaXMgdGhhdCB0aGVyZSBhcmUgYSBsb3Qgb2Ygbm9uLW5hdGl2ZSBF
bmdsaXNoIHNwZWFrZXJzIGluIHRoZSBjb21tdW5pdHksIGFuZCB3aGlsZSBJIHdvdWxkIGxvdmUg
aXQgaWYgZXZlcnlvbmUgaGFkIGEgcGVyZmVjdCBncmFzcCBvZiB0aGUgRW5nbGlzaCBsYW5ndWFn
ZSwgSSB3b3VsZCBfbXVjaF8gcmF0aGVyIHRoYXQgdGhleSBrbm93IGhvdyB0byBkZXNpZ24sIGJ1
aWxkLCBhbmQgdGVzdCBlbWJlZGRlZCBmaXJtd2FyZSwgd2hpbGUgbGVhdmluZyB0aGUgZG9jdW1l
bnRhdGlvbiB0byB0aGUgcGVvcGxlIHRoYXQgZXhjZWwgYXQgaXQuDQoNCg0KPiBGb3IgYnVtcHMg
dGhlIHRhc2sgaXMgImF1dG9tYXRhYmxlIiBpbmRlZWQuIEl0J3Mgbm90IGFjdHVhbGx5IGFzIGVh
c3kgd2l0aA0KPiBZb2N0byBhcyBpdCBtYXkgc2VlbSAidG8gcGFyc2UgdGhlIGdpdCBsb2dzIGJl
dHdlZW4gdGhlIHJlY2lwZSBidW1wcyIgKGhhdmUNCj4geW91IHRyaWVkPyksIGJ1dCBpdCBjYW4g
YmUgYXV0b21hdGVkLg0KDQpXZSBkb24ndCBkdW1wIHRoZSBnaXQgbG9ncywgYnV0IG15IHRlYW0g
ZG9lcyB0cmFjayB0aGUgU0hBcyBvZiB0aGUgb3BlbmJtYyBjb21wb25lbnRzIGluIGVhY2ggcmV2
aXNpb24gd2UgYnVpbGQgZm9yIGF1ZGl0IGFuZCByZXByb2R1Y2liaWxpdHkgbmVlZHMuICBJdCdz
IHBvc3NpYmxlIEknbSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlLCBidXQgaXQgZmVlbHMgbGlrZSBk
dW1waW5nIHRoZSBsb2dzIHdvdWxkIGJlIGEgbWlub3IgYWRkaXRpb24gdG8gdGhlIDwyMCBsaW5l
IHB5dGhvbiBzY3JpcHQuICBPdXIgZXhpc3Rpbmcgb25lIGp1c3Qgc2VhcmNoZXMgYSBnbG9iIG9m
ICouYmIgYW5kICouYmJhcHBlbmQgZmlsZXMsIGdyZXBzIGZvciBTSEExIGNoYW5nZXMsIGFuZCBm
ZXRjaGVzIHRoZSByZWxldmFudCByZXBvcy4gIFdoZW4gSSBnZXQgYSBtb21lbnQsIEknbGwgdGFr
ZSBhIGxvb2sgYW5kIHNlZSBpZiBpdCBjYW4gYmUgZWFzaWx5IGdlbmVyYWxpemVkIHRvIGR1bXAg
bG9ncyBmb3IgeW91IGlmIHRoYXQgaGVscHMgc29tZS4NCg0KLUVkDQo=
