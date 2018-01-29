Return-Path: <Eugene.Cho@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.94; helo=esa3.dell-outbound.iphmx.com;
 envelope-from=eugene.cho@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="Nv/9BSgM"; 
 dkim-atps=neutral
X-Greylist: delayed 700 seconds by postgrey-1.36 at bilbo;
 Tue, 30 Jan 2018 01:52:29 AEDT
Received: from esa3.dell-outbound.iphmx.com (esa3.dell-outbound.iphmx.com
 [68.232.153.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVXY936SbzDqvF
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 01:52:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1517236927; x=1548772927;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KdZsy3DeHuoehndvQCdUyUZ0JfFIITOwyHamdoHRsBc=;
 b=Nv/9BSgMXQf2ReTNcn/nzj2Vl85BgTMK2SabT69mFmmgRZoHdZ6IdcjZ
 ndBTGAobx3ahatVlKomskAM67kj1lfoePz61lslx+OlIHNxH168AV+tYo
 6i+CVByqGxSwoS9KI0Zq37TC2YFMKJNtEIj9twq9o4o2FZkufNjp9gIMa c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GFAADfMG9amMuZ6ERbGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQYgQUoCoNWiiSOaYICggGVQ4IXChiFIwIaghxUGAEBAQEBAQE?=
 =?us-ascii?q?BAgECEAEBAQEBCAsLBigvgjgigkoBAQEEASIRRQwEAgEIEQQBAQECAiMDAgICJ?=
 =?us-ascii?q?h4BCAgCBAENBQgMihARpXWCJ4gRgkIBAQEBAQEEAQEBAQEBAQEBH4EPg0WBNT8?=
 =?us-ascii?q?hgz6DL4MvBIIVgnGCRSAFpBSPS4YTgiSSDosBjGGBPB+CCnCCfIJUEQyCBngBA?=
 =?us-ascii?q?YxLLIEGgRcBAQE?=
X-IPAS-Result: =?us-ascii?q?A2GFAADfMG9amMuZ6ERbGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?YgQUoCoNWiiSOaYICggGVQ4IXChiFIwIaghxUGAEBAQEBAQEBAgECEAEBAQEBC?=
 =?us-ascii?q?AsLBigvgjgigkoBAQEEASIRRQwEAgEIEQQBAQECAiMDAgICJh4BCAgCBAENBQg?=
 =?us-ascii?q?MihARpXWCJ4gRgkIBAQEBAQEEAQEBAQEBAQEBH4EPg0WBNT8hgz6DL4MvBIIVg?=
 =?us-ascii?q?nGCRSAFpBSPS4YTgiSSDosBjGGBPB+CCnCCfIJUEQyCBngBAYxLLIEGgRcBAQE?=
Received: from esa5.dell-outbound2.iphmx.com ([68.232.153.203])
 by esa3.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2018 08:32:11 -0600
From: <Eugene.Cho@dell.com>
Received: from ausxipps310.us.dell.com ([143.166.148.211])
 by esa5.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2018 20:36:03 +0600
X-LoopCount0: from 10.166.132.129
X-IronPort-AV: E=Sophos;i="5.46,431,1511848800"; d="scan'208";a="121805319"
X-DLP: DLP_GlobalPCIDSS
To: <avifishman70@gmail.com>, <anoo@linux.vnet.ibm.com>
CC: <eyal.cohen@nuvoton.com>, <openbmc@lists.ozlabs.org>,
 <yoel.hayon@nuvoton.com>, <uri.trichter@nuvoton.com>
Subject: RE: BMC Image Signing Proposal
Thread-Topic: BMC Image Signing Proposal
Thread-Index: AQHTmO4k2rJiLBUle0OMalgK6afbrqOK60Zw
Date: Mon, 29 Jan 2018 14:40:44 +0000
Message-ID: <bb9da948dad24152ae88a8bab896ceec@AUSX13MPC105.AMER.DELL.COM>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <CAKKbWA4E+bX6WiEDGUYED=nUegJ9N7cTcxZHMpfiO43Tt0dNyw@mail.gmail.com>
In-Reply-To: <CAKKbWA4E+bX6WiEDGUYED=nUegJ9N7cTcxZHMpfiO43Tt0dNyw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titusconfig: Internal Use 04051212
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvIiwiaWQiOiJhNTZhODMyOC02ZjBmLTRlY2ItOTc0NC02ZTUyNzgxMmYyYjkiLCJwcm9wcyI6W3sibiI6IkNsYXNzaWZpY2F0aW9uIiwidmFscyI6W3sidmFsdWUiOiJJbnRlcm5hbCBVc2UifV19LHsibiI6IlN1YmxhYmVscyIsInZhbHMiOltdfSx7Im4iOiJFeHRlcm5hbENvcnJlc3BvbmRlbmNlIiwidmFscyI6W3sidmFsdWUiOiJObyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxNi4yLjExLjAiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQ1BGNkZUVTc2enUxNzhjZkVXN3ZwNXY1bFFNUVVsYmZ2dUJ1a2dmVmVycz0ifQ==
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2018 14:52:30 -0000

RGVsbCAtIEludGVybmFsIFVzZSAtIENvbmZpZGVudGlhbCAgDQoNClRoZSAiZmlybXdhcmUgdXBk
YXRlIiBwdWJsaWMga2V5IGluIGZsYXNoIChhbmQgZmlybXdhcmUgdXBkYXRlIGNvZGUgaXRzZWxm
KSB3b3VsZCBiZSBhdXRoZW50aWNhdGVkIGJ5IEJNQyBzZWN1cmUgYm9vdC4NCg0KQWxzbyAtIGhh
cyBhbnlib2R5IG1lbnRpb25lZCB1c2luZyB0aGUgRklUIGFzIGEgZmlybXdhcmUgdXBkYXRlIGlu
c3RhbGwgaW1hZ2UsIGluIGFkZGl0aW9uIHRvIHVzaW5nIHRvIGJvb3QgdGhlIGtlcm5lbD8gKGku
ZS4gRklUIHdpdGhpbiBhIEZJVCkuIFRoaW5rIHRoZSBuYXRpdmUgREZVIGNvbW1hbmQgaW4gdS1i
b290IHN1cHBvcnRzIHRoaXMgbWV0aG9kLiBKdXN0IGEgdGhvdWdodA0KIA0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyBbbWFpbHRvOm9wZW5ibWMtYm91bmNlcytl
dWdlbmUuY2hvPWRlbGwuY29tQGxpc3RzLm96bGFicy5vcmddIE9uIEJlaGFsZiBPZiBBdmkgRmlz
aG1hbg0KU2VudDogTW9uZGF5LCBKYW51YXJ5IDI5LCAyMDE4IDQ6NDUgQU0NClRvOiBhbm9vIDxh
bm9vQGxpbnV4LnZuZXQuaWJtLmNvbT4NCkNjOiBleWFsLmNvaGVuQG51dm90b24uY29tOyBPcGVu
Qk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+OyB5b2VsLmhheW9uQG51dm90
b24uY29tOyB1cmkudHJpY2h0ZXJAbnV2b3Rvbi5jb20NClN1YmplY3Q6IFJlOiBCTUMgSW1hZ2Ug
U2lnbmluZyBQcm9wb3NhbA0KDQpIaSBBbm9vIGFuZCBhbGwsDQoNClJlZ2FyZGluZyAiVGhlIGVu
Y3J5cHRlZCBoYXNoIChkaWdpdGFsIHNpZ25hdHVyZSkgYW5kIGNvcnJlc3BvbmRpbmcgcHVibGlj
IGtleSB3b3VsZCBiZSBhZGRlZCB0byB0aGUgZmlybXdhcmUgaW1hZ2UiOg0KSWYgYm90aCB0aGUg
ZGVjcnlwdGVkIHNpZ25hdHVyZSBhbmQgdGhlIHB1YmxpYyBrZXkgYXJlIGluIGZsYXNoLCBpZiBm
bGFzaCB3YXMgcmVwbGFjZWQgKGJ5IGhhY2tpbmcgb3IgcGh5c2ljYWx5KSBhIG1hbGljaW91cyBw
dWJsaWMga2V5IGNhbiBiZSB1c2VkIHdpdGggYSAgc2lnbmF0dXJlIHRoYXQgd2FzIGRlY3J5cHRl
ZCBieSB0aGUgcGFpcmVkIG1hbGljaW91cyBwcml2YXRlIGtleSBvZiB0aGUgc3RvcmVkIHB1Ymxp
YyBrZXkuDQoNClRvIG92ZXJjb21lIHRoYXQgdGhlIHB1YmxpYyBrZXkgc2hvdWxkIGJlIHN0b3Jl
ZCBpbiBPVFAuDQpXZSB1c2UgdGhpcyBtZXRob2Qgb24gb3VyIE51dm90b24gUG9sZWcgQk1DLg0K
DQpEb2VzIHRoaXMgc291bmQgcmVhc29uYWJsZT8NCg0KUmVnYXJkcywNCkF2aQ0KDQoNCk9uIFRo
dSwgSmFuIDI1LCAyMDE4IGF0IDExOjE1IFBNLCBhbm9vIDxhbm9vQGxpbnV4LnZuZXQuaWJtLmNv
bT4gd3JvdGU6DQo+IEhpIGFsbCwNCj4NCj4gRHVyaW5nIHRoZSBoYWNrYXRvbiBtZWV0dXAsIHdl
IHRvdWNoZWQgb24gQk1DIGltYWdlIHZlcmlmaWNhdGlvbiBhbmQgDQo+IHNpZ25pbmcgYW5kIGNv
bmNsdWRlZCB0aGF0IHRoZSBjb21tdW5pdHkgd291bGQgbGlrZSB0byBzZWUgdHdvIA0KPiB2ZXJp
ZmljYXRpb24gc3RlcHMsIG9uZSBwcmlvciB0byB3cml0aW5nIHRoZSBpbWFnZSB0byBmbGFzaCAo
dmlhIA0KPiBkaWdpdGFsIHNpZ25hdHVyZSB2ZXJpZmljYXRpb24pLCBhbmQgYW5vdGhlciBvbmUg
YnkgY2hlY2tpbmcgRklUIGluIA0KPiBVLUJvb3QgcHJpb3IgdG8gYm9vdGluZyBmcm9tIHRoZSBu
ZXcgaW1hZ2UuDQo+DQo+IFRoZSBwcm9wb3NhbCB3b3VsZCBiZSB0byBpbXBsZW1lbnQgdGhlIGRp
Z2l0YWwgc2lnbmF0dXJlIHZlcmlmaWNhdGlvbiBmaXJzdC4NCj4NCj4gQXQgYSBoaWdoIGxldmVs
LCBkdXJpbmcgdGhlIGJ1aWxkOg0KPiAqIEEgU0hBLTI1NiBoYXNoIHdvdWxkIGJlIGNhbGN1bGF0
ZWQgb3ZlciB0YmQgZmlsZXMgdGhhdCBtYWtlIHVwIHRoZSANCj4gZmlybXdhcmUgaW1hZ2UuDQo+
ICogVGhlIGhhc2ggd291bGQgYmUgc2lnbmVkIGJ5IGEgcHJpdmF0ZSBrZXkgdGhhdCdzIHBhcnQg
b2YgdGhlIA0KPiByZXBvc2l0b3J5IChjb21tdW5pdHkga2V5KS4gQ29tcGFuaWVzIGNvdWxkIG92
ZXJ3cml0ZSBpdCB3aXRoIHRoZWlyIA0KPiBvd24gcHJpdmF0ZSBrZXkgd2hlbiBidWlsZGluZyBw
cm9kdWN0aW9uIGltYWdlcy4NCj4gKiBUaGUgZW5jcnlwdGVkIGhhc2ggKGRpZ2l0YWwgc2lnbmF0
dXJlKSBhbmQgY29ycmVzcG9uZGluZyBwdWJsaWMga2V5IA0KPiB3b3VsZCBiZSBhZGRlZCB0byB0
aGUgZmlybXdhcmUgaW1hZ2UuDQo+ICogWW9jdG8gbWF5IGFscmVhZHkgcHJvdmlkZSBhIHdheSB0
byBzaWduIGltYWdlcyBhbmQgZ2VuZXJhdGUga2V5cy4NCj4NCj4gT24gdGhlIEJNQzoNCj4gKiBU
aGUgaGFzaCB3b3VsZCBiZSBjYWxjdWxhdGVkIG9uIHRoZSBpbWFnZSBmaWxlcyB0aGF0IHdlcmUg
dXBsb2FkZWQgDQo+IHRvIHRoZSBCTUMuDQo+ICogVGhlIHNpZ25hdHVyZSB3b3VsZCBiZSBkZWNy
eXB0ZWQgdXNpbmcgYW4gZXhpc3RpbmcgcHVibGljIGtleSBvbiB0aGUgDQo+IEJNQyAodGhpcyB2
YWxpZGF0ZXMgdGhlIG5ldyBwdWJsaWMga2V5IGRlbGl2ZXJlZCB3aXRoIHRoZSBpbWFnZSBpcyBh
bHNvIHZhbGlkKS4NCj4gKiBBY2NlcHQgaW1hZ2UgaWYgYm90aCB2YWx1ZXMgYXJlIHRoZSBzYW1l
Lg0KPg0KPiBBbnkgdGhvdWdodHMgb3IgY29tbWVudHM/DQo+DQo=
