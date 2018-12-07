Return-Path: <prvs=5879b2424d=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5879b2424d=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="WqLakzdX"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="aUV/557o"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 439vD81ZVnzDrSK;
 Fri,  7 Dec 2018 11:56:03 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wB70tT5i022475; Thu, 6 Dec 2018 16:55:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=QiMu4cePwrenyMhbSApRu/z9mDsYhsGiiu3YjgHy10k=;
 b=WqLakzdXCByQoxohjIz0nU/+Y2By1cGo1CG9h3YjB5jcRHo9myvlYpAk0FI54jdp3CbA
 M2LX5hFa3+GuKINhQxoSmKMQ6VA8DzXeh1xsKosx7RKAF2UkW+3b7zT5F5lTmCIIoIRz
 wi81BD/CS7JVYB4Yz9eKceR9rYLvbE/+PNc= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2p7dmn86k0-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 06 Dec 2018 16:55:34 -0800
Received: from frc-hub05.TheFacebook.com (2620:10d:c021:18::175) by
 frc-hub04.TheFacebook.com (2620:10d:c021:18::174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 6 Dec 2018 16:55:26 -0800
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.75) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Thu, 6 Dec 2018 16:55:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiMu4cePwrenyMhbSApRu/z9mDsYhsGiiu3YjgHy10k=;
 b=aUV/557oY8RQSa2SPkCr0ghZJMr1da8r5xiRNvlWJmmGOhd8dSMzJJSVj8wXuRfA07Bjzd7ujFkgWdoucS3R8LiaS+UGwdIVvAXQozWjhwJfbPW6LQcrDdtYXKu4HpsiLnmS6gWrsGp3XvutVT8dgHVAMdjvWE9aON+T+k8sP4Q=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1806.namprd15.prod.outlook.com (10.174.255.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.18; Fri, 7 Dec 2018 00:55:24 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::e41d:eb0b:4f66:3d71]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::e41d:eb0b:4f66:3d71%10]) with mapi id 15.20.1404.021; Fri, 7 Dec 2018
 00:55:24 +0000
From: Tao Ren <taoren@fb.com>
To: Joel Stanley <joel@jms.id.au>
CC: Andrew Jeffery <andrew@aj.id.au>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add Facebook Backpack-CMM BMC
Thread-Topic: [PATCH v3 2/2] ARM: dts: aspeed: Add Facebook Backpack-CMM BMC
Thread-Index: AQHUd8ZPYbOYW/LKzUmE2FUDjWFvH6VsNaoAgAXjvoA=
Date: Fri, 7 Dec 2018 00:55:24 +0000
Message-ID: <2A7BF626-2647-4A24-AD9F-B167CB05250D@fb.com>
References: <20181109005046.210657-1-taoren@fb.com>
 <CACPK8XfVHDwso=kMXjk_6Q0eEJTQxUC5B=onqLfw6QzAYZU7vQ@mail.gmail.com>
In-Reply-To: <CACPK8XfVHDwso=kMXjk_6Q0eEJTQxUC5B=onqLfw6QzAYZU7vQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.0.180812
x-originating-ip: [2620:10d:c090:180::1:2d25]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1806;
 20:WA2VZtpM0nH5IrdDAcxLmLe/rz9s8km37QMelgQUaj+YVTLIsp86t088d6Must1Wq86gp1pvRZGd0HYIaTSJGcN/P41HPyScMucg5hAfkBiGcLueizndYV10v5hMKbv+z2N1PbEUJF0MW9AzfE6JofV9dS8/KYQcG5xBeu6+rdw=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 82c2a7c3-ae7d-4851-86a8-08d65bdeac26
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1806; 
x-ms-traffictypediagnostic: MWHPR15MB1806:
x-microsoft-antispam-prvs: <MWHPR15MB180625B9AC73AD83E9F42234B2AA0@MWHPR15MB1806.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(3231455)(999002)(11241501185)(944501520)(52105112)(10201501046)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1806; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1806; 
x-forefront-prvs: 0879599414
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(346002)(376002)(136003)(366004)(47680400002)(199004)(189003)(2616005)(99286004)(8936002)(6486002)(476003)(6116002)(11346002)(446003)(86362001)(486006)(5660300001)(68736007)(71190400001)(81156014)(81166006)(6436002)(8676002)(46003)(71200400001)(82746002)(33656002)(83716004)(2906002)(106356001)(53936002)(105586002)(229853002)(58126008)(316002)(186003)(97736004)(256004)(4326008)(6512007)(478600001)(6916009)(25786009)(76176011)(6246003)(102836004)(305945005)(36756003)(53546011)(54906003)(14454004)(7736002)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1806;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 1jpkADKOZ5T7VKaetVmyJ8QOFQ9V/vQdPmhSNwmpwNmas3mDh2Ccyu+4J73SuIUZd8k7chS1hBLL3hh3udrAd37BOGrZIJUe+iQQIdxqN7MdYZcqA00nlrOM5VteLbbeLq6F8TAIFfe6G/yN9L6Azp5Onv6hGG44V2hd6CI7QmYIq43cqT0BdCKRIime5heK1LHlkWNtpPMYpAs7thRgaZ8m9VDC3IohEiFjCAzG/7xOipXOeISO0bytHS4YDqmIn0ZupM1koHrXhOyljecU4ZCYT/Pwc1NKQag96JGxuZswu2kD9UkgAEIvfn/aj2Pz8qYlYjxdMnAV0Ba+CtyPWM/6DEHZQjQhd42KkXJK/fI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <23D8BCDC65713647B96920C1FE21485F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c2a7c3-ae7d-4851-86a8-08d65bdeac26
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2018 00:55:24.6745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1806
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-06_08:, , signatures=0
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
X-List-Received-Date: Fri, 07 Dec 2018 00:56:10 -0000

T24gMTIvMi8xOCwgMjo1OSBQTSwgIkpvZWwgU3RhbmxleSIgPGpvZWxAam1zLmlkLmF1PiB3cm90
ZToNCg0KPiBPbiBGcmksIDkgTm92IDIwMTggYXQgMTE6MjAsIFRhbyBSZW4gPHRhb3JlbkBmYi5j
b20+IHdyb3RlOg0KPj4NCj4+IEFkZCBpbml0aWFsIHZlcnNpb24gb2YgZGV2aWNlIHRyZWUgZmls
ZSBmb3IgRmFjZWJvb2sgQmFja3BhY2sgQ01NDQo+PiAoQ2hhc2lzIE1hbmFnZW1lbnQgTW9kdWxl
KSBhc3QyNTAwIEJNQy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUYW8gUmVuIDx0YW9yZW5AZmIu
Y29tPg0KPg0KPiBUaGFua3MuIEkndmUgbWVyZ2VkIHYzIGZvciBpbmNsdXNpb24gaW4gNC4yMS4N
Cg0KVGhhbmsgeW91IEpvZWwhDQoNCkNoZWVycywNCg0KVGFvDQogDQoNCg==
