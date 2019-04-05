Return-Path: <prvs=9998348079=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=9998348079=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="D9rKle7I"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="kAIJHpWh"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44bSsw3XyBzDqGl
 for <openbmc@lists.ozlabs.org>; Sat,  6 Apr 2019 05:25:16 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x35IIohA023333; Fri, 5 Apr 2019 11:24:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=NRMn/MExX7JPK86z0JfISo+rc9hd/q5l9yHzoQ1yCfk=;
 b=D9rKle7IJojniGCvilmtI9EaWNfVi4BWl9OWhCOAlaZTXNZKpabX/Z8duvCeYtC8OgSk
 Fte7z7/wY6t9IxppLFnCQTDfNtHL5hYkUJaW6axrYjN3e7+fg6WieGDUlcEMKWz6qD4j
 0zOabf82BvIM6Fc0O7HbHMEYA7v+fDwcJVI= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2rpbcxr7d4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2019 11:24:12 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 5 Apr 2019 11:24:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 5 Apr 2019 11:24:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRMn/MExX7JPK86z0JfISo+rc9hd/q5l9yHzoQ1yCfk=;
 b=kAIJHpWhS9emEiiCW0VKcBQ53r9Ae2gOd8b5/KyZMhu8t+TO/n74I7OdMGuocy7C/eZzvqupfj3WhKAtT0GHFB4ZfxfnYneUz4zFLCWjvQRpYuSkNgcgUnvX4FsaOuqN+Qcj7YIByCU2cABhi6ojA3Mrt6HhSBkI3j4wcbdoWTY=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1799.namprd15.prod.outlook.com (10.174.54.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.20; Fri, 5 Apr 2019 18:24:10 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d%3]) with mapi id 15.20.1771.016; Fri, 5 Apr 2019
 18:24:09 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: gpis definition in entity manager
Thread-Topic: gpis definition in entity manager
Thread-Index: AQHU6zyLN1fcQof7Hk6AAl7e3AKFJKYtsuGA//+60oA=
Date: Fri, 5 Apr 2019 18:24:09 +0000
Message-ID: <489688ED-4E70-4927-B373-BCE45152E7A5@fb.com>
References: <24E07121-9DA2-4A65-878C-1D7C906A04C6@fb.com>
 <cbf4da18-9d4c-1fca-42ec-85386df0f0ed@linux.intel.com>
