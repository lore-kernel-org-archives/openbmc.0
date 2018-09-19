Return-Path: <prvs=2800ee65b3=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2800ee65b3=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="rZn5G0sQ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="c2iMJHSX"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FlWb2VV9zDqq0
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 02:22:32 +1000 (AEST)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8JGLvL7008340
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 09:22:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=XLwIzNynd2Wlk5gRX93/Bct7+eok5okLKeCiXB0J7nM=;
 b=rZn5G0sQ92/XsyQzPHePKAseWnT9azYfthHpaMRVR/DS10vQZEZ9Md+AVqqduwem6vYy
 Bih6X0kSEiln5uYKqcwVZxno5dq/NjMK1C5xR1NfAht7yQmlI7tDlnKkG0TW5O/rqm91
 0gUPoB/MYMXUTtsmZ8nihR2iyiOYN7tAkmk= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0b-00082601.pphosted.com with ESMTP id 2mksw6r0rg-2
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 09:22:30 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.22) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Wed, 19 Sep 2018 09:21:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLwIzNynd2Wlk5gRX93/Bct7+eok5okLKeCiXB0J7nM=;
 b=c2iMJHSXo6IobNXKAckDHaTtqM2FNnt4yHjqq2JIuaU7rh9hl4q7qnS6I/OW4S1nbVEHu69EZWNR7EyypWf93wECrjML5WkxioCOqVcSPuTrroxdn8Psq3vZb0ZwdqwEn1ucOEwGQ81e2zgIQxqTFWFpg0/sdyX9ab+8e+efupU=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1688.namprd15.prod.outlook.com (10.175.121.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1143.15; Wed, 19 Sep 2018 16:21:28 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::3cb5:8b7b:eafb:d86c]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::3cb5:8b7b:eafb:d86c%5]) with mapi id 15.20.1143.017; Wed, 19 Sep 2018
 16:21:28 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [PATCH] ARM: dts: aspeed: Adding Facebook TiogaPass BMC
Thread-Topic: [PATCH] ARM: dts: aspeed: Adding Facebook TiogaPass BMC
Thread-Index: AQHUT6jxpqPpvcrDzkCVWnhb6Y+YVaT3VPSA
Date: Wed, 19 Sep 2018 16:21:27 +0000
Message-ID: <327303D4-FEF4-46E7-82EF-3D7044865FA1@fb.com>
References: <20180918233904.1904859-1-vijaykhemka@fb.com>
In-Reply-To: <20180918233904.1904859-1-vijaykhemka@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:9366]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1688;
 20:FZTiKLgvOpGhE+c5Ax5dkrKH8qdO1TN9zY1llg6tsJpzuswnqcFjwMIEOjKYiAWstHQm7GFR7ueqYVccz2pcwvno25Wlz60n/8Awh1dJMVKLe/bTHc+iUDV3yUYth8u/CuYV3VWp7gAEWFOemRwEVHs+4qr09IvTnHKkenlfmA0=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 1f0ab14d-cba9-4aa1-a1c9-08d61e4bf3bb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1688; 
x-ms-traffictypediagnostic: CY4PR15MB1688:
x-microsoft-antispam-prvs: <CY4PR15MB1688BE5C668114403552FB63DD1C0@CY4PR15MB1688.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863)(67672495146484)(81227570615382); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(11241501184)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699050);
 SRVR:CY4PR15MB1688; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1688; 
x-forefront-prvs: 0800C0C167
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(39860400002)(366004)(376002)(396003)(47680400002)(199004)(189003)(8676002)(102836004)(105586002)(14454004)(33656002)(8936002)(478600001)(7736002)(305945005)(86362001)(81166006)(2351001)(1730700003)(68736007)(106356001)(2906002)(83716003)(81156014)(36756003)(2616005)(97736004)(1857600001)(5660300001)(6436002)(53936002)(2501003)(6512007)(11346002)(5250100002)(446003)(99286004)(6116002)(46003)(5640700003)(76176011)(25786009)(6486002)(82746002)(186003)(316002)(6916009)(486006)(256004)(6506007)(476003)(2900100001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1688;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: YgYfrK6o9EpbYMM6S2EHD0NCMklUexa6CuqwiLrpkQJp7KUHLBP/cyXihp5w3U8bEJjIDUJ9Pd1Dgifg6TczgIqmtAJqMpZgk2CjOqQYxN15xcdSS9ui9YOc0bFgc60yJ+jwz3TRl51k7wzFGMTuxeRDk4x1XwtM0jO/RJ4JrTEkM0e2ZBYYHQsxTZv56f6I4nchdTnO5t4pzbI2tqypVPPJ1vPuTg1b8ElNY7VmEuYCRgg6zmqeHtT305QVVe4rMnSY3x1WdOpC6zece55FwN+eSKlIb6vhnFm/Z7CCm9HEfvqrNgrEPCpEDJ4Kwselk23v+pr9GEXENya61Qu8QAUUKh7WQWjolm12skf6anU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F33D35B3B5D6F4999C5920C621D3E81@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0ab14d-cba9-4aa1-a1c9-08d61e4bf3bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2018 16:21:27.8012 (UTC)
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
X-List-Received-Date: Wed, 19 Sep 2018 16:22:36 -0000

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
