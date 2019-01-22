Return-Path: <prvs=6925d468ca=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6925d468ca=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="qy6Eieh+"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="EjS01uBS"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kc7W29RNzDqKw
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 05:16:30 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0MI8jOV002777
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 10:16:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=n2c4AwnP1HoLlo3iQ42OZh8EDgL2O8vnEDUiv8zwCsI=;
 b=qy6Eieh+4VA9Tyv8LbMQo1fSzD6jD0pexg4loQleMQ6BUNsm3OIr7WbJZPPOZjWsECWz
 attP2vjUD/18qEvpZVZGHpaQ2JF7Wqq0YKdIarvkJY8wNXQP4gEJ2307PGQi32egzBP4
 ozAgDmW97IYqrJ9cIebkjibqFqVf5uuLTXE= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2q65jn8qwq-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 10:16:27 -0800
Received: from frc-hub05.TheFacebook.com (2620:10d:c021:18::175) by
 frc-hub03.TheFacebook.com (2620:10d:c021:18::173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 22 Jan 2019 10:16:22 -0800
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.75) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 22 Jan 2019 10:16:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2c4AwnP1HoLlo3iQ42OZh8EDgL2O8vnEDUiv8zwCsI=;
 b=EjS01uBSqFwSPzDV66RLnwSF8pDMDDpKrJetMVKaHR7jUj0aPaWWQPKpRochM+SIlbj0lkcgGaXenGK08QyWmMEIR3IoxhLwUhsQ3jHHT8tjXXM9OEqNlHurAN4pJPoef5+emhYseqCmv6WkP5r58NGtQ2NyVpVwh4QdKwZh0pY=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1416.namprd15.prod.outlook.com (10.172.160.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.31; Tue, 22 Jan 2019 18:16:21 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b4e4:1e1f:8c5d:9a8c]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b4e4:1e1f:8c5d:9a8c%4]) with mapi id 15.20.1537.031; Tue, 22 Jan 2019
 18:16:21 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: Intel-ipmi-oem repo
Thread-Topic: Intel-ipmi-oem repo
Thread-Index: AQHUsn6T2PovaFK5IEGTS1z8ksaC/g==
Date: Tue, 22 Jan 2019 18:16:20 +0000
Message-ID: <B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:5da0]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1416;
 20:MdTMp87VtnVcnRxLxO6O6MjI8tWpQprjCjWDBOhy6YCGDQIoIh1aA50ssmV/djVqM3S0pK96Hl8O/rBn6oSMZ9NwBxF8pySzlAH+UkxEy8aTObLjdjLlOTZwnfFZcx0npVRnsz/6hapV423PuaW4iyBjOPwajgaGVL5FGcI8DVI=
x-ms-office365-filtering-correlation-id: 2c62cf86-34ad-4b40-4550-08d68095b5f6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1416; 
x-ms-traffictypediagnostic: CY4PR15MB1416:
x-microsoft-antispam-prvs: <CY4PR15MB14167F454FA0EC23EA29E8A3DD980@CY4PR15MB1416.namprd15.prod.outlook.com>
x-forefront-prvs: 0925081676
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(376002)(396003)(346002)(366004)(189003)(199004)(36756003)(316002)(6486002)(82746002)(54896002)(6512007)(2906002)(68736007)(6306002)(478600001)(99286004)(6436002)(33656002)(14454004)(83716004)(6116002)(25786009)(71190400001)(7736002)(71200400001)(256004)(14444005)(186003)(4744005)(8936002)(97736004)(81166006)(8676002)(81156014)(105586002)(486006)(106356001)(476003)(6916009)(46003)(86362001)(2616005)(102836004)(53936002)(3480700005)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1416;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ood3iYHxGJ/CmPJPfcEzi3NsDSbm/yRTzA5hOsh8bmyT4o9Ogqam44MXK1s7Ls++pyHhI5YWAgXII+gAta+pbfVlj0ojTbD8RhqTo0x0OQU/Oc9u6ocXMG7jQWQn8kPZ3U2qEjCiPaIon3tlSbOIJDvGCgpDG0hsbpzDUmpjdwimDbsgJ/giLsX8cQ0H5k3HchEkY265PV9nV31Gw1qzZfZXb7n+Rrj/NgITs15PmRp4VqVuV/YlMFENRvxTgzW9p/yiMoWihyY2P5H/thXd+mpaqngusY8xafBjszTVgEsYbj5nKFhh0ZQTkZnVLvl6B/AFMdBBLtsSQboYK8dKSLPWHGewCq/ByZ0vTRm+awCdO6N+A1xL0s0cQN7G89pllM/C1a3qycvDp1jxVxaQRUOvsLGror4VER4PKwljOjs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_B67393AC1915499993D9944EA6D61D2Afbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c62cf86-34ad-4b40-4550-08d68095b5f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2019 18:16:20.9708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1416
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-22_10:, , signatures=0
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
X-List-Received-Date: Tue, 22 Jan 2019 18:16:40 -0000

