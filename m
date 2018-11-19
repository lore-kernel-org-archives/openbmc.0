Return-Path: <prvs=4861b53b39=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4861b53b39=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="NdGXbOzS"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="dglyxJW0"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42zG9v5JXwzF3JB
 for <openbmc@lists.ozlabs.org>; Tue, 20 Nov 2018 04:32:14 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAJHSI4s016364; Mon, 19 Nov 2018 09:32:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=3gDSTuOQrlnhy91W76uZpwAyra9TTl31spGaNaei968=;
 b=NdGXbOzSsfC5edb0H85o12lK1pat0Wip/1hOgk1bRb4wabc15f5EGE0Gdddqllf67gtc
 ReftlxaPLjwVUXxgQVWYdGAioisrs5J7lbERLFOvIJ1pxIc07pbFPLP7iXQYCvyZLeT+
 /ly7id4txOWYBFGKkNWRY3OB1ZBqD8EnUp8= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2nuxfg8v3y-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 19 Nov 2018 09:32:06 -0800
Received: from frc-hub01.TheFacebook.com (2620:10d:c021:18::171) by
 frc-hub03.TheFacebook.com (2620:10d:c021:18::173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 19 Nov 2018 09:31:52 -0800
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.71) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Mon, 19 Nov 2018 09:31:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gDSTuOQrlnhy91W76uZpwAyra9TTl31spGaNaei968=;
 b=dglyxJW0q+ezHt7yu4hadSyqnDIA45aHZJKWfiPP5Rgt3K29Yan9hAcNYSSJzJpoRg3KEow6Rm5/lA6iyOpEUXfmflsNl4ARJk3OVGXpXLhE4MZYx9YllZs7cKVUB+z+kpxQgVw7C0j3/Cs5rXQWNijvppR4akUTUGGrkeMc4EQ=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1472.namprd15.prod.outlook.com (10.173.234.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.30; Mon, 19 Nov 2018 17:31:50 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f8fb:c0d5:46cd:cf56]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f8fb:c0d5:46cd:cf56%2]) with mapi id 15.20.1339.027; Mon, 19 Nov 2018
 17:31:50 +0000
From: Sai Dasari <sdasari@fb.com>
To: Stewart Smith <stewart@linux.ibm.com>, Oskar Senft <osk@google.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "bradleyb@fuzziesquirrel.com"
 <bradleyb@fuzziesquirrel.com>, "gmills@linux.vnet.ibm.com"
 <gmills@linux.vnet.ibm.com>
Subject: Re: Submit board schematics to OpenBMC docs repo
Thread-Topic: Submit board schematics to OpenBMC docs repo
Thread-Index: AQHUfecCGIV3zRWTVEqxxjMxYuBjI6VSXEyAgACIjgD//5BTAIAEJhIAgAA+V4A=
Date: Mon, 19 Nov 2018 17:31:50 +0000
Message-ID: <8E7CB163-522C-4E9F-96AF-98C440A04530@fb.com>
References: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
 <BA3510D9-333A-40DB-9D03-43A5A2B2D963@fb.com>
 <CABoTLcTpMY4StimKijR4LmuSuc0dnnfxeTN=hv13WYghsOFcSw@mail.gmail.com>
 <2A161BFC-87CF-4FE9-9DC5-FF1712EE955C@fb.com>
 <87ftvxpqh1.fsf@linux.vnet.ibm.com>
In-Reply-To: <87ftvxpqh1.fsf@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:e4e1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1472;
 20:0wvUh3IWlq62Gu013DSRNiZqMEITYYnyKT0Vvj8C/XyG+qsPUWRtdAtZ/2U7m5Q9HOHuhlL/i4EAksyQEbIqOopiIblIkVNquALTGRKhJJR/ZiMdP1X8gQvcHr6XrA86wnhY+xoFuVRAYCKdf5G0xpaSi30d5SeUg1P3YgWPEI4=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 2870448f-57c7-49c5-b501-08d64e44e3d5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1472; 
