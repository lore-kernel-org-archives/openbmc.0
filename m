Return-Path: <prvs=1760f1252d=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1760f1252d=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="hKflR5jE"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="XXmxQ8Wh"; dkim-atps=neutral
X-Greylist: delayed 1318 seconds by postgrey-1.36 at bilbo;
 Sat, 11 Aug 2018 09:09:32 AEST
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41nLRc6R9QzDr5t
 for <openbmc@lists.ozlabs.org>; Sat, 11 Aug 2018 09:09:32 +1000 (AEST)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7AMlEqg005431
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 15:47:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=HfIMDeOU5ZK2lvBMwN1kKrxhea2t0z6csq/Xw/baLxw=;
 b=hKflR5jERBE2PbcwcQk1I+28rfFtNcVV6nqjBrV+KfjsxSBkkY1zCu8dgX8GgL5GjJaJ
 aYL0J8FrPtHwtl6BBTSPwufKQXMwXJg8R/DeNpxmwKeXdRMkdf79RZFx/NLNSBsaHLGe
 a/E+evVQuqtcr7PIK+JR+6Eyssbvb0X7z4Q= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0b-00082601.pphosted.com with ESMTP id 2kshuf8a3j-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 15:47:27 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.16) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Fri, 10 Aug 2018 15:47:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfIMDeOU5ZK2lvBMwN1kKrxhea2t0z6csq/Xw/baLxw=;
 b=XXmxQ8WhYWqTkjjau30gbxrqMTNQC/UA4E3fDY8SnQ4hDYV11V5Vs8YB8Wb4nYZKAh18t4h5MKpXKIhKPvlc5rMqFPQEdBnAmyvmLaF640b2+ayHDzm2krhG4LWlS99/G3+zgpGaCuixvUQeF5WxnyfN0XyctJTLkjLTC6pcX6w=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1759.namprd15.prod.outlook.com (10.174.255.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1038.21; Fri, 10 Aug 2018 22:47:23 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::4d51:6c5a:a74b:984f]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::4d51:6c5a:a74b:984f%8]) with mapi id 15.20.1038.023; Fri, 10 Aug 2018
 22:47:23 +0000
From: Tao Ren <taoren@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
CC: Tao Ren <taoren@fb.com>
Subject: A question about submitting patches
Thread-Topic: A question about submitting patches
Thread-Index: AQHUMPwaN8AL4+Fz8UGcCckJQFOCrw==
Date: Fri, 10 Aug 2018 22:47:22 +0000
Message-ID: <83549CAD-45BE-49E7-AC88-A1AB46597988@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:64ff]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1759;
 20:YcXrL1cuz2raeKeXmFZzu+dqq8BZM4k6lAoDNolyvjfKrsBwP8bhkHTT9tXEcAA9PhNcSsk1ypX+EXSee8HNsW8m71g8+9CnG6EMlw7ldFBkn5YJczmcUx32SwS38gQPImtgeB0PEVBi86vDHlkpyAwBza1qQ1JxkARMrNykyO0=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(57704003)(478600001)(2900100001)(81166006)(9326002)(86362001)(486006)(81156014)(8676002)(6916009)(476003)(36756003)(106356001)(105586002)(99286004)(5660300001)(6116002)(33656002)(256004)(558084003)(83716003)(8936002)(6436002)(5250100002)(14454004)(25786009)(4326008)(82746002)(6512007)(54896002)(46003)(6306002)(6506007)(97736004)(102836004)(186003)(2906002)(316002)(53936002)(68736007)(2616005)(7736002)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1759;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-correlation-id: f5f02fa7-e421-4bf7-f240-08d5ff133cb4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1759; 
x-ms-traffictypediagnostic: MWHPR15MB1759:
x-microsoft-antispam-prvs: <MWHPR15MB1759B82BED0EE5B908727FAAB2240@MWHPR15MB1759.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(21748063052155);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(823301033)(3231311)(11241501184)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(6072148)(201708071742011)(7699016);
 SRVR:MWHPR15MB1759; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1759; 
