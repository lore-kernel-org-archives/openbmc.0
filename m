Return-Path: <prvs=76417c778d=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=76417c778d=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="i9buPy4G"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="NCgQAWIy"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40NF684C7bzF1Rv
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 09:55:56 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3DNquU6016022; Fri, 13 Apr 2018 16:55:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=KetZHmg6r+Ft47qlyyjv7uN0iOCNOurZTa4EroUu1PU=;
 b=i9buPy4G2tnS+cXcBzQhvk2vcZNPdLby+I5Mvi4TyXXzdZR4DKPkIvslp4yYhxwtmy1A
 PIR5HMSkJo/8N8P7dlnnXWdSfAdVthSXkGb07064ohkWn/703A6yU2jdQ2YAaqEPyyy9
 d6Y9aagJeVmLydaDFcfbqUehkwV1w6Hggl4= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2hb62q02an-3
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Apr 2018 16:55:52 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.27) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Fri, 13 Apr 2018 19:55:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=KetZHmg6r+Ft47qlyyjv7uN0iOCNOurZTa4EroUu1PU=;
 b=NCgQAWIyHfw9uYnrSJfZqFD0DORPGvGAuzwxIJt9q83/GdqBIy5Tit195Te8Lhvb9sVQMFLwZ2HEB1BqXhezgcXL9FXxBhWPUErUgvoeaJx00SRaeX3Hp9ZA+iE8GgYyFKBN0eRY06ruJMkSL1I53vMp3XjKttnlN9kOovrGouI=
Received: from MWHPR15MB1437.namprd15.prod.outlook.com (10.173.234.139) by
 MWHPR15MB1792.namprd15.prod.outlook.com (10.174.255.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.675.10; Fri, 13 Apr 2018 23:55:45 +0000
Received: from MWHPR15MB1437.namprd15.prod.outlook.com
 ([fe80::2d63:bfd8:e790:6a46]) by MWHPR15MB1437.namprd15.prod.outlook.com
 ([fe80::2d63:bfd8:e790:6a46%18]) with mapi id 15.20.0675.012; Fri, 13 Apr
 2018 23:55:45 +0000
From: Sai Dasari <sdasari@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: reference platforms?
Thread-Topic: reference platforms?
Thread-Index: AQHT0oV3HSGosSk8FkW47BlaOkTC8aP9MMIAgAF6eYCAAEA+gA==
Date: Fri, 13 Apr 2018 23:55:45 +0000
Message-ID: <FA93D326-6F39-4E5F-8A51-1ED819BFF0F1@fb.com>
References: <1A67395A-9FF6-4DC2-AD43-2C80308F6608@fuzziesquirrel.com>
 <4723874F-4115-4E9E-90D5-4DC2C52EF326@fb.com>
 <650906BF-A79F-467F-B9C7-4CD3C9730E19@fuzziesquirrel.com>
In-Reply-To: <650906BF-A79F-467F-B9C7-4CD3C9730E19@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:69d]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1792;
 7:w+TfbxsH6FIBhJYQaF/NyusLgkfUG2sf3GPPI1HKv19aPmuEBX3uJAYmG21lveFYRTBQf53KQ59RTQh9EnUYSmgw7sU0QlkjONR2Ay7GPCD1OiExbYlnhiJIK2IbMGbmrAZag1OyYPxBbwMEOqtFMROVBWHrfBDTgFeKJojjkGj97YOaYfS9hXoqg/uC0m5U0uuH1prDKmZ1sblIhaS1mrLU/R45lC7Asc6VF50mdEdU3N2U8qd+0wZjn9BUYhdI;
 20:qiPZg9oT7p+9Ak10bnBVZh2wadmoeV0hyqvY2YMsDsYESbujjARSebZNEpeWTgx7wJRuyI4tz/jWfzA5g5+JXQjZHzY9dgqlQG8nKWGsDJVDJ0zzx4Ns/CL6xEy093WEfm6an5E3FmRg0BC/5eLifi3Z7jfk3282FzfLOKUe6aQ=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1792; 
x-ms-traffictypediagnostic: MWHPR15MB1792:
x-microsoft-antispam-prvs: <MWHPR15MB179260F0476462AEAC211E22CEB30@MWHPR15MB1792.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(3231232)(11241501184)(944501327)(52105095)(93006095)(93001095)(6041310)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011);
 SRVR:MWHPR15MB1792; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1792; 
