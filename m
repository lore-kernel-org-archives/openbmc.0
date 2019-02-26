Return-Path: <prvs=7960da8ce7=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=7960da8ce7=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="YYnDW5Cn"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="F7yCWrhN"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 448D962BFyzDqHL
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 09:32:54 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1QMKPNg004532; Tue, 26 Feb 2019 14:32:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=t+tXE8h5GBMWRBW5HmLYd6f6HDq+S21O+jrxSmyXkSo=;
 b=YYnDW5CnNWy16444JWzeocfsJGGZI7tosYU3vzI5sO9mDWh+DSq5ayNJeGRaX/9kQTf8
 TzJ1HaXeaxiZ0HXkAVnRC6MyHa/Sn6Cyv8xcxPR9k9xRfl72BqZRVZnUQKz+A1XrAgcr
 FKTC/MEH3nRHpFBLONMnNxPk8PR3kd0oHhs= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2qway0rvdn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 26 Feb 2019 14:32:48 -0800
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 26 Feb 2019 14:32:44 -0800
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 26 Feb 2019 14:32:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+tXE8h5GBMWRBW5HmLYd6f6HDq+S21O+jrxSmyXkSo=;
 b=F7yCWrhNYWelPh1bN+k4PKZgFw1F8DEF+Pt8lHa3e078bB0jXRgiKVMCUcQ0eFNomfq6h9i/irJmnVHnACpS6ueE4fdLkW6qSGZb208QYEOId+34d22PUrhW0Uv+Z5XJObk/frbaW2MmJhzsnJ6vGT769W7L5w190zn3Y8UMMLs=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1326.namprd15.prod.outlook.com (10.175.3.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.20; Tue, 26 Feb 2019 22:32:43 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::750e:dfbf:a474:c11]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::750e:dfbf:a474:c11%7]) with mapi id 15.20.1643.019; Tue, 26 Feb 2019
 22:32:43 +0000
From: Tao Ren <taoren@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Topic: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Index: AQHUxNJcttE7fFa5AU6Z0cMMPNb9Q6Xk3wcA//+d24CAAIpBgIAC0UWAgAAAmgCAAqm8gIAFTeCAgACZXgCAANEGgIABgbYA
Date: Tue, 26 Feb 2019 22:32:42 +0000
Message-ID: <3d7b7c3b-a3c1-d6fa-a3d1-2ffe6baf5099@fb.com>
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
 <875a36fb-29ef-f456-11cc-bf247a648e61@fb.com>
 <b3407e65-3823-4e5d-b855-35a115e88d55@www.fastmail.com>
In-Reply-To: <b3407e65-3823-4e5d-b855-35a115e88d55@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR22CA0072.namprd22.prod.outlook.com
 (2603:10b6:300:12a::34) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::7e2c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 558167c1-786a-41c9-7d61-08d69c3a5281
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1326; 
x-ms-traffictypediagnostic: MWHPR15MB1326:
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1326;
 20:HoSDjW/3z/nqH9AUlQ/lxst1VDVnodR4fwM7sFBRHI4trNUsE9VDrj4sHfbZ2GrZUqMU1nmga1B+JLaMEL7BouKXiUMpO1iFYb5tJ2ojhNScStWsweGV+17Qtk6NG9AhdlJCAE4OyjYgs1zc/H8laI8JWUBOajS0cbBk5FS65vM=