x-ms-traffictypediagnostic: MWHPR15MB1472:
x-microsoft-antispam-prvs: <MWHPR15MB1472C4051FFE1B6AEC45B4C2CED80@MWHPR15MB1472.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(104084551191319)(67672495146484); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231415)(11241501184)(944501410)(52105112)(148016)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1472; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1472; 
x-forefront-prvs: 08617F610C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(136003)(39860400002)(376002)(366004)(189003)(199004)(4326008)(5660300001)(256004)(25786009)(105586002)(82746002)(93886005)(6116002)(106356001)(33656002)(6306002)(54906003)(6512007)(97736004)(316002)(102836004)(110136005)(6246003)(6436002)(45080400002)(76176011)(6506007)(2906002)(53936002)(81166006)(81156014)(2900100001)(186003)(6486002)(8676002)(478600001)(86362001)(8936002)(7736002)(229853002)(36756003)(305945005)(99286004)(486006)(68736007)(2616005)(11346002)(476003)(83716004)(966005)(14454004)(46003)(71190400001)(71200400001)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1472;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: AJnZUyYS8JATWzJujqZeJwHXLPYX2r6EbnDBzlJzMriZXF4VoJmUeG0ANoEQh0rSww8tU3RNoZrpPNNthzP8Xc0EjEq/ynbsG89408d43QvbqwSiG9ZIKVBwhCQYr8ovaFf3QLnTNpkWItF4Cq3ICo6MIA0lhBl8DhgGM05uDyu1m7/MxXxUybsbbl7cCzp+Dc9AiPUAy2XoLL9MXtbzvhbXJjNhviA07+eOomp8paTjggd/nk2mSlD06LPBplq/tBIoghTP2zQC6fAQ0rc7CdmRmvpYErEUP+txJlA5K2xCNCgSbp7Rl2FJiHt0MB7pFVf+/ihYJ/WVF2qXHCucZOAJfUjv2Wg6D+VZfXmK7BM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <047E6A2871481F4BA6CB7F236F2B854E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2870448f-57c7-49c5-b501-08d64e44e3d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2018 17:31:50.5048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1472
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-19_06:, , signatures=0
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
X-List-Received-Date: Mon, 19 Nov 2018 17:32:21 -0000

DQoNCu+7v09uIDExLzE4LzE4LCA5OjQ5IFBNLCAiU3Rld2FydCBTbWl0aCIgPHN0ZXdhcnRAbGlu
dXguaWJtLmNvbT4gd3JvdGU6DQoNCiAgICBTYWkgRGFzYXJpIDxzZGFzYXJpQGZiLmNvbT4gd3Jp
dGVzOg0KICAgID4gSSBndWVzcyB0aGlzIGlzIGEgcXVlc3Rpb24gb2YgIyBvZiBzbWFsbCByZXBv
cyB2cyBhIHNpbmdsZSBsYXJnZSByZXBvIHdpdGggYSBsb3Qgb2YgInN0dWZmIiBpbiBpdC4gSSBn
ZW5lcmFsbHkgcHJlZmVyIGZld2VyICh5ZXQgbGFyZ2VyKSByZXBvcyB2cy4gdGhlIG92ZXJoZWFk
IG9mIG1hbmFnaW5nIG11bHRpcGxlIHNtYWxsIHJlcG9zLg0KICAgID4gTWF5IGJlIGFuIGV4YW1w
bGUgd291bGQgY2xhcmlmeSBmb3IgbXkgc3VnZ2VzdGlvbiBvZiBlbWJlZGRpbmcgZGV0YWlscyB3
aXRoIHRoZSBtYWNoaW5lLiBJIHdhcyByZWZlcnJpbmcgdG8gaGF2aW5nIOKAmHdpdGhlcnNwb29v
buKAmSBzY2hlbWF0aWNzIGFsb25nIHdpdGggdGhlIG1hY2hpbmUgbGF5ZXIgQCBodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3RyZWUvbWFzdGVyL21ldGEtaWJtL21ldGEtd2l0aGVy
c3Bvb24uIFRoaXMgd2lsbCBwcm92aWRlIGNvbnRleHQgZm9yIGhvdyB0aGlzIG1hY2hpbmUgd2l0
aGVyc3Bvb24gaXMgZGVzaWduZWQgd2l0aCBhbGwgdGhlIGRldGFpbHMuKGh5cG90aGV0aWNhbCBh
c3N1bWluZyAgd2l0aGVyc3Bvb24gc2NoZW1hdGljcyBjYW4gYmUgc2hhcmVkIGluIG9wZW4pDQog
ICAgDQogICAgWW91ciBtYWlsIGNsaWVudCBhcHBlYXJzIGJyb2tlbiBhbmQgaXMgZmFpbGluZyB0
byBxdW90ZSByZXBsaWVzIGNvcnJlY3RseS4NClRoYW5rcyBTdGV3YXJkIGZvciBsZXR0aW5nIG1l
IGtub3cuIExldCBtZSBjaGVjayB3aGF0IE91dGxvb2sgc2V0dGluZ3MgbWlnaHQgYmUgY2F1c2lu
ZyB0aGlzLiBUaGFua3MhDQogICAgDQogICAgLS0gDQogICAgU3Rld2FydCBTbWl0aA0KICAgIE9Q
QUwgQXJjaGl0ZWN0LCBJQk0uDQogICAgDQogICAgDQoNCg==
