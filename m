Return-Path: <prvs=7949d66157=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=7949d66157=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ZOiRTk4a"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="e841zeOh"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440w7x6WlBzDq6X
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 12:06:33 +1100 (AEDT)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1F13mk1024786
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 17:06:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=k3uUwQlPhEEr25wFm08ArFNrdG939T4J7aCoBgNqAkY=;
 b=ZOiRTk4a+yWCd6QoWk0cH5egArxIiAFnF1p9ia2BjqzYH8kharlWd3xiyllnulbVDJny
 2bIS84PqxxN/nr1tye++RjwwNJUgBfZwRl/qedypW2Y7CzsDbut3sxxG72gZPqwsJ3Bt
 dPiRHQAgUfWbuzB/nzD2JAm25QFkipwJn9w= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2qnk18r2b9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 17:06:31 -0800
Received: from frc-mbx01.TheFacebook.com (2620:10d:c0a1:f82::25) by
 frc-hub03.TheFacebook.com (2620:10d:c021:18::173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 14 Feb 2019 17:06:30 -0800
Received: from frc-hub02.TheFacebook.com (2620:10d:c021:18::172) by
 frc-mbx01.TheFacebook.com (2620:10d:c0a1:f82::25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 14 Feb 2019 17:06:30 -0800
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.72) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Thu, 14 Feb 2019 17:06:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3uUwQlPhEEr25wFm08ArFNrdG939T4J7aCoBgNqAkY=;
 b=e841zeOhCLohlJWxsmPlncLRudokJ8mIcDhDDCbCoyrdG2bS6R6bAfbvIa8laHnCUwq5zLonckjlZPHipnE8JkvOIg+gNm1vFE6BMC3eLlCmaTgDXvcF/Y5w3xafU3sTOqwk5o7V3A3fam2ckBDN2SKthctZFRNi1vlx9ERIF18=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1215.namprd15.prod.outlook.com (10.175.2.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.21; Fri, 15 Feb 2019 01:06:29 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::315b:5c00:59e0:b3aa]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::315b:5c00:59e0:b3aa%6]) with mapi id 15.20.1601.023; Fri, 15 Feb 2019
 01:06:29 +0000
From: Tao Ren <taoren@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [Potential Spoof] Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Topic: [Potential Spoof] Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Index: AQHUxLtZRcZN9O3uWEaNvnMOddT+d6XgC+IA
Date: Fri, 15 Feb 2019 01:06:29 +0000
Message-ID: <d30c021d-8586-984e-a4f7-ce7cb88a1b11@fb.com>
References: <3d3df19e-ea5e-8086-34ec-5fa1b200a313@fb.com>
In-Reply-To: <3d3df19e-ea5e-8086-34ec-5fa1b200a313@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:a03:60::22) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::7:fa98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9f35039-f4b5-43af-06ba-08d692e1d0cf
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1215; 
x-ms-traffictypediagnostic: MWHPR15MB1215:
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1215;
 20:Gr9tWssoBIBwtQvlA0J9U6VATrfaxfnXLVjKFcGpS27Us54GWJ4oCzXwcC5230cAdVu1CepilUMUzCdMVDGEtF0BylP0e52Anm79Hh1kfk3vsIi2mR/GXCH+ZgHWX6c2ynH/ddd+IogY1QSmjbCNeVITyy7yaNVk4ClMU6NafLE=
