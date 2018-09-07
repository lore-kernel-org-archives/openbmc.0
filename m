Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 426Kwr2Z7lzF3MP
 for <openbmc@lists.ozlabs.org>; Sat,  8 Sep 2018 00:45:12 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Sep 2018 07:45:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,342,1531810800"; d="scan'208";a="86863186"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
 by fmsmga004.fm.intel.com with ESMTP; 07 Sep 2018 07:45:00 -0700
Received: from orsmsx154.amr.corp.intel.com (10.22.226.12) by
 ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Fri, 7 Sep 2018 07:45:00 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX154.amr.corp.intel.com ([169.254.11.155]) with mapi id 14.03.0319.002;
 Fri, 7 Sep 2018 07:45:00 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: D-Bus interface to update multiple properties in one shot
Thread-Topic: D-Bus interface to update multiple properties in one shot
Thread-Index: AQHURpSDl1a7iCQ3sE2uh9IVdMGkRKTk4nPw
Date: Fri, 7 Sep 2018 14:44:59 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169934583C68C@ORSMSX114.amr.corp.intel.com>
References: <c917aa9a-98ff-d9b7-be60-6000b439742e@linux.vnet.ibm.com>
In-Reply-To: <c917aa9a-98ff-d9b7-be60-6000b439742e@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTkxMGU4NGEtMjQ0YS00ZTEyLThiM2QtNTZkZmQ5ZGFjNDNlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoid1wvXC94Q3RTRjNtbnY1cmFVczg0ZTd2RXBUK3dVSk1MbFBBUE1XS0JHMWNNQ1wvSmRGTVpFNkp4ZTdzWVRcL2ZzdVoifQ==
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
X-List-Received-Date: Fri, 07 Sep 2018 14:45:17 -0000

PiANCj4gQSBwcm9wb3NhbCB3ZSBkaXNjdXNzZWQgaW4gYSBtZWV0IHJlY2VudGx5IGlzIHRvIGlt
cGxlbWVudCBhIG5ldw0KPiB4eXoub3BlbmJtY19wcm9qZWN0Lk9iamVjdC5Qcm9wZXJ0aWVzIEQt
QnVzIGludGVyZmFjZSB3aXRoIGEgbWV0aG9kDQo+IGNhbGxlZCAnVXBkYXRlJywgd2hpY2ggYWNj
ZXB0cyBhIGRpY3Rpb25hcnkgb2YgcHJvcGVydHktdmFsdWUgcGFpcnMuDQoNCkknbSBub3QgcmVh
bGx5IGZvbGxvd2luZyB3aGF0IHByb2JsZW0gdGhpcyBpcyB0cnlpbmcgdG8gc29sdmUuICBEb2Vz
IHRoZSB0aW1lciBpbiBuZXR3b3JrZCBub3Qgd29yayBhcyBkZXNpZ25lZD8gIEFyZSB3ZSB0cnlp
bmcgdG8gcmVtb3ZlIGl0PyAgSW4gd2hpY2ggdXNlIGNhc2VzIGFyZSB3ZSBzZWVpbmcgcGVyZm9y
bWFuY2UgcHJvYmxlbXMgd2l0aCBtdWx0aXBsZSBzZXQgY2FsbHM/ICBIYXZlIHdlIG1lYXN1cmVk
IHRoZXNlIHBlcmZvcm1hbmNlIGltcGFjdHM/DQoNCldoYXQgd29ycmllcyBtZSBhYm91dCB0aGUg
cHJvcG9zZWQgaW50ZXJmYWNlIGlzIGNvbnNpc3RlbmN5LiAgV2lsbCB3ZSBiZSBhZGRpbmcgdGhl
IHh5ei5vcGVuYm1jX3Byb2plY3QuT2JqZWN0LlByb3BlcnRpZXMgaW50ZXJmYWNlIGFzIGEgc3Bl
Y2lmaWNhdGlvbiB0byBjZXJ0YWluIHBhdGhzIGluIHBob3NwaG9yPyBhbGwgcGF0aHM/IEFsbCBv
YmplY3QgbWFuYWdlciBwYXRocz8NCkhvdyB3aWxsIG9uZSBrbm93IHdoaWNoIHBhdGhzIHJlcXVp
cmUgdXNlIG9mIHRoZSBvcmcuZnJlZWRlc2t0b3AuREJ1cy5Qcm9wZXJ0aWVzIGludGVyZmFjZSwg
YW5kIHdoaWNoIGNhbiB1c2UgdGhlIGludGVyZmFjZSB5b3UndmUgcHJvcG9zZWQ/ICBZZXMsIHdl
IGNvdWxkIGRvIGEgbWFwcGVyIGNhbGwgdG8gZmluZCBvdXQsIGJ1dCBJJ20gZ29pbmcgdG8gbmVn
YXRlIGFueSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCB3ZSd2ZSBnYWluZWQuDQpXaGVuIGNhbGxp
bmcgdGhlIHVwZGF0ZSBtZXRob2QsIGlmIG9uZSBvZiB0aGUgcHJvcGVydHkgdXBkYXRlIGZhaWxz
LCB3aGF0IHRoZW4/ICBEb2VzIHRoZSBwcm9wZXJ0eSB1cGRhdGUgZ2V0IHBhcnRpYWxseSBhcHBs
aWVkLCBkb2VzIGl0IHJvbGwgYmFjayB0byB0aGUgb2xkIHZhbHVlcz8gIEkgZG9uJ3QgdGhpbmsg
dGhlcmUgYXJlIGFueSBnb29kIGNhdGNoYWxsIGFuc3dlcnMgaGVyZS4NCg0KVGhpcyBpZGVhIGlu
dHJpZ3VlcyBtZSwgYnV0IEkgdGhpbmsgaW4gbWFueSBvZiB0aGVzZSBjYXNlcywgY29uc2lzdGVu
Y3kgaXMgbW9yZSBpbXBvcnRhbnQgdGhhbiBwZXJmb3JtYW5jZS4gIElmIHRoZXJlJ3MgYSB3YXkg
dG8ga2VlcCBjb25zaXN0ZW5jeSB3aXRoIHRoZSBwcm9wb3NlZCBpbnRlcmZhY2UgX2FuZF8gZ2V0
IHBlcmZvcm1hbmNlLCB0aGVuIEkgdGhpbmsgdGhhdCB0aGlzIGNvdWxkIGJlIHdvcmthYmxlLCBJ
J20ganVzdCBub3Qgc3VyZSBob3cgdG8gYWNjb21wbGlzaCBib3RoLg0KDQotRWQNCg==
