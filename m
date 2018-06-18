Return-Path: <prvs=970797624d=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=970797624d=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ZjyOD85r"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ZAETveFF"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418WpW4Wm5zF0Pd
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 23:17:06 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.22/8.16.0.22) with SMTP id w5IBs51H017339;
 Mon, 18 Jun 2018 04:56:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=BfVWl5BTNOpfaPHM+qAFTq/JTuCGftZgp1aeWJt1VmI=;
 b=ZjyOD85rnBm+mHyapG0ruso/GF4fBBibdu0pqe0NwyWmP9zHaBYYI8y8kfcFfQGwvcXj
 8+d5cSXtqbdYhKi4qYH/+O/YbR75dQ4bsoltQWJx8LLBwI5RrrO5mkANoLEv/Kg8mXim
 Yne9RpUB+UKDBnrBfJdTsxSAK0nt4TeEuWs= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by m0089730.ppops.net with ESMTP id 2jp9a70bbm-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 18 Jun 2018 04:56:18 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.26) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Mon, 18 Jun 2018 07:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfVWl5BTNOpfaPHM+qAFTq/JTuCGftZgp1aeWJt1VmI=;
 b=ZAETveFFVcwvujLgR2DeHEJTjUzEahnlKtqdhpMeIKdnUMdfejhC+BlhI4n4cxZDt6NjZColZOIXQsjRiI9XOW7GjbDxghioZ50fkTceg1NKI0LylHf+cic7HQAfFED83M7/51Ao/qG8hcoO/y+pt4aj0YYAs7D/aGcPxy79H5E=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1568.namprd15.prod.outlook.com (10.173.235.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.863.19; Mon, 18 Jun 2018 11:56:15 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::ed33:380d:2f64:d615]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::ed33:380d:2f64:d615%3]) with mapi id 15.20.0863.016; Mon, 18 Jun 2018
 11:56:15 +0000
From: Tao Ren <taoren@fb.com>
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: move to 4.17-based kernel?
Thread-Topic: move to 4.17-based kernel?
Thread-Index: AQHUBvrCZvKKqprHIEeZ54ztAAztjaRl6FKA//+LFgA=
Date: Mon, 18 Jun 2018 11:56:15 +0000
Message-ID: <7265DFF0-B28C-4582-8AC6-F4A82A56688F@fb.com>
References: <0BBFBB96-82ED-4623-A820-EC08A819BFFA@fb.com>
 <CACPK8Xej43LHYgoG1jmdLMLe9ThkDAEEm82-Pn3u0+Yk+SAyHA@mail.gmail.com>
In-Reply-To: <CACPK8Xej43LHYgoG1jmdLMLe9ThkDAEEm82-Pn3u0+Yk+SAyHA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:180::1:560c]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1568;
 7:clZ+QuSmhW85aA1AIqA2U1ilF2rVemf6ktM2/igXJ3NrSp8S2JKC+lFN3RtZ3x1rajGYqKI6Vo9l4UEY2iH7ijzMYRkgvmbI83eOzfc2e74BQwCJWrAkY7VGI2mgkkZQoV8UQTvoy4Y5P7F5mP9ixsgmHabGh0SpzZNk5TwyNmI9u4lRXtEL24pAWoRdYVADMS/fWPpuNopJFm+9Ogx8f/u0hQH/027uRgvjJJkOpytOKRHMvXY83/SUwjVH6lwj;
 20:lOo3LVjr+R3xQgJWG/I+cHFcnBAUreHBjhf253bXQsCej6/NhUYOXaAWNj3mivRjgr7kFg4bBRVEzwbkvoSHc9DaVgB3v0yttcQkWWcq1cSKZCVPwCIdpG+WP9qeZPuo+4HtWgDe3pNrqZ+YgA8i+uL9d0GXg2jbaVl5BM95yMM=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 61b4a6b8-5a0b-426a-f7ac-08d5d5127eb8
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1568; 
x-ms-traffictypediagnostic: MWHPR15MB1568:
x-microsoft-antispam-prvs: <MWHPR15MB1568DBCFCFE35EBCEB9F68FAB2710@MWHPR15MB1568.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(85827821059158)(67672495146484); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(11241501184)(944501410)(52105095)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
 SRVR:MWHPR15MB1568; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1568; 
