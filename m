Return-Path: <prvs=383377382b=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=383377382b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="exdw/JiH"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Ys34XdhO"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42f3f232t7zF322
 for <openbmc@lists.ozlabs.org>; Tue, 23 Oct 2018 04:38:30 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9MHTuBl031859; Mon, 22 Oct 2018 10:38:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=nGnK6mQc9/5DPp81yOyk20ZQVe9HKw2LmJP7SNAYgSQ=;
 b=exdw/JiHZh0zCQZU7LQxbKBfshW+Z7Q+iwLC8DtSQEZa0UFloeyKff/UlOGH2rFOqXZf
 MPBqq7M65A6qnGe8ijtXxKXwcqTb6osz9NVx4e6aivMq8imPD1Pmq3Vd+gXNhRK3E4/Y
 x7LVp8bvPvIXyBwp/04gNv27OeOTbH+wC8U= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2n9h98repu-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 22 Oct 2018 10:38:26 -0700
Received: from frc-hub01.TheFacebook.com (2620:10d:c021:18::171) by
 frc-hub01.TheFacebook.com (2620:10d:c021:18::171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 22 Oct 2018 10:38:16 -0700
Received: from FRC-CHUB10.TheFacebook.com (2620:10d:c021:18::29) by
 frc-hub01.TheFacebook.com (2620:10d:c021:18::171) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Mon, 22 Oct 2018 10:38:16 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.30) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Mon, 22 Oct 2018 13:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGnK6mQc9/5DPp81yOyk20ZQVe9HKw2LmJP7SNAYgSQ=;
 b=Ys34XdhO1IEBbmngSxISu8uhaO8Arqz349n37RFv7g2o9X/rqQk9KD6C4xGCnvy34yuUNiq37Bh11xJp7YBgIdYC1bkZS9Fq7WBKhN1QdNtoX6QYjUfq75/LKob8u30VE5vk4X+iqOZHFvh3c/CaLcNVv4HiloR0a1ekmqyOGgQ=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1510.namprd15.prod.outlook.com (10.172.161.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1250.20; Mon, 22 Oct 2018 17:38:14 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::ec34:3b6a:58ac:e1f2]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::ec34:3b6a:58ac:e1f2%7]) with mapi id 15.20.1250.028; Mon, 22 Oct 2018
 17:38:14 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Venture <venture@google.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: fru inventory update
Thread-Topic: fru inventory update
Thread-Index: AQHUZ/618OBz++G71EyYClPhU8TqkaUoTVAAgALJXYA=
Date: Mon, 22 Oct 2018 17:38:14 +0000
Message-ID: <AB5880CB-EDF6-4771-AB43-8D7BE8D3B549@fb.com>
References: <2F1B55CF-6A56-4154-A5C1-67F76EBB6184@fb.com>
 <CAO=notz-_GvQnO+FJVipS8FkfQ8fsm_1ie57DdHNKamxk-8mFg@mail.gmail.com>
In-Reply-To: <CAO=notz-_GvQnO+FJVipS8FkfQ8fsm_1ie57DdHNKamxk-8mFg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5:a181]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1510;
 20:ZLWY5d2Yjwfvbzb6I90MAU/ATq6onN3UjVJFUArPnZoIsfLxZkCBdW2vMg6aDWP1P6sKQGDe6G598DNF3dTYtedfF8XRsAubQCun3C6QCooJX3ZLGz1GI3Zzrvh+KFrBlpNOsub6pv6Zg6VrueepJ6FIXbdux83G2qLe+wMTlpM=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: f45d3d05-4203-4bd7-8e69-08d63845251a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1510; 
