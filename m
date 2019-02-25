Return-Path: <prvs=79598ccb5e=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=79598ccb5e=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="gyj2ELcU"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="QXPVl+yf"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 447Wb45Xt5zDqMt
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 06:04:28 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1PIwenP027121; Mon, 25 Feb 2019 11:04:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=xYyI19CK7VbEnQ6H+LlPWzmn3YOtuSg0ACoyz6PW3Q4=;
 b=gyj2ELcUM6BZxd7LHrs6yZkQYrkrR2PIJjUwrbjfj0KRGjHJOEsHuSbL01PDZiMdsI1q
 uAO8lniLwhcjmRHtHuGfPscO9Imu1OS+0O7zii+NQ8VhsWTOnRVE/YKnxyw0+74dR5db
 xz6GS+76Kfa5xCE277I5UYxvWE8AWoWRMU4= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2qvn4m09jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 25 Feb 2019 11:04:21 -0800
Received: from frc-mbx04.TheFacebook.com (192.168.155.19) by
 frc-hub01.TheFacebook.com (192.168.177.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 25 Feb 2019 11:04:20 -0800
Received: from frc-hub06.TheFacebook.com (192.168.177.76) by
 frc-mbx04.TheFacebook.com (192.168.155.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 25 Feb 2019 11:04:20 -0800
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.76) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Mon, 25 Feb 2019 11:04:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYyI19CK7VbEnQ6H+LlPWzmn3YOtuSg0ACoyz6PW3Q4=;
 b=QXPVl+yf4sH2sbh13mSlfg1rFwUi1J5216neKCxtoJZaC86exyFf2XDZ3vH8Y4BHujhLi0OWJ0Gj/1W0ygC6QNnjCpCXBytuIo0DGpcNUp8k3p7lKhqe0/z85KITmmLwsT4vGiZoiDsD3K17WX4xbpKqO89XQ440LeDuGCffwXY=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1694.namprd15.prod.outlook.com (10.175.142.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.20; Mon, 25 Feb 2019 19:04:04 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::750e:dfbf:a474:c11]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::750e:dfbf:a474:c11%7]) with mapi id 15.20.1643.019; Mon, 25 Feb 2019
 19:04:04 +0000
From: Tao Ren <taoren@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Topic: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Index: AQHUxNJcttE7fFa5AU6Z0cMMPNb9Q6Xk3wcA//+d24CAAIpBgIAC0UWAgAAAmgCAAqm8gIAFTeCAgAEfegA=
Date: Mon, 25 Feb 2019 19:04:04 +0000
Message-ID: <875a36fb-29ef-f456-11cc-bf247a648e61@fb.com>
References: <3d3df19e-ea5e-8086-34ec-5fa1b200a313@fb.com>
 <d30c021d-8586-984e-a4f7-ce7cb88a1b11@fb.com>
 <1550194959.4187502.1658322936.5ED72093@webmail.messagingengine.com>
 <d271e188-e135-eaff-5532-6ba6b95dce5a@fb.com>
 <1550458070.2791184.1659887272.2685E434@webmail.messagingengine.com>
 <8614FF34-6AA3-451A-8B51-2E759A1CDB14@fb.com>
 <be6cd582-6090-49a3-a3db-0f578b1815fd@www.fastmail.com>
 <01a0bdc0-78ba-28d0-6287-9a93e7a93261@fb.com>
 <b4431660-b369-4a09-a432-9f12d6117a00@www.fastmail.com>
 <7b9a51ea-5715-b82c-79d9-6d65d07a3e42@fb.com>
 <0a995630-6ec4-4340-8511-31cd868ee7ef@www.fastmail.com>
In-Reply-To: <0a995630-6ec4-4340-8511-31cd868ee7ef@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:a03:114::25) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::105e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6787912-a0a1-4f57-376e-08d69b54026d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1694; 
x-ms-traffictypediagnostic: MWHPR15MB1694:
x-ms-exchange-purlcount: 2
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1694;
 20:Zq3fxXDCdoO7a3VCFU0vyGuDt5MH89tw+ekPpdN0BBvdEjpXfAuYP/FUOgZ904Nj3futHfKdo72yvBXxZ8te7tSjAgQXSTgRa4RkVLK8rCahs90tfJyVG7Ij5hXPDHW3DfdZysrulUYFutdZGv1Zta0Nig3rn0HtLfLgNgALggA=
