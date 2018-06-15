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
 by lists.ozlabs.org (Postfix) with ESMTPS id 416njQ4CX1zF0wy
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jun 2018 03:36:32 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jun 2018 10:36:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,228,1526367600"; d="scan'208";a="49646896"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga008.jf.intel.com with ESMTP; 15 Jun 2018 10:36:29 -0700
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.88]) by
 ORSMSX106.amr.corp.intel.com ([169.254.1.45]) with mapi id 14.03.0319.002;
 Fri, 15 Jun 2018 10:36:29 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Patrick Venture <venture@google.com>, Lei YU <mine260309@gmail.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: New Feature Request in phosphor-pid-control
Thread-Topic: New Feature Request in phosphor-pid-control
Thread-Index: AQHUBL8yOrmGyFet806HqQiWxmly7aRhkXeg
Date: Fri, 15 Jun 2018 17:36:28 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E8216993457F6D79@ORSMSX113.amr.corp.intel.com>
References: <CAO=notwpFu4WwDBKfSt7-C8VuP6CusZGg3hThsAcdRwSD0yXZQ@mail.gmail.com>
In-Reply-To: <CAO=notwpFu4WwDBKfSt7-C8VuP6CusZGg3hThsAcdRwSD0yXZQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
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
X-List-Received-Date: Fri, 15 Jun 2018 17:36:43 -0000

