Return-Path: <prvs=3821f0b842=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3821f0b842=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="KvY2MDLQ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="immvYFsc"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VnNm3wRhzF13x;
 Thu, 11 Oct 2018 08:31:50 +1100 (AEDT)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9ALQn6H018394; Wed, 10 Oct 2018 14:31:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=0GduiFnHQ22rqCBNvIl0NsPt1H865dmx0xMqepotiQo=;
 b=KvY2MDLQmMLLxyotyhHUtVqK7zure0FtuCgaUw6/ylUnLRN9810Dzn2wIY/NXsbkJ9L6
 Yff7j8n4TFIcvtjkd3IAiJVunGxGtus+lHm0CvwnCztkBebgwRetC/bBnylLo79QrJA0
 mI4oA28qK+vZh53WUEYi41EC4zBaL4MUz9Y= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0b-00082601.pphosted.com with ESMTP id 2n1nvkgy1c-4
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 10 Oct 2018 14:31:45 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.11) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Wed, 10 Oct 2018 14:30:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GduiFnHQ22rqCBNvIl0NsPt1H865dmx0xMqepotiQo=;
 b=immvYFscNp9Z+6eqtZDPizJcx/nOQ54SWQoFQ7BADDKDq7Y0iVb4Pt8SWcP62/jrLvmb71zFaVV4szdV7hUGoQY1h70ynZUbHl835elkwkq3Iflmt+qklyGAXL9FVWUOFc2ZMbSUSUN1rp/j0cvAlwQL20u+UngDqFQWEnd5LuA=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1367.namprd15.prod.outlook.com (10.172.159.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.24; Wed, 10 Oct 2018 21:30:48 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2d43:ae9a:18c0:ac8b]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2d43:ae9a:18c0:ac8b%3]) with mapi id 15.20.1207.024; Wed, 10 Oct 2018
 21:30:48 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Justin.Lee1@Dell.com" <Justin.Lee1@Dell.com>, "sam@mendozajonas.com"
 <sam@mendozajonas.com>, "joel@jms.id.au" <joel@jms.id.au>
CC: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Amithash Prasad <amithash@fb.com>, "christian@cmd.nu" <christian@cmd.nu>
Subject: Re: [PATCH net-next v5] net/ncsi: Extend NC-SI Netlink interface to
 allow user space to send NC-SI command
Thread-Topic: [PATCH net-next v5] net/ncsi: Extend NC-SI Netlink interface to
 allow user space to send NC-SI command
Thread-Index: AdRgwpcklsOmnJfcTI6m5yXrIVY+2///xnyA
Date: Wed, 10 Oct 2018 21:30:48 +0000
Message-ID: <7F21C163-21CD-4088-B32B-DACA9D46568D@fb.com>
References: <245b32d9a3dd463f9334b9704b639ec4@AUSX13MPS302.AMER.DELL.COM>
In-Reply-To: <245b32d9a3dd463f9334b9704b639ec4@AUSX13MPS302.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:dc84]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1367;
 20:m448n5AdETEyXQVljWh7gP6DRFYz4FQ3BXKxHMWemhce6O+PXKBjW7zrJHeeptY6EDOysVBE/rxdvP10j4wSyef5o8Om3xJ4+KCWUDSMbsX39tMfXeWECOqPZP0qwI1A/dWEgmocDeOB0SWzuZQMBu3dS/YpccrlecnbFpOrDU0=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(396003)(136003)(39860400002)(376002)(346002)(366004)(189003)(199004)(486006)(14444005)(33656002)(53936002)(86362001)(82746002)(2616005)(76176011)(2201001)(6506007)(2501003)(446003)(11346002)(71200400001)(6486002)(102836004)(316002)(83716004)(71190400001)(5250100002)(5660300001)(99286004)(8936002)(8676002)(2900100001)(256004)(14454004)(105586002)(6512007)(476003)(97736004)(305945005)(36756003)(478600001)(81166006)(81156014)(46003)(6436002)(6116002)(186003)(2906002)(7736002)(68736007)(54906003)(106356001)(110136005)(4326008)(229853002)(25786009)(6246003)(21314002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1367;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-correlation-id: 7cc700ed-6af7-4b11-cc9c-08d62ef7a522
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1367; 
x-ms-traffictypediagnostic: CY4PR15MB1367:
x-microsoft-antispam-prvs: <CY4PR15MB1367086BA50EB6F964BF9E81DDE00@CY4PR15MB1367.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(56004941905204)(67672495146484);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3231355)(11241501184)(944501410)(52105095)(3002001)(149066)(150057)(6041310)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051);
 SRVR:CY4PR15MB1367; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1367; 