x-microsoft-antispam-prvs: <MWHPR15MB16947D5883FFD827F9F84EDFB27A0@MWHPR15MB1694.namprd15.prod.outlook.com>
x-forefront-prvs: 095972DF2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(396003)(376002)(366004)(346002)(199004)(189003)(99286004)(76176011)(305945005)(7736002)(6246003)(2906002)(229853002)(2501003)(64126003)(71200400001)(71190400001)(25786009)(31686004)(8676002)(36756003)(106356001)(966005)(52116002)(65826007)(105586002)(14454004)(256004)(478600001)(81156014)(31696002)(6512007)(6306002)(86362001)(486006)(476003)(2616005)(446003)(81166006)(186003)(93886005)(102836004)(11346002)(65806001)(53546011)(53936002)(6436002)(8936002)(58126008)(5660300002)(65956001)(316002)(110136005)(6506007)(386003)(97736004)(68736007)(46003)(6486002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1694;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6W+wemViv0XpOpJNEc/EOfuaXrxqCTNQgEw6mt8fCfB2KIsDTs/O3+EwNV/GAMxUzvNVmb4XBncQzygm2fJgOXLk8lHtwi7vN/sjtM2ByNNH/HrZsUwzEjqA8cgPD/uHDdUO19dv5SxxVh2U7UajhtCc0pOy9QQt6s6BBbbNYQVBudWcE5qEf6Yst+SBn/A+KqWel9c+CVHUlbyjDNGU5ypFkvTcRytR0nnUZAN+qOSdiFcjS+bFk/YrClOiTPCkjmNkAkhhVIHlN3rJVogOvbeVKsr+r4CrfHhIig5yfDqPO8/LyxgmcHNsG0e1JrHoFCOYOtxczXoRRB6ehw9XP41M6YOT8e9sB83OFpkUf9ezy5xUS7ETh2m1wTlVXwnpWxjEgHYPBMtv2vX6ZJhbZxxqU9qeYmMolbrGcvqpDRo=
Content-Type: text/plain; charset="utf-8"
Content-ID: <58B683D09A52524B93C1B59048DD6F6E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b6787912-a0a1-4f57-376e-08d69b54026d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2019 19:04:03.6881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1694
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-25_09:, , signatures=0
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
X-List-Received-Date: Mon, 25 Feb 2019 19:04:34 -0000

SGkgQW5kcmV3LA0KDQpUaGFuayB5b3UgZm9yIGxvb2tpbmcgaW50byB0aGUgaXNzdWUuDQoNCk9u
IDIvMjQvMTkgNTo1NSBQTSwgQW5kcmV3IEplZmZlcnkgd3JvdGU6DQo+IA0KPiBPbiBGcmksIDIy
IEZlYiAyMDE5LCBhdCAxMToyNSwgVGFvIFJlbiB3cm90ZToNCj4+IEhpIEFuZHJldywNCj4+DQo+
PiBPbiAyLzE5LzE5IDQ6MTUgUE0sIEFuZHJldyBKZWZmZXJ5IHdyb3RlOg0KPj4+IE9uIFdlZCwg
MjAgRmViIDIwMTksIGF0IDEwOjQzLCBUYW8gUmVuIHdyb3RlOg0KPj4+PiBIaSBBbmRyZXcsDQo+
PiBNYW51YWxseSBlZGl0aW5nICJBUkNIX05SX0dQSU8iIGluIDxwbGF0Zm9ybT4uY2ZnIGRvZXNu
J3Qgd29yayBiZWNhdXNlIA0KPj4gQVJDSF9OUl9HUElPIHN5bWJvbCBpcyAiaW52aXNpYmxlIiBh
bmQgdXNlciBkZWZpbmVkIHZhbHVlIHdpbGwgYmUgDQo+PiBpZ25vcmVkIGJ5ICJzY3JpcHRzL2tj
b25maWcvY29uZiIuIEkgY29tcGFyZWQgYSBmZXcgb3RoZXIgd2F5cyB0byANCj4+IGZpeC93b3Jr
YXJvdW5kIHRoZSBpc3N1ZSwgYnV0IElNSE8sIGluY3JlYXNpbmcgZGVmYXVsdCBBUkNIX05SX0dQ
SU8gZm9yIA0KPj4gQVJDSF9BU1BFRUQgaXMgYmV0dGVyIHRoYW4gb3RoZXIgc29sdXRpb25zLiBQ
bGVhc2Ugc3VnZ2VzdC4NCj4gDQo+IEhybS4gVGhhdCdzIHJlYWxseSB1bmZvcnR1bmF0ZS4gQ2Fu
IHlvdSBwYXRjaCBpdCBpbiBvbiB5b3VyIHBsYXRmb3JtIGZvciB0aGUNCj4gbW9tZW50PyBXZSdy
ZSBnb2luZyB0byBoYXZlIHRvIGNvbWUgdXAgd2l0aCBzb21lIG1vcmUgbG9uZyB0ZXJtIHN0cmF0
ZWd5Lg0KPiBXaGV0aGVyIHRoYXQncyBtYWtpbmcgdGhlIHN5bWJvbCB2aXNpYmxlIG9yIG1pZ3Jh
dGluZyBldmVyeW9uZSBvZmYgc3lzZnMNCj4gKHdoaWNoIHRoZXkgc2hvdWxkIGJlIGRvaW5nIGFu
eXdheSkgSSdtIG5vdCBzdXJlLiBJZiB3ZSBkb24ndCBkbyBlaXRoZXIgb2YNCj4gdGhvc2UgdGhl
biBJIHRoaW5rIHdlJ3JlIGdvaW5nIHRvIGhhdmUgdG8gYXVkaXQgdXNlcnNwYWNlIHRvIGZpbmQg
d2hhdCB3aWxsDQo+IGJyZWFrLg0KDQpNYWtlIHNlbnNlLiBJIHdpbGwga2VlcCB0aGUgcGF0Y2gg
aW4gbXkgbG9jYWwgdHJlZSBhcyBvZiBub3cuDQoNCj4+IEJUVywgIkNPTkZJR19HQ0NfUExVR0lO
Uz15IiBpbiANCj4+IG1ldGEtYXNwZWVkL3JlY2lwZXMta2VybmVsL2xpbnV4L2FzdDI1MDAvZGVm
Y29uZmlnIGlzIG5vdCBpbmNsdWRlZCBpbiANCj4+IHRoZSBmaW5hbCAuY29uZmlnIGJlY2F1c2Ug
aXRzIGRlcGVuZGVuY3kgb3B0aW9uIFBMVUdJTl9IT1NUQ0MgaXMgbm90IA0KPj4gc2V0Lg0KPiAN
Cj4gQ2FuIHlvdSBvcGVuIGFuIGlzc3VlIGluIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2xp
bnV4ID8NCg0KU3VyZS4gT3BlbmVkIGlzc3VlIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2xp
bnV4L2lzc3Vlcy8xNzANCg0KDQpDaGVlcnMsDQoNCi0gVGFvDQo=
