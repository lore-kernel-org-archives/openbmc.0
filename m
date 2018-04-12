Return-Path: <prvs=76408eb6e3=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=76408eb6e3=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ZwWXaBAM"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="F8K8yQuD"; dkim-atps=neutral
X-Greylist: delayed 1261 seconds by postgrey-1.36 at bilbo;
 Fri, 13 Apr 2018 07:52:32 AEST
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40MZQ80HTczDqwP
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 07:52:30 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3CLU3tr015598; Thu, 12 Apr 2018 14:31:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=+txBI5Yysfmsj95kCq51UEJvrM5IjWIWFI7eBnLW8Jo=;
 b=ZwWXaBAM1QxU73CpYoFc8ik1GloNYwnTyRL3yGzU4A1ckV3Wte0q8qYRzJFkEHKoXJq+
 uqFoxfZWt7p1hvimYUMEvbbB05zuhLX/4m2HWfaq0vxvvRAJCSr349B20xHZjcgTfbsn
 +6VtF0DkHwHZH6B4wWULKALLhbWdDBXN7tc= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2haex5g1y4-15
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 12 Apr 2018 14:31:17 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.31) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Thu, 12 Apr 2018 17:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=+txBI5Yysfmsj95kCq51UEJvrM5IjWIWFI7eBnLW8Jo=;
 b=F8K8yQuDewESLX/rwhUfzYT1ekGHxC/zn8dIHlo35nuPVvYxsICCTapA3SFHq0c6k32VkHccjfO/hqqZHTDnF8kBfVuWMZNKP6pJpb+BCNfQAqtz7xvAoe2xHTTUCYKX5kggqaqDFM3FDahazNNPGw6+ZsYIkHxizJS6yRO0uMY=
Received: from MWHPR15MB1437.namprd15.prod.outlook.com (10.173.234.139) by
 MWHPR15MB1808.namprd15.prod.outlook.com (10.174.255.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.675.10; Thu, 12 Apr 2018 21:31:11 +0000
Received: from MWHPR15MB1437.namprd15.prod.outlook.com
 ([fe80::2d63:bfd8:e790:6a46]) by MWHPR15MB1437.namprd15.prod.outlook.com
 ([fe80::2d63:bfd8:e790:6a46%18]) with mapi id 15.20.0675.012; Thu, 12 Apr
 2018 21:31:11 +0000
From: Sai Dasari <sdasari@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: reference platforms?
Thread-Topic: reference platforms?
Thread-Index: AQHT0oV3HSGosSk8FkW47BlaOkTC8aP9MMIA
Date: Thu, 12 Apr 2018 21:31:11 +0000
Message-ID: <4723874F-4115-4E9E-90D5-4DC2C52EF326@fb.com>
References: <1A67395A-9FF6-4DC2-AD43-2C80308F6608@fuzziesquirrel.com>
In-Reply-To: <1A67395A-9FF6-4DC2-AD43-2C80308F6608@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:9791]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1808;
 7:8Dwn25/C3mUedjIh15VaPTWdOvDPxEtAOWQpaGuqk0AtzIICg6gEOxZJU1Dx6dqYlQ+GW+uGjE9daRpi/bXfZqUqLXbbwEo2PYbBfKyK8/D9KfW99dlrVKrPa2OoXXnvuOUmlwSU25ZTCTg8nckPiV1yg9SG7+xAqFUsXzMnrzeX/TPPTZXDlMqoV/YlYE8+0EuoEBzWZkTlx/sXwSWq9uDSV9tioC2dt3ZIHiXGfNtm8637qXQl65jPyiLMkt2R;
 20:11ikFApF9opr4yd1VKhgASdcFA3rzUvry4y3FlBWQrBMjhA4w4IiYt72VF420VFCGOe5KthLiefDzFcpDKihY/PmYYdB//DKl7NbTR/fnL3MGSwOGZlbhAzuyAMp3lCmWG6i+JqIkBksXdFb60oK5D/CfUOzTSWnHAV/2wQT9qc=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1808; 
