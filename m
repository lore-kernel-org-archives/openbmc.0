Return-Path: <prvs=8983677cc9=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=8983677cc9=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="KeUT+bTg"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="UczRdrwL"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QM5V6ZdmzDqNs
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 09:33:49 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2LMMs5r002055; Thu, 21 Mar 2019 15:33:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Otr7r08IjZqZ0NwyBFCYzA77LdVVyKvE8vx6uHu0Mjc=;
 b=KeUT+bTgtJEZ62YfOcyHgcnq9zCKBCSb6p6JqSDyzij35nkXx0QHhiGQTMNN7SNXkfzq
 jhjA4Cc1jJ7FpLHYRipnT7VEoMmXxCuunK0k98iIfv8FV4Jd4Su9FdnBKABMDxb2kk+4
 ybeHowP8O2UPVN2q6P7zgOjldoF+eXg4/UU= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2rcjc8r8a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 21 Mar 2019 15:33:46 -0700
Received: from frc-hub01.TheFacebook.com (2620:10d:c021:18::171) by
 frc-hub02.TheFacebook.com (2620:10d:c021:18::172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 21 Mar 2019 15:33:45 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.71) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 21 Mar 2019 15:33:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Otr7r08IjZqZ0NwyBFCYzA77LdVVyKvE8vx6uHu0Mjc=;
 b=UczRdrwL/1iVkjQinGcI2BNqg7WjWiZQkcnW/Afhv0oV5v/HCawm7Tkdgjy9aOtnzW5t81kC3B+qTo4ENERqw0RTTWEoANqQAyxLj5tOsUOpbaAp+y+1yJWychrcpRNRQVj5pkSet9DLCfh31T/jIclztB3qz6T625to2fZTxNM=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Thu, 21 Mar 2019 22:33:44 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d%3]) with mapi id 15.20.1709.015; Thu, 21 Mar 2019
 22:33:44 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [Potential Spoof] Re: IPMID crashing
Thread-Topic: [Potential Spoof] Re: IPMID crashing
Thread-Index: AQHU4DYkRcXZ+mrXuU+PS6xN0RWR9A==
Date: Thu, 21 Mar 2019 22:33:44 +0000
Message-ID: <1FBBF5C1-6714-416E-88FE-0A2C5DD9E828@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:2139]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22f08a43-a375-4ea2-cbf1-08d6ae4d46d3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1269; 
x-ms-traffictypediagnostic: CY4PR15MB1269:
x-microsoft-antispam-prvs: <CY4PR15MB12693B5D539A9083AD1E4A75DD420@CY4PR15MB1269.namprd15.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(346002)(396003)(376002)(136003)(199004)(189003)(25786009)(256004)(83716004)(97736004)(486006)(46003)(4326008)(316002)(305945005)(6506007)(71190400001)(102836004)(71200400001)(2616005)(5660300002)(7736002)(86362001)(68736007)(53546011)(476003)(186003)(99286004)(14454004)(6916009)(6116002)(53936002)(6512007)(6486002)(2906002)(81156014)(8676002)(82746002)(4744005)(6436002)(229853002)(33656002)(81166006)(105586002)(36756003)(6246003)(8936002)(106356001)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1269;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: p/eMP+STafaaeQAtTgpzwToM91z2yaGaC5yvvLfKfKQ2T1OUsByeqH8ke2+em4dvnECa0hijz31CR4opyMAqGWidNRY9jsCZeJzGq2+AqJgaKBdXmTpvCyF8kLaipCwQk+A9euPVKNc/L1e5UzUP3iPvomCylMFMoBKSsvCZiDgnNbYS2JGf7yaTVrVcVB5XJ+/H+QS2XmNGpLgZWpXjeSOIO4yjJn7OdklTWj1L9zWqBo/ukbd3ikSAYM0ZUgaQQG1CMSRYNvSgu9N3Bo+aJj1kRMa5oUTbXeIsL1f/z+u43448rAbWeURH9OD3BGCYCkLwDXT8th1PLHTh9VoJK6iM5w0l/NObqytScm1dsyJ5ipCMBckzTkYw/o7UPbjYWIIwgFNLrrauyyKuJSSq2iNaOVKmxvw/2IXuCpWdras=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EFB82CC18A19A44BFC4F0737474A68D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f08a43-a375-4ea2-cbf1-08d6ae4d46d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 22:33:44.2573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1269
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-21_10:, , signatures=0
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
X-List-Received-Date: Thu, 21 Mar 2019 22:33:51 -0000

VmVybm9uLA0KSXQgaXMgZ2V0dGluZyBjb3JydXB0ZWQgd2hpbGUgdXNpbmcgbGliaXBtaWQuIEkg
c2VlIG5vdyBmb2xsb3dpbmcgbWVzc2FnZXMNCg0KZG91YmxlIGZyZWUgb3IgY29ycnVwdGlvbiAo
IXByZXYpDQpBYm9ydGVkDQoNCg0KUmVnYXJkcw0KLVZpamF5DQoNCu+7v09uIDMvMjEvMTksIDI6
MzQgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBWaWpheSBLaGVta2EiIDxvcGVuYm1jLWJvdW5j
ZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mIHZpamF5
a2hlbWthQGZiLmNvbT4gd3JvdGU6DQoNCiAgICBJIHNlYXJjaGVkIGZvciB0aGlzIG91dHB1dCBz
dHJpbmcgYW5kIGZvdW5kIGluIGxpYmMtMi4yOC5zbyBhbmQgbGliYy5hLiBJIGhhdmUgbm8gaWRl
YSwgd2hhdCBpcyBpdCBkb2luZy4gSSBoYXZlIGV4ZWN1dGVkIGl0IG1hbnVhbGx5IGZyb20gY29t
bWFuZCBsaW5lIGFuZCBjYW4gc2VlIGFsbCBvZW0gZnVuY3Rpb25zIGl0IHJlZ2lzdGVycy4NCiAg
ICANCiAgICBPbiAzLzIxLzE5LCAxMjo0NyBQTSwgIlZlcm5vbiBNYXVlcnkiIDx2ZXJub24ubWF1
ZXJ5QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQogICAgDQogICAgICAgIE9uIDIxLU1hci0yMDE5
IDA3OjM4IFBNLCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAgICAgID5BbnlvbmUgaXMgc2VlaW5n
IGlwbWlkIGNyYXNoaW5nLiBJIGhhdmUgY2hlY2tlZG91dCBvcGVuYm1jIHRvZGF5IGFuZCBzZWVp
bmcgaXBtaWQgaXMgY3Jhc2hpbmcgd2l0aCBmb2xsb3dpbmcgbWVzc2FnZQ0KICAgICAgICA+DQog
ICAgICAgID5yZWFsbG9jKCk6IGludmFsaWQgbmV4dCBzaXplDQogICAgICAgIA0KICAgICAgICBX
aGF0IHdhcyBpdCBkb2luZz8gV2hhdCBJUE1JIGNvbW1hbmQgd2FzIHJ1bm5pbmcgd2hlbiBpdCBj
cmFzaGVkPyBXaGF0IA0KICAgICAgICBwcm92aWRlciBsaWJyYXJpZXMgZG8geW91IGhhdmUgaXQg
bG9hZGluZz8NCiAgICAgICAgDQogICAgICAgIC0tVmVybm9uDQogICAgICAgIA0KICAgIA0KICAg
IA0KDQo=
