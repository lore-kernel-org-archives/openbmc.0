Return-Path: <prvs=69119f982c=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=69119f982c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="clhdoqGu"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="JlMKj7CQ"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YYHj17B8zDqCc
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 11:37:16 +1100 (AEDT)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x080TE1S010208
 for <openbmc@lists.ozlabs.org>; Mon, 7 Jan 2019 16:37:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=fRdxPyAgOtBpSaSx1XrAup4COfA33p62BI5u7wu65LA=;
 b=clhdoqGufZo12OhYZ28OPJ2TKeRHCMnUH16B1rSbqpRsQhO7FLXROYTNXaUdEECvd1bx
 ujZE72EHX7yn6xe89qn6wVvyOYAR8aMESWINtx6KRerm44Y1asPzvSAqIJkeOkB5VbBP
 vJ8JiDxlw8oZ8HNEE4fR1h5CR1pFdV7cxlw= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2pvf660cu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 Jan 2019 16:37:14 -0800
Received: from frc-mbx07.TheFacebook.com (2620:10d:c0a1:f82::31) by
 frc-hub05.TheFacebook.com (2620:10d:c021:18::175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 7 Jan 2019 16:37:12 -0800
Received: from frc-hub02.TheFacebook.com (2620:10d:c021:18::172) by
 frc-mbx07.TheFacebook.com (2620:10d:c0a1:f82::31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 7 Jan 2019 16:37:12 -0800
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.72) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Mon, 7 Jan 2019 16:37:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRdxPyAgOtBpSaSx1XrAup4COfA33p62BI5u7wu65LA=;
 b=JlMKj7CQYHDYaIZU5ag8J9pC7MjHOC+BI+NzxjYrq3ImpbuDoCa6kxn7kFoNMDFX+ikMtfRxmnyG/0REhJKPAdBbSgjs+wGJKKpGIcnOTH1nB9w65baHdmbScxn7ok9LoPeq9Sd5DJ8LtT9E8bDJLPCbLTCGWyGGv258CyWEuoQ=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1880.namprd15.prod.outlook.com (10.174.54.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.7; Tue, 8 Jan 2019 00:37:11 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::f9c6:952c:8b66:cc9d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::f9c6:952c:8b66:cc9d%10]) with mapi id 15.20.1495.011; Tue, 8 Jan 2019
 00:37:11 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Subject: Kernel config
Thread-Topic: Kernel config
Thread-Index: AQHUpupLFvVEKY90jEezonkC9+DcnA==
Date: Tue, 8 Jan 2019 00:37:11 +0000
Message-ID: <8B0F0C96-17A3-4649-9CCA-475E5E75685E@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:23a]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1880;
 20:f9dB4R0OMg6wfXbMvxUzBCKNRt3tlk7SAZaLI9dBkNjoMk602pel0sNhDiTHQCULMuyRpBChg04usOVFbwhLom3xsglnD+d/T9nqRb2nODXLMYnZMlOxlb3BR9n+brzl8s0fnCXNIywmEV3jGD2CfdoKmKjo0nmxbSYJMLRyR44=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 020825aa-5e5a-4e01-47cb-08d675016dd8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1880; 
x-ms-traffictypediagnostic: CY4PR15MB1880:
x-microsoft-antispam-prvs: <CY4PR15MB18808600F0F0186A840EFD32DD8A0@CY4PR15MB1880.namprd15.prod.outlook.com>
x-forefront-prvs: 0911D5CE78
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(136003)(346002)(39860400002)(366004)(199004)(189003)(558084003)(14454004)(36756003)(33656002)(97736004)(3480700005)(46003)(486006)(68736007)(82746002)(256004)(53936002)(6306002)(476003)(478600001)(2616005)(221733001)(5660300001)(316002)(7116003)(8936002)(83716004)(105586002)(6436002)(25786009)(6486002)(54896002)(6512007)(186003)(106356001)(99286004)(81166006)(7736002)(81156014)(6116002)(8676002)(86362001)(6916009)(9326002)(71190400001)(102836004)(6506007)(2906002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1880;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WmP8CIeE+w4cFPR4H4NEzwn8LnR/Qqi1gh6ViM2c/qfSjpv9SJ7OR5xVvea9BWfan12wK3XWJErzP30C3U+uvwb9bVQ6dcvttBhUjKXg4W+rnO3N8OgoVJ6OhbWwsr17CrXTf2LFyQ4MUcMpLRyA84Gl8H/XgZzbUnyhGXf1W47dk4jUjoix8XpqRPCYkLb3+GI/HMHe343pD6klStdAr1agHBJ1h7/wT1gsRpUpx7m3xFqXuJDT0+Im+ZF/IK7YD6lrMRkTPVge45JqrTBXibFm5GdQ1YW/VLAPLxCGm6U0owHTCnrN0W3SVMI5biRh
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_8B0F0C9617A346499CCA475E5E75685Efbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 020825aa-5e5a-4e01-47cb-08d675016dd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2019 00:37:11.7051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1880
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-07_10:, , signatures=0
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
X-List-Received-Date: Tue, 08 Jan 2019 00:37:22 -0000

--_000_8B0F0C9617A346499CCA475E5E75685Efbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQpJIG5lZWQgdG8gYWRkIGV4dHJhIGtlcm5lbCBjb25maWcgZm9yIG91ciB0aW9nYXBhc3Mg
cGxhdGZvcm0gYW5kIEkgYWRkZWQgZXh0cmEgY29uZmlndXJhdGlvbiBpbiB0aW9nYXBhc3MuY2Zn
IGZpbGUgdW5kZXIgY29uZi9tYWNoaW5lLiBJIGFtIG5vdCBzZWVpbmcgdGhlc2UgZ2V0dGluZyBh
ZGRlZCB0byBrZXJuZWwgY29uZmlnIGZpbGUuIFBsZWFzZSBzdWdnZXN0IHJpZ2h0IHBsYWNlIHRv
IGFkZCBvdXIgcGxhdGZvcm0gc3BlY2lmaWMgZXh0cmEga2VybmVsIGNvbmZpZyBvcHRpb25zLg0K
DQpSZWdhcmRzDQotVmlqYXkNCg==

--_000_8B0F0C9617A346499CCA475E5E75685Efbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <B3AFA4D79CADD046950C213702CD1E82@namprd15.prod.outlook.com>
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
emU6MTEuMHB0Ij5IaSw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SSBuZWVkIHRvIGFkZCBleHRyYSBrZXJu
ZWwgY29uZmlnIGZvciBvdXIgdGlvZ2FwYXNzIHBsYXRmb3JtIGFuZCBJIGFkZGVkIGV4dHJhIGNv
bmZpZ3VyYXRpb24gaW4gdGlvZ2FwYXNzLmNmZyBmaWxlIHVuZGVyIGNvbmYvbWFjaGluZS4gSSBh
bSBub3Qgc2VlaW5nIHRoZXNlIGdldHRpbmcgYWRkZWQgdG8ga2VybmVsIGNvbmZpZyBmaWxlLiBQ
bGVhc2Ugc3VnZ2VzdA0KIHJpZ2h0IHBsYWNlIHRvIGFkZCBvdXIgcGxhdGZvcm0gc3BlY2lmaWMg
ZXh0cmEga2VybmVsIGNvbmZpZyBvcHRpb25zLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNw
OzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+UmVnYXJkczxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4tVmlqYXk8bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_8B0F0C9617A346499CCA475E5E75685Efbcom_--
