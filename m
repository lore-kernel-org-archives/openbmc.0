Return-Path: <prvs=3816c36f2e=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3816c36f2e=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="XA3BNhEN"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="A0I2aeTb"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42R9dF2YjZzF3Lc
 for <openbmc@lists.ozlabs.org>; Fri,  5 Oct 2018 10:30:04 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w950SOgJ021168; Thu, 4 Oct 2018 17:30:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=L9oliUV0YJHKjABucBb2PRoOW+NeBGQ/FlE5pE24Ark=;
 b=XA3BNhEN87ktetmTnQZS2kd4JCzXvhxqcjpq/Ben5VPWoBtQBvHXJ3IPJb06hbT+Wtex
 KOEnBtLwnMy7St1gUeZAdxd4DN8FTN5I2k7dJyXjlrYqwIfeolneM1Hi0Zoca31JU9NO
 M4EeY08jpfFVqcDqLxhL+J3CEf1yZlAGvSU= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2mwv1cg815-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 04 Oct 2018 17:30:02 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.16) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Thu, 4 Oct 2018 17:30:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9oliUV0YJHKjABucBb2PRoOW+NeBGQ/FlE5pE24Ark=;
 b=A0I2aeTbdyGtkv0f9yzE4+YA90/59g7dpjVhRXF/jb6PEAxr64ug/VmSacxSPRnxa1dM/az/YlB+XeETmfFbJmXcSaap7jgPaNPMUJbA7W7QV/mmIavUHNQfloJTG7nsHab/sQbEULUR4ghiw4wu4wp3M30yjgT9TYpfthy6RTE=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1807.namprd15.prod.outlook.com (10.174.255.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1207.23; Fri, 5 Oct 2018 00:29:59 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::2937:a3e7:96c0:6dd6]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::2937:a3e7:96c0:6dd6%10]) with mapi id 15.20.1185.027; Fri, 5 Oct 2018
 00:29:59 +0000
From: Sai Dasari <sdasari@fb.com>
To: "jean-marie.verdun@splitted-desktop.com"
 <jean-marie.verdun@splitted-desktop.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC on OCP Leopard server
Thread-Topic: OpenBMC on OCP Leopard server
Thread-Index: AQHUW8bgD4dT+nKxtEaIaN6lzEfCtqUPWDAA
Date: Fri, 5 Oct 2018 00:29:59 +0000
Message-ID: <B708C875-E5A0-479A-8CE8-4B7843B0B5A8@fb.com>
References: <E434E069-640B-40A5-A08D-6FF893B41182@fb.com>
 <CALLMt=p+dH3e-C2M8L9Zv43vTDw9rcd9MpfcqFXge2aTkzk6Hw@mail.gmail.com>
 <16FCAE4F-97EB-4D32-BB14-5C24578773A6@fb.com>
 <CALLMt=rEH2wBzB5RrHJTG93AgHJB-DaG7pJVs9_UNrktpoau1g@mail.gmail.com>
 <937C5B58-38CB-44C0-8F49-63019A5049B3@fb.com>
 <4b147bc4-9df1-cd30-ca06-4af0c93d125e@splitted-desktop.com>
In-Reply-To: <4b147bc4-9df1-cd30-ca06-4af0c93d125e@splitted-desktop.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:180::1:6e84]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1807;
 20:33C0glku7/F2p3SSUSU7N4cuJOIVqqTGWoE13zKMM763cx7AgLDYQwEAyCx4cQ0Ky4n919EtTiY0JmZryZObB38rH/IiEltckdgwkX3D849MJFvWnHvyuylYhFx2cXcX9j4mehNBorLqTouGIpkz8hPM7ZBOkUpWVXMwHewImDA=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 228ada9c-1dc1-4a0a-066a-08d62a59aee8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1807; 
