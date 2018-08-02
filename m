Return-Path: <prvs=1752dec091=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1752dec091=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="iQGvi7Qt"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="U2TsM352"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41h0tB1KD3zF1pj
 for <openbmc@lists.ozlabs.org>; Thu,  2 Aug 2018 16:40:29 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w726c1xh024647; Wed, 1 Aug 2018 23:40:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=5/5rXsyySxY8UIGPDm976dLfRU6CePbgM4qC7bL7b4Y=;
 b=iQGvi7Qt1ZBoCpf6DiCnCvLyz5WNxFmys43dljnm8fSvVZ1oym2QUDl8t57JyspMpH53
 TBlHwsk1atkJcobbt7zGagIAOr+zqH3rh2mTQ9ClVvsTB6xRfxNYgakVbHXpgT2fa8hj
 kDsmNIzZx/Ivv6ECaFP/fW33XPHsD5Lmc9Q= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2kkrgf8fm2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 01 Aug 2018 23:40:23 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.32) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Thu, 2 Aug 2018 02:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/5rXsyySxY8UIGPDm976dLfRU6CePbgM4qC7bL7b4Y=;
 b=U2TsM352afCDzFTSXfk1D/mD7fRSNEIO6DJpdCRHjHMp+oiOdKloNP3/wbwBetu1QdGDDlf3ZstaSVFh6/Q69PL0TwjgHuT4y2dvb9CX8dBMe/TVBbT52K3RwuyAqsNPEX1OytJM5gwi7AfuplkvFT+FIvPyfg978gIO8EgIuN8=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1822.namprd15.prod.outlook.com (10.174.255.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.995.19; Thu, 2 Aug 2018 06:40:04 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::690b:92ff:d1f3:2da]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::690b:92ff:d1f3:2da%12]) with mapi id 15.20.0995.020; Thu, 2 Aug 2018
 06:40:03 +0000
From: Tao Ren <taoren@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: ast2500 reboot got stuck in timeriomem_rng_probe()
Thread-Topic: ast2500 reboot got stuck in timeriomem_rng_probe()
Thread-Index: AQHUKbpHnzGuT9ti0kGkvwXW4hGNOaSrsEsA///eMIA=
Date: Thu, 2 Aug 2018 06:40:03 +0000
Message-ID: <6DC57734-2809-496B-80B4-667E86CA896F@fb.com>
References: <C04B2AA7-9D6E-4D23-AB86-E793E0A676BA@fb.com>
 <1533174064.793946.1460645152.741D3540@webmail.messagingengine.com>
In-Reply-To: <1533174064.793946.1460645152.741D3540@webmail.messagingengine.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:180::1:6c8c]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1822;
 20:MlKyLH3sdRuPWCm+hJ3AgEs8cxpmstcZ52YPE0EPg4ZYAFnB/yYDYiNg2HF11aA8crDuR7O/hEoM3eStY7jIiqazAsAWHovalVNp+59X2f9YB8dsn/kaaGE/CfYJHh4eSYSf+xV4pHYsASfwXq4muj59ohGCd3JGRXAG7LGhOHU=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: ec939e8e-80f2-4830-3d44-08d5f842c766
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(49563074)(7193020);
 SRVR:MWHPR15MB1822; 
x-ms-traffictypediagnostic: MWHPR15MB1822:
x-microsoft-antispam-prvs: <MWHPR15MB1822F377B1F3C5AB513320ECB22C0@MWHPR15MB1822.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(81227570615382);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(102415395)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231311)(11241501184)(944501410)(52105095)(3002001)(10201501046)(149027)(150027)(6041310)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
 SRVR:MWHPR15MB1822; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1822; 
