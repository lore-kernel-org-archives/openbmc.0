Return-Path: <prvs=7954d71d6d=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=7954d71d6d=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="H+s6mKDp"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Qq1w0ZYN"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 443yjz1d3JzDqGp
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 11:13:06 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1K08EH1029731; Tue, 19 Feb 2019 16:13:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=eTESXZl8JxvJ9houFK2qaovTorp7ZonAgInMNczFs0U=;
 b=H+s6mKDpVHCBEfmoKVT/LxXb9p3FjONXvgX0hAWdes0ucbHf/EV7udeAI98SSMVqG3Gc
 Jvgla7CJlI6INUvhoy6K0PYa4tJm/HZYad/4YQdm0iEOg5gVx8Hk0lQPnlitGXdC2rKr
 b1P8WIMJQO3KMjW6mYyqVnaqPtCN5PhbE+Y= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2qrun103n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 19 Feb 2019 16:13:01 -0800
Received: from frc-mbx03.TheFacebook.com (2620:10d:c0a1:f82::27) by
 frc-hub03.TheFacebook.com (2620:10d:c021:18::173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 19 Feb 2019 16:12:59 -0800
Received: from frc-hub04.TheFacebook.com (2620:10d:c021:18::174) by
 frc-mbx03.TheFacebook.com (2620:10d:c0a1:f82::27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 19 Feb 2019 16:12:59 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.74) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 19 Feb 2019 16:12:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTESXZl8JxvJ9houFK2qaovTorp7ZonAgInMNczFs0U=;
 b=Qq1w0ZYNJYjOZD3SrcgGEpwcI+drnJ8Pthw/NClVrPm88uQTfWhfDq+4a82PmJSAftaUrQw83TAVq3vhQVenMf07GWkmRk4tlQDRQNKyYswkguezZmqF58T5fPgqohGumwjpvjppfibYhOTGOOu5U9finaP9oMACisLBzXio7z8=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1118.namprd15.prod.outlook.com (10.175.2.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.19; Wed, 20 Feb 2019 00:12:58 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::315b:5c00:59e0:b3aa]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::315b:5c00:59e0:b3aa%6]) with mapi id 15.20.1622.020; Wed, 20 Feb 2019
 00:12:58 +0000
From: Tao Ren <taoren@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Topic: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Index: AQHUxNJcttE7fFa5AU6Z0cMMPNb9Q6Xk3wcA//+d24CAAIpBgIAC0UWA
Date: Wed, 20 Feb 2019 00:12:58 +0000
Message-ID: <01a0bdc0-78ba-28d0-6287-9a93e7a93261@fb.com>
References: <3d3df19e-ea5e-8086-34ec-5fa1b200a313@fb.com>
 <d30c021d-8586-984e-a4f7-ce7cb88a1b11@fb.com>
 <1550194959.4187502.1658322936.5ED72093@webmail.messagingengine.com>
 <d271e188-e135-eaff-5532-6ba6b95dce5a@fb.com>
 <1550458070.2791184.1659887272.2685E434@webmail.messagingengine.com>
 <8614FF34-6AA3-451A-8B51-2E759A1CDB14@fb.com>
 <be6cd582-6090-49a3-a3db-0f578b1815fd@www.fastmail.com>
In-Reply-To: <be6cd582-6090-49a3-a3db-0f578b1815fd@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::18) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::7:164d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 245ea3d5-ac7c-4659-842d-08d696c82b16
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1118; 
x-ms-traffictypediagnostic: MWHPR15MB1118:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1118;
 20:ZQyw1g2eVoCI42MhRtUe1Hxllvzh27CHvy0fXuZdrJlycgjfNJvcCtgZYF1njWaTOoqUBDzYcot/phDUfgPkQUf/y9Ao2k/wYkY3H+uWrRBblj+lKjgs3D1ufTSOrQhs2bM4oS24/31wQXOnuqCOPtwREjgFmw0LlnJA+ZP+yxg=