x-forefront-prvs: 0707248B64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39380400002)(39860400002)(376002)(346002)(366004)(396003)(189003)(199004)(102836004)(486006)(3280700002)(2616005)(6506007)(105586002)(8676002)(81156014)(81166006)(68736007)(3660700001)(6116002)(25786009)(11346002)(186003)(478600001)(14454004)(36756003)(46003)(53546011)(86362001)(476003)(82746002)(446003)(106356001)(2900100001)(316002)(2906002)(97736004)(99286004)(6512007)(53936002)(33656002)(6486002)(76176011)(305945005)(5250100002)(229853002)(345774005)(5660300001)(4326008)(83716003)(6246003)(8936002)(6916009)(7736002)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1568;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: O1Jd71lg0h5We8tDkd1zwoECNNYZb8OIGlAkRI4EqWSM5UPPhRJmsbhHmCeDGQ+K8App2BzusgiuEYCQpVpKIUrOVX/+wWx24svqLcnC/G4MqI/VM/y3nj18JIUVmLg8wpgFh5VyLUIZM9aXepThqiWef8Cp9Y9t4WViqe1k0GKxvgXS3HMeuOiynCiRyl9DtOSRpCwpQTUwi6BCfQxufus0I8SI8aJTM+dYsNcbQVLfMeGSVdas+YXMxGkhp9G+sc+Zkf2GDIq0GlAmy1gCt+MrtZHrll1xh9+3oLysoKFZ5xb4chQRQS5XJP9l3VLBe+hOvFApatOntRAFfWPDjQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA41323F7AC36344A64D57F9130B56AD@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b4a6b8-5a0b-426a-f7ac-08d5d5127eb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2018 11:56:15.3190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1568
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-06-18_04:, , signatures=0
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
X-List-Received-Date: Mon, 18 Jun 2018 13:17:08 -0000

R290IGl0LCBKb2VsLiBUaGFuayB5b3UgZm9yIHRoZSBxdWljayByZXNwb25zZSENCg0KDQpCZXN0
IHJlZ2FyZHMsDQoNClRhbw0KDQrvu79PbiA2LzE4LzE4LCA0OjU1IEFNLCAiam9lbC5zdGFuQGdt
YWlsLmNvbSBvbiBiZWhhbGYgb2YgSm9lbCBTdGFubGV5IiA8am9lbC5zdGFuQGdtYWlsLmNvbSBv
biBiZWhhbGYgb2Ygam9lbEBqbXMuaWQuYXU+IHdyb3RlOg0KDQogICAgSGkgVGFvLA0KICAgIA0K
ICAgIE9uIDE4IEp1bmUgMjAxOCBhdCAyMToyMSwgVGFvIFJlbiA8dGFvcmVuQGZiLmNvbT4gd3Jv
dGU6DQogICAgPiBOb3Qgc3VyZSBpZiBJIG1pc3NlZCBhbnl0aGluZyBkdXJpbmcgY29tbXVuaWNh
dGlvbiwgYnV0IEkganVzdCB3YW50IHRvIGtub3cNCiAgICA+IGlmIHdlIGhhdmUgYWxyZWFkeSBt
b3ZlZCB0byA0LjE3LWJhc2VkIGtlcm5lbCBvciB3ZSBhcmUgc3RpbGwgd29ya2luZyBvbiBpdD8N
CiAgICA+IEkgY2hlY2tlZCBnaXRodWIuY29tOm9wZW5ibWMvbGludXguZ2l0IGFuZCBkaWRu4oCZ
dCBmaW5kIDQuMTcgYnJhbmNoLCBhbmQNCiAgICA+IHRoYXTigJlzIHdoeSBJ4oCZbSBhc2tpbmcu
DQogICAgDQogICAgSXQncyBub3QgcHVibGlzaGVkIHlldCwgYnV0IHRlc3RpbmcgaGFzIGdvbmUg
d2VsbCBhbmQgSSBpbnRlbmQgdG8NCiAgICBwdWJsaXNoIGl0IGluIHRoZSBuZXh0IGRheSBvciB0
d28uIEknbGwgc2VuZCBhbiBhbm5vdW5jZW1lbnQgdG8gdGhlDQogICAgbGlzdCB3aGVuIEkgZG8g
c28uDQogICAgDQogICAgQ2hlZXJzLA0KICAgIA0KICAgIEpvZWwNCiAgICANCg0K
