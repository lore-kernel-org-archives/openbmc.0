Return-Path: <prvs=9997835735=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=9997835735=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="d/B/PPm8"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Q3Qt8DeB"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZzPK4m3bzDqJH
 for <openbmc@lists.ozlabs.org>; Fri,  5 Apr 2019 10:17:23 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x34NCQaI026231; Thu, 4 Apr 2019 16:17:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=XTAlyqIskrbMVETZE8GX8+w3t/P2bG5P1ypGLdDUBBk=;
 b=d/B/PPm8UWuRmbpr1Xz/vLQght6tz3+ztKvvv2f7k1f5/SPKM/tX0BXAJ6X9VrEG81XT
 T9O6f8/OJ0rn1+jVggvGf5tdENCvOzVkjr15xOsEC+XXvrs3ysCt88V9etbqojBy5xXE
 eIa70vOzyUPG2figyPW0s2UCtd/QDOa8l34= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2rnu9t015q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 04 Apr 2019 16:17:20 -0700
Received: from frc-hub04.TheFacebook.com (2620:10d:c021:18::174) by
 frc-hub02.TheFacebook.com (2620:10d:c021:18::172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 4 Apr 2019 16:17:18 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.74) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 4 Apr 2019 16:17:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTAlyqIskrbMVETZE8GX8+w3t/P2bG5P1ypGLdDUBBk=;
 b=Q3Qt8DeBCvHKjvZOjFlRZ/I/xSCiFY65iFYTtJmtlx9COB1YWMTfY1sLFcm0//fFG4nbvxJMybuB8uSuJhSaEyjjyrJeXsNr26bUaeC3fMU68j8a9KZHodYGxcRhvjNrBSaZL4G3+ohBNSg+XjWdOd6XdEdn2kAIDQhaMEKsC0Q=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1656.namprd15.prod.outlook.com (10.175.116.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.20; Thu, 4 Apr 2019 23:17:18 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d%3]) with mapi id 15.20.1750.017; Thu, 4 Apr 2019
 23:17:18 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "james.feist@linux.intel.com" <james.feist@linux.intel.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: gpis definition in entity manager
Thread-Topic: gpis definition in entity manager
Thread-Index: AQHU6zyLN1fcQof7Hk6AAl7e3AKFJA==
Date: Thu, 4 Apr 2019 23:17:17 +0000
Message-ID: <24E07121-9DA2-4A65-878C-1D7C906A04C6@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:23ea]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 257692dd-c13f-4abb-604f-08d6b953ae80
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR15MB1656; 
x-ms-traffictypediagnostic: CY4PR15MB1656:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CY4PR15MB1656BA75EF2871E10B75B255DD500@CY4PR15MB1656.namprd15.prod.outlook.com>
x-forefront-prvs: 0997523C40
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(366004)(346002)(376002)(136003)(199004)(189003)(2351001)(82746002)(105586002)(97736004)(106356001)(8936002)(9326002)(7736002)(68736007)(33656002)(83716004)(4326008)(71190400001)(5660300002)(478600001)(71200400001)(14454004)(2616005)(81166006)(99286004)(316002)(8676002)(81156014)(486006)(2501003)(36756003)(25786009)(6436002)(6486002)(6306002)(558084003)(6916009)(6116002)(53936002)(6512007)(102836004)(186003)(86362001)(2906002)(54896002)(476003)(46003)(5640700003)(6506007)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1656;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R0GCUpYg+b0aB0Et3IeOV2hKpzKQVWrAWWltsktDMXuXUae090KtA3ITbi1WEPMYxcTjxZxmzBTRj6iPuWxWhVVXDw53EQhpjIrfxu+fh1FrAJwtlztD20ZSGKkzCpPm1b/vST/IYwtEEnlCAEtJJ9CrxQAtjhSn7O/Xw9fwtSOklyeypidoiFBCFpd5aCIq3TH+QwKoh8QKxw5mVhWEHqtnaNlT37/C/upgeYF13us96VGmdDRrgmjD6Pb2ECpvf87PW1GwTfWxT7j3OfuVigL3fk3JdvpqzTitpWUi5ZEXw2yllPX2fxJPJIDrpR6SnU5tKi1fUV/MAyxXwPkzzudwTaiGM7/xg+01PWj85bD5ETex8vPhyWv6irF7//l3a6QTMdN/+YflruANJyAH04qV4/TzumR11GmN/LodB58=
Content-Type: multipart/alternative;
 boundary="_000_24E071219DA24A65878C1D7C906A04C6fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 257692dd-c13f-4abb-604f-08d6b953ae80
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2019 23:17:17.9135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1656
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-04_13:, , signatures=0
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
X-List-Received-Date: Thu, 04 Apr 2019 23:17:27 -0000

--_000_24E071219DA24A65878C1D7C906A04C6fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmFtZXMsDQpUaGVyZSBhcmUgZ3BpbyBkZWZpbml0aW9uIGluIGpzb24gZmlsZXMgdW5kZXIg
Y29uZmlndXJhdGlvbi4gSG93IGFyZSB3ZSB1c2luZyBpdC4gQXJlIHRoZXNlIGdwaW9zIGJlaW5n
IGluaXRpYWxpemVkIGJhc2VkIG9uIGNvbmZpZ3VyYXRpb25zIGhlcmUgYW5kIHdoZXJlIGFyZSB0
aGVzZSBiZWluZyB1c2VkLg0KDQpSZWdhcmRzDQotVmlqYXkNCg==

--_000_24E071219DA24A65878C1D7C906A04C6fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <9B11021C0556364483EB086E6CEB1EE4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpz
cGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1z
b0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4g
MTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rp
b24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBs
YW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0i
V29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij5IaSBKYW1lcyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+VGhlcmUgYXJlIGdwaW8gZGVm
aW5pdGlvbiBpbiBqc29uIGZpbGVzIHVuZGVyIGNvbmZpZ3VyYXRpb24uIEhvdyBhcmUgd2UgdXNp
bmcgaXQuIEFyZSB0aGVzZSBncGlvcyBiZWluZyBpbml0aWFsaXplZCBiYXNlZCBvbiBjb25maWd1
cmF0aW9ucyBoZXJlIGFuZCB3aGVyZSBhcmUgdGhlc2UgYmVpbmcgdXNlZC48bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
LjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2FyZHM8bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+
LVZpamF5PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_24E071219DA24A65878C1D7C906A04C6fbcom_--
