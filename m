Return-Path: <prvs=5875f896d9=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5875f896d9=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="cCaM92Vk"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="GYOasNL/"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 437wKX5wYgzDqW0
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 06:38:56 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id wB3JZlnS020241;
 Mon, 3 Dec 2018 11:37:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=iJUIjYZ8hiU8JZUSbfHdLcmsLYUD+MT1VosjqR/zWEA=;
 b=cCaM92Vk9HuwDr44TX31QmsJc6qo2O7yEmRSWl5+gWLgekqtuIHxSLQRvxqA6VQ9PQHL
 uy6g0TniOnUp+GuNEItOVipPT1EMtvUrwZ1+FcBrjJ+P7gJ2Nt6Vj9zxNxIdiSAlfjfr
 OzYL4mAEFIEPVOKbtlI5lpLFhDEnJe3qYgQ= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by m0089730.ppops.net with ESMTP id 2p5986rb8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 03 Dec 2018 11:37:47 -0800
Received: from frc-mbx01.TheFacebook.com (2620:10d:c0a1:f82::25) by
 frc-hub06.TheFacebook.com (2620:10d:c021:18::176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 3 Dec 2018 11:37:47 -0800
Received: from frc-hub02.TheFacebook.com (2620:10d:c021:18::172) by
 frc-mbx01.TheFacebook.com (2620:10d:c0a1:f82::25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 3 Dec 2018 11:37:46 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.72) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Mon, 3 Dec 2018 11:37:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJUIjYZ8hiU8JZUSbfHdLcmsLYUD+MT1VosjqR/zWEA=;
 b=GYOasNL/5bvBu7r1dc76N0EflP9Ki+3eyw+nnVH2xp8mobBLaVXCnVIzqQK594A0J0F3NmflROMZKFFRayitpcQkQqvvxgjdijpCrpgTDdUc4xPuo6Gyoat5UFNygQKT00MYxPtKtblgNQZOBbHBV4eFQDQgbnVxfzTt/kXctzI=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1525.namprd15.prod.outlook.com (10.172.157.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.22; Mon, 3 Dec 2018 19:37:44 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::19df:d934:b961:5442]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::19df:d934:b961:5442%5]) with mapi id 15.20.1382.020; Mon, 3 Dec 2018
 19:37:44 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Samuel Jiang
 <chyishian.jiang@gmail.com>, qianlihu <wangzhiqiang8906@gmail.com>,
 Gary Hsu <gary_hsu@aspeedtech.com>,
 "Ryan Chen <Ryan Chen" <ryan_chen@aspeedtech.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [HELP] ipmi-kcs didn't work
Thread-Topic: [HELP] ipmi-kcs didn't work
Thread-Index: AQHUfAaAMP2kbKDNOUGRurHcg5+B4KVPg+eAgACO1QCAASihgIAVbPaAgACKdwCAAIbQgIAA0d+A//+zjgCAAI7agP//rwCAgACNLoCAAQJWAIADPG2A//+4VwA=
Date: Mon, 3 Dec 2018 19:37:44 +0000
Message-ID: <033266A0-B6C1-4BE7-BA3B-A6E319BDD8D5@fb.com>
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
 <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
 <e63c758f-2eec-9e28-9381-4e28d2d8bb64@linux.intel.com>
 <4780f022-1c80-4b53-9eb1-0e3fe313c6a2@Spark>
 <db5cfcea-972d-2f50-05f4-266ab2c8f310@linux.intel.com>
 <87C3DCC8-F773-46A0-B8EC-5E3DC5E3983F@fb.com>
 <660c304f-60eb-f54a-f3b7-4d6d4481a96a@linux.intel.com>
 <A9318AC7-EE0E-4B84-84D1-A16695EE3FC0@fb.com>
 <b20d590b-be35-046e-26c2-2c1b2456309a@linux.intel.com>
 <253b7d32-1230-4111-a6dc-a84afddcc679@Spark>
 <25e866d4-749c-902b-86b2-3d38975dcc65@linux.intel.com>
In-Reply-To: <25e866d4-749c-902b-86b2-3d38975dcc65@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:d946]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1525;
 20:c6bKolVHg966wpd/AIv9OLS7b7g+HkYeuIPynmEkaP20OYoyN9ez6dgut9jw8Up/j06LhDbGS8gH0pgvtmKHwA2DdPe9GO4W0tAkIn/SPWViINLW0Zy/XH1934CzlE6PzJUXQQBoa+EYkrTq6WS8yE/LadRmPWc5EuQLkOS/Xxc=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: b201634d-c110-49dd-f517-08d65956cc4e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1525; 
