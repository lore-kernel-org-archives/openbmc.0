Return-Path: <prvs=794647f5a5=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=794647f5a5=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Ysgo5P5m"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ZAdLcEPP"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zcL3118nzDqGp;
 Wed, 13 Feb 2019 09:10:50 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1CM7qmd024671; Tue, 12 Feb 2019 14:10:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=XQD5i2XDqM40bwjNApJX4QlVmGofPTzCCAGpUKMKNsw=;
 b=Ysgo5P5mvwBorRqOZuzaDhyID//YbBEz36xwFWum+fWCN/+pXSTOgqe3c6ClclcZi1RK
 KG/PPpKXTLDWFqKaVN6W/oZGaFMZ+h6pz1IMmaLBif3dnk4/oAEdgnr/V+eBP4C5IxQf
 crbZ5FT8YmTszIEdX+o6tQS3eT2fwNr0WCg= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2qm4d9rg82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 12 Feb 2019 14:10:40 -0800
Received: from frc-hub04.TheFacebook.com (2620:10d:c021:18::174) by
 frc-hub04.TheFacebook.com (2620:10d:c021:18::174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 12 Feb 2019 14:07:40 -0800
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.74) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 12 Feb 2019 14:07:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQD5i2XDqM40bwjNApJX4QlVmGofPTzCCAGpUKMKNsw=;
 b=ZAdLcEPPzzsxvh0AJsdLhNw+FbEp/uT4CbFsHGin5ChzJ9iLAA0bgpvpJ488tpWaxPqNwxo+Gb8dioVY+lsGdgd71IBrlGcCiEDVFJ41arL26UQsQY6HEjCrp/AEJxrUZBVd33zdvTgRPcdxPNcVVX166rCMl3CSBmtF5qGbllQ=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1256.namprd15.prod.outlook.com (10.172.180.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Tue, 12 Feb 2019 22:07:38 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b9cb:6dd8:d8bf:45c6]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b9cb:6dd8:d8bf:45c6%2]) with mapi id 15.20.1601.023; Tue, 12 Feb 2019
 22:07:38 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: John Wang <wangzqbj@inspur.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "joel@jms.id.au" <joel@jms.id.au>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH] ARM:dts:aspeed Add Inspur on5263m5 BMC
Thread-Topic: [PATCH] ARM:dts:aspeed Add Inspur on5263m5 BMC
Thread-Index: AQHUrjHrvTNFuJXd10yzbWSYgOf1x6XcXDYA
Date: Tue, 12 Feb 2019 22:07:38 +0000
Message-ID: <4C4C6975-CA11-4609-BF8D-6246A1C5F193@fb.com>
References: <1547708191-8721-1-git-send-email-wangzqbj@inspur.com>
In-Reply-To: <1547708191-8721-1-git-send-email-wangzqbj@inspur.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:3bde]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f7aa180-466e-4ecf-c24e-08d69136805b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1256; 
x-ms-traffictypediagnostic: CY4PR15MB1256:
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1256;
 20:Sez4gVfvOpEGokqDrnfecmrt7qZmPwGsnDfyclZIYkppSYwYYARKgrZBK+leCHM3F3P3Xm0kszzxq293aAxktq5VKaonpiAgvWtN47Ql6/LIuevqav8uZH/FRcTWG62ZMCVFhnpbEY1i5kCd9KMlkTgZa+RxaLAkpw+KY0JNs24=