x-forefront-prvs: 07521929C1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(366004)(136003)(39860400002)(396003)(199004)(189003)(83716003)(81166006)(6486002)(81156014)(6436002)(86362001)(106356001)(105586002)(6506007)(99286004)(82746002)(186003)(478600001)(6116002)(8936002)(46003)(8676002)(229853002)(6512007)(68736007)(446003)(99936001)(2906002)(6246003)(53936002)(476003)(14454004)(5660300001)(102836004)(316002)(110136005)(33656002)(97736004)(2616005)(7736002)(305945005)(2900100001)(486006)(14444005)(11346002)(76176011)(5250100002)(256004)(5024004)(36756003)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1822;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 2mU5tVDMy6iIGfQmMstCGKzyykC90E8DJi6zI12lr5cDF9jYhZFjo2+3yNn/dcF6ltHfImnzoiX83/MTP/Dwdhyyh1gvhy0Z7JtVO3qPdwGgOO3TMCOcLjxnWdkFpbQMjwn5hHD3mHC4Mrr1el8g6am9kG0Y1oiDf6WYIdKzfo2XmKLqOmNsZ5cqQCKf4jYRlqxb15fGScP0CFFY2eXemAy8XoBEj0gs2fCVnwkUzHs0gPmRMeDV5W5XCX3eDsNgeNKWryoEqQfMAygKah/CTkfBvBtZCqvE5IxYaG9rZXaUZxoVQYICEGqbH8jxGOToM3vIGUmjRPTrmJRKlqstPXsVGdhl1B7NTYZK8RafHww=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/mixed;
 boundary="_002_6DC577342809496B80B4667E86CA896Ffbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ec939e8e-80f2-4830-3d44-08d5f842c766
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2018 06:40:03.8078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1822
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-02_01:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2018 06:40:35 -0000

--_002_6DC577342809496B80B4667E86CA896Ffbcom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <9020D6789E113F4296D08C06D8E1E760@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PiBDYW4geW91IHNob3cgdXMgeW91ciBkZXZpY2V0cmVlIHBhdGNoPyBUaGUgb25seSB0aGluZ3Mg
SSBjYW4gdGhpbmsgb2YgYXJlDQo+IGlmIHlvdSBkaWRuJ3Qgc3BlY2lmeSB0aGUgJ3F1YWxpdHkn
IGF0dHJpYnV0ZSAoaWYgeW91IGRvbid0IHRoZSBxdWFsaXR5IGRlZmF1bHRzDQo+IHRvIDAsIHdo
aWNoIG1hcmtzIHRoZSBkZXZpY2UgYXMgZGlzYWJsZWQgaW4gdGhlIGh3cm5nIGRldmljZSBsaXN0
KSwgb3IgaWYNCiA+IHlvdSBzZXQgYSByZWFsbHkgbG9uZyBwZXJpb2QgKGJ1dCBJIGFzc3VtZSB5
b3UgY291bGQgaGF2ZSBzb3J0ZWQgdGhhdCBvdXQNCiA+IHlvdXJzZWxmIDopKS4NCg0KVGhhbmsg
eW91IEFuZHJldyBmb3IgdGhlIHJlc3BvbnNlLiBJJ20gdXNpbmcgdGhlIGRlZmF1bHQgc2V0dGlu
Z3MgaW4gYXNwZWVkLWc1LmR0c2k6DQogICAgLSBwZXJpb2QgPSA8MT47DQogICAgLSBxdWFsaXR5
ID0gPDEwMD47DQoNCkFmdGVyIHNvbWUgaW52ZXN0aWdhdGlvbiwgSSBoaWdobHkgc3VzcGVjdCBp
dCdzIGJlY2F1c2Ugc29tZSBwYXJ0KHMpIG9mIHRoZSBjaGlwIGFyZSBub3QgcmVzZXQgcHJvcGVy
bHksIGJlY2F1c2U6DQogICAxKSB0aGUgcHJvYmxlbSBvbmx5IGhhcHBlbnMgZHVyaW5nIHdhcm4g
cmVib290OiBjb2xkIGJvb3Qgd29ya3MgZmluZS4NCiAgIDIpIGJvb3R1cCBoYW5ncyBhdCBhIGRp
ZmZlcmVudCBwbGFjZSBpZiBJIGRpc2FibGUgSFdfUkFORE9NX1RJTUVSSU9NRU0uDQogICAzKSB0
aGUgaXNzdWUgaXMgZ29uZSBpZiBJIHVwZGF0ZSBhc3BlZWQgd2F0Y2hkb2cgcmVzZXQgdHlwZSB0
byBzeXN0ZW0gKGFzcGVlZCxyZXNldC10eXBlID0gInN5c3RlbSIpIGluIGR0cyBmaWxlLg0KDQpB
dHRhY2hlZCB0aGUgZGV2aWNlIHRyZWUgZm9yIHlvdXIgcmVmZXJlbmNlLCBhbmQgSSB3aWxsIHJl
ZmluZSB0aGUgZmlsZSBhbmQgc2VuZCBvdXQgcmV2aWV3IHNvb24uDQoNCg0KVGhhbmtzLA0KDQpU
YW8NCg0K77u/T24gOC8xLzE4LCA2OjQxIFBNLCAiQW5kcmV3IEplZmZlcnkiIDxhbmRyZXdAYWou
aWQuYXU+IHdyb3RlOg0KDQogICAgSGkgVGFvLA0KICAgIA0KICAgIE9uIFRodSwgMiBBdWcgMjAx
OCwgYXQgMDI6MzgsIFRhbyBSZW4gd3JvdGU6DQogICAgPiBIaSwNCiAgICA+IA0KICAgID4gSeKA
mW0gdXBncmFkaW5nIGZhY2Vib29rIGNtbS1ibWMgKGFzdDI1MDApIGZyb20gNC4xIHRvIG9wZW5i
bWMgbGludXggDQogICAgPiA0LjE3LjIsIGFuZCB3aGVuIEkgdHJpZWQgdG8gcmVib290IGxpbnV4
IDQuMTcsIHN5c3RlbSBnb3Qgc3R1Y2sgaW4gIA0KICAgID4gdGltZXJpb21lbV9ybmdfcHJvYmUo
KSBmdW5jdGlvbiBkdXJpbmcgYm9vdCB1cC4gRGlkIGFueW9uZSBoaXQgdGhlIA0KICAgID4gc2lt
aWxhciBpc3N1ZSBiZWZvcmU/IFdoYXQgd291bGQgYmUgdGhlIHJlY29tbWVuZGVkIHNvbHV0aW9u
Pw0KICAgID4gDQogICAgDQogICAgQ2FuIHlvdSBzaG93IHVzIHlvdXIgZGV2aWNldHJlZSBwYXRj
aD8gVGhlIG9ubHkgdGhpbmdzIEkgY2FuIHRoaW5rIG9mIGFyZQ0KICAgIGlmIHlvdSBkaWRuJ3Qg
c3BlY2lmeSB0aGUgJ3F1YWxpdHknIGF0dHJpYnV0ZSAoaWYgeW91IGRvbid0IHRoZSBxdWFsaXR5
IGRlZmF1bHRzDQogICAgdG8gMCwgd2hpY2ggbWFya3MgdGhlIGRldmljZSBhcyBkaXNhYmxlZCBp
biB0aGUgaHdybmcgZGV2aWNlIGxpc3QpLCBvciBpZg0KICAgIHlvdSBzZXQgYSByZWFsbHkgbG9u
ZyBwZXJpb2QgKGJ1dCBJIGFzc3VtZSB5b3UgY291bGQgaGF2ZSBzb3J0ZWQgdGhhdCBvdXQNCiAg
ICB5b3Vyc2VsZiA6KSkuDQogICAgDQogICAgQ2hlZXJzLA0KICAgIA0KICAgIEFuZHJldw0KICAg
IA0KDQo=

