Return-Path: <prvs=79415a6f15=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=79415a6f15=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="AdW6776d"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="fD3IoYYF"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43wTRc6CrvzDqT6
 for <openbmc@lists.ozlabs.org>; Fri,  8 Feb 2019 06:49:48 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x17IYpNn000608; Thu, 7 Feb 2019 10:39:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=sZkD2YD0osaWFfQwQ5Tkq7pCmLWRkdEkiml3ld7HfSo=;
 b=AdW6776dRf3+SNEfn36YIyipVwLPLWVLIyh1Y8PFZDGv6K52JC3uAOjMxp9xgN414XD+
 xWJeotOCCY5ulsRQtWuPMqcOxbMOJNuKgsuC618VkxuYzJ1XtABjnuu/idrsLMMTx5Uu
 R1ni7kW53X6KZtVXMMrzHzMRKkXC6Z7L2H4= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2qgq250ry9-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 07 Feb 2019 10:39:08 -0800
Received: from frc-mbx08.TheFacebook.com (192.168.155.29) by
 frc-hub04.TheFacebook.com (192.168.177.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 7 Feb 2019 10:39:04 -0800
Received: from frc-hub06.TheFacebook.com (192.168.177.76) by
 frc-mbx08.TheFacebook.com (192.168.155.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 7 Feb 2019 10:39:04 -0800
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.76) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Thu, 7 Feb 2019 10:39:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZkD2YD0osaWFfQwQ5Tkq7pCmLWRkdEkiml3ld7HfSo=;
 b=fD3IoYYF3nUJR14PYFNe2ptDiMdKJeF6aW8qR7rO6NnGyxalt0MRgmDZXsropuVGkNb/jYvSKlzK3qH9fUQuJ4clu3lO1Wh4IEHcRluw/9dygUQ2eWAHYYxW6GNV5s57D3PFOBi2tBGIlhuYcGkg6JpfX/6DivDhsFYcHXEt68w=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1638.namprd15.prod.outlook.com (10.175.119.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.21; Thu, 7 Feb 2019 18:39:03 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b9cb:6dd8:d8bf:45c6]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b9cb:6dd8:d8bf:45c6%2]) with mapi id 15.20.1601.016; Thu, 7 Feb 2019
 18:39:03 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Secure boot for BMC
Thread-Topic: Secure boot for BMC
Thread-Index: AQHUvV0egqi1JrDJTkS1VzOaYOzgAKXTl/KAgACQAgA=
Date: Thu, 7 Feb 2019 18:39:02 +0000
Message-ID: <C0295A35-A9DD-46A7-B4FD-9EA24412A56D@fb.com>
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
 <bbd6db33f3c9447a9c3b37dee4589768@TWMBX02.aspeed.com>
In-Reply-To: <bbd6db33f3c9447a9c3b37dee4589768@TWMBX02.aspeed.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:6aca]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1638;
 20:oycn2j/L5pwX8+VI69a2tZGKvlo412vLsDi3jmvfVRFgHBOMdGHWvthv9G+veyv5znTz2J4ez7BlVaBSOU+Ha0nnCHgEZQWiIygSiOf3qNOz4ey6NAC+GcW1cNWbl9Z864AuUolUa1dyf/uvmxbsRJGQmJ9zXEA0X/SfiseqrSs=
