Return-Path: <prvs=5892f6c2ce=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=5892f6c2ce=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="XYR0/V4c"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="iHli3U8P"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43LPG80nvYzDqwv
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 07:57:18 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wBKKmhbl028250; Thu, 20 Dec 2018 12:57:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=JRZSBSf/kmjbxsXnEFkvkgSWyr8YBZtAg+N723ZlnJg=;
 b=XYR0/V4c3EI0Uxv5K8CwXFh6Y41R32D1t21nzYrwwhmxpE7PtPngYMBEht/3XMgWuKT9
 buY/PH0Fzd+8xs6C/AePjTNo7niU4RVuTNTnn1ZigL0IqNkmSbHjdXKglFstuhVNkjLX
 i2uIBttryo2x7YyFH+qI/ePG3Eij3vj/gak= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2pgfp20nnc-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 20 Dec 2018 12:57:14 -0800
Received: from frc-hub04.TheFacebook.com (2620:10d:c021:18::174) by
 frc-hub05.TheFacebook.com (2620:10d:c021:18::175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 20 Dec 2018 12:57:14 -0800
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.74) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Thu, 20 Dec 2018 12:57:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRZSBSf/kmjbxsXnEFkvkgSWyr8YBZtAg+N723ZlnJg=;
 b=iHli3U8PBux4em3NRS9u5dhTS+6Axto6OjjOt+oyRQUFQIUNvd4WR5jEo1gB16xM8MlLDJBXP/rOT7WIqhSX7GZs1gmVktKcRtlSqLuJP5ZKnIQlljJ5AXkO7xY/cg8TlvQ5Yu4zNMQeNClKjSYZFo+XZbtanysRvfJZjimQVvk=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1815.namprd15.prod.outlook.com (10.174.54.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1446.19; Thu, 20 Dec 2018 20:57:13 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1bd:fa86:857:9b04]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1bd:fa86:857:9b04%10]) with mapi id 15.20.1446.018; Thu, 20 Dec 2018
 20:57:13 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Tanous, Ed" <ed.tanous@intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: Testing Phosphor-pid-control
Thread-Topic: Testing Phosphor-pid-control
Thread-Index: AQHUmIxTP8xlE76TH0O3H+2xLU7rIaWH5/IQ//+uAQA=
Date: Thu, 20 Dec 2018 20:57:13 +0000
Message-ID: <2382D7CD-E130-4EDC-99AE-D993115C2A63@fb.com>
References: <DFD47DF5-0CAE-4968-AF01-76B5884C2D58@fb.com>
 <7E9441B1E5EFFD4681F54958E821699345985566@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345985566@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:c50e]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1815;
 20:VQCCyo3i02Ts8DQ0ZWqaM+npjoq1LFVfPELT3jobat+CWzqDoppYJNZTfpGnMYf0iPlH6+IITKGiPKyzj9Ae0/ljtBFnWvWCNJ6F8sJw/SiSJmOeqKjNO7D2M+AJyj8c0r5BCI3CMJ9sDtIapuP7rG76D9trhTicH22/5awUA+I=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 546c1555-477c-48c7-63ca-08d666bdb794
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1815; 
x-ms-traffictypediagnostic: CY4PR15MB1815:
x-microsoft-antispam-prvs: <CY4PR15MB1815E75A0DC4885968BEF79BDDBF0@CY4PR15MB1815.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(11241501185)(5005026)(6040522)(2401047)(8121501046)(93006095)(93001095)(3231475)(944501520)(52105112)(10201501046)(3002001)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1815; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1815; 
x-forefront-prvs: 0892FA9A88
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(136003)(39860400002)(396003)(376002)(189003)(199004)(81166006)(81156014)(2906002)(82746002)(3480700005)(8676002)(8936002)(25786009)(575784001)(83716004)(5660300001)(7736002)(71190400001)(86362001)(71200400001)(6116002)(305945005)(14454004)(97736004)(99286004)(229853002)(6306002)(110136005)(316002)(11346002)(486006)(2616005)(476003)(105586002)(33656002)(446003)(68736007)(478600001)(106356001)(14444005)(256004)(966005)(102836004)(186003)(6506007)(6246003)(76176011)(36756003)(6486002)(46003)(6436002)(53936002)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1815;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: h8LvVPCjKIhMciWppBzuQ2KRTZIYipCjv6aFTOAk1CkblmNpY/vHR5soTkRHd9tE9mamrR4lJW+HmhzYmEVK4xQyXkEkCqbaegj+MFAu0jEHea/OWw9eWftG5vH+sZH4xWdVWCris9Vnj1PCab8e5/s3xDt1KP5wVPOr7spOeYLSbECnlORc8JVmmoG4M8hPqzM1IN83AsUuCzjKHXPD85IAFIsbjzZXcC5kFp92/lkGntA3jcrqP+ejxJ6xR16VQCDcvj118mUowjDwLWf/wVNAq/R/zjdX7eUgKTUFcMegh0d1IxuFqtAAGDQtynMw
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <419FEEE7C5F56A429797EF13DDDB7864@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 546c1555-477c-48c7-63ca-08d666bdb794
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2018 20:57:13.3630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1815
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-20_10:, , signatures=0
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
X-List-Received-Date: Thu, 20 Dec 2018 20:57:21 -0000