--_002_6DC577342809496B80B4667E86CA896Ffbcom_
Content-Type: application/octet-stream; name="aspeed-bmc-fb-cmm.dts"
Content-Description: aspeed-bmc-fb-cmm.dts
Content-Disposition: attachment; filename="aspeed-bmc-fb-cmm.dts"; size=1927;
	creation-date="Thu, 02 Aug 2018 06:40:03 GMT";
	modification-date="Thu, 02 Aug 2018 06:40:03 GMT"
Content-ID: <8844A0C89087524682644BF8BC275AB4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArCi9kdHMtdjEvOwoKI2luY2x1ZGUg
ImFzcGVlZC1nNS5kdHNpIgoKLyB7Cgltb2RlbCA9ICJGYWNlYm9vayBHYWxheHkgQ2hhc3NpcyBN
YW5hZ2VtZW50IE1vZHVsZSI7Cgljb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNTAwIjsKCglhbGlh
c2VzIHsKCQkvKgoJCSAqIE92ZXJyaWRlIHRoZSBkZWZhdWx0IHNlcmlhbCBhbGlhc2VzIGluIGFz
cGVlZC1nNS5kdHNpCgkJICogdG8gbWFrZSBzdXJlIC9kZXYvdHR5UyogYXJlIG1hcHBlZCB0byB0
aGUgc2FtZSB1YXJ0CgkJICogd2l0aCBjbW0ga2VybmVsIDQuMS4KCQkgKi8KCQlzZXJpYWwwID0g
JnVhcnQ1OwoJCXNlcmlhbDEgPSAmdWFydDE7CgkJc2VyaWFsMiA9ICZ1YXJ0MzsKCQlzZXJpYWwz
ID0gJnVhcnQ0OwoKCQkvKgoJCSAqIFRoZSBwdXJwb3NlIG9mIGFkZGluZyAiaTJjMTUiIGFsaWFz
IGlzIHRvIG1ha2Ugc3VyZQoJCSAqIGR5bmFtaWMgYnVzIG51bWJlciAoYXNzaWduZWQgdG8gaTJj
LW11eGVzKSBzdGFydHMKCQkgKiBmcm9tIDE2LCBhbmQgdGhpcyBpcyBiZWNhdXNlIHdlIGhhdmUg
dG9vIG1hbnkgdXNlcgoJCSAqIGxldmVsIGFwcGxpY2F0aW9ucyBhc3N1bWluZyBpMmMtbXV4LWJ1
cy1udW0gc3RhcnRzCgkJICogZnJvbSAxNi4KCQkgKi8KCQlpMmMxNSA9ICZpMmMxMDsKCX07CgoJ
Y2hvc2VuIHsKCQlzdGRvdXQtcGF0aCA9ICZ1YXJ0MTsKCQlib290YXJncyA9ICJjb25zb2xlPXR0
eVMxLDk2MDBuOCByb290PS9kZXYvcmFtIHJ3IGVhcmx5cHJpbnRrIjsKCX07CgoJbWVtb3J5QDgw
MDAwMDAwIHsKCQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwoJCXJlZyA9IDwweDgwMDAwMDAwIDB4
MjAwMDAwMDA+OwoJfTsKfTsKCi8qCiAqIEJvdGggd2R0MSBhbmQgd2R0MiBhcmUgZW5hYmxlZCBp
biBhc3BlZWQtZzUuZHRzaSBidXQgd2UganVzdCBuZWVkCiAqIHRoZSBmaXJzdCB3YXRjaGRvZyAo
d2R0MSk7IHRodXMgbGV0J3MgZGlzYWJsZSB3ZHQyIGV4cGxpY2l0bHkuCiAqLwomd2R0MiB7Cglz
dGF0dXMgPSAiZGlzYWJsZWQiOwp9OwoKJmZtYyB7CglzdGF0dXMgPSAib2theSI7CglmbGFzaEAw
IHsKCQlzdGF0dXMgPSAib2theSI7CgkJbTI1cCxmYXN0LXJlYWQ7CgkJbGFiZWwgPSAiYm1jIjsK
I2luY2x1ZGUgImZiLWJtYy1mbGFzaC1sYXlvdXQuZHRzaSIKCX07Cn07CgomdWFydDEgewoJc3Rh
dHVzID0gIm9rYXkiOwp9OwoKJnVhcnQzIHsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZ1YXJ0NCB7
CglzdGF0dXMgPSAib2theSI7Cn07CgomdWFydDUgewoJc3RhdHVzID0gIm9rYXkiOwp9OwoKLyoK
ICogTm90ZSBtYWMxIGlzIGFjdHVhbGx5IHRoZSBzZWNvbmQgbWFjIGNvbnRyb2xsZXIgKDB4MWU2
ODAwMDApIGJlY2F1c2UKICogbWFjIGxhYmVsIGlzIDAtYmFzZWQgKG1hYzAgbWFwcGluZyB0byAw
eDFlNjYwMDAwKSBpbiBhc3BlZWQtZzUuZHRzaS4KICovCiZtYWMxIHsKCXN0YXR1cyA9ICJva2F5
IjsKCgluby1ody1jaGVja3N1bTsKCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CglwaW5jdHJs
LTAgPSA8JnBpbmN0cmxfcmdtaWkyX2RlZmF1bHQgJnBpbmN0cmxfbWRpbzJfZGVmYXVsdD47Cn07
CgomaTJjMCB7CglzdGF0dXMgPSAib2theSI7Cn07CgomaTJjMSB7CglzdGF0dXMgPSAib2theSI7
Cn07CgomaTJjMiB7CglzdGF0dXMgPSAib2theSI7Cn07CgomaTJjMyB7CglzdGF0dXMgPSAib2th
eSI7Cn07CgomaTJjNCB7CglzdGF0dXMgPSAib2theSI7Cn07CgomaTJjNSB7CglzdGF0dXMgPSAi
b2theSI7Cn07CgomaTJjNiB7CglzdGF0dXMgPSAib2theSI7Cn07CgomaTJjNyB7CglzdGF0dXMg
PSAib2theSI7Cn07CgomaTJjOCB7CglzdGF0dXMgPSAib2theSI7Cn07CgomaTJjMTMgewoJc3Rh
dHVzID0gIm9rYXkiOwp9OwoKJmFkYyB7CglzdGF0dXMgPSAib2theSI7Cn07Cg==

--_002_6DC577342809496B80B4667E86CA896Ffbcom_--
