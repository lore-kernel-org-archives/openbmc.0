Return-Path: <prvs=69266c3e89=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=69266c3e89=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="IzZ9Ercj"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="LAoH5+/o"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lCgn0SHczDqGY
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 04:58:10 +1100 (AEDT)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0NHtZNd020974; Wed, 23 Jan 2019 09:58:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Wtb+sJ8YMhifAEmTTfLoL1BG4CqwLwP4gZ9yBjlkyC8=;
 b=IzZ9ErcjbaIPvrPKI+J89pg+2fPyu2UZsj6MuAa0TwXT7ludE4R+qxMPfbvZWLQyawex
 qmsXKny59+ejF7gmbzZoG/vkXuA+2L36ngp4Vsu0sboKdLfCuoIy+gYU0vIof1KxKRJH
 AY+7Ji8rxXvC3vvW/sIntxWS9xHxW49vr6g= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2q6vbv06n6-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 23 Jan 2019 09:58:08 -0800
Received: from prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 23 Jan 2019 09:56:45 -0800
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 23 Jan 2019 09:56:45 -0800
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Wed, 23 Jan 2019 09:56:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wtb+sJ8YMhifAEmTTfLoL1BG4CqwLwP4gZ9yBjlkyC8=;
 b=LAoH5+/o6AfSOmAZY0ad6J8Z9GpL52aIe+yzFfALZCblHh2Ka/3hjVHjooIiuBHrC2qF2Uc9WjwWmM1bntJz/XL+kUhgB37PKj1ekUY+hRh+xn2gNEZ2HDBs1zAPqbzrU4OX1QnYxY+BKJadTV60yPJ7kP3RUi1yzZ2PKdUlkn0=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1302.namprd15.prod.outlook.com (10.172.181.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.26; Wed, 23 Jan 2019 17:56:44 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b4e4:1e1f:8c5d:9a8c]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b4e4:1e1f:8c5d:9a8c%4]) with mapi id 15.20.1537.031; Wed, 23 Jan 2019
 17:56:44 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: New motherboard to port OpenBMC to
Thread-Topic: New motherboard to port OpenBMC to
Thread-Index: AQHUszUL/OvmDlwEhkOeYRYRgz80iaW8nXmA
Date: Wed, 23 Jan 2019 17:56:43 +0000
Message-ID: <9F5DFCC3-67E6-48D8-B189-D3A4A7569451@fb.com>
References: <3817431548258966@sas1-fc7737ec834f.qloud-c.yandex.net>
In-Reply-To: <3817431548258966@sas1-fc7737ec834f.qloud-c.yandex.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:90a4]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1302;
 20:tP1GiZLrPujDgJUFk9ZjcXl8v+vyhKUvQXJqLaAysmXdMtS67gMQVt2ijnvdkdvZAMYqF8AGFcB+PSa5759KqTEYh5uz1R7fnldL7QxCFMKL4CzwK34v3Ia/DcQYPxv4euUefHhvMM1b17UtkYbTbaIYT5qfNYbF9aCi+0r7wK0=
x-ms-office365-filtering-correlation-id: 62f09082-d894-4baa-48f3-08d6815c22d9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1302; 
x-ms-traffictypediagnostic: CY4PR15MB1302:
x-microsoft-antispam-prvs: <CY4PR15MB1302353A0BB0CA9744D96E0BDD990@CY4PR15MB1302.namprd15.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(136003)(396003)(366004)(376002)(199004)(53754006)(189003)(476003)(97736004)(71190400001)(305945005)(71200400001)(446003)(7736002)(86362001)(6116002)(256004)(105586002)(6436002)(81156014)(81166006)(6506007)(186003)(83716004)(2616005)(11346002)(8676002)(46003)(76176011)(102836004)(106356001)(53936002)(25786009)(68736007)(14454004)(8936002)(6246003)(2906002)(33656002)(316002)(82746002)(110136005)(2501003)(229853002)(6512007)(478600001)(99286004)(6486002)(36756003)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1302;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gRULxzdTPp/btbBnS4FA77WYxczhYzeZyzxKg2RHRVUgDKsbqSUD/b5IA5cV24mfqeG9sYkxNeUnuIT/xCAsshC6yHA6Ntu36PkDPsy+hbRPT4vJPqEQZaVxVhxlCUUah9W+eTubhsyqdZj/GPf/zJ8iQ3Rrxnne+m3UQwBGtswXyoIjPlo+zC+BUs8HqliKXT5u/5SzfYwMU3dpwjD5n+RMrBo4QcQLQ7dyakPbXbVLuPvruiSOKZFkSknogyTfNEC3Qsp3KO0c1BkFRdrrPwjGnwCvJau7IRUwiRzHQc7fgNJwgRthWl6OV9TeOGjIXxPAGgOK6nHK8P8H9orv5TRv12UI2cA0cGgiid09b4Fx85S4GJJi0wbqmKgbw8xLnLo2wkfdi1tIjQeI5cIgSL48VDjXgqFD3xdBvbhzH4s=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B9EBE11B9F427408076BAFA0832CE5B@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f09082-d894-4baa-48f3-08d6815c22d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 17:56:44.0206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1302
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-23_09:, , signatures=0
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
X-List-Received-Date: Wed, 23 Jan 2019 17:58:14 -0000

