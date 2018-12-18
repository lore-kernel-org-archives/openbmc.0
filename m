Return-Path: <prvs=5890a0f288=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5890a0f288=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="IxBjQeVp"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Sda7e04C"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43K5Mt4f12zDqR7
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 04:57:41 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wBIHufWt020149; Tue, 18 Dec 2018 09:57:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=YXA+dTM0TpAmnj1sN/Fy7YowAJ1XOb1/xHiba5TDN6w=;
 b=IxBjQeVpIYpD+YvhDLrnVkPEedmHOpcm7AnrY+HwExLLSwqOfa8vpdArduk5eabnitWY
 7NNXyeW4gg9shpFaAZMvVeugj14K4P1SALxfGHV7bAxNfbcz6atzNuS2SA667pb2Jghd
 kgY6tfqdQGMCd74pI2kO8iypRST+bum4O1g= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2pf4fhg8vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 18 Dec 2018 09:57:35 -0800
Received: from frc-mbx08.TheFacebook.com (2620:10d:c0a1:f82::32) by
 frc-hub06.TheFacebook.com (2620:10d:c021:18::176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 18 Dec 2018 09:57:33 -0800
Received: from frc-hub01.TheFacebook.com (2620:10d:c021:18::171) by
 frc-mbx08.TheFacebook.com (2620:10d:c0a1:f82::32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 18 Dec 2018 09:57:33 -0800
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.71) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 18 Dec 2018 09:57:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXA+dTM0TpAmnj1sN/Fy7YowAJ1XOb1/xHiba5TDN6w=;
 b=Sda7e04C97+DbnlXhoOS5zNX6rP+rfP1eAx3pBaByMimeG0DM3ZxPR00RCe6vyEaPicwDWqwZ/Wk7diXgMeAmKtMKgplu+EdSNK0LhCrVMDBuRG57I3qGO+oyTrL4IKlgQz0Pa1swiWoBjdPX+gNdGgdJelRNnAeNgIcRKgR1js=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1261.namprd15.prod.outlook.com (10.175.3.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.20; Tue, 18 Dec 2018 17:57:32 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::1476:dc37:cf4:ae1b]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::1476:dc37:cf4:ae1b%10]) with mapi id 15.20.1425.023; Tue, 18 Dec 2018
 17:57:31 +0000
From: Sai Dasari <sdasari@fb.com>
To: =?utf-8?B?R2VvcmdlIExpdSjliJjplKHkvJ8p?= <liuxiwei@inspur.com>, "Vijay
 Khemka" <vijaykhemka@fb.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Fan speed control
Thread-Topic: Fan speed control
Thread-Index: AQHUlmPa9RVzvtJvukS7iw8SULIx56WD/TCAgABGNQA=
Date: Tue, 18 Dec 2018 17:57:31 +0000
Message-ID: <FB6A886A-9650-407B-9DCD-AD3F9FE9F130@fb.com>
References: <4E117ED9-B492-4197-A66F-45949E3D7178@fb.com>
 <CAHkHK09SisQ0s765c1DOV7Pe8NMOKw-UM+xe8dYdt5BWA-O9vQ@mail.gmail.com>
