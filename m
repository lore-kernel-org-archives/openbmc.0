Return-Path: <prvs=38370a6f03=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=38370a6f03=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="leB6+E54"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="HvytR71f"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42hVqf6dxMzF3H1
 for <openbmc@lists.ozlabs.org>; Sat, 27 Oct 2018 04:10:20 +1100 (AEDT)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9QGCgK3029818; Fri, 26 Oct 2018 09:18:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=rp2yp+QL4zYClbG/ljTEYWBW5HYb1XKsG8gXn+34RXY=;
 b=leB6+E54IkPHqzFzO7fnnPu6u70ntiExI6HoE8gyaC4eSrWbl/pMpl4cIQTO058O/UZz
 1jsW0rYCJjJKgwq01jhfrYFuLREzvkVDH94+hEW5zmhDJZu6DaBqv3y50wvSK2cwOyjn
 ZVbOwBz1mDK1TZc2+Oc+ZB8aZb/XWVxnf+I= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0b-00082601.pphosted.com with ESMTP id 2nc5vsr40d-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 26 Oct 2018 09:18:44 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 26 Oct 2018 09:17:40 -0700
Received: from PRN-CHUB13.TheFacebook.com (2620:10d:c081:35::22) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Fri, 26 Oct 2018 09:17:40 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.23) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Fri, 26 Oct 2018 09:17:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rp2yp+QL4zYClbG/ljTEYWBW5HYb1XKsG8gXn+34RXY=;
 b=HvytR71fd8QYF2DCuuN//laz714hceFFo52VhJzz4QYi4O0FeDbcWUyteQH9A0FhlRAuMTVRtoRq64q9SoO127KLD9wajeeCofp6nzLFtzTJ92nBCpQda03zvKzsMQbI4/Em3n/dCOU3jbX+BAoVkm1xe1pZ9EIc0Pw3o+p6CHk=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1168.namprd15.prod.outlook.com (10.175.2.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1250.30; Fri, 26 Oct 2018 16:17:38 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::11cd:add9:dd51:383d]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::11cd:add9:dd51:383d%6]) with mapi id 15.20.1273.025; Fri, 26 Oct 2018
 16:17:38 +0000
From: Sai Dasari <sdasari@fb.com>
To: Artem Senichev <artemsen@gmail.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Host console logs service
Thread-Topic: Host console logs service
Thread-Index: AQHUa7IxFHXQI+tkOEWQG4/xfkodGaUuM+2AgANjAYD//6smgA==
Date: Fri, 26 Oct 2018 16:17:38 +0000
Message-ID: <7D625D67-C92C-40A0-B216-6A33EF805BD7@fb.com>
References: <CAHsrh9+PQ9GKX7DMMC8oAdvNEamsw5dbfRmiTSi3kWuA6j0R_g@mail.gmail.com>
 <601A1A07-A444-4602-AC42-7E686B1CE03A@fb.com>
 <CAHsrh9KDjs8jg-x4NYooVH1cvmzv=em1C7=6OUBaUx1cOCVG5g@mail.gmail.com>
