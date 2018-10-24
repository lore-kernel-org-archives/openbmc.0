Return-Path: <prvs=38350c4984=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=38350c4984=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="NQswacTp"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ZNFSkhcG"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42gHXz1VKMzDrBy
 for <openbmc@lists.ozlabs.org>; Thu, 25 Oct 2018 04:38:21 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.22/8.16.0.22) with SMTP id w9OHaucD012031;
 Wed, 24 Oct 2018 10:38:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=go02JWbHWc39Xj/un5zTeu/6+vt0P/W3g9NO27kP06w=;
 b=NQswacTptBC2mwTWUxIdvtr18pP5K6rVnLvAJqO7Iyi50zs5m+9TG9fhrcV3kI3K64Nf
 D9V8KArFFg33VDShAVvDQyIXkr+dCXUMUCXJJjiRW/oMg2GDL/G6jBEeWZXFupmvtqKx
 9hGc3lfMJ7QFfMQNGzsroHP7ju6EwewP1z4= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2natge0tnv-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 24 Oct 2018 10:38:16 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 24 Oct 2018 10:38:14 -0700
Received: from PRN-CHUB14.TheFacebook.com (2620:10d:c081:35::23) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Wed, 24 Oct 2018 10:38:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.24) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Wed, 24 Oct 2018 10:38:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=go02JWbHWc39Xj/un5zTeu/6+vt0P/W3g9NO27kP06w=;
 b=ZNFSkhcGrmCKP2d3RQkO35t+1SopylKF8Sa67jgx2wZiwlGnj2dXvjQU/uJtKvIfITYaCNubsbjJK8gzJz4iqgO1I+nt8CI2wp3699E2O2rsvdWM3XiETJHMYwaKU/AFqP0hOXC3HwLolJt+w3qFbx60WkZqb6Gk8hRtiLjei68=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1550.namprd15.prod.outlook.com (10.173.235.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1250.30; Wed, 24 Oct 2018 17:38:12 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::354d:367f:c2b5:94eb]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::354d:367f:c2b5:94eb%5]) with mapi id 15.20.1250.028; Wed, 24 Oct 2018
 17:38:12 +0000
From: Sai Dasari <sdasari@fb.com>
To: Artem Senichev <artemsen@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Host console logs service
Thread-Topic: Host console logs service
Thread-Index: AQHUa7IxFHXQI+tkOEWQG4/xfkodGaUuM+2A
Date: Wed, 24 Oct 2018 17:38:11 +0000
Message-ID: <601A1A07-A444-4602-AC42-7E686B1CE03A@fb.com>
References: <CAHsrh9+PQ9GKX7DMMC8oAdvNEamsw5dbfRmiTSi3kWuA6j0R_g@mail.gmail.com>
In-Reply-To: <CAHsrh9+PQ9GKX7DMMC8oAdvNEamsw5dbfRmiTSi3kWuA6j0R_g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:380::2:97ea]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1550;
 20:VfO61FJAJ/SPuJXfAB3vrIvNWtmQlOKngIJu4iZp6144mnz9Z6Jy4KF/EvP9thQoP6aGoHHFbYN45SbeNLAmYjOCWy0pli2cGyPT6jCD5/3tnISIKNrCl4LcWPaaewDt2qeAN2NeAtGMCaD6L3Z2rsP04rtdcAsYSDTeWUQqpYc=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: e8cb64fa-0435-4463-0ee9-08d639d77881
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1550; 
x-ms-traffictypediagnostic: MWHPR15MB1550:
x-microsoft-antispam-prvs: <MWHPR15MB1550DB70E655C7EFE1F08634CEF60@MWHPR15MB1550.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(17755550239193)(158342451672863)(166708455590820)(65623756079841)(85827821059158);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(11241501184)(944501410)(52105095)(3002001)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1550; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1550; 
x-forefront-prvs: 083526BF8A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(376002)(39860400002)(396003)(136003)(53754006)(189003)(199004)(6246003)(82746002)(102836004)(229853002)(2616005)(53936002)(8676002)(14454004)(6512007)(110136005)(14444005)(5660300001)(186003)(81166006)(8936002)(2906002)(81156014)(316002)(7736002)(256004)(25786009)(97736004)(3480700004)(68736007)(6486002)(83716004)(71200400001)(6436002)(105586002)(106356001)(46003)(33656002)(39060400002)(86362001)(305945005)(71190400001)(36756003)(966005)(478600001)(76176011)(11346002)(2900100001)(5250100002)(6506007)(2501003)(446003)(6306002)(486006)(99286004)(6116002)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1550;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 08Ge/eS3WiPM1HbnRyObYMAFSP3SLmomIotuMZIVHM+pavzdAPIekbr6OvI6NdxtIoQb6u9n6P+r5mIiIcd3TBU4YKBWxWcuUoMx+G6UX/fgHub6LxAIveBV7bexbhBH4ns0he3+oIbGh4WQ4OcQodIh4at0iKkY3sFO1aChPWDtjmp6TL9nzvD/nf0Wkb8PSXSqpPC9xISp90ZX0xb9PfKvVH6B8yk2SYZVlna7+OSddhYxQBAv1NjVpxuTGihYyPElcv3aC4pBnX5lhVebWezQ/qgnZKIq+5UKskt3FCZvSc5VZ7VO8gWbLbte3RX8a2CZm1mpqP+pLNrODP8nYbNORi4Sz+b+w+C9vKCft18=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <0613DEDE1D10BA498EC2E1F67331600E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cb64fa-0435-4463-0ee9-08d639d77881
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2018 17:38:12.0260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1550
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-24_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
X-List-Received-Date: Wed, 24 Oct 2018 17:38:28 -0000

