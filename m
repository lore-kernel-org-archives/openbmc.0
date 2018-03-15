Return-Path: <prvs=6612f81223=amithash@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6612f81223=amithash@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="hv9vbMcD"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ICmV7wat"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 402H7X6W41zF1Gt
 for <openbmc@lists.ozlabs.org>; Fri, 16 Mar 2018 05:24:52 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2FIFYAg023729; Thu, 15 Mar 2018 11:24:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=cVtkcbrIyTwKsUmZuTisqOna0O+7tfAsP/Y/0HIrXaA=;
 b=hv9vbMcDYbsqSbMf0l9C7hvTrJDBDU0hO0jR41p4+kGBv1hFC2WpxJigludDf/bjFw9j
 Ujq1m/InySEarqXBp0Iekf9HuKDJGZiP674h1fuwgBbiMLniBr3hAIsOcISyoTqoKYZJ
 ywh9cvNt3Rp6dRwFciASaYT8avGcukYKjVo= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2gqw6587t8-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 15 Mar 2018 11:24:44 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.23) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Thu, 15 Mar 2018 11:24:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=cVtkcbrIyTwKsUmZuTisqOna0O+7tfAsP/Y/0HIrXaA=;
 b=ICmV7wattuuptGsHA8dvl2Fb/7w/5L+acOEZUernLwuIjkJl+B6oEhXHor/yMEHz8uylE87NgtAM5Tx25pkURPDmvyKFqT1vQKQnegcGkp35+6w5VEhQU1q280TpszxtCvd4EL67OizcjJziLOoXp7u+cVuzUSOVq2t3HRVFElQ=
Received: from MWHPR15MB1486.namprd15.prod.outlook.com (10.173.235.7) by
 MWHPR15MB1279.namprd15.prod.outlook.com (10.175.3.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.567.14; Thu, 15 Mar 2018 18:24:41 +0000
Received: from MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::248a:23b8:1621:5422]) by MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::248a:23b8:1621:5422%13]) with mapi id 15.20.0588.013; Thu, 15 Mar
 2018 18:24:41 +0000
From: Amithash Prasad <amithash@fb.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add Portwell Neptune
 machine
Thread-Topic: [PATCH linux dev-4.10] ARM: dts: aspeed: Add Portwell Neptune
 machine
Thread-Index: AQHTt0Ub7lzSomdY80WAc7Om0XDeg6PNoMGAgAORHwA=
Date: Thu, 15 Mar 2018 18:24:41 +0000
Message-ID: <8E79C775-5146-4C84-9A8B-EA25BF6BF630@fb.com>
References: <20180309012156.2997915-1-amithash@fb.com>
 <CACPK8XcO3LTE+R1NjV9yvrWsYis0u-RVfYxJ3dDdFNRRoYb3Hg@mail.gmail.com>
In-Reply-To: <CACPK8XcO3LTE+R1NjV9yvrWsYis0u-RVfYxJ3dDdFNRRoYb3Hg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5:67af]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1279;
 7:dCTsaSVqhAXO7FW9mRsFhOTwmNfFVa2vylt3tbEsRgC62Pi11CzHIpy0bYttXGSYgQKJYvQJweH5M2XuMywaP6HsDKAO35bLi3xC5VQJ0pxwhRm4yyq/l+zT8lZv3xgBriF3gDwjqHXLwyFplWwZbN9OCI8z8jPkXc0SfUJw9G4wQwmjKBuRuHZTDX4X3z9FvDnswgrFzN75dJfvPQoWkQPgZZ0M5vsK8sQB+GkDcJj+eYfa+nj6LfUMqnQVQMyp;
 20:vYTS53O4nWSFgujarxMQy/icm6If3qf6SD0Bj6Ziko9ac+IEP3vq6hoEheu7EIY1zkLcoleKA7n4Np+VIu4KBMzDMwP1lmhOQ+93xTgQ1RLuYZPns1JUupzOcx/dsPZvDZoYn0VO5x6s20Pdr5zlghjKcFvhgyoJZYZjqnrtSCU=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 3927aafe-9833-416f-b71a-08d58aa20525
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1279; 
x-ms-traffictypediagnostic: MWHPR15MB1279:
x-microsoft-antispam-prvs: <MWHPR15MB1279B4EEA2A1BBE92C4FC85AB2D00@MWHPR15MB1279.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231221)(11241501184)(944501244)(52105095)(3002001)(93006095)(93001095)(10201501046)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
 SRVR:MWHPR15MB1279; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1279; 
