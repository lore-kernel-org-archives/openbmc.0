Return-Path: <prvs=7949d66157=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=7949d66157=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="XggxCXVZ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="fYU5LMsu"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440xML5kjxzDqVF
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 13:01:33 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1F1wLSH009400; Thu, 14 Feb 2019 18:01:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=cW/zIrbRrw05Zw4BLQeZkAsBUpkTF3a+nRbEVG1jrH0=;
 b=XggxCXVZmu2NRoF2iuqfFbgcVVc9OLn0Nj2fO36Hpg2WMy8kgxBu/OLFarMXq8Hc1qoV
 V6cTmhD7UirxmkEaM6HF5a4ZdUdwXjyzXn46kOCyv6gdazomUvmRyW5b1vPpVCZHJN3n
 wbpY1SUyHlPpOa8iP4Y78b7qnwhx1suP7+U= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2qnh5jrhbh-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 14 Feb 2019 18:01:29 -0800
Received: from frc-mbx01.TheFacebook.com (2620:10d:c0a1:f82::25) by
 frc-hub01.TheFacebook.com (2620:10d:c021:18::171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 14 Feb 2019 18:01:28 -0800
Received: from frc-hub06.TheFacebook.com (2620:10d:c021:18::176) by
 frc-mbx01.TheFacebook.com (2620:10d:c0a1:f82::25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 14 Feb 2019 18:01:28 -0800
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.76) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Thu, 14 Feb 2019 18:01:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cW/zIrbRrw05Zw4BLQeZkAsBUpkTF3a+nRbEVG1jrH0=;
 b=fYU5LMsuPZ97nVdP9qqmj01Yetwp6cAUD6/4z8IIAXLw7xvH7vdZJ/39fmzzer4YtZV3PEXbZw0dfnQdcGGyb9mita107unxtKG11ZmQ9wB/PvIQHfVluFD4+FN2rjXtZRHJOIPnOOlobwzL9HYefyEBXJPfJEj2VW2mDdR4b+k=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1871.namprd15.prod.outlook.com (10.174.255.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.18; Fri, 15 Feb 2019 02:01:26 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::315b:5c00:59e0:b3aa]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::315b:5c00:59e0:b3aa%6]) with mapi id 15.20.1601.023; Fri, 15 Feb 2019
 02:01:26 +0000
From: Tao Ren <taoren@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Topic: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Index: AQHUxNJcttE7fFa5AU6Z0cMMPNb9Qw==
Date: Fri, 15 Feb 2019 02:01:26 +0000
Message-ID: <d271e188-e135-eaff-5532-6ba6b95dce5a@fb.com>
References: <3d3df19e-ea5e-8086-34ec-5fa1b200a313@fb.com>
 <d30c021d-8586-984e-a4f7-ce7cb88a1b11@fb.com>
 <1550194959.4187502.1658322936.5ED72093@webmail.messagingengine.com>
In-Reply-To: <1550194959.4187502.1658322936.5ED72093@webmail.messagingengine.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:300:13d::32) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::6:82ab]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8db3c279-bfce-4bb2-5898-08d692e97e3f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1871; 
x-ms-traffictypediagnostic: MWHPR15MB1871:
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1871;
 20:xxSEyo40lBAo69a2YN0ZUizKzUsvQdWXvYpJQKmFt4Gr/c6LbPIm1HwrEUT85l11Ru+wSVWGUj05uxtBvnfrM7e3pil/MrRL4ZytpUOiozb6KZYmSuB7l+b9QsA8BtU1VXA18fktwdszYReKapJzTtH5JW9fh8ST4v0sM5sl1IY=
x-microsoft-antispam-prvs: <MWHPR15MB1871A00755B2DCFD8567D0B0B2600@MWHPR15MB1871.namprd15.prod.outlook.com>
x-forefront-prvs: 09497C15EB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(39860400002)(396003)(376002)(366004)(189003)(199004)(2501003)(256004)(106356001)(31686004)(2906002)(4744005)(97736004)(68736007)(71190400001)(36756003)(71200400001)(64126003)(105586002)(386003)(14454004)(446003)(486006)(186003)(46003)(65826007)(53546011)(6506007)(102836004)(2616005)(11346002)(476003)(52116002)(76176011)(99286004)(65806001)(65956001)(316002)(58126008)(6116002)(478600001)(6436002)(6512007)(229853002)(110136005)(6486002)(7736002)(81156014)(81166006)(8676002)(25786009)(8936002)(31696002)(6246003)(53936002)(305945005)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1871;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: A1zvYjbEDnJwVaQheuiwa59v1nYGbbkS/lfbr+1q9LBL49hE2GiA+886NOG1ZOHcA3/cZQA1OWI2z1InOa3l6tXyPO2EPfN/ugJEszzMhybCTtYWe7cKF4HZTbAI2Aj/iZkCjgh4NQX4hSL9c75UvmlXIV/zKC5X7Vur4qu2grD+c7rb0m37ARQeWvrgKmeFiRZfDxR5FgKA1ivpsekX/PkdNBszbZo2NR9kCV2dQbtIxMbw1xxIEMkLJka5CJ6NjJZTscSgqk9O9E5qzAqsFbaklQCO01FYMzfAxUrnpSvUE1wkn3ly0RGjH+BgQ2lH3SwXiZ9GrP7SnACRJKfiDsHA6RHA5DvIL/fCpJW2LMbq9+hka/Oh8iAvx94udKS8WiLj6tafXlFE+g0rUjYSw6J/DusWS/SvinktbTrzNns=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CC7BA29B5E37F40810314C37667E42D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db3c279-bfce-4bb2-5898-08d692e97e3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2019 02:01:26.1228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1871
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-14_12:, , signatures=0
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
X-List-Received-Date: Fri, 15 Feb 2019 02:01:35 -0000

T24gMi8xNC8xOSA1OjQyIFBNLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToNCj4gSSBkb24ndCBrbm93
IHRoYXQgdGhlcmUncyBtdWNoIG90aGVyIGNob2ljZSwgYnV0IGJld2FyZSB0aGF0IGNoYW5naW5n
DQo+IHRoZSB2YWx1ZSB3aWxsIGltcGFjdCB1c2Vyc3BhY2UgaWYgeW91J3JlIHVzaW5nIHRoZSBz
eXNmcyBpbnRlcmZhY2UgKHdoaWNoDQo+IHlvdSAgaWRlYWxseSB5b3Ugc2hvdWxkbid0IGJlLCBh
cyBpdCdzIGRlcHJlY2F0ZWQpLCBhcyB0aGUgYmFzZSBhZGRyZXNzZXMNCj4gb2YgdGhlIGdwaW9j
aGlwcyB3aWxsIGNoYW5nZS4NCj4gDQo+IEFuZHJldw0KDQpUaGFuayB5b3UgQW5kcmV3IGZvciB0
aGUgY29tbWVudHMuIEhvcGVmdWxseSBub2JvZHkgaW4gdGhlIGNvbW11bml0eSB3aWxsIGJlIGlt
cGFjdGVkIGJ5IHRoZSBwYXRjaDsgaWYgdW5mb3J0dW5hdGVseSBzb21lIGFwcHMgYXJlIGJyb2tl
biAoZHVlIHRvIHRoZSBkZXBlbmRlbmN5IG9uIHN5c2ZzLWdwaW8pLCBJJ20gaGFwcHkgdG8gaGVs
cCB3aXRoIHRoZSBmaXguDQoNClRoYW5rcywNCg0KLSBUYW8NCg==
