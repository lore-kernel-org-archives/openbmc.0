Return-Path: <prvs=6925d468ca=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=6925d468ca=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Fb81Wm0v"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="LZrW5aaZ"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kljs47xXzDqDF
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 10:58:23 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0MNvcVp023915; Tue, 22 Jan 2019 15:58:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=A1jh6hqDauj7bjB527OPUk2gF1E/JIB0Hsw7ob2ecKI=;
 b=Fb81Wm0vPs0eu7fLZA+t9Hq+qWM73emjVTX0AtFikqLENf2Jx7qeZC2Y2SIw/KlBp3Cm
 z/0wFzqqLhhg5WqnWyJAVec1DGY/vprHaqanLxSzF+IlX60ehNGwe9bZnL8CirD4IVfH
 5vBnZ3cL6oF+CRRBZIilgJFU3SpEtZ6cdGs= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2q6a4p0n8t-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 22 Jan 2019 15:58:20 -0800
Received: from frc-mbx07.TheFacebook.com (2620:10d:c0a1:f82::31) by
 frc-hub03.TheFacebook.com (2620:10d:c021:18::173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 22 Jan 2019 15:58:20 -0800
Received: from frc-hub04.TheFacebook.com (2620:10d:c021:18::174) by
 frc-mbx07.TheFacebook.com (2620:10d:c0a1:f82::31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 22 Jan 2019 15:58:19 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.74) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 22 Jan 2019 15:58:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1jh6hqDauj7bjB527OPUk2gF1E/JIB0Hsw7ob2ecKI=;
 b=LZrW5aaZOCLfEd/tTIglAYpnzA+/geprQxLYFoKHO6PiqRZL9/SOw6ciZGmdSaGU6K46uzX06UhJ9c+xSZnKFLjJSIVYLsLPGX8N91j4+gWTXujdGT9KlArKzggb6V3wc4no37WBACo4ISWqsBF5qDGjst0lu3Ee0SZpPBVZ9fo=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1271.namprd15.prod.outlook.com (10.172.180.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.31; Tue, 22 Jan 2019 23:58:04 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b4e4:1e1f:8c5d:9a8c]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b4e4:1e1f:8c5d:9a8c%4]) with mapi id 15.20.1537.031; Tue, 22 Jan 2019
 23:58:04 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Intel-ipmi-oem repo
Thread-Topic: Intel-ipmi-oem repo
Thread-Index: AQHUsn6T2PovaFK5IEGTS1z8ksaC/qW72BMA//9+v4CAAJe3AP//gvyA
Date: Tue, 22 Jan 2019 23:58:03 +0000
Message-ID: <0007B971-30C5-4817-93FA-6683EF7FFB91@fb.com>
References: <B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com>
 <1cf09b78-e1bc-b999-f934-e60bea6a1e1c@intel.com>
 <0B0A393C-5A14-42A0-86A1-9606CD7F942C@fb.com>
 <c51204c7-45d9-6af6-9a25-0e226b7300c3@intel.com>
In-Reply-To: <c51204c7-45d9-6af6-9a25-0e226b7300c3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:5da0]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1271;
 20:/Tb6liFHBNjjNa1JL0h6QOqjR/4ERAkkvDdYydjmUqZx78Xn2uXRaAYa6deHHa0p4zkboe6lSDMfAZ1EK7XA3jpu1MbaCKy8krONecZwCIKipdhBYEPG5Mo0Rjly55Gf92kJCYHOlKKoh4YkFjgjdAnMr+AgfFuieVpTPea1DIo=
x-ms-office365-filtering-correlation-id: a9f74681-1370-4a43-d9fd-08d680c572c4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600109)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1271; 
x-ms-traffictypediagnostic: CY4PR15MB1271:
x-microsoft-antispam-prvs: <CY4PR15MB127134045BE5326CF05C6E86DD980@CY4PR15MB1271.namprd15.prod.outlook.com>
x-forefront-prvs: 0925081676
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(366004)(39860400002)(136003)(376002)(189003)(199004)(478600001)(106356001)(14454004)(110136005)(316002)(76176011)(99286004)(82746002)(53936002)(6246003)(33656002)(68736007)(25786009)(256004)(14444005)(105586002)(2501003)(86362001)(6116002)(2906002)(36756003)(93886005)(97736004)(229853002)(6512007)(11346002)(446003)(6436002)(81156014)(6506007)(53546011)(8936002)(102836004)(3480700005)(6486002)(71190400001)(71200400001)(83716004)(486006)(2616005)(476003)(305945005)(46003)(186003)(7736002)(6346003)(81166006)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1271;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NDYqnLJDm6ZGffoOTqiZghGk5Qnr546RzVX0/GIfVRorwqWkfI/FuMrFGOQhAeTZVsBmVl2VVr6z2LPZtO3AvAHZxkueC9CSd3qL2C+YFxbimJyp6jDDE72Bdnl+PZUm4/TRVHkSdYUakd/ngx81LyQtmof31mEdlVPTFKyOr3FQQF4OBdd8CeOGgu3FTuEkuDjdRpNv1FmzsING7kna43txv4nB2DorernXMFvZ5B3W67IdtKS6pBHTu1ap4kM6YHd2Ub+GAUf2sjveu2g6P4Kfdx3dC4Vq9fJhjVy0y7Uqp1SlWTgpP+VyoidrZv76eCHSN3QUQw/C9tDqBf8qPy6C6fmFW2ILQXBnx51AoFU2ge+/jFsc9MAs8SLDMVEKnCqrIxN+6heNZANNC77/k9UEm8hbUggTCIvuIqnq7Zs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <897E6F2F904EA14897AE7F8105F64385@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f74681-1370-4a43-d9fd-08d680c572c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2019 23:58:04.0669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1271
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-22_12:, , signatures=0
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
X-List-Received-Date: Tue, 22 Jan 2019 23:58:26 -0000

