Return-Path: <prvs=4840d6131a=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=4840d6131a=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="dPuRk7vD"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="OFJqHUGM"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42kLGp5X3RzDsN0
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 03:51:42 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9TGk0UZ020205; Mon, 29 Oct 2018 09:51:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Ot7JchlE+gM8GNpCw6x3SsrsZIjV+mfcd6jaH7KwzPY=;
 b=dPuRk7vDJxE8TK8LidxEHAqh7SaFP8CHX0fclQ7M1qXod/JCn7n35BiDqNrtCRK9YBTJ
 PTgItu5jvAdrwEamJWj8zCaAS4fhZ7fHMgnsvrvgTVwywxL+GZp2F2pGvndblqyzKXhe
 lvW7W+0rsI0vQQvUFk+euFsX7LsRPWet3DA= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2ne3138nf1-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 29 Oct 2018 09:51:39 -0700
Received: from frc-hub02.TheFacebook.com (2620:10d:c021:18::172) by
 frc-hub02.TheFacebook.com (2620:10d:c021:18::172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 29 Oct 2018 09:50:44 -0700
Received: from FRC-CHUB04.TheFacebook.com (2620:10d:c021:18::23) by
 frc-hub02.TheFacebook.com (2620:10d:c021:18::172) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Mon, 29 Oct 2018 09:50:44 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.24) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Mon, 29 Oct 2018 12:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ot7JchlE+gM8GNpCw6x3SsrsZIjV+mfcd6jaH7KwzPY=;
 b=OFJqHUGMZsPs2Aw2z2fARv9dEsdVZ+q3pPA2tTBTa8BY+3LXZbBdc+xmCL0XytLib+rmKlPEw9HzcLvyT1jTdadJRjqehWIIleSb2wQgk9BuMZ436tXwJqti8IVK6yyIOgwyPP3YKMeBYd4wGBkHGQMUqH9Iig5XWi43nTxb+7o=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1584.namprd15.prod.outlook.com (10.173.235.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1273.26; Mon, 29 Oct 2018 16:50:24 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::11cd:add9:dd51:383d]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::11cd:add9:dd51:383d%6]) with mapi id 15.20.1273.027; Mon, 29 Oct 2018
 16:50:24 +0000
From: Sai Dasari <sdasari@fb.com>
To: Lei YU <mine260309@gmail.com>, "artemsen@gmail.com" <artemsen@gmail.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Host console logs service
Thread-Topic: Host console logs service
Thread-Index: AQHUa7IxFHXQI+tkOEWQG4/xfkodGaUuM+2AgANjAYD//6smgIAAka8AgAOra4CAAIMMgA==
Date: Mon, 29 Oct 2018 16:50:23 +0000
Message-ID: <537CD6BC-1142-440B-90C5-AD33C8C5DDE6@fb.com>
References: <CAHsrh9+PQ9GKX7DMMC8oAdvNEamsw5dbfRmiTSi3kWuA6j0R_g@mail.gmail.com>
 <601A1A07-A444-4602-AC42-7E686B1CE03A@fb.com>
 <CAHsrh9KDjs8jg-x4NYooVH1cvmzv=em1C7=6OUBaUx1cOCVG5g@mail.gmail.com>
 <7D625D67-C92C-40A0-B216-6A33EF805BD7@fb.com>
 <CAHsrh9JB13DDETbDhbvkVbLb5PoRB9EFJCVj-c9TKU_5oyZP1A@mail.gmail.com>
 <CAARXrtmFSJ=p0OjkHCBqJ3+9DVADdM-TAX0azySZKu-3QHsAtg@mail.gmail.com>
In-Reply-To: <CAARXrtmFSJ=p0OjkHCBqJ3+9DVADdM-TAX0azySZKu-3QHsAtg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:380::2:dfe9]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1584;
 20:X8uJCvsZEHSLH512QCs1+x9/KXXivulmp2VmnTd6U7faqZtgl498YF/8Mv14IcQKQ9vB65S5UaqhEoc6fesRqIpirbFI8GPhhIic38kp/bRLnKX0iheS46KeOG9gYpADmyeQRY2B8BS3H2FaaYBjRXBPGT6d2T3uNhy7TIWMLnQ=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 5280984f-d200-459e-168f-08d63dbe9f1b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1584; 
