Return-Path: <prvs=5876031fb4=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5876031fb4=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="i8Vt17+R"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="AUNnqHjq"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 438f4J5tVQzDqSx
 for <openbmc@lists.ozlabs.org>; Wed,  5 Dec 2018 10:59:59 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id wB4NneL2015057;
 Tue, 4 Dec 2018 15:59:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=UV/1ewbpa5/txDv/u3An+wikchRGyUKf3ncxHmf2t/k=;
 b=i8Vt17+R7hMYeb6P6BZ66GEd4iLXLEk9PeY+U3xqn+ZIhiuIq0hc17gAARHcptBReq/k
 v2uEDcATHFS2FA0cGC6klEYycxy1QPMnu1KRgY4kucD+v5QoeIugtpUL3tuGQXOgRlOF
 CQNdK6B3WOMGgxFXOSNGZAo95AVbkld9nZQ= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2p62es07wc-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 04 Dec 2018 15:59:51 -0800
Received: from prn-mbx03.TheFacebook.com (2620:10d:c081:6::17) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 4 Dec 2018 15:59:50 -0800
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-mbx03.TheFacebook.com (2620:10d:c081:6::17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 4 Dec 2018 15:59:50 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 4 Dec 2018 15:59:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UV/1ewbpa5/txDv/u3An+wikchRGyUKf3ncxHmf2t/k=;
 b=AUNnqHjq4mVYUm66CFGbNo49Lrs+TDeM6z7i/d5D+ZQmFTT9UvjERSyio8U0doCPvcnSCBp/R6DVQVyRLldepqiZrZNGll7P7/O0QgC+xE3sHWuladfY27vEDs2Ax2v28lzL4Clv5DVT1gWBkpuTRR/YbRWwJ/SMkvRoXTORAVk=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1542.namprd15.prod.outlook.com (10.172.161.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.22; Tue, 4 Dec 2018 23:59:30 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1bd:fa86:857:9b04]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1bd:fa86:857:9b04%8]) with mapi id 15.20.1404.016; Tue, 4 Dec 2018
 23:59:30 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Samuel Jiang <chyishian.jiang@gmail.com>,
 qianlihu <wangzhiqiang8906@gmail.com>, Gary Hsu <gary_hsu@aspeedtech.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Jenmin Yuan
 <jenmin_yuan@aspeedtech.com>
Subject: Re: [HELP] ipmi-kcs didn't work
Thread-Topic: [HELP] ipmi-kcs didn't work
Thread-Index: AQHUfAaAMP2kbKDNOUGRurHcg5+B4KVPg+eAgACO1QCAASihgIAVbPaAgACKdwCAAIbQgIAA0d+A//+zjgCAAI7agP//rwCAgACNLoCAAQJWAIADPG2A//+4VwAAJyX2AAATwNwAAACIDIA=
Date: Tue, 4 Dec 2018 23:59:30 +0000
Message-ID: <D6923B46-D807-48AC-B007-2AFD3E72F8A9@fb.com>
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
 <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
 <e63c758f-2eec-9e28-9381-4e28d2d8bb64@linux.intel.com>
 <4780f022-1c80-4b53-9eb1-0e3fe313c6a2@Spark>
 <db5cfcea-972d-2f50-05f4-266ab2c8f310@linux.intel.com>
 <87C3DCC8-F773-46A0-B8EC-5E3DC5E3983F@fb.com>
 <660c304f-60eb-f54a-f3b7-4d6d4481a96a@linux.intel.com>
 <A9318AC7-EE0E-4B84-84D1-A16695EE3FC0@fb.com>
 <b20d590b-be35-046e-26c2-2c1b2456309a@linux.intel.com>
 <253b7d32-1230-4111-a6dc-a84afddcc679@Spark>
 <25e866d4-749c-902b-86b2-3d38975dcc65@linux.intel.com>
 <033266A0-B6C1-4BE7-BA3B-A6E319BDD8D5@fb.com>
 <d002c20bfe964463b1d7c305b12fdd70@TWMBX01.aspeed.com>
 <904db864-71c4-d4e6-e7fd-14df7820fb7b@linux.intel.com>
