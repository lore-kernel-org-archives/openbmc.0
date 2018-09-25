Return-Path: <prvs=2806881923=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2806881923=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="HZetARUC"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="RHw1IyHh"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42KWsk031TzDr4m
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 05:51:20 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8PJouYI024551
 for <openbmc@lists.ozlabs.org>; Tue, 25 Sep 2018 12:51:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=pj46c7W3MGKQP4BQ//mwu+wvRSQ/rgG/O4d7U/8jT/E=;
 b=HZetARUCdnuTF7NmAiafxvlrx9cvhYrHJeWbC4AtfLnOpg0Sfub9dj7P9cr7nQ3JIQJr
 vV6PHXs/u5cPuAyfrx4hQlxrZx6ldZO7MpiXIF9195RuTBx4c3UljvadykJmLprDXjKh
 t7IwK6PspWkg+14JDZhs21OzxgoIRclxsbU= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2mqt7088tq-5
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 25 Sep 2018 12:51:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.34) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Tue, 25 Sep 2018 15:50:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pj46c7W3MGKQP4BQ//mwu+wvRSQ/rgG/O4d7U/8jT/E=;
 b=RHw1IyHhZpX3TXAJL0G+O4kmefpZi9sxtytyP+J4MhRvPl+WYXF3QTdNF7vPYYU2fY9cr7DLJvnrmTp2wZqudHaCj9BFcQlKRXEdn6PxyXZBnmugel8QgVsOpxSQXMMdHz2bK6RTMCErb93/4sOuwZCbTNFIKnYjuBnuWqV4cRo=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1829.namprd15.prod.outlook.com (10.174.54.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1143.15; Tue, 25 Sep 2018 19:50:13 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::3cb5:8b7b:eafb:d86c]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::3cb5:8b7b:eafb:d86c%5]) with mapi id 15.20.1143.019; Tue, 25 Sep 2018
 19:50:13 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: patching kernel config
Thread-Topic: patching kernel config
Thread-Index: AQHUVQj5bXav0eYhgkOOuHZSjpQ5/g==
Date: Tue, 25 Sep 2018 19:50:13 +0000
Message-ID: <7C63E1AB-96D4-4132-8235-66B84CC3CBAF@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:8fe4]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1829;
 20:rcs3COnDtDvjzpWCBc4mv2VLoLcDlOCMisH8udCDmEqbD4F6y/h/yLJltJVUtMJaKXjBjLr4kXDzYsHBmOLiy7ZsJOM+ksYSgIusoPH3kkcyGMiOlyfSjAzyUxRA+yHHxlDfXD65bjuWRQInygBz5YntWuhH8JAd+O8vCT61zjs=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: f3cb7db6-9920-47a4-3e24-08d623201bda
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1829; 
x-ms-traffictypediagnostic: CY4PR15MB1829:
x-microsoft-antispam-prvs: <CY4PR15MB18292F6BB2CEC8DF1F062856DD160@CY4PR15MB1829.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21748063052155)(28532068793085)(190501279198761)(227612066756510); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231355)(11241501184)(944501410)(52105095)(93006095)(93001095)(149066)(150027)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(201708071742011)(7699051);
 SRVR:CY4PR15MB1829; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1829; 
