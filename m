Return-Path: <prvs=38092dea02=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=38092dea02=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Ka4aeWwW"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ISLFqJPU"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42MSQ14vWqzF3KL;
 Sat, 29 Sep 2018 09:22:32 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8SNMSjA027330; Fri, 28 Sep 2018 16:22:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=xCH0UODueDNJPUs3tq854C1lyI+g3MsqL974XsCL4+0=;
 b=Ka4aeWwWMj0nXPV5LE2bpE+IOJRJyCKqan65n6nL0bmpD9XDrtPWZfG1TD8EiDeBw3OG
 fY/3iGwq71NQIvJ5pvohiLrj3LWglMbSv91bN4ohmB5nEuBUQScosO46ZIzuL9KSrG3B
 PO5zOv8S8ePairWioaiR37ZxaoH9buqNuK8= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2msw6dr47f-3
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 28 Sep 2018 16:22:29 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.18) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Fri, 28 Sep 2018 16:22:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCH0UODueDNJPUs3tq854C1lyI+g3MsqL974XsCL4+0=;
 b=ISLFqJPUD3mH43Xh3WAKUGt0ug7du8I4JNEVttqbOTgmmRlQjLTfGx5S2/caUsqKPcC/w89Q9ddSc+ecnKZa+Xa8IJu0C2n35EprotGXyMQ1vrOFXS6kOCn9EeLdyaJAGDIwRuC5R9uY3W81n2WZm4aoqKwpzJk3n473sJLf0QI=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1285.namprd15.prod.outlook.com (10.172.180.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1185.22; Fri, 28 Sep 2018 23:22:23 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::3cb5:8b7b:eafb:d86c]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::3cb5:8b7b:eafb:d86c%5]) with mapi id 15.20.1143.022; Fri, 28 Sep 2018
 23:22:22 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Justin.Lee1@Dell.com" <Justin.Lee1@Dell.com>, "joel@jms.id.au"
 <joel@jms.id.au>, "sam@mendozajonas.com" <sam@mendozajonas.com>
CC: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Amithash Prasad <amithash@fb.com>, "christian@cmd.nu" <christian@cmd.nu>
Subject: Re: [PATCH net v2] net/ncsi: Extend NC-SI Netlink interface to allow
 user space to send NC-SI command
Thread-Topic: [PATCH net v2] net/ncsi: Extend NC-SI Netlink interface to allow
 user space to send NC-SI command
Thread-Index: AdRXVsR4fRwK5ubSQ2OHaqPrycIEsv//4VUA
Date: Fri, 28 Sep 2018 23:22:22 +0000
Message-ID: <0491255B-B4FB-42A1-9633-1AB44FFC5A52@fb.com>
References: <58fff61ffd8d4038b59f32b696e76bbc@AUSX13MPS306.AMER.DELL.COM>
In-Reply-To: <58fff61ffd8d4038b59f32b696e76bbc@AUSX13MPS306.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:e298]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1285;
 20:OHT/i9Y0OSiQURcCt6wze2y4gpcZNHYrvQBJ0mc4QYRVUTTX/2exIHum06jjP1Tb1coBd0SIckiqdd6jPS9t5NsvMhP6gNpgBuAfmiEZrVK8v4GWF/ic8DhaM8ketXMG9MgW4htGkKcq01cuSTqjbT6yRVaupxEF0pvyIHWjKN8=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(376002)(346002)(396003)(39860400002)(366004)(136003)(199004)(189003)(5250100002)(6506007)(4326008)(76176011)(2501003)(34290500001)(83716004)(6116002)(14454004)(97736004)(71200400001)(7736002)(71190400001)(11346002)(25786009)(478600001)(305945005)(2900100001)(2906002)(6486002)(476003)(5660300001)(54906003)(446003)(110136005)(186003)(6512007)(33656002)(68736007)(102836004)(6436002)(8676002)(36756003)(8936002)(6246003)(2616005)(99286004)(81156014)(106356001)(53936002)(14444005)(256004)(46003)(81166006)(2201001)(229853002)(105586002)(316002)(82746002)(86362001)(486006)(21314002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1285;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-correlation-id: 9d898d13-0a9b-446c-4101-08d625993e7d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1285; 
x-ms-traffictypediagnostic: CY4PR15MB1285:
x-microsoft-antispam-prvs: <CY4PR15MB12857448D66A38AB7C6601FDDDEC0@CY4PR15MB1285.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(56004941905204);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231355)(11241501184)(944501410)(52105095)(149066)(150057)(6041310)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(201708071742011)(7699051);
 SRVR:CY4PR15MB1285; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1285; 
