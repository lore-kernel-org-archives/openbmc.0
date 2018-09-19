Return-Path: <prvs=2800ee65b3=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2800ee65b3=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Rb07OcAz"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="GTsJZP9I"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FllR3d3gzDrhk
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 02:32:51 +1000 (AEST)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8JGLvKY008340
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 09:22:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=XLwIzNynd2Wlk5gRX93/Bct7+eok5okLKeCiXB0J7nM=;
 b=Rb07OcAzXVT/d9zXEVRLCumkMXR1lhovcVWnwmqRZ8eNMRsSLLv422xTwH2Km2Aaw72w
 /ijUE6V/jcJ7nvIrfC4mzuG4Nxq2IWIVr9sT4hIdX3xmNk3FltZeuXQNy8d/vCqqk+aH
 /71SQgv9sWwLGFdfbhGSAfaHnBkc/jNV6KU= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0b-00082601.pphosted.com with ESMTP id 2mksw6r0mg-3
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 09:22:05 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.24) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Wed, 19 Sep 2018 12:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLwIzNynd2Wlk5gRX93/Bct7+eok5okLKeCiXB0J7nM=;
 b=GTsJZP9IkLuT728bxUcukcca/8uUSL2iRq3KKCS5RsUnBQbpC5S0V5b69Gz2Ohm7YXOq9ZiZ9Gs4EYIJXd55a6ywpGwGm685M1nGrQTlYNnvnOlCefb5p2Hxfw49rp8oR4ue3PRQiNpr3MoVQfArHUGD4UG+TDMeZAttrYrVS/A=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1688.namprd15.prod.outlook.com (10.175.121.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1143.15; Wed, 19 Sep 2018 16:21:59 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::3cb5:8b7b:eafb:d86c]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::3cb5:8b7b:eafb:d86c%5]) with mapi id 15.20.1143.017; Wed, 19 Sep 2018
 16:21:59 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [PATCH v3] ARM: dts: aspeed: Adding Facebook TiogaPass BMC
Thread-Topic: [PATCH v3] ARM: dts: aspeed: Adding Facebook TiogaPass BMC
Thread-Index: AQHUT6ky+CibOnoOVEqZ9h8oSbA6waT3VRmA
Date: Wed, 19 Sep 2018 16:21:59 +0000
Message-ID: <82BB4305-67AC-4F5E-AE9D-92941CCF4B39@fb.com>
References: <20180918234110.1908926-1-vijaykhemka@fb.com>
In-Reply-To: <20180918234110.1908926-1-vijaykhemka@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:9366]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1688;
 20:KyalbLXPL3SfQ6dpL9vwerkMl1pIkEkBPqw1AfOBwqOvjsXS7AS2BKUnKwC/v28i3nqrwRnDkUzr0Rw0UPTdzPdP4I6F+xLPW17zqq+zOszaNDQCw6xJ3jZnL203Wn5bxCAONsadVHP1VLDTObZBL3EEFuJVaGw6BSuAeFCTZn8=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: de35800e-13d8-456b-9e89-08d61e4c06be
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1688; 
x-ms-traffictypediagnostic: CY4PR15MB1688:
x-microsoft-antispam-prvs: <CY4PR15MB1688B392EAE07DC222C793B4DD1C0@CY4PR15MB1688.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863)(67672495146484)(81227570615382); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(11241501184)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699050);
 SRVR:CY4PR15MB1688; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1688; 