In-Reply-To: <904db864-71c4-d4e6-e7fd-14df7820fb7b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:60ce]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1542;
 20:N2NI33Bv9W5G8fRKnCyAnNzCKCRHKQTuaGnyXX4YQf+HEXktp0XugExyIDyTqO97wt20rfrZM6rqTv72VBbjOAqbv7UCuiDD+EnnxxPo9u7iYI4LwqI+AiXAZidOYUrJ/vNgzOmOJYk40we9u7UXKlA1K0YQ0Lc43ATX/HqNIiY=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: c6f92637-62ed-4bc8-57f4-08d65a448800
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1542; 
x-ms-traffictypediagnostic: CY4PR15MB1542:
x-microsoft-antispam-prvs: <CY4PR15MB15427090D41E893F0F674D37DDAF0@CY4PR15MB1542.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231455)(999002)(11241501185)(944501493)(52105112)(93006095)(93001095)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1542; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1542; 
x-forefront-prvs: 0876988AF0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(346002)(366004)(376002)(136003)(51914003)(189003)(199004)(81166006)(229853002)(6436002)(8676002)(39060400002)(36756003)(105586002)(106356001)(7736002)(4326008)(76176011)(6246003)(305945005)(6512007)(33656002)(46003)(11346002)(81156014)(478600001)(446003)(8936002)(99286004)(2616005)(6486002)(53936002)(5660300001)(476003)(486006)(68736007)(110136005)(83716004)(256004)(54906003)(82746002)(6116002)(93886005)(14444005)(2906002)(316002)(71190400001)(53546011)(102836004)(86362001)(14454004)(97736004)(165073002)(6506007)(71200400001)(186003)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1542;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: bis6UXoMTfd1/HaA6bwiwK3I0fkmsoWZVysiFVTyybhRQWIWwBBNMceLysp5ZV7oLg/wjjRbFh2A+yXu8vQwgTbdi7aSARkYWDWJj3QfYBvVOwSid27JspNB9tnDLegRTsZtIS7k3X6hCHlVi4dnUvrOHwNTSOYtWujg1Knn+FSsI35ZxzOGabHxdVoYVmE2ItWBl+FXBJyHNlwTIBsz/hwcXQGTmOI+fXuftfA3BSlOfhO3SZgJ66nTHQdAXWgiJRmtsvmme2mDUxet/4Y1jq/XIILn1RSPqddc+tElPfAfq4vO5kP5wO53dpk3HtvRSizpAomieSAtc0ETvqXArITypQX77wJch6CfpAas1Dw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <319F9F37A396684089814022E276F8C3@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f92637-62ed-4bc8-57f4-08d65a448800
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2018 23:59:30.4878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1542
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-04_10:, , signatures=0
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
X-List-Received-Date: Wed, 05 Dec 2018 00:00:02 -0000

DQoNCu+7v09uIDEyLzQvMTgsIDc6NDQgQU0sICJKYWUgSHl1biBZb28iIDxqYWUuaHl1bi55b29A
bGludXguaW50ZWwuY29tPiB3cm90ZToNCg0KICAgIE9uIDEyLzQvMjAxOCAxMjoxOCBBTSwgUnlh
biBDaGVuIHdyb3RlOg0KICAgID4gSGVsbG8gSmFlLA0KICAgID4gCUFTUEVFRCBMUEMgSVAgSFcg
YmxvY2sgaGF2ZSBzZXJ2YWwgY2xrIGlucHV0Lg0KICAgID4gCU1vc3QgaW1wb3J0YW50IGlzIExD
TEsgaXMgY29tZSBmcm9tIExQQyBIb3N0Lg0KICAgID4gCVRoZSBvdGhlcnMgaXMgbm90IGNvbnRy
b2xsYWJsZSBieSByZWdpc3Rlci4NCiAgICA+IFJ5YW4NCiAgICA+IA0KICAgIA0KICAgIEhpIFJ5
YW4sDQogICAgDQogICAgVGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24uIFNvIGNsb2NrIHNvdXJj
ZSBvZiBMQ0xLIGlzIGZyb20gZXh0ZXJuYWwNCiAgICB1c3VhbGx5IGZyb20gUENILCBtZWFucyB0
aGF0IGl0IGRvZXNuJ3QgaGF2ZSBhbnkgcGFyZW50IGRlcGVuZGVuY3kNCiAgICB3aXRoaW4gQk1D
LiBJbiB0aGlzIGNhc2UsIHdlIG5lZWQgdG8gbWFyayBDTEtfSVNfQ1JJVElDQUwgZmxhZyB0byBl
bmFibGUNCiAgICBpdC4gQWxzbywgd2Ugc2hvdWxkIG1hcmsgdGhlIGZsYWcgZm9yIEVTUElDTEsg
dG9vIGJlY2F1c2UgZVNQSSBpcw0KICAgIHNoYXJpbmcgdGhlIHNhbWUgaW50ZXJmYWNlIHdpdGgg
TFBDLg0KICAgIA0KICAgIEknbGwgbWFrZSBhbmQgdXBzdHJlYW0gYSBwYXRjaC4NCiAgICANCiAg
ICBUaGFua3MsDQogICAgSmFlDQpKYWUsDQpCdXQgSSBhbSBhYmxlIHRvIGVuYWJsZSBjbG9jayB0
aHJvdWdoIGxwYy1jdHJsIGluIGR0cy4gV2hpY2ggZG9lcyBzYW1lIHRoaW5nIGVuYWJsaW5nIGNs
b2NrIGZvciBscGMuIEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0aGlzIHBhdGNoLg0KDQpSZWdhcmRz
DQotVmlqYXkgDQoNCg==
