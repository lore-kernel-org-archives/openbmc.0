Return-Path: <prvs=38210a87dd=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=38210a87dd=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="kMAXYP9i"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="GZdx/1YB"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VmWc13YxzF13x
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 07:52:39 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9AKh9Dx002676; Wed, 10 Oct 2018 13:52:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=WyHvaySaBA3K8vwDiUOeiQqH1kAloP/Beo5NBgjVNMY=;
 b=kMAXYP9iOHiw/guyjL6o7X1iL+sqLhcVgCaZ5XxY6Q1HU7qbltlorOF2H0ner8VZ+5oy
 KV81f1wtWVdLgogdJ937bnGAf8jlexhyyf9JYtf52gs6EhWcMUsfWTudCsMvJVQYyp79
 RaZLx8hM3CG9Vd8oL22YRxzWBOWQdpJ7RxE= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2n1ny50r7r-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 10 Oct 2018 13:52:34 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.15) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Wed, 10 Oct 2018 13:52:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyHvaySaBA3K8vwDiUOeiQqH1kAloP/Beo5NBgjVNMY=;
 b=GZdx/1YBNJbGvjPw6E30UV+uoLM4DMmL+Q6AhSjuvdwFnFAYZzAp1HLynrt78BG+PBlS7Ak3KqsLve22GRvgut5gn22hh3TF2ip/kEVqkmNmDiKfwCgiWdhip17v/sp5MNf36WOaLY78/FqLa+m+6BhfHLn+Y/8YXgDciTbX9iM=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1566.namprd15.prod.outlook.com (10.173.235.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1207.26; Wed, 10 Oct 2018 20:52:31 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::2937:a3e7:96c0:6dd6]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::2937:a3e7:96c0:6dd6%10]) with mapi id 15.20.1207.029; Wed, 10 Oct
 2018 20:52:31 +0000
From: Sai Dasari <sdasari@fb.com>
To: Feng Xie <Feng_Xie2@jabil.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Off-the-shelf platforms for OpenBMC
Thread-Topic: Off-the-shelf platforms for OpenBMC
Thread-Index: AdRg0ObE3zsdoTvLQp6nMG7+o8hlVv//nysA
Date: Wed, 10 Oct 2018 20:52:31 +0000
Message-ID: <46997EA1-1B92-420C-9397-6E6D005C8E06@fb.com>
References: <BN7PR02MB5300DFB69593AA2DFACE8CBFCAE00@BN7PR02MB5300.namprd02.prod.outlook.com>
In-Reply-To: <BN7PR02MB5300DFB69593AA2DFACE8CBFCAE00@BN7PR02MB5300.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.55.66.74]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1566;
 20:mAmqqYIguBaNhO3tOUTu+3jamndnTJFxfI4KDobaTV1C02G21QlHrpM14p0wuwkFTe+1hZV6+c+HmfUK5V05J60awt7vcr6PiwRabu4aSs0NNS0j9tIcRQKRbj3+C7b/UPsq3D9YhogawEF1Xtx5tl6V4R7OLcX9s45Y8IIfwME=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 57549075-8cda-4b7f-0187-08d62ef24c50
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1566; 
x-ms-traffictypediagnostic: MWHPR15MB1566:
x-microsoft-antispam-prvs: <MWHPR15MB156617E846DB3FDF28ECD74FCEE00@MWHPR15MB1566.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(11241501184)(944501410)(4982022)(52105095)(3002001)(10201501046)(93006095)(93001095)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699051);
 SRVR:MWHPR15MB1566; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1566; 
x-forefront-prvs: 08213D42D3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(39860400002)(366004)(136003)(396003)(376002)(346002)(51874003)(189003)(199004)(81156014)(82746002)(6116002)(105586002)(3846002)(26005)(68736007)(316002)(25786009)(71190400001)(71200400001)(53376002)(6246003)(476003)(11346002)(2616005)(102836004)(186003)(2906002)(83716004)(478600001)(16799955002)(97736004)(33656002)(5250100002)(106356001)(486006)(99286004)(446003)(53936002)(5660300001)(305945005)(66066001)(36756003)(110136005)(256004)(6506007)(6436002)(7736002)(76176011)(2900100001)(6512007)(229853002)(86362001)(81166006)(14454004)(966005)(6306002)(8936002)(6486002)(8676002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1566;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: vZvpFE04oFfEJEMnAliijHS5U1aL6tMVhdRj64XcIIHHMpwTnbgt36r3VkpW/qfw9n07x6RvzjuQ+2QWx8Hs7XfFb4J0ciKlSmtEr3Swh61jloJELNUHV/y8ONxpiju14QmsXXeLpPI7DjDFzxMZrv2tpUQ1c5I1aXk7bWs9lAMmKeEJfivkHUoxFkV8rDxQhf551zCyTmCUAaJvUesEVHjBqZ4TQcF7i2T/zRw8lIC0j8pOnnb9Mdic/a7Y8p3TmUHGXiIyCmcz1gk0S9jDQ00kiVsrJnc2ThlsCGdHS0BXcZtPFmRTGvTEKbpl+YgKj7dUiWlxh0dSdgxeghyo79+6xfPYjVqO11TVAeoQjo4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <999689D8F802584DABC0816DCABB6303@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 57549075-8cda-4b7f-0187-08d62ef24c50
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2018 20:52:31.5327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1566
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-10_12:, , signatures=0
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
X-List-Received-Date: Wed, 10 Oct 2018 20:52:45 -0000

ICAgIA0KICAgICAgICAgIEkgYW0gbmV3IHRvIE9wZW5CTUMuIEkgd2FudCB0byB0cnkgT3BlbkJN
QyBvbiBzb21lIG9mZi10aGUtc2hlbGYgaGFyZHdhcmUgcGxhdGZvcm1zLiBDYW4gYW55Ym9keSBy
ZWNvbW1lbmQgc29tZSBwcm9kdWN0cyAod2l0aCBkZXZlbG9wbWVudCB0b29sa2l0cyk/IFRoYW5r
cyBpbiBhZHZhbmNlIQ0KV2VsY29tZSBGZW5nIHRvIE9wZW5CTUMgY29tbXVuaXR5ISANCg0KSSB3
b3VsZCBzdGFydCB0cnlpbmcgdG8gZ2V0IGFuIGV2YWx1YXRpb24ga2l0IGJ5IGNvbnRhY3Rpbmcg
Qk1DIFNvQyBWZW5kb3IgZS5nLiBodHRwczovL3d3dy5hc3BlZWR0ZWNoLmNvbS9wcm9kdWN0cy5w
aHA/ZlBhdGg9MjAmcklkPTQ0MA0KSWYgeW91IHBsYW4gdG8gd29yayBvbiBob3N0IChCSU9TL1VF
RkkpPC0+Qk1DIGludGVyYWN0aW9ucywgcmVjb21tZW5kIGFub3RoZXIgb2ZmLXRoZS1zaGVsZiBw
cm9kdWN0IHRoYXQgaGFzIENPTWUgY29ubmVjdG9yIHRvIHBsdWctaW4gaG9zdCBwcm9jZXNzb3Ig
ZS5nLiBAIGh0dHA6Ly9wb3J0d2VsbC5jb20vc29sdXRpb25zL3BkZi9Qb3J0d2VsbC1OZXB0dW5l
LUFscGhhLU9wZW5CTUMtRGV2ZWxvcG1lbnQtS2l0LnBkZg0KICAgICANCg0K