x-forefront-prvs: 0641678E68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(39380400002)(396003)(376002)(39860400002)(189003)(199004)(6512007)(59450400001)(4326008)(6916009)(6116002)(83716003)(53936002)(2616005)(102836004)(476003)(486006)(86362001)(5250100002)(14454004)(316002)(97736004)(6436002)(5660300001)(7116003)(446003)(11346002)(36756003)(305945005)(6506007)(6486002)(68736007)(8676002)(81156014)(8936002)(46003)(2900100001)(105586002)(33656002)(76176011)(25786009)(7736002)(99286004)(106356001)(186003)(3660700001)(6246003)(3280700002)(82746002)(2906002)(3480700004)(81166006)(229853002)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1792;
 H:MWHPR15MB1437.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: /LT3SLKzrtq/XFqdBMpdWki3eSpzU9b4RXmz4mBkaWATf9b+0QCdvz3626H5SqeKo9/I1SXG+pmFR99pZ3Vk7j9TQ07wvbnHroyK7mUcfqHzzq2IWa6Xgz12THKkGoLZ5RIuVpDnntUKUOtQLDrn6mfoYfTX5vqvioI5qi3GimWM63gIjCQgqLfaytU/9boI
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF6332BEDC9AFA499591960FBB304B7F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 3694e5e2-8a6c-4a12-6649-08d5a19a12a3
X-MS-Exchange-CrossTenant-Network-Message-Id: 3694e5e2-8a6c-4a12-6649-08d5a19a12a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2018 23:55:45.0964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1792
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-13_13:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
X-List-Received-Date: Fri, 13 Apr 2018 23:56:02 -0000