DQoNCu+7v09uIDEvMjIvMTksIDM6MjMgUE0sICJFZCBUYW5vdXMiIDxlZC50YW5vdXNAaW50ZWwu
Y29tPiB3cm90ZToNCg0KICAgIE9uIDEvMjIvMTkgMjoyMiBQTSwgVmlqYXkgS2hlbWthIHdyb3Rl
Og0KICAgID4gSWYgd2UgY2FuIG1hbmFnZSB0aGlzIGluIHN0YW5kYXJkIHJlcG8gd2l0aCBzb21l
IGNvbXBpbGUgdGltZSBjb25maWcNCiAgICA+IHBhcmFtZXRlciB0byB1c2UgY2hvc2VuIGFwcHJv
YWNoLiBJdCB3aWxsIGhlbHAgaW4gbWFpbnRhaW5pbmcgbXVsdGlwbGUgcmVwby4NCiAgICA+IA0K
ICAgID4gIA0KICAgIA0KICAgIEkgYmVsaWV2ZSB0aGlzIHdhcyBwcm9wb3NlZCBhdCBvbmUgcG9p
bnQgb24gb25lIG9mIHRoZSBjYWxscywgYnV0IEkNCiAgICBkb24ndCByZW1lbWJlciB3aGF0IHRo
ZSBjb25jbHVzaW9uIHdhcy4gIEJhc2VkIG9uIG15IHVuZGVyc3RhbmRpbmcgaXQNCiAgICB3YXMg
cG9zc2libGUgdGVjaG5pY2FsbHksIGJ1dCB0aGVuIHdlIHdlbnQgZG93biB0aGUgcmFiYml0IGhv
bGUgb2YNCiAgICB0cnlpbmcgdG8gbWFrZSBhIHNpbmdsZSBzb2x1dGlvbiB0aGF0IG1ldCBldmVy
eW9uZSdzIG5lZWRzLiAgV2UgY291bGQNCiAgICBjZXJ0YWlubHkgc3RhcnQgbW92aW5nIGluIHRo
ZSBkaXJlY3Rpb24gb2YgYW4gI2lmZGVmIHRvIHN1cHBvcnQgYm90aA0KICAgIHdheXMsIHdpdGgg
dGhlIGV2ZW50dWFsIGhvcGUgdGhhdCB3ZSBjb3VsZCBjb252ZXJnZSBvbiBhIHNpbmdsZSBzb2x1
dGlvbi4NCiAgICANCkN1cnJlbnRseSB3ZSBoYXZlIG9ubHkgMiBhcHByb2FjaCB3aGljaCB3ZSB1
c2UgZm9yIGZydSBlaXRoZXIgcGhvc3Bob3ItZnJ1IG9yIGVudGl0eSBtYW5hZ2VyLiBUbyB1c2Ug
SVBNSSBmcnUgYW5kIHNlbnNvciBjb21tYW5kIG9uZSBoYXMgdG8gZm9sbG93IGVpdGhlciBhcHBy
b2FjaCBhbmQgYm90aCBhcHByb2FjaCBoYXZlIGl0cyBvd24gd2F5cyBvZiBoYW5kbGluZyBJUE1J
IGNvbW1hbmQgcmVxdWVzdCBzbyBlaXRoZXIgd2UgZGVmaW5lIHNvbWUgY29uZmlnIG9wdGlvbiBv
ciB3ZSBtZW50aW9uIHdoaWNoIGZpbGUgdG8gaW5jbHVkZSBmb3IgSVBNSSBjb21tYW5kIGNvbnNp
ZGVyaW5nIGVhY2ggZmlsZSB3aWxsIGhhdmUgaXRzIG93biBhcHByb2FjaCBvciB3ZSBsaW5rIHRo
ZXNlIGNvbW1hbmRzIHRvIGVudGl0eSBtYW5hZ2VyIG1vZHVsZSB3aGljaCB3aWxsIGV4cG9zZSBG
cnUgaW50ZXJmYWNlIHRvIGRidXMgdGhlbiBpdCB3aWxsIGFsc28gcmVnaXN0ZXIgdGhlIHNpbWls
YXIgSVBNSSBjb21tYW5kIGltcGxlbWVudGF0aW9uLiBBcyBpdCBpcyB0aWdodGx5IGNvdXBsZWQg
d2UgbmVlZCB0byBtYWludGFpbiB0aGlzIHdheS4gT3RoZXJ3aXNlIGl0IHdpbGwgaGFyZCB0byBt
YWludGFpbiBhbmQgZXhwbGFpbiB1c2VyIHdoaWNoIG9uZSB0byB1c2UuDQoNClJlZ2FyZHMNCi1W
aWpheQ0KDQo=