x-microsoft-antispam-prvs: <MWHPR15MB11183F3C4692F4FB8E61D7DFB27D0@MWHPR15MB1118.namprd15.prod.outlook.com>
x-forefront-prvs: 0954EE4910
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(366004)(346002)(396003)(136003)(199004)(189003)(6306002)(68736007)(52116002)(8936002)(6116002)(64126003)(316002)(86362001)(65826007)(99286004)(105586002)(6486002)(106356001)(966005)(110136005)(229853002)(58126008)(478600001)(6512007)(31696002)(14454004)(6436002)(93886005)(2906002)(2501003)(36756003)(31686004)(305945005)(7736002)(6246003)(71200400001)(2616005)(5660300002)(4744005)(53936002)(256004)(71190400001)(486006)(386003)(46003)(102836004)(65806001)(65956001)(186003)(97736004)(76176011)(6506007)(53546011)(11346002)(476003)(446003)(81166006)(25786009)(8676002)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1118;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /mrUTK92SWsnakiatvRdo5EWuIxPGf/RkBxULEKJSrGJSedc1PjmymKpeYsBYdjDSR8umFhiEslIj3amVhWdqFYYjtvNVv+T/VEDDPUk9CeGyIB+wtGgr3xygJ6akqJdUHWGkzZzHJ7lWng73/qnxaCViSUgzVLfumjgxRzmwLTs6NZuMTRbgjJfXM0huPIaRzYb5XoXHh0f1oBuwXwAZl7zb61qrK60GJc+eeGrihunw1PFHSYEBTfmUVUEOfubKY5df8sZy9u1rrJG1U8VQ9bzQwySBXiu91kTBCGohmaR23D6o/gPp1x5I2PhLm6g0hefVMoZF7AAtwLZUA1UrIgz048hrH7rwodlUE6Qj8+nXE9cfy06VbXGrnNpjAcvxaiwYSSnRO5gp2+nPg3uCS44JUvlnpAOuxqb327epb0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B719695456AD74590DAC1D6EEFC81C4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 245ea3d5-ac7c-4659-842d-08d696c82b16
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2019 00:12:57.7463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1118
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-19_16:, , signatures=0
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
X-List-Received-Date: Wed, 20 Feb 2019 00:13:13 -0000

SGkgQW5kcmV3LA0KDQpPbiAyLzE3LzE5IDk6MTEgUE0sIEFuZHJldyBKZWZmZXJ5IHdyb3RlOg0K
PiBBcyBhbiBleGFtcGxlLCBmb3IgVGlvZ2FwYXNzLCB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gZGVm
aW5lIGBDT05GSUdfQVJDSF9OUl9HUElPID0gMTAyNGAgaW4gdGlvZ2FwYXNzLmNmZzoNCj4gDQo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL21ldGEtZmFjZWJvb2svYmxvYi9tYXN0ZXIvbWV0
YS10aW9nYXBhc3MvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgtYXNwZWVkL3Rpb2dhcGFzcy5j
ZmcNCg0KSSB0cmllZCB0byBkZWZpbmUgJ0NPTkZJR19BUkNIX05SX0dQSU89MTAyNCcgaW4gPHBs
YXRmb3JtPi5jZmcsIGJ1dCBzdGlsbCwgaXQncyByZXNldCB0byAwIGJ5ICJtYWtlIG9sZGRlZmNv
bmZpZyIuDQoNCkJlbG93IGFyZSBteSBzdGVwcyAodXNpbmcgdGhlIGxhdGVzdCBvcGVuYm1jIHRy
ZWUpLCBhbmQga2luZGx5IGxldCBtZSBrbm93IGlmIEkgbWlzc2VkIHNvbWV0aGluZzoNCg0KMSkg
YWRkZWQgJ0NPTkZJR19BUkNIX05SX0dQSU89MTAyNCcgaW4gbWV0YS1pYm0vbWV0YS1yb211bHVz
L3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LWFzcGVlZC9yb211bHVzLmNmZw0KMikgZXhwb3J0
IFRFTVBMQVRFQ09ORj1tZXRhLWlibS9tZXRhLXJvbXVsdXMvY29uZg0KMykgLiBvcGVuYm1jLWVu
dg0KNCkgcmFuICJiaXRiYWtlIGxpbnV4LWFzcGVlZCINCjUpIGNoZWNrZWQgYnVpbGQvdG1wL3dv
cmsvcm9tdWx1cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvbGludXgtYXNwZWVkLzQuMTkuMjErZ2l0
QVVUT0lOQytkODA4ZDI3ZjcwLXIwL2xpbnV4LXJvbXVsdXMtc3RhbmRhcmQtYnVpbGQvLmNvbmZp
ZzogQ09ORklHX0FSQ0hfTlJfR1BJTyBpcyByZXNldCB0byAwLg0KDQpUaGFua3MsDQoNCi0gVGFv
DQo=