x-forefront-prvs: 0800C0C167
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(39860400002)(366004)(376002)(396003)(47680400002)(199004)(189003)(8676002)(102836004)(105586002)(14454004)(33656002)(8936002)(478600001)(7736002)(305945005)(86362001)(81166006)(2351001)(1730700003)(68736007)(106356001)(2906002)(83716003)(81156014)(36756003)(2616005)(97736004)(5660300001)(6436002)(53936002)(2501003)(6512007)(11346002)(5250100002)(446003)(99286004)(6116002)(46003)(5640700003)(76176011)(25786009)(6486002)(82746002)(186003)(316002)(6916009)(486006)(256004)(6506007)(476003)(2900100001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1688;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: NkJcVd6Sch7G7GhNCcR7cz0nOPynTU/J1/TU1A0Nf/4pOz0Gtwor5eLxrY5gjeeNHu/7CP83ScjUskreJPiBT9Thympxsz2p5Ohyk3TOVuwLAaSXXm31LH4bZrcY1ymfjcDIlC9txYCf0NpawqO7JHSjuS9NxmzvMY8zMtQsnYdri24oxIDZxa9R4iBAbyQ8pFYBkG6Y2GeKg2VmPCbG6oS+ILlb3vvYfYAD8988/NG94u9uGfv+57yxVjoJonSBOyDCNZqi8F6Eiz6rhJhARpM4UHqy4UGTY3g9IjZ4IfhPL94gmBFT0alaWjs2OIclbo53Y9r0KXx7V9gHhMS7RAa3ivneFVkg0RsYeoY2H0s=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <754FE5019602CE4D8F3A56626D04EBA5@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: de35800e-13d8-456b-9e89-08d61e4c06be
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2018 16:21:59.7055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1688
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-19_10:, , signatures=0
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
X-List-Received-Date: Wed, 19 Sep 2018 16:32:52 -0000

ICAgIEluaXRpYWwgaW50cm9kdWN0aW9uIG9mIEZhY2Vib29rIFRpb2dhUGFzcyBmYW1pbHkgZXF1
aXBwZWQgd2l0aA0KICAgIEFzcGVlZCAyNTAwIEJNQyBTb0MuIFRpb2dhUGFzcyBpcyBhIHg4NiBz
ZXJ2ZXIgZGV2ZWxvcG1lbnQga2l0DQogICAgd2l0aCBhIEFTUEVFRCBhc3QyNTAwIEJNQyBtYW51
ZmFjdHVyZWQgYnkgRmFjZWJvb2suDQogICAgU3BlY2lmaWNhbGx5LCBUaGlzIGFkZHMgdGhlIHRp
b2dhcGFzcyBwbGF0Zm9ybSBkZXZpY2UgdHJlZSBmaWxlDQogICAgaW5jbHVkaW5nIHRoZSBmbGFz
aCBsYXlvdXQgdXNlZCBieSB0aGUgdGlvZ2FwYXNzIEJNQyBtYWNoaW5lcy4NCiAgICANCiAgICBU
aGlzIGFsc28gYWRkcyBhbiBlbnRyeSBvZiB0aW9nYXBhc3MgZGV2aWNlIHRyZWUgZmlsZSBpbiBN
YWtlZmlsZQ0KICAgIA0KICAgIFNpZ25lZC1vZmYtYnk6IFZpamF5IEtoZW1rYSA8dmlqYXlraGVt
a2FAZmIuY29tPg0KICAgIC0tLQ0KICAgICBhcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgfCAgIDEgKw0KICAgICAuLi4vZHRzL2FzcGVlZC1ibWMtZmFjZWJvb2st
dGlvZ2FwYXNzLmR0cyAgICAgfCAxNDYgKysrKysrKysrKysrKysrKysrDQogICAgIDIgZmlsZXMg
Y2hhbmdlZCwgMTQ3IGluc2VydGlvbnMoKykNCiAgICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
YXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFjZWJvb2stdGlvZ2FwYXNzLmR0cw0KICAgIA0KICAg
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL01ha2VmaWxlDQogICAgaW5kZXggYjViZDNkZTg3YzMzLi4xYTJkYjYwNTE4NWEgMTAwNjQ0
DQogICAgLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUNCiAgICArKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9NYWtlZmlsZQ0KICAgIEBAIC0xMTk5LDYgKzExOTksNyBAQCBkdGItJChDT05G
SUdfQVJDSF9aWCkgKz0gengyOTY3MDItYWQxLmR0Yg0KICAgICBkdGItJChDT05GSUdfQVJDSF9B
U1BFRUQpICs9IFwNCiAgICAgCWFzcGVlZC1hc3QyNTAwLWV2Yi5kdGIgXA0KICAgICAJYXNwZWVk
LWJtYy1hcm0tY2VudHJpcTI0MDAtcmVwLmR0YiBcDQogICAgKwlhc3BlZWQtYm1jLWZhY2Vib29r
LXRpb2dhcGFzcy5kdGIgXA0KICAgICAJYXNwZWVkLWJtYy1pbnRlbC1zMjYwMHdmLmR0YiBcDQog
ICAgIAlhc3BlZWQtYm1jLW9wcC1sYW55YW5nLmR0YiBcDQogICAgIAlhc3BlZWQtYm1jLW9wcC1w
YWxtZXR0by5kdGIgXA0KICAgIGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQt
Ym1jLWZhY2Vib29rLXRpb2dhcGFzcy5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1j
LWZhY2Vib29rLXRpb2dhcGFzcy5kdHMNCiAgICBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KICAgIGlu
ZGV4IDAwMDAwMDAwMDAwMC4uMDUwZTcyZGY4NjgzDQogICAgLS0tIC9kZXYvbnVsbA0KICAgICsr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFjZWJvb2stdGlvZ2FwYXNzLmR0cw0K
ICAgIEBAIC0wLDAgKzEsMTQ2IEBADQogICAgKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wKw0KICAgICsvLyBDb3B5cmlnaHQgKGMpIDIwMTggRmFjZWJvb2sgSW5jLg0KICAgICsv
LyBBdXRob3I6IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPg0KICAgICsvZHRzLXYx
LzsNCiAgICArDQogICAgKyNpbmNsdWRlICJhc3BlZWQtZzUuZHRzaSINCiAgICArI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2dwaW8vYXNwZWVkLWdwaW8uaD4NCiAgICArDQogICAgKy8gew0KICAgICsJ
bW9kZWwgPSAiRmFjZWJvb2sgVGlvZ2FQYXNzIEJNQyI7DQogICAgKwljb21wYXRpYmxlID0gImZh
Y2Vib29rLHRpb2dhcGFzcy1ibWMiLCAiYXNwZWVkLGFzdDI1MDAiOw0KICAgICsJYWxpYXNlcyB7
DQogICAgKwkJc2VyaWFsMCA9ICZ1YXJ0MTsNCiAgICArCQlzZXJpYWw0ID0gJnVhcnQ1Ow0KICAg
ICsJfTsNCiAgICArCWNob3NlbiB7DQogICAgKwkJc3Rkb3V0LXBhdGggPSAmdWFydDU7DQogICAg
KwkJYm9vdGFyZ3MgPSAiY29uc29sZT10dHlTNCwxMTUyMDAgZWFybHlwcmludGsiOw0KICAgICsJ
fTsNCiAgICArDQogICAgKwltZW1vcnlAODAwMDAwMDAgew0KICAgICsJCXJlZyA9IDwweDgwMDAw
MDAwIDB4MjAwMDAwMDA+Ow0KICAgICsJfTsNCiAgICArfTsNCiAgICArDQogICAgKyZmbWMgew0K
ICAgICsJc3RhdHVzID0gIm9rYXkiOw0KICAgICsJZmxhc2hAMCB7DQogICAgKwkJc3RhdHVzID0g
Im9rYXkiOw0KICAgICsJCW0yNXAsZmFzdC1yZWFkOw0KICAgICsjaW5jbHVkZSAib3BlbmJtYy1m
bGFzaC1sYXlvdXQuZHRzaSINCiAgICArCX07DQogICAgK307DQogICAgKw0KICAgICsmc3BpMSB7
DQogICAgKwlzdGF0dXMgPSAib2theSI7DQogICAgKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
Ow0KICAgICsJcGluY3RybC0wID0gPCZwaW5jdHJsX3NwaTFfZGVmYXVsdD47DQogICAgKwlmbGFz
aEAwIHsNCiAgICArCQlzdGF0dXMgPSAib2theSI7DQogICAgKwkJbTI1cCxmYXN0LXJlYWQ7DQog
ICAgKwkJbGFiZWwgPSAicG5vciI7DQogICAgKwl9Ow0KICAgICt9Ow0KICAgICsNCiAgICArJnVh
cnQxIHsNCiAgICArCS8vIEhvc3QgQ29uc29sZQ0KICAgICsJc3RhdHVzID0gIm9rYXkiOw0KICAg
ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCiAgICArCXBpbmN0cmwtMCA9IDwmcGluY3Ry
bF90eGQxX2RlZmF1bHQNCiAgICArCQkgICAgICZwaW5jdHJsX3J4ZDFfZGVmYXVsdD47DQogICAg
K307DQogICAgKw0KICAgICsmdWFydDUgew0KICAgICsJLy8gQk1DIENvbnNvbGUNCiAgICArCXN0
YXR1cyA9ICJva2F5IjsNCiAgICArfTsNCiAgICArDQogICAgKyZtYWMwIHsNCiAgICArCXN0YXR1
cyA9ICJva2F5IjsNCiAgICArDQogICAgKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KICAg
ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX3JtaWkxX2RlZmF1bHQ+Ow0KICAgICsJdXNlLW5jc2k7
DQogICAgK307DQogICAgKw0KICAgICsmaTJjMCB7DQogICAgKwlzdGF0dXMgPSAib2theSI7DQog
ICAgKwkvL0Fpcm1heCBDb25uIEIsIENQVTAgUElST00sIENQVTEgUElST00NCiAgICArfTsNCiAg
ICArDQogICAgKyZpMmMxIHsNCiAgICArCXN0YXR1cyA9ICJva2F5IjsNCiAgICArCS8vWDI0IFJp
c2VyDQogICAgK307DQogICAgKw0KICAgICsmaTJjMiB7DQogICAgKwlzdGF0dXMgPSAib2theSI7
DQogICAgKwkvLyBNZXp6IE1hbmFnZW1lbnQgU01CdXMNCiAgICArfTsNCiAgICArDQogICAgKyZp
MmMzIHsNCiAgICArCXN0YXR1cyA9ICJva2F5IjsNCiAgICArCS8vIFNNQnVzIHRvIEJvYXJkIElE
IEVFUFJPTQ0KICAgICt9Ow0KICAgICsNCiAgICArJmkyYzQgew0KICAgICsJc3RhdHVzID0gIm9r
YXkiOw0KICAgICsJLy8gQk1DIERlYnVnIEhlYWRlcg0KICAgICt9Ow0KICAgICsNCiAgICArJmky
YzUgew0KICAgICsJc3RhdHVzID0gIm9rYXkiOw0KICAgICsgIC8vQ1BVIFZvbHRhZ2UgcmVndWxh
dG9ycw0KICAgICt9Ow0KICAgICsNCiAgICArJmkyYzYgew0KICAgICsJc3RhdHVzID0gIm9rYXki
Ow0KICAgICsJdHBtQDIwIHsNCiAgICArCQljb21wYXRpYmxlID0gImluZmluZW9uLHNsYjk2NDV0
dCI7DQogICAgKwkJcmVnID0gPDB4MjA+Ow0KICAgICsJfTsNCiAgICArCXRtcDQyMUA0ZSB7DQog
ICAgKwkJY29tcGF0aWJsZSA9ICJ0aSx0bXA0MjEiOw0KICAgICsJCXJlZyA9IDwweDRlPjsNCiAg
ICArCX07DQogICAgKwl0bXA0MjFANGYgew0KICAgICsJCWNvbXBhdGlibGUgPSAidGksdG1wNDIx
IjsNCiAgICArCQlyZWcgPSA8MHg0Zj47DQogICAgKwl9Ow0KICAgICsJZWVwcm9tQDU0IHsNCiAg
ICArCQljb21wYXRpYmxlID0gImF0bWVsLDI0YzY0IjsNCiAgICArCQlyZWcgPSA8MHg1ND47DQog
ICAgKwkJcGFnZXNpemUgPSA8MzI+Ow0KICAgICsJfTsNCiAgICArfTsNCiAgICArDQogICAgKyZp
MmM3IHsNCiAgICArCXN0YXR1cyA9ICJva2F5IjsNCiAgICArICAvL0hTQywgQWlyTWF4IENvbm4g
QQ0KICAgICt9Ow0KICAgICsNCiAgICArJmkyYzggew0KICAgICsJc3RhdHVzID0gIm9rYXkiOw0K
ICAgICsgIC8vTWV6eiBTZW5zb3IgU01CdXMNCiAgICArfTsNCiAgICArDQogICAgKyZpMmM5IHsN
CiAgICArCXN0YXR1cyA9ICJva2F5IjsNCiAgICArICAvL1VTQiBEZWJ1ZyBDb25uZWN0b3INCiAg
ICArfTsNCiAgICArDQogICAgKyZwd21fdGFjaG8gew0KICAgICsJc3RhdHVzID0gIm9rYXkiOw0K
ICAgICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCiAgICArCXBpbmN0cmwtMCA9IDwmcGlu
Y3RybF9wd20wX2RlZmF1bHQgJnBpbmN0cmxfcHdtMV9kZWZhdWx0PjsNCiAgICArCWZhbkAwIHsN
CiAgICArCQlyZWcgPSA8MHgwMD47DQogICAgKwkJYXNwZWVkLGZhbi10YWNoLWNoID0gL2JpdHMv
IDggPDB4MDA+Ow0KICAgICsJfTsNCiAgICArDQogICAgKwlmYW5AMSB7DQogICAgKwkJcmVnID0g
PDB4MDA+Ow0KICAgICsJCWFzcGVlZCxmYW4tdGFjaC1jaCA9IC9iaXRzLyA4IDwweDAxPjsNCiAg
ICArCX07DQogICAgK307DQogICAgLS0gDQogICAgMi4xNy4xDQogICAgDQogICAgDQoNCg==
