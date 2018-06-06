Return-Path: <Eugene.Cho@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=eugene.cho@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="OHjlrBn6"; 
 dkim-atps=neutral
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41178y0wYHzF311
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jun 2018 22:22:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1528287746; x=1559823746;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+V8kmrnVLJ7Ph0PmSBG+F9DGrlzKflRpVHXdXOgB4Ag=;
 b=OHjlrBn6OcbUBK7ptWjBhYCd28U+xaLPtXGuRuYc+c5mvjUgvplkeqt1
 ExrAZ966q79W1Z1jsXM5HcMR8XifyakmILIBtTJzhv2PYQeneRLgFGaMs
 fwnmrSVeBS43n30FEdOLbm1glKOMLzVMx02+3/sI3HvGHL3Xe9oimmNxX E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2G5AQAc0Rdbh2Ka6ERcGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQNCg5/KAqDbpRpgXmCBwGGD4xPgWQLHw+EPgIXgh0hNxUBAgE?=
 =?us-ascii?q?BAQEBAQIBAQIQAQEBCgsJCCgjDII1IhF6AQEBAQEBAQEBTQINYwEBAQQjEUUMB?=
 =?us-ascii?q?AIBCBEEAQEBAgIjAwICAh8lAQgIAgQOBQiDGgKBZwMEEQ+oDoIchwkNTV+BYwW?=
 =?us-ascii?q?BC4c3ghOBD4MMgk8rgV0FHjMSgjSCVQKYSiwHAoVthXmCeo0qigFKhl2BV4F1c?=
 =?us-ascii?q?IMTH4IBDgmIWYU+b49RgRkBAQ?=
X-IPAS-Result: =?us-ascii?q?A2G5AQAc0Rdbh2Ka6ERcGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?NCg5/KAqDbpRpgXmCBwGGD4xPgWQLHw+EPgIXgh0hNxUBAgEBAQEBAQIBAQIQA?=
 =?us-ascii?q?QEBCgsJCCgjDII1IhF6AQEBAQEBAQEBTQINYwEBAQQjEUUMBAIBCBEEAQEBAgI?=
 =?us-ascii?q?jAwICAh8lAQgIAgQOBQiDGgKBZwMEEQ+oDoIchwkNTV+BYwWBC4c3ghOBD4MMg?=
 =?us-ascii?q?k8rgV0FHjMSgjSCVQKYSiwHAoVthXmCeo0qigFKhl2BV4F1cIMTH4IBDgmIWYU?=
 =?us-ascii?q?+b49RgRkBAQ?=
Received: from esa4.dell-outbound2.iphmx.com ([68.232.154.98])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2018 07:22:21 -0500
From: <Eugene.Cho@dell.com>
Received: from ausxipps306.us.dell.com ([143.166.148.156])
 by esa4.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2018 18:22:20 +0600
X-LoopCount0: from 10.166.132.131
X-IronPort-AV: E=Sophos;i="5.49,483,1520917200"; d="scan'208";a="207433868"
X-DLP: DLP_GlobalPCIDSS
To: <joel@jms.id.au>
CC: <openbmc@lists.ozlabs.org>
Subject: RE: lpc reset questions
Thread-Topic: lpc reset questions
Thread-Index: AQHT/XGwQa7RrNuRTle8q4VFVbretKRTJpKg
Date: Wed, 6 Jun 2018 12:22:19 +0000
Message-ID: <a2cdfa19c00f492992820f9fae001d39@AUSX13MPC105.AMER.DELL.COM>
References: <CACPK8Xc=utavS8Q42fkcWmVuOcnDbgHAMTQA3peJuxzHOzNYng@mail.gmail.com>
In-Reply-To: <CACPK8Xc=utavS8Q42fkcWmVuOcnDbgHAMTQA3peJuxzHOzNYng@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titusconfig: No Restrictions 04051212
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvIiwiaWQiOiI0MDQxOGYzOS1lNTUxLTQyM2UtYjU5MS1mNjVmM2Y1ZWZhNjAiLCJwcm9wcyI6W3sibiI6IkNsYXNzaWZpY2F0aW9uIiwidmFscyI6W3sidmFsdWUiOiJObyBSZXN0cmljdGlvbnMifV19LHsibiI6IlN1YmxhYmVscyIsInZhbHMiOltdfSx7Im4iOiJFeHRlcm5hbENvcnJlc3BvbmRlbmNlIiwidmFscyI6W119XX0sIlN1YmplY3RMYWJlbHMiOltdLCJUTUNWZXJzaW9uIjoiMTYuMi4xMS4wIiwiVHJ1c3RlZExhYmVsSGFzaCI6InNaYnF2aTRzSTdITHdzWGV4NmxuK0pkVmdySTVwNnR6UWNlQytyMStPVUk9In0=
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
X-List-Received-Date: Wed, 06 Jun 2018 12:22:28 -0000