x-ms-traffictypediagnostic: MWHPR15MB1808:
x-microsoft-antispam-prvs: <MWHPR15MB18084A6D0618BC6736AF92FFCEBC0@MWHPR15MB1808.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(65623756079841)(5213294742642);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231232)(11241501184)(944501327)(52105095)(3002001)(93006095)(93001095)(10201501046)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(6072148)(201708071742011);
 SRVR:MWHPR15MB1808; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1808; 
x-forefront-prvs: 06400060E1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(346002)(376002)(39380400002)(366004)(189003)(199004)(51444003)(36756003)(6486002)(97736004)(110136005)(5250100002)(2906002)(7736002)(25786009)(68736007)(3660700001)(186003)(3480700004)(486006)(6436002)(478600001)(3280700002)(7116003)(86362001)(561944003)(33656002)(5660300001)(105586002)(6116002)(2900100001)(8676002)(53936002)(82746002)(99286004)(6506007)(6246003)(6512007)(76176011)(305945005)(59450400001)(81156014)(46003)(81166006)(102836004)(11346002)(2616005)(229853002)(106356001)(476003)(8936002)(316002)(14454004)(83716003)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1808;
 H:MWHPR15MB1437.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: QWAgn+NsAk8ZNT3RQzm0Aiivhce25VwGy8gHXuntXu1ibcxPsVsr8oaCPeOkDJsi5cJON47HiYr4D7llHqHr5MSSB2vGdloxOW2NWFNwQD8c3qfcttKskVcgOWn+VjsQwhn/n5Qm5JLBgyLoFryeGiLZhNDUpJmTUuy4bTNbPwV7t/eS36NQih83KR/NxvC0
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E48841E6D01F94E8028BE105D963041@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 7df79c36-b422-4cfd-116f-08d5a0bcb679
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df79c36-b422-4cfd-116f-08d5a0bcb679
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2018 21:31:11.7226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1808
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-12_12:, , signatures=0
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
X-List-Received-Date: Thu, 12 Apr 2018 21:52:33 -0000

