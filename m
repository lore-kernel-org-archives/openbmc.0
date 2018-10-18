Return-Path: <prvs=38292b93ae=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=38292b93ae=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="jBds5GXP"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="a+i7pPYt"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42bD3720phzF3Sr
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 13:46:54 +1100 (AEDT)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9I2cgXQ006190; Wed, 17 Oct 2018 19:46:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=4F9NqnCM1HzJFDSRLXco7V5pEcWqn68HlXbKBlzAJb0=;
 b=jBds5GXP4Mad3VW2MTN1dydgMt7IHyyPzxqBlbyKkVVYxb5pMy3Nmst2iX4qfwFYWHDP
 UhswbDV6tWSepzlIpcw4/DcXVxnZMhqRGJ6srFiReH3W1Nf8DnkFNg2VcAUzfH2UsF9X
 Je7NTCx6tIxB6QwPpor4wQ9HZB5GuWT7N1U= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2n6ge5g84a-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 17 Oct 2018 19:46:49 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 17 Oct 2018 19:46:26 -0700
Received: from PRN-CHUB13.TheFacebook.com (2620:10d:c081:35::22) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Wed, 17 Oct 2018 19:46:26 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.23) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Wed, 17 Oct 2018 19:46:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4F9NqnCM1HzJFDSRLXco7V5pEcWqn68HlXbKBlzAJb0=;
 b=a+i7pPYtBMzq0Prgnt/remE74BDywL1UEnFrQn5ol1yv2bchMDGD065ykzkZRUucxr9HhJE9SnmziDuRYY0PZFJRpTGRtPaoOi6GpFY1WNd7NyEhmIz//yhhrWDY4GuzsrWpxgSHENTCERV75ErX8TBRxfcwIn3Cvf0gvKgiIh4=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1501.namprd15.prod.outlook.com (10.173.235.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1250.20; Thu, 18 Oct 2018 02:46:25 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::2937:a3e7:96c0:6dd6]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::2937:a3e7:96c0:6dd6%10]) with mapi id 15.20.1228.027; Thu, 18 Oct
 2018 02:46:25 +0000
From: Sai Dasari <sdasari@fb.com>
To: Feng Xie <Feng_Xie2@jabil.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Is Raspberry Pi a supported platform for OpenBMC?
Thread-Topic: Is Raspberry Pi a supported platform for OpenBMC?
Thread-Index: AdRmUzMN6LgZrwdUSr2/JRtSl6yNbP///cUA
Date: Thu, 18 Oct 2018 02:46:25 +0000
Message-ID: <4B30C52B-D7FB-4997-B15F-7E206BEDCF1F@fb.com>
References: <BN7PR02MB5300381E6B487BF91CA6309DCAFF0@BN7PR02MB5300.namprd02.prod.outlook.com>
In-Reply-To: <BN7PR02MB5300381E6B487BF91CA6309DCAFF0@BN7PR02MB5300.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [24.49.181.114]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1501;
 20:TvULFPlcbA1J0jcSrsTbEEIDH03YWrL8sCPnfgzVhnpAiIjeTJULC7QD/WrtEZpGyJ28iPDi6qxr/29x53RR05yA3xz8IYnY/xh/fLshAUrnieR8514CpueRpfQmZx3eA8JryO6s+Zx4ZjKbFFrPAxra8ub6QAkOfmD+MpH/F4c=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: abb973b0-b19f-49c1-d831-08d634a3e55c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1501; 