x-microsoft-antispam-prvs: <CY4PR15MB1256D1120D7E15DE21D152ABDD650@CY4PR15MB1256.namprd15.prod.outlook.com>
x-forefront-prvs: 0946DC87A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(376002)(396003)(136003)(366004)(189003)(199004)(186003)(86362001)(6116002)(6506007)(102836004)(53936002)(14454004)(486006)(2616005)(33656002)(476003)(11346002)(46003)(4326008)(6246003)(36756003)(446003)(2201001)(68736007)(82746002)(25786009)(6512007)(7736002)(2906002)(305945005)(8676002)(81156014)(81166006)(8936002)(2501003)(106356001)(105586002)(478600001)(76176011)(83716004)(97736004)(71200400001)(256004)(71190400001)(110136005)(54906003)(316002)(229853002)(6486002)(6436002)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1256;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VV7ZfVW+LW9sqexPWaPbqHGFHt31ro+bYOXvN9fXUnzSijGwc82ZumelqUmFH0X/s+EY/AaIu6WiwWhm1Ml7NeorYwyav3jvtxiQXyumm0YGf5qscp8P9VPqqYoR0D8GTSLhs750qaafb1eIx303gc3Y6XLLV0h5SrGuoiYsaBpnm4gqrQ1i/gk6NxDJYFJWk79+wgyFRpxTwvwmXJiT0p+e0GwPXid0NIn4RKxnWUHlfMMriDVT27v1MIF2jqkeAzKOj4hz9gLHJ3asCqjdgu/kUfMRpao7iGB8P0rQKXZPoClE1owpicGVjRR2+X2L+tbz3KyP5UyhoNq4wopxw89t3jNbHMJyOcfF1X3vu8TOoYPyXvY5PXShpd0o+xzlBdxRX180zYPetjw28SAZeZcqCm6/yoHYdNvajlJZlds=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6308512A0B0ED94FB56169C8E973294E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7aa180-466e-4ecf-c24e-08d69136805b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2019 22:07:38.6632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1256
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-12_12:, , signatures=0
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
X-List-Received-Date: Tue, 12 Feb 2019 22:10:51 -0000