In-Reply-To: <cbf4da18-9d4c-1fca-42ec-85386df0f0ed@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::b21e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f4a62a0-6255-4959-fe06-08d6b9f3e59b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR15MB1799; 
x-ms-traffictypediagnostic: CY4PR15MB1799:
x-ms-exchange-purlcount: 5
x-microsoft-antispam-prvs: <CY4PR15MB1799B7D33EE024E6BAE3AA8EDD510@CY4PR15MB1799.namprd15.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(396003)(366004)(346002)(136003)(189003)(199004)(53936002)(71190400001)(8936002)(97736004)(476003)(82746002)(33656002)(4326008)(305945005)(36756003)(6306002)(486006)(2616005)(446003)(6116002)(68736007)(25786009)(14454004)(11346002)(6916009)(2906002)(76176011)(966005)(6506007)(83716004)(53546011)(81156014)(71200400001)(99286004)(5660300002)(46003)(6512007)(105586002)(6246003)(229853002)(102836004)(81166006)(256004)(186003)(6436002)(478600001)(86362001)(106356001)(7736002)(6486002)(316002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1799;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lBqe/9ELlImkA2XkTNzroqyO3p/hZK71wBjaEsnp34qG87YgDYrDhNH/HYG2o2w1/GE2XsIo40TBQs19nAQUq2X+hnuWMjMJXHURqOeqTKHsJ1vviOO5Gg9XCUWvXY+2xz4KULmSmnAyp/zYAxLH23Ztn1/cBsFvw6bxHR8EXthjff4dU0Q27ute7OUHFyBQTtZku2iAcP6VvtHcNplNcjyPBNQDlYgwxzQ4n4fRReNr/eW0C6RJ9ZoB/BERZIonVgcWOsopxh2NCjtEG3Wp4CisFjmjy1OXwzrT7cD0d4cmbw9Tdzo8FrGbkJ6RVkfuWir/Krcp0PviG406i6S0r2yLdFb0hDfn+FcGkDkugQveXvwi2WJch7Q5nVRdHUR9Y4z/lP4ya/ZpBXGFbVK8iiwNydGVPjNNVh8RVfVQ+XE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F4495F0E0E76F4580D1BDB77A7CCB00@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4a62a0-6255-4959-fe06-08d6b9f3e59b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 18:24:09.9020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1799
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-05_14:, , signatures=0
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
X-List-Received-Date: Fri, 05 Apr 2019 18:25:25 -0000

VGhhbmtzIEphbWVzLg0KDQrvu79PbiA0LzUvMTksIDg6MzIgQU0sICJKYW1lcyBGZWlzdCIgPGph
bWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAgICBPbiA0LzQvMTkgNDoxNyBQ
TSwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4gSGkgSmFtZXMsDQogICAgPiANCiAgICA+IFRo
ZXJlIGFyZSBncGlvIGRlZmluaXRpb24gaW4ganNvbiBmaWxlcyB1bmRlciBjb25maWd1cmF0aW9u
LiBIb3cgYXJlIHdlIA0KICAgID4gdXNpbmcgaXQuIEFyZSB0aGVzZSBncGlvcyBiZWluZyBpbml0
aWFsaXplZCBiYXNlZCBvbiBjb25maWd1cmF0aW9ucyBoZXJlIA0KICAgID4gYW5kIHdoZXJlIGFy
ZSB0aGVzZSBiZWluZyB1c2VkLg0KICAgIA0KICAgIFRoZXJlJ3MgdHdvIGFuc3dlcnMuIDEuIFRo
ZSBlbnRpdHktbWFuYWdlciBjYW4gZXhwb3J0IGdpcG9zOg0KICAgIGh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuYm1jL2VudGl0eS1tYW5hZ2VyL2Jsb2IvbWFzdGVyL2luY2x1ZGUvZGV2aWNlcy5ocHAj
TDQzDQogICAgDQogICAgMi4gVGhlcmUgaXMgYSBncGlvIGRhZW1vbiB0aGF0IGNhbiBjb25maWd1
cmUgZ3Bpb3M6IA0KICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9JbnRlbC1CTUMvcHJvdmluZ2dyb3Vu
ZC90cmVlL21hc3Rlci9ncGlvZGFlbW9uIGJ1dCANCiAgICBpdCdzIG5vdCBjb21wbGV0ZWx5IHJl
YWR5IHlldC4NCiAgICANCiAgICBDdXJyZW50IHVzYWdlcyBpbmNsdWRlIGRidXMtc2Vuc29ycyAN
CiAgICBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kYnVzLXNlbnNvcnMvYmxvYi9tYXN0ZXIv
c3JjL1RhY2hTZW5zb3IuY3BwI0wyMDEgDQogICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
ZGJ1cy1zZW5zb3JzL2Jsb2IvbWFzdGVyL3NyYy9DaGFzc2lzSW50cnVzaW9uU2Vuc29yLmNwcCNM
MTc1IA0KICAgIA0KICAgIGFuZCBwb3dlciBjb250cm9sIEkgYmVsaWV2ZS4gVGhlcmVzIGFsc28g
c29tZSBvbmdvaW5nIHdvcmsgZm9yIGZhdWx0IA0KICAgIGxlZHMgaHR0cHM6Ly91cmxkZWZlbnNl
LnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19nZXJyaXQub3BlbmJtYy0yRHByb2pl
Y3QueHl6X2Nfb3BlbmJtY19pbnRlbC0yRGlwbWktMkRvZW1fLTJCXzE5NzA5JmQ9RHdJQ2FRJmM9
NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tj
cklhcVU3VVNsNWcmbT1OajBOdllfbnlmb21EQWVMZ3JwRHIyLUx4cVRlV1ZZRnJkZi16RGFaZlRB
JnM9YThoNXVKck8xcUtoOFFjcnpPMDF6cWo2cTdPckFQcmk5YWg1X3pRUnluQSZlPQ0KICAgIA0K
ICAgIC1KYW1lcw0KICAgIA0KICAgID4gDQogICAgPiBSZWdhcmRzDQogICAgPiANCiAgICA+IC1W
aWpheQ0KICAgID4gDQogICAgDQoNCg==
