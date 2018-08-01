Return-Path: <prvs=1751e5a6db=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1751e5a6db=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="FsXl90cI"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Tif1Dhrl"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gfsR4YxlzDqDQ
 for <openbmc@lists.ozlabs.org>; Thu,  2 Aug 2018 03:08:38 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w71H7v18003171
 for <openbmc@lists.ozlabs.org>; Wed, 1 Aug 2018 10:08:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=mKuS7vAF2nWf9q/7Ht9IN+CZtqmsr6rjnJPxEbVuJAg=;
 b=FsXl90cIhm88EJE2LsIZlcylP4aajJUagBoer+cfp5M8ch4QMZAs/3I5EIspslLtzrJS
 PEbkZR8ZBu2yyufE1/spFOdjLf8oHdKxqbL3OM0XOXFaSfjS7b4i3gRg7Cw+fNp3u2MG
 kY/XxHzCGhDqv+Ll6hmuRgPHu+yRVmGIicY= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2kkgjvg39k-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Aug 2018 10:08:36 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.23) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Wed, 1 Aug 2018 10:08:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKuS7vAF2nWf9q/7Ht9IN+CZtqmsr6rjnJPxEbVuJAg=;
 b=Tif1DhrlJ5iWpg6YjU6uQNP6acwnp6Uov/v51CwT8SIE9NzDT7nGKNz6RvDfUU8bnwH/U35L8KzEBKa8cAGebKH0iu3lR+pxJ9WVSvDh6sIB+cQ8hUSWFnolkMWgkUt/eXte69ilvd+UrIv6o8oIn14vwi+KizkMsyHgn9lG1Q8=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1184.namprd15.prod.outlook.com (10.175.2.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.995.17; Wed, 1 Aug 2018 17:08:33 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::690b:92ff:d1f3:2da]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::690b:92ff:d1f3:2da%12]) with mapi id 15.20.0995.020; Wed, 1 Aug 2018
 17:08:33 +0000
From: Tao Ren <taoren@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: ast2500 reboot got stuck in timeriomem_rng_probe()
Thread-Topic: ast2500 reboot got stuck in timeriomem_rng_probe()
Thread-Index: AQHUKbpHnzGuT9ti0kGkvwXW4hGNOQ==
Date: Wed, 1 Aug 2018 17:08:33 +0000
Message-ID: <C04B2AA7-9D6E-4D23-AB86-E793E0A676BA@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:c6f6]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1184;
 20:y6ROC03k1Sq7wHCjjPN9PrKdmYst4X8Z0i8KU5lPlTbBlQsqHtb/zqnTMNa+rF3pvxiFscXSaujycLk9+wcHhpa4dYzR+qYea3kSAmE041OH7jSr+Oxdf5TpyazNCBhj6aUc4qPB94v7JjC9dfURKD0AqjABAr4RmYpfglv+cc0=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 9e8b7dc4-c0da-4ee4-2818-08d5f7d169ba
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1184; 
x-ms-traffictypediagnostic: MWHPR15MB1184:
x-microsoft-antispam-prvs: <MWHPR15MB1184AD09443D313C849F5F67B22D0@MWHPR15MB1184.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(81227570615382)(21748063052155); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231311)(11241501184)(944501410)(52105095)(93006095)(93001095)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
 SRVR:MWHPR15MB1184; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1184; 
x-forefront-prvs: 0751474A44
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(136003)(396003)(346002)(376002)(189003)(199004)(478600001)(105586002)(53936002)(5250100002)(5660300001)(2900100001)(83716003)(106356001)(9326002)(6486002)(256004)(86362001)(25786009)(14444005)(6116002)(97736004)(186003)(82746002)(486006)(33656002)(6506007)(102836004)(6916009)(99286004)(8676002)(476003)(2616005)(7736002)(316002)(14454004)(81166006)(81156014)(2906002)(6436002)(54896002)(46003)(36756003)(6512007)(68736007)(8936002)(558084003)(6306002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1184;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: BPdLd3VD87XaUNEbf6PVGqH7oP81QdgNGr3fj6uBka7dZjJIZbXEgytZ9ACkzJzQ/9Z88IaPyZe+i26HgcfLmSG6YDBgU7Du17UAk7Jd8F/dkd505BWqz63RQkTBGHmoN1pwAa2Tgs3PBcOnbWBTbd1bjkwSxWJ0j+4Umz1PM7SRg8WAWuvLDRm8H4vvRBEEHwXPDjWC42yGuWSXYSK/UB3Gtyqf729JU5PKP211W5qYI9iDFP2MW+dWiygySriWwsNNBURYWA06t9jWgMWcY3Gv+Yatjrljs0VqvBePU8s3z35rGMNO8JSLDpb4ovBK3MRh/v6SE0UStRASUGDQ/SdUKcpwRlG5jmnfqBccHhQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_C04B2AA79D6E4D23AB86E793E0A676BAfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8b7dc4-c0da-4ee4-2818-08d5f7d169ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2018 17:08:33.5034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1184
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-01_06:, , signatures=0
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
X-List-Received-Date: Wed, 01 Aug 2018 17:08:45 -0000

--_000_C04B2AA79D6E4D23AB86E793E0A676BAfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCknigJltIHVwZ3JhZGluZyBmYWNlYm9vayBjbW0tYm1jIChhc3QyNTAwKSBmcm9tIDQu
MSB0byBvcGVuYm1jIGxpbnV4IDQuMTcuMiwgYW5kIHdoZW4gSSB0cmllZCB0byByZWJvb3QgbGlu
dXggNC4xNywgc3lzdGVtIGdvdCBzdHVjayBpbiAgdGltZXJpb21lbV9ybmdfcHJvYmUoKSBmdW5j
dGlvbiBkdXJpbmcgYm9vdCB1cC4gRGlkIGFueW9uZSBoaXQgdGhlIHNpbWlsYXIgaXNzdWUgYmVm
b3JlPyBXaGF0IHdvdWxkIGJlIHRoZSByZWNvbW1lbmRlZCBzb2x1dGlvbj8NCg0KDQpUaGFua3Ms
DQoNClRhbw0K

--_000_C04B2AA79D6E4D23AB86E793E0A676BAfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <C030EEB9A40B1E4C8C40E1D5C797C7C7@namprd15.prod.outlook.com>
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
b0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7fQ0KQHBhZ2UgV29yZFNl
Y3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAx
LjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5
bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5
NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5IaSw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86
cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPknigJltIHVwZ3JhZGluZyBmYWNlYm9vayBjbW0tYm1jIChh
c3QyNTAwKSBmcm9tIDQuMSB0byBvcGVuYm1jIGxpbnV4IDQuMTcuMiwgYW5kIHdoZW4gSSB0cmll
ZCB0byByZWJvb3QgbGludXggNC4xNywgc3lzdGVtIGdvdCBzdHVjayBpbiAmbmJzcDt0aW1lcmlv
bWVtX3JuZ19wcm9iZSgpIGZ1bmN0aW9uIGR1cmluZyBib290IHVwLiBEaWQgYW55b25lIGhpdCB0
aGUgc2ltaWxhcg0KIGlzc3VlIGJlZm9yZT8gV2hhdCB3b3VsZCBiZSB0aGUgcmVjb21tZW5kZWQg
c29sdXRpb24/PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpw
PiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+VGhhbmtzLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNw
OzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+VGFvPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+
DQo8L2h0bWw+DQo=

--_000_C04B2AA79D6E4D23AB86E793E0A676BAfbcom_--
