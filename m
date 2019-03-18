Return-Path: <prvs=89803d50fc=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=89803d50fc=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Z9DR+dze"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="gJBMXkcj"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NNq11tJ7zDqB2
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 04:44:24 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x2IHhhGU028616;
 Mon, 18 Mar 2019 10:44:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=H0J4V4Jtqb+s9nFOp1jx0qwmx6zRXDnsDA/SIFWU/o8=;
 b=Z9DR+dzeaXV4eXZfddRDnaNivbMxwPiS9cWzJbVzLXOOCnHSZ6tSkQDuY5dwuT2ueFnY
 UQF591jzJAMWH5QJJkvx/1CmL2oNT7bMbHOtx3jMNfguwWQS9W/DoBCTlpMcoTplSSNR
 RKPwJjTsaARcBONoyQ8X6IOAVEqxReQ4aGg= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by m0089730.ppops.net with ESMTP id 2raemsrb6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 18 Mar 2019 10:44:21 -0700
Received: from frc-mbx04.TheFacebook.com (192.168.155.19) by
 frc-hub05.TheFacebook.com (192.168.177.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 18 Mar 2019 10:44:20 -0700
Received: from frc-hub03.TheFacebook.com (192.168.177.73) by
 frc-mbx04.TheFacebook.com (192.168.155.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 18 Mar 2019 10:44:20 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.73) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 18 Mar 2019 10:44:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0J4V4Jtqb+s9nFOp1jx0qwmx6zRXDnsDA/SIFWU/o8=;
 b=gJBMXkcjTFt/JGiHRjjc7AgPi/3+wTzdr2bcjdubGRRYfVm2PdgsggBApIfaCBtmHmI9ErFROlkM8EU2f+UKNzwRrRns7pMvaFGs3zdqhN7Q3QrV5xZBxFkUI6kuxqWJg9En9MRbAsGxuFonatYnr2T47nINvunbjzs+BTQDc8M=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1870.namprd15.prod.outlook.com (10.174.255.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Mon, 18 Mar 2019 17:44:18 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::750e:dfbf:a474:c11]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::750e:dfbf:a474:c11%8]) with mapi id 15.20.1709.015; Mon, 18 Mar 2019
 17:44:18 +0000
From: Tao Ren <taoren@fb.com>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Moving to Linux Kernel 5.0
Thread-Topic: Moving to Linux Kernel 5.0
Thread-Index: AQHU3VJTi21oevrm1kK1yEj8foqXM6YRNGwA
Date: Mon, 18 Mar 2019 17:44:18 +0000
Message-ID: <B8F0E009-6BC8-43CA-9E36-706D88917F86@fb.com>
References: <CACPK8XdnESPUxPqX005x64sCehJTPyBw9vnCyHk7UP8vMrz1vg@mail.gmail.com>
In-Reply-To: <CACPK8XdnESPUxPqX005x64sCehJTPyBw9vnCyHk7UP8vMrz1vg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.14.0.181208
x-originating-ip: [2620:10d:c090:200::52ba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b27e3e18-04ce-4dc9-f8ef-08d6abc958b5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1870; 
x-ms-traffictypediagnostic: MWHPR15MB1870:
x-microsoft-antispam-prvs: <MWHPR15MB18700CADFCAC903BB0B72F1BB2470@MWHPR15MB1870.namprd15.prod.outlook.com>
x-forefront-prvs: 098076C36C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(346002)(376002)(366004)(396003)(199004)(189003)(2906002)(446003)(486006)(2616005)(11346002)(476003)(86362001)(7736002)(6506007)(102836004)(186003)(99286004)(97736004)(76176011)(68736007)(4744005)(82746002)(8936002)(46003)(6436002)(6512007)(110136005)(316002)(229853002)(25786009)(256004)(71200400001)(6246003)(71190400001)(5660300002)(83716004)(58126008)(53936002)(478600001)(305945005)(8676002)(81166006)(81156014)(14454004)(14444005)(6486002)(33656002)(6116002)(106356001)(36756003)(105586002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1870;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tkb9rtecLFEW9UFu+w2+lI3PaVXtOVPI5BusayGNqcDG4gIujbpSUWZnOlNjR2/vbZLLUg6A65SiqVYTxLXeqswDqmLbk5Wnr/f9fCFbe8vHfUDwaMhX3aZ6tr0Had5uLUL2QSGhDteOgM1kZVO31n90uoamdtjVGcTsyAsVClRPnsfX339pvvfbHOquv2S0zKerVX0F81GmfLztoveOOzYudtDWL46ymkX/g8Al+kVbHPAj4Eoh+oLqC/ZmR4/4tr9TOET+VEyMC0cxPOOps+GRTYZvWDFKhOTLw/9L2m0b+L2zDcH+MUkjEXMBkDRjyWTodzaiZlk30QrsFSKApQ7MU4JcabTRFYrzGlJU1e49SoIH4jGgYAv8m8y87KpBq1IYU8eCmF0Vz+WvwP7935bwiVAHQJimPU8nCEmvWk0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3EE1A9700CB66419DFA64942E61EF64@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b27e3e18-04ce-4dc9-f8ef-08d6abc958b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2019 17:44:18.2709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1870
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-18_11:, , signatures=0
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
X-List-Received-Date: Mon, 18 Mar 2019 17:44:30 -0000

R3JlYXQuIFRoYW5rIHlvdSBKb2VsIGZvciB0aGUgdXBkYXRlLg0KDQpDaGVlcnMsDQoNCi0gVGFv
DQoNCu+7v09uIDMvMTcvMTksIDExOjE3IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgSm9lbCBT
dGFubGV5IiA8b3BlbmJtYy1ib3VuY2VzK3Rhb3Jlbj1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBv
biBiZWhhbGYgb2Ygam9lbEBqbXMuaWQuYXU+IHdyb3RlOg0KDQogICAgSGVsbG8sDQogICAgDQog
ICAgSXQncyBiZWVuIGEgZmV3IHJlbGVhc2VzIHNpbmNlIHdlIGJ1bXBlZCwgc28gSSdtIGdvaW5n
IHRvIHB1Ymxpc2ggYQ0KICAgIDUuMCBiYXNlZCB0cmVlIHRoaXMgd2Vlay4gSSd2ZSBkb25lIHNv
bWUgdGVzdGluZyBvbiB0aGUgbWFjaGluZSBJIGhhdmUNCiAgICAoT3BlblBvd2VyIFJvbXVsdXMg
YXN0MjUwMCkgYW5kIGl0IGxvb2tzIGdvb2QuDQogICAgDQogICAgSSdsbCBiZSByZWJhc2luZyB3
aXRob3V0IGRpc2NhcmRpbmcgcGF0Y2hlcyBmb3IgdGhpcyByZWxlYXNlLiBUaGF0DQogICAgbWVh
bnMgaWYgeW91IGhhdmUgbm9uLW1haW5saW5lIHBhdGNoZXMgaXQgd2lsbCBzdGlsbCBiZSB0aGVy
ZSBmb3INCiAgICBkZXYtNS4wLiBOZXh0IHJlbGVhc2Ugd2Ugd2lsbCBkbyBhIGNsZWFub3V0LCBz
byBwbGVhc2UgZW5zdXJlIHlvdXIgb3V0DQogICAgb2YgdHJlZSBwYXRjaGVzIGFyZSBvbiB0aGUg
dXBzdHJlYW0gbGlzdHMgZm9yIDUuMiBub3cuDQogICAgDQogICAgQ2hlZXJzLA0KICAgIA0KICAg
IEpvZWwNCiAgICANCg0K
