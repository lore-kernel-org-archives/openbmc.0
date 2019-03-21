Return-Path: <prvs=8983677cc9=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=8983677cc9=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="SUWQljU+"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="A3fWWyFb"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QKmR44VqzDqH5
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 08:33:57 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2LLXqT9014908; Thu, 21 Mar 2019 14:33:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=99sZuZ/iQEY0DGjb8UnnF1T1f8BrB3UYj4Ovbno3o2c=;
 b=SUWQljU+Y5C83/wHVztYu+SKjBn6426T46lu2pdMfEO81167qKshiu5320COtROkp6kB
 R9IgH0pdI00VDA41+ly9lguiLgUf1q3Y63w0ypjW21Ynb7stoCeO+Bqqj3umvQNUdj87
 rd8bq4qadDGH9R9ITJMTBEb5Y+UpHcjmTvg= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2rchay0a0h-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 21 Mar 2019 14:33:53 -0700
Received: from frc-mbx05.TheFacebook.com (2620:10d:c0a1:f82::29) by
 frc-hub04.TheFacebook.com (2620:10d:c021:18::174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 21 Mar 2019 14:33:37 -0700
Received: from frc-hub05.TheFacebook.com (2620:10d:c021:18::175) by
 frc-mbx05.TheFacebook.com (2620:10d:c0a1:f82::29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 21 Mar 2019 14:33:37 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.75) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 21 Mar 2019 14:33:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99sZuZ/iQEY0DGjb8UnnF1T1f8BrB3UYj4Ovbno3o2c=;
 b=A3fWWyFbQHc7MplZzx6siwb9jUREIBmCNSkKb7rZepGFfx+fl+xThP1uwG+V347GuRVHIdo8vY/MlOiZ4z9pBRMgxwuE/G35tXRClG94wlq7oW6AB9vVk+TlRYN+51UNP11Msm7veoPLGorVpTilJnuOLzkVXOpJCMBDvj92y4A=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1544.namprd15.prod.outlook.com (10.172.162.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.17; Thu, 21 Mar 2019 21:33:36 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d%3]) with mapi id 15.20.1709.015; Thu, 21 Mar 2019
 21:33:36 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: IPMID crashing
Thread-Topic: IPMID crashing
Thread-Index: AQHU4B2q5jrvB+ZVe0We4JZKaBbl66YWfaQA//+oQYA=
Date: Thu, 21 Mar 2019 21:33:35 +0000
Message-ID: <A7D8375F-06C9-4342-92E3-B5041E087AC3@fb.com>
References: <581CE770-69F0-404F-9D87-8378753457C6@fb.com>
 <20190321194738.GF44612@mauery.jf.intel.com>
In-Reply-To: <20190321194738.GF44612@mauery.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:2139]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3599cbeb-304c-41cb-a55d-08d6ae44e01a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1544; 
x-ms-traffictypediagnostic: CY4PR15MB1544:
x-microsoft-antispam-prvs: <CY4PR15MB1544DE6906F1ADB7258BBD04DD420@CY4PR15MB1544.namprd15.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(376002)(366004)(396003)(136003)(199004)(189003)(6512007)(229853002)(2906002)(25786009)(36756003)(6246003)(305945005)(6506007)(316002)(256004)(4744005)(14454004)(5660300002)(3480700005)(53546011)(46003)(82746002)(8936002)(478600001)(7116003)(105586002)(53936002)(11346002)(106356001)(33656002)(68736007)(186003)(86362001)(97736004)(7736002)(99286004)(6436002)(446003)(221733001)(6116002)(71200400001)(102836004)(486006)(6916009)(76176011)(81156014)(8676002)(83716004)(71190400001)(6486002)(476003)(2616005)(81166006)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1544;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x3QuVkt2J5jLjuN1JRczxk5r+7xZuz2to7ae5aSWzl8AvtDGpNYo+5H4FpsSsdPTshgmS6re25ahBMrx4+SF6zUY0OM1ZgmqnJSZhFvztvZhwx+1O1cxVkXBCTUbmOW23iI0iWA4/kWvk78N6cF4TtRRue/LfE/j2mphHA7DPVe0U3V2IUwW3C4ws88L750T0u5UoSP2+fx6hxSvFA57oziQD8uHGYoQrXZ5NEURWeOjYAecUF01mZ/V9C6WXWlyNGGZOd9bSKoGKqS6A69sr+X1Pb4w/GxHJQ8oZCrvKfsaiylfq6fRc/yWsvWXUfG8uT15mUXfOkwGU5/V9scSJJLtxGbNxjOhc7Kc6N14P8YV7ScWMXcOl6i29N4BK1fNPeSXsovjkj3IwVNgxrrxmwqhTFHmYqJJZ4njDXQ7i5E=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D4BACAC9D2A0F47ADBBAB6D5407039A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3599cbeb-304c-41cb-a55d-08d6ae44e01a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 21:33:35.9454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1544
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-21_10:, , signatures=0
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
X-List-Received-Date: Thu, 21 Mar 2019 21:34:01 -0000

SSBzZWFyY2hlZCBmb3IgdGhpcyBvdXRwdXQgc3RyaW5nIGFuZCBmb3VuZCBpbiBsaWJjLTIuMjgu
c28gYW5kIGxpYmMuYS4gSSBoYXZlIG5vIGlkZWEsIHdoYXQgaXMgaXQgZG9pbmcuIEkgaGF2ZSBl
eGVjdXRlZCBpdCBtYW51YWxseSBmcm9tIGNvbW1hbmQgbGluZSBhbmQgY2FuIHNlZSBhbGwgb2Vt
IGZ1bmN0aW9ucyBpdCByZWdpc3RlcnMuDQoNCu+7v09uIDMvMjEvMTksIDEyOjQ3IFBNLCAiVmVy
bm9uIE1hdWVyeSIgPHZlcm5vbi5tYXVlcnlAbGludXguaW50ZWwuY29tPiB3cm90ZToNCg0KICAg
IE9uIDIxLU1hci0yMDE5IDA3OjM4IFBNLCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAgPkFueW9u
ZSBpcyBzZWVpbmcgaXBtaWQgY3Jhc2hpbmcuIEkgaGF2ZSBjaGVja2Vkb3V0IG9wZW5ibWMgdG9k
YXkgYW5kIHNlZWluZyBpcG1pZCBpcyBjcmFzaGluZyB3aXRoIGZvbGxvd2luZyBtZXNzYWdlDQog
ICAgPg0KICAgID5yZWFsbG9jKCk6IGludmFsaWQgbmV4dCBzaXplDQogICAgDQogICAgV2hhdCB3
YXMgaXQgZG9pbmc/IFdoYXQgSVBNSSBjb21tYW5kIHdhcyBydW5uaW5nIHdoZW4gaXQgY3Jhc2hl
ZD8gV2hhdCANCiAgICBwcm92aWRlciBsaWJyYXJpZXMgZG8geW91IGhhdmUgaXQgbG9hZGluZz8N
CiAgICANCiAgICAtLVZlcm5vbg0KICAgIA0KDQo=