x-forefront-prvs: 08062C429B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(396003)(376002)(136003)(346002)(189003)(199004)(25786009)(8676002)(7736002)(33656002)(316002)(256004)(99286004)(36756003)(106356001)(105586002)(82746002)(2900100001)(83716004)(8936002)(81156014)(2906002)(81166006)(68736007)(71190400001)(71200400001)(5250100002)(9326002)(97736004)(476003)(6916009)(486006)(6506007)(14454004)(3480700004)(46003)(6436002)(6486002)(6116002)(5660300001)(53936002)(6306002)(54896002)(102836004)(7116003)(478600001)(6512007)(86362001)(2616005)(34290500001)(186003)(133083001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1829;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: q80/z8RlFUcHxrafOxfPRaSC9pGDL1YM91IVAARbJprCWtObz7fTDQExzA2bJpRhe56xZ5iePJVYcg3AOg9jSZuyz5dqZr/dMqOpQD18Wac7rQ6OW0PkjZudN2iGTbQJd3ZOuAb9itspFtCtVVW3VAeonu2o5Wp6ECIEivvDUANcIc/v63St/jYFsJPWosbVuycfKEFa9UgEd49ts+MIQhRh6RsTx3kz5lFP146a92VtTtuD7pnTzjM6vvKWiSR0wMvaQhzuimaqut+uefA2mg+C2Yf+TkV+z9FngjsAIKF3F2JFRq0bSZEVbV4ApmC/6sK4Z3y5zrJ2+gKJYxKEEmxCgu/hbJ0YA9QSkC3WKIQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_7C63E1AB96D44132823566B84CC3CBAFfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cb7db6-9920-47a4-3e24-08d623201bda
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2018 19:50:13.0705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1829
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-25_10:, , signatures=0
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
X-List-Received-Date: Tue, 25 Sep 2018 19:51:22 -0000

--_000_7C63E1AB96D44132823566B84CC3CBAFfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCkkgYW0gd29ya2luZyBvbiBtZXRhLWZhY2Vib29rIHJlcG9zaXRvcmllcyBhbmQgSSBo
YXZlIGRlZmluZWQgZXh0cmEga2VybmVsIGNvbmZpZyB0byBiZSBhcHBsaWVkIGF0IHRoZSB0b3Ag
b2YgZGVmY29uZmlnIGluIG1ldGEtdGlvZ2FwYXNzL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4
LWFzcGVlZC90aW9nYXBhc3MuY2ZnIGZpbGUuIEJ1dCBXaGVuIEkgYnVpbGQgTGludXggdXNpbmcg
4oCcYml0YmFrZSAtYyBjbGVhbmFsbCBsaW51eC1hc3BlZWQgJiYgYml0YmFrZSBsaW51eC1hc3Bl
ZWTigJ0uIEkgZG9u4oCZdCBzZWUgdGhlc2UgY29uZmlnIGJlaW5nIGFkZGVkIHRvIC5jb25maWcg
ZmlsZS4NCg0KDQoNCkkgbWlnaHQgYmUgbWlzc2luZyBzb21lIHRyaXZpYWwgdGhpbmcsIEkgY2hl
Y2tlZCBpbiBtZXRhLXRpb2dhcGFzcy9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC1hc3BlZWRf
JS5iYmFwcGVuZCBhbmQgSSBmaW5kIGVudHJ5IG9mIHRpb2dhcGFzcy5jZmcgYXMgYSBzb3VyY2Ug
ZmlsZS4NCg0KDQoNClJlZ2FyZHMNCg0KLVZpamF5DQoNCg0K

--_000_7C63E1AB96D44132823566B84CC3CBAFfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <D5177BF4F2323544A472A19E981BC610@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6RGVuZ1hpYW47DQoJcGFub3NlLTE6
MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7
DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZh
bWlseToiXEBEZW5nWGlhbiI7DQoJcGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQpAZm9u
dC1mYWNlDQoJe2ZvbnQtZmFtaWx5Ok1lbmxvOw0KCXBhbm9zZS0xOjIgMTEgNiA5IDMgOCA0IDIg
MiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25zICovDQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFs
LCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjowaW47DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0K
CWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0K
YTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29s
b3I6IzA1NjNDMTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCmE6dmlzaXRlZCwgc3Bh
bi5Nc29IeXBlcmxpbmtGb2xsb3dlZA0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6
Izk1NEY3MjsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE3
DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGli
cmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQpwLnAxLCBsaS5wMSwgZGl2LnAx
DQoJe21zby1zdHlsZS1uYW1lOnAxOw0KCW1hcmdpbjowaW47DQoJbWFyZ2luLWJvdHRvbTouMDAw
MXB0Ow0KCWJhY2tncm91bmQ6d2hpdGU7DQoJZm9udC1zaXplOjguNXB0Ow0KCWZvbnQtZmFtaWx5
Ok1lbmxvOw0KCWNvbG9yOmJsYWNrO30NCnNwYW4uczENCgl7bXNvLXN0eWxlLW5hbWU6czE7fQ0K
Lk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41
aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNl
Y3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9k
eSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFz
cz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij5IaSw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0icDEiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5JIGFtIHdvcmtpbmcgb24gbWV0YS1mYWNlYm9v
ayByZXBvc2l0b3JpZXMgYW5kIEkgaGF2ZSBkZWZpbmVkIGV4dHJhIGtlcm5lbCBjb25maWcgdG8g
YmUgYXBwbGllZCBhdCB0aGUgdG9wIG9mIGRlZmNvbmZpZyBpbg0KPC9zcGFuPjxzcGFuIGNsYXNz
PSJzMSI+bWV0YS10aW9nYXBhc3MvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgtYXNwZWVkL3Rp
b2dhcGFzcy5jZmcNCjwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+ZmlsZS4g
QnV0IFdoZW4gSSBidWlsZCBMaW51eCB1c2luZyDigJxiaXRiYWtlIC1jIGNsZWFuYWxsIGxpbnV4
LWFzcGVlZCAmYW1wOyZhbXA7IGJpdGJha2UgbGludXgtYXNwZWVk4oCdLiBJIGRvbuKAmXQgc2Vl
IHRoZXNlIGNvbmZpZyBiZWluZyBhZGRlZCB0byAuY29uZmlnIGZpbGUuDQo8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0icDEiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48
bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0icDEiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij5JIG1pZ2h0IGJlIG1pc3Npbmcgc29tZSB0cml2aWFsIHRoaW5nLCBJ
IGNoZWNrZWQgaW4NCjwvc3Bhbj48c3BhbiBjbGFzcz0iczEiPm1ldGEtdGlvZ2FwYXNzL3JlY2lw
ZXMta2VybmVsL2xpbnV4L2xpbnV4LWFzcGVlZF8lLmJiYXBwZW5kDQo8L3NwYW4+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPmFuZCBJIGZpbmQgZW50cnkgb2YgdGlvZ2FwYXNzLmNmZyBh
cyBhIHNvdXJjZSBmaWxlLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJwMSI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJwMSI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2FyZHM8bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0icDEiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0Ij4tVmlqYXk8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0icDEiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8
L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_7C63E1AB96D44132823566B84CC3CBAFfbcom_--
