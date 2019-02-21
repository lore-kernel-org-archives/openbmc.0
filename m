Return-Path: <Supreeth.Venkatesh@arm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=2a01:111:f400:fe06::61c;
 helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.b="a9A34TSU"; dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4451yy4QtJzDqS2
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 04:43:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afK/KR9xeaGKfgJucZsm+yy2EmHjxjFs9MetKtbdiZY=;
 b=a9A34TSUNW0bOX+HTBQ7uBvf2K32UmDmJrD+Qs9qR7H0Z3AHao9g38VF9JT6nLTWbXy8jnrITL/L5Ka8qDAO5QUtk2pAi+Ys8LmRmGXPzBJ/QkN+6+GUw60ZGvykOWBbeBnKXwU+FGgtCn39CBRcrmtWSRZyub5EcMvu/lfEZZA=
Received: from VI1PR08MB2799.eurprd08.prod.outlook.com (10.170.236.148) by
 VI1PR08MB3645.eurprd08.prod.outlook.com (20.177.61.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.22; Thu, 21 Feb 2019 17:42:59 +0000
Received: from VI1PR08MB2799.eurprd08.prod.outlook.com
 ([fe80::f9de:1ea0:91bd:c0d3]) by VI1PR08MB2799.eurprd08.prod.outlook.com
 ([fe80::f9de:1ea0:91bd:c0d3%2]) with mapi id 15.20.1643.014; Thu, 21 Feb 2019
 17:42:59 +0000
From: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
To: Tom Joseph <tomjose@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Alexander Amelkin <a.amelkin@yadro.com>,
 "benwei@fb.com" <benwei@fb.com>
Subject: RE: Proposal for pldmtool
Thread-Topic: Proposal for pldmtool
Thread-Index: AQHUx3HzBgo4VpNKI0Whms2PoW8ySKXqhf0A
Date: Thu, 21 Feb 2019 17:42:58 +0000
Message-ID: <VI1PR08MB2799DE313D14D5C96966A840807E0@VI1PR08MB2799.eurprd08.prod.outlook.com>
References: <3151516d-0aa1-465c-be01-44b3d837fbce@linux.vnet.ibm.com>
In-Reply-To: <3151516d-0aa1-465c-be01-44b3d837fbce@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Supreeth.Venkatesh@arm.com; 
x-originating-ip: [217.140.111.135]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25390576-fdad-4ac4-f72e-08d69824050c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:VI1PR08MB3645; 
x-ms-traffictypediagnostic: VI1PR08MB3645:
x-ms-exchange-purlcount: 3
x-microsoft-exchange-diagnostics: 1; VI1PR08MB3645;
 20:qbAXo1OnTKoIp7S7K+MO+8sJri4pbacsUnTndjPHDtbwQ7+qgXODB0HB28GbphqkOIm7gpwJnwltdSwtY/PcWUaCpp6W27oTJu4knhbPdpz0EWCxIbVKIIp5Pbsux+Ef+PMxbcev4rJwtu8Eq3ROJEX5xwD/UPoiYvcwdhsFqF8=
x-microsoft-antispam-prvs: <VI1PR08MB364585A2DBC71FE46B6F8729807E0@VI1PR08MB3645.eurprd08.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(376002)(366004)(346002)(396003)(13464003)(199004)(53754006)(40434004)(189003)(72206003)(6306002)(99286004)(102836004)(9686003)(53546011)(446003)(68736007)(476003)(478600001)(3480700005)(53936002)(486006)(316002)(11346002)(6436002)(110136005)(76176011)(71190400001)(6506007)(7696005)(5660300002)(229853002)(966005)(2906002)(7116003)(55016002)(8936002)(71200400001)(5024004)(86362001)(256004)(14444005)(2501003)(33656002)(66066001)(561944003)(106356001)(105586002)(25786009)(6246003)(97736004)(186003)(81156014)(305945005)(81166006)(74316002)(6116002)(14454004)(26005)(8676002)(7736002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3645;
 H:VI1PR08MB2799.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pu2Ac8pPszgZ1k+G5sAgPZ+3PSf3e9mbqEIYEy7B1W+N5pXKU4TfUafORzwVakRXCBhXSoXGY6GZYpvG5c707r+J9CHqc8opPq5m1KzTByGcu8mFtC7pPBxAFWXTDe5TMIHR5CJgz1gCCsMAAE2dhbT/Lv6e4c7+m3g9+IiLz2t9Pl3BO4hMb5bwSaLNBgCi2Mo+vm2TDs7O3e1o/2pXyMNWqaSAT57wUposNHX3rHTEsvH1+PeJJN2deEnuTxYAJiKhPEMsfcuSrAmClDRRlv2L1lm9e5g9KcCoKRDRfMctzxYtEGWZSKeB/zXbxrRzICNLkO70/bbjF7AAPdgCc8ea1ytpk9VB9YsC4Wr//sJ9lTw0uKpiKPlDQeXihDXn73ZRkdpoxLqGD+dFE+ZrO/pNRZ5nW8RT5sBcDZYZYKg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25390576-fdad-4ac4-f72e-08d69824050c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 17:42:58.9443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3645
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2019 17:43:08 -0000

VG9tLA0KDQpUaGFua3MgZm9yIHNlbmRpbmcgdGhpcyBvdXQgYXMgYSBmZWVsZXIuDQpUaGlzIHNv
dW5kcyBsaWtlIGEgbG9naWNhbCBuZXh0IHN0ZXAgYWZ0ZXIgaW1wbGVtZW50YXRpb24gb2YgUExE
TSBhbmQgTUNUUC4NCkhvd2V2ZXIsIEkgaGF2ZSBhIGNvdXBsZSBvZiBpbml0aWFsIHF1ZXN0aW9u
cy4NCg0KIiBBIHByb3Zpc2lvbiB0byBydW4gcGxkbXRvb2wgdGFyZ2V0aW5nIE9wZW5CTUMgb3Zl
ciBhIGN1c3RvbSBuZXR3b3JrIHBvcnQgYW5kIHJvdXRlIHRoZSByZXF1ZXN0IHRvIHRoZSBQTERN
IGRhZW1vbi4iDQoxLiBEbyB5b3UgdGhpbmsgaXQgaXMgb2sgdG8gdXNlIHRoaXMgYXMgZXh0ZXJu
YWwgaW50ZXJmYWNlIHRvIEJNQz8gSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCBJUE1J
IG9yIFJlZGZpc2ggd2VyZSBleHRlcm5hbCBmYWNpbmcgaW50ZXJmYWNlcyB0byBCTUMuDQogICAg
IFBMRE0gd2FzIGludGVuZGVkIGZvciBpbnNpZGUgdGhlIGJveCBjb21tdW5pY2F0aW9ucy4NCg0K
Mi4gV2h5IG5vdCB1c2UgUmVkZmlzaCBkZXZpY2UgZW5hYmxlbWVudCBmb3IgUExETSwgc28gdGhh
dCB0aGUgdG9vbCAodHlwaWNhbGx5IGh0dHAvcyBjbGllbnQpIHdpbGwgaXNzdWUgUExETSByZXF1
ZXN0cyBpbiB0aGUgZm9ybSBvZiBKc29uIHBheWxvYWQuDQoNCjMuIENhbiB5b3UgZGVzY3JpYmUg
dGhlIHVzZSBjYXNlIGZvciB0aGUgdG9vbCB0byBiZSBydW4gb24gaG9zdCBmaXJtd2FyZT8gSW4g
bXkgb3BpbmlvbiwgdGhpcyBpcyBoaWdobHkgdW5saWtlbHkgdGhvdWdoIGl0IGNhbiBiZSBydW4g
ZnJvbSBob3N0IHVzZXIgc3BhY2UuDQoNClRoYW5rcywNClN1cHJlZXRoDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogVG9tIEpvc2VwaCA8dG9tam9zZUBsaW51eC52bmV0LmlibS5j
b20+DQpTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDE4LCAyMDE5IDQ6MDkgQU0NClRvOiBPcGVuQk1D
IE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+OyBTdXByZWV0aCBWZW5rYXRlc2gg
PFN1cHJlZXRoLlZlbmthdGVzaEBhcm0uY29tPjsgQWxleGFuZGVyIEFtZWxraW4gPGEuYW1lbGtp
bkB5YWRyby5jb20+OyBiZW53ZWlAZmIuY29tDQpTdWJqZWN0OiBQcm9wb3NhbCBmb3IgcGxkbXRv
b2wNCg0KSGkgQWxsLA0KDQpJIHdhbnRlZCB0byBwdXQgZG93biBpbml0aWFsIHRob3VnaHRzIG9u
ICJwbGRtdG9vbCIgd2hpY2ggaXMgYSB1dGlsaXR5IGZvciBjb250cm9sbGluZyBQTERNIGVuYWJs
ZWQgZGV2aWNlcy4gVGhlIG5hbWluZyBvZiB0aGUgdXRpbGl0eSB3YXMgaW5mbHVlbmNlZCBieSBp
cG1pdG9vbCB3aGljaCBpcyBhIGNsaWVudCB1dGlsaXR5IHRvIGNvbnRyb2wgSVBNSSBlbmFibGVk
IGRldmljZXMuIFRoZSBwbGRtdG9vbCBhY3RzIGFzIHRoZSByZXF1ZXN0ZXIgYW5kIHNlbmRzIHRo
ZSBQTERNIG1lc3NhZ2UgdG8gdGFyZ2V0IGFueSBQTERNIGVuYWJsZWQgZGV2aWNlLiBUaGUgUExE
TSByZXNwb25zZSBtZXNzYWdlIGlzIHByb2Nlc3NlZCBhbmQgZXhwcmVzc2VkIGluIGh1bWFuIHJl
YWRhYmxlIGZvcm1hdC4gIFRoaXMgcHJvcG9zYWwgbmVlZHMgdG8gYmUgY29uc2lkZXJlZCBvbiB0
aGUgYmFzaXMgb2YgdGhlIHBsZG0gZGVzaWduIChodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9k
b2NzL2Jsb2IvbWFzdGVyL2Rlc2lnbnMvcGxkbS1zdGFjay5tZCkuDQpUaGVzZSBhcmUgcG9zc2li
bGUgcGxkbXRvb2wgdXNhZ2Ugc2NlbmFyaW9zLg0KDQoqIHBsZG10b29sIGNhbiBydW4gb24gT3Bl
bkJNQyBhbmQgY2FuIHRhcmdldCB0aGUgUExETSBkYWVtb24uIFBMRE0gZGFlbW9uIHdpbGwgaGF2
ZSBhIEQtQnVzIGludGVyZmFjZSB0byBhY2NlcHQgUExETSByZXF1ZXN0cy4NCiogcGxkbXRvb2wg
Y2FuIHRhcmdldCBvdGhlciBtYW5hZ2VtZW50IGNvbnRyb2xsZXJzIGNvbm5lY3RlZCB0byBCTUMg
aW1wbGVtZW50aW5nIFBMRE0gc3RhY2tzLg0KKiBBIHByb3Zpc2lvbiB0byBydW4gcGxkbXRvb2wg
dGFyZ2V0aW5nIE9wZW5CTUMgb3ZlciBhIGN1c3RvbSBuZXR3b3JrIHBvcnQgYW5kIHJvdXRlIHRo
ZSByZXF1ZXN0IHRvIHRoZSBQTERNIGRhZW1vbi4NCg0KVGhlc2UgYXJlIHRoZSBzb21lIG9mIHRo
ZSBzYWxpZW50IGZlYXR1cmVzIGluIHRoZSBwbGRtdG9vbCB0aGF0DQoNCiogUHJvdmlkZSB1c2Vy
IGZyaWVuZGx5IGNvbW1hbmQgb3B0aW9ucw0KKiBEZWJ1ZyBvcHRpb25zIHRvIHByaW50IGRldGFp
bGVkIFBMRE0gbWVzc2FnZXMuDQoqIExldmVyYWdlIGxpYm1jdHAgYW5kIGxpYnBsZG0gbGlicmFy
eSBnZXR0aW5nIGRldmVsb3BlZCBmb3IgY29tbXVuaWNhdGluZyB3aXRoIE1DVFAgbGF5ZXIgYW5k
IGZvciBlbmNvZGluZy9kZWNvZGluZyBQTERNIG1lc3NhZ2VzLg0KKGh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuYm1jL3BsZG0sIGh0dHBzOi8vZ2l0aHViLmNvbS9qay1vemxhYnMvbGlibWN0cCkNCg0K
VGhlIGhvc3QgZmlybXdhcmUgc3RhY2tzIHR5cGljYWxseSBoYXZlIHJ1bnRpbWUgY29uc3RyYWlu
dHMuIElmIHRoZXJlIGlzIGludGVyZXN0IGluIGhhdmluZyBwbGRtdG9vbCBydW4gb24gaG9zdCBm
aXJtd2FyZSB0aGVuIHBsZG10b29sIHdpbGwgaGF2ZSB0byBiZSB3cml0dGVuIGluIEMuIEFwYXJ0
IGZyb20gdGhpcyBjb25zaWRlcmF0aW9uIHRoZSBuYXR1cmFsIGNob2ljZSB3aWxsIGJlIHRvIGRl
dmVsb3AgdGhpcyBpbiBtb2Rlcm4gQysrLg0KDQpUaGlzIG1haWwgaXMgYSBmZWVsZXIgdG8gc2Vl
ayB0aGUgaW50ZXJlc3RzIG9mIHRoZSBjb21tdW5pdHkuIEkgd2lsbCBiZSBrZWVuIHRvIGZvbGxv
dy11cCB0aGlzIHdpdGggYSBkZXNpZ24gdGVtcGxhdGUuDQoNClRoYW5rcywNClRvbQ0KDQpJTVBP
UlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1l
bnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBh
cmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBp
bW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIg
cGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZv
cm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo=
