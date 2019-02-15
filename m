Return-Path: <prvs=79497c970c=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=79497c970c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Y+TQW33e"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="W7femZRQ"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 441Pz95b2YzDqM2
 for <openbmc@lists.ozlabs.org>; Sat, 16 Feb 2019 07:30:42 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x1FKQbZm027981;
 Fri, 15 Feb 2019 12:30:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=d+PxsdkflFGL5l7QJPOIdokMZ1y43JjjTsIIhJ4hhLM=;
 b=Y+TQW33ej5vCIlrZDEbl2YjLNRm0IWVM9xuXkoNZ/SwW4+gfyGVpcaRXQ5f0rs7/wtyV
 xAaFSYfxLLmorRYnfKdA3GkvlaqCjM8lQSV0CK76OCQ7qquS/AC9jTbtVf9rGFH5q9su
 bTihuBHa1w9BO8l44fze1d2UqbTOTuWF/sI= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2qp47vr1wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 15 Feb 2019 12:30:37 -0800
Received: from prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 15 Feb 2019 12:30:36 -0800
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 15 Feb 2019 12:30:35 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Fri, 15 Feb 2019 12:30:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+PxsdkflFGL5l7QJPOIdokMZ1y43JjjTsIIhJ4hhLM=;
 b=W7femZRQED5fA9i1YwFlbwIB6PzypaQnQDOo+Vq7NJOWnMCVcTq4NcFilI9/pTmmOk6h3DUJgnCTRkZ2EkJ74GRBrOa7IJHoP9L0WEU7mnJmRvaedHD3ZiKEy4Z69PRiIMcvdL9y7eYJm3ZR5ENZZV/XFui0XVOUMSpM/quqRAY=
