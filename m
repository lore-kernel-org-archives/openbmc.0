Return-Path: <prvs=4861b53b39=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=4861b53b39=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Br5bsSIm"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="CIIc90iL"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42zN9C29RQzF3T4
 for <openbmc@lists.ozlabs.org>; Tue, 20 Nov 2018 09:02:06 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAJLwie0029906; Mon, 19 Nov 2018 14:01:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=tk1diFMOXeSQWVg6UhLvrykoDO2JArZ3jTrTufCtndA=;
 b=Br5bsSIm5Tp+2E0sLswC+0SpHAkiYjX+qKz4Ii1fLb6qnOD2EhCRfV9YUKnBE2tD0xBr
 buUeQ5qFlK4AfPDp8er6CfZCJ7N3MUS1ST8jUY85fkhzPVYAC3/PtewbxkACj7XKsjNk
 waOYFLvPu+4tM9XqHQSQTRuzFYn/Tivs4H4= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2nv3f70fgm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 19 Nov 2018 14:01:58 -0800
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 19 Nov 2018 14:01:57 -0800
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Mon, 19 Nov 2018 14:01:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tk1diFMOXeSQWVg6UhLvrykoDO2JArZ3jTrTufCtndA=;
 b=CIIc90iLs5x+fLTF9tcNCjbM3KLCUFLOIdI8fNNKBwD0XHH+vCiErtlrPiIB02upwOJJzY1cQCDz0r4dc/vgifQPux6kzOW+bkNYbkCdgS56nero1UDvrnWS43uvgxan0DT33Zp4UVtxp/S1RIHKUZ/7e2qVd0YmAFqyFSkfXZk=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1294.namprd15.prod.outlook.com (10.175.3.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.31; Mon, 19 Nov 2018 22:01:56 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f8fb:c0d5:46cd:cf56]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f8fb:c0d5:46cd:cf56%2]) with mapi id 15.20.1339.027; Mon, 19 Nov 2018
 22:01:56 +0000
From: Sai Dasari <sdasari@fb.com>
To: Oskar Senft <osk@google.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "bradleyb@fuzziesquirrel.com"
 <bradleyb@fuzziesquirrel.com>, "gmills@linux.vnet.ibm.com"
 <gmills@linux.vnet.ibm.com>
Subject: Re: Submit board schematics to OpenBMC docs repo
Thread-Topic: Submit board schematics to OpenBMC docs repo
Thread-Index: AQHUfecCGIV3zRWTVEqxxjMxYuBjI6VSXEyAgACIjgD//5BTAIAE618A///EgAA=
Date: Mon, 19 Nov 2018 22:01:55 +0000
Message-ID: <890097C5-D6FC-4C02-AFAF-17E66F1563CA@fb.com>
References: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
 <BA3510D9-333A-40DB-9D03-43A5A2B2D963@fb.com>
 <CABoTLcTpMY4StimKijR4LmuSuc0dnnfxeTN=hv13WYghsOFcSw@mail.gmail.com>
 <2A161BFC-87CF-4FE9-9DC5-FF1712EE955C@fb.com>
 <CABoTLcRkvH6o9rN67W1xMN0ZJiVQTCJoDMSTO_WpgV_b+jq_4w@mail.gmail.com>