x-ms-traffictypediagnostic: MWHPR15MB1501:
x-microsoft-antispam-prvs: <MWHPR15MB1501A90AB2511EE13C8F7899CEF80@MWHPR15MB1501.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(65623756079841)(21534305686606);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(11241501184)(944501410)(52105095)(10201501046)(93006095)(93001095)(149066)(150057)(6041310)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1501; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1501; 
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(376002)(346002)(396003)(39860400002)(199004)(189003)(26005)(2906002)(110136005)(102836004)(186003)(86362001)(8936002)(81156014)(81166006)(966005)(14454004)(68736007)(8676002)(106356001)(105586002)(6246003)(6512007)(478600001)(6486002)(6436002)(6306002)(229853002)(83716004)(7736002)(97736004)(71190400001)(305945005)(71200400001)(25786009)(53936002)(36756003)(5660300001)(2900100001)(6116002)(33656002)(3846002)(66066001)(99286004)(446003)(2616005)(5250100002)(6506007)(82746002)(316002)(476003)(486006)(256004)(11346002)(14444005)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1501;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: LNObc+HxHlWAuK/ysvmlc+rGu5XGlSED2egVsjT+iaOIW897m1qJg64CvwQnuD2B4pqE3SJwxmUDEfSqUs5/i8D4yFOCP0WYj9Jzevyea3TnjQ8WrGQv9iFPw5Kk5uZ6PaX5+dJq5W3PAjlnSnsI9RxlBzfDFt7JnV1dSiRLKoQH9V0cN6YkX8H+GJBIG891l85PLlV1FRinGwnKph1nbMQ9JYtHJ1M77SVCKUcZJv2QhvdefZEtmD7eX14N08EeLV6sFpUlmlakYWeAojCpn8bCr9OijV5GyUnCR5o6yh8cYOpKXmykLadGNv1thKpJhcZEAEgB/BDmNZJBoxf5R8cnB/HQ5Bs9xnw+d9DVnT0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9AAF2A760741D4CBB302A95EF5C492D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: abb973b0-b19f-49c1-d831-08d634a3e55c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 02:46:25.1093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1501
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-17_15:, , signatures=0
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
X-List-Received-Date: Thu, 18 Oct 2018 02:47:00 -0000

DQoNCu+7v09uIDEwLzE3LzE4LCAxMjo1NSBQTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEZlbmcg
WGllIiA8b3BlbmJtYy1ib3VuY2VzK3NkYXNhcmk9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24g
YmVoYWxmIG9mIEZlbmdfWGllMkBqYWJpbC5jb20+IHdyb3RlOg0KDQogICAgSGksDQogICAgDQog
ICAgICAgICAgSSBmb3VuZCBhIHRocmVhZCBvZiBkaXNjdXNzaW9uIG9uIHN1cHBvcnRpbmcgUmFz
cGJlcnJ5IFBpIGFzIGEgZGV2ZWxvcG1lbnQgcGxhdGZvcm0gZm9yIE9wZW5CTUMgaW4gdGhlIGVt
YWlsIGFyY2hpdmUuIElzIHRoaXMgYXZhaWxhYmxlPyBUaGFua3MuDQpodHRwczovL2xpc3RzLm96
bGFicy5vcmcvcGlwZXJtYWlsL29wZW5ibWMvMjAxNy1TZXB0ZW1iZXIvMDA5Mjc2Lmh0bWwgbWln
aHQgYmUgdGhlIHRocmVhZCB0aGF0IHlvdSBhcmUgbG9va2luZyB0aGF0IGNhcHR1cmVzIHRoZSBl
ZmZvcnQgb2YgYSBjb21tdW5pdHkgbWVtYmVyIHRyeWluZyB0byB1c2UgUmFzcGJlcnJ5IFBpIGFz
IGhhcmR3YXJlIGZvciBPcGVuQk1DLiBJIGFtIGN1cmlvdXMgYWJvdXQgeW91ciBtb3RpdmF0aW9u
IHRvIHVzZSB0aGlzIGRldmljZSBmb3IgT3BlbkJNQyBhcyBpdCBpcyBubyB3aGVyZSBjbG9zZSB0
byBhbnkgb2YgdGhlIHN0YW5kYXJkIEJNQy4gV291bGQgeW91IGNhcmUgdG8gZXhwbGFpbiB3aGF0
IHlvdSBhcmUgdHJ5aW5nIHRvIGFjY29tcGxpc2ggdG8gYmV0dGVyIGhlbHAgeW91Pw0KIA0KICAg
IA0KICAgIEZlbmcgIA0KICAgIA0KDQo=