x-forefront-prvs: 07607ED19A
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 8FQX5wSc7CxAUAKXigc43zIhmGDJlqQcSEwZNixCYJGW38B3iJE1F/fPvibSca4DF5Szw/4IY+cjGB9OyN1a5Ex2S2ZG0w3SmoTaJE/0HXXOtIf3K/H62mY/1PskYk9OEwQF3O+npfEQIiemCeptuXdo0iTnUxg+X/epAilT16OtF6rt41oUQKtNejPjZnTR7yFq0x9uYjzABxpFniwZYvoGo+5LeHlOvkIsa/q9XQdB+Hb2iFBEUrvGoXPuuX27oXW88D6XdjfV8ZoKdWQiqcYV1cO51b+LRdC01gzEEaaIjc6BcGJxEO9YCdG2NXwEaXtSu0KZhWMCXNiEtX/gSyxTSy0b9JbOGll6/QPMOD0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_83549CAD45BE49E7AC88A1AB46597988fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f02fa7-e421-4bf7-f240-08d5ff133cb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2018 22:47:22.9485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1759
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-10_14:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Aug 2018 23:09:35 -0000

--_000_83549CAD45BE49E7AC88A1AB46597988fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCknigJltIHByZXBhcmluZyBhIGZldyBwYXRjaGVzIChhc3BlZWQgZHJpdmVyIGZpeGVz
KSBmb3IgcmV2aWV3LiBJ4oCZdmUgdmVyaWZpZWQgdGhlIHBhdGNoZXMgb24gYXN0MjQwMCBhbmQg
YXN0MjUwMCBwaHlzaWNhbCBoYXJkd2FyZSwgYW5kIGRvIEkgbmVlZCB0byB0ZXN0IHRoZSBwYXRj
aGVzIGFnYWluIG9uIHFlbXUgKHJlcXVpcmVkIGluIOKAnG9wZW5ibWMvbGludXgvd2lraS9TdWJt
aXR0aW5nUGF0Y2hlc+KAnSBwYWdlKSBiZWZvcmUgc2VuZGluZyBvdXQgcmV2aWV3Pw0KDQoNClRo
YW5rcywNCg0KVGFvDQo=

--_000_83549CAD45BE49E7AC88A1AB46597988fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <25624F1DC18EF5498718C592A0BB77AB@namprd15.prod.outlook.com>
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
bGlicmkiLHNhbnMtc2VyaWY7fQ0KcC5tc29ub3JtYWwwLCBsaS5tc29ub3JtYWwwLCBkaXYubXNv
bm9ybWFsMA0KCXttc28tc3R5bGUtbmFtZTptc29ub3JtYWw7DQoJbXNvLW1hcmdpbi10b3AtYWx0
OmF1dG87DQoJbWFyZ2luLXJpZ2h0OjBpbjsNCgltc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0bzsN
CgltYXJnaW4tbGVmdDowaW47DQoJZm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2Fs
aWJyaSIsc2Fucy1zZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUxOQ0KCXttc28tc3R5bGUtdHlwZTpw
ZXJzb25hbDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5k
b3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0K
CWZvbnQtc2l6ZToxMC4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0K
QHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAx
LjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24x
O30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjND
MSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5IaSw8bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPknigJltIHByZXBhcmluZyBhIGZldyBw
YXRjaGVzIChhc3BlZWQgZHJpdmVyIGZpeGVzKSBmb3IgcmV2aWV3LiBJ4oCZdmUgdmVyaWZpZWQg
dGhlIHBhdGNoZXMgb24gYXN0MjQwMCBhbmQgYXN0MjUwMCBwaHlzaWNhbCBoYXJkd2FyZSwgYW5k
IGRvIEkgbmVlZCB0byB0ZXN0IHRoZSBwYXRjaGVzIGFnYWluIG9uIHFlbXUgKHJlcXVpcmVkIGlu
IOKAnG9wZW5ibWMvbGludXgvd2lraS9TdWJtaXR0aW5nUGF0Y2hlc+KAnQ0KIHBhZ2UpIGJlZm9y
ZSBzZW5kaW5nIG91dCByZXZpZXc/PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+VGhhbmtzLDxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+VGFvPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9k
aXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_83549CAD45BE49E7AC88A1AB46597988fbcom_--
