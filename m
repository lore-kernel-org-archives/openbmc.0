Return-Path: <Eugene.Cho@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.94; helo=esa3.dell-outbound.iphmx.com;
 envelope-from=eugene.cho@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="GUVG39mN"; 
 dkim-atps=neutral
Received: from esa3.dell-outbound.iphmx.com (esa3.dell-outbound.iphmx.com
 [68.232.153.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhRH615qmzDqr8
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 04:29:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1518628827; x=1550164827;
 h=from:cc:to:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IK8tsf+zyjACxwxkYx+nqN9mrlQPjZbmO5NJTcURU+8=;
 b=GUVG39mNCYmGyMo7N+giKXE31TEll+NkHtA6iNcOoRKW5D02QBm+adex
 DBeNJUezzoEiab4mJIWHi0saNf75JJ8X77O1WgJbWR6xn6Ef90b0PphJt
 SzPcsQlD+dlfEF5JzfFZ5R42KVpIY2YE7ZXIr2ueiyflwC69bSA8c8pDE c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GtAAAwcYRah8mZ6ERdGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQogQAyg1uKJI4DggKBF2qVWIIYCoU7AhqCY1QYAQIBAQEBAQE?=
 =?us-ascii?q?CAQIQAQEBCgsJCCgvgjgigkoBAQEBAgEjBA1FBQsCAQgaAiYCAgJFEAEBBAEai?=
 =?us-ascii?q?hwJCK9FgW06iCBhghMBAQEHAQEBAQEjgQ+Dc4IVgz+DLoRuHjOCeoJlBYpsmUM?=
 =?us-ascii?q?JlXyUTpgZgTwfggpwgxmCVBAMggaNRYEZAQEB?=
X-IPAS-Result: =?us-ascii?q?A2GtAAAwcYRah8mZ6ERdGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?ogQAyg1uKJI4DggKBF2qVWIIYCoU7AhqCY1QYAQIBAQEBAQECAQIQAQEBCgsJC?=
 =?us-ascii?q?CgvgjgigkoBAQEBAgEjBA1FBQsCAQgaAiYCAgJFEAEBBAEaihwJCK9FgW06iCB?=
 =?us-ascii?q?hghMBAQEHAQEBAQEjgQ+Dc4IVgz+DLoRuHjOCeoJlBYpsmUMJlXyUTpgZgTwfg?=
 =?us-ascii?q?gpwgxmCVBAMggaNRYEZAQEB?=
Received: from esa1.dell-outbound2.iphmx.com ([68.232.153.201])
 by esa3.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2018 11:20:22 -0600
From: <Eugene.Cho@dell.com>
Cc: <openbmc@lists.ozlabs.org>, <Brian.Berry@Dell.com>
Received: from ausxipps310.us.dell.com ([143.166.148.211])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2018 23:20:06 +0600
X-LoopCount0: from 10.166.132.134
X-IronPort-AV: E=Sophos;i="5.46,513,1511848800"; d="scan'208";a="132808446"
X-DLP: DLP_GlobalPCIDSS
To: <jk@ozlabs.org>, <avifishman70@gmail.com>, <tmaimon77@gmail.com>,
 <joel@jms.id.au>
Subject: RE: Serial Mux Mode in NPCM
Thread-Topic: Serial Mux Mode in NPCM
Thread-Index: AdOhHqOsX5uTqyQpRLO9iN0a5o3zIwEWpQmAAAw/Z5A=
Date: Wed, 14 Feb 2018 17:29:21 +0000
Message-ID: <d010be8f8444441f9a4399012588f79c@AUSX13MPC105.AMER.DELL.COM>
References: <599c29f92c5e4849a7c30820442d8f7e@AUSX13MPC105.AMER.DELL.COM>
 <ad550452-8cfd-a9aa-464d-4c6efb1b8681@ozlabs.org>
In-Reply-To: <ad550452-8cfd-a9aa-464d-4c6efb1b8681@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titusconfig: No Restrictions 04051212
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvIiwiaWQiOiI2YzYxNDc3ZC1jMTM0LTQ1MzgtODBmNy1lMTcyZGVhMTM3MzgiLCJwcm9wcyI6W3sibiI6IkNsYXNzaWZpY2F0aW9uIiwidmFscyI6W3sidmFsdWUiOiJObyBSZXN0cmljdGlvbnMifV19LHsibiI6IlN1YmxhYmVscyIsInZhbHMiOltdfSx7Im4iOiJFeHRlcm5hbENvcnJlc3BvbmRlbmNlIiwidmFscyI6W119XX0sIlN1YmplY3RMYWJlbHMiOltdLCJUTUNWZXJzaW9uIjoiMTYuMi4xMS4wIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlNVK1lMWWJkUjdKaUdDQ3VTV1dDUHZqZGc0M0J2UFhvTkd1TVlZMnJEZk09In0=
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
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
X-List-Received-Date: Wed, 14 Feb 2018 17:29:39 -0000

SGV5IEplcmVteSBhbmQgSm9lbCwgDQoNCj5Db2RlIHRvIGhhbmRsZSB0aGlzIHdvdWxkIG5vdCBi
ZSBzdWl0YWJsZSBhcyBhIFVBUlQgZHJpdmVyOyBpdCBoYW5kbGVzIG1vcmUgdGhhbiBhIHNpbXBs
ZSBVQVJUICJlbmRwb2ludCIsIHNvIHdlJ2QgbmVlZCBzb21ldGhpbmcgZGlzdGluY3QgZnJvbSA+
dGhlIGV4aXN0aW5nIHR0eSBkZXZpY2UgaGVyZS4gUGVyaGFwcyBhIHNlcGFyYXRlIFNvQyBkcml2
ZXI/DQoNCiAgT2theSBnb29kIHRvIGtub3cuIFllYSB1bnN1cmUgd2hhdCB0byBkbyBoZXJlLiBJ
IGtub3cgeWFsbCB3YW50ZWQgdG8gZ2V0IHJpZCBvZiB0aGUgYXNwZWVkLmMgYm9hcmQgZmlsZSwg
YnV0IGlzIHRoZSBnb2FsIHRoZSBnZXQgcmlkIG9mIHRoYXQgZmlsZSBjb21wbGV0ZWx5IG9yIGp1
c3QgdGhlIHBsYXRmb3JtIHNwZWNpZmljIChiYXJyZWxleWUsIHdpdGhlcnNwb29uLGV0Yy4uKSBz
ZXR1cCB0aGF0IGlzIGJlaW5nIGRvbmUgaW4gaXQuIFdvdWxkIGEgbnBjbSBib2FyZCBmaWxlIGJl
IGFwcHJvcHJpYXRlIGZvciBzb21ldGhpbmcgbGlrZSB0aGlzIHdoaWNoIGlzIFNvQyBzcGVjaWZp
YyBhbmQgZ2VuZXJhbCB1bmludGVyZXN0aW5nIGZvciB0aGUgZ2VuZXJhbCBsaW51eCBwb3B1bGF0
aW9uPw0KDQo+IEhvd2V2ZXIsIHlvdSBtYXkgbm90IG5lZWQgZHluYW1pYyByZWNvbmZpZ3VyYXRp
b24gb2YgdGhlIFVBUlQgcm91dGluZywgZGVwZW5kaW5nIG9uIHdoYXQgY29uZmlndXJhdGlvbnMg
YXJlIGF2YWlsYWJsZSBhbmQgeW91ciByZXF1aXJlbWVudHMuIC0+IElmIHRoZXJlJ3MgYSByb3V0
aW5nIGNvbmZpZ3VyYXRpb24gdGhhdCBmZWVkcyB0aGUgbmVjZXNzYXJ5IFVBUlRzIChob3N0LXNp
ZGUgYW5kIGV4dGVybmFsIHBvcnRzKSB0byB0aGUgQk1DIENQVSwgdGhlbiBvYm1jLWNvbnNvbGUt
c2VydmVyIGNhbiBoYW5kbGUgYWxsIHRoZSByb3V0aW5nIGluIHVzZXJzcGFjZSwgYW5kIHlvdSBz
ZXQgdGhhdCBIVyByb3V0aW5nIGNvbmZpZ3VyYXRpb24gb25jZSBvbiBib290LiBUaGlzIGlzIHdo
YXQgd2UgY3VycmVudGx5IGRvIGZvciBwaG9zcGhvciBwbGF0Zm9ybXMuDQoNCkhlcmXigJlzIG15
IGF0dGVtcHQgYXQgZHJhd2luZyB0aGlzIG91dC4gSG9wZWZ1bGx5IHRoZSBmb3JtYXR0aW5nIGRv
ZXNu4oCZdCBnZXQgYnV0Y2hlcmVkLi4uDQoNCldlIHN1cHBvcnQgIkhvc3QgU1AxIiBhbmQgIkhv
c3QgU1AyIiBib3RoIGJlaW5nIHVzZWQgYXQgdGhlIHNhbWUgdGltZSwgZGVwZW5kaW5nIG9uIHdo
YXQgdGhlIGN1c3RvbWVyIHNldHRpbmcgYXJlIChpLmUuIFNPTCBvbiBIb3N0IFNlcmlhbCBQb3J0
IDIgd2hpbGUgYWxzbyBkb2luZyAgSG9zdCBTZXJpYWwgUG9ydCAxIC0+IHBoeXNpY2FsIHBvcnQs
IGV0Yy4uICkuIFVzdWFsbHkgdGhlIEJNQyBpcyBvbmx5IHJlYWxseSBpbnRlcmVzdGVkIGluIDEg
b2YgdGhlICJIb3N0IFNQIiwgd2hpbGUgdGhlIG90aGVyIGlzIHVzZWQgYXMgcmVndWxhciBIb3N0
IFNlcmlhbCAtPnBoeXNpY2FsIHBvcnQuICBCdXQgdGhlcmUgYXJlIGNhc2VzIHdoZXJlIEJNQyBj
YW4gYWxzbyB0YWtlIG92ZXIgdGhlIHBoeXNpY2FsIHBvcnQuLi4NCg0KU28gZm9yIHVzIHRvIGRv
IDEgY29uZmlndXJhdGlvbiBvbiBib290dXAgaXQgd291bGQgbWVhbiB0aGUgbXV4IHdvdWxkIGhh
dmUgdG8gbG9vayBzb21ldGhpbmcgbGlrZSB0aGlzOiANCg0KCVtIb3N0IFNQMV0JW0hvc3QgU1Ay
XQ0KCQlcCQlcX19fX19fX1tCTUMgVUFSVCAyXQ0KCQkgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS1bQk1DIFVBUlQgMV0NCgkJCV9fX19fX19fX19fX19fX1tCTUMgVUFSVCAzXQ0K
CQkJLw0KCTw8IFBoeXNpY2FsIHBvcnQvIFNlcmlhbCBJbnRlcmZhY2UgMiAgPj4NCg0KU28gd2hp
bGUgSSBhZ3JlZSBpdCBjYW4gYmUgZG9uZS4gSXQgc2VlbXMgYSBiaXQgb3ZlcmtpbGwgZm9yIEhv
c3QgU2VyaWFsIC0+IHBoeXNpY2FsIHBvcnQgKHNpbmNlIHRoZSBCTUMgaGFzIG5vIHZlc3RlZCBp
bnRlcmVzdCBpbiBpdCkuIEknbSBub3Qgc3VyZSB3aGF0IHRoZSBpbXBsaWNhdGlvbnMgYXJlIGZv
cjogaG9zdCBzZXJpYWwgdGhyb3VnaHB1dCwgYWRkZWQgQk1DIG92ZXJoZWFkLCAgbG9zcyBvZiBo
b3N0IHNlcmlhbCBIVyBmbG93IGNvbnRyb2wsIHJlbGlhbmNlIG9uIG9wZXJhdGlvbmFsIEJNQyBm
b3IgSG9zdCBDT00xLzItPiBwaHlzaWNhbCBwb3J0LCBldGMuIEdpdmVuIHRoYXQgdGhlIE5QQ00g
c3VwcG9ydHMgbXV4aW5nL3JvdXRpbmcgLSBzaG91bGRu4oCZdCB3ZSB1c2UgaXQ/DQo=
