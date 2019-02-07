Return-Path: <prvs=79415a6f15=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=79415a6f15=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Wgxul64i"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="OqJcBD1O"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43wRwH3DHszDqRm
 for <openbmc@lists.ozlabs.org>; Fri,  8 Feb 2019 05:41:02 +1100 (AEDT)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x17Id1BL009818; Thu, 7 Feb 2019 10:40:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=CpDhXXUP2L4T4NyjAuavgpAoxkrKBJSjeGjDL0+0YZg=;
 b=Wgxul64iSBEx1z2i5ShTDRWIEqKNm6P1XHPMhMlBSdSml0mxqf7IralmJXio1uWYzNAr
 38uW6hWVJwuf6BSabKag0POd07V/GqBGyDv21Jm2TLm2/pZ5s5glct/eaX4H3rO25c0f
 c8h8uzYmpqtP4gKstUhcx4ZWBU1TSpZcmWs= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2qgsrb04tp-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 07 Feb 2019 10:40:58 -0800
Received: from prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 7 Feb 2019 10:40:43 -0800
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 7 Feb 2019 10:40:42 -0800
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Thu, 7 Feb 2019 10:40:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpDhXXUP2L4T4NyjAuavgpAoxkrKBJSjeGjDL0+0YZg=;
 b=OqJcBD1OJJj430N6fRZCmke3N1BAO634TP85/7mC/LI3AyDcDC3rn0YyDhY7INmalBkH8mr4NnTsQpNg0nqcBbT9QUuwrAqO+dF4nCWpDOdN0tG2I3hn21khy+yL17Em2nAay0D2udnNWm9cigS0oks1JrMQcRFOjIPXaf0ePUY=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1624.namprd15.prod.outlook.com (10.175.119.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.22; Thu, 7 Feb 2019 18:40:42 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b9cb:6dd8:d8bf:45c6]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b9cb:6dd8:d8bf:45c6%2]) with mapi id 15.20.1601.016; Thu, 7 Feb 2019
 18:40:41 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: New repo request
Thread-Topic: New repo request
Thread-Index: AQHUvxSgVukF5Z54JEuv/QBD0vcAng==
Date: Thu, 7 Feb 2019 18:40:41 +0000
Message-ID: <AA5BE1BA-F0FE-452E-B935-989AE8C14AC0@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:6aca]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1624;
 20:ab513joFYuN1x6V+gpN76PAn7eWfPeAzd5xxAX+6zfphHw7dCeZTSdcr9oaJwJsqt8OWONg1aYbBgz0xsbTBMPUDDi+pwC4Verc0KStJjLjBl4RBvAOtFUNzIWavaYMpezE6Mdj5AsgY7Ob2puvr0rJVoUCFjwE2Sru9c/KcbCo=
x-ms-office365-filtering-correlation-id: dd20fa57-d0f4-4dce-20c9-08d68d2bc356
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1624; 
x-ms-traffictypediagnostic: CY4PR15MB1624:
x-microsoft-antispam-prvs: <CY4PR15MB16241C0BC9B94E2B0F0DD841DD680@CY4PR15MB1624.namprd15.prod.outlook.com>
x-forefront-prvs: 0941B96580
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(39860400002)(366004)(346002)(376002)(199004)(189003)(25786009)(2616005)(46003)(83716004)(71190400001)(486006)(71200400001)(102836004)(186003)(6506007)(476003)(6116002)(53936002)(97736004)(316002)(82746002)(256004)(99286004)(110136005)(6436002)(6486002)(6306002)(54896002)(6512007)(7116003)(105586002)(106356001)(3480700005)(9326002)(68736007)(8936002)(81156014)(8676002)(81166006)(7736002)(558084003)(36756003)(2501003)(478600001)(86362001)(2906002)(14454004)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1624;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AJLQoUXCosHVcOnFE/3R4TZljZ+1Viiy+C49sZMnFiB7ISQ6o3plGV2PhBSbPRhcFToiAFCxOZXXHqLZlkV6wdIZ4/evZ2dAlt6fCOm/3hYvMf25FOCfFj+PkScsD7kjJEmfaS+6sdHNBWNCjjW0EL4XYRY5eRmvn97KK+w9Q7oJJmkRzeps8TGJlh9hmXcIC9nxXtVYl2gSrSvLPzqmElTvfK3/8BZOxX+YUAoxx1rbkSXVyue1HVGJUylL/P264LOISKPr8gNVJzET6Lsl91hdvWu1KlHmO9YyeGRJA6fc6Yc+2h9i8+Zch88/mi4UuH8l1cRhflHVSI1O7HrIWWwROcNxwTGo350swEOU9+JtBjDVArIqRXlLzBcOvvpBBu0T38TynvDd1m1SEmRwsIa94gMoSksi5EvjLJSNzqU=
Content-Type: multipart/alternative;
 boundary="_000_AA5BE1BAF0FE452EB935989AE8C14AC0fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dd20fa57-d0f4-4dce-20c9-08d68d2bc356
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2019 18:40:41.9325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1624
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-07_12:, , signatures=0
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
X-List-Received-Date: Thu, 07 Feb 2019 18:41:04 -0000

--_000_AA5BE1BAF0FE452EB935989AE8C14AC0fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJhZCwNCldlIG5lZWQgYSBuZXcgcmVwbyBmYi1pcG1pLW9lbSBmb3IgZmFjZWJvb2sgb2Vt
IElQTUkgbWVzc2FnZSBoYW5kbGluZy4gUGxlYXNlIGxldCBtZSBrbm93IHdoYXQgYXJlIGJhc2lj
IHN0ZXBzIEkgbmVlZCB0byBmb2xsb3cuDQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_AA5BE1BAF0FE452EB935989AE8C14AC0fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <A0176148558CB64FBEAFB5B4E29600DE@namprd15.prod.outlook.com>
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
emU6MTEuMHB0Ij5IaSBCcmFkLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5XZSBuZWVkIGEgbmV3IHJlcG8g
ZmItaXBtaS1vZW0gZm9yIGZhY2Vib29rIG9lbSBJUE1JIG1lc3NhZ2UgaGFuZGxpbmcuIFBsZWFz
ZSBsZXQgbWUga25vdyB3aGF0IGFyZSBiYXNpYyBzdGVwcyBJIG5lZWQgdG8gZm9sbG93LjxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+UmVnYXJkczxvOnA+PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0Ij4tVmlqYXk8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwv
aHRtbD4NCg==

--_000_AA5BE1BAF0FE452EB935989AE8C14AC0fbcom_--