x-microsoft-antispam-prvs: <MWHPR15MB13269D81FEB7E85C62A1A2E1B27B0@MWHPR15MB1326.namprd15.prod.outlook.com>
x-forefront-prvs: 096029FF66
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(136003)(39860400002)(396003)(376002)(199004)(189003)(486006)(81166006)(81156014)(316002)(2501003)(8676002)(8936002)(46003)(68736007)(93886005)(106356001)(105586002)(31686004)(36756003)(186003)(11346002)(6246003)(2616005)(476003)(446003)(4744005)(229853002)(256004)(5660300002)(65956001)(65806001)(65826007)(386003)(53546011)(6506007)(6512007)(53936002)(52116002)(7736002)(305945005)(76176011)(6436002)(99286004)(2906002)(71190400001)(110136005)(58126008)(31696002)(71200400001)(14454004)(97736004)(102836004)(478600001)(86362001)(6116002)(25786009)(64126003)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1326;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EBXbWWkxSHUF7z4Rb3qBsAk8WajB9RJFteqn6WL1eecym9W1wg3tmPvdvItPvkFEQZhvyRI7MYz+QXoS71jkNzGTTaIzgsejecsnMUrkpI26otRK+3BRWo4zBVA105+FT4Pyvp0J0BkSjnSCmdDL4O1XqMpkkhCwZh8Vcx9yH6TAaKfVflpy+cjILYGVJf31jgewjBg4Ukd08wY9qYL2bMgAOzNH5ktyGYab5ykeDR2alxOprndTOYNZwCB/2ypAeNyvpAP6uNasdMaKUTefZZ6OQWKJgIoMSGf5wgDVnl5CRZA+GymsFLlkGWW1vsRUCsa0HAiCOR84aQ1W++DpMS4IGRaZaa88iaHtR04C+P5p7LzHD+9FVuLyG9I/uVXh1uG0U2mhJgjY/O1nho6OvNIn4pXkRHYgLLXCm92mYs8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67BDFFF7CC7AFA46BB75860EBFAD5281@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 558167c1-786a-41c9-7d61-08d69c3a5281
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2019 22:32:42.3756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1326
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-26_11:, , signatures=0
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
X-List-Received-Date: Tue, 26 Feb 2019 22:33:00 -0000

T24gMi8yNS8xOSAzOjMyIFBNLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToNCj4+PiBIcm0uIFRoYXQn
cyByZWFsbHkgdW5mb3J0dW5hdGUuIENhbiB5b3UgcGF0Y2ggaXQgaW4gb24geW91ciBwbGF0Zm9y
bSBmb3IgdGhlDQo+Pj4gbW9tZW50PyBXZSdyZSBnb2luZyB0byBoYXZlIHRvIGNvbWUgdXAgd2l0
aCBzb21lIG1vcmUgbG9uZyB0ZXJtIHN0cmF0ZWd5Lg0KPj4+IFdoZXRoZXIgdGhhdCdzIG1ha2lu
ZyB0aGUgc3ltYm9sIHZpc2libGUgb3IgbWlncmF0aW5nIGV2ZXJ5b25lIG9mZiBzeXNmcw0KPj4+
ICh3aGljaCB0aGV5IHNob3VsZCBiZSBkb2luZyBhbnl3YXkpIEknbSBub3Qgc3VyZS4gSWYgd2Ug
ZG9uJ3QgZG8gZWl0aGVyIG9mDQo+Pj4gdGhvc2UgdGhlbiBJIHRoaW5rIHdlJ3JlIGdvaW5nIHRv
IGhhdmUgdG8gYXVkaXQgdXNlcnNwYWNlIHRvIGZpbmQgd2hhdCB3aWxsDQo+Pj4gYnJlYWsuDQo+
Pg0KPj4gTWFrZSBzZW5zZS4gSSB3aWxsIGtlZXAgdGhlIHBhdGNoIGluIG15IGxvY2FsIHRyZWUg
YXMgb2Ygbm93Lg0KPiANCj4gWW91IGNhbiBzdGlsbCBzZW5kIGEgcGF0Y2ggdG8gbWV0YS1mYWNl
Ym9vayB0aGF0IGFwcGxpZXMgeW91ciBjaGFuZ2UgdG8gdGhlDQo+IGtlcm5lbCB0cmVlLiBEb24n
dCBrZWVwIGl0IHRvIHlvdXJzZWxmIDpEDQoNCk9oIHllcy4gSSBhbG1vc3QgZm9yZ2V0IHRoZSBv
cHRpb24gb2YgaGF2aW5nIHBhdGNoIGZpbGVzIDopDQoNCg0KQ2hlZXJzLA0KDQotIFRhbw0K
