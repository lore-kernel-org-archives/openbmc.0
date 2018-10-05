Return-Path: <prvs=3816fb6502=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3816fb6502=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ZlOCJfzJ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="RYl+NvGt"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42RcKw0DL7zF3bW;
 Sat,  6 Oct 2018 03:33:19 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w95HTb5Y007481; Fri, 5 Oct 2018 10:33:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=qgrsm/iGRUR8IJPaqpFoTzrMVt58G2Eu1whKcxZNCbA=;
 b=ZlOCJfzJOjH3kT5FgNrlcmb32CBk8NlenTV7LNnsAyqEaGw120hQJIHAbIycJnAHAvNF
 6tGJ4CYIaNn1J1TG5iok7M0fPBQxEgeNp+6LRrl+UdVNcAGtPSv1Q6kYj9KMmLi14ukE
 qoxADlJ0MELqCHVU2EIG7DAkcZbFuMva0LA= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2mxa078jbu-2
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Oct 2018 10:33:14 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.20) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Fri, 5 Oct 2018 10:33:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgrsm/iGRUR8IJPaqpFoTzrMVt58G2Eu1whKcxZNCbA=;
 b=RYl+NvGt3AhFfyyryAihy5ms9gMonlyraD/zR848nelyuJVHUDb6U3EEWCTLB2Q9afb/9Vh/60RL6LSoBIDaKqh467j/x097HGcs126Vt/V91zZpn2IZWtgYmw3vc8GtCPnPcHELWr/oNXIs3WKfCZJIxAuEDlQJAso9iGT25pg=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1605.namprd15.prod.outlook.com (10.175.115.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1207.18; Fri, 5 Oct 2018 17:32:59 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2d43:ae9a:18c0:ac8b]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2d43:ae9a:18c0:ac8b%3]) with mapi id 15.20.1207.024; Fri, 5 Oct 2018
 17:32:58 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, "Justin . Lee1 @ Dell . com"
 <Justin.Lee1@Dell.com>, "joel @ jms . id . au" <joel@jms.id.au>,
 "linux-aspeed @ lists . ozlabs . org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, Sai Dasari
 <sdasari@fb.com>, "netdev @ vger . kernel . org" <netdev@vger.kernel.org>,
 "christian @ cmd . nu" <christian@cmd.nu>
Subject: Re: [PATCH v3] net/ncsi: Add NCSI OEM command support
Thread-Topic: [PATCH v3] net/ncsi: Add NCSI OEM command support
Thread-Index: AQHUW3FtpRjramiWr0uAs/lkWM5AqaUQFjkAgABgdIA=
Date: Fri, 5 Oct 2018 17:32:58 +0000
Message-ID: <B1C3BBF2-C64F-40DB-9D61-DECF7AAF2B53@fb.com>
References: <20181003233222.3909359-1-vijaykhemka@fb.com>
 <88dc95b120e89acbfaa0e8442822c1b3f5696a57.camel@mendozajonas.com>
In-Reply-To: <88dc95b120e89acbfaa0e8442822c1b3f5696a57.camel@mendozajonas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:3430]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1605;
 20:grAA0YMMyfSclwk+wNi/aVLZAk84nxejvgijhDpiM/NH4wY+wnqng+f0RobA8s2AJEjuYYLzhOfYcGxH6wW1CiGUwP4Fm8rumCHIEeLprpi8Z/zLz/cFL5KfOP0awhKvxjP+d1iQmQLzXQk35FXgbOabYlCOH084RtX/4GGHQEA=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(396003)(346002)(376002)(366004)(136003)(39860400002)(189003)(199004)(476003)(2616005)(46003)(186003)(14454004)(6116002)(11346002)(105586002)(2900100001)(33656002)(6246003)(478600001)(5660300001)(68736007)(102836004)(53936002)(446003)(110136005)(217873002)(6486002)(25786009)(6506007)(316002)(83716004)(76176011)(82746002)(8936002)(86362001)(106356001)(7736002)(5250100002)(305945005)(99286004)(8676002)(36756003)(2906002)(97736004)(229853002)(486006)(6512007)(256004)(81166006)(81156014)(71190400001)(6436002)(14444005)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1605;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-correlation-id: 8560e735-0829-4585-dc54-08d62ae897a5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1605; 