SGkgRWQsDQpJIGFtIGFibGUgdG8gb3ZlcnJpZGUgYW5kIHJlYWQgaXQgYmFjayBidXQgbm90IHNl
ZWluZyBhbnkgY2hhbmdlIGluIHB3bSBkYXRhIGFzIHdlbGwgYXMgZmFuIHNwZWVkLiBJIGhhdmUg
c3dhbXBkIHJ1bm5pbmcuDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQrvu79PbiAxMi8yMC8xOCwgMTA6
MTQgQU0sICJUYW5vdXMsIEVkIiA8ZWQudGFub3VzQGludGVsLmNvbT4gd3JvdGU6DQoNCiAgICBB
c3N1bWluZyB5b3XigJlyZSB1c2luZyBkYnVzLXNlbnNvcnMgKHdoaWNoIEnigJltIHByZXR0eSBz
dXJlIHlvdSBhcmUpOg0KICAgIA0KICAgIFN1cHBvcnQgZm9yIG92ZXJyaWRpbmcgc2Vuc29yIHZh
bHVlcyB3YXMgcmVjZW50bHkgbGFuZGVkIGluIHRoaXMgY29tbWl0Og0KICAgIGh0dHBzOi8vdXJs
ZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fZ2Vycml0Lm9wZW5ibWMt
MkRwcm9qZWN0Lnh5el8tMjNfY19vcGVuYm1jX2RidXMtMkRzZW5zb3JzXy0yQl8xNjE3N18mZD1E
d0lHYVEmYz01VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JnI9djlNVTBLaTlwV25UWENXd2pIUFZncG5D
Ujgwdlhra2NySWFxVTdVU2w1ZyZtPTFKLTVlSmw0RHJjMkxLY1EyU2RPTmMwMnVSNWNpaDNQNjht
NjZRY01Zb2cmcz1jOTc5OHFtSV9wQTNobnpCOTdvYVlGSzh5RlRtd3J4ZHBBZVJydWk0cWtZJmU9
DQogICAgDQogICAgT3ZlcnJpZGluZyBhIHNlbnNvciB2YWx1ZSB3aXRoIGEgImZha2UiIHNlbnNv
ciByZWFkaW5nIHNob3VsZCBiZSBhcyBlYXN5IGFzIHNpbXBseSBjYWxsaW5nIFNldFByb3BlcnR5
IG9uIHRoZSBkYnVzIGludGVyZmFjZS4NCiAgICANCiAgICBFeGFtcGxlIGFzIHRlc3RlZCBvbiBt
eSBzeXN0ZW0gKHlvdXIgcGF0aCBuYW1lcyBtYXkgdmFyeSkNCiAgICBkYnVzLXNlbmQgLS1zeXN0
ZW0gLS1wcmludC1yZXBseSAtLWRlc3Q9eHl6Lm9wZW5ibWNfcHJvamVjdC5DUFVTZW5zb3IgL3h5
ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycy90ZW1wZXJhdHVyZS9Db3JlXzFfQ1BVMCBvcmcuZnJl
ZWRlc2t0b3AuREJ1cy5Qcm9wZXJ0aWVzLlNldCBzdHJpbmc6eHl6Lm9wZW5ibWNfcHJvamVjdC5T
ZW5zb3IuVmFsdWUgc3RyaW5nOlZhbHVlIHZhcmlhbnQ6ZG91YmxlOjEuMA0KICAgIA0KICAgIGFu
ZCB2ZXJpZnkgYnkgcmVhZGluZyBpdCBiYWNrIG91dDoNCiAgICANCiAgICBkYnVzLXNlbmQgLS1z
eXN0ZW0gLS1wcmludC1yZXBseSAtLWRlc3Q9eHl6Lm9wZW5ibWNfcHJvamVjdC5DUFVTZW5zb3Ig
L3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycy90ZW1wZXJhdHVyZS9Db3JlXzFfQ1BVMCBvcmcu
ZnJlZWRlc2t0b3AuREJ1cy5Qcm9wZXJ0aWVzLkdldEFsbCBzdHJpbmc6eHl6Lm9wZW5ibWNfcHJv
amVjdC5TZW5zb3IuVmFsdWUNCiAgICANCg0K
