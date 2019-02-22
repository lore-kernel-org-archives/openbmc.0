Return-Path: <prvs=795640c15b=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=795640c15b=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="dpNOeIjF"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="MWivgYBb"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445CYj5ldSzDqSj
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 11:55:17 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x1M0qXqk008984;
 Thu, 21 Feb 2019 16:55:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=BYVYXCAveub38MIR1GAKebWKWX+dCwMjt8G5k8h1/ls=;
 b=dpNOeIjFv46jBk7d/2BCSFLcXfCkHZFGkpIBD73aAI7wyAQH+0K4ONJ7AzE0OkGcepmW
 4E03Os7hxTVpYDLnRZ2mebP6hRnuEwRMMTv/cKoLEhQfuXrdzorVoHBs95OuPMeoAdgy
 q+lwMxJ9+9/U8B/feljC0pihL7oJ3TpZMRU= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2qt670g3ym-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 21 Feb 2019 16:55:11 -0800
Received: from prn-mbx03.TheFacebook.com (2620:10d:c081:6::17) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 21 Feb 2019 16:55:10 -0800
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-mbx03.TheFacebook.com (2620:10d:c081:6::17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 21 Feb 2019 16:55:09 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Thu, 21 Feb 2019 16:55:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYVYXCAveub38MIR1GAKebWKWX+dCwMjt8G5k8h1/ls=;
 b=MWivgYBbsP2/CdfRit823IaeTC6baPlCx30JX9z9cIQLtheuYs6wkfwvt5zU6yXejGnAaT7l89TybBwX3fsHhukPvGE1bAmzf+9EJ7i6flx2aCLzQ9FZyLIai1WO+UfBWSOaxPNeBXzdaMXf13W3n9Dev1GjUEWqYVhl4uMPcT8=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1182.namprd15.prod.outlook.com (10.175.2.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.19; Fri, 22 Feb 2019 00:55:07 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::750e:dfbf:a474:c11]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::750e:dfbf:a474:c11%7]) with mapi id 15.20.1643.016; Fri, 22 Feb 2019
 00:55:07 +0000
From: Tao Ren <taoren@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Topic: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Index: AQHUxNJcttE7fFa5AU6Z0cMMPNb9Q6Xk3wcA//+d24CAAIpBgIAC0UWAgAAAmgCAAy/YgA==
Date: Fri, 22 Feb 2019 00:55:07 +0000
Message-ID: <7b9a51ea-5715-b82c-79d9-6d65d07a3e42@fb.com>
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
x-clientproxiedby: BYAPR08CA0001.namprd08.prod.outlook.com
 (2603:10b6:a03:100::14) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::4:c3e3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce1059cb-2156-43ca-d9ac-08d698606391
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1182; 
x-ms-traffictypediagnostic: MWHPR15MB1182:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1182;
 20:Yx7kmeLg3y3u9SYj4oqjziAyXjGuBFp/670Dlj/s3ayo3YnCxT8pilAhaoyNo/AhJmRzviFtQhkcoUMCyR5CJEgUxEASn+6yLq7wRSbGysNWeJ/BY6buL6XnvPxmn9zZMlcws2m8J1A12klN0UlBNnLBfxKaT7nny+jXcUT3nqA=
x-microsoft-antispam-prvs: <MWHPR15MB1182BFDF1BEBC2811F135986B27F0@MWHPR15MB1182.namprd15.prod.outlook.com>
x-forefront-prvs: 09565527D6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(366004)(396003)(136003)(39860400002)(189003)(199004)(106356001)(6436002)(478600001)(6512007)(6306002)(6486002)(5660300002)(105586002)(58126008)(7736002)(110136005)(53936002)(305945005)(97736004)(81156014)(316002)(2501003)(31686004)(486006)(68736007)(14454004)(8676002)(8936002)(446003)(2616005)(81166006)(31696002)(11346002)(93886005)(86362001)(966005)(476003)(46003)(6116002)(71200400001)(71190400001)(102836004)(2906002)(53546011)(65826007)(386003)(229853002)(52116002)(36756003)(6506007)(99286004)(186003)(64126003)(6246003)(25786009)(65956001)(76176011)(65806001)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1182;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0q8+PVBJicW+98eu403oO5nEBRi8/Tl1z9imQDJ+N6L/ahZTp020Jlj+0NYzQosqmBUJvzhaxhUbIQfG7w3YQ00j+ZNbkNH+YMlh+9K7i5FHKNnjHYNzUYtT1PmFk+H0fZOlHcfPSLdRoWZKP6FA/yOUb5Gl8lodVr5FNbrWLf4GnHGvalvs4sKimEHgIt37eaN9aNdmE4zkh5ywY1+6FTxQ780lGB1HAjp1Rzsvu5nYmMPi9F8CXiYXdTVMhytYS83yw7MX2FpixEOGcFPEiA9kxl1r6Kv1G9Xdnq4gFx2lgLnDqMYB/OAy1GPhAGA0aPO6/CiqF2rrfjIBkt0JNmi0hyuL1J29b0FZWz5vJiXAM/JKFE2PioAnB/vgtpNNwH+yOxSdFICJ8LFxrSVCWleUm1AwaSsmI15Dj8s34ZM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <753FF87988EC04438DFAFF001C31D19C@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1059cb-2156-43ca-d9ac-08d698606391
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2019 00:55:07.1636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1182
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-22_01:, , signatures=0
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
X-List-Received-Date: Fri, 22 Feb 2019 00:55:23 -0000