VGhpcyBzZWVtcyBsaWtlIGEgYml0IG9mIGEgY29ybmVyIGNhc2UgaW4gdGhlIHRoZXJtYWwgcmVh
bG0uICBBcmUgeW91IHJlYWxseSBzdXJlIHRoYXQgeW91IHdhbnQgdGhlIHNhbWUgUElEIHR1bmlu
ZyB2YWx1ZXMgZm9yIHRoZSBtYXJnaW4gc2Vuc29yIGFzIHRoZSBhYnNvbHV0ZSBzZW5zb3JzPw0K
DQpNZSBhbmQgbXkgdGVhbSBhcmUgYWN0dWFsbHkgdHJ5aW5nIHRvIGdldCBhd2F5IGZyb20gbWFy
Z2luIHNlbnNvcnMgYWx0b2dldGhlci4gIEN1c3RvbWVycyBkb24ndCBzZWVtIHRvIGxpa2UgdGhl
bSwgYW5kIHF1ZXN0aW9uIHRoZSBmYWN0IHRoYXQgdGhleSdyZSBuZWdhdGl2ZSBudW1iZXJzLiAg
SXQncyAgbW9zdGx5IGEgcHN5Y2hvbG9neSB0aGluZywgYW5kIHVzdWFsbHkgYWZ0ZXIgZXhwbGFp
bmluZyBpdCB0byB0aGVtLCB0aGV5IHVuZGVyc3RhbmQgYW5kIGNhbiBsaXZlIHdpdGggaXQsIGJ1
dCBpdCdzIGEgcGFpbiBwb2ludCBhbGwgdGhlIHNhbWUuICBJbiBsaWV1IG9mIG1hcmdpbiBzZW5z
b3JzLCB3ZSdyZSB0cnlpbmcgYW4gYXBwcm9hY2ggbm93IHdoZXJlIGFsbCBzZW5zb3JzIGFyZSBh
YnNvbHV0ZSwgYnV0IHdlIGR5bmFtaWNhbGx5IGFkanVzdCB0aGUgdGhyZXNob2xkcyBiYXNlZCBv
biB3aGF0IHdlIGZpbmQgYXQgcnVudGltZS4gIE1vc3Qgb2YgdGhlIGNvbXBvbmVudHMgZXhwb3Nl
IHRoZWlyIG93biB0ZW1wZXJhdHVyZSBnb2FsIHZhbHVlcyB0aHJvdWdoIHNvbWUga2luZCBvZiBp
bnRlcmZhY2UuICBJbiB0aGUgY2FzZSBvZiBJbnRlbCBwcm9jZXNzb3JzLCB3ZSB3b3VsZCBzZXQg
b3VyIHRocmVzaG9sZHMgYmFzZWQgb24gdGhlIGluZm9ybWF0aW9uIHdlIHJlYWQgb3ZlciBQRUNJ
IGFib3V0IHRoZSBDUFVzIHRoZXJtYWwgY2hhcmFjdGVyaXN0aWNzLCBhbmQgcmVwb3J0IHRoZSBh
YnNvbHV0ZSB2YWx1ZSBiYWNrLCB0aGVuIHRha2Ugb3VyIHRoZXJtYWwgbGltaXRzIGFzIGEgcGVy
Y2VudGFnZSBvZiB0aGUgZ29hbCB2YWx1ZXMuDQoNCkJhY2sgdG8geW91ciBwcm9wb3NhbCwgSSdt
IG5vdCByZWFsbHkgY2xlYXIgb24gd2hhdCB0aGUgaXNzdWUgaXMgd2l0aCB0aGUgZXhpc3Rpbmcg
c29sdXRpb24uICBJZiB0aGUgImdvYWwiIGlzIHRvIGh1bnQgZG93biBmb3IgYSB0ZW1wZXJhdHVy
ZSwgZG9lc24ndCB0aGF0IGp1c3QgbWVhbiB0aGF0IHRoZSBwcm9wb3J0aW9uYWwgYW5kIGludGVn
cmFsIGNvbXBvbmVudHMgb2YgdGhlIGxvb3Agd291bGQgaGF2ZSBhIG5lZ2F0aXZlIGNvZWZmaWNp
ZW50IGluIHRoZSB0dW5pbmcgcGFyYW1ldGVycz8gIEl0IGRvZXNuJ3QgcmVhbGx5IG1hdHRlciB3
aGF0IHRoZSBzaWduIGlzIG9uIHRoZSBlcnJvciBjYWxjdWxhdGlvbiBpZiB5b3UgY2FuIHNpbXBs
eSByZXZlcnNlIGl0IGluIHRoZSBQSUQgdmFsdWVzLg0KDQpJIGZ1bGx5IHN1cHBvcnQgYWRkaW5n
IG11bHRpcGxlIHNlbnNvcnMgdG8gYSBzaW5nbGUgUElEIGxvb3AuICBUaGlzIHdhcyBvbmUgb2Yg
dGhlIHRoaW5ncyB0aGF0IHdlIHdlcmUgcGxhbm5pbmcgb24gYWRkaW5nIGFzIHNvb24gYXMgd2Ug
Z290IG1vcmUgdGltZSBmb3IgZmFuIGNvbnRyb2wgKGhvcGVmdWxseSBuZXh0IHF1YXJ0ZXIpIGJ1
dCBJJ20gbm90IHJlYWxseSBmb2xsb3dpbmcgdGhlIGFkZGl0aW9uIG9mIGEgbmV3IHBhcmFtZXRl
ci4NCg0KLUVkDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmJt
YyBbbWFpbHRvOm9wZW5ibWMtDQo+IGJvdW5jZXMrZWQudGFub3VzPWludGVsLmNvbUBsaXN0cy5v
emxhYnMub3JnXSBPbiBCZWhhbGYgT2YgUGF0cmljaw0KPiBWZW50dXJlDQo+IFNlbnQ6IEZyaWRh
eSwgSnVuZSAxNSwgMjAxOCA4OjM5IEFNDQo+IFRvOiBMZWkgWVUgPG1pbmUyNjAzMDlAZ21haWwu
Y29tPg0KPiBDYzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0K
PiBTdWJqZWN0OiBOZXcgRmVhdHVyZSBSZXF1ZXN0IGluIHBob3NwaG9yLXBpZC1jb250cm9sDQo+
IA0KPiBUaGUgdGhlcm1hbCBwaWQgY29udHJvbGxlciBvYmplY3Qgb25seSBzdXBwb3J0cyBvbmUg
aW5wdXQuICBUaGUgUElEDQo+IHBhcmFtZXRlcnMgZGV0ZXJtaW5lIHdoZXRoZXIgaXRzIGdvYWwg
aXMgdG8gaW5jcmVhc2Ugb3IgZGVjcmVhc2UgdGhlIGZhbg0KPiBzcGVlZCBnaXZlbiBhIHNldC1w
b2ludC4gIE15IHByaW1hcnkgdXNlY2FzZSB3YXMgdG8gaGF2ZSB0aGUgdmFsdWUgYXMgYQ0KPiBt
YXJnaW4sIGlmIHRoZSBzZW5zb3IgdmFsdWUgaXMgMTVDLCBhbmQgdGhlIHNldHBvaW50IGlzIDEw
QywgdGhlbiB3ZSdyZSBmaW5lDQo+IGJlY2F1c2UgMTUgPiAxMC4gIEhvd2V2ZXIsIGlmIGl0J3Mg
YW4gYWJzb2x1dGUgdGVtcGVyYXR1cmUgeW91ciBnb2FsIHdvdWxkDQo+IGJlIHRoZSBvcHBvc2l0
ZSwgdG8gc3BlZWQgdGhlIGZhbnMgdXAgdW50aWwgMTUgd2VudCBkb3duIHRvIDEwLiAgQmVjYXVz
ZSBvZg0KPiB0aGVzZSBvcHBvc2l0ZSB1c2UtY2FzZXMgaXQgd2Fzbid0IGNsZWFyIHdoYXQgYmVo
YXZpb3Igd291bGQgYmUgdGFrZW4gd2l0aA0KPiBtdWx0aXBsZSBpbnB1dHMuICBXZSBoYXZlIGFu
b3RoZXIgcHJvZ3JhbSB0YWtlIGRvemVucyBvZiBpbnB1dHMgYW5kIG1ha2UNCj4gb25lIG1hcmdp
biB2YWx1ZSBnaXZlbiBhIGNvbmZpZ3VyYXRpb24sIGFuZCB0aGF0J3Mgd2hhdCBpcyBwYXNzZWQg
ZG93biB0bw0KPiBwaG9zcGhvci1waWQtY29udHJvbC4NCj4gDQo+IE15IHByb3Bvc2FsIGlzIHRv
IHN1cHBvcnQgbXVsdGlwbGUgaW5wdXRzIHRvIHRoZSB0aGVybWFsIGNvbnRyb2xsZXIgYW5kIHRo
ZXJlDQo+IHdpbGwgYmUgYSBuZXcgZmllbGQgaW4gdGhlIGNvbmZpZ3VyYXRpb24gIm1pbiIgIm1h
eCIgdGhhdCB3aWxsIGRlY2lkZSB0aGUNCj4gYmVoYXZpb3IuDQo+IA0KPiBQYXRyaWNrDQo=