In-Reply-To: <CAHkHK09SisQ0s765c1DOV7Pe8NMOKw-UM+xe8dYdt5BWA-O9vQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5:2e1b]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1261;
 20:yIH/Os6OToSv54LJ/JH2BTSE4MKv72lcKSWTR+RdQigzGsZObQlmXBmciOqrnHLLjOoMq/EMBo7/xYtxkte9DdXnrQqHpNz+SNiIpUElS81L5ObLxyVkmbaylR6vchDSn6pTBz2h+lf1hm++64eWvQ4HvmdcXOaHT2FP8c1P7XI=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(979002)(396003)(366004)(346002)(39860400002)(136003)(376002)(199004)(189003)(4326008)(554214002)(6246003)(7736002)(68736007)(256004)(8676002)(81156014)(81166006)(8936002)(25786009)(105586002)(446003)(106356001)(82746002)(53936002)(6306002)(486006)(6512007)(476003)(2616005)(11346002)(36756003)(76176011)(110136005)(316002)(2906002)(6486002)(46003)(186003)(71200400001)(86362001)(71190400001)(83716004)(3480700005)(229853002)(33656002)(305945005)(5660300001)(7116003)(966005)(6636002)(102836004)(6506007)(53546011)(99286004)(478600001)(6116002)(97736004)(14454004)(6436002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1261;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-correlation-id: a5ce39bc-00da-47fd-4f32-08d66512481c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1261; 
x-ms-traffictypediagnostic: MWHPR15MB1261:
x-microsoft-antispam-prvs: <MWHPR15MB12611AEC2826550BDC985A8ACEBD0@MWHPR15MB1261.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(11241501185)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231475)(944501520)(52105112)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1261; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1261; 
x-forefront-prvs: 08902E536D
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: kRB5f6GmB/cNaOB3IxaC+y9gtbvaAyGbLGgFqOxiAAlRgjKmi3oD+BkwejwFoASggaNIu+CvZKVOf6ZeWqPW+W/MfT11vIZ3PGJn3faKgLUD3o/B+762jv2UyTobuB/3T9aQp5FpeR4AdVyiV+e1eZLctN7aD6XxPEAizOQhNiZxK2/wia4BnCKKhQAGSALFUE6uIrp45eM7HKENiuJLyH7EvJAvxTwK3m4RFCSK7B6vAZaS8eeGp1WuFzIS8IJm+yZchsh+orxeP6d5NLA2zu/qCDiamZV5jBRg9rgSs12RH6WdNE6mVDLFh1q++DHa
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3C2D0ED179B78489DC2E92F484C4867@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ce39bc-00da-47fd-4f32-08d66512481c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2018 17:57:31.2197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1261
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-18_07:, , signatures=0
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
X-List-Received-Date: Tue, 18 Dec 2018 17:57:48 -0000

DQoNCu+7v09uIDEyLzE3LzE4LCA5OjQ3IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgR2Vvcmdl
IExpdSjliJjplKHkvJ8pIiA8b3BlbmJtYy1ib3VuY2VzK3NkYXNhcmk9ZmIuY29tQGxpc3RzLm96
bGFicy5vcmcgb24gYmVoYWxmIG9mIGxpdXhpd2VpQGluc3B1ci5jb20+IHdyb3RlOg0KDQogICAg
SGkgVmlqYXkNCiAgICANCiAgICBJIGFtIGFsc28gbGVhcm5pbmcgYWJvdXQgdGhlIGZhbiBjb25m
aWd1cmF0aW9uIHBhcnQgb2Ygb3BlbmJtYw0KICAgIFRoZXJlIGlzIGEgZHJhZnQgaHR0cHM6Ly9n
aXRodWIuY29tL2x4d2luc3B1ci9vcGVuYm1jLWRvYy4NCiAgICBJIGhvcGUgaXQgY2FuIGJlIHVz
ZWZ1bCBmb3IgeW91DQpUaGFua3MgR2Vyb2dlISBUaGlzIGlzIGdyZWF0IGluZm8gYW5kIGhvcGUg
eW91IGNhbiB1cHN0cmVhbSB0aGVzZSBkb2NzIGZvciBlYXNlIG9mIGZpbmRpbmcgYW5kIGdyZWF0
bHkgYmVuZWZpdCBvdGhlciBjb21tdW5pdHkgbWVtYmVycy4NCiAgICBSZWdhcmRzDQogICAgDQog
ICAgLUdlb3JnZQ0KICAgIA0KICAgIE9uIFR1ZSwgRGVjIDE4LCAyMDE4IGF0IDc6NTUgQU0gVmlq
YXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+IFRlYW0s
DQogICAgPg0KICAgID4gSSBhbSBsb29raW5nIGZvciDigJxmYW4gc3BlZWQgY29udHJvbOKAnSBm
ZWF0dXJlIHRvIGVuYWJsZSBmb3IgVGlvZ2FwYXNzLiBJIHVuZGVyc3RhbmQgdGhhdCB0aGVyZSBh
cmUgbWFueSBhcHByb2FjaGVzIGZvciB0aGlzLiBQbGVhc2UgcG9pbnQgbWUgdG8gYWxsIGltcGxl
bWVudGF0aW9uIGFuZCBhbnkgZGV0YWlscyBhYm91dCBlYWNoIGFwcHJvYWNoLCBtYXkgYmUgc29t
ZSBwcm9zIGFuZCBjb25zLg0KICAgID4NCiAgICA+DQogICAgPg0KICAgID4gUmVnYXJkcw0KICAg
ID4NCiAgICA+IC1WaWpheQ0KICAgIA0KDQo=
