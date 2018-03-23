Return-Path: <prvs=6620b02a2e=amithash@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6620b02a2e=amithash@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="HRFh3jJy"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="FAabI2Hh"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 406lm83Pm8zF1yR
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 12:08:39 +1100 (AEDT)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2N14C9v005082; Thu, 22 Mar 2018 18:08:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=ZGyKd/KX034x4YaclIvbTdJi5IFvSUPDNzJ3nG2BV34=;
 b=HRFh3jJyJczUVE1NJvnKJ9R5hT42WyxQkjwjGtlSxQQahKz94he6KBcXudxodRV8UY8p
 yac7SyVfTk1gmxm3ehoUcjuMzJh3mXcCKpb+Y5MLCbKqBI7zH70r+kA529BCmu5ULRJz
 RziaUMM1piGDEr9/EKTS/HGswjQqZLzGb04= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2gvp9j07hs-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 22 Mar 2018 18:08:32 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.29) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Thu, 22 Mar 2018 21:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ZGyKd/KX034x4YaclIvbTdJi5IFvSUPDNzJ3nG2BV34=;
 b=FAabI2HhO+EI5W8A+bhnx+Vfnwv13HlsOcBh+gdaznIYksuBe+BH5L2lWdCzL9+brNT5fipZfsXaoiJm1AovfMIvbtJrmIRj3SC8WUFUKb9QZZf1IduSY9kTWXIARkzQ/TYvuvBIt2H8giLycHtw44vibsMmTFo2ookgaWXTaac=
Received: from MWHPR15MB1486.namprd15.prod.outlook.com (10.173.235.7) by
 MWHPR15MB1952.namprd15.prod.outlook.com (10.175.8.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.588.14; Fri, 23 Mar 2018 01:08:29 +0000
Received: from MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::248a:23b8:1621:5422]) by MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::248a:23b8:1621:5422%13]) with mapi id 15.20.0588.017; Fri, 23 Mar
 2018 01:08:29 +0000
From: Amithash Prasad <amithash@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "joel@jms.id.au" <joel@jms.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add Portwell Neptune
 machine
Thread-Topic: [PATCH linux dev-4.10] ARM: dts: aspeed: Add Portwell Neptune
 machine
Thread-Index: AQHTux+5v7OdEfeIu0qagjDuRusKMqPW+l0AgAWg4QA=
Date: Fri, 23 Mar 2018 01:08:29 +0000
Message-ID: <E870711B-3394-4EBA-9098-0644FCFE7FF0@fb.com>
References: <20180313230415.1902364-1-amithash@fb.com>
 <1521432668.4081064.1307719072.6699222C@webmail.messagingengine.com>
In-Reply-To: <1521432668.4081064.1307719072.6699222C@webmail.messagingengine.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:f59d]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1952;
 20:/co5swKJEOrBkWiR924nHv8Li4IuLXbCSIxsh3KV3qks7Jyd4bCB1arCsZJ52EabN0OpM4+nO8BbZxE9aFEgixrrySsRAwmA6//9Nr52JNyDvyiOjjWGCp8N0HAdq/zM9SefIr4Q6wY2wCrqSCp61mKqUYUh1ONfb0liKCKYhJU=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 15df7ed0-29f7-41c4-7cd2-08d5905a96b1
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1952; 
x-ms-traffictypediagnostic: MWHPR15MB1952:
x-microsoft-antispam-prvs: <MWHPR15MB19521D37127E36F4D1D6E829B2A80@MWHPR15MB1952.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231221)(11241501184)(944501327)(52105095)(93006095)(93001095)(3002001)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(6072148)(201708071742011);
 SRVR:MWHPR15MB1952; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1952; 
x-forefront-prvs: 0620CADDF3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(39860400002)(376002)(39380400002)(189003)(199004)(14454004)(478600001)(46003)(33656002)(97736004)(6486002)(7736002)(305945005)(3280700002)(5660300001)(6116002)(53936002)(6512007)(6506007)(6246003)(316002)(76176011)(36756003)(105586002)(102836004)(6436002)(106356001)(86362001)(2900100001)(2201001)(99286004)(8936002)(5250100002)(229853002)(83716003)(2906002)(25786009)(81156014)(3660700001)(81166006)(2501003)(8676002)(82746002)(186003)(68736007)(446003)(110136005)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1952;
 H:MWHPR15MB1486.namprd15.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 7dVkeQN1SXLh6srE3RnXuxaK1ZY7+8i3BiwtviTUuhZNw6XlKSqpT/f/kOqiVj4u4r3Z1fsD8o/lC+FX3T9T0uHKoEtkiQbjTXUieBGvWD96QWJ88dd70UkUiDZ6Cj7L7zGri1XdK2Lmff/xd/29rMxBYugQ5dHSS73jZr6yIgWXoWqCo4tTFBjoQolcRtap88HBOw//Pyg84jWQoq202JR4FuKCp/dfKXiBbDoki0T3lrnM3SZJehWZ7TGlppr0jox0LItaR+IyzVP7a0q9boMQtb1Z27qBUz/jNr/w+Zv66TpTXXVgcipLWC4UNY/lbN6wL8LFWZDRIvOjmU609g==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <83304B6C1694694DA109265F875BFA4B@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 15df7ed0-29f7-41c4-7cd2-08d5905a96b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2018 01:08:29.1370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1952
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-22_12:, , signatures=0
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
X-List-Received-Date: Fri, 23 Mar 2018 01:08:41 -0000

PiA+ICsmaTJjNSB7DQo+ID4gKwlzdGF0dXMgPSAib2theSI7DQo+ID4gKwlwY2E5NTU1QDRlIHsN
Cj4gPiArCQljb21wYXRpYmxlID0gIm54cCxwY2E5NTU1IjsNCj4gPiArCQlwaW5jdHJsLW5hbWVz
ID0gImRlZmF1bHQiOyAgDQo+IEkgdGhpbmsgeW91J2xsIG5lZWQgdG8gc2F5IHdoYXQgZnVuY3Rp
b24geW91IHdpc2ggdG8gbXV4IGhlcmUsIHVubGVzcyB0aGlzIGlzIHNvbWUgcXVpcmsgb2YgdGhl
IHBjYTk1NTUuIENlcnRhaW5seSB0aGUgZXhhbXBsZSBpbiB0aGUgZG9jdW1lbnRhdGlvbiBoYXMg
YSBwaW5jdHJsLTAgPSA8Li4uPiBwcm9wZXJ0eS4NCg0KVGhpcyBpcyBzdGlsbCBvbmUgcGFydCBv
ZiB0aGUgYm9hcmQgSSBhbSBzdHVkeWluZy4gSSByZW1vdmVkIHRoZSBwaW5jdHJsIHBhcnQgZnJv
bSB0aGUgdjIgcGF0Y2gNCmFuZCB3aWxsIGluY2x1ZGUgdGhlbSB3aGVuIEkgaGF2ZSBhIGJldHRl
ciB1bmRlcnN0YW5kaW5nIG9mIHRoZSBmdW5jdGlvbi4NCiANCg0K
