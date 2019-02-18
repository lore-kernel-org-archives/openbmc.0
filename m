Return-Path: <prvs=795208a188=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=795208a188=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="NqKGTL1J"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="DYS0zbtZ"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 442s6F44VVzDqJB
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 15:56:49 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1I4qTbX031392; Sun, 17 Feb 2019 20:56:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=VDI2kmNn8uA2RTgsoZ8OHmBSM5C1iYSkB/02eZWSf5Y=;
 b=NqKGTL1JFWi2+YdK1ifAtayXYKOXCJkQbhnps7vjHucYKw0NGbQcmnXr0uaTWmw7HUVS
 5i6VI1igOdeOlFX+Yeuw1nYvWLOWoOQj1vghETAO2HG1rcBqGwsMlwkIwE6wqdV6CMtm
 fcW8/jFSBds0Zv5lhv6zEYrRE5LAP8B1PBo= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2qqntc813r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Sun, 17 Feb 2019 20:56:44 -0800
Received: from frc-mbx02.TheFacebook.com (2620:10d:c0a1:f82::26) by
 frc-hub03.TheFacebook.com (2620:10d:c021:18::173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Sun, 17 Feb 2019 20:56:42 -0800
Received: from frc-hub03.TheFacebook.com (2620:10d:c021:18::173) by
 frc-mbx02.TheFacebook.com (2620:10d:c0a1:f82::26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Sun, 17 Feb 2019 20:56:42 -0800
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.73) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Sun, 17 Feb 2019 20:56:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDI2kmNn8uA2RTgsoZ8OHmBSM5C1iYSkB/02eZWSf5Y=;
 b=DYS0zbtZIDZgID71uGSETvml0w+EscpsJJqKV6s0ThdxwGTtr93/xIyKIThYLwucj9IGKfmL1RrZrsEI1SoGc9F+FXtTbL5xeJuNEcN9cZoZ7va/wS2ky3BqKMW2pdO47yeCn0UA59xAAVP/isVYH8ZKq6s/7qLiCuoNFzj03Kg=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1117.namprd15.prod.outlook.com (10.175.2.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.19; Mon, 18 Feb 2019 04:56:40 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::315b:5c00:59e0:b3aa]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::315b:5c00:59e0:b3aa%6]) with mapi id 15.20.1622.018; Mon, 18 Feb 2019
 04:56:34 +0000
From: Tao Ren <taoren@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Topic: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Index: AQHUxNJcttE7fFa5AU6Z0cMMPNb9Q6Xk3wcA//+d24A=
Date: Mon, 18 Feb 2019 04:56:34 +0000
Message-ID: <8614FF34-6AA3-451A-8B51-2E759A1CDB14@fb.com>
References: <3d3df19e-ea5e-8086-34ec-5fa1b200a313@fb.com>
 <d30c021d-8586-984e-a4f7-ce7cb88a1b11@fb.com>
 <1550194959.4187502.1658322936.5ED72093@webmail.messagingengine.com>
 <d271e188-e135-eaff-5532-6ba6b95dce5a@fb.com>
 <1550458070.2791184.1659887272.2685E434@webmail.messagingengine.com>
In-Reply-To: <1550458070.2791184.1659887272.2685E434@webmail.messagingengine.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.14.0.181208
x-originating-ip: [2620:10d:c090:180::1:93af]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d0729eb-6e29-45d3-220e-08d6955d74d1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1117; 
x-ms-traffictypediagnostic: MWHPR15MB1117:
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1117;
 20:Q/J0hQZvsxCFv2IMa08OdzeaS6vyUkH4d7eNy/L6ntwAmqYdRKRtE10AOSSnQGtQnvrwiKf03UjioivfmNDPOtn5PIBMwZCsp9klZAh8qqIq6VI+yizcPaM+bg+qAKxWEDjy8dv5zoTfyf6b6zdhcQPe84zVXlzJeE3T0GpsU4o=