In-Reply-To: <CAHsrh9KDjs8jg-x4NYooVH1cvmzv=em1C7=6OUBaUx1cOCVG5g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [64.71.18.60]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1168;
 20:ZTSmRIfc3bIss2FnJzSTin0HffJVZJCwkx/8i3spyUc0+zSJzs5yvYcRv31OkwBcAoBXAt+woCAdzLkjyk8pbWHiU0lLnTLKbEZnOfIQtmeLqly26UKz11g8g+6pOynRncyWH9haEP/wz+qtQ9A4ymTc9Ft4HehRKJjhCXknmRI=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 4af5862b-5a56-4175-2821-08d63b5e8c65
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1168; 
x-ms-traffictypediagnostic: MWHPR15MB1168:
x-microsoft-antispam-prvs: <MWHPR15MB11683BD5D9C87F39441F6BC3CEF00@MWHPR15MB1168.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(111885846020525)(85827821059158); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(11241501184)(944501410)(52105095)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1168; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1168; 
x-forefront-prvs: 083751FCA6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(376002)(346002)(39860400002)(396003)(199004)(189003)(6246003)(8676002)(14454004)(3480700004)(68736007)(81156014)(8936002)(6486002)(81166006)(6512007)(53936002)(97736004)(66066001)(6436002)(6306002)(966005)(2900100001)(36756003)(82746002)(5250100002)(1411001)(4326008)(25786009)(39060400002)(105586002)(106356001)(83716004)(99286004)(6916009)(71190400001)(71200400001)(478600001)(26005)(76176011)(6506007)(305945005)(7736002)(2906002)(5660300001)(3846002)(86362001)(2616005)(229853002)(476003)(102836004)(486006)(446003)(11346002)(6116002)(14444005)(186003)(256004)(33656002)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1168;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: XYqHgWNw++BFL3pYG+drzMnl9bMP9R7eKhme+28AEcOTw60XJ6Yw2w8Pk4sdMtftBR/toJvuxZigmDwfnfdjPVVyIiBwHJavTwJCE1OLpBN+JQhdikMQLob/gw/UFNRllZLRnwfFHLGqaeKBs/gKUSi9Ud7nYlek4As+yRlSEeBkdCV3mc9zfd4c2dbRdoI5l82c6+NXClyawPwzNwSlrcrttPoiu2jguRdDjP0DIMEJ0+KI/EarjEtSM0oy8U+HNOpjbiqM2KuF2LDE1gi2g4uqSmsCd+Yd41uv9w6eyFU8gcx5CiI9fPTs1CMfykMI6u3BEmpd/fcUidEVSOzBi4kYX8380w99bhfq03gRPDo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <759C13D5BFFEAC4C832EA2CFF110104A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af5862b-5a56-4175-2821-08d63b5e8c65
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2018 16:17:38.6501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1168
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-26_09:, , signatures=0
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
X-List-Received-Date: Fri, 26 Oct 2018 17:10:24 -0000

DQoNCu+7v09uIDEwLzI2LzE4LCA3OjIxIEFNLCAiQXJ0ZW0gU2VuaWNoZXYiIDxhcnRlbXNlbkBn
bWFpbC5jb20+IHdyb3RlOg0KDQogICAgSSBoYXZlIGRlc2NyaWJlZCB0aGUgYXJjaGl0ZWN0dXJl
IGFuZCBzZXJ2aWNlIGNhcGFiaWxpdGllczoNCiAgICBodHRwczovL2dpdGh1Yi5jb20vWUFEUk8t
S05TL3Bob3NwaG9yLWhvc3Rsb2dnZXIvYmxvYi9tYXN0ZXIvUkVBRE1FLm1kDQogICAgDQogICAg
UGxlYXNlLCBsb29rIHRocm91Z2ggYW5kIGxldCBtZSBrbm93IHdoYXQgeW91IHRoaW5rLg0KVGhl
IHdyaXRldXAvZGVzY3JpcHRpb24gbG9va3MgZ29vZCB0byBtZS4gSXQgd291bGQgYmUgZ3JlYXQg
dG8gc3VibWl0IHRoaXMgYXMgZ2Vycml0IHJlcXVlc3QgZm9yIHdpZGVyIGNvbW11bml0eSByZXZp
ZXcgYW5kIGhlbHBzIGluIGNvbW1lbnRpbmcgaW5saW5lIGZvciB0aGUgZG9jdW1lbnQgYW5kIGhh
dmUgZGVzaWduIGNvbnZlcnNhdGlvbi4gQW4gZXhhbXBsZSBmb3Igb25nb2luZyByZXZpZXcgQCBo
dHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6LyMvYy9vcGVuYm1jL2RvY3MvKy8xNDcx
Mi8NCiAgICBCZXN0IHJlZ2FyZHMsDQogICAgQXJ0ZW0gU2VuaWNoZXYNCiAgICBTb2Z0d2FyZSBF
bmdpbmVlciwgWUFEUk8uDQogICAgDQogDQoNCg==