x-ms-traffictypediagnostic: MWHPR15MB1807:
x-microsoft-antispam-prvs: <MWHPR15MB180745AEF8DCEF8EA04C420DCEEB0@MWHPR15MB1807.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863)(81227570615382)(166708455590820)(192278398808882)(65623756079841);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(11241501184)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149066)(150057)(6041310)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051);
 SRVR:MWHPR15MB1807; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1807; 
x-forefront-prvs: 0816F1D86E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(346002)(366004)(376002)(136003)(189003)(199004)(99286004)(76176011)(81156014)(81166006)(8936002)(2906002)(110136005)(68736007)(86362001)(5660300001)(186003)(256004)(102836004)(486006)(446003)(2616005)(476003)(11346002)(46003)(6506007)(8676002)(93886005)(33656002)(316002)(305945005)(53936002)(5250100002)(7736002)(25786009)(6512007)(6306002)(105586002)(106356001)(6246003)(229853002)(2900100001)(966005)(6436002)(2501003)(6486002)(97736004)(14454004)(71190400001)(83716004)(71200400001)(478600001)(6116002)(82746002)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1807;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: qcg95WhEiu36WttWWs+YxuXJ9TlQ5v1o392wbZAfUOZtGzDz7oe/qXEUaUOrab7olMw/b++EHc0Lcn/08zkwhH+a0vwZeXAByq9V6X6CFR3bXwNymF3D5Kj/+oLrBDAv/s/SvdXAI/W8OfxCK+Amd9wCIZgIwB608jmuWy44IzCHAfXrrg8kfktivijSUMfdg9B5cTrIufIYL2M2m4MOb0DN/01skLHW3xvd4wklKeI2W7PTh8CU4q1NeURRa9VKufh1KCunmyWf8rxTmXiqbZI//AFf2Yoti/X+/BxShclRzGr98BLC0wROCVscfSjyVIEiPETEePE5Plz+IjCiQ0S4FGrdflpQeeY1dCldJI0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <217CAFD880B8C442ABBB3B96B2B84A0B@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 228ada9c-1dc1-4a0a-066a-08d62a59aee8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2018 00:29:59.2669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1807
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-04_10:, , signatures=0
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
X-List-Received-Date: Fri, 05 Oct 2018 00:30:10 -0000