SGkgS29uc3RhbnRpbiwNCkkgYW0gd29ya2luZyBvbiBob3d0byBmb3Igc2Vuc29ycywgdGVtcCBl
dGMuIEkgd2lsbCBwb3N0IGl0IGhlcmUgaW4gY291cGxlIG9mIGRheXMuDQoNClJlZ2FyZHMNCi1W
aWpheQ0KDQrvu79PbiAxLzIzLzE5LCA4OjAyIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgS29u
c3RhbnRpbiBLbHVibmljaGtpbiIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21A
bGlzdHMub3psYWJzLm9yZyBvbiBiZWhhbGYgb2Yga2l0c29rQHlhbmRleC10ZWFtLnJ1PiB3cm90
ZToNCg0KICAgIEhpIGFsbCEgDQogICAgDQogICAgSSBoYXZlIHRoZSBjdXN0b20tbWFkZSBtb3Ro
ZXJib2FyZHMgZm9yIEdyYW50bGV5IENQVSB3aXRoIEF2b2NlbnQtYmFzZWQgQk1DLCBhbmQgbXkg
Z29hbCBpcyB0byBzd2l0Y2ggdG8gT3BlbkJNQy4gDQogICAgDQogICAgSSd2ZSByZWFkIEhPV1RP
cyBpbiB0aGUgT3BlbkJNQyBkb2N1bWVudGF0aW9uLCBidXQgdXN1YWxseSB0aGUgZG9jdW1lbnRh
dGlvbiBpcyB1c3VhbGx5IGEgYml0IGJlaGluZCB0aGUgZGV2ZWxvcG1lbnQsIHNvIGFyZSB0aGVy
ZSBhbnkgbmV3ZXIgaG93dG9zIG9yIGd1aWRlcz8NCiAgICANCiAgICBOb3cgSSB0b29rIFF1YW50
YSBNQiBhcyBhIHJlZmVyZW5jZSBhbmQgZ29pbmcgdG8gYXQgbGVhc3QgYm9vdCB1cCB0aGUgc3lz
dGVtIGFuZCBnZXQgdGhlIG5ldHdvcmsuIEJ1dCBpdCdzIHByZXR0eSB1bmNsZWFyIGZvciBtZSBo
b3cgdG8gYWRkIHNlbnNvcnMsIGhvdyB0byBnZXQgQ1BVcyB0ZW1wZXJhdHVyZXMsIGV0Yw0KICAg
IA0KICAgIENvdWxkIHlvdSBwbGVhc2UgYWR2aXNlIHdoYXQgdG8gcmVhZCB0byBnZXQgaW50byBk
ZXRhaWxzPw0KICAgIA0KICAgIFRoYW5rcyENCiAgICAtLSANCiAgICBCZXN0IHJlZ2FyZHMsDQog
ICAgS29uc3RhbnRpbiBLbHVibmljaGtpbiwNCiAgICBsZWFkIGZpcm13YXJlIGVuZ2luZWVyLA0K
ICAgIHNlcnZlciBoYXJkd2FyZSBSJkQgZ3JvdXAsDQogICAgWWFuZGV4IE1vc2NvdyBvZmZpY2Uu
DQogICAgdGVsOiArNy05MDMtNTEwLTMzLTMzDQogICAgDQogICAgDQoNCg==
