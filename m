Return-Path: <prvs=7954d71d6d=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=7954d71d6d=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ETPWZDkp"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="gT9eOsjK"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 443yph4CVqzDqDf
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 11:17:15 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1K09PHq025416; Tue, 19 Feb 2019 16:17:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=7JG83M+5VD3rwi8MWgzpsY3st3m2QB3IYljrbHSVw9k=;
 b=ETPWZDkpPMJsifUvSnVgV6MIdUjPsggJiUWWGIDV3eZddO2v2jJ1tzR96eRKtfzyeJFk
 Nm180a3jUUIh6ZcfVE5SzehwktYvkVfBrH+xEt3o82QqIKRvkn5z8ZaSm5w2TBvcmorx
 QBR6ZoHMXBZ/tdbndBXPq17SDF4KEwy6Xz8= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2qrtft8ana-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 19 Feb 2019 16:17:10 -0800
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 19 Feb 2019 16:17:08 -0800
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 19 Feb 2019 16:17:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JG83M+5VD3rwi8MWgzpsY3st3m2QB3IYljrbHSVw9k=;
 b=gT9eOsjKabPlCMQWCP6SsIv0KwRnrDfz8Qhv1LfKz3kfmLZkLsKkytcBOnNODPqy49J9muDTnCMsk2s1FWeBUBRpjtNsPDtMTjEH4P3VjJTDuvLF4/0bpl/QZA3abpKcX0C9gmuAJaVRhueOVNzhhLRQtNCcEhS6x7JqPTnpDHk=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1118.namprd15.prod.outlook.com (10.175.2.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.19; Wed, 20 Feb 2019 00:17:07 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::315b:5c00:59e0:b3aa]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::315b:5c00:59e0:b3aa%6]) with mapi id 15.20.1622.020; Wed, 20 Feb 2019
 00:17:07 +0000
From: Tao Ren <taoren@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Topic: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Index: AQHUxNJcttE7fFa5AU6Z0cMMPNb9Q6Xk3wcA//+d24CAAIpBgIAC0UWAgAAAmgCAAACPAA==
Date: Wed, 20 Feb 2019 00:17:07 +0000
Message-ID: <5ee76c7f-ba60-091c-204e-20225774b034@fb.com>
References: <3d3df19e-ea5e-8086-34ec-5fa1b200a313@fb.com>
 <d30c021d-8586-984e-a4f7-ce7cb88a1b11@fb.com>
 <1550194959.4187502.1658322936.5ED72093@webmail.messagingengine.com>
 <d271e188-e135-eaff-5532-6ba6b95dce5a@fb.com>
 <1550458070.2791184.1659887272.2685E434@webmail.messagingengine.com>
 <8614FF34-6AA3-451A-8B51-2E759A1CDB14@fb.com>
 <be6cd582-6090-49a3-a3db-0f578b1815fd@www.fastmail.com>
 <01a0bdc0-78ba-28d0-6287-9a93e7a93261@fb.com>
 <b4431660-b369-4a09-a432-9f12d6117a00@www.fastmail.com>
In-Reply-To: <b4431660-b369-4a09-a432-9f12d6117a00@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CO2PR04CA0063.namprd04.prod.outlook.com
 (2603:10b6:102:1::31) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::7:164d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e8f9913-1548-4d7d-6da1-08d696c8bf69
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1118; 
x-ms-traffictypediagnostic: MWHPR15MB1118:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1118;
 20:cAyFa4RZrSYgSakJ9XZKO8cKiUG0Of2U/8a7v7fHdKEB37wo+zjI2R/oTt1GsOXTsPio8wy53hdo9fCw+yLUPP5QQXPEaRqH/JPXboqEqp9+yUGiH5Qcgi4g3Y/ZljPIbzqAp5pnqNO+sdwjPskAR+VH/WSogywjaHlh3Dz8ksw=