x-ms-traffictypediagnostic: MWHPR15MB1584:
x-microsoft-antispam-prvs: <MWHPR15MB1584814CD096276D5FE5480ACEF30@MWHPR15MB1584.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(17755550239193)(166708455590820)(85827821059158); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231382)(11241501184)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1584; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1584; 
x-forefront-prvs: 084080FC15
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(376002)(346002)(396003)(136003)(189003)(199004)(33656002)(36756003)(229853002)(99286004)(8936002)(110136005)(53936002)(305945005)(2616005)(6512007)(14444005)(71190400001)(71200400001)(8676002)(6306002)(76176011)(53546011)(11346002)(6506007)(39060400002)(14454004)(6246003)(2900100001)(7736002)(82746002)(102836004)(186003)(966005)(5250100002)(93886005)(46003)(256004)(316002)(476003)(81156014)(81166006)(6436002)(4326008)(86362001)(6486002)(5660300001)(2906002)(486006)(478600001)(68736007)(2501003)(97736004)(106356001)(105586002)(6116002)(25786009)(446003)(83716004)(3480700004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1584;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: N2KqwHkOv385Hm7WCEKXTjI4io6EZTV4+h5YBnzFbf5xNU5Olu6RiTnqvqaB2E+Ku3veBUlZweT/b9e4pt2B8WF2PmJc+amJ8buFangGZeb56+zEvZ8LAObhouPypqiNjBG7WWHO11TiVHheHo2qF8MQn1iJEAANyihpdixIVsaDTx+vONnVTgSPzNPHM0X1rgzTYo9KHPl8I5w+U3KM4ig0jZPHAbefZC8FxMsF+tVZS3v9KuzHHIy2HsMxMwdzU0c5y86D06SB0yYAyQJgF/pikkCvARX+M2Gs9N6zg+pA1Kd9najc2+WJK7rwmW3mdyJSkNQZj7S+I/Hp1gTKf3llU1TSoq8kWt58szLFXFI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <16575E47F79E744E9C3C8101370FE095@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5280984f-d200-459e-168f-08d63dbe9f1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2018 16:50:23.9749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1584
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-29_11:, , signatures=0
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
X-List-Received-Date: Mon, 29 Oct 2018 16:51:48 -0000

T24gMTAvMjgvMTgsIDc6MDIgUE0sICJMZWkgWVUiIDxtaW5lMjYwMzA5QGdtYWlsLmNvbT4gd3Jv
dGU6DQoNCiAgICBPbiBTYXQsIE9jdCAyNywgMjAxOCBhdCAxOjU5IEFNIEFydGVtIFNlbmljaGV2
IDxhcnRlbXNlbkBnbWFpbC5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+IEhvdyBjYW4gSSBjcmVh
dGUgYSBnZXJyaXQgcmVxdWVzdCBpZiB0aGVyZSBpcyBubyBnaXQgcmVwb3NpdG9yeSBmb3INCiAg
ICA+IHRoaXMgcHJvamVjdCBpbnNpZGUgT3BlbkJNQz8NCiAgICANCiAgICBUaGlzIGxvb2tzIGdv
b2QgYW5kIGNvdWxkIGJlIHZlcnkgdXNlZnVsIGZvciBlbmQgdXNlcnMuDQogICAgWW91IGNvdWxk
IGFzayBCcmFkIHRvIGNyZWF0ZSBhIHJlcG8gaW4gT3BlbkJNQywgb3IgcG9zc2libGUgcG9zdCB0
aGlzIGRlc2lnbg0KICAgIGRvYyBpbnRvIG9wZW5ibWMvZG9jcyBmb3IgcHJldmlldy4NCkNyZWF0
aW5nIGEgbmV3IHJlcG8gZm9yIGRlc2lnbiByZXZpZXcgc2VlbXMgdG8gYmUgb3ZlcmhlYWQuIFdv
dWxkIHByb3Bvc2UgdG8gc3VibWl0IHRoZSBuZXcgZGVzaWduIGRvY3MgZm9yIHJldmlldyBAIGh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2RvY3MvdHJlZS9tYXN0ZXIvZGVzaWducy4gVGhpcyB3
aWxsIGFsbG93IGNvbW11bml0eSB0byByZXZpZXcgdGhlIG5ldyBkZXNpZ25zIGFuZCBwcm9wb3Nl
IGVpdGhlciBpbXBsZW1lbnRpbmcgYXMgZXh0ZW5zaW9ucyB0byBleGlzdGluZyByZXBvIChlLmcu
IGVuaGFuY2VtZW50cyB0byBleGlzdGluZyBmZWF0dXJlIHNldCkgb3IgY3JlYXRlIGEgbmV3IHJl
cG8gKGUuZy4gZGVzaWduIGlzIHNvbWV0aGluZyBuZXcgb3IgYWx0ZXJuYXRpdmUpLiBTdWdnZXN0
aW9ucz8NCiAgICANCiAgICBUaGFua3MhDQogICAgDQoNCg==