x-ms-traffictypediagnostic: CY4PR15MB1510:
x-microsoft-antispam-prvs: <CY4PR15MB1510EDC66E30FD1BDDF5748DDDF40@CY4PR15MB1510.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(211936372134217)(153496737603132)(67672495146484); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231355)(11241501184)(944501410)(52105095)(3002001)(93006095)(93001095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1510; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1510; 
x-forefront-prvs: 08331F819E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(346002)(376002)(39860400002)(366004)(40224003)(189003)(199004)(6506007)(53546011)(486006)(6486002)(6246003)(305945005)(102836004)(105586002)(6436002)(76176011)(7736002)(6512007)(99286004)(229853002)(186003)(478600001)(53936002)(86362001)(83716004)(6116002)(81166006)(5660300001)(3480700004)(256004)(7116003)(82746002)(71200400001)(5250100002)(71190400001)(68736007)(8676002)(2616005)(11346002)(14454004)(25786009)(446003)(33656002)(476003)(36756003)(46003)(8936002)(81156014)(316002)(2906002)(97736004)(15650500001)(6916009)(4326008)(2900100001)(106356001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1510;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: pif4kfsSuP6wRScZ68enkoF7R5sd+FBx9dEUW4Zje2dQMhOl8NE+t+or+1fXEtpQWZJl1z4YjWVVhalGRq3+xZ0PynsWITPiTm96wMNJOQysqu3dHuKl5BgXCvKJP5V5DwJBs81X2h/0OoTO20NW52LrGV4mfP+TEKDrQ8jjf2Xmu5/JyRPiCFaEQ5UxJtllE+uF/MOkStq6D7Qlo0OMW8bOumb3ILdUaSRaQwn7TXuWGWP1Nl3g7zxPaTC9+xby04d6TcBtUMT2EjWkVztDy8ZiiTuOTfgFfDvLFTrsIB66E1geoBKlFBUFgO89VjzFwcTel2ybqjKicXSr/MgbgNrQ5mtI1gTljgaeXiC46OY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF64F12F3F1AA44CA5E5D24F842EF58B@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f45d3d05-4203-4bd7-8e69-08d63845251a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2018 17:38:14.4806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1510
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-22_11:, , signatures=0
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
X-List-Received-Date: Mon, 22 Oct 2018 17:38:36 -0000

DQoNCu+7v09uIDEwLzIwLzE4LCA5OjA1IEFNLCAiUGF0cmljayBWZW50dXJlIiA8dmVudHVyZUBn
b29nbGUuY29tPiB3cm90ZToNCg0KICAgIE9uIEZyaSwgT2N0IDE5LCAyMDE4IGF0IDQ6NDEgUE0g
VmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+IEhp
LA0KICAgID4NCiAgICA+IEkgYW0gdHJ5aW5nIHRvIHJlYWQgZnJ1IGRhdGEgb2YgbXkgYm9hcmQg
YW5kIGNyZWF0ZWQgYSBjb25maWcueWFtbC4gSSBub3RpY2VkIGZldyB0aGluZ3MgdGhhdCB0aGVy
ZSBpcyBvbmx5IDUgZmllbGQgdXBkYXRlZCBpbiBzeXN0ZW0veHl6Lm9wZW5ibWNfcHJvamVjdC5J
bnZlbnRvcnkuRGVjb3JhdG9yLkFzc2V0IGV2ZW4gdGhvdWdoIEkgaGF2ZSBtb3JlIGZpZWxkIHJl
cXVlc3RlZCBpbiBjb25maWcgZmlsZS4gQW5kIGFsc28gaG93IGRvIEkgZ2V0IG1lYW5pbmdmdWwg
a2V5IHN0cmluZyBpbnN0ZWFkIG9mIHZhbHVlMCwgdmFsdWUxLiBQbGVhc2Ugc2VlIGJlbG93IGNv
bmZpZy55YW1sIGFuZCBpbnZlbnRvcnkgZmlsZS4NCiAgICA+DQogICAgPg0KICAgID4NCiAgICA+
IENvbmZpZy55YW1sDQogICAgPg0KICAgID4gPT09PT09PT09PT09DQogICAgPg0KICAgID4gICAv
c3lzdGVtOg0KICAgID4NCiAgICA+ICAgICBlbnRpdHlJRDogMw0KICAgID4NCiAgICA+ICAgICBl
bnRpdHlJbnN0YW5jZTogMQ0KICAgID4NCiAgICA+ICAgICBpbnRlcmZhY2VzOg0KICAgID4NCiAg
ICA+ICAgICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuSW52ZW50b3J5LkRlY29yYXRvci5Bc3NldDoN
CiAgICA+DQogICAgPiAgICAgICAgIFNlcmlhbE51bWJlcjoNCiAgICA+DQogICAgPiAgICAgICAg
ICAgSVBNSUZydVByb3BlcnR5OiBTZXJpYWwgTnVtYmVyDQogICAgPg0KICAgID4gICAgICAgICAg
IElQTUlGcnVTZWN0aW9uOiBQcm9kdWN0DQogICAgPg0KICAgID4gICAgICAgICBNYW51ZmFjdHVy
ZXI6DQogICAgPg0KICAgID4gICAgICAgICAgIElQTUlGcnVQcm9wZXJ0eTogTWFudWZhY3R1cmVy
DQogICAgPg0KICAgID4gICAgICAgICAgIElQTUlGcnVTZWN0aW9uOiBQcm9kdWN0DQogICAgPg0K
ICAgID4gICAgICAgICBNb2RlbDoNCiAgICA+DQogICAgPiAgICAgICAgICAgSVBNSUZydVByb3Bl
cnR5OiBNb2RlbCBOdW1iZXINCiAgICA+DQogICAgPiAgICAgICAgICAgSVBNSUZydVNlY3Rpb246
IFByb2R1Y3QNCiAgICA+DQogICAgPiAgICAgICAgIFByZXR0eU5hbWU6DQogICAgPg0KICAgID4g
ICAgICAgICAgIElQTUlGcnVQcm9wZXJ0eTogTmFtZQ0KICAgID4NCiAgICA+ICAgICAgICAgICBJ
UE1JRnJ1U2VjdGlvbjogUHJvZHVjdA0KICAgID4NCiAgICA+ICAgICAgICAgVmVyc2lvbjoNCiAg
ICA+DQogICAgPiAgICAgICAgICAgSVBNSUZydVByb3BlcnR5OiBWZXJzaW9uDQogICAgPg0KICAg
ID4gICAgICAgICAgIElQTUlGcnVTZWN0aW9uOiBQcm9kdWN0DQogICAgPg0KICAgID4gICAgICAg
ICBBc3NldFRhZzoNCiAgICA+DQogICAgPiAgICAgICAgICAgSVBNSUZydVByb3BlcnR5OiBBc3Nl
dCBUYWcNCiAgICA+DQogICAgPiAgICAgICAgICAgSVBNSUZydVNlY3Rpb246IFByb2R1Y3QNCiAg
ICA+DQogICAgPiAgICAgICAgIEN1c3RvbUZpZWxkMToNCiAgICA+DQogICAgPiAgICAgICAgICAg
SVBNSUZydVByb3BlcnR5OiBDdXN0b20gRmllbGQgMQ0KICAgID4NCiAgICA+ICAgICAgICAgICBJ
UE1JRnJ1U2VjdGlvbjogUHJvZHVjdA0KICAgID4NCiAgICA+ICAgICAgICAgQ3VzdG9tRmllbGQy
Og0KICAgID4NCiAgICA+ICAgICAgICAgICBJUE1JRnJ1UHJvcGVydHk6IEN1c3RvbSBGaWVsZCAy
DQogICAgPg0KICAgID4gICAgICAgICAgIElQTUlGcnVTZWN0aW9uOiBQcm9kdWN0DQogICAgPg0K
ICAgID4NCiAgICA+DQogICAgPg0KICAgID4NCiAgICA+IHN5c3RlbS94eXoub3BlbmJtY19wcm9q
ZWN0LkludmVudG9yeS5EZWNvcmF0b3IuQXNzZXQNCiAgICA+DQogICAgPiA9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQogICAgPg0KICAgID4gew0K
ICAgID4NCiAgICA+ICAgICAidmFsdWUwIjogew0KICAgID4NCiAgICA+ICAgICAgICAgImNlcmVh
bF9jbGFzc192ZXJzaW9uIjogMSwNCiAgICA+DQogICAgPiAgICAgICAgICJ2YWx1ZTAiOiAiIiwN
CiAgICA+DQogICAgPiAgICAgICAgICJ2YWx1ZTEiOiAiV1RGMTczNzBEMk1BMSIsDQogICAgPg0K
ICAgID4gICAgICAgICAidmFsdWUyIjogIldpd3lubiIsDQogICAgPg0KICAgID4gICAgICAgICAi
dmFsdWUzIjogIiIsDQogICAgPg0KICAgID4gICAgICAgICAidmFsdWU0IjogIkI4MS4wMFgwMS4w
MTA0Ig0KICAgID4NCiAgICA+ICAgICB9DQogICAgPg0KICAgID4gfQ0KICAgID4NCiAgICA+DQog
ICAgPg0KICAgID4NCiAgICA+DQogICAgPiBQbGVhc2UgYWR2aXNlIGhlcmUgYXMgd2hhdCBhbSBJ
IG1pc3NpbmcuDQogICAgDQogICAgSXQncyBteSB1bmRlcnN0YW5kaW5nIHRoYXQgdGhlIEZydVNl
Y3Rpb24gZmllbGQgbWF0dGVycywgYW5kIGlmIGl0DQogICAgZG9lc24ndCBtYXRjaCBpdCB3b24n
dCBwb3B1bGF0ZSB0aGF0IGFzcGVjdCBvZiBpdC4gIFlvdXJzIGFyZSBzZXQgdG8NCiAgICAiUHJv
ZHVjdCIgZXZlcnl3aGVyZSwgaG93ZXZlciwgcGVyaGFwcyB0aGV5IHNob3VsZCBiZSAiQm9hcmQi
IG9yDQogICAgc29tZXRoaW5nIGVsc2UsIHRoYXQgaW5kaWNhdGUgZGlmZmVyZW50IHNlY3Rpb25z
Lg0KICBJIGhhdmUgZGlmZmVyZW50IHNlY3Rpb25zIGZvciBkaWZmZXJlbnQgZmllbGQgYW5kIEkg
aGF2ZSB0aG9zZSBmb3IgQm9hcmQgYW5kIGNoYXNzaXMgYXMgd2VsbC4NCiAgSSBzZWUgc2FtZSBp
c3N1ZSBmb3IgQm9hcmQgYW5kIGNoYXNzaXMuIEFzIGl0IGRvZXNuJ3Qgb3V0cHV0IG1vcmUgdGhh
biA1IHZhbHVlcy4gQW5kIEkgZmVlbA0KICBXZSBzaG91bGQgaGF2ZSBwcm9wZXIga2V5IHJhdGhl
ciB2YWx1ZTAsIHZhbHVlMSwgLi4gDQogICAgPg0KICAgID4NCiAgICA+DQogICAgPiBSZWdhcmRz
DQogICAgPg0KICAgID4gLVZpamF5DQogICAgDQoNCg==
