Return-Path: <prvs=58727e8b49=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=58727e8b49=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="O2oiPtML"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="EGORCcQy"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4363Yn48lbzDrPd
 for <openbmc@lists.ozlabs.org>; Sat,  1 Dec 2018 05:58:00 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAUIp0HA027846; Fri, 30 Nov 2018 10:57:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=63F1g88fqzvtYCx1RdHysbBrgYF67wFltrHInZU7zG0=;
 b=O2oiPtMLOEsetkdiW57Vpy1zOf66ZnXIAIujtCo4lMOATYFPTvnZ7n0UobAwT49Eab/g
 PpZiLdLC+j3oWSGvgKhf+e2LT5t5W0cgOSgVJJBaU1968z1+pvNR+gs9fu2fIpUEP2kA
 WiXLkGgIA3Aic9Ky9A9Y2BbbFLr4lHQ9P4k= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2p3agn833y-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 30 Nov 2018 10:57:58 -0800
Received: from frc-mbx08.TheFacebook.com (2620:10d:c0a1:f82::32) by
 frc-hub04.TheFacebook.com (2620:10d:c021:18::174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 30 Nov 2018 10:57:57 -0800
Received: from frc-hub04.TheFacebook.com (2620:10d:c021:18::174) by
 frc-mbx08.TheFacebook.com (2620:10d:c0a1:f82::32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 30 Nov 2018 10:57:56 -0800
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.74) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Fri, 30 Nov 2018 10:57:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63F1g88fqzvtYCx1RdHysbBrgYF67wFltrHInZU7zG0=;
 b=EGORCcQyJy3ocrV48sjoIziqsrzIslmsermCctjUU36C1yvMrZ3D5c11Uw89Cb1ViBvdiBdFGwITZZjHoGhnmkQ15pNCcISpor8CMirrJrdDDWP/yylbJ4hZytBVGa5QOZW5J90XYec+WEoJ2HWNkRZWeFyxii+k9z+usQhg/AM=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1751.namprd15.prod.outlook.com (10.174.53.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.21; Fri, 30 Nov 2018 18:57:55 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::19df:d934:b961:5442]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::19df:d934:b961:5442%5]) with mapi id 15.20.1382.020; Fri, 30 Nov 2018
 18:57:55 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Samuel Jiang
 <chyishian.jiang@gmail.com>, qianlihu <wangzhiqiang8906@gmail.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [HELP] ipmi-kcs didn't work
Thread-Topic: [HELP] ipmi-kcs didn't work
Thread-Index: AQHUfAaAMP2kbKDNOUGRurHcg5+B4KVPg+eAgACO1QCAASihgIAVbPaAgACKdwCAAIbQgIAA0d+A//+zjgA=
Date: Fri, 30 Nov 2018 18:57:54 +0000
Message-ID: <87C3DCC8-F773-46A0-B8EC-5E3DC5E3983F@fb.com>
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
 <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
 <e63c758f-2eec-9e28-9381-4e28d2d8bb64@linux.intel.com>
 <4780f022-1c80-4b53-9eb1-0e3fe313c6a2@Spark>
 <db5cfcea-972d-2f50-05f4-266ab2c8f310@linux.intel.com>