SGkgdmVqbWFyaWUsDQoNCkFTVDEyNTAgaXMgaW4gdGhlIGZhbWlseSBvZiBBU1QyNDAwIGFuZCBz
aG91bGQgaGF2ZSBiYXNpYyBuZWVkZWQgc3VwcG9ydCBpbiBPcGVuQk1DIGFuZCBmZXcgb2YgdGhl
IGV4aXN0aW5nIHBsYXRmb3JtIHVzZSBBU1QyNDAwIGZhbWlseSBmb3IgQk1DLiANCg0KQnV0IG1v
c3Qgb2YgdGhlIG5ldyBwbGF0Zm9ybXMgaGF2ZSBtb3ZlZCBvbiB0byBBU1QyNTAwIGZhbWlseSBh
bmQgaXMgdGhlIGZvY3VzIGZvciBjdXJyZW50IGRldmVsb3BlciB0ZWFtLiBBcyBhbiBleGFtcGxl
LCBwbGVhc2UgcmVmZXIgdG8gZmFjZWJvb2sncyBhZGRpdGlvbiBvZiBiYXNpYyBtYWNoaW5lIHN1
cHBvcnQgZm9yIEFTVDI1MDAgYmFzZWQgVGlvZ2FQYXNzIHBsYXRmb3JtIGZldyBkYXlzIGJhY2sg
QCBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3RyZWUvbWFzdGVyL21ldGEtZmFj
ZWJvb2suIEl0IGFkZHMgb25seSBiYXNpYyBzdXBwb3J0IGFuZCB3ZSBhcmUgd29ya2luZyBvbiB0
aGUgdXNlcmxhbmQgZmVhdHVyZSBhZGRpdGlvbnMgYXQgdGhpcyB0aW1lLC4NCg0KWWVzdGVyZGF5
LCBBbmRyZXcgbGVkIGhhY2thdGhvbiBAIE9wZW4gUG93ZXIgU3VtbWl0IGluIEFtc3RlcmRhbSBh
bmQgd2Ugd2VudCB0aHJvdWdoIHNlcmllcyBvZiBleGVyY2lzZXMgd2Fsa2luZyB0aHJvdWdoIGJh
c2ljIGVudmlyb25tZW50IHNldHVwIGFuZCBhZGRpbmcgYSBuZXcgbWFjaGluZS4gVGhlIGRldGFp
bHMgYXJlIEAgaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vZ2Vpc3NvbmF0b3INCkFuZCBob3BlIHRo
aXMgaXMgdXNlZnVsIGZvciB5b3VyIGVmZm9ydCBhbHNvIGZvciBhZGRpbmcgT3BlbkJNQyBzdXBw
b3J0IGZvciBMZW9wYXJkIHN5c3RlbXMuDQoNClRoYW5rcywNClNhaSwuDQrvu79PbiAxMC80LzE4
LCAyOjQ0IEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgSmVhbi1NYXJpZSBWZXJkdW4iIDxvcGVu
Ym1jLWJvdW5jZXMrc2Rhc2FyaT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBiZWhhbGYgb2Yg
amVhbi1tYXJpZS52ZXJkdW5Ac3BsaXR0ZWQtZGVza3RvcC5jb20+IHdyb3RlOg0KDQogICAgSGks
DQogICAgDQogICAgT0NQIExlb3BhcmQgc2VydmVycyBjb21lcyB3aXRoIGFuIEFTUGVlZCBDaGlw
IDEyNTAsIGFuZCBkb2Vzbid0IHNlZW1zIHRvDQogICAgYmUgc3VwcG9ydGVkIHdpdGggT3BlbkJN
QyAoSSBtaWdodCBiZSB0b3RhbGx5IHdyb25nIGJ1dCBJIGRpZG4ndCBmb3VuZA0KICAgIGFueSBy
ZWNpcGVzIHdpdGhpbiB0aGUgc291cmNlIHRyZWUgZm9yIHRoYXQgcGxhdGZvcm0pLiBTbyBpcyB0
aGVyZSBhbnkNCiAgICBzcGVjaWZpYyByZWFzb25zIG92ZXIgcGVyaGFwcyBjb21tdW5pdHkgaW50
ZXJlc3Qgb2Ygd2h5IHRoaXMgbWFjaGluZSBpcw0KICAgIG5vdCBzdXBwb3J0ZWQgPw0KICAgIA0K
ICAgIEEgZ3V5IGludm9sdmVkIGluIHRoZSBsaW51eGJvb3QgZGV2ZWxvcG1lbnQgdGVhbSBoYXMg
Y3JlYXRlZCBhIGZ1bm55IGZvcg0KICAgIG9mIHRoZSBwcm9qZWN0IGJhc2VkIG9uIHUtcm9vdCBj
YWxsZWQgdS1ibWMgd2hpY2ggd29ya3MgYXMgYSBQb0Mgb24NCiAgICBMZW9wYXJkLiBUaGUgQk1D
IHN0YXJ0cyBpbiBhIGNvdXBsZSBvZiBzZWNvbmRzIChJIHRoaW5rIDhzIGluIHRoYXQgY2FzZSkN
CiAgICBhbmQgaXMgb3BlcmF0aW9ubmFsLg0KICAgIA0KICAgIElzIHRoZXJlIGEgcG9ydGluZyBn
dWlkZSBzb21ld2hlcmUgPyBJIGxpa2VkIHRvIGdldCB0aGlzIG1hY2hpbmUNCiAgICBzdXBwb3J0
ZWQgb24gT3BlbkJNQyBmb3IgdmFyaW91cyByZWFzb24sIGFuZCB0aGF0IG1pZ2h0IGJlIG15IGZp
cnN0IHRyeQ0KICAgIHdpdGggaXQuDQogICAgDQogICAgdmVqbWFyaWUNCiAgICANCiAgICANCg0K