DQoNCu+7v09uIDEwLzI0LzE4LCA4OjU2IEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQXJ0ZW0g
U2VuaWNoZXYiIDxvcGVuYm1jLWJvdW5jZXMrc2Rhc2FyaT1mYi5jb21AbGlzdHMub3psYWJzLm9y
ZyBvbiBiZWhhbGYgb2YgYXJ0ZW1zZW5AZ21haWwuY29tPiB3cm90ZToNCg0KICAgIEhpIEFsbCwN
CiAgICANCiAgICBBcyB5b3Uga25vdywgT3BlbkJNQyBjb250YWlucyBvYm1jLWNvbnNvbGUgcHJv
amVjdCB0aGF0IGludGVuZGVkIHRvDQogICAgd29yayB3aXRoIGhvc3QncyBjb25zb2xlLiBJdCdz
IHZlcnkgdXNlZnVsIHRoYXQgb21jLWNvbnNvbGUtc2VydmVyDQogICAgc3RvcmVzIGxhc3QgbG9n
cyBpbnNpZGUgaXRzIHJpbmcgYnVmZmVyLCBidXQgaXQgd291bGQgYmUgYmV0dGVyIHRvDQogICAg
bWFrZSB0aGUgbG9nIGNvbGxlY3RvciBtb3JlIHNtYXJ0ZXIuDQogICAgDQogICAgT24gb3VyIFZF
U05JTiBzZXJ2ZXIsIHdlIGhhdmUgYW4gb3duIGV4dGVuc2lvbiBvZiBvYm1jLWNvbnNvbGUgLSBp
dCBpcw0KICAgIGEgc3RhbmRhbG9uZSBzZXJ2aWNlIHRoYXQgcmVhZHMgbG9nIG1lc3NhZ2VzIGZy
b20gb2JtYy1jb25zb2xlLXNlcnZlciwNCiAgICBtYXJrcyBlYWNoIG1lc3NhZ2Ugd2l0aCBhIHRp
bWVzdGFtcCBhbmQgc2F2ZSBpdCB0byBhbiBpbnRlcm5hbCBtZW1vcnkNCiAgICBidWZmZXIuIFdl
IGhhdmUgYSBjdXN0b20gcG9saWN5IHRoYXQgZGV0ZXJtaW5lcyBob3cgbGFyZ2UgYSBidWZmZXIg
Y2FuDQogICAgYmUgKGxpbWl0IGJ5IHRpbWUgb3IgbWVzc2FnZSBudW1iZXJzKSwgaW4gd2hpY2gg
Y2FzZXMgdGhlIGJ1ZmZlcg0KICAgIHNob3VsZCBiZSBmbHVzaGVkIHRvIGEgZmlsZSwgYW5kIGhv
dyBtYW55IHByZXZpb3VzIGxvZyBmaWxlcyBjYW4gYmUNCiAgICBzYXZlZCBvbiBhIGZsYXNoIGRy
aXZlIChzb21lIGtpbmQgb2Ygcm90YXRpb24pLg0KICAgIEJ5IGRlZmF1bHQgdGhlIGJ1ZmZlciBo
YXMgbGltaXQgb2YgMzAwMCBtZXNzYWdlcyBhbmQgaXQgZmx1c2hlZCB0byBhDQogICAgZmlsZSBv
biBldmVyeSBzaWduaWZpY2FudCBob3N0IHN0YXRlIGNoYW5nZSAoaG9zdCBvbi9vZmYsIE9TIGJv
b3QNCiAgICBjb21wbGV0ZSkuIFRoaXMgZ2l2ZXMgdXMgdGhlIG9wcG9ydHVuaXR5IHRvIHN0b3Jl
IG5vdCBvbmx5IHRoZSBsYXRlc3QNCiAgICBtZXNzYWdlcywgYnV0IGFsc28gdGhlIGxvZ3Mgb2Yg
dGhlIGxhc3QgYm9vdCBwcm9jZXNzIHNlcGFyYXRlbHkNCiAgICAoaG9zdGJvb3QsIHNraWJvb3Qs
IGV0YykuDQogICAgDQogICAgU28sIGlmIHlvdSBmaW5kIHRoaXMgc2VydmljZSB1c2VmdWwgZm9y
IHRoZSBPcGVuQk1DIHByb2plY3QsIHdlIGNhbg0KICAgIHVwbG9hZCB0aGUgc291cmNlIGNvZGUg
dG8gdGhlIGNvbW11bml0eS4NClRoYW5rcyBBcnRlbSEgQmFzZWQgb24gdGhlIGRlc2NyaXB0aW9u
IGFib3ZlLCBpdCBsb29rcyBsaWtlIHZlcnkgdXNlZnVsIGZlYXR1cmUuIEZldyBxdWVzdGlvbnMg
cmVsYXRlZCB0byBkZXNpZ24gYXJlOiBJcyB0aGlzIHN0YW5kLWFsb25lIHNlcnZpY2UgZGVzaWdu
ZWQgYXMgYSBELUJ1cyBzZXJ2aWNlPyBIb3cgZG9lcyB0aGlzIGNoYW5nZSB0aGUgZXhpc3Rpbmcg
dXNlciBpbnRlcmZhY2Ugd2l0aCBvYm1jLWNvbnNvbGUgaS5lLiBhbnkgbmV3IENMSSBvcHRpb25z
IGNoYW5nZSBvciBiZWhhdmlvciBjaGFuZ2U/IENhbiB0aGlzIGJlIHVzZWQgZnJvbSBSRVNULUFQ
SSBvciBSZWRmaXNoPyBIb3cgdG8gY29uZmlndXJlIHRoZSBjdXN0b20gcG9saWN5IHRvIGNvbmZp
Z3VyZT8gRXRjLiBJdCB3b3VsZCBiZSBncmVhdCBpZiB5b3UgY291bGQgdXNlIHRoZSBEZXNpZ24g
dGVtcGxhdGUgQCBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL3RyZWUvbWFzdGVyL2Rl
c2lnbnMgdG8gZXhwbGFpbiB0aGUgZGVzaWduIGRldGFpbHMgZm9yIGhlbHBpbmcgaW4gdW5kZXJz
dGFuZGluZyBhbmQgcHJvdmlkaW5nIGZlZWRiYWNrLg0KICAgDQogICAgU291cmNlczoNCiAgICBo
dHRwczovL2dpdGh1Yi5jb20vWUFEUk8tS05TL3Bob3NwaG9yLWhvc3Rsb2dnZXINCiAgICANCiAg
ICBTbWFsbCBkZW1vOg0KICAgICMgbHMgLWxBIC92YXIvbGliL29ibWMvaG9zdGxvZ3MNCiAgICAt
cnctci0tci0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAgICA2MzM2IE9jdCAyNCAwOToyNg0K
ICAgIGhvc3RfMjAxODEwMjRfMDkyNjU1LmxvZy5neg0KICAgIC1ydy1yLS1yLS0gICAgMSByb290
ICAgICByb290ICAgICAgICAgIDk1ODkgT2N0IDI0IDExOjQzDQogICAgaG9zdF8yMDE4MTAyNF8x
MTQzNDIubG9nLmd6DQogICAgLXJ3LXItLXItLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgICAg
NjU0NyBPY3QgMjQgMTI6MDENCiAgICBob3N0XzIwMTgxMDI0XzEyMDExOS5sb2cuZ3oNCiAgICAj
IHpjYXQgL3Zhci9saWIvb2JtYy9ob3N0bG9ncy9ob3N0XzIwMTgxMDI0XzEyMDExOS5sb2cuZ3oN
CiAgICBbIDExOjU1OjAyIF06ID4+PiBMb2cgY29sbGVjdGlvbiBzdGFydGVkIGF0IDI0LjEwLjIw
MTggMTE6NTU6MDINCiAgICBbIDExOjU1OjAyIF06IC0tPT0gV2VsY29tZSB0byBIb3N0Ym9vdCB2
Mi4xLTE5OS1nMzhhOWYzMC1kaXJ0eS9oYmljb3JlLmJpbi8gPT0tLQ0KICAgIFsgMTE6NTU6MDYg
XTogICA1LjY2ODY4fElTVEVQICA2LiAzIC0gaG9zdF9pbml0X2ZzaQ0KICAgIFsgMTE6NTU6MDYg
XTogICA2LjI3MTAyfElTVEVQICA2LiA0IC0gaG9zdF9zZXRfaXBsX3Bhcm1zDQogICAgWyAxMTo1
NTowNiBdOiAgIDYuMjcyMzR8SVNURVAgIDYuIDUgLSBob3N0X2Rpc2NvdmVyX3RhcmdldHMNCiAg
ICAuLi4NCiAgICANCiAgICBCZXN0IHJlZ2FyZHMsDQogICAgQXJ0ZW0gU2VuaWNoZXYNCiAgICBT
b2Z0d2FyZSBFbmdpbmVlciwgWUFEUk8uDQogICAgDQoNCg==
