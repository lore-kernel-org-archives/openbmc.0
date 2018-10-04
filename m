Return-Path: <prvs=3815446641=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3815446641=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="rlaoJfd4"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="PRQjR1Qt"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42R0xZ6hXPzF3M0;
 Fri,  5 Oct 2018 03:58:37 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w94Hqw27021129; Thu, 4 Oct 2018 10:58:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=ULa91rETvRqixK0Yuu7GaLJXMgNM1xru1SSAfj5/o/c=;
 b=rlaoJfd4aOwwRiFZK+LIetJXunga8JilgcZG9Pl9sn7nXubPHdc4GRT4RfrARJoSk9Z3
 Cilt/1mgFrwiASeXZ0Ype7gT2KhEZRQFUHY2GyyEqftVrX17Yl/KEaKrsT72kgU4830O
 roRpZzxnL+LL8kTbzbOftmGuJGgU9HmCvwA= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2mwn06rjdc-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 04 Oct 2018 10:58:17 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.33) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Thu, 4 Oct 2018 13:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULa91rETvRqixK0Yuu7GaLJXMgNM1xru1SSAfj5/o/c=;
 b=PRQjR1Qt4m1BqdgFWk92f+lMlnFdkIljiXo1OFQu8GpH96K7t/642m0M/R4IxBsW2jBCinTjeO7T8zCbHwoIu2jK85Uj6anIfamFYYHS1zSY0p9Sk+QR0hupaQqafm40AXundbDxSws4E72Enj7FqiD7kjfVwbZzs7ncbvm0wus=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1437.namprd15.prod.outlook.com (10.173.234.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1207.21; Thu, 4 Oct 2018 17:58:14 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::ccb:6fd9:cf17:bfcd]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::ccb:6fd9:cf17:bfcd%9]) with mapi id 15.20.1207.021; Thu, 4 Oct 2018
 17:58:14 +0000
From: Tao Ren <taoren@fb.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
CC: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add Facebook Backpack-CMM BMC
Thread-Topic: [PATCH 2/2] ARM: dts: aspeed: Add Facebook Backpack-CMM BMC
Thread-Index: AQHUV23ARKzfdnhYEkyqlKvnMVPZU6UO826A
Date: Thu, 4 Oct 2018 17:58:14 +0000
Message-ID: <D4DB54D3-D7BF-48B3-A10B-76EA5A403237@fb.com>
References: <20180928205543.369310-1-taoren@fb.com>
In-Reply-To: <20180928205543.369310-1-taoren@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.0.180812
x-originating-ip: [2620:10d:c090:200::4:f580]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1437;
 20:yPV+7auRaO4eJXnqgveYswdh4Uq7hhHmjMASeM9GnoEh+usiE8ZIFa5EzaPE81Bxw3aeMQHTTmiUBJ8yvlyC0U1r7ml6U52a3qqf9k6w45ebZBDW+HkSj5fPJ5coQZsE41I1aR/FqtAzYB76jye57dcTIR0QPr+oJRAOvRlhCY4=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 803cf578-8318-49aa-c7bb-08d62a22f4e3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1437; 
x-ms-traffictypediagnostic: MWHPR15MB1437:
x-microsoft-antispam-prvs: <MWHPR15MB14374F1E7B127D9BA0EEA146B2EA0@MWHPR15MB1437.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(81227570615382)(67672495146484);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(11241501184)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123564045)(201708071742011)(7699051);
 SRVR:MWHPR15MB1437; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1437; 
x-forefront-prvs: 0815F8251E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(366004)(39860400002)(136003)(346002)(47680400002)(189003)(199004)(476003)(446003)(486006)(2616005)(11346002)(478600001)(102836004)(14454004)(5660300001)(6506007)(36756003)(5250100002)(186003)(2900100001)(68736007)(2906002)(4326008)(25786009)(6246003)(46003)(97736004)(83716004)(71200400001)(8676002)(76176011)(33656002)(7736002)(71190400001)(6436002)(81166006)(99286004)(105586002)(106356001)(8936002)(81156014)(305945005)(53936002)(6116002)(14444005)(256004)(82746002)(110136005)(54906003)(58126008)(229853002)(6486002)(6512007)(316002)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1437;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: hRpxQMxPeazQ76O4ygh53f3NFUPUFqFLMChXU+HBFHjDv9CEbw/uifbmOxjTG5TcUOZ05GFfcaAV9zGplQq7Ijd4oGh3pQMgN5+pqYJbrdvaYWzaju3j4PsB3jY6qR55NET1l/cTWZj49nuDlIQR4IKHWZsScHGtMSQjMYLzUrlAO7LAMPqZMHWLxg9h0SeJ4qCNQUh1M8C/PM0z9BcnB2MSjKYiLfXad6+Rvp1GZchgV/XT5+U6Edd5rBItYNWW1c9fgkC5tZGZoEVA5gxOBxdPHyv2B+Nic35oNLcmK+3sI5uUfUJpM98+3KjUZBSluaESlsvphVKQD/39Q69oRAScRkg/q60WppjIOwMwRqo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5A839188793E447923015E555DF1BB3@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 803cf578-8318-49aa-c7bb-08d62a22f4e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2018 17:58:14.3295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1437
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-04_07:, , signatures=0
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
X-List-Received-Date: Thu, 04 Oct 2018 17:58:44 -0000

SGkgSm9lbCAvIEFuZHJldywNCg0K77u/T24gOS8yOC8xOCwgMTo1NiBQTSwgIlRhbyBSZW4iIDx0
YW9yZW5AZmIuY29tPiB3cm90ZToNCg0KPiBBZGQgaW5pdGlhbCB2ZXJzaW9uIG9mIGRldmljZSB0
cmVlIGZpbGUgZm9yIEZhY2Vib29rIEJhY2twYWNrIENNTQ0KPiAoQ2hhc2lzIE1hbmFnZW1lbnQg
TW9kdWxlKSBhc3QyNTAwIEJNQy4NCj4gTm90ZTogSTJDIGRldmljZXMgb24gQmFja3BhY2sgTGlu
ZSBDYXJkcyBhbmQgRmFicmljIENhcmRzIGFyZSBub3QNCj4gbGlzdGVkIGluIHRoZSBkZXZpY2Ug
dHJlZSBmaWxlIGJlY2F1c2UgTGluZS9GYWJyaWMgQ2FyZHMgbWF5IGJlDQo+IHVucGx1Z2dlZC4N
Cj4NCj4gU2lnbmVkLW9mZi1ieTogVGFvIFJlbiA8dGFvcmVuQGZiLmNvbT4NCg0KQSBraW5kZXIg
cmVtaW5kZXIganVzdCBpbiBjYXNlIHlvdSBtaXNzZWQgdGhlIGVtYWlsLiBBbnkgY29tbWVudHMv
c3VnZ2VzdGlvbnMgb24gdGhlIHBhdGNoZXM/DQoNCg0KVGhhbmtzLA0KVGFvIFJlbg0KDQo=