x-ms-traffictypediagnostic: CY4PR15MB1605:
x-microsoft-antispam-prvs: <CY4PR15MB16051BE7B0818B53F430392ADDEB0@CY4PR15MB1605.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(67672495146484);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3231355)(11241501184)(944501410)(52105095)(3002001)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(201708071742011)(7699051);
 SRVR:CY4PR15MB1605; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1605; 
x-forefront-prvs: 0816F1D86E
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: B7OhyokKoXVRm86phQNCl8NwD2cYE3IepIC46vau6Fca8OYAN4+JoMsWMTqnbwpBdMnbBrLbteIh8Hu0mNyAdUtNo02oHfxKCAJ6eQA6gHYlDiFq8uBLqKAYvJgQpbiVkVXCcVKxg8BeskhXuEacRaguYXOoGOdRNM/7QdmrYvbi6dB+6m3CxUVafrCLk64Uz9NBlpcT1hHkXFOnlp2GqrC9XI/pBJo0OZ/2KR2AeZ2izLTJagDHeTD3DjC0gUtwawX9G+Q4YMdP7GXp7pXbBjvSZRysyJTyV9KYsKaK5G/aaj4YkRNvFL9V6Xp0o1DZWCstii9JbpmUFg6WXXogv2DaIVpMROM8CIWtXl890R0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <99A4125BA9C6A940853BED4F9689F8AF@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8560e735-0829-4585-dc54-08d62ae897a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2018 17:32:58.3892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1605
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-05_09:, , signatures=0
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
X-List-Received-Date: Fri, 05 Oct 2018 17:33:25 -0000

DQoNCu+7v09uIDEwLzQvMTgsIDk6NDggUE0sICJTYW11ZWwgTWVuZG96YS1Kb25hcyIgPHNhbUBt
ZW5kb3pham9uYXMuY29tPiB3cm90ZToNCg0KICAgIE9uIFdlZCwgMjAxOC0xMC0wMyBhdCAxNjoz
MiAtMDcwMCwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4gVGhpcyBwYXRjaCBhZGRzIE9FTSBj
b21tYW5kcyBhbmQgcmVzcG9uc2UgaGFuZGxpbmcuIEl0IGFsc28gZGVmaW5lcyBPRU0NCiAgICA+
IGNvbW1hbmQgYW5kIHJlc3BvbnNlIHN0cnVjdHVyZSBhcyBwZXIgTkNTSSBzcGVjaWZpY2F0aW9u
IGFsb25nIHdpdGggaXRzDQogICAgPiBoYW5kbGVycy4NCiAgICA+IA0KICAgID4gbmNzaV9jbWRf
aGFuZGxlcl9vZW06IFRoaXMgaXMgYSBnZW5lcmljIGNvbW1hbmQgcmVxdWVzdCBoYW5kbGVyIGZv
ciBPRU0NCiAgICA+IGNvbW1hbmRzDQogICAgPiBuY3NpX3JzcF9oYW5kbGVyX29lbTogVGhpcyBp
cyBhIGdlbmVyaWMgcmVzcG9uc2UgaGFuZGxlciBmb3IgT0VNIGNvbW1hbmRzDQogICAgPiANCiAg
ICA+IFNpZ25lZC1vZmYtYnk6IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPg0KICAg
IA0KICAgIFJldmlld2VkLWJ5OiBTYW11ZWwgTWVuZG96YS1Kb25hcyA8c2FtQG1lbmRvemFqb25h
cy5jb20+DQogICAgDQogICAgVGVjaG5pY2FsbHkgdGhpcyBwYXRjaCBzaG91bGQgYWxzbyBiZSBt
YXJrZWQgW1BBVENIIG5ldC1uZXh0XSB0byB0YXJnZXQNCiAgICBEYXZpZCdzIG5leHQgdHJlZS4N
CiAgDQogIFRoYW5rcyBTYW0sIEkgd2lsbCBtYXJrIGl0IGFuZCBzZW5kIGl0IGFnYWluIHRvIGxh
cmdlciBhdWRpZW5jZS4NCiAgICANCiAgDQoNCg==