VGhhbmtzIEpvZWwuIE9uZSBtb3JlIHF1ZXN0aW9uIC0gDQoNCkFyZSB5b3UgYXdhcmUgb2YgYW55
IEFCSSB0byBub3RpZnkgVXNlciBTcGFjZSB3aGVuZXZlciBhIExQQyByZXNldCBvY2N1cnM/IEkg
ZGlkbuKAmXQgc2VlIGFueXRoaW5nLi4uIGFuZCBJIGFtIHVuc3VyZSBpZiB0aGlzIGlzIHNvbWV0
aGluZyB0aGF0IG9ubHkgd2UvRGVsbCBuZWVkcy4uLg0KDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IGpvZWwuc3RhbkBnbWFpbC5jb20gW21haWx0bzpqb2VsLnN0YW5AZ21h
aWwuY29tXSBPbiBCZWhhbGYgT2YgSm9lbCBTdGFubGV5DQpTZW50OiBXZWRuZXNkYXksIEp1bmUg
NiwgMjAxOCAzOjM4IEFNDQpUbzogQ2hvLCBFdWdlbmUNCkNjOiBPcGVuQk1DIE1haWxsaXN0DQpT
dWJqZWN0OiBSZTogbHBjIHJlc2V0IHF1ZXN0aW9ucw0KDQpIZWxsbyBFdWdlbmUsDQoNCk9uIDYg
SnVuZSAyMDE4IGF0IDAxOjU4LCAgPEV1Z2VuZS5DaG9AZGVsbC5jb20+IHdyb3RlOg0KPiAgICBJ
IHdhcyB0cnlpbmcgdG8gZm9sbG93IHRoZSBmb2xsb3dpbmcgc3VibWlzc2lvbiAgDQo+IGh0dHBz
Oi8vbGttbC5vcmcvbGttbC8yMDE4LzIvMTkvMTIsDQo+IHNvIGJlc3QgSSBjYW4gdGVsbCBpcyBv
biBBc3BlZWQgdGhpcyAicmVzZXQtc2ltcGxlIGRyaXZlciIgd2lsbCBqdXN0IA0KPiB0YWtlIHRo
ZSBVQVJUIG91dC1vZi1yZXNldCwgYmVjYXVzZSBBc3BlZWQgYXV0b21hdGljYWxseSBwdXRzIHRo
ZSBVQVJUIGluIHJlc2V0IG9uIExQQy1yZXNldD8/Pz8NCj4gRGlkIEkgZ2V0IHRoYXQgcmlnaHQ/
DQoNCkF0IHBvd2VyIG9uLCB0aGUgYXNwZWVkIHRpZXMgdGhlIHJlc2V0IG9mIFVBUlQxIGFuZCBV
QVJUMiB0byB0aGUgTFBDIHJlc2V0LiBJIGZpZ3VyZSB0aGlzIGlzIGJlY2F1c2UgdGhleSBoYXZl
IGEgIlNVQVJUIiBtb2RlLCB3aGVyZSBob3N0IFNJTyBhY2Nlc3NlcyBhcmUgdXNlZCB0byBwcm9n
cmFtIHRoZSBCTUMncyBVQVJUIGRpcmVjdGx5IGZyb20gdGhlIGhvc3Qgb3ZlciB0aGUgTFBDLg0K
DQpUaGlzIGRvZXNuJ3Qgd29yayBmb3IgTGludXggb24gdGhlIEJNQyBhcyBpdCBleHBlY3RzIHRo
ZSBkZXZpY2UgdG8gYmUgZnVuY3Rpb25hbCB3aGVuIGl0IGxvYWRzIGl0J3MgZHJpdmVyLiBIZW5j
ZSwgdGhlIHNpbXBsZS1yZXNldCBkcml2ZXIgcG9rZXMgYXQgdGhlIHRpZWQtdG8tTFBDLXJlc2V0
IGJpdCwgZWZmZWN0aXZlbHkgdGFraW5nIHRoZSBVQVJUIG91dCBvZiByZXNldC4NCg0KQ2hlZXJz
LA0KDQpKb2VsDQo=