x-forefront-prvs: 0809C12563
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: PzwoxAfljuO9C0JgbQtDIa+yWQI8r48Lb4Q1Ok3iWcZQL1lO9gAOoGXfjWe8c0JG10h0a/XMnIO68RQyFMmlIl86UOnVoagYLrazepp97Stv8Bc+f8pLs7p68Gw1z5sI32z0YrJ31HKHW1WDZQ9J+DuD+CFGtEu9UG6ZbP6+sDieefNRv9oo7PDAG6tXD9piySQljmQuOTz2L6+OBV6KfYzS8YydpzGXkdyXpS+OLBeHiKYXxkYyXdwL7/EOpT4FYTqyS3bRVU96b4vJW+ucox0TgBJuPWJi8RaAzxru8Ov/YpuTG+zaH/GC8OOouc0pFTQ4hN8MTiWCi7VN4Eg1eJXzws8tmAe4Mfm2Vs5MfKU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <B15036BF5CBE6741A71807DA0C542631@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d898d13-0a9b-446c-4101-08d625993e7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2018 23:22:22.7043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1285
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-28_11:, , signatures=0
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
X-List-Received-Date: Fri, 28 Sep 2018 23:22:34 -0000

DQoNCu+7vz5PbiA5LzI4LzE4LCAxMToxNiBBTSwgIkp1c3Rpbi5MZWUxQERlbGwuY29tIiA8SnVz
dGluLkxlZTFARGVsbC5jb20+IHdyb3RlOg0KDQogID4gIFRoZSBuZXcgY29tbWFuZCAoTkNTSV9D
TURfU0VORF9DTUQpIGlzIGFkZGVkIHRvIGFsbG93IHVzZXIgc3BhY2UgYXBwbGljYXRpb24gDQog
ID4gIHRvIHNlbmQgTkMtU0kgY29tbWFuZCB0byB0aGUgbmV0d29yayBjYXJkLg0KICA+ICBBbHNv
LCBhZGQgYSBuZXcgYXR0cmlidXRlIChOQ1NJX0FUVFJfREFUQSkgZm9yIHRyYW5zZmVycmluZyBy
ZXF1ZXN0IGFuZCByZXNwb25zZS4NCiAgPiANCiAgPiAgVGhlIHdvcmsgZmxvdyBpcyBhcyBiZWxv
dy4gDQogID4gIA0KICA+ICBSZXF1ZXN0Og0KICA+ICBVc2VyIHNwYWNlIGFwcGxpY2F0aW9uIC0+
IE5ldGxpbmsgaW50ZXJmYWNlIChtc2cpDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0+IG5ldyBOZXRsaW5rIGhhbmRsZXIgLSBuY3NpX3NlbmRfY21k
X25sKCkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LT4gbmNzaV94bWl0X2NtZCgpDQogID4gIFJlc3BvbnNlOg0KICA+ICBSZXNwb25zZSByZWNlaXZl
ZCAtIG5jc2lfcmN2X3JzcCgpIC0+IGludGVybmFsIHJlc3BvbnNlIGhhbmRsZXIgLSBuY3NpX3Jz
cF9oYW5kbGVyX3h4eCgpDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gbmNzaV9yc3BfaGFuZGxlcl9u
ZXRsaW5rKCkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBuY3NpX3NlbmRfbmV0bGlua19yc3AgKCkN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtPiBOZXRsaW5rIGludGVyZmFjZSAobXNnKQ0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0+IHVzZXIgc3BhY2UgYXBwbGljYXRpb24NCiAgPiAgQ29tbWFuZCB0aW1lb3V0
IC0gbmNzaV9yZXF1ZXN0X3RpbWVvdXQoKSAtPiBuY3NpX3NlbmRfbmV0bGlua190aW1lb3V0ICgp
DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBOZXRsaW5rIGludGVy
ZmFjZSAobXNnIHdpdGggemVybyBkYXRhIGxlbmd0aCkNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0+IHVzZXIgc3BhY2UgYXBwbGljYXRpb24NCiAgPiAgRXJyb3I6DQog
ID4gIEVycm9yIGRldGVjdGVkIC0+IG5jc2lfc2VuZF9uZXRsaW5rX2VyciAoKSAtPiBOZXRsaW5r
IGludGVyZmFjZSAoZXJyIG1zZykNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
PiB1c2VyIHNwYWNlIGFwcGxpY2F0aW9uDQogICAgDQogICAgDQogICAgSSB3aWxsIHJlcXVlc3Qg
dG8ga2VlcCAyIHBhdGNoLCBvbmUgZm9yIE9FTSBoYW5kbGVyIGFuZCBvdGhlciBvbmUgZm9yIG5l
dGxpbmsgdXNlciBzcGFjZSBoYW5kbGluZy4NCg0K