SGkgQW5kcmV3LA0KDQpPbiAyLzE5LzE5IDQ6MTUgUE0sIEFuZHJldyBKZWZmZXJ5IHdyb3RlOg0K
PiBPbiBXZWQsIDIwIEZlYiAyMDE5LCBhdCAxMDo0MywgVGFvIFJlbiB3cm90ZToNCj4+IEhpIEFu
ZHJldywNCj4+DQo+PiBPbiAyLzE3LzE5IDk6MTEgUE0sIEFuZHJldyBKZWZmZXJ5IHdyb3RlOg0K
Pj4+IEFzIGFuIGV4YW1wbGUsIGZvciBUaW9nYXBhc3MsIHlvdSBzaG91bGQgYmUgYWJsZSB0byBk
ZWZpbmUgYENPTkZJR19BUkNIX05SX0dQSU8gPSAxMDI0YCBpbiB0aW9nYXBhc3MuY2ZnOg0KPj4+
DQo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvbWV0YS1mYWNlYm9vay9ibG9iL21hc3Rl
ci9tZXRhLXRpb2dhcGFzcy9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC1hc3BlZWQvdGlvZ2Fw
YXNzLmNmZw0KPj4NCj4+IEkgdHJpZWQgdG8gZGVmaW5lICdDT05GSUdfQVJDSF9OUl9HUElPPTEw
MjQnIGluIDxwbGF0Zm9ybT4uY2ZnLCBidXQgDQo+PiBzdGlsbCwgaXQncyByZXNldCB0byAwIGJ5
ICJtYWtlIG9sZGRlZmNvbmZpZyIuDQo+Pg0KPj4gQmVsb3cgYXJlIG15IHN0ZXBzICh1c2luZyB0
aGUgbGF0ZXN0IG9wZW5ibWMgdHJlZSksIGFuZCBraW5kbHkgbGV0IG1lIA0KPj4ga25vdyBpZiBJ
IG1pc3NlZCBzb21ldGhpbmc6DQo+Pg0KPj4gMSkgYWRkZWQgJ0NPTkZJR19BUkNIX05SX0dQSU89
MTAyNCcgaW4gDQo+PiBtZXRhLWlibS9tZXRhLXJvbXVsdXMvcmVjaXBlcy1rZXJuZWwvbGludXgv
bGludXgtYXNwZWVkL3JvbXVsdXMuY2ZnDQo+PiAyKSBleHBvcnQgVEVNUExBVEVDT05GPW1ldGEt
aWJtL21ldGEtcm9tdWx1cy9jb25mDQo+PiAzKSAuIG9wZW5ibWMtZW52DQo+PiA0KSByYW4gImJp
dGJha2UgbGludXgtYXNwZWVkIg0KPj4gNSkgY2hlY2tlZCANCj4+IGJ1aWxkL3RtcC93b3JrL3Jv
bXVsdXMtb3BlbmJtYy1saW51eC1nbnVlYWJpL2xpbnV4LWFzcGVlZC80LjE5LjIxK2dpdEFVVE9J
TkMrZDgwOGQyN2Y3MC1yMC9saW51eC1yb211bHVzLXN0YW5kYXJkLWJ1aWxkLy5jb25maWc6IENP
TkZJR19BUkNIX05SX0dQSU8gaXMgcmVzZXQgdG8gMC4NCj4gDQo+IFVnaC4gSSBkaWRuJ3QgdHJ5
IGl0IG15c2VsZiwgd2FzIGp1c3QgaG9waW5nIHRoYXQgd291bGQgd29yay4gQXJlIHlvdSBva2F5
DQo+IHRvIGtlZXAgZGlnZ2luZyBpbnRvIHdoeT8NCg0KTWFudWFsbHkgZWRpdGluZyAiQVJDSF9O
Ul9HUElPIiBpbiA8cGxhdGZvcm0+LmNmZyBkb2Vzbid0IHdvcmsgYmVjYXVzZSBBUkNIX05SX0dQ
SU8gc3ltYm9sIGlzICJpbnZpc2libGUiIGFuZCB1c2VyIGRlZmluZWQgdmFsdWUgd2lsbCBiZSBp
Z25vcmVkIGJ5ICJzY3JpcHRzL2tjb25maWcvY29uZiIuIEkgY29tcGFyZWQgYSBmZXcgb3RoZXIg
d2F5cyB0byBmaXgvd29ya2Fyb3VuZCB0aGUgaXNzdWUsIGJ1dCBJTUhPLCBpbmNyZWFzaW5nIGRl
ZmF1bHQgQVJDSF9OUl9HUElPIGZvciBBUkNIX0FTUEVFRCBpcyBiZXR0ZXIgdGhhbiBvdGhlciBz
b2x1dGlvbnMuIFBsZWFzZSBzdWdnZXN0Lg0KDQpCVFcsICJDT05GSUdfR0NDX1BMVUdJTlM9eSIg
aW4gbWV0YS1hc3BlZWQvcmVjaXBlcy1rZXJuZWwvbGludXgvYXN0MjUwMC9kZWZjb25maWcgaXMg
bm90IGluY2x1ZGVkIGluIHRoZSBmaW5hbCAuY29uZmlnIGJlY2F1c2UgaXRzIGRlcGVuZGVuY3kg
b3B0aW9uIFBMVUdJTl9IT1NUQ0MgaXMgbm90IHNldC4NCg0KDQpUaGFua3MsDQoNCi0gVGFvDQo=