In-Reply-To: <CABoTLcRkvH6o9rN67W1xMN0ZJiVQTCJoDMSTO_WpgV_b+jq_4w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:e4e1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1294;
 20:K5F/w2qPPbYS2F/yKQs2DDgJmR5lmuhgRoS1zcUoW0uczNWkaWZ4YNByZn+I4JuECy9fOfsorld6fVY7GUListKVu8chmYAb+YkI9/vYjB1TjY18sMKh+EFb/eHRNGS1zsFAK+C8jCjMcxhCkqeX1UK8Bb4E0tHI0VQBYuDHQxI=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 3925e0cd-3e32-4414-e80e-08d64e6a9efe
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1294; 
x-ms-traffictypediagnostic: MWHPR15MB1294:
x-microsoft-antispam-prvs: <MWHPR15MB12946C32821B3E117008A7ABCED80@MWHPR15MB1294.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(211936372134217)(153496737603132)(67672495146484)(65623756079841)(104084551191319)(166708455590820)(21748063052155)(28532068793085)(190501279198761)(227612066756510);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(3231440)(11241501184)(944501410)(52105112)(148016)(149066)(150057)(6041310)(20161123562045)(20161123564045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1294; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1294; 
x-forefront-prvs: 08617F610C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(39860400002)(376002)(396003)(366004)(189003)(199004)(81156014)(25786009)(8936002)(81166006)(14454004)(8676002)(2900100001)(93886005)(86362001)(68736007)(6486002)(229853002)(54906003)(5660300001)(4326008)(316002)(97736004)(36756003)(606006)(82746002)(486006)(966005)(2616005)(71190400001)(83716004)(256004)(71200400001)(476003)(6116002)(7736002)(53936002)(46003)(446003)(11346002)(76176011)(53546011)(105586002)(102836004)(6506007)(99286004)(6246003)(186003)(106356001)(478600001)(6306002)(54896002)(236005)(6512007)(2906002)(33656002)(6436002)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1294;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: tnJX5b87Mx7Jwc7POXVy1C+kOrQVlPF+OHE+nCGqAVXoZ1Ma//tkiDrT3LoiHuRlbPskvfn/JMoyJjEp/iXieJjAvm3bXphU9yg79LU9zUfO+swGjDi37Fb9lgiIbJG2ys8KhddeZPwWO9oJS91ZAej9BIhF0lbIvhp26CXaX6fCID7xpBvoKx4pAikacQyU2pN8IhSp+LOn1w9ZVZRHfTokHGSSQX7PjTswMQgbq4T0u4cvjw6HqbP6NmGqw9sMpUv6GWUG07OZ/72jtRnEuvCE61n9NGvj/tEV4R+IJYYr1CigkpPlhRo2buqdNPBn8AK2E9JS4yVlLSq5sZt5OFm1Zk9nwsa/YXSAJCiR5xI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_890097C5D6FC4C02AFAF17E66F1563CAfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3925e0cd-3e32-4414-e80e-08d64e6a9efe
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2018 22:01:55.8727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1294
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-19_08:, , signatures=0
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
X-List-Received-Date: Mon, 19 Nov 2018 22:02:08 -0000

--_000_890097C5D6FC4C02AFAF17E66F1563CAfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkZyb206IE9za2FyIFNlbmZ0IDxvc2tAZ29vZ2xlLmNvbT4NCkRhdGU6IE1vbmRheSwgTm92
ZW1iZXIgMTksIDIwMTggYXQgOTozNSBBTQ0KVG86IFNhaSBEYXNhcmkgPHNkYXNhcmlAZmIuY29t
Pg0KQ2M6IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4sICJicmFk
bGV5YkBmdXp6aWVzcXVpcnJlbC5jb20iIDxicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+LCAi
Z21pbGxzQGxpbnV4LnZuZXQuaWJtLmNvbSIgPGdtaWxsc0BsaW51eC52bmV0LmlibS5jb20+DQpT
dWJqZWN0OiBSZTogU3VibWl0IGJvYXJkIHNjaGVtYXRpY3MgdG8gT3BlbkJNQyBkb2NzIHJlcG8N
Cg0KICAgVGhhdCBtYWtlcyBzZW5zZS4gSS5lLiBzdWJtaXQgdGhlIG1ldGEgbWFjaGluZSBsYXll
ciBmb3IgdGhlIHBhcnRpY3VsYXIgYm9hcmQgYW5kIGp1c3QgaW5jbHVkZSB0aGUgUERGcyBpbiB0
aGUgY29tbWl0LiBXb3VsZCB0aGF0IGJlIGFjY2VwdGVkPw0KVGhpcyBpcyBqdXN0IG9uZSBvZiB0
aGUgc3VnZ2VzdGlvbiBhbmQgYW0gc3VyZSBvdGhlciBjb21tdW5pdHkgbWVtYmVycyBtaWdodCBo
YXZlIHN1Z2dlc3Rpb25zL29waW5pb25zIHJlZ2FyZGluZyB0aGlzLg0KDQpUaGFua3MNCk9za2Fy
Lg0KT24gRnJpLCBOb3YgMTYsIDIwMTggYXQgNToyNyBQTSBTYWkgRGFzYXJpIDxzZGFzYXJpQGZi
LmNvbTxtYWlsdG86c2Rhc2FyaUBmYi5jb20+PiB3cm90ZToNCg0KSSBndWVzcyB0aGlzIGlzIGEg
cXVlc3Rpb24gb2YgIyBvZiBzbWFsbCByZXBvcyB2cyBhIHNpbmdsZSBsYXJnZSByZXBvIHdpdGgg
YSBsb3Qgb2YgInN0dWZmIiBpbiBpdC4gSSBnZW5lcmFsbHkgcHJlZmVyIGZld2VyICh5ZXQgbGFy
Z2VyKSByZXBvcyB2cy4gdGhlIG92ZXJoZWFkIG9mIG1hbmFnaW5nIG11bHRpcGxlIHNtYWxsIHJl
cG9zLg0KTWF5IGJlIGFuIGV4YW1wbGUgd291bGQgY2xhcmlmeSBmb3IgbXkgc3VnZ2VzdGlvbiBv
ZiBlbWJlZGRpbmcgZGV0YWlscyB3aXRoIHRoZSBtYWNoaW5lLiBJIHdhcyByZWZlcnJpbmcgdG8g
aGF2aW5nIOKAmHdpdGhlcnNwb29vbuKAmSBzY2hlbWF0aWNzIGFsb25nIHdpdGggdGhlIG1hY2hp
bmUgbGF5ZXIgQCBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3RyZWUvbWFzdGVy
L21ldGEtaWJtL21ldGEtd2l0aGVyc3Bvb24uIFRoaXMgd2lsbCBwcm92aWRlIGNvbnRleHQgZm9y
IGhvdyB0aGlzIG1hY2hpbmUgd2l0aGVyc3Bvb24gaXMgZGVzaWduZWQgd2l0aCBhbGwgdGhlIGRl
dGFpbHMuKGh5cG90aGV0aWNhbCBhc3N1bWluZyAgd2l0aGVyc3Bvb24gc2NoZW1hdGljcyBjYW4g
YmUgc2hhcmVkIGluIG9wZW4pDQo=

--_000_890097C5D6FC4C02AFAF17E66F1563CAfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <3E23AE6738C28A4381708027599B01BC@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQph
OnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9yaXR5
Ojk5Ow0KCWNvbG9yOnB1cnBsZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnAubXNv
bm9ybWFsMCwgbGkubXNvbm9ybWFsMCwgZGl2Lm1zb25vcm1hbDANCgl7bXNvLXN0eWxlLW5hbWU6
bXNvbm9ybWFsOw0KCW1zby1tYXJnaW4tdG9wLWFsdDphdXRvOw0KCW1hcmdpbi1yaWdodDowaW47
DQoJbXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG87DQoJbWFyZ2luLWxlZnQ6MGluOw0KCWZvbnQt
c2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5F
bWFpbFN0eWxlMTgNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5
cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjEN
Cgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30N
CmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwv
aGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIj4NCjxk
aXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNw
OzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0K
PGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAjQjVDNERGIDEuMHB0O3Bh
ZGRpbmc6My4wcHQgMGluIDBpbiAwaW4iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPkZyb206IDwvc3Bhbj48L2I+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPk9za2FyIFNlbmZ0ICZsdDtv
c2tAZ29vZ2xlLmNvbSZndDs8YnI+DQo8Yj5EYXRlOiA8L2I+TW9uZGF5LCBOb3ZlbWJlciAxOSwg
MjAxOCBhdCA5OjM1IEFNPGJyPg0KPGI+VG86IDwvYj5TYWkgRGFzYXJpICZsdDtzZGFzYXJpQGZi
LmNvbSZndDs8YnI+DQo8Yj5DYzogPC9iPk9wZW5CTUMgTWFpbGxpc3QgJmx0O29wZW5ibWNAbGlz
dHMub3psYWJzLm9yZyZndDssICZxdW90O2JyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbSZxdW90
OyAmbHQ7YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tJmd0OywgJnF1b3Q7Z21pbGxzQGxpbnV4
LnZuZXQuaWJtLmNvbSZxdW90OyAmbHQ7Z21pbGxzQGxpbnV4LnZuZXQuaWJtLmNvbSZndDs8YnI+
DQo8Yj5TdWJqZWN0OiA8L2I+UmU6IFN1Ym1pdCBib2FyZCBzY2hlbWF0aWNzIHRvIE9wZW5CTUMg
ZG9jcyByZXBvPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj4mbmJzcDsmbmJzcDsgVGhhdCBtYWtlcyBzZW5zZS4gSS5lLiBzdWJtaXQg
dGhlIG1ldGEgbWFjaGluZSBsYXllciBmb3IgdGhlIHBhcnRpY3VsYXIgYm9hcmQgYW5kIGp1c3Qg
aW5jbHVkZSB0aGUgUERGcyBpbiB0aGUgY29tbWl0LiBXb3VsZCB0aGF0IGJlIGFjY2VwdGVkPw0K
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGlzIGlzIGp1c3Qgb25lIG9m
IHRoZSBzdWdnZXN0aW9uIGFuZCBhbSBzdXJlIG90aGVyIGNvbW11bml0eSBtZW1iZXJzIG1pZ2h0
IGhhdmUgc3VnZ2VzdGlvbnMvb3BpbmlvbnMgcmVnYXJkaW5nIHRoaXMuICZuYnNwOzxvOnA+PC9v
OnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9w
Pg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VGhhbmtzPG86cD48L286cD48
L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWJv
dHRvbToxMi4wcHQiPk9za2FyLiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPGRpdj4NCjxkaXY+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj5PbiBGcmksIE5vdiAxNiwgMjAxOCBhdCA1OjI3IFBNIFNhaSBE
YXNhcmkgJmx0OzxhIGhyZWY9Im1haWx0bzpzZGFzYXJpQGZiLmNvbSI+c2Rhc2FyaUBmYi5jb208
L2E+Jmd0OyB3cm90ZTo8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGJsb2NrcXVvdGUgc3R5bGU9
ImJvcmRlcjpub25lO2JvcmRlci1sZWZ0OnNvbGlkICNDQ0NDQ0MgMS4wcHQ7cGFkZGluZzowaW4g
MGluIDBpbiA2LjBwdDttYXJnaW4tbGVmdDo0LjhwdDttYXJnaW4tcmlnaHQ6MGluIj4NCjxkaXY+
DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDph
dXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxk
aXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87
bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG87dGV4dC1pbmRlbnQ6LjVpbiI+DQpJIGd1ZXNzIHRo
aXMgaXMgYSBxdWVzdGlvbiBvZiAjIG9mIHNtYWxsIHJlcG9zIHZzIGEgc2luZ2xlIGxhcmdlIHJl
cG8gd2l0aCBhIGxvdCBvZiAmcXVvdDtzdHVmZiZxdW90OyBpbiBpdC4gSSBnZW5lcmFsbHkgcHJl
ZmVyIGZld2VyICh5ZXQgbGFyZ2VyKSByZXBvcyB2cy4gdGhlIG92ZXJoZWFkIG9mIG1hbmFnaW5n
IG11bHRpcGxlIHNtYWxsIHJlcG9zLjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJn
aW4tYm90dG9tLWFsdDphdXRvIj5NYXkgYmUgYW4gZXhhbXBsZSB3b3VsZCBjbGFyaWZ5IGZvciBt
eSBzdWdnZXN0aW9uIG9mIGVtYmVkZGluZyBkZXRhaWxzIHdpdGggdGhlIG1hY2hpbmUuIEkgd2Fz
IHJlZmVycmluZyB0byBoYXZpbmcg4oCYd2l0aGVyc3Bvb29u4oCZIHNjaGVtYXRpY3MgYWxvbmcg
d2l0aCB0aGUgbWFjaGluZSBsYXllciBADQo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vb3Bl
bmJtYy9vcGVuYm1jL3RyZWUvbWFzdGVyL21ldGEtaWJtL21ldGEtd2l0aGVyc3Bvb24iIHRhcmdl
dD0iX2JsYW5rIj4NCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvdHJlZS9tYXN0
ZXIvbWV0YS1pYm0vbWV0YS13aXRoZXJzcG9vbjwvYT4uIFRoaXMgd2lsbCBwcm92aWRlIGNvbnRl
eHQgZm9yIGhvdyB0aGlzIG1hY2hpbmUgd2l0aGVyc3Bvb24gaXMgZGVzaWduZWQgd2l0aCBhbGwg
dGhlIGRldGFpbHMuKGh5cG90aGV0aWNhbCBhc3N1bWluZyAmbmJzcDt3aXRoZXJzcG9vbiBzY2hl
bWF0aWNzIGNhbiBiZSBzaGFyZWQgaW4gb3Blbik8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9k
aXY+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2
Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_890097C5D6FC4C02AFAF17E66F1563CAfbcom_--