x-microsoft-antispam-prvs: <MWHPR15MB111889A2B648F0AF0744AC60B27D0@MWHPR15MB1118.namprd15.prod.outlook.com>
x-forefront-prvs: 0954EE4910
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(346002)(366004)(39860400002)(376002)(189003)(199004)(5660300002)(71190400001)(486006)(256004)(53936002)(6246003)(7736002)(305945005)(2616005)(71200400001)(6506007)(53546011)(11346002)(76176011)(8676002)(25786009)(81166006)(81156014)(476003)(446003)(46003)(386003)(186003)(97736004)(102836004)(65806001)(65956001)(6486002)(105586002)(110136005)(229853002)(106356001)(966005)(52116002)(8936002)(6116002)(68736007)(6306002)(86362001)(99286004)(65826007)(64126003)(316002)(6436002)(14454004)(36756003)(31686004)(93886005)(2906002)(2501003)(478600001)(58126008)(6512007)(31696002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1118;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fiI/or4bqXtLd/otSaPTeQnoCDLC1wIZ/kawurBdYIw8P+/OhCV0BOKnEPVMkuGzobBW4BBbuN2VSoBKExsEI0zGkOi1yjjxRoe8ImrQaZv6cyaNyp/oetNtTg0tNGP5ha9ejJ2crkiCFnepxwG7TOvIkWkMHsTtZjkGsEzTKYWP5t7/EDZC/l8L+X2Wj96QtbNLclCXfbpDf4xo0tfKWc/aKh3lZeSzj7fVE2nKePunmK9nm7HBa2wnCrikNB2tJhsKMAre9nrGk0+nIem3moGMgPnuwi+KnB2GGRBiEeYSLVKH/NFNnml8uHoKTkgK7nU8E3f9FLmxbaCD0grUXAQnbch8HBQmAk2mn4bGMLfJXO7mG6NuB3qHv9Kw2Zbeq7L6oRdCqFW+3foKfZzVsk4lOdAg4MdFYG8qTVDtIj0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CD6BC9B69531A449D57CF1B456E266E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8f9913-1548-4d7d-6da1-08d696c8bf69
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2019 00:17:06.7135 (UTC)
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
X-List-Received-Date: Wed, 20 Feb 2019 00:17:17 -0000

T24gMi8xOS8xOSA0OjE1IFBNLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToNCj4gT24gV2VkLCAyMCBG
ZWIgMjAxOSwgYXQgMTA6NDMsIFRhbyBSZW4gd3JvdGU6DQo+PiBIaSBBbmRyZXcsDQo+Pg0KPj4g
T24gMi8xNy8xOSA5OjExIFBNLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToNCj4+PiBBcyBhbiBleGFt
cGxlLCBmb3IgVGlvZ2FwYXNzLCB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gZGVmaW5lIGBDT05GSUdf
QVJDSF9OUl9HUElPID0gMTAyNGAgaW4gdGlvZ2FwYXNzLmNmZzoNCj4+Pg0KPj4+IGh0dHBzOi8v
Z2l0aHViLmNvbS9vcGVuYm1jL21ldGEtZmFjZWJvb2svYmxvYi9tYXN0ZXIvbWV0YS10aW9nYXBh
c3MvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgtYXNwZWVkL3Rpb2dhcGFzcy5jZmcNCj4+DQo+
PiBJIHRyaWVkIHRvIGRlZmluZSAnQ09ORklHX0FSQ0hfTlJfR1BJTz0xMDI0JyBpbiA8cGxhdGZv
cm0+LmNmZywgYnV0IA0KPj4gc3RpbGwsIGl0J3MgcmVzZXQgdG8gMCBieSAibWFrZSBvbGRkZWZj
b25maWciLg0KPj4NCj4+IEJlbG93IGFyZSBteSBzdGVwcyAodXNpbmcgdGhlIGxhdGVzdCBvcGVu
Ym1jIHRyZWUpLCBhbmQga2luZGx5IGxldCBtZSANCj4+IGtub3cgaWYgSSBtaXNzZWQgc29tZXRo
aW5nOg0KPj4NCj4+IDEpIGFkZGVkICdDT05GSUdfQVJDSF9OUl9HUElPPTEwMjQnIGluIA0KPj4g
bWV0YS1pYm0vbWV0YS1yb211bHVzL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LWFzcGVlZC9y
b211bHVzLmNmZw0KPj4gMikgZXhwb3J0IFRFTVBMQVRFQ09ORj1tZXRhLWlibS9tZXRhLXJvbXVs
dXMvY29uZg0KPj4gMykgLiBvcGVuYm1jLWVudg0KPj4gNCkgcmFuICJiaXRiYWtlIGxpbnV4LWFz
cGVlZCINCj4+IDUpIGNoZWNrZWQgDQo+PiBidWlsZC90bXAvd29yay9yb211bHVzLW9wZW5ibWMt
bGludXgtZ251ZWFiaS9saW51eC1hc3BlZWQvNC4xOS4yMStnaXRBVVRPSU5DK2Q4MDhkMjdmNzAt
cjAvbGludXgtcm9tdWx1cy1zdGFuZGFyZC1idWlsZC8uY29uZmlnOiBDT05GSUdfQVJDSF9OUl9H
UElPIGlzIHJlc2V0IHRvIDAuDQo+IA0KPiBVZ2guIEkgZGlkbid0IHRyeSBpdCBteXNlbGYsIHdh
cyBqdXN0IGhvcGluZyB0aGF0IHdvdWxkIHdvcmsuIEFyZSB5b3Ugb2theQ0KPiB0byBrZWVwIGRp
Z2dpbmcgaW50byB3aHk/DQoNClN1cmUuIExldCBtZSBydW4gbW9yZSB0ZXN0aW5nLCBhbmQgd2ls
bCBzaGFyZSB5b3UgbW9yZSBkZXRhaWxzIGxhdGVyLi4NCg0KLSBUYW8NCg==
