Return-Path: <prvs=6620b02a2e=amithash@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6620b02a2e=amithash@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="LJXQO6Ov"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="PiF7ul31"; dkim-atps=neutral
X-Greylist: delayed 943 seconds by postgrey-1.36 at bilbo;
 Sat, 24 Mar 2018 05:02:26 AEDT
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 407BFt3mjYzDrLP
 for <openbmc@lists.ozlabs.org>; Sat, 24 Mar 2018 05:02:25 +1100 (AEDT)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2NHg6VA029643; Fri, 23 Mar 2018 10:46:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=a3Au5WDaydWIaYlHV0tvH1uorqnl98SbBnwOYveTs5k=;
 b=LJXQO6OvJvlb0979bOL4s9Q//18VYw5dJia2YzXdmmVdq2fPeJWKSGoaO4b/QGRldkGi
 A1hEk4dILHFqkEIxcnM4uK+DRulB2IGXsrMb7ymGigNv5EjUwB+erLWZiEOkDCL30tqa
 XeBzhNIN4qTkin6XN9jzcSygZrok6xQBFn8= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0b-00082601.pphosted.com with ESMTP id 2gw3d0gjrm-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 23 Mar 2018 10:46:37 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.14) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Fri, 23 Mar 2018 10:46:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=a3Au5WDaydWIaYlHV0tvH1uorqnl98SbBnwOYveTs5k=;
 b=PiF7ul31KmBbfbYG7ddXDcBKfxA3ACsKsqVAXrX9knGmpKrX2jmZmIySkiTZ5jv2PBfUSEraUhjCpySJRv5kn7sVkOnpvkxp88T84YP+XrKQe/GTRoOvFMr2WWfWpWvJpw78p/HmPK06UCPm2GfM5Vul9Els8MndqJYxkg5I+Kc=
Received: from MWHPR15MB1486.namprd15.prod.outlook.com (10.173.235.7) by
 MWHPR15MB1774.namprd15.prod.outlook.com (10.174.255.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.609.10; Fri, 23 Mar 2018 17:46:35 +0000
Received: from MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::248a:23b8:1621:5422]) by MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::248a:23b8:1621:5422%13]) with mapi id 15.20.0609.012; Fri, 23 Mar
 2018 17:46:35 +0000
From: Amithash Prasad <amithash@fb.com>
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux dev-4.13] ARM: dts: aspeed: Add Portwell Neptune
 machine
Thread-Topic: [PATCH linux dev-4.13] ARM: dts: aspeed: Add Portwell Neptune
 machine
Thread-Index: AQHTwkFVoh2NeD7k3EqgWfCSjq22tKPdJCiAgAB/wQA=
Date: Fri, 23 Mar 2018 17:46:34 +0000
Message-ID: <339F8CD7-3742-48E9-A108-C1C6AE232381@fb.com>
References: <20180323005248.3300168-1-amithash@fb.com>
 <CACPK8XfghUK5c=0Uxz2hB=1KYegJj4i6LH2P-G3KgO5Na1vLDQ@mail.gmail.com>
In-Reply-To: <CACPK8XfghUK5c=0Uxz2hB=1KYegJj4i6LH2P-G3KgO5Na1vLDQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5:6bf5]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1774;
 7:de3A8ZQrJ10i3UwAlvvC/qdms9bovDWQ0nSb6paRdGuhnvb+HYo7bjhxEL7hzIx5HywjloLt9rVWHo16yqsZyeGcJp44vRfhRheS6VLVWUBJ8yFNS6b/6mOkEWAUlERNVdbpq3HMQRQniRxRwbn9+xhv0DnTYp/xy95ZvrILin0EiIGROrFhUK2wfKZ2cV1Xs0yL8dMgewn+2/D0a99PBhc0UzfGPzKKsg6wFsEUIzrng8QBdPxtv3g4xIOeyH8O;
 20:+zPkJj9GeKHs0niZxZS/eTM8JdJruye88gAly9GgInYMOF4CWJKrEqbIt3PWtOTw52cLODkPOoahE8w/HwbaDHhsJs53ulE9vKH4P+SzpaR3l4b+LG3C2cxOi1BraANhbtlaz5JYs1DnDe0HOZ76KUfDdA89jDD2ub5qbotn6Ys=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 14ea1e36-a039-4bc2-ed01-08d590e60575
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1774; 
x-ms-traffictypediagnostic: MWHPR15MB1774:
x-microsoft-antispam-prvs: <MWHPR15MB177415B7C19F0D19C6B13FECB2A80@MWHPR15MB1774.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231221)(11241501184)(944501327)(52105095)(6041310)(20161123560045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(6072148)(201708071742011);
 SRVR:MWHPR15MB1774; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1774; 
x-forefront-prvs: 0620CADDF3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39380400002)(366004)(396003)(39860400002)(346002)(376002)(189003)(199004)(7736002)(478600001)(305945005)(46003)(6246003)(76176011)(6486002)(2906002)(6436002)(446003)(558084003)(6512007)(36756003)(6116002)(8936002)(11346002)(83716003)(53936002)(186003)(86362001)(105586002)(5660300001)(106356001)(5250100002)(6506007)(3280700002)(81166006)(3660700001)(6916009)(33656002)(99286004)(14454004)(82746002)(25786009)(81156014)(4326008)(8676002)(97736004)(68736007)(316002)(2900100001)(102836004)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1774;
 H:MWHPR15MB1486.namprd15.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: e8wxYqz7+p3LzkcyvqdvnEyLHiqQr5a/6XqBXs+dHIPD7by8Jd4w9NyTfxY2S7JK34Jr0wQkfu8UgW33tVJcJG3HCWBQZbjF2XI3vSsMIYU3VrbKJCWyyYTAIrj+l1KVtwuZhpk1qwHsF7GoIDhpn06SCFdMXyKwrrkIFqhWUZazrm3QArq9X+kAeCBjUcI5WIC01QZZL95nkQqyXd2q1FXC/EN8t1+RF7l3afs+n3KcE2uwE3k0RtdYJngt1JwL0ttl2LUiYE3Uo9Z7SbW24dtahJ+Y7Kci8RxST8m06ID+pEdOJdQJKCupJZoyDkkIzxk+6I00+gbhs9qIyOEOGA==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <08CCA94FBB44584CAEE514BF17558945@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ea1e36-a039-4bc2-ed01-08d590e60575
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2018 17:46:34.9097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1774
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-23_11:, , signatures=0
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
X-List-Received-Date: Fri, 23 Mar 2018 18:02:27 -0000

PiBJZiB0aGlzIGlzIHN1cHBvc2VkIHRvIGJlIE5DU0ksIHlvdSBuZWVkIHRvIG11eCBwaW5jdHJs
X3JtaWkyX2RlZmF1bHQuDQoNCj4gSWYgaXQncyBzdXBwb3NlZCB0byBiZSBSR01JSSwgeW91IG5l
ZWQgdG8gbXV4IHBpbmN0cmxfcmdtaWkyX2RlZmF1bHQNCj4gYW5kIHBpbmN0cmxfbWRpbzJfZGVm
YXVsdC4NCg0KVjIgQ29taW5nIHVwLiBUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMuDQoNCg0K
