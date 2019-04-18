Return-Path: <prvs=9011dafae0=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=9011dafae0=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="JHss6eAu"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="jdlqfHB8"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lWZB4dk4zDq74
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 06:54:42 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3IKgps3031442
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 13:54:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=bfnjcRKWTuVsT6gvpdnA/T+NE25A73m40wTVenYHBGM=;
 b=JHss6eAun0xhWTfogSAMaDv1Skmm6A3tl/L3cVNloj+WBPP+Bh+x2jAGmqKZMYXWIf84
 w6T/sRs4lJaJDUz4sssBQzhe4YoRV03zXNigB5N+HoKNPQvEOD77bAwSwIvKK2ZvEoGr
 X9jM17v2QjX01duQFfSrzHfv42zMRaHWS2A= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2rxw16gvws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 13:54:08 -0700
Received: from prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 18 Apr 2019 13:54:08 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 18 Apr 2019 13:54:08 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 18 Apr 2019 13:54:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfnjcRKWTuVsT6gvpdnA/T+NE25A73m40wTVenYHBGM=;
 b=jdlqfHB8zjB/3WhE85kFAG2lrM+wleYFLGQsJKz0uXPwxnkwEnNEZu7DFryXfeodtYmSyE6qbvGPvo51vlNMXGkw6jtro0RCEHn1eZwZPj2ZYmipX8hw8BZsx0fA9edsOe1sG6U7SeqQ8cgbeR668vnC4/FWe7cs9rrh+9MFHjo=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1527.namprd15.prod.outlook.com (10.172.156.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Thu, 18 Apr 2019 20:54:06 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d%3]) with mapi id 15.20.1792.018; Thu, 18 Apr 2019
 20:54:06 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: VUART config