In-Reply-To: <db5cfcea-972d-2f50-05f4-266ab2c8f310@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:6414]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1751;
 20:lP7TVvR/sZSmVunKYqUfiGvb8r0Ufsdo8zi+tOtLuPJ3T98L6rw2zoHrSonNWlQNJvlqpRgPaeqS5PrJVZjvPiIvFOJ3jB2n1z5sy8qXRY33RB6xtkWFZkhGzPCGqZtZ7AWhHgdKeRTFK0WC/JaPFazd4ybCKX3buVQ7t/bnqbA=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 2a0acaa2-9dde-4aab-cb8f-08d656f5bcac
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1751; 
x-ms-traffictypediagnostic: CY4PR15MB1751:
x-microsoft-antispam-prvs: <CY4PR15MB1751E90A67AAFBA3DB9F44BEDDD30@CY4PR15MB1751.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231453)(999002)(11241501185)(944501410)(52105112)(93006095)(93001095)(3002001)(10201501046)(148016)(149066)(150057)(6041310)(20161123564045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1751; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1751; 
x-forefront-prvs: 087223B4DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(396003)(376002)(346002)(366004)(189003)(199004)(46003)(446003)(2616005)(476003)(53936002)(11346002)(86362001)(6246003)(106356001)(6436002)(25786009)(105586002)(14454004)(8936002)(256004)(486006)(93886005)(39060400002)(97736004)(6116002)(6512007)(6506007)(165073002)(110136005)(83716004)(186003)(2906002)(478600001)(4326008)(5660300001)(33656002)(71200400001)(8676002)(82746002)(81166006)(71190400001)(81156014)(7736002)(316002)(6486002)(76176011)(305945005)(68736007)(229853002)(99286004)(102836004)(36756003)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1751;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: AIKczdPwX2Ijwei7v8tXF8pI9MgZQECs08i7F51VpdgSLT1CHd7jn1N7Z0z4ksp/sTw5WBdoPMgc9KOJOaOZqJP33pO86dF+s82J/V86xX6axEJXJhv3mO4f57dAkcCci1wYOQAwbPu4V0XF2xMva3rnTBbQKEg3vWxYD8ueWKTdC97SrpX2TgZXQjjKe3ci85pDjSe3H1GGtj21X4fWUB0/xaWC7MhlDUQN6l0VOca+GxIqAdwPGTH7pLuJsYT+bsED4YRAyOloVxWJBRdGRFDlhWhiehOBZKwWfBQIcQrjr3BUVKjUCLsAWTc5azoc+ZHwWBi2ws4OCLQ9H3YPwBc83OCFFzFWom9OgI9vFqI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <74E5A01C2E59144493319BE33A9C0B8B@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0acaa2-9dde-4aab-cb8f-08d656f5bcac
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2018 18:57:55.0039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1751
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-30_09:, , signatures=0
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
X-List-Received-Date: Fri, 30 Nov 2018 18:58:06 -0000

DQrvu79PbiAxMS8zMC8xOCwgNzozMSBBTSwgIkphZSBIeXVuIFlvbyIgPGphZS5oeXVuLnlvb0Bs
aW51eC5pbnRlbC5jb20+IHdyb3RlOg0KDQogICAgT24gMTEvMjkvMjAxOCA5OjAwIFBNLCBTYW11
ZWwgSmlhbmcgd3JvdGU6DQogICAgPiBIaSBKYWUsDQogICAgPiANCiAgICA+IFdlIGFsc28gZW5j
b3VudGVyZWQgdGhlIHNhbWUgc2l0dWF0aW9uIGEgbW9udGggYWdvLg0KICAgID4gV2UgdHJ5IHRv
IGVuYWJsZSB0aGUgTFBDIGNsb2NrIG9uIGRldmljZXRyZWUgdG8gcmVzb2x2ZSB0aGlzIHByb2Js
ZW0gbm90IA0KICAgID4gZGlyZWN0IG1vZGlmeSBjbG9jayBkcml2ZXIuDQogICAgPiANCiAgICA+
IGxwY19jdHJsOiBscGMtY3RybEAwIHsNCiAgICA+IOKAgyBjb21wYXRpYmxlID0gImFzcGVlZCxh
c3QyNTAwLWxwYy1jdHJs4oCdOw0KICAgID4g4oCDIHJlZyA9IDwweDAgMHg4MD47DQogICAgPiDi
gIMgY2xvY2tzID0gPCZzeXNjb24gQVNQRUVEX0NMS19HQVRFX0xDTEs+Ow0KICAgID4gICAgICBz
dGF0dXMgPSDigJxva2F54oCdOw0KICAgID4gfTsNCiAgICA+IA0KICAgID4gSG93ZXZlciwgSeKA
mW0gbm90IHN1cmUgd2hpY2ggaXMgYmV0dGVyIGZvciBMUENfQ0xDSyBzZXR0aW5nLg0KICAgID4g
V2hldGhlciB3ZSBzaG91bGQgbW9kaWZ5IGRyaXZlciBpZiBvcmlnaW5hbCBkYXRhIGlzIGVuYWJs
ZWQgb3Igc2hvdWxkIA0KICAgID4gZW5hYmxlIG9uIHRoZSBkZXZpY2UgdHJlZSwgY29ycmVjdD8N
CiAgICA+IA0KICAgID4gDQogICAgDQogICAgSGkgU2FtdWVsLA0KICAgIA0KICAgIFllcywgeW91
IGFyZSByaWdodC4gSSByZWFsaXplZCB0aGF0IGtjc19ibWNfYXNwZWVkLmMgZG9lc24ndCBoYXZl
IGFueQ0KICAgIGNsb2NrIGNvbnRyb2wgY29kZSBzbyBhZGRpbmcgYSBjbG9ja3Mgc2V0dGluZyBp
bnRvIGtjcyBkdHNpIGNvZGUgZG9lc24ndA0KICAgIG1ha2UgYW55IGhlbHAuIEFsc28sIGl0IHdh
cyB0aGUgcmVhc29uIHdoeSB0aGUgY2hhbmdlIGlzIG5lZWRlZCBvbg0KICAgIGNsay1hc3BlZWQu
Yy4gRW5hYmxpbmcgbHBjX2N0cmwgbm9kZSB5b3Ugc3VnZ2VzdGVkIHNlZW1zIGEgcmlnaHQgd2F5
Lg0KICAgIA0KICAgIEhpIFZpamF5LA0KICAgIENhbiB5b3UgcGxlYXNlIHRyeSB0aGUgd2F5IFNh
bXVlbCBzdWdnZXN0ZWQgYWZ0ZXIgcmVtb3ZpbmcgY2hhbmdlcyBJDQogICAgZ2F2ZSB5b3UuIFNh
bXVlbCdzIHNvbHV0aW9uIGxvb2tzIGdvb2QgdG8gbWUuDQogICAgDQogICAgVGhhbmtzLA0KICAg
IEphZQ0KICAgIA0KSmFlLA0KSSBjYW4gdHJ5LiBXZSBjYW4gY2VydGFpbmx5IGVuYWJsZSBscGNf
Y3RybCBub2RlIGJ1dCBpbiBteSB1bmRlcnN0YW5kaW5nIHRoYXQgDQp3ZSBzdGlsbCBuZWVkIHRo
aXMgYmVsb3cgcGF0Y2ggdG8gcmVkZWZpbmUgQVNQRUVEX0NMS19HQVRFX0xDTEsgdmFsdWUgdG8g
DQphZGQgQ1JJVElDQUwuIEkgbWlnaHQgYmUgbWlzc2luZyBzb21ldGhpbmcgaGVyZS4NCiAgICAt
IFtBU1BFRURfQ0xLX0dBVEVfTENMS10gPSB7IDgsIDUsICJsY2xrLWdhdGUiLCBOVUxMLCAwIH0s
IC8qIExQQyAqLw0KICAgKyBbQVNQRUVEX0NMS19HQVRFX0xDTEtdID0geyA4LCA1LCAibGNsay1n
YXRlIiwgTlVMTCwgQ0xLX0lTX0NSSVRJQ0FMIH0sIC8qIExQQyAqLw0KDQoNClJlZ2FyZHMNCi1W
aWpheQ0KDQo=