ICAgIA0KICAgIA0KICAgIFdoYXQgZG9lcyB0aGF0IG1lYW4gZXhhY3RseT8gIFNvbWV0aGluZyBs
aWtlIHlvdSBjYW4gZG8gdGhpcyBhbmQgaXQgd29ya3M6DQogICAgICBnaXQgY2xvbmUgZ2l0aHVi
LmNvbS9vcGVuYm1jL29wZW5ibWMNCiAgICAgIGNkIG9wZW5ibWMNCiAgICAgIGdpdCBjbG9uZSBn
aXRodWIuY29tLzxhd2Vzb21lLWNvbXBhbnk+L215LW9ibWMtbWFjaGluZS1sYXllcg0KICAgICAg
Yml0YmFrZSBvYm1jLXBob3NwaG9yLWltYWdlDQogICAgDQogICAgQW5kIGlmIHlvdSBhc2sgdGhl
IHF1ZXN0aW9uIGluIHRoaXMgd2F5LCBJ4oCZbSBub3Qgc3VyZSB3aGF0IHRoZSBhbnN3ZXIgaXMu
DQogICAgSG93IGRvIHlvdSBmaW5kIGFsbCB0aGUgbGF5ZXJzIHRoYXQgd29yayB3aXRoIFBva3k/
ICBDYW4geW91IGVsYWJvcmF0ZSBvbg0KICAgIHdoeSB0aGUgYW5zd2VyIG1pZ2h0IGJlIGltcG9y
dGFudCB0byBzb21lb25lPyAgSXQgaXMgYSBmYWlyIHF1ZXN0aW9uIGJ1dCBJDQogICAgY2FuIHRl
bGwgeW91IHRoYXQgaXQgaXNuJ3Qgb25lIHRoYXQgSUJNIGZvciBleGFtcGxlIG5lZWRzIGFuc3dl
cmVkIGluIG9yZGVyDQogICAgZm9yIHRoZSBwcm9qZWN0IG1lZXQgaXRzIHByb2R1Y3QgZGV2ZWxv
cG1lbnQgbmVlZHMuDQpZb3VyIHByb3Bvc2VkIGNoYW5nZXMgYXJlIGdvb2QgZnJvbSBzY2FsaW5n
IHRoZSBkZXZlbG9wbWVudC4gTXkgb3JpZ2luYWwgcXVlc3Rpb24gd2FzIGZyb20gdGhlIGVuZC11
c2VyIHBvaW50IG9mIHZpZXcgd2hvIGFjcXVpcmVzIGJ1bmNoIG9mIE9DUCBtYWNoaW5lcyBhbmQg
dHJpZXMgdG8gZmluZCBhIHdheSB0byBidWlsZCBPcGVuQk1DIGZvciB0aG9zZSBtYWNoaW5lcy4g
SSB3YXMgd29uZGVyaW5nIGlmIHdlIGNhbiBwb2ludCB0aG9zZSBlbmQtdXNlcnMgdG8gb25lIHVu
aWZpZWQgcmVwbyBAICJnaXRodWIuY29tL29wZW5ibWMiIGFuZCBhbGxvdyB0aGVtIHRvIGJ1aWxk
IE9wZW5CTUMgYmluYXJ5IGZvciB0aGF0IHBsYXRmb3JtLiBUaGUgb3RoZXIgb3B0aW9uIHdvdWxk
IGJlIGZvciB0aGVtIHRvIGxldCB0aGVtIGZpZ3VyZSBvdXQgdGhlIHJlcG8gZm9yIHRoYXQgbWFj
aGluZSBlLmcuICJnaXRodWIuY29tLzxhd2Vzb21lLWNvbXBhbnk+Ii4gSSB0aGluayBhbnkgb2Yg
dGhlc2UgbWV0aG9kcyB3aWxsIHdvcmsgaW4gcHJhY3RpY2UuIA0KICAgIA0KICAgIFB1dCBhbm90
aGVyIHdheSwgd2UgX2NvdWxkXyBidWlsZCB0aGUgYW5zd2VyIHRvIHRoZSBxdWVzdGlvbiBpbnRv
IHRoZQ0KICAgIGNvcmUgb2YgdGhlIHByb2plY3QsIGJ1dCB3aHkgKGFuZCBhdCB3aGF0IGNvc3Qg
dG8gdGhlIHByb2plY3TigJlzIGFiaWxpdHkNCiAgICB0byBzY2FsZSk/ICBTb21lb25lIGNvdWxk
IGFsc28ganVzdCBob3N0IGEgbGlzdCBzb21ld2hlcmUsIG9yIG1heWJlIGENCiAgICBsYXllci1p
bmRleCBsaWtlIE9FIGhhcz8NCiAgICANCiAgICA+IERvZXMgZWFjaCBvcGVuYm1jIGFkb3B0ZXIg
ZW5jb3VyYWdlZCB0byBtYWludGFpbnMgaW5kZXBlbmRlbnQgZ2l0aHViIHJlcG8gd2l0aCByZWNp
cGVzIG5lZWRlZCB0byBicmluZyBpbiB0aGUgb3BlbmJtYyBjb2RlIGFuZCBidWlsZCBmb3IgdGhl
aXIgc3VwcG9ydGVkIG1hY2hpbmVzPyANCiAgICANCiAgICBJIHRoaW5rIHNvLiAgVGhlIHNwZWNp
ZmljcyBvZiB3aGF0IHRoZSBhZG9wdGVyIGRvZXMvbWFpbnRhaW5zIGFyZSB1cCB0bw0KICAgIHRo
ZSBhZG9wdGVyLiAgV2hhdCBhcmUgc29tZSBwcm9zL2NvbnMgb2YgYSBtb2RlbCBsaWtlIHRoYXQ/
ICBUaGlzIGlzIHdoYXQNCiAgICBtb3N0IGV2ZXJ5b25lIGlzIGRvaW5nIGFscmVhZHkuICBUaGV5
IGZvcmsgc29tZSBwYXJ0IG9mIHRoZSBwcm9qZWN0IChvcg0KICAgIGFsbCBvZiBpdCksIGJ1aWxk
IG9uIGl0IChtb3N0bHkgaW4gYSBtYWNoaW5lIGxheWVyPyAgaG9wZWZ1bGx5PykgIGFuZCB0aGVu
DQogICAgbWF5YmUvbWF5YmUgbm90IGNvbnRyaWJ1dGUgc29tZXRoaW5nIG9mIHdoYXQgdGhleSBk
aWQgYmFjayB0byB0aGUgdXBzdHJlYW0NCiAgICBwcm9qZWN0LiAgSXQgaXMgbXkgZ3Vlc3MgdGhh
dCB0aGlzIGlzIHRoZSB1c3VhbCB3YXkgaW4gd2hpY2ggcHJvZHVjdA0KICAgIGRldmVsb3BtZW50
IHRlYW1zIHVzZSBGTE9TUy4NCkkgYW0gc3VyZSBGTE9TUyBhbGxvd3MgZm9ya3MsIGJ1dCBmb3Ig
dGhlIGJlbmVmaXQgb2YgY29tbXVuaXR5LCBpdCB3b3VsZCBiZSBnb29kIHRvIGVuY291cmFnZSBj
b250cmlidXRpb24gdG8gdGhlIHVwc3RyZWFtIG9wZW5ibWMgcmVwby4gV2hpbGUgaXQgaGVscHMg
dG8gc2NhbGUgdG8gc2VwYXJhdGUgbWFjaGluZSBsYXllciByZXBvIG91dHNpZGUgb2YgdXBzdHJl
YW0sIEkgaGF2ZSBjb25jZXJuIHRoYXQgdGhlIGFkb3B0ZXIncyBmb2N1cyB3b3VsZCBzaGlmdCBh
d2F5IGZyb20gdXBzdHJlYW0gdG8gdGhhdCBleHRlcm5hbCByZXBvLiBUaGlzIG1pZ2h0IGhhdmUg
c2lkZS1lZmZlY3Qgb2YgZHVwbGljYXRlIHdvcmsgaW4gaW5kZXBlbmRlbnQgcmVwb3MgKG1pZ2h0
IGhhdmUgZ29vZCBpbnRlbnRpb24gb2YgdXBzdHJlYW1pbmcgbGF0ZXIpLCBhcyBvcHBvc2VkIHRv
IGlkZWFsIHdvcmsgZmxvdyAoaW4gbXkgbWluZCkgb2Ygeyd1cHN0cmVhbS1maXJzdCctPiBjaGVy
cnkgcGljayB0byBleHRlcm5hbCByZXBvfS4gDQogICAgDQogICAgPiBPbmUgKGNyYXp5KSBpZGVh
IHdvdWxkIGJlIHRvIGNvbWUgdXAgd2l0aCBhIG1pbmltdW0gYWNjZXB0YW5jZSB0ZXN0IHN1aXRl
ICh3aGljaCBjYW4gYmUgYXV0b21hdGVkKSB0aGF0IHZhbGlkYXRlcyBhbGwgdGhlIGNvcmUgZmVh
dHVyZXMgYW5kIHVzZSB0aGlzIGZvciBhY2NlcHRpbmcgbmV3IHBsYXRmb3JtcyBhcyByZWZlcmVu
Y2UgcGxhdGZvcm1zIGZyb20gY29tbXVuaXR5Lg0KICAgIA0KICAgIFRoaXMgaXMgdGhlIG9wcG9z
aXRlIG9mIGNyYXp5IFNhaSA6LSkNCiAgICANCiAgICBJIGxpa2UgaXQsIHdpdGggYSB0d2Vhay9j
bGFyaWZpY2F0aW9uLiAgUmVtZW1iZXIgdGhhdCBvbmUgb2YgdGhlIHBvaW50cyBvZg0KICAgIGEg
cmVmZXJlbmNlIHBsYXRmb3JtIGlzIHRvIGVuYWJsZSByZWdyZXNzaW9uIHRlc3RpbmcgZm9yIHRo
ZSBwcm9qZWN0LiAgU28NCiAgICB3aGVuIHNvbWVvbmUgY2hhbmdlcyB0aGUgY29tbW9uIGNvZGUg
aW4gcGhvc3Bob3ItaHdtb24gZm9yIGluc3RhbmNlLCB3ZSBuZWVkDQogICAgYSB3YXkgdG8gdGVz
dCB0aGF0IGl0IGlzbuKAmXQgZ29pbmcgdG8gYnJlYWsgYXMgbWFueSBPcGVuQk1DIHVzZXJzIGFz
IHdlIGNhbiwNCiAgICB3aXRob3V0IG5lZWRpbmcgdG8gdGVzdCBhbGwgdGhlaXIgcGxhdGZvcm1z
IGZvciB0aGVtLg0KICAgIA0KICAgIFNvIG15IGNsYXJpZmljYXRpb24gaXMgdGhhdCB0aGUgYWNj
ZXB0YW5jZSB0ZXN0IHdvdWxkIG5vdCBtZWFzdXJlIGhvdyB3ZWxsDQogICAgYSBtYWNoaW5lIG1l
ZXRzIGVuZC11c2VyIHJlcXVpcmVtZW50cywgYnV0IHJhdGhlciBob3cgd2VsbCBhIG1hY2hpbmUg
bWFrZXMNCiAgICB1c2Ugb2YgdGhlIHByb2plY3TigJlzIGNvbW1vbiBjb2RlLiAgTWF5YmUgYSBt
ZXRyaWMgbWVhc3VyZWQgYnkgdGhlIHRlc3QgY291bGQNCiAgICBiZSBzb21ldGhpbmcgbGlrZSBs
ZWFzdCBudW1iZXIgb2YgZGV2aWF0aW9ucyBmcm9tIHRoZSBkZWZhdWx0cz8NCkxvb2tzIGdvb2Qg
bWV0cmljIHRvIG1lIGZvciB2YXJpb3VzIGFwcGxpY2F0aW9uIGxldmVsIHNlcnZpY2UvZGFlbW9u
cy4gU3RpbGwgbm90IHN1cmUgaG93IHRoZSBjb2RlIGNoYW5nZXMgc3BlY2lmaWMgdG8gaGFyZHdh
cmUgY2FuIGJlIHJlZ3Jlc3Npb24gdGVzdGVkIGUuZy4gS0NTIHZzLiBCVCwgSVBNQiwgTkMtU0kg
ZXRjLg0KICAgIA0KICAgIA0KICAgIA0KDQo=