x-microsoft-antispam-prvs: <MWHPR15MB11179A5A2719A6194DE3D5B6B2630@MWHPR15MB1117.namprd15.prod.outlook.com>
x-forefront-prvs: 09525C61DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(376002)(366004)(396003)(39850400004)(199004)(189003)(76176011)(476003)(102836004)(5660300002)(2616005)(93886005)(6116002)(11346002)(446003)(486006)(2501003)(99286004)(68736007)(186003)(256004)(33656002)(6486002)(46003)(2906002)(25786009)(478600001)(14454004)(6506007)(53936002)(71190400001)(8676002)(6512007)(106356001)(6436002)(7736002)(105586002)(8936002)(97736004)(36756003)(316002)(83716004)(86362001)(81166006)(110136005)(58126008)(6246003)(305945005)(229853002)(81156014)(71200400001)(4744005)(82746002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1117;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5lvhrQXtmj/jCU6Yq3lCt+AxIwDCoM7PXA1RfVviZPUU6P20bDYpPYPjXfhbjXxoOXogeaisVGBnmy6ZG934NBBXvEwUm591x9/XpMOgZ2MqnwbmZwloC5ZZqXlaHSaIy1GeyZAElf7TBZd22VwZY0SshwgXpSel15kWi9dcS8Qe/sBch4SMjxU9G/ysl8/sEKz3jSvksHUxeKyJtPq+nhPqz/6i4eoZwqQGV9qpRnix+Qx3GQu8UwVSvA2XrpAyjkSyWwfuVd4KE8yhcAsmr6QNCJd5UrPk26utqbho+ZJ2OVQafW21fCbvUOG5dz3JAVMh5EGtFLBI2Jth668jmWb1JtoqCAK4QWDxbgyfYlGxYxpdLucohMlXJG0Csmr5d/frztAmaFKlLtoiHzmBWn5GbSfP/FBYHuM5P0ydNeI=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF5340DB125A7F4C91A752BC88338D7C@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0729eb-6e29-45d3-220e-08d6955d74d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2019 04:56:34.1691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1117
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-18_04:, , signatures=0
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
X-List-Received-Date: Mon, 18 Feb 2019 04:56:55 -0000

SGkgQW5kcmV3LA0KDQrvu79PbiAyLzE3LzE5LCA2OjQ4IFBNLCAiQW5kcmV3IEplZmZlcnkiIDxh
bmRyZXdAYWouaWQuYXU+IHdyb3RlOg0KPiBIb3dldmVyLCB0aGVyZSdzIG5vIHJlYXNvbiB5b3Ug
Y2FuJ3QgbmFycm93IHRoZSBjaGFuZ2UgdG8gb25seSBhcHBseQ0KPiB0byB5b3VyIHN5c3RlbSAo
cmF0aGVyIHRoYW4gZG8gaXQgaW4gdGhlIGJhc2UgZGVmY29uZmlnIGFuZCBhZmZlY3QgYWxsDQo+
IHN5c3RlbXMpLg0KDQpQZXJoYXBzIGl0J3MgbXkgbGFjayBvZiBncmVhdGVyIGtub3dsZWRnZSBv
biBrY29uZmlnOyBJIGFjdHVhbGx5IHRyaWVkIGEgZmV3IG9wdGlvbnMgYnV0IGNvdWxkbid0IGZp
bmQgYSBuaWNlIHdheSB0byBhcHBseSB0aGUgY2hhbmdlIHRvIG15IHN5c3RlbSBvbmx5Lg0KDQpB
dCBmaXJzdCwgSSB0cmllZCB0byBjdXN0b21pemUgQVJDSF9OUl9HUElPIGluIG15IDxvbGQuY29u
ZmlnPiBmaWxlLCBidXQgdGhlIHZhbHVlIHdhcyBzZXQgdG8gZGVmYXVsdCAob3IgaWdub3JlZCkg
YnkgcnVubmluZyAibWFrZSBvbGRkZWZjb25maWciLg0KDQpUaGVuIEkgYWRkZWQgImlucHV0IHBy
b21wdCIgZm9yIEFSQ0hfTlJfR1BJTyBvcHRpb246IGN1c3RvbWl6ZWQgdmFsdWUgaW4gPG9sZC5j
b25maWc+IHdhcyBhcHBsaWVkIHdoaWxlIHJ1bm5pbmcgIm1ha2Ugb2xkZGVmY29uZmlnIiwgYnV0
IG15IGNvbmNlcm4gaXMgdGhlIGFwcHJvYWNoIG1heSBpbXBhY3QgbW9yZSB1c2Vycz8NCg0KTXkg
dGhpcmQgYXBwcm9hY2ggaXMgd2hhdCBJIHByb3Bvc2VkIGluIHRoaXMgZW1haWwgdGhyZWFkIChz
ZXR0aW5nIGRlZmF1bHQgQVJDSF9OUl9HUElPIHRvIDEwMjQgZm9yIEFSQ0hfQVNQRUVEKS4NCg0K
SSdtIGxvb2tpbmcgZm9yd2FyZCBmb3IgeW91ciBzdWdnZXN0aW9ucy4gVGhhbmsgeW91IGFnYWlu
Lg0KDQoNCkJlc3QgcmVnYXJkcywNCg0KVGFvDQogDQoNCg==
