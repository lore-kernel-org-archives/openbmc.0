Return-Path: <prvs=7948b7080f=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=7948b7080f=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="NXeTPTp8"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="VECZozpA"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440sjK2x20zDqC7
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 10:16:49 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1ENCWLf025298
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 15:16:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=Z87+Smm3026Yu2jX8LOd7LPTFvil4ocrDBCSIQePeU8=;
 b=NXeTPTp8PMPe2ivWzhmYP5iDmnUBCEO4zISo2ZPHzIz0Kssn83httRlmDs49v4/SN+D9
 qT/g7RYx/RwMAyuiITeaAMQ1ShliAmnjpZhdRD3nUC4RWEfCTgRMiQd4KtIufdJUfH28
 TJN3ffy7/c1r0LOZzOhE1GnLfCm41IlAmYM= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2qnf4y8j8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 15:16:46 -0800
Received: from prn-mbx08.TheFacebook.com (2620:10d:c081:6::22) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 14 Feb 2019 15:16:45 -0800
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-mbx08.TheFacebook.com (2620:10d:c081:6::22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 14 Feb 2019 15:16:45 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Thu, 14 Feb 2019 15:16:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z87+Smm3026Yu2jX8LOd7LPTFvil4ocrDBCSIQePeU8=;
 b=VECZozpA4Snm91GBkpxdH66kTcYJBBfdEQBRvP3xeA/Bpc04/T0+HjX1IIpONL5o9JrHyGbwbFbr+Hennx0Ioz493ES8Xsi+Csd7U9qSkQmoH/zkzVP2EcH7hYK7JBYmUIgHCseB+TDZ5vTzl9Ln6OaxQB5bYfzf9fu9mTEcL0M=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1312.namprd15.prod.outlook.com (10.175.3.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.22; Thu, 14 Feb 2019 23:16:43 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::315b:5c00:59e0:b3aa]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::315b:5c00:59e0:b3aa%6]) with mapi id 15.20.1601.023; Thu, 14 Feb 2019
 23:16:43 +0000
From: Tao Ren <taoren@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Topic: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Thread-Index: AQHUxLtZwFCRNBGKaU+mRuVAh8lBkg==
Date: Thu, 14 Feb 2019 23:16:43 +0000
Message-ID: <3d3df19e-ea5e-8086-34ec-5fa1b200a313@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0087.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::28) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::7:fa98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2350cdfc-350c-4c8c-dd27-08d692d27b8b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1312; 
x-ms-traffictypediagnostic: MWHPR15MB1312:
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1312;
 20:sinZ/Aw/mzLQb5naH/YaRhx64+t6QWBUzOtommv4e26Hpjoo0wJUTn0k0wGtxo9y59ph5zg9Ukq4cRJBGCjg0eD72S1+jKDQ5VS5GMXCEUikgfL2DM8CLHqqlRxLuOSaozEEXRrjXaBKBk3bXcCxUEzxfqdxROorAHDx6SvB7lE=
x-microsoft-antispam-prvs: <MWHPR15MB1312EE46E1AA318FA1A044A6B2670@MWHPR15MB1312.namprd15.prod.outlook.com>
x-forefront-prvs: 09480768F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(396003)(376002)(346002)(39860400002)(189003)(199004)(36756003)(65806001)(53936002)(2616005)(6512007)(52116002)(476003)(99286004)(65956001)(2906002)(256004)(58126008)(97736004)(71190400001)(71200400001)(64126003)(8676002)(6486002)(6436002)(105586002)(316002)(478600001)(106356001)(46003)(486006)(4744005)(6916009)(186003)(305945005)(81156014)(8936002)(6116002)(25786009)(81166006)(386003)(6506007)(86362001)(14454004)(102836004)(65826007)(7736002)(31686004)(68736007)(31696002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1312;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JZs7t2O1IuudUj3ufj7MJSodclXx9GR19QvSGKk5uiQvZaGhA3P/5tuDfGe1yf84bj3Sssd5QW9grTVZsAvO/m7HkYAEDeprKFanxx8kfTdGkAVsoDIGXPvCxzyqxVw6UfjPw0Z7i17NaM9iLeskO/uRlnOIgykdX2LWF8Al3vOE5AZMOl1tU5zrSz1zyTy/wcdNouoNLBD01KbVE9TcASk8oMH5ha1WlEO7C9yoqoZHKHQaK4HruEwd/ud+2LLWITSEZ9qBrMiTogbe/1X5QwgbuTRIepiCBIo7OLyiB2efbMGDedMcTtn4xEF86J2JfeYb/rhDluQENOgyEZMWGT/z/eJlq1YD8PtsC++vSU3hjmjVknPCXQNeYoCI/hRXOLUaQIjH9ILYk/V+rihHHHwceWrst4toX8rBOCAVlQc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF30C25495731B44A0B4A5D854512B68@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2350cdfc-350c-4c8c-dd27-08d692d27b8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2019 23:16:43.0943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1312
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-14_12:, , signatures=0
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
X-List-Received-Date: Thu, 14 Feb 2019 23:16:54 -0000

SGksDQoNCkkgZ290IGZvbGxvd2luZyBlcnJvciB3aGlsZSBib290aW5nIHVwIG9wZW5ibWMgbGlu
dXggNC4xOCBvbiBGYWNlYm9vayBZQU1QIEJNQyAoYXN0MjUwMCBiYXNlZCksIGFuZCBpdCdzIGJl
Y2F1c2UgdG90YWwgNTk0IEdQSU8gcGlucyBhcmUgcHJvdmlkZWQgYnkgYXNwZWVkIHNvYyBhbmQg
aS9vIGV4cGFuZGVycyBvbiBZQU1QIGJvYXJkOg0KDQpncGlvY2hpcF9maW5kX2Jhc2U6IGNhbm5v
dCBmaW5kIGZyZWUgcmFuZ2UNCmdwaW9jaGlwX2FkZF9kYXRhX3dpdGhfa2V5OiBHUElPcyAwLi4x
NSAocGNhOTU1NSkgZmFpbGVkIHRvIHJlZ2lzdGVyDQoNCkknbSB3b25kZXJpbmcgaWYgaXQncyBn
b29kIGlkZWEgdG8gaW5jcmVhc2UgQVJDSF9OUl9HUElPIGRlZmF1bHQgdmFsdWUgdG8gdGhlICJu
ZXh0IGxldmVsIiAoMTAyNCkgZm9yIEFSQ0hfQVNQRUVEPyBJZiBub3QsIGFueSBvdGhlciBzdWdn
ZXN0aW9ucyBmb3IgdGhpcyBwcm9ibGVtPw0KDQoNClRoYW5rcywNCg0KVGFvDQo=
