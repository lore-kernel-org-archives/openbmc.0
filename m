Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.220; helo=esa2.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="brsiXU+r"; 
 dkim-atps=neutral
Received: from esa2.dell-outbound.iphmx.com (esa2.dell-outbound.iphmx.com
 [68.232.149.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zWpzf3phrzDqps
 for <openbmc@lists.ozlabs.org>; Thu,  1 Feb 2018 03:46:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1517417182; x=1548953182;
 h=from:cc:to:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OzTjCFwxTG1DpMBnTgeuFW115m7MrTltuLIy1pNsZMA=;
 b=brsiXU+rIEWUNysEj1/tiJ0oYCLwDrBngccA7siS7JPOORAp3P/qJZ+U
 p/AJCTg6ApxZ0BOfU8tTMxs4yB7WzZAV2SlLcdnemrOttS0rWQoLpY/v1
 8D+CsnRvMPXTTg6hKmdcwcdFrL1dcpSWvSpYUYhAmR15uuzqzEiK0h8JQ s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HtAABs8nFahz+a6ERcGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQYgQUoCoNWmE+CAoIBjVaHb4IXChiFIwIagjVWFgEBAQEBAQE?=
 =?us-ascii?q?BAgECEAEBAQoLCQgoL4I4IoJKAQEBBAEXCxFFDAQCAQgRBAEBAwIjAwICAiYeA?=
 =?us-ascii?q?QgIAgQTCAyKIacfgieKYgEBCAEBAQEBI4EPg0yCFYM/gy6DLwSBWR0zgl2CZQW?=
 =?us-ascii?q?kHgqPRYYUgiaGIotul2mBPCYOgXVwUoIqgmWCEniJXSyBBoEXAQEB?=
X-IPAS-Result: =?us-ascii?q?A2HtAABs8nFahz+a6ERcGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?YgQUoCoNWmE+CAoIBjVaHb4IXChiFIwIagjVWFgEBAQEBAQEBAgECEAEBAQoLC?=
 =?us-ascii?q?QgoL4I4IoJKAQEBBAEXCxFFDAQCAQgRBAEBAwIjAwICAiYeAQgIAgQTCAyKIac?=
 =?us-ascii?q?fgieKYgEBCAEBAQEBI4EPg0yCFYM/gy6DLwSBWR0zgl2CZQWkHgqPRYYUgiaGI?=
 =?us-ascii?q?otul2mBPCYOgXVwUoIqgmWCEniJXSyBBoEXAQEB?=
Received: from esa3.dell-outbound2.iphmx.com ([68.232.154.63])
 by esa2.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2018 10:46:18 -0600
From: <Michael.E.Brown@dell.com>
Cc: <alirhas@microsoft.com>, <Balaji.B.Rao@dell.com>, <Paul.Vancil@dell.com>, 
 <ed.tanous@intel.com>, <rolfb@us.ibm.com>, <jwcarman@us.ibm.com>,
 <hramasub@in.ibm.com>, <pradeep.kumar36@tcs.com>, <openbmc@lists.ozlabs.org>
Received: from ausxipps301.us.dell.com ([143.166.148.223])
 by esa3.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2018 22:43:03 +0600
X-LoopCount0: from 10.166.132.71
X-IronPort-AV: E=Sophos;i="5.46,440,1511848800"; d="scan'208";a="122626561"
X-DLP: DLP_GlobalPCIDSS
To: <bradleyb@fuzziesquirrel.com>
Subject: RE: Redfish on OpenBMC
Thread-Topic: Redfish on OpenBMC
Thread-Index: AQHTmjMGgVazjCpVJkm7ZKYhcdFs4KOOLT/w
Date: Wed, 31 Jan 2018 16:46:16 +0000
Message-ID: <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
In-Reply-To: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
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
X-List-Received-Date: Wed, 31 Jan 2018 16:46:24 -0000

U28sIEkgdGhpbmsgdGhhdCB0aGUgZmlyc3QgdGhpbmcgd2Ugb3VnaHQgdG8gZG8gaXMgZ2V0IGEg
c3VydmV5IG9mIHRoZSBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb25zIHRoYXQgYXJlIG91dCB0aGVy
ZSwgYW5kIGVzdGFibGlzaCBjcml0ZXJpYSBmb3IganVkZ2luZyBkaWZmZXJlbnQgaW1wbGVtZW50
YXRpb25zLg0KDQpIZXJlIHdvdWxkIGJlIGEgbGlzdCBvZiBxdWVzdGlvbnMgSSB3b3VsZCBoYXZl
IGZvciBldmVyeWJvZHkgb24gdGhlIGxpc3QuIEkgdGhpbmsgaXQgd291bGQgcHJvYmFibHkgYmUg
YmVzdCB0byBjb21waWxlIGFsbCBvZiB0aGVzZSBpbnRvIGEgd2lraSBwYWdlIHNvbWV3aGVyZS4N
Cg0KICAgLSBEbyB5b3UgaGF2ZSBhIHJlZGZpc2ggc2VydmVyIGltcGxlbWVudGF0aW9uPw0KICAg
LSBJcyBpdCBPcGVuIFNvdXJjZT8NCgktIElmIG5vdCwgYXJlIHlvdSBwbGFubmluZyBvbiBvcGVu
IHNvdXJjaW5nIGl0Pw0KCS0gV2hhdCBpcyB0aGUgbGljZW5zZT8NCgktIElzIGl0IHBvc3RlZCB0
byBnaXRodWIgb3Igb3RoZXIgcHVibGljIHNvdXJjZSBjb250cm9sPw0KICAgLSBEb2VzIGl0IHBh
c3MgdGhlIERNVEYgcmVkZmlzaCBzZXJ2aWNlIHZhbGlkYXRvcj8NCiAgIC0gV2hhdCBsYW5ndWFn
ZSBpcyBpdCB3cml0dGVuIGluPw0KICAgLSBIb3cgYmlnIGlzIGl0Pw0KICAgLSBDYW4gaXQgYmUg
ZWFzaWx5IGV4dGVuZGVkL3JlLXVzZWQgYnkgYW55Ym9keSBlbHNlIHNoaXBwaW5nIGNvbXBsaWFu
dCBvcGVuYm1jIGltcGxlbWVudGF0aW9ucz8NCgktIENhbiB5b3UgYWRkIE9FTSBleHRlbnNpb25z
IHRvIGV4aXN0aW5nIFJlZGZpc2ggUmVzb3VyY2VzIHdpdGhvdXQgImZvcmtpbmciIHRoZSBjb2Rl
YmFzZT8NCgktIENhbiB5b3UgY2hhbmdlIHRoZSBpbXBsZW1lbnRhdGlvbiBmb3IgYSBzaW5nbGUg
UmVkZmlzaCBSZXNvdXJjZSBQcm9wZXJ0eSB3aXRob3V0IGZvcmtpbmc/DQoJLSBDYW4geW91IGFk
ZCBuZXcgUmVkZmlzaCBSZXNvdXJjZXMgd2l0aG91dCBmb3JraW5nPw0KICAgLSBQZXJmb3JtYW5j
ZQ0KCS0gSG93IGZhc3QgaXMgaXQ/DQoJLSBEb2VzIGl0IGltcGxlbWVudCBTU0w/DQogICAtIFNl
Y3VyaXR5DQoJLSBXaGF0IGlzIHRoZSBzZWN1cml0eSBtb2RlbD8NCgktIE5vbi1yb290IHN1cHBv
cnQ/IENhbiBpdCBydW4gYXMgYSBub24tcHJpdmlsZWdlZCB1c2VyPw0KCS0gRG9lcyBpdCBpbXBs
ZW1lbnQgYmFzaWMgYXV0aGVudGljYXRpb24gYW5kIHRoZSByZWRmaXNoIHNwZWMgeC1hdXRoLXRv
a2VuIGF1dGhlbnRpY2F0aW9uPw0KCS0gRG9lcyBpdCBpbXBsZW1lbnQgdGhlIHJlZGZpc2ggc3Rh
bmRhcmQgcHJpdmlsZWdlIG1hcCBtb2RlbD8NCiAgIC0gRXZlbnRpbmc6DQoJLSBGb3Igd3JpdGlu
ZyBhIFVJIG9uIHRvcCBvZiByZWRmaXNoLCBzb21ldGhpbmcgbGlrZSBTU0UgaXMgYSBuaWNlLXRv
LWhhdmUgdG8gYXZvaWQgcG9sbGluZyBpbiB0aGUgYnJvd3Nlci4gVGhlcmUgYXJlIGEgY291cGxl
IG9mIHByb3Bvc2VkIFNTRSBleHRlbnNpb25zIHRoYXQgaGF2ZSBub3QgeWV0IGJlZW4gYXBwcm92
ZWQuDQoJCS0gSG93IG11Y2ggd29yayB0byBpbXBsZW1lbnQgU1NFIHN1cHBvcnQgdG8gZG8gdGhp
bmdzIGxpa2Ugd2F0Y2ggUHJvcGVydHkgY2hhbmdlcz8NCgktIElzIHRoZSBzdGFuZGFyZCByZWRm
aXNoIGV2ZW50aW5nIG1vZGVsIHN1cHBvcnRlZD8NCgktIFNlY3VyaXR5IG1vZGVsIGludGVncmF0
ZWQgd2l0aCBldmVudGluZz8gRG8gZXZlbnRpbmcgcmVjb3JkcyBnZXQgdGhlIHNhbWUgc2VjdXJp
dHkgdHJlYXRtZW50IGFzIEdFVCByZXF1ZXN0cz8NCiAgIC0gRGV2ZWxvcG1lbnQ6IGNhbiBpdCBy
dW4gb3V0c2lkZSBvZiBvcGVuYm1jPw0KICAgLSBTcGVjaWFsIHNhdWNlOiBpcyB0aGVyZSBhbnl0
aGluZyBub3QgY2FwdHVyZWQgYWJvdmUgdGhhdCBtYWtlcyB0aGUgaW1wbGVtZW50YXRpb24gc3Bl
Y2lhbCBpbiBhbnkgd2F5Pw0KDQotLQ0KTWljaGFlbA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogQnJhZCBCaXNob3AgW21haWx0bzpicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5j
b21dIA0KU2VudDogVHVlc2RheSwgSmFudWFyeSAzMCwgMjAxOCA3OjMwIFBNDQpUbzogQnJvd24s
IE1pY2hhZWwgRSA8TWljaGFlbF9FX0Jyb3duQERlbGwuY29tPg0KQ2M6IGFsaXJoYXNAbWljcm9z
b2Z0LmNvbTsgUmFvLCBCYWxhamkgQiA8QmFsYWppX0JfUmFvQGRlbGwuY29tPjsgVmFuY2lsLCBQ
YXVsIDxQYXVsX1ZhbmNpbEBEZWxsLmNvbT47IFRhbm91cywgRWQgPGVkLnRhbm91c0BpbnRlbC5j
b20+OyByb2xmYkB1cy5pYm0uY29tOyBqd2Nhcm1hbkB1cy5pYm0uY29tOyBIYXJpaGFyYXN1YnJh
bWFuaWFuIFJhbWFzdWJyYW1hbmlhbiA8aHJhbWFzdWJAaW4uaWJtLmNvbT47IHByYWRlZXAua3Vt
YXIzNkB0Y3MuY29tOyBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+
DQpTdWJqZWN0OiBSZWRmaXNoIG9uIE9wZW5CTUMNCg0KSGkgTWljaGFlbA0KDQpUaGUgcHJvamVj
dCBjb3VsZCByZWFsbHkgdXNlIHNvbWVvbmUgdG8gZ2V0IGV2ZXJ5b25lIHRoYXQgaGFzIGV4cHJl
c3NlZCBpbnRlcmVzdCBpbiB0aGUgZnV0dXJlIG9mIFJlZGZpc2ggc3VwcG9ydCBpbiBPcGVuQk1D
IHJvd2luZyBpbiB0aGUgc2FtZSBkaXJlY3Rpb24uICBTbyB0aGFuayB5b3UgZm9yIHZvbHVudGVl
cmluZyB0byBsZWFkIHRoYXQgY29udmVyc2F0aW9uIGF0IHRoZSBjb21tdW5pdHkgY2FsbCB5ZXN0
ZXJkYXkuDQoNCknigJl2ZSBDQ+KAmWVkIGV2ZXJ5b25lIHRoYXQgSSBrbm93IG9mIHRoYXQgaGFz
IGV4cHJlc3NlZCBhbiBpbnRlcmVzdC4NCk9wZW5CTUMgY29tbXVuaXR5OiBmZWVsIGZyZWUgdG8g
c3BlYWsgdXAgaWYgeW914oCZZCBsaWtlIHRvIGJlIGludm9sdmVkIGFuZCBJIGZvcmdvdCB5b3Uu
DQoNClRoZSBvbmx5IHRoaW5nIEnigJlkIGFzayBpcyB0byBwbGVhc2UgcG9zdCBsaW5rcyB0byBh
bnkgbWVldGluZ3MsIG1pbnV0ZXMsIG9yIGNvcnJlc3BvbmRlbmNlIGhlcmUgb24gdGhlIGxpc3Qs
IHNvIGV2ZXJ5b25lIGNhbiBlYXNpbHkga2VlcCB1cCB3aXRoIGhvdyB0aGluZ3MgYXJlIGdvaW5n
IG9yIGp1bXAgaW4gdG8gcHJvdmlkZSBmZWVkYmFjay4NCg0KdGhhbmtzIGFnYWluDQoNCi1icmFk
DQo=
