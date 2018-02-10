Return-Path: <yupalani@microsoft.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=104.47.33.133; helo=nam01-bn3-obe.outbound.protection.outlook.com;
 envelope-from=yupalani@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="YJUkn/Jg"; dkim-atps=neutral
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0133.outbound.protection.outlook.com [104.47.33.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zdZK43B2kzF0cn
 for <openbmc@lists.ozlabs.org>; Sat, 10 Feb 2018 12:36:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pfVzpAo7iNsnyHf+GPF4QLYBic290PaAMFMZgrlsIXY=;
 b=YJUkn/JgVJjm7bugaNJpf8Dc92/IAet7FQm/MpnYcLgo0UAgAzCVaCf7eSZaab790Ehp5AIKcnUIagS3pXuWreyT1IWkL4CRLeS5B7ab1UsawAmhqUS261S9mz/MSqQT/55U5piq0QktcmuTqWeE7E0jxxuM6PPw8TOUZoVAK4w=
Received: from MWHPR21MB0864.namprd21.prod.outlook.com (10.173.51.146) by
 MWHPR21MB0512.namprd21.prod.outlook.com (10.172.95.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.506.1; Sat, 10 Feb 2018 01:36:16 +0000
Received: from MWHPR21MB0864.namprd21.prod.outlook.com ([10.173.51.146]) by
 MWHPR21MB0864.namprd21.prod.outlook.com ([10.173.51.146]) with mapi id
 15.20.0506.011; Sat, 10 Feb 2018 01:36:16 +0000
From: Yugi Mani <yupalani@microsoft.com>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: BMC Image Signing Proposal
Thread-Topic: BMC Image Signing Proposal
Thread-Index: AQHToRsVyP6JP+mT8kapTMVsySP6DaOc1qZw
Date: Sat, 10 Feb 2018 01:36:16 +0000
Message-ID: <MWHPR21MB086454F2C875043A3B7FCBF9D6F10@MWHPR21MB0864.namprd21.prod.outlook.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au> <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
 <87lggezywe.fsf@linux.vnet.ibm.com>
 <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
 <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
In-Reply-To: <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=yupalani@microsoft.com; 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-02-10T01:36:15.1431060Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
 Sensitivity=General
x-originating-ip: [2001:4898:80e8:4::6c7]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0512;
 7:et4k7kTtdtFAE7C+1/JEGc4b+TsCL+hnbAUwr2gCV11Veacze/5YpGBFcxY76DrIf5Gp7WAx3mQSbNLOiw2FpSooxZPvC69+q0VQiZfKVDUsOgjRfX7e3+SL16oK/O5+t+GTjmEZEANOVTnZ6dkQgfyBXqlFLyIPK8RP7lWzKsCUjWJwRDMC5xNfgF5qFc7c+RQO22BUfxgVjLRsZRI3rkPzwRCE6c6Wr7vvM3lNmu0H1bwwlmx0G7uDKBcZ0fG2
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8426afca-1e4d-456b-1dc6-08d57026ada3
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7193020);
 SRVR:MWHPR21MB0512; 
x-ms-traffictypediagnostic: MWHPR21MB0512:
x-microsoft-antispam-prvs: <MWHPR21MB0512C729FA2EE1BD655753E9D6F10@MWHPR21MB0512.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(192374486261705)(189930954265078)(211936372134217)(219752817060721); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(61425038)(6040501)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231101)(2400082)(944501161)(6055026)(61426038)(61427038)(6041288)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
 SRVR:MWHPR21MB0512; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0512; 