x-microsoft-antispam-prvs: <MWHPR15MB1215A2EBF958716DA580F5E2B2600@MWHPR15MB1215.namprd15.prod.outlook.com>
x-forefront-prvs: 09497C15EB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(136003)(396003)(39860400002)(376002)(189003)(199004)(71190400001)(97736004)(2906002)(1730700003)(256004)(8936002)(14454004)(229853002)(305945005)(81156014)(81166006)(4744005)(7736002)(71200400001)(8676002)(6246003)(2501003)(53936002)(76176011)(68736007)(478600001)(6486002)(316002)(58126008)(6512007)(52116002)(53546011)(186003)(6436002)(36756003)(65826007)(486006)(2616005)(31686004)(86362001)(6506007)(476003)(386003)(46003)(31696002)(5640700003)(2351001)(6116002)(99286004)(102836004)(6916009)(105586002)(25786009)(65806001)(64126003)(446003)(65956001)(11346002)(106356001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1215;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JAB2Ytg/xLqR5QyUZuh+tctzODKgt6dK53ES4ZS3F4bgizExl+YGZr4xTKKrdGpN2jNdAYLmk03vpzNVoAt7utX0T8kgws5oJzRdqHLC5PHxmyq0sUcYqYCIye8HwjIrcJNZ8Szk5fiqUWImkNhX/60Zi2n35H5gP6NDTXjxmi1Y8til1w71QxV1FqE7u41qnHEgj7jRjp4l0GPlXSdv/qB1rWWtwM5FlYQ9EAe/O0P1PgcG8KKZz+T6ZytW7EvD8G364DJsNwlz7NqNiR8iy5y2aErOo/ZYiBbV1f/CDz/nyfEXDj5m3sFhYYSK90tySNNWAyUA53S7yKA2lnJzW5ISMX0LwbyhnQ1qi20/9F8sJtqGdMJSmR08ia+QhTmiNnJSOEbDfXZrVcia7OCNKxSuIWPHkRQMBFGSXJ4MFLM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE7CE4AE20129443AC052FE31944E55C@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f35039-f4b5-43af-06ba-08d692e1d0cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2019 01:06:28.5967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1215
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-14_12:, , signatures=0
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
X-List-Received-Date: Fri, 15 Feb 2019 01:06:39 -0000

T24gMi8xNC8xOSAzOjE2IFBNLCBUYW8gUmVuIHdyb3RlOg0KPiBIaSwNCj4gDQo+IEkgZ290IGZv
bGxvd2luZyBlcnJvciB3aGlsZSBib290aW5nIHVwIG9wZW5ibWMgbGludXggNC4xOCBvbiBGYWNl
Ym9vayBZQU1QIEJNQyAoYXN0MjUwMCBiYXNlZCksIGFuZCBpdCdzIGJlY2F1c2UgdG90YWwgNTk0
IEdQSU8gcGlucyBhcmUgcHJvdmlkZWQgYnkgYXNwZWVkIHNvYyBhbmQgaS9vIGV4cGFuZGVycyBv
biBZQU1QIGJvYXJkOg0KPiANCj4gZ3Bpb2NoaXBfZmluZF9iYXNlOiBjYW5ub3QgZmluZCBmcmVl
IHJhbmdlDQo+IGdwaW9jaGlwX2FkZF9kYXRhX3dpdGhfa2V5OiBHUElPcyAwLi4xNSAocGNhOTU1
NSkgZmFpbGVkIHRvIHJlZ2lzdGVyDQo+IA0KPiBJJ20gd29uZGVyaW5nIGlmIGl0J3MgZ29vZCBp
ZGVhIHRvIGluY3JlYXNlIEFSQ0hfTlJfR1BJTyBkZWZhdWx0IHZhbHVlIHRvIHRoZSAibmV4dCBs
ZXZlbCIgKDEwMjQpIGZvciBBUkNIX0FTUEVFRD8gSWYgbm90LCBhbnkgb3RoZXIgc3VnZ2VzdGlv
bnMgZm9yIHRoaXMgcHJvYmxlbT8NCg0KSSBmb3Jnb3QgdG8gbWVudGlvbiB0aGUgY3VycmVudCB2
YWx1ZSBvZiBBUkNIX05SX0dQSU8gZm9yIEFSQ0hfQVNQRUVEOiBpdCdzIDUxMiAoYnV0IFlBTVAg
Qk1DIHByb3ZpZGVzIDU5NCBHUElPIHBpbnMpLg0KDQotIFRhbw0K