--_000_B67393AC1915499993D9944EA6D61D2Afbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGVhbSwNCkludGVsLWlwbWktb2VtIHNob3VsZCBiZSBicm9rZW4gYW5kIDIgcGFydHMsIGdlbnJp
YyBhbmQgb2VtIHNwZWNpZmljLiBJIHNlZSBzZXZlcmFsIGZ1bmN0aW9uYWxpdHkgaW4gdGhpcyBy
ZXBvIGxpa2Ugc2Vuc29ycyBhbmQgc3RvcmFnZSBjb21tYW5kcyBhcmUgZ2VuZXJpYyBlbm91Z2gg
dG8gYmUgdXNlZCBieSBvdGhlciBwbGF0Zm9ybSB3aG8gaXMgdXNpbmcgZW50aXR5IG1hbmFnZXIu
IFNvIEkgZmVlbCB0aGF0IHdlIHNob3VsZCBoYXZlIHRoZXNlIGZ1bmN0aW9uYWxpdGllcyB0byBi
ZSBtb3ZlZCB0byBhIHNlcGFyYXRlIGNvbW1vbiByZXBvIHdoaWNoIGNhbiBiZSB1c2VkIGJ5IGV2
ZXJ5b25lIGFuZCB0aGlzIHJlcG8gY2FuIG9ubHkgY29udGFpbiBJbnRlbCBPRU0gc3BlY2lmaWMg
SVBNSSBjb21tYW5kIHN1cHBvcnQuDQoNCk15IDIgY2VudHMg8J+Yig0KDQpSZWdhcmRzDQotVmlq
YXkNCg0K

--_000_B67393AC1915499993D9944EA6D61D2Afbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <DDCFF1691978FC46841186346FE54935@namprd15.prod.outlook.com>
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
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJBcHBsZSBD
b2xvciBFbW9qaSI7DQoJcGFub3NlLTE6MCAwIDAgMCAwIDAgMCAwIDAgMDt9DQovKiBTdHlsZSBE
ZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0K
CXttYXJnaW46MGluOw0KCW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0
Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29I
eXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4
dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9s
bG93ZWQNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1k
ZWNvcmF0aW9uOnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlw
ZTpwZXJzb25hbC1jb21wb3NlOw0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0K
CWNvbG9yOndpbmRvd3RleHQ7fQ0Kc3Bhbi5hcHBsZS1jb252ZXJ0ZWQtc3BhY2UNCgl7bXNvLXN0
eWxlLW5hbWU6YXBwbGUtY29udmVydGVkLXNwYWNlO30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1z
dHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlm
O30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4w
aW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0
aW9uMTt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMw
NTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtjb2xvcjpibGFj
ayI+VGVhbSw8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj48bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dDtjb2xvcjpibGFjayI+SW50ZWwtaXBtaS1vZW0gc2hvdWxkIGJlIGJyb2tlbiBhbmQgMiBwYXJ0
cywgZ2VucmljIGFuZCBvZW0gc3BlY2lmaWMuIEkgc2VlIHNldmVyYWwgZnVuY3Rpb25hbGl0eSBp
biB0aGlzIHJlcG8gbGlrZSBzZW5zb3JzIGFuZCBzdG9yYWdlIGNvbW1hbmRzIGFyZSBnZW5lcmlj
IGVub3VnaCB0byBiZSB1c2VkIGJ5IG90aGVyIHBsYXRmb3JtDQogd2hvIGlzIHVzaW5nIGVudGl0
eSBtYW5hZ2VyLiBTbyBJIGZlZWwgdGhhdCB3ZSBzaG91bGQgaGF2ZSB0aGVzZSBmdW5jdGlvbmFs
aXRpZXMgdG8gYmUgbW92ZWQgdG8gYSBzZXBhcmF0ZSBjb21tb24gcmVwbyB3aGljaCBjYW4gYmUg
dXNlZCBieSBldmVyeW9uZSBhbmQgdGhpcyByZXBvIGNhbiBvbmx5IGNvbnRhaW4gSW50ZWwgT0VN
IHNwZWNpZmljIElQTUkgY29tbWFuZCBzdXBwb3J0Ljwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6
YmxhY2siPjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2NvbG9yOmJsYWNrIj4mbmJzcDs8L3NwYW4+PHNwYW4g
c3R5bGU9ImNvbG9yOmJsYWNrIj48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtjb2xvcjpibGFjayI+TXkgMiBj
ZW50cyZuYnNwOzwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWls
eTomcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90Oztjb2xvcjpibGFjayI+JiMxMjg1MjI7PC9z
cGFuPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Y29sb3I6Ymxh
Y2siPiZuYnNwOzwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPjxvOnA+PC9vOnA+PC9z
cGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEu
MHB0O2NvbG9yOmJsYWNrIj5SZWdhcmRzPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+
PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQ7Y29sb3I6YmxhY2siPi1WaWpheTwvc3Bhbj48c3BhbiBzdHlsZT0i
Y29sb3I6YmxhY2siPjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48
L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_B67393AC1915499993D9944EA6D61D2Afbcom_--
