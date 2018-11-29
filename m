Return-Path: <prvs=5871f85f81=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5871f85f81=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="XjJkSGvT"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="dVeyjl4p"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 435RGC16fzzDrGv
 for <openbmc@lists.ozlabs.org>; Fri, 30 Nov 2018 05:42:20 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wATIbPhB019428; Thu, 29 Nov 2018 10:42:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=WjZNmYZS9yUHlAQME1bujTMIr6tmH9bciejPBJ0WK3E=;
 b=XjJkSGvTVgx/NLgHb+UR1WBFAs68/CKVdLuUS82coFiVpxZTkAbXdZ3tZPFvbdl2hwul
 LQLZwZaZPmjghaw+5kuGbYdWx8SPbMmeRB/qU1uY1Mk9kT6xa8OIVxeBKrWSzrGhIuj1
 mvSplEgwRjLNbO3XeHt7BInjy2HWoohfAfw= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2p2hyy907b-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 29 Nov 2018 10:42:16 -0800
Received: from frc-mbx08.TheFacebook.com (2620:10d:c0a1:f82::32) by
 frc-hub03.TheFacebook.com (2620:10d:c021:18::173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 29 Nov 2018 10:42:16 -0800
Received: from frc-hub05.TheFacebook.com (2620:10d:c021:18::175) by
 frc-mbx08.TheFacebook.com (2620:10d:c0a1:f82::32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 29 Nov 2018 10:42:16 -0800
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.75) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Thu, 29 Nov 2018 10:42:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjZNmYZS9yUHlAQME1bujTMIr6tmH9bciejPBJ0WK3E=;
 b=dVeyjl4pWorETsWhfu9iHurWSQHrKHI21REMWkubNYr6IMyBjIDzfXV8QooIwS/O022Ibpz/JKd7O24K8sWiKXAfmaF31lApdAAcBsGL7MYES2kUgQl8jlUckUMbhnIhvlSYcurPAf6l9hbxHQPaZKUuxMkW+t8wkIm4b074nOU=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1639.namprd15.prod.outlook.com (10.175.120.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1361.16; Thu, 29 Nov 2018 18:42:15 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::19df:d934:b961:5442]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::19df:d934:b961:5442%5]) with mapi id 15.20.1382.017; Thu, 29 Nov 2018
 18:42:15 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, qianlihu
 <wangzhiqiang8906@gmail.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [HELP] ipmi-kcs didn't work
Thread-Topic: [HELP] ipmi-kcs didn't work
Thread-Index: AQHUfAaAMP2kbKDNOUGRurHcg5+B4KVPg+eAgACO1QCAASihgIAVbPaA
Date: Thu, 29 Nov 2018 18:42:14 +0000
Message-ID: <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
In-Reply-To: <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:4888]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1639;
 20:myH75qnzPLdf54GwHDChOHbNzAAljMlq5zyuMDyyFmY6PYYvqu/pka49FwKQfUnQ8lUXHDgvP21VhaoGkSzvzGMbUyTheghCwx0ISdWrw+ideF9jnp3oZhlHWd5KEjFVwE0wccpaS/LArSsdy8Ns82T8il6hTjZE37c3uENZkPg=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 6c637d78-4c95-406e-fa23-08d6562a61e8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1639; 
x-ms-traffictypediagnostic: CY4PR15MB1639:
x-microsoft-antispam-prvs: <CY4PR15MB1639399BA75E9716ACE7349EDDD20@CY4PR15MB1639.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3231453)(999002)(11241501185)(944501410)(52105112)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1639; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1639; 
x-forefront-prvs: 0871917CDA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(376002)(39860400002)(136003)(199004)(189003)(86362001)(25786009)(6486002)(99286004)(2616005)(76176011)(4326008)(36756003)(486006)(14454004)(446003)(165073002)(305945005)(6246003)(6116002)(110136005)(11346002)(6512007)(316002)(6436002)(46003)(97736004)(5660300001)(7736002)(476003)(71200400001)(71190400001)(83716004)(81166006)(81156014)(53936002)(82746002)(229853002)(8936002)(105586002)(106356001)(39060400002)(2906002)(68736007)(186003)(6506007)(256004)(102836004)(8676002)(93886005)(478600001)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1639;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: TrrdEgaFNrJMK3cnpj7gKCUKo5yaYNan7xp53EQIANIgMQpBa4sssOOnkBeKtjjM9/kTl0AxZaE1JzxAEUFl5buF5UPK40yt83Yzl/qxyeebQ9twuI/lrQEiRjtwIvGGP1xN0W3nMZQU3ZJdmcHi4ZrXXotANlJvikwigupy+hNi7mv0hjwHfGNUPMj/L7fhA5IKKgOK/UBgn+eyP+qOuxUIfRFHxfyeheNKuP/GHNW9wc0DCfeoH1r3d3wlXmXN281lB3Dy4iQ7Tx8seuEa4oyKBqqOSX7zbBZsjTcF8wszdaPUeFyNfF2h3ya5PfcE7TG0sZr9Js4cHuuj5izD8kYpFilkKwK/NAyk1qe/xh8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3BE22DBA66C1E49BFB7DD9409F2D6B0@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c637d78-4c95-406e-fa23-08d6562a61e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2018 18:42:14.9316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1639
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-29_11:, , signatures=0
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
X-List-Received-Date: Thu, 29 Nov 2018 18:42:28 -0000