x-ms-traffictypediagnostic: CY4PR15MB1525:
x-microsoft-antispam-prvs: <CY4PR15MB152520A094D66DC40DD93BB2DDAE0@CY4PR15MB1525.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(11241501185)(944501493)(52105112)(3002001)(93006095)(93001095)(148016)(149066)(150057)(6041310)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1525; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1525; 
x-forefront-prvs: 08756AC3C8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(376002)(39860400002)(136003)(346002)(189003)(199004)(8936002)(6506007)(53546011)(8676002)(53936002)(229853002)(71200400001)(71190400001)(305945005)(86362001)(97736004)(14444005)(102836004)(256004)(4326008)(478600001)(82746002)(6116002)(46003)(99286004)(6512007)(2616005)(7736002)(14454004)(81156014)(36756003)(106356001)(105586002)(186003)(11346002)(446003)(2906002)(110136005)(33656002)(6486002)(68736007)(81166006)(39060400002)(316002)(83716004)(165073002)(486006)(6246003)(5660300001)(25786009)(76176011)(6436002)(93886005)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1525;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: UCwZXbtyKQSkAZ8AlnEwkThvgO568JXjsIfcA9RHTVkbQtvfIV3X/l8e2QFKuFqfUKl3yXBTs4XnnSCrh/RqUiSXnaEjhuhAsrxTCNUWk9XH28qEOfqmyjjQ9vxImrvxo6CU41V5VGH4aDAw/d7YYDJps287H++LGkQpLKJjHoG6JuDvK/rowfGrpcyCGsZ0ES3j0g6nGIlJpx8IOLC26B1AA7wd202VkQxvMAkPKcmSX4XR0h7bsNVfsWeS0i8SphT3JOSQahAwfnoQlPcxh/y/nLXj7hqShtKqjUv80sG465FYx25Xr3mwPWo5tZZlB520I7GWw5Gc2SrIOYpdqHRPtmxNrK8aMEvL5TQNd8s=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <55CC4AA8D6CEAF4192ABE6FBA339BB3E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b201634d-c110-49dd-f517-08d65956cc4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2018 19:37:44.8429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1525
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-03_10:, , signatures=0
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
X-List-Received-Date: Mon, 03 Dec 2018 19:38:57 -0000

DQoNCu+7v09uIDEyLzMvMTgsIDc6NTQgQU0sICJKYWUgSHl1biBZb28iIDxqYWUuaHl1bi55b29A
bGludXguaW50ZWwuY29tPiB3cm90ZToNCg0KICAgIE9uIDEyLzEvMjAxOCA4OjI5IEFNLCBTYW11
ZWwgSmlhbmcgd3JvdGU6DQogICAgPiBBcG9sb2dpemUgZm9yIHNlbmRpbmcgb3V0IG5vIGNvbnRl
bnQgbWFpbCBmaXJzdC4NCiAgICA+IA0KICAgID4gSmFlLA0KICAgID4gVGhlIGFzcGVlZF9nYXRl
cyBpbiBjbGstYXNwZWVkLmMgcGVyaGFwcyBhcyB0b2RvIHN1Z2dlc3QgYXNraW5nIEFzcGVlZCAN
CiAgICA+IHRoZSBhY3R1YWwgcGFyZW50IGRhdGEgZm9yIGNoZWNrIGluaXRpYWxpemluZz8NCiAg
ICA+IA0KICAgIA0KICAgIFllcywgdGhhdCBtYWtlcyBzZW5zZS4NCiAgICANCiAgICBIaSBHYXJ5
IGFuZCBSeWFuLA0KICAgIA0KICAgIENhbiB5b3UgcGxlYXNlIHRlbGwgdXMgd2hhdCBpcyB0aGUg
YWN0dWFsIHBhcmVudCBjbG9jayBzb3VyY2Ugb2YgTFBDIElQPw0KICAgIEkgbWVhbiB0aGUgb3Bl
cmF0aW9uYWwgY2xvY2sgb2YgTFBDIElQIGhhcmR3YXJlIGJsb2NrLCBub3QgdGhlIGludGVyZmFj
ZQ0KICAgIGNsb2NrLg0KICAgIA0KICAgIFRoYW5rcywNCiAgICBKYWUNCiAgICANCiAgICA+IFZp
amF5LA0KICAgID4gSSB0cmFjZWQgbHBjLWN0cmwgbW9kdWxlLCBpdCBzZWVtcyBkaXJlY3QgdXBk
YXRlIHRoZSBzYW1lIA0KICAgID4gQVNQRUVEX0NMS19HQVRFX0xDTEsgcmVnaXN0ZXIgbWFwIGJp
dCB0byBlbmFibGUuIElmIHBhcmVudCBkYXRhIGlzIA0KICAgID4gZGlzYWJsZWQsIGl0IGNvdWxk
IGVuYWJsZSBpbiBkdHMuDQogICAgPiBUaGUgZGV2aWNlIHRyZWUgZGV0YWlsLCBJIHJlZmVyZW5j
ZSBpdCBmcm9tIGFzcGVlZC1nNS5kdHNpLiBIb3BlIGl0IA0KICAgID4gY291bGQgaGVscCB5b3Ug
Zm9yIHdvcmsuDQogICAgPiANCiAgICA+IFRoYW5rcywNCiAgICA+IA0KICAgID4gU2FtdWVsIEpp
YW5nDQoNClNhbXVhbC9KYXksDQpJbiBteSBjYXNlIGlmIEkgZG9uJ3QgaW5pdGlhbGl6ZSBMUEMg
Y2xvY2sgaW4gZHJpdmVyLCBCaW9zIG9uIGhvc3Qgc2lkZSB3YWl0IGFuZCBkb2Vzbid0IGJvb3Qu
DQpJIGRvbid0IHVuZGVyc3RhbmQgaGVyZSB3aGF0IGlzIGhvbGRpbmcgQmlvcyBoZXJlIGJ1dCBi
eSBpbml0aWFsaXppbmcgdGhpcyBMUEMgY2xvY2sgbGV0IGJpb3MgYm9vdC4NCg0KUmVnYXJkcw0K
LVZpamF5IA0KDQo=
