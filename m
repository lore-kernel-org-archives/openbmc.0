Return-Path: <prvs=794511d68d=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=794511d68d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="BkMJzpxx"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="IaMT8j9D"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43yxyd4KWmzDqWw
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 07:21:44 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x1BKA4Og028823;
 Mon, 11 Feb 2019 12:21:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=2n9SiNddd9TBD+nceFAKL4G6xUqnis7rRW1EjK0PS6s=;
 b=BkMJzpxxL8Cyxcxbx4UX7L5F7r4Vg4VUyrIlmS3Xe0jJPrMCyENTTZ4LQGeI6yOBejdS
 UrOyHDzUxiC+JCQkCgIhSC8ivZsfhOME5C2SffAHngKWH+i30dVm3AqJ1og56fsQOxSl
 TknExoIr6wYIzW8ImyoqENSgxAvu5uSTBRI= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by m0001303.ppops.net with ESMTP id 2qkes5g928-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 11 Feb 2019 12:21:33 -0800
Received: from frc-mbx04.TheFacebook.com (192.168.155.19) by
 frc-hub01.TheFacebook.com (192.168.177.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 11 Feb 2019 12:19:56 -0800
Received: from frc-hub06.TheFacebook.com (192.168.177.76) by
 frc-mbx04.TheFacebook.com (192.168.155.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 11 Feb 2019 12:19:29 -0800
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.76) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Mon, 11 Feb 2019 12:19:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2n9SiNddd9TBD+nceFAKL4G6xUqnis7rRW1EjK0PS6s=;
 b=IaMT8j9D0JY4U1bV0iG2OzJKzFkXJ2fBa4LaiJ5Kob0hTv9mI2YNKhHO4KY7yZN+W9AATOjHIAWLNxCpmS0WWY/7FQObtu/ug0OJwzPio8CMHPFzhy8MuNxFgyPOV6ak6lf8sBLHnUldWI+VLj8z+sNnazJofg1PBvT373Jf+fQ=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1734.namprd15.prod.outlook.com (10.174.53.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.17; Mon, 11 Feb 2019 20:19:27 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b9cb:6dd8:d8bf:45c6]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b9cb:6dd8:d8bf:45c6%2]) with mapi id 15.20.1601.023; Mon, 11 Feb 2019
 20:19:27 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: New repo request
Thread-Topic: New repo request
Thread-Index: AQHUvxSgVukF5Z54JEuv/QBD0vcAnqXa+/IA//+N34A=
Date: Mon, 11 Feb 2019 20:19:27 +0000
Message-ID: <6771B735-2A01-45DE-B758-3B4497FF55F5@fb.com>
References: <AA5BE1BA-F0FE-452E-B935-989AE8C14AC0@fb.com>
 <20190211190738.l6dx7w2akay34w53@thinkpad.dyn.fuzziesquirrel.com>
In-Reply-To: <20190211190738.l6dx7w2akay34w53@thinkpad.dyn.fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:6ae9]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1734;
 20:OQy5yiUT7AQkayVMWZLHEm3PegLf4ORskMqxszS87K/BfouwIwXGDu9fJ54zIqwRakyYLBeoO9NZuSR2DUUgN/i36mJQJa7piTWyYVJXB7o9uV1/7vdoUNfv4vHViSJZnZwPMqgmO+sPhGmOMUBpTnfitlHugOXSA70JQEUaQPs=
x-ms-office365-filtering-correlation-id: 743c95f6-57a8-4b98-a594-08d6905e38ce
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1734; 
x-ms-traffictypediagnostic: CY4PR15MB1734:
x-microsoft-antispam-prvs: <CY4PR15MB1734A58224366DCEFC9D600DDD640@CY4PR15MB1734.namprd15.prod.outlook.com>
x-forefront-prvs: 0945B0CC72
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(376002)(396003)(366004)(39860400002)(199004)(189003)(305945005)(46003)(71200400001)(106356001)(7116003)(446003)(11346002)(2616005)(6436002)(3480700005)(6486002)(105586002)(229853002)(68736007)(71190400001)(7736002)(83716004)(6916009)(6116002)(256004)(4744005)(81156014)(2906002)(97736004)(81166006)(86362001)(316002)(8676002)(478600001)(8936002)(14454004)(6506007)(76176011)(53936002)(25786009)(99286004)(486006)(186003)(102836004)(476003)(33656002)(6512007)(6246003)(4326008)(82746002)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1734;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DEXCBR+z6MXMW54Kp6AXvA1+M5sITwQkLKpsgVIKhu4k5tv5vVJboocnLG6ZwXM2TW7uvPtrIAfSCyS5nd4G+mUxIaL8uZHPUArCR4vE6PSn1q0icsanPvYrOzjSrJKrDBzhxgfHKarbXpo8xK2pRL3xYBACgAdUWypaAKNYmQ7GSHiGgroXvVbRAdVx9e0oP4CrDAdE2CmX1rWx8dfF+9wVFKUi/ZGnQ1BFP6rFr53Kf/cQ3cKI/Yn/hgg4D2FaLCOuCqImk51yvJdLYBFOoPs+Qin+LQdCpPmo0j+ChjgiX/TNiJzFw55+1c8mlNkK6+yTlEbV+yaGsYzCWs+O//oNW6ULp0E3FsuDTf2IxdsdrvP6qgRkS2xODyoUq4LP8dPI19tEe0bDdko6exegZFl32sJNnpbrbsBE8SFhaVw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <182EA93D46EA4742B1A886956DD6608B@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 743c95f6-57a8-4b98-a594-08d6905e38ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2019 20:19:27.3395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1734
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-11_14:, , signatures=0
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
X-List-Received-Date: Mon, 11 Feb 2019 20:21:46 -0000

VGhhbmtzDQoNCu+7v09uIDIvMTEvMTksIDExOjA3IEFNLCAiQnJhZCBCaXNob3AiIDxicmFkbGV5
YkBmdXp6aWVzcXVpcnJlbC5jb20+IHdyb3RlOg0KDQogICAgT24gVGh1LCBGZWIgMDcsIDIwMTkg
YXQgMDY6NDA6NDFQTSArMDAwMCwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID5IaSBCcmFkLA0K
ICAgID5XZSBuZWVkIGEgbmV3IHJlcG8gZmItaXBtaS1vZW0gZm9yIGZhY2Vib29rIG9lbSBJUE1J
IG1lc3NhZ2UgaGFuZGxpbmcuIFBsZWFzZSBsZXQgbWUga25vdyB3aGF0IGFyZSBiYXNpYyBzdGVw
cyBJIG5lZWQgdG8gZm9sbG93Lg0KICAgID4NCiAgICA+UmVnYXJkcw0KICAgID4tVmlqYXkNCiAg
ICANCiAgICBIaSBWaWpheQ0KICAgIA0KICAgIEkndmUgY3JlYXRlZCBvcGVuYm1jL2ZiLWlwbWkt
b2VtLiAgSGF2ZSBmdW4uDQogICAgDQogICAgdGh4IC0gYnJhZA0KICAgIA0KDQo=
