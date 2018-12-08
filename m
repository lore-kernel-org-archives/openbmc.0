Return-Path: <prvs=588014f049=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=588014f049=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="C1K9ytDU"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="K5eQBChx"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43BWfL3YsTzF0Q7;
 Sat,  8 Dec 2018 12:17:26 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wB81BEwg009108; Fri, 7 Dec 2018 17:17:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Vl5oktuTUYV9X9foRF+TaYhVdxZhSUemCxBYNnyQ6Ok=;
 b=C1K9ytDUCBUfeBQjGmqe3PyC1PFy56S6v43tBhoIAebtFA9Posum61OmdcE/oo2eIQRC
 AxXQ1UWpjQCSWbeYiy29O9N6sEos+toL9aXy8XywG2vszaNTzRf+wAW9px+TYLj0Mn92
 8bAmbtTwZlEUUjiER3vIPn8qdbamKTtcgBo= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2p81rt0c94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 07 Dec 2018 17:17:23 -0800
Received: from prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 7 Dec 2018 17:17:23 -0800
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 7 Dec 2018 17:17:22 -0800
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Fri, 7 Dec 2018 17:17:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vl5oktuTUYV9X9foRF+TaYhVdxZhSUemCxBYNnyQ6Ok=;
 b=K5eQBChxqv8Jfqlk7WbFnIUQGgPe2/nZh/9Fp4s03uIkc2iv2Px3KubcEpBko1M4SphdVB3zTqgW0cc6Lp0KZDHCRXmQa19MLwKp4OBf3fT5Qh+4SolfyCbiNAOSfzXwK7t9AXnOa7HEmXPIbVHCw6UxkdAqSI5pT4KvTLUBAxk=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1174.namprd15.prod.outlook.com (10.172.177.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.22; Sat, 8 Dec 2018 01:17:21 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1bd:fa86:857:9b04]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1bd:fa86:857:9b04%8]) with mapi id 15.20.1404.021; Sat, 8 Dec 2018
 01:17:21 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
CC: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: KCS device tree patch
Thread-Topic: KCS device tree patch
Thread-Index: AQHUjpPEEBMlN2DcVE2e5UcgU3QVow==
Date: Sat, 8 Dec 2018 01:17:21 +0000
Message-ID: <F652C9ED-FC48-4C31-9A71-EE67CE8FAEA9@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:c1d7]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1174;
 20:hZtpJilJF7IMANiYPopuA9i8ucSNVw4NQXfL19M0hFJdC7P7Tel84pbaY7+suI0y4xfIV9GzGfL4QchdhZhoWJupDC+MyF1N0HuO+oJBA5Wxl5g/tMDWkhOGshbpbnproRwYEN+Vx3785KytEShDFaFyNbG1c9vh9AVDD6pKhEs=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: ee7386fe-ee4c-42d5-34de-08d65caae772
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1174; 
x-ms-traffictypediagnostic: CY4PR15MB1174:
x-microsoft-antispam-prvs: <CY4PR15MB1174CBF04E7736C08A0F050FDDAB0@CY4PR15MB1174.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231455)(999002)(11241501185)(944501520)(52105112)(3002001)(10201501046)(148016)(149066)(150057)(6041310)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1174; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1174; 
x-forefront-prvs: 0880FB6EC1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(346002)(396003)(376002)(366004)(189003)(199004)(99286004)(54906003)(14454004)(316002)(6512007)(105586002)(33656002)(53936002)(106356001)(478600001)(5660300001)(7736002)(558084003)(25786009)(3480700005)(6116002)(68736007)(82746002)(6916009)(83716004)(97736004)(71190400001)(71200400001)(256004)(14444005)(81156014)(81166006)(8936002)(6486002)(8676002)(36756003)(6506007)(486006)(6436002)(2616005)(476003)(305945005)(86362001)(102836004)(4326008)(186003)(46003)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1174;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: kanXIfQuMSegHUpshyi80hYxRB3/xksmawH6Gl3K3TjhTG3t/o/X9Mw6x10/TFNlEut1GM7scX4GOeRptfOZCV8qmDeZZt3UGaji+Zzfcrq+RcEIv3ST1QIXYxmdbLwSlBrWN1lZBMyO0jaFU2tR7rNWdj7N5kwVTpRT8KKxdFMQvhSykZZG8M/BJa82eaWjBGNyLQoicnnFVmB8kNd7aGOCoUiv4TKjeqPalDf3NKiBggHf9jJMIeBD60uvNy+MukWAgA1QYZtj0YHIQ/MOCDb51CkV6493ZOucG+26BNhzK/hletbEBea02DzNSgSAwLxMIaQgyIdsxFd3TA5JYH3ZDKeddSgw+dWtYt0LpnY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <A58E0A6404BBBB46A824D7B06B29A6A4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7386fe-ee4c-42d5-34de-08d65caae772
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 01:17:21.5627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1174
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-07_08:, , signatures=0
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
X-List-Received-Date: Sat, 08 Dec 2018 01:17:32 -0000

IEhpIEphZSwNCldoZW4gYXJlIHlvdSBwbGFubmluZyB0byBwdXNoIGtjcyBkZXZpY2UgdHJlZSBj
aGFuZ2UgZm9yIGFzcGVlZCBnNS4gQmVjYXVzZSBJIG5lZWQgdG8gdXBkYXRlIG91ciBmYWNlYm9v
ayBkZXZpY2UgdHJlZSBhbmQgaXQgcmVmZXJzIHRvIHRoaXMga2NzIGNoYW5nZS4gSWYgeW91IHdh
bnQgSSBjYW4gcHVzaCBpdCBhbG9uZyB3aXRoIG15IGNoYW5nZS4NCg0KUmVnYXJkcw0KLVZpamF5
DQoNCg==