ICAgIFRyeSBiZWxvdyBmaXggb24gY2xrLWFzcGVlZC5jDQogICAgDQogICAgZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY2xrL2Nsay1hc3BlZWQuYyBiL2RyaXZlcnMvY2xrL2Nsay1hc3BlZWQuYw0KICAg
IGluZGV4IDU5NjEzNjc5M2ZjNC4uYjU1ZDM1ZTNlYjVlIDEwMDY0NA0KICAgIC0tLSBhL2RyaXZl
cnMvY2xrL2Nsay1hc3BlZWQuYw0KICAgICsrKyBiL2RyaXZlcnMvY2xrL2Nsay1hc3BlZWQuYw0K
ICAgIEBAIC05NSw3ICs5NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX2dhdGVfZGF0
YSBhc3BlZWRfZ2F0ZXNbXSA9IHsNCiAgICAgICAgICAgICBbQVNQRUVEX0NMS19HQVRFX0RDTEtd
ID0gICAgICAgIHsgIDUsIC0xLCAiZGNsay1nYXRlIiwgDQogICAgTlVMTCwgICBDTEtfSVNfQ1JJ
VElDQUwgfSwgLyogREFDICovDQogICAgICAgICAgICAgW0FTUEVFRF9DTEtfR0FURV9SRUZDTEtd
ID0gICAgICB7ICA2LCAtMSwgInJlZmNsay1nYXRlIiwgDQogICAgImNsa2luIiwgQ0xLX0lTX0NS
SVRJQ0FMIH0sDQogICAgICAgICAgICAgW0FTUEVFRF9DTEtfR0FURV9VU0JQT1JUMkNMS10gPSB7
ICA3LCAgMywgInVzYi1wb3J0Mi1nYXRlIiwgDQogICAgTlVMTCwgICAwIH0sIC8qIFVTQjIuMCBI
b3N0IHBvcnQgMiAqLw0KICAgIC0gICAgICAgW0FTUEVFRF9DTEtfR0FURV9MQ0xLXSA9ICAgICAg
ICB7ICA4LCAgNSwgImxjbGstZ2F0ZSIsIA0KICAgIE5VTEwsICAgMCB9LCAvKiBMUEMgKi8NCiAg
ICArICAgICAgIFtBU1BFRURfQ0xLX0dBVEVfTENMS10gPSAgICAgICAgeyAgOCwgIDUsICJsY2xr
LWdhdGUiLCANCiAgICBOVUxMLCAgIENMS19JU19DUklUSUNBTCB9LCAvKiBMUEMgKi8NCiAgICAg
ICAgICAgICBbQVNQRUVEX0NMS19HQVRFX1VTQlVIQ0lDTEtdID0gIHsgIDksIDE1LCAidXNiLXVo
Y2ktZ2F0ZSIsIA0KICAgIE5VTEwsICAgMCB9LCAvKiBVU0IxLjEgKHJlcXVpcmVzIHBvcnQgMiBl
bmFibGVkKSAqLw0KICAgICAgICAgICAgIFtBU1BFRURfQ0xLX0dBVEVfRDFDTEtdID0gICAgICAg
eyAxMCwgMTMsICJkMWNsay1nYXRlIiwgDQogICAgTlVMTCwgICAwIH0sIC8qIEdGWCBDUlQgKi8N
CiAgICAgICAgICAgICBbQVNQRUVEX0NMS19HQVRFX1lDTEtdID0gICAgICAgIHsgMTMsICA0LCAi
eWNsay1nYXRlIiwgDQogICAgTlVMTCwgICAwIH0sIC8qIEhBQyAqLw0KICAgIA0KICAgIEluIG15
IGV4cGVyaW1lbnRzIG9uIG15IHN5c3RlbSwgTENMSyB3YXMgbm90IGVuYWJsZWQgZHVlIHRvIHRo
ZSBudWxsDQogICAgcGFyZW50IGRlcGVuZGVuY3kgc28gSSBhZGRlZCBDTEtfSVNfQ1JJVElDQUwg
ZmxhZyB0byBlbmFibGUgdGhlIGNsay4NCiAgICANCiAgICBMUEMgaW50ZXJmYWNlIGlzIGRlZmF1
bHQgcGluIHBhZCBzZXR0aW5nIG9mIEFTVDI1MDAgc28geW91IG1pZ2h0IG5vdA0KICAgIG5lZWQg
YSBwaW5jdHJsIHNldHRpbmcgb24gaXQgaWYgeW91IGRpZG4ndCBjaGFuZ2UgaXQncyBwaW4gcGFk
cyB0byBHUElPDQogICAgb3IgZVNQSS4NCiAgICANCiAgICBDaGVlcnMsDQogICAgSmFlDQoNCkph
ZSwNCkFyZSB5b3UgcGxhbm5pbmcgdG8gdXBzdHJlYW0gdGhpcyBwYXRjaCBhcyBpdCBpcyBuZWVk
ZWQgZm9yIGtjc2JyaWRnZSB0byB3b3JrLiBBbHNvIGFzcGVlZC1nNSBkdHNpIGZpbGUuDQoNClJl
Z2FyZHMNCi1WaWpheQ0KICAgIA0KDQo=