Received: from BN6PR15MB1265.namprd15.prod.outlook.com (10.172.205.146) by
 BN6PR15MB1698.namprd15.prod.outlook.com (10.174.239.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.17; Fri, 15 Feb 2019 20:30:34 +0000
Received: from BN6PR15MB1265.namprd15.prod.outlook.com
 ([fe80::303d:c3e3:57f:23f1]) by BN6PR15MB1265.namprd15.prod.outlook.com
 ([fe80::303d:c3e3:57f:23f1%5]) with mapi id 15.20.1622.016; Fri, 15 Feb 2019
 20:30:34 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Wim Vervoorn <wvervoorn@eltan.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Adding IPMI support to an existing implementation
Thread-Topic: Adding IPMI support to an existing implementation
Thread-Index: AdTFIDsr8pTdO/3NT8aRBIZaZyiwgwACgNuA
Date: Fri, 15 Feb 2019 20:30:33 +0000
Message-ID: <6E1BC227-2D18-43DA-94C1-2B726BC37B3D@fb.com>
References: <5cb3deac47694e52afdf214837928110@Eltsrv03.Eltan.local>
In-Reply-To: <5cb3deac47694e52afdf214837928110@Eltsrv03.Eltan.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:48a3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b7baf90-0396-4ca2-ede5-08d693846fee
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR15MB1698; 
x-ms-traffictypediagnostic: BN6PR15MB1698:
x-microsoft-exchange-diagnostics: 1; BN6PR15MB1698;
 20:E6qoHyfU+nJtIOdpvUI6aBdJsCPzrDVLGV1ShGgmNxpG5wM/QJ0bQ/eLBdfniamYCbWAPteZHw/KFc0g2dePvyCqu8dZfe1RpOLsF43b0OdakgTjIb5qL8lyDotufYefyr66I/9wiQvU82ihpsse0L4FTAeUZP+K1qV5//dcmxQ=
x-microsoft-antispam-prvs: <BN6PR15MB169863501CE152C6D47A4B74DD600@BN6PR15MB1698.namprd15.prod.outlook.com>
x-forefront-prvs: 09497C15EB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(396003)(136003)(39860400002)(376002)(189003)(199004)(8676002)(110136005)(14454004)(82746002)(186003)(316002)(7736002)(305945005)(6506007)(102836004)(8936002)(81166006)(4744005)(81156014)(6116002)(46003)(76176011)(2906002)(11346002)(99286004)(446003)(68736007)(71190400001)(71200400001)(36756003)(105586002)(106356001)(6246003)(25786009)(6512007)(256004)(486006)(2616005)(53936002)(33656002)(2501003)(86362001)(83716004)(478600001)(476003)(229853002)(6436002)(97736004)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR15MB1698;
 H:BN6PR15MB1265.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jsGs2V/L/R23mxzsrao0dHWFUi+7fN9iCJH43bagzZt6yJPv591QdS2ak6iX7kPq9KXCZPYPZB09NlI9oKAjhrqI1J9+rR1p8aBNhhmg0XNzKcJ1K0eBwacM5Bw9RaYZiqEBz1CZ/QBZkXb3smBFP3C6JT6zoGMBLqcLNVoKm829ZaQLkh9PdwJrfAA/Ura2/PO8nv+tcg7MLAvcOTdU66pgocKeUKjnPuvuflwJJIzQzKKp6Q6PxRBK4PHAd830GQzPZ8ANmOZs7UsIXvQDUWmvBr1RRp3U2dhxIFSCIfQJPHn1m4lGluw6UCBmYQI45xYEwBJZ8sC+4U8qsXp1B1me+LG9eTWQEZrAyDW4j0KL+d5+RozjHG/EeAGiU2wwrzI+JEENt/56wlAWtk+TynBLerfoCjLx4gnqgcORQIk=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DDD5C69B6C7554EB8E1F249DFC5FD74@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7baf90-0396-4ca2-ede5-08d693846fee
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2019 20:30:34.0688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR15MB1698
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-15_14:, , signatures=0
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
X-List-Received-Date: Fri, 15 Feb 2019 20:30:47 -0000

SGkgV2ltLA0KV2hhdCBhcmUgdHJ5aW5nIGhlcmUsIGFkZGluZyBleHRyYSBpcG1pIHN1cHBvcnQg
Zm9yIHlvdXIgb2VtIGNvbW1hbmRzPyBJUE1JIHN1cHBvcnQgaXMgYWxyZWFkeSB0aGVyZSBpbiBw
aG9zcGhvci1pbWFnZS4gUGxlYXNlIHNlZSBpZiAiaXBtaWQiIGRhZW1vbiBpcyBydW5uaW5nLiBZ
b3UgY2FuIGNoZWNrIHBhY2thZ2UgcGhvc3Bob3ItaXBtaS1ob3N0IHdoaWNoIHByb3ZpZGVzIHN1
cHBvcnQgZm9yIGlwbWkgZGFlbW9uLg0KDQpSZWdhcmRzDQotVmlqYXkNCg0K77u/T24gMi8xNS8x
OSwgMzoyMyBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIFdpbSBWZXJ2b29ybiIgPG9wZW5ibWMt
Ym91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBiZWhhbGYgb2Yg
d3ZlcnZvb3JuQGVsdGFuLmNvbT4gd3JvdGU6DQoNCiAgICBIZWxsbywNCiAgICANCiAgICBXZSBo
YXZlIGFuIGV4aXN0aW5nIEFTVDI0MDAgYmFzZWQgaW1wbGVtZW50YXRpb24gZm9yIE9wZW5CTUMg
Mi42LjAgYW5kIGFyZSB0cnlpbmcgdG8gYWRkIElQTUkgc3VwcG9ydCB0byBpdC4NCiAgICANCiAg
ICBBdCB0aGlzIG1vbWVudCB3ZSBkb24ndCBoYXZlIGEgZ29vZCBzZXQgb2YgZG9jdW1lbnRhdGlv
biBvbiB0aGUgaXBtaSBpbXBsZW1lbnRhdGlvbiBpbmNsdWRlZCBpbiBPcGVuQk1DLg0KICAgIA0K
ICAgIENhbiBhbnlvbmUgcG9pbnQgbWUgdG8gdGhpcyBkb2N1bWVudGF0aW9uPyBPciBpcyB0aGUg
b25seSB3YXkgdG8gZG8gdGhpcyB0byBnbyBvdmVyIHRoZSB2YXJpb3VzIHBhY2thZ2VzPw0KICAg
IA0KICAgIEJlc3QgcmVnYXJkcywNCiAgICANCiAgICBXaW0gVmVydm9vcm4NCiAgICANCg0K