x-forefront-prvs: 08213D42D3
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Yk4ThXhaUKRevSvdrC0QsglsJ9EqC+HTyMjThqbLwh+0AqRblk6disNJBeUojpSNf+qVRBTh+qumE8z/6KgXWFBcsu9hU8GnQ8Puy+JMkTsmRRjbEdt69V2vwVt++M42Gh5cRRp+LEYHim6pCWVIp58Nv3jfA7giLUsMA6L99fSfcdacJvwzEf2+obF4cualGDEpy+f1DYyMsWavTmyD7JR4+5uHU21CVawU7jQNKeKzMXHw3PrasgqEJps+K47/D8Rt9U8xvVAOK/qhs+dzmvFMZAM1PfNKxuvrEiU09VumCIbXmLg7Inhy1b+2Q2SSDZFbHo1sPzdp/t1ynT/pMDvqvLjLN9aZ5l5ujNBOqgA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <710C0FBFEFA8BD42B434266A4A1E9642@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc700ed-6af7-4b11-cc9c-08d62ef7a522
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2018 21:30:48.1074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1367
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-10_12:, , signatures=0
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
X-List-Received-Date: Wed, 10 Oct 2018 21:31:53 -0000

DQoNCu+7v09uIDEwLzEwLzE4LCAxMToxMiBBTSwgIkp1c3Rpbi5MZWUxQERlbGwuY29tIiA8SnVz
dGluLkxlZTFARGVsbC5jb20+IHdyb3RlOg0KDQogICAgVGhlIG5ldyBjb21tYW5kIChOQ1NJX0NN
RF9TRU5EX0NNRCkgaXMgYWRkZWQgdG8gYWxsb3cgdXNlciBzcGFjZSBhcHBsaWNhdGlvbg0KICAg
IHRvIHNlbmQgTkMtU0kgY29tbWFuZCB0byB0aGUgbmV0d29yayBjYXJkLg0KICAgIEFsc28sIGFk
ZCBhIG5ldyBhdHRyaWJ1dGUgKE5DU0lfQVRUUl9EQVRBKSBmb3IgdHJhbnNmZXJyaW5nIHJlcXVl
c3QgYW5kIHJlc3BvbnNlLg0KICAgIA0KICAgIFRoZSB3b3JrIGZsb3cgaXMgYXMgYmVsb3cuIA0K
ICAgIA0KICAgIFJlcXVlc3Q6DQogICAgVXNlciBzcGFjZSBhcHBsaWNhdGlvbg0KICAgIAktPiBO
ZXRsaW5rIGludGVyZmFjZSAobXNnKQ0KICAgIAktPiBuZXcgTmV0bGluayBoYW5kbGVyIC0gbmNz
aV9zZW5kX2NtZF9ubCgpDQogICAgCS0+IG5jc2lfeG1pdF9jbWQoKQ0KICAgIA0KICAgIFJlc3Bv
bnNlOg0KICAgIFJlc3BvbnNlIHJlY2VpdmVkIC0gbmNzaV9yY3ZfcnNwKCkNCiAgICAJLT4gaW50
ZXJuYWwgcmVzcG9uc2UgaGFuZGxlciAtIG5jc2lfcnNwX2hhbmRsZXJfeHh4KCkNCiAgICAJLT4g
bmNzaV9yc3BfaGFuZGxlcl9uZXRsaW5rKCkNCiAgICAJLT4gbmNzaV9zZW5kX25ldGxpbmtfcnNw
ICgpDQogICAgCS0+IE5ldGxpbmsgaW50ZXJmYWNlIChtc2cpDQogICAgCS0+IHVzZXIgc3BhY2Ug
YXBwbGljYXRpb24NCiAgICANCiAgICBDb21tYW5kIHRpbWVvdXQgLSBuY3NpX3JlcXVlc3RfdGlt
ZW91dCgpDQogICAgCS0+IG5jc2lfc2VuZF9uZXRsaW5rX3RpbWVvdXQgKCkNCiAgICAJLT4gTmV0
bGluayBpbnRlcmZhY2UgKG1zZyB3aXRoIHplcm8gZGF0YSBsZW5ndGgpDQogICAgCS0+IHVzZXIg
c3BhY2UgYXBwbGljYXRpb24NCiAgICANCiAgICBFcnJvcjoNCiAgICBFcnJvciBkZXRlY3RlZA0K
ICAgIAktPiBuY3NpX3NlbmRfbmV0bGlua19lcnIgKCkNCiAgICAJLT4gTmV0bGluayBpbnRlcmZh
Y2UgKGVyciBtc2cpDQogICAgCS0+IHVzZXIgc3BhY2UgYXBwbGljYXRpb24NCiAgICANCiAgICAN
CiAgICBTaWduZWQtb2ZmLWJ5OiBKdXN0aW4gTGVlIDxqdXN0aW4ubGVlMUBkZWxsLmNvbT4gDQoN
CiAgUmV2aWV3ZWQtYnkgOiBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4NCiAgDQoN
Cg==