DQoNCu+7v09uIDQvMTIvMTgsIDEwOjQxIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQnJhZCBC
aXNob3AiIDxvcGVuYm1jLWJvdW5jZXMrc2Rhc2FyaT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBv
biBiZWhhbGYgb2YgYnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPiB3cm90ZToNCg0KICAgIEkg
dGhpbmsgaW4gdGhlIG5vdC10b28tZGlzdGFudC1mdXR1cmUgd2UgYXJlIGdvaW5nIHRvIG5lZWQg
YSBjb25jZXB0IG9mIHJlZmVyZW5jZQ0KICAgIHBsYXRmb3Jtcy4NCiAgICANCiAgICBvcGVuYm1j
L29wZW5ibWMgaXMgZXNzZW50aWFsbHkgdGhlIHNhbWUgdGhpbmcgYXMgUG9reS4gIEEgc3VwZXIt
cmVwbw0KICAgIG9mIG90aGVyIHVwc3RyZWFtIHJlcG9zIChiaXRiYWtlLCBvZS1jb3JlLCBldGPi
gKYpLiAgT3VyIHVwc3RyZWFtIHJlcG9zDQogICAganVzdCBoYXBwZW4gdG8gYmUgZGlmZmVyZW50
IHRoaW5ncyBsaWtlIHBva3ksIG1ldGEtdmlydHVhbGl6YXRpb24sIG1ldGEtcGhvc3Bob3IsDQog
ICAgbWV0YS1hc3BlZWQsIGV0Yy4NCiAgICANCiAgICBCdXQgdGhlIHNpbWlsYXJpdHkgZW5kcyB3
aGVuIHlvdSBsb29rIGF0IHRoZSBwbGF0Zm9ybXMgc3VwcG9ydGVkLiAgUG9reQ0KICAgIGhhcyBh
IHNldCBvZiByZWZlcmVuY2UgcGxhdGZvcm1zLiAgQW55IG90aGVyIHBsYXRmb3JtcyBvciBkaXN0
cm9zIHVzaW5nDQogICAgUG9reSBhcmUgbm90IHRoZSBZb2N0byBwcm9qZWN0cyBjb25jZXJuIC0g
dGhleSBhcmUgY29tcGxldGVseSBtYWludGFpbmVkDQogICAgYnkgdGhlIHByb2plY3QgdGhhdCB1
c2VzIFBva3kgKGxpa2UgdXMhKS4NCiAgICANCiAgICBUaHVzIGZhciB3ZSBoYXZlIG5vdCByZWFs
bHkgcHV0IGFueSBmaWx0ZXIgb24gd2hhdCBtYWNoaW5lcyB5b3UgZ2V0DQogICAgd2hlbiB5b3Ug
Y2xvbmUgb3BlbmJtYy9vcGVuYm1jLiAgSSB0aGluayB0aGF0IG5lZWRzIHRvIGNoYW5nZSB0byBh
IG1vZGVsDQogICAgbGlrZSB0aGUgb25lIHRoZSBZb2N0byBwcm9qZWN0IHVzZXMuICBUaGUgY2xl
YXIgYmVuZWZpdHMgSSBzZWUgdG8gdGhhdA0KICAgIGFyZToNCiAgICANCiAgICAtIEl0IGFkZHJl
c3NlcyBhIHNjYWxpbmcgcHJvYmxlbSBpbiB0aGUgb3BlbmJtYy9vcGVuYm1jIHJlcG9zaXRvcnku
ICBXZQ0KICAgIGFyZSBvbiB0cmFjayB0byByZXBlYXQgdGhlIG1pc3Rha2VzIG9mIHRoZSBvcGVu
ZW1iZWRkZWQgcHJvamVjdCB0aGF0IGxlZA0KICAgIHRvIHRoZSBmb3JtYXRpb24gb2YgUG9reSBp
biB0aGUgZmlyc3QgcGxhY2UuICBUaGF0IGlzLCB3ZSBjYW5ub3QgYWRkIG5ldw0KICAgIHBsYXRm
b3JtIGFuZCBCU1AgbGF5ZXJzIGluZGVmaW5pdGVseS4gIEF0IHNvbWUgcG9pbnQgaXQgd2lsbCBi
ZWNvbWUNCiAgICB1bm1hbmFnZWFibGUuICBQYXJ0IG9mIG1lIHdvbmRlcnMgaWYgd2UgYXJlIGFs
cmVhZHkgdGhlcmUuDQo+PlRvIHVuZGVyc3RhbmQgbW9yZSwgaXMgdGhlIHByb3Bvc2FsIHRvIHJl
bW92ZSB0aGUgYnNwL21hY2hpbmVzIGxheWVycyBpLmUuIG1ldGEtb3BlbmJtYy1ic3AgYW5kIG1l
dGEtb3BlbmJtYy1tYWNoaW5lcz8gSSB3b25kZXIgaG93IHRvIGZpbmQgdGhlIHJlYWwgQlNQL21h
Y2hpbmVzIHRoYXQgYXJlIHN1cHBvcnRlZCBieSBPcGVuQk1DLiBEb2VzIGVhY2ggb3BlbmJtYyBh
ZG9wdGVyIGVuY291cmFnZWQgdG8gbWFpbnRhaW5zIGluZGVwZW5kZW50IGdpdGh1YiByZXBvIHdp
dGggcmVjaXBlcyBuZWVkZWQgdG8gYnJpbmcgaW4gdGhlIG9wZW5ibWMgY29kZSBhbmQgYnVpbGQg
Zm9yIHRoZWlyIHN1cHBvcnRlZCBtYWNoaW5lcz8gDQoNCiAgICAtIFRlc3RpbmcuICBPYnZpb3Vz
bHkgYSBkZXZlbG9wZXIgY2Fubm90IHRlc3QgYSBwYXRjaCBvbiAxMDAgcGxhdGZvcm1zIG9yDQog
ICAgMTAgZGlmZmVyZW50IFNPQ3MuICBTbyB3aGF0IGlzIHRoZSBkZXZlbG9wZXIgZXhwZWN0ZWQg
dG8gdGVzdCBvbj8gIEEgcmVmZXJlbmNlDQogICAgcGxhdGZvcm0uICBUaGVuIHdobyB0ZXN0cyB0
aGUgb3RoZXIgc3lzdGVtcz8gIFRoZSBtYWludGFpbmVycyBvZiB0aG9zZQ0KICAgIHN5c3RlbXMu
ICBBZG9wdGluZyB0aGUgc2FtZSBtb2RlIG9mIHRoaW5raW5nIGFzIFBva3kgbWFrZXMgdGhpcyBk
aXN0aW5jdGlvbg0KICAgIGNsZWFyLg0KICAgIA0KICAgIFNvIHdoYXQgZG9lcyBldmVyeW9uZSB0
aGluayBvZiB0aGUgaWRlYSBvZiByZWZlcmVuY2UgcGxhdGZvcm1zPyAgQ2FuDQogICAgdGhleSBo
ZWxwIHRoZSBPcGVuQk1DIHByb2plY3Q/DQogICAgDQogICAgU28gdGhlIG9idmlvdXMgbmV4dCBx
dWVzdGlvbiBpc+KApndoYXQgYXJlIHRoZSBtZXRyaWNzIGZvciBkZWZpbmluZyByZWZlcmVuY2UN
CiAgICBwbGF0Zm9ybXM/ICBJIHByZWRpY3QgZmluZGluZyB0aGUgYW5zd2VyIHRvIHRoYXQgd2ls
bCBiZSBhIGNoYWxsZW5nZSA6LSkuDQogICAgDQogICAgR28gYWhlYWQgYW5kIHRocm93IGNyYXp5
IGlkZWFzIG91dCB0aGVyZS4gIFBheSBtb25leSB0byB0aGUgcHJvamVjdD8gIE1vc3QNCiAgICBk
YXlzIHdpdGhvdXQgYSBjb21waWxlIGZhaWx1cmU/ICBUaGVyZSBhcmUgYWJvdXQgYSBtaWxsaW9u
IHRoaW5ncyB3ZSBjb3VsZA0KICAgIGRvIGhlcmUgLSBidXQgd2hhdCBkb2VzIGV2ZXJ5b25lIGZp
bmQgZmFpcj8NCj4+IFdpdGggdGhlIG5hdHVyZSBvZiBPcGVuQk1DIHN1cHBvcnRpbmcgZmVhdHVy
ZXMgbmVlZGVkIGZvciBkaXZlcmdlbnQvaGV0ZXJvZ2VuZW91cyBoYXJkd2FyZSwgaXQgbWlnaHQg
YmUgaGFyZCB0byBkZWZpbmUgdGhlIHJlZmVyZW5jZSBwbGF0Zm9ybShzKS4gT25lIChjcmF6eSkg
aWRlYSB3b3VsZCBiZSB0byBjb21lIHVwIHdpdGggYSBtaW5pbXVtIGFjY2VwdGFuY2UgdGVzdCBz
dWl0ZSAod2hpY2ggY2FuIGJlIGF1dG9tYXRlZCkgdGhhdCB2YWxpZGF0ZXMgYWxsIHRoZSBjb3Jl
IGZlYXR1cmVzIGFuZCB1c2UgdGhpcyBmb3IgYWNjZXB0aW5nIG5ldyBwbGF0Zm9ybXMgYXMgcmVm
ZXJlbmNlIHBsYXRmb3JtcyBmcm9tIGNvbW11bml0eS4NCiAgICB0aHggLSBicmFkDQoNCg==