x-forefront-prvs: 0612E553B4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(346002)(366004)(39860400002)(39380400002)(189003)(199004)(106356001)(6116002)(6512007)(4326008)(316002)(186003)(478600001)(14454004)(3660700001)(46003)(8936002)(105586002)(86362001)(305945005)(3280700002)(2950100002)(83716003)(6486002)(97736004)(82746002)(102836004)(36756003)(5250100002)(7736002)(81166006)(6506007)(76176011)(33656002)(81156014)(110136005)(6246003)(229853002)(99286004)(68736007)(2906002)(5660300001)(59450400001)(8676002)(2900100001)(25786009)(53936002)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1279;
 H:MWHPR15MB1486.namprd15.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: bpPTW1vPvoIJTFBLm7X6QZ29XbWCnJdbPbrvfAGlUOyFXNkPnbw6UcjoXvUo31DlmJu1mO1Ov1X0LZ2H2yBjD7qOuOskPE1ixNmVPG45JLIzSVivMaZryLjtPE6W6BmGFSfemNETydteCARlWmyj6h04LIKV2D1SSs8bftuu+whTh8HOCFoCKCjwoaPFZPvSGmLHdiknoeaXICg9WpqLxKSiOCaZNlkO2MYD9XMjZE1RKBsuXWP1w/gIyW8Oh6htc3H9DNTs5i8UVWESKptl8ieNOv+WNVt/rexzTqQgACSQIrzYsNnq+v6clXxooBn0Bh1b2k6yJmdy9JVtjEdTgA==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <C19876C7541BE84D979D266071BABD6A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3927aafe-9833-416f-b71a-08d58aa20525
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2018 18:24:41.7548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1279
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-15_10:, , signatures=0
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
X-List-Received-Date: Thu, 15 Mar 2018 18:24:58 -0000

PiBJIGxpa2UgdG8gaGF2ZSBhIHNlbnRlbmNlIGFib3V0IHRoZSBtYWNoaW5lIGl0J3MgaW4uIFNv
bWV0aGluZyBsaWtlOiANCj4gTmVwdHVuZSBpcyBhIHg4NiBzZXJ2ZXIgZGV2ZWxvcG1lbnQga2l0
IHdpdGggYSBBU1BFRUQgYXN0MjUwMCBCTUMNCj4gICAgbWFudWZhY3R1cmVkIGJ5IFBvcnR3ZWxs
Lg0KUm9nZXIgdGhhdCEgV2lsbCBzZW5kIG91dCBhbiB1cGRhdGUgd2l0aCBtb3JlIGluZm9ybWF0
aW9uLg0KDQo+PiArJndkdDIgew0KPj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+PiArfTsg
ICAgDQo+Pg0KPiAgICBXZSBjYW4gZHJvcCB0aGlzOyB0aGUgdXBzdHJlYW0gZHRzIG5vdyBlbmFi
bGVzIHdkdDEgYW5kIHdkdDIgYnkgZGVmYXVsdC4NCkkgbm90aWNlIHRoYXQgNC4xMyBoYXMgdGhp
cyBidXQgNC4xMCBkb2VzIG5vdC4gSG93IGFib3V0IGhhdmUgdGhpcyBmb3INClRoZSA0LjEwIGJy
YW5jaCAoU2luY2UgdGhlIG9wZW5ibWMgZGlzdHJvIGRlZmF1bHRzIHRvIDQuMTApIGFuZCB0aGUg
Y2hlcnJ5LXBpY2sNCnRvIDQuMTMgKHRoZSB1cHN0cmVhbSBjYW5kaWRhdGUpIHNob3VsZCBkcm9w
IGl0Lg0KDQo+PiArJnVhcnQxIHsNCj4+ICsgICAgICAgLy8gSG9zdCBDb25zb2xlDQo+PiArICAg
ICAgIHN0YXR1cyA9ICJva2F5IjsNCj4+ICAgIA0KPiAgICBJIHRoaW5rIHlvdSBuZWVkIHRoZSBw
aW5jdHJsIG5vZGVzIGZvciB0aGlzLiBBbmRyZXcgSiBjYW4gcHJvdmlkZSBtb3JlIGRldGFpbC4N
Cg0KVGhhbmtzISBZZXMsIEkgc2VlbSB0byBiZSBtaXNzaW5nDQorICAgICAgIHBpbmN0cmwtbmFt
ZXMgPSAiZGVmYXVsdCI7DQorICAgICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF90eGQxX2RlZmF1
bHQNCisgICAgICAgICAgICAgICAgICAgICZwaW5jdHJsX3J4ZDFfZGVmYXVsdD47DQooRnJvbSBp
bnNwZWN0aW5nIHRoZSBzY2hlbWF0aWMsIHRoZXJlIHNlZW1zIHRvIGJlIGp1c3QgdHdvIHBpbnMg
aG9va2VkIHVwKS4NCkkgd2lsbCBpbmNsdWRlIHRoaXMgaW4gVjIuDQoNCg==