DQoNCu+7v09uIDIvMTIvMTksIDE6NTggUE0sICJMaW51eC1hc3BlZWQgb24gYmVoYWxmIG9mIEpv
aG4gV2FuZyIgPGxpbnV4LWFzcGVlZC1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5v
emxhYnMub3JnIG9uIGJlaGFsZiBvZiB3YW5nenFiakBpbnNwdXIuY29tPiB3cm90ZToNCg0KICAg
IEFkZCBpbml0aWFsIHZlcnNpb24gb2YgZGV2aWNlIHRyZWUgZmlsZSBmb3Igb241MjYzbTUgYXN0
MjUwMGJtYw0KICAgIA0KICAgIFNpZ25lZC1vZmYtYnk6IEpvaG4gV2FuZyA8d2FuZ3pxYmpAaW5z
cHVyLmNvbT4NCiAgICAtLS0NCiAgICAgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnNw
dXItb241MjYzbTUuZHRzIHwgMTQ2ICsrKysrKysrKysrKysrKysrKysrKysrDQogICAgIDEgZmls
ZSBjaGFuZ2VkLCAxNDYgaW5zZXJ0aW9ucygrKQ0KICAgICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnNwdXItb241MjYzbTUuZHRzDQogICAgDQogICAg
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW5zcHVyLW9uNTI2M201
LmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW5zcHVyLW9uNTI2M201LmR0cw0K
ICAgIG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQogICAgaW5kZXggMDAwMDAwMC4uMDY0YWUzMA0KICAg
IC0tLSAvZGV2L251bGwNCiAgICArKysgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWlu
c3B1ci1vbjUyNjNtNS5kdHMNCiAgICBAQCAtMCwwICsxLDE0NiBAQA0KICAgICsvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KICAgICsvLyBDb3B5cmlnaHQgKGMpIDIwMTggSW5z
cHVyIENvcnBvcmF0aW9uDQogICAgKy9kdHMtdjEvOw0KICAgICsNCiAgICArI2luY2x1ZGUgImFz
cGVlZC1nNS5kdHNpIg0KICAgICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9hc3BlZWQtZ3Bp
by5oPg0KICAgICsNCiAgICArLyB7DQogICAgKwltb2RlbCA9ICJPTjUyNjNNNSBCTUMiOw0KICAg
ICsJY29tcGF0aWJsZSA9ICJpbnNwdXIsb241MjYzbTUtYm1jIiwgImFzcGVlZCxhc3QyNTAwIjsN
CiAgICArDQogICAgKwljaG9zZW4gew0KICAgICsJCXN0ZG91dC1wYXRoID0gJnVhcnQ1Ow0KICAg
ICsJCWJvb3RhcmdzID0gImVhcmx5cHJpbnRrIjsNCiAgICArCX07DQogICAgKw0KICAgICsJbWVt
b3J5IHsNCiAgICArCQlyZWcgPSA8MHg4MDAwMDAwMCAweDIwMDAwMDAwPjsNCiAgICArCX07DQog
ICAgKw0KICAgICsJcmVzZXJ2ZWQtbWVtb3J5IHsNCiAgICArCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsNCiAgICArCQkjc2l6ZS1jZWxscyA9IDwxPjsNCiAgICArCQlyYW5nZXM7DQogICAgKw0KICAg
ICsJCXZnYV9tZW1vcnk6IGZyYW1lYnVmZmVyQDlmMDAwMDAwIHsNCiAgICArCQkJbm8tbWFwOw0K
ICAgICsJCQlyZWcgPSA8MHg5ZjAwMDAwMCAweDAxMDAwMDAwPjsNCiAgICArCQl9Ow0KICAgICsJ
fTsNCiAgICArCQ0KICAgICsJbGVkcyB7DQogICAgKwkgICAgY29tcGF0aWJsZSA9ICJncGlvLWxl
ZHMiOw0KICAgICsJICAgIA0KICAgICsJICAgIGJtY19hbGl2ZSB7DQogICAgKwkgICAgICAgIGxh
YmVsID0gImJtY19hbGl2ZSI7DQogICAgKwkJZ3Bpb3MgPSA8JmdwaW8gQVNQRUVEX0dQSU8oSSwg
MSkgR1BJT19BQ1RJVkVfTE9XPjsNCiAgICArCQlsaW51eCxkZWZhdWx0LXRyaWdnZXIgPSAidGlt
ZXIiOw0KICAgICsJICAgIH07DQogICAgKwl9Ow0KICAgICsNCiAgICArCWlpby1od21vbiB7DQog
ICAgKwkJY29tcGF0aWJsZSA9ICJpaW8taHdtb24iOw0KICAgICsJCWlvLWNoYW5uZWxzID0gPCZh
ZGMgMD4sIDwmYWRjIDE+LCA8JmFkYyAyPiwgPCZhZGMgMz4sDQogICAgKwkJCTwmYWRjIDQ+LCA8
JmFkYyA1PiwgPCZhZGMgNj4sIDwmYWRjIDc+Ow0KICAgICsJfTsNCiAgICArDQogICAgK307DQog
ICAgKw0KICAgICsmZm1jIHsNCiAgICArCXN0YXR1cyA9ICJva2F5IjsNCiAgICArCWZsYXNoQDAg
ew0KICAgICsJCXN0YXR1cyA9ICJva2F5IjsNCiAgICArCQltMjVwLGZhc3QtcmVhZDsNCiAgICAr
CQlsYWJlbCA9ICJibWMiOw0KICAgICsjaW5jbHVkZSAib3BlbmJtYy1mbGFzaC1sYXlvdXQuZHRz
aSINCiAgICArCX07DQogICAgK307DQogICAgKw0KICAgICsmc3BpMSB7DQogICAgKwlzdGF0dXMg
PSAib2theSI7DQogICAgKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KICAgICsJcGluY3Ry
bC0wID0gPCZwaW5jdHJsX3NwaTFfZGVmYXVsdD47DQogICAgKw0KICAgICsJZmxhc2hAMCB7DQog
ICAgKwkJc3RhdHVzID0gIm9rYXkiOw0KICAgICsJCW0yNXAsZmFzdC1yZWFkOw0KICAgICsJCWxh
YmVsID0gInBub3IiOw0KICAgICsJfTsNCiAgICArfTsNCiAgICArDQogICAgKyZ1YXJ0NSB7DQog
ICAgKwlzdGF0dXMgPSAib2theSI7DQogICAgK307DQogICAgKw0KICAgICsmbWFjMCB7DQogICAg
KwlzdGF0dXMgPSAib2theSI7DQogICAgKw0KICAgICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsNCiAgICArCXBpbmN0cmwtMCA9IDwmcGluY3RybF9ybWlpMV9kZWZhdWx0PjsNCiAgICArCXVz
ZS1uY3NpOw0KICAgICt9Ow0KICAgICsNCiAgICArJm1hYzEgew0KICAgICsJc3RhdHVzID0gIm9r
YXkiOw0KICAgICsNCiAgICArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQogICAgKwlwaW5j
dHJsLTAgPSA8JnBpbmN0cmxfcmdtaWkyX2RlZmF1bHQgJnBpbmN0cmxfbWRpbzJfZGVmYXVsdD47
DQogICAgK307DQogICAgKw0KICAgICsmaTJjNiB7DQogICAgKwlzdGF0dXMgPSAib2theSI7DQog
ICAgKw0KICAgICsJdG1wNDIxQDRlIHsNCiAgICArCSAgICAgICAgY29tcGF0aWJsZSA9ICJ0aSx0
bXA0MjEiOw0KICAgICsJCXJlZyA9IDwweDRlPjsNCiAgICArCX07DQogICAgKw0KICAgICsJdG1w
MTEyQDQ4IHsNCiAgICArCQljb21wYXRpYmxlID0gInRpLHRtcDExMiI7DQogICAgKwkJcmVnID0g
PDB4NDg+Ow0KICAgICsJfTsNCiAgICArCQ0KICAgICsJZWVwcm9tQDU0IHsNCiAgICArCQljb21w
YXRpYmxlID0gImF0bWVsLDI0YzY0IjsNCiAgICArICAgIAkJcmVnID0gPDB4NTQ+OyANCiAgICAr
CQlwYWdlc2l6ZSA9IDwzMj47DQogICAgKwl9Ow0KICAgICt9Ow0KICAgICsNCiAgICArJmkyYzcg
ew0KICAgICsJc3RhdHVzID0gIm9rYXkiOw0KICAgICsNCiAgICArCWFkbTEyNzhAMTEgew0KICAg
ICsJCSAgY29tcGF0aWJsZSA9ICJhZGksYWRtMTI3OCI7DQogICAgKwkJICByZWcgPSA8MHgxMT47
DQogICAgKwl9Ow0KICAgICt9Ow0KICAgICsNCiAgICArJmdmeCB7DQogICAgKwlzdGF0dXMgPSAi
b2theSI7DQogICAgK307DQogICAgKw0KICAgICsmcGluY3RybCB7DQogICAgKwlhc3BlZWQsZXh0
ZXJuYWwtbm9kZXMgPSA8JmdmeCAmbGhjPjsNCiAgICArfTsNClRoaXMgcGluY3RybCBkZWZpbml0
aW9uIGlzIG5vdCByZXF1aXJlZCBhcyBpdCBpcyBhbHJlYWR5IGRlZmluZWQgaW4gYXNwZWVkLWc1
LmR0c2kuDQogICAgKw0KICAgICsmcHdtX3RhY2hvIHsNCiAgICArCXN0YXR1cyA9ICJva2F5IjsN
CiAgICArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQogICAgKwlwaW5jdHJsLTAgPSA8JnBp
bmN0cmxfcHdtMF9kZWZhdWx0ICZwaW5jdHJsX3B3bTFfZGVmYXVsdD47DQogICAgKw0KICAgICsJ
ZmFuQDAgew0KICAgICsgICAJCXJlZyA9IDwweDAwPjsNCiAgICArICAgCQlhc3BlZWQsZmFuLXRh
Y2gtY2ggPSAvYml0cy8gOCA8MHgwMCAweDAxPjsgIA0KICAgICsgCX07DQogICAgKw0KICAgICsg
CWZhbkAxIHsNCiAgICArICAgCQlyZWcgPSA8MHgwMT47DQogICAgKyAgIAkJYXNwZWVkLGZhbi10
YWNoLWNoID0gL2JpdHMvIDggPDB4MDIgMHgwMz47DQogICAgKyAJfTsNCiAgICArfTsNCiAgICAr
DQogICAgKyZhZGMgew0KICAgICsJc3RhdHVzID0gIm9rYXkiOw0KICAgICt9Ow0KICAgIC0tIA0K
ICAgIDIuNy40DQogICAgDQogICAgDQoNCg==