Thread-Topic: VUART config
Thread-Index: AQHU9ijcQunAQQJaeUSD3D472aAd4Q==
Date: Thu, 18 Apr 2019 20:54:06 +0000
Message-ID: <8427BF4F-4083-4F50-ABCF-5AEAC042CA6A@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:d47a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67a8fe14-6245-4f06-c34f-08d6c43fff63
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR15MB1527; 
x-ms-traffictypediagnostic: CY4PR15MB1527:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CY4PR15MB15276F6BE45D129536F2189BDD260@CY4PR15MB1527.namprd15.prod.outlook.com>
x-forefront-prvs: 0011612A55
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(396003)(136003)(366004)(346002)(189003)(199004)(81156014)(221733001)(8676002)(81166006)(8936002)(53936002)(6116002)(486006)(6306002)(6512007)(54896002)(9326002)(66446008)(66556008)(66476007)(3480700005)(2906002)(64756008)(6436002)(36756003)(316002)(68736007)(6916009)(33656002)(97736004)(6486002)(71200400001)(5660300002)(86362001)(7116003)(7736002)(71190400001)(83716004)(14454004)(186003)(6506007)(102836004)(2616005)(46003)(25786009)(82746002)(99286004)(478600001)(4744005)(476003)(256004)(66946007)(554374003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1527;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1LzZIY9O2mUL1ZFe0fW8wZUfllQg9PBHrQasvy9c5TVBGQl574FZ35Pg/dagZUwsUW4DP7CDHh629w+W34uQxJ2sjAdo3tO0/owBdimLUbw0xMvKuTqmfHHHwGdkubprudwN5DupYHVwWqqDBBacHqnwSJm9U5ktYp+wKDn+9mrnXm8Vi4vbMPx8SLOIpSfNvBV9G24Jqugj3g1Z4cC7TbSZuxHIZ56lyR9OeP5N2l0JW7CWZ8WjWfflqyJHfoH1U97+Qbok1H+ar77GAYUDEX0wyvYsY2b4Mih4vBY3D5IT/iLYNNBSCFA/yuWu8AJSHoUSx5JCWqeqBGLJAct7/F/nFwtZe3DmAXovwqEw6dXfv+e0qun9vpR3RVihAvIB6DeJtyLvVS3kDhWYDUK3YQpFEx1XT34OEFqnr7ELToY=
Content-Type: multipart/alternative;
 boundary="_000_8427BF4F40834F50ABCF5AEAC042CA6Afbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a8fe14-6245-4f06-c34f-08d6c43fff63
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2019 20:54:06.4744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1527
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-18_10:, , signatures=0
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
X-List-Received-Date: Thu, 18 Apr 2019 20:54:44 -0000

--_000_8427BF4F40834F50ABCF5AEAC042CA6Afbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQpJIGhhdmUgZW5hYmxlZCB2dWFydCBpbiBteSBrZXJuZWwgYW5kIEkgYW0gYWJsZSB0byB1
c2UgaXQgYnV0IEkgc2VlIGJlbG93IDIgaXNzdWVzLA0KDQogIDEuICBBZnRlciBlbmFibGluZyB2
dWFydCwgSSBkb27igJl0IHNlZSBhbnl0aGluZyBvbiBkaXJlY3QgY29ubmVjdGVkIGNvbnNvbGUg
ZnJvbSBob3N0LCBsb29rcyBsaWtlIGV2ZXJ5dGhpbmcgaXMgZGlyZWN0ZWQgdG8gdnVhcnQuDQog
IDIuICBBZnRlciBMaW51eCBib290IHVwLCBJIGRvbuKAmXQgc2VlIGxvZ2luIHByb21wdCBmcm9t
IGxpbnV4IG9uIHZ1YXJ0LCBvbmx5IHNlZSB1bnRpbCBrZXJuZWwgYm9vdCBhbmQgbW91bnQgZmls
ZXN5c3RlbS4NCg0KUGxlYXNlIGxldCBtZSBrbm93IGlmIEkgbmVlZCB0byBjb25maWd1cmUgYW55
dGhpbmcgaW4gQk1DIGFzIHdlbGwgYXMgSE9TVC4NCg0KUmVnYXJkcw0KLVZpamF5DQo=

--_000_8427BF4F40834F50ABCF5AEAC042CA6Afbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <E9FCC25CC6447B48A607FBCD43FF0D9E@namprd15.prod.outlook.com>
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
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpw
Lk1zb0xpc3RQYXJhZ3JhcGgsIGxpLk1zb0xpc3RQYXJhZ3JhcGgsIGRpdi5Nc29MaXN0UGFyYWdy
YXBoDQoJe21zby1zdHlsZS1wcmlvcml0eTozNDsNCgltYXJnaW4tdG9wOjBpbjsNCgltYXJnaW4t
cmlnaHQ6MGluOw0KCW1hcmdpbi1ib3R0b206MGluOw0KCW1hcmdpbi1sZWZ0Oi41aW47DQoJbWFy
Z2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNh
bGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6
cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCglj
b2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9y
dC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCkBwYWdlIFdvcmRT
ZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4g
MS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQovKiBMaXN0
IERlZmluaXRpb25zICovDQpAbGlzdCBsMA0KCXttc28tbGlzdC1pZDoxMjYzNTM3Njg5Ow0KCW1z
by1saXN0LXR5cGU6aHlicmlkOw0KCW1zby1saXN0LXRlbXBsYXRlLWlkczotNTk1MzA4NTM2IDY3
Njk4NzAzIDY3Njk4NzEzIDY3Njk4NzE1IDY3Njk4NzAzIDY3Njk4NzEzIDY3Njk4NzE1IDY3Njk4
NzAzIDY3Njk4NzEzIDY3Njk4NzE1O30NCkBsaXN0IGwwOmxldmVsMQ0KCXttc28tbGV2ZWwtdGFi
LXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRl
bnQ6LS4yNWluO30NCkBsaXN0IGwwOmxldmVsMg0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDph
bHBoYS1sb3dlcjsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVy
LXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30NCkBsaXN0IGwwOmxldmVsMw0K
CXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDpyb21hbi1sb3dlcjsNCgltc28tbGV2ZWwtdGFiLXN0
b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOnJpZ2h0Ow0KCXRleHQtaW5kZW50
Oi05LjBwdDt9DQpAbGlzdCBsMDpsZXZlbDQNCgl7bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJ
bXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpA
bGlzdCBsMDpsZXZlbDUNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6YWxwaGEtbG93ZXI7DQoJ
bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0
Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpAbGlzdCBsMDpsZXZlbDYNCgl7bXNvLWxldmVsLW51
bWJlci1mb3JtYXQ6cm9tYW4tbG93ZXI7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNv
LWxldmVsLW51bWJlci1wb3NpdGlvbjpyaWdodDsNCgl0ZXh0LWluZGVudDotOS4wcHQ7fQ0KQGxp
c3QgbDA6bGV2ZWw3DQoJe21zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1i
ZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47fQ0KQGxpc3QgbDA6bGV2ZWw4
DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OmFscGhhLWxvd2VyOw0KCW1zby1sZXZlbC10YWIt
c3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVu
dDotLjI1aW47fQ0KQGxpc3QgbDA6bGV2ZWw5DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OnJv
bWFuLWxvd2VyOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXIt
cG9zaXRpb246cmlnaHQ7DQoJdGV4dC1pbmRlbnQ6LTkuMHB0O30NCm9sDQoJe21hcmdpbi1ib3R0
b206MGluO30NCnVsDQoJe21hcmdpbi1ib3R0b206MGluO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+
DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRp
diBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0Ij5IaSw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SSBoYXZlIGVuYWJsZWQg
dnVhcnQgaW4gbXkga2VybmVsIGFuZCBJIGFtIGFibGUgdG8gdXNlIGl0IGJ1dCBJIHNlZSBiZWxv
dyAyIGlzc3Vlcyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8b2wgc3R5bGU9Im1hcmdpbi10b3A6
MGluIiBzdGFydD0iMSIgdHlwZT0iMSI+DQo8bGkgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGgiIHN0
eWxlPSJtYXJnaW4tbGVmdDowaW47bXNvLWxpc3Q6bDAgbGV2ZWwxIGxmbzEiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0Ij5BZnRlciBlbmFibGluZyB2dWFydCwgSSBkb27igJl0IHNlZSBh
bnl0aGluZyBvbiBkaXJlY3QgY29ubmVjdGVkIGNvbnNvbGUgZnJvbSBob3N0LCBsb29rcyBsaWtl
IGV2ZXJ5dGhpbmcgaXMgZGlyZWN0ZWQgdG8gdnVhcnQuPG86cD48L286cD48L3NwYW4+PC9saT48
bGkgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDowaW47bXNvLWxp
c3Q6bDAgbGV2ZWwxIGxmbzEiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5BZnRlciBM
aW51eCBib290IHVwLCBJIGRvbuKAmXQgc2VlIGxvZ2luIHByb21wdCBmcm9tIGxpbnV4IG9uIHZ1
YXJ0LCBvbmx5IHNlZSB1bnRpbCBrZXJuZWwgYm9vdCBhbmQgbW91bnQgZmlsZXN5c3RlbS48bzpw
PjwvbzpwPjwvc3Bhbj48L2xpPjwvb2w+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlBsZWFzZSBsZXQg
bWUga25vdyBpZiBJIG5lZWQgdG8gY29uZmlndXJlIGFueXRoaW5nIGluIEJNQyBhcyB3ZWxsIGFz
IEhPU1QuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5SZWdhcmRz
PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQiPi1WaWpheTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0K
PC9ib2R5Pg0KPC9odG1sPg0K

--_000_8427BF4F40834F50ABCF5AEAC042CA6Afbcom_--