x-forefront-prvs: 057906460E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(39380400002)(376002)(39860400002)(396003)(199004)(189003)(10090500001)(55016002)(110136005)(25786009)(966005)(316002)(478600001)(86612001)(10290500003)(6306002)(106356001)(8990500004)(6246003)(97736004)(2950100002)(9686003)(2900100001)(5660300001)(99286004)(33656002)(2906002)(6436002)(229853002)(6116002)(74316002)(22452003)(575784001)(86362001)(77096007)(93886005)(102836004)(7736002)(6346003)(81166006)(81156014)(8936002)(8676002)(3480700004)(105586002)(53936002)(59450400001)(6506007)(305945005)(53546011)(2501003)(68736007)(7696005)(76176011)(3660700001)(14454004)(3280700002)(186003)(42262002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0512;
 H:MWHPR21MB0864.namprd21.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yupalani@microsoft.com; 
x-microsoft-antispam-message-info: sMX7Nrdq81ihQrOwmoUsY1gF8U0qysSB8zEaYKsGqAnYgn7dUQK2lR6cifgMPZ4ev9KBQSzD5cRqLFN8n4ovRQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8426afca-1e4d-456b-1dc6-08d57026ada3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2018 01:36:16.6539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0512
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
X-List-Received-Date: Sat, 10 Feb 2018 01:36:25 -0000

T24gVGh1cnNkYXksIEZlYnJ1YXJ5IDgsIDIwMTggMTI6MjcgUE0sIEFkcmlhbmEgS29ieWxhayB3
cm90ZToNCj4gSGVyZSBhcmUgc29tZSBjaGFydHMgd2l0aCB0aGUgaW1hZ2Ugc2lnbmluZyBmbG93
IGZvciBjb21tZW50Og0KPiANCj4gaHR0cHM6Ly9uYTAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91
dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZkcmkNCj4gdmUuZ29vZ2xlLmNvbSUyRmZpbGUl
MkZkJTJGMUl4Zk1ZUnR0TjhSYmhSWTdQd0JtWHNxQ0J2dHZfeUxKDQo+ICUyRnZpZXclM0Z1c3Al
M0RzaGFyaW5nJmRhdGE9MDQlN0MwMSU3Q3l1cGFsYW5pJTQwbWljcm9zb2Z0LmMNCj4gb20lN0M5
YTJkOWY0NWEyMTQ0YzU5YmM1OTA4ZDU2ZjMyMzVjNyU3Q2VlMzMwM2Q3ZmI3MzRiMGM4NTg5Yg0K
PiBjZDg0N2YxYzI3NyU3QzElN0MwJTdDNjM2NTM3MTgzODA0ODk1NjM2JTdDVW5rbm93biU3Q1RX
RnANCj4gYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJ
NklrMWhhV3dpZlENCj4gJTNEJTNEJTdDLQ0KPiAxJnNkYXRhPUMwUkJ0Zm1qRTNWSEgxQThBOE13
Q0JWRkNVUXl2RjNXRWRXSDdiZ2pSQzAlM0QmDQo+IHJlc2VydmVkPTANCg0KVGhhbmtzIGZvciBw
dXR0aW5nIHRvZ2V0aGVyIGEgY2hhcnQuIA0KDQpXZSBzaG91bGQgY29uc2lkZXIgYm90aCBvZiB0
aGVzZSByZXF1aXJlbWVudHMgZm9yIGltYWdlIHNpZ25pbmc6DQoxLiBVcGRhdGUgdmVyaWZpY2F0
aW9uDQoyLiBCb290IFZlcmlmaWNhdGlvbg0KDQpBcHBlbmRpbmcgc2lnbmF0dXJlIHRvIGltYWdl
IG1lZXRzIHZlcmlmaWNhdGlvbiBkdXJpbmcgZmlybXdhcmUgdXBkYXRlLiBUbyBkbyB2ZXJpZmlj
YXRpb24gb24gZXZlcnkgYm9vdCwgd2UgbmVlZCBzb21ldGhpbmcgbGlrZSBGSVQuICANCmh0dHBz
Oi8vY2hyb21pdW0uZ29vZ2xlc291cmNlLmNvbS9jaHJvbWl1bW9zL3RoaXJkX3BhcnR5L3UtYm9v
dC1uZXh0LysvY2hyb21lb3MtdjIwMTMuMDYvZG9jL3VJbWFnZS5GSVQNCg0KQXMgZmFyIGFzIGFj
dHVhbCBzaWduaW5nIGlzIGNvbmNlcm5lZCwgd2UgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gcHJpdmF0
ZSBrZXkgZm9yIHNlY3VyaXR5IHJlYXNvbnMuIFdlIHNob3VsZCBzdXBwb3J0IHR3byBtb2RlbHM6
DQpNb2RlbCAxOg0KU291cmNlIGNvZGUgaGFzIHByaXZhdGUga2V5IGFuZCBzaWduaW5nIGlzIHBh
cnQgb2YgYnVpbGQgcHJvY2VzcyAoImJpdGJha2Ugb2JtYy1waG9zcGhvci1pbWFnZSIpDQoNCk1v
ZGVsIDI6DQpTb3VyY2UgY29kZSBkb2VzIG5vdCBoYXZlIHByaXZhdGUga2V5LCBTaWduaW5nIGlz
IGRvbmUgZXh0ZXJuYWxseSBhbmQgc29tZSBwb3N0LXByb2Nlc3NpbmcgaXMgZG9uZSB0byBhZGQg
aGFzaCB0byBpbWFnZS4gIChtYXliZSBhIG5ldyB0YXNrLCAiYml0YmFrZSBvYm1jLXBob3NwaG9y
LWltYWdlIC1jIGFkZF9oYXNoIikNCg==