x-ms-office365-filtering-correlation-id: fac26712-8e14-4b7b-d65c-08d68d2b8859
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1638; 
x-ms-traffictypediagnostic: CY4PR15MB1638:
x-microsoft-antispam-prvs: <CY4PR15MB16382B65041A60A75EB77632DD680@CY4PR15MB1638.namprd15.prod.outlook.com>
x-forefront-prvs: 0941B96580
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(376002)(346002)(366004)(136003)(53754006)(189003)(199004)(13464003)(2906002)(97736004)(110136005)(14454004)(99286004)(6246003)(53546011)(81156014)(81166006)(86362001)(83716004)(71190400001)(71200400001)(4744005)(316002)(6506007)(3480700005)(8676002)(68736007)(76176011)(102836004)(6512007)(8936002)(305945005)(186003)(476003)(25786009)(7736002)(446003)(33656002)(6116002)(36756003)(2501003)(105586002)(53936002)(11346002)(229853002)(2616005)(6436002)(6486002)(46003)(486006)(106356001)(256004)(478600001)(82746002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1638;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hN1yLUALzyNQmKJdXP041N94AQs+efJeto7OiWD5md/sLItJTJ2+gTa7bPq4bUg2LCIfcy09a7NuqN0ykBmOetZvLD78RPfyOPOdfFXRkEwFz21zoGavhdOHAOUj0unkxxetrDT2bDwZPfhDVpmCjm/UsXY1ps5DXlYoClkaW+MWEUMvRhIUYCPJF1gZAydeQk8Uy6jnZGj50ySEyF7ZBzWnXUQNb8vgCzgmt0aaXNcM3cr2i31S0x/QE6r9jGiQfdcKSEjiIx9xiUcMM1BcezAfA2tGtkfzsalzeZq7fcjAdg5gfKtj4KY19KA9W5UoKi9VAl6p57MPMbaaJtgSUzt6Eh9Hb6zHX4cweO7AMfJA2epFd+D9EkRkYocU11RqZ+MKFPnAzDjvBkKlflNLwMkZD6YbygmaQkGSLSk2s9g=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8E7F7323999A3458E583892C8F2A2EE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fac26712-8e14-4b7b-d65c-08d68d2b8859
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2019 18:39:02.9242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1638
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
X-List-Received-Date: Thu, 07 Feb 2019 19:49:50 -0000

SSB3b3VsZCBhbHNvIGxpa2UgdG8gY29udHJpYnV0ZSB0byB0aGlzIGVmZm9ydC4NCg0KUmVnYXJk
cw0KLVZpamF5DQoNCu+7v09uIDIvNi8xOSwgNjowNSBQTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9m
IFJ5YW4gQ2hlbiIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3ps
YWJzLm9yZyBvbiBiZWhhbGYgb2Ygcnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPiB3cm90ZToNCg0K
ICAgIEhlbGxvIEJyYWQsDQogICAgCUkgd291bGQgbGlrZSBqb2luIHRoaXMuICANCiAgICANCiAg
ICBDaGVlcnMsDQogICAgDQogICAgUnlhbg0KICAgIA0KICAgIC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQogICAgRnJvbTogb3BlbmJtYyBbbWFpbHRvOm9wZW5ibWMtYm91bmNlcytyeWFuX2No
ZW49YXNwZWVkdGVjaC5jb21AbGlzdHMub3psYWJzLm9yZ10gT24gQmVoYWxmIE9mIEJyYWQgQmlz
aG9wDQogICAgU2VudDogVHVlc2RheSwgRmVicnVhcnkgNSwgMjAxOSAxMDoxNCBQTQ0KICAgIFRv
OiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCiAgICBTdWJqZWN0OiBTZWN1cmUgYm9vdCBmb3Ig
Qk1DDQogICAgDQogICAgSGkgZXZlcnlvbmUNCiAgICANCiAgICBEb2VzIGFueW9uZSBoYXZlIHBs
YW5zIHRvIHByb3ZpZGUgYSBzZWN1cmUgQk1DIGJvb3QgaW1wbGVtZW50YXRpb24gdG8gT3BlbkJN
QyBpbiB0aGUgMi43IG9yIDIuOCB0aW1lZnJhbWU/ICBKdXN0IHRyeWluZyB0byBnZXQgYSBmZWVs
IGZvciB3aG8gYWxsIHdhbnRzIHRvIGNvbGxhYm9yYXRlIG9uIHRoaXMgYmVmb3JlIEkgc3VibWl0
IGEgZGVzaWduIHRlbXBsYXRlLg0KICAgIA0KICAgIHRoeCAtIGJyYWQNCiAgICANCg0K
