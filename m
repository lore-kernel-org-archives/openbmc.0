Return-Path: <prvs=5875f896d9=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5875f896d9=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="rR4JQ5qG"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="i6m5w2oC"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 437vkL2xhmzDqWY
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 06:11:50 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wB3JAkH8030462; Mon, 3 Dec 2018 11:11:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=X5hM8BfELKoS7SxAnL20JmcW8/jrFhk6XLO1ZVGWxOk=;
 b=rR4JQ5qGxXkFx93Hp/SdYo9xmJGfGh16xYEbLj2IuY07vEfdGn41E6WCEHX2daAIr0Di
 Xy4YRcYx2Q5g5nqdq4KkSVpk61eP8PGo6MDdWgqKNIESyyW6yFHlC/5PMMIqobx+ow6y
 q/0jQ+loUvxdLBF/mIY9pzRDoCeIHW6W3vo= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2p58290mum-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 03 Dec 2018 11:11:47 -0800
Received: from frc-mbx02.TheFacebook.com (2620:10d:c0a1:f82::26) by
 frc-hub04.TheFacebook.com (2620:10d:c021:18::174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 3 Dec 2018 11:11:31 -0800
Received: from frc-hub04.TheFacebook.com (2620:10d:c021:18::174) by
 frc-mbx02.TheFacebook.com (2620:10d:c0a1:f82::26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 3 Dec 2018 11:11:30 -0800
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.74) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Mon, 3 Dec 2018 11:11:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5hM8BfELKoS7SxAnL20JmcW8/jrFhk6XLO1ZVGWxOk=;
 b=i6m5w2oC3Iy316PwnNlm60NdY1WSee69ZM7SYQG5auFjhZtujXuI7W1JDAX0F8HsFOWrqcsPL1Y0y6yY4/esyZGS7SN5UhattTmoKBMjSl4vo82I3UkN+8QFtTKhiylVVYABfz3WNTvDgzBXkRqFO5h78+slew9gyJg8u10HGyA=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1910.namprd15.prod.outlook.com (10.174.54.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.21; Mon, 3 Dec 2018 19:11:29 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::19df:d934:b961:5442]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::19df:d934:b961:5442%5]) with mapi id 15.20.1382.020; Mon, 3 Dec 2018
 19:11:29 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Linux dev-4.19
Thread-Topic: Linux dev-4.19
Thread-Index: AQHUh32ov/79WiWenkqw7eZRBbyFpKVskECAgABSpAA=
Date: Mon, 3 Dec 2018 19:11:29 +0000
Message-ID: <1E4319BB-39C3-455F-B659-B37F0153F0D9@fb.com>
References: <CACPK8Xfo5zzyLUa-8fU6j7d5GpVnFea1k3PC93vxiOvYAGV7ZQ@mail.gmail.com>
 <CACPK8Xfxq=df=nW+U57v4vHaJ8B96bi8ABddH_vZNHBBQcLXTA@mail.gmail.com>
In-Reply-To: <CACPK8Xfxq=df=nW+U57v4vHaJ8B96bi8ABddH_vZNHBBQcLXTA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:d946]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1910;
 20:03QT/DdFMkD34phrS54NtLD/FIAZLbbC8kCWuHluLBxvlucqeZcTx40ss6J32FLpKLdNAsd/4N5IBPSYzz5ekXu4ISzwe/YsZvRKLUvAHRTtcpG8K4qEpPp0JezWuf0MH4AMBFxdwFCrwpQYoLeHjc48uC/4WuhxOTc1sHFE1KA=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 73195a7b-527a-495f-6cb9-08d659532149
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1910; 
x-ms-traffictypediagnostic: CY4PR15MB1910:
x-microsoft-antispam-prvs: <CY4PR15MB1910975A6803606D3BDADD56DDAE0@CY4PR15MB1910.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231455)(999002)(11241501185)(944501493)(52105112)(93006095)(93001095)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1910; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1910; 
x-forefront-prvs: 08756AC3C8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(346002)(136003)(396003)(376002)(199004)(189003)(25786009)(966005)(6116002)(36756003)(575784001)(86362001)(14454004)(478600001)(446003)(11346002)(102836004)(2616005)(316002)(476003)(46003)(8676002)(486006)(6436002)(97736004)(2906002)(81156014)(81166006)(186003)(6512007)(6306002)(7736002)(6246003)(305945005)(6506007)(53936002)(8936002)(76176011)(6486002)(99286004)(229853002)(5660300001)(33656002)(71200400001)(71190400001)(83716004)(82746002)(110136005)(256004)(14444005)(105586002)(68736007)(106356001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1910;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 8RSsZ833Oquc3f2dnGKjsKmlWlCv8u7NnwCYVO2gUwxxjWoS/38BsYSJYUknxxogvVPHiujQoRa7v5stDs4j9kc1UZSEKWgg9KLqDzRxn/Z8hhw93h4uJToXYoIyiH/U0A//2hojuO0o1vfqMYWyu/O2CK2aNFxRycIuBoa+B8ptyP6x6p8U/VkgZnuw0bd3rPITxB7IG9z3XrAXq9+P7e0ndu0mel37eHy7vetK8NOY4ai4CyufHyfFkHF4hOYARt5QTYy0+S3EtXmTQgIxsj04BEkvQSm/cIPT0UYCHHCZPbUWuFhXhZI4ffNBexfSYMRJOUpzuZBKH2jGXtiJpp6QvZDeKbBd98FLF990r9I=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <C47FE76B7CFF40469F21E29F3CCA783E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 73195a7b-527a-495f-6cb9-08d659532149
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2018 19:11:29.4601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1910
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-03_10:, , signatures=0
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
X-List-Received-Date: Mon, 03 Dec 2018 19:11:55 -0000

SGkgSm9lbCwNCkkgaGF2ZSBjb3VwbGUgb2YgTkNTSSBwYXRjaCB3aGljaCB3ZXJlIHVwIHN0cmVh
bWVkIGxhc3Qgd2VlayBpbiBsaW51eC1uZXh0IGtlcm5lbC4gV2lsbCB0aG9zZSBiZSBwYXJ0IG9m
IHRoaXMgNC4xOSBrZXJuZWwgaW4gb3BlbmJtYyBvciB3aGF0IGlzIHByb2NlZHVyZSB0byBwdWxs
IHRob3NlIHBhdGNoZXMgaW4gb3BlbmJtYyBidWlsZC4gQXMgdGhlc2UgYXJlIHJlcXVpcmVkIGZv
ciBNZXRhLWZhY2Vib29rIGJ1aWxkIHdpdGggbmV0d29ya2luZyB3b3JraW5nLg0KDQpSZWdhcmRz
DQotVmlqYXkNCg0K77u/T24gMTIvMi8xOCwgMTA6MTcgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBv
ZiBKb2VsIFN0YW5sZXkiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3Rz
Lm96bGFicy5vcmcgb24gYmVoYWxmIG9mIGpvZWxAam1zLmlkLmF1PiB3cm90ZToNCg0KICAgIE9u
IFRodSwgMjkgTm92IDIwMTggYXQgMTE6MTksIEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+
IHdyb3RlOg0KICAgID4NCiAgICA+IEkndmUgaGFkIHNvbWUgb2ZmIGxpc3QgcXVlc3Rpb25zIGFi
b3V0IG1vdmluZyB0aGUgb3BlbmJtYyB0cmVlIHRvDQogICAgPiA0LjE5LiBBcG9sb2dpZXMgZm9y
IHRoZSBkZWxheSByZXNwb25kaW5nLCBJIHdhcyBidXN5IHdpdGggYW5vdGhlcg0KICAgID4gcHJv
amVjdCBpbiByZWNlbnQgd2Vla3MuDQogICAgPg0KICAgID4gSSB3aWxsIHB1dCB0b2dldGhlciBh
IDQuMTkgYmFzZWQgdHJlZSBuZXh0IHdlZWsuIE9uY2UgaXQncyBib290aW5nIG9uDQogICAgPiB0
aGUgaGFyZHdhcmUgSSBoYXZlIGFjY2VzcyB0byAoYXN0MjQwMCBhbmQgYXN0MjUwMCBvcGVucG93
ZXINCiAgICA+IG1hY2hpbmVzKSwgSSB3aWxsIHB1c2ggaXQgdG8gZ2l0aHViIGFuZCBub3RpZnkg
dGhlIGxpc3QuIEZ1cnRoZXINCiAgICA+IHRlc3Rpbmcgd291bGQgYmUgd2VsY29tZS4NCiAgICAN
CiAgICBUaGlzIGhhcyBiZWVuIGRvbmUuIFRoZXJlIGlzIG5vdyBhIGRldi00LjE5IGJyYW5jaDoN
CiAgICANCiAgICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvbGludXgvY29tbWl0cy9kZXYt
NC4xOQ0KICAgIA0KICAgIFRoZSB0cmVlIHRoaXMgdGltZSBhcm91bmQgd2FzIGEgc2ltcGxlIHJl
YmFzZSBvZiB0aGUgNC4xOCB0cmVlIG9uIHRvcA0KICAgIG9mIDQuMTkuIEkgZGlkbid0IGRyb3Ag
YW55IHBhdGNoZXMgKGFzaWRlIGZyb20gdGhvc2UgdGhhdCB3ZW50DQogICAgdXBzdHJlYW0pLg0K
ICAgIA0KICAgIEkndmUgcHVibGlzaGVkIGEgZ2Vycml0IGNvbW1pdCB0aGF0IGJ1bXBzIG9wZW5i
bWMgdG8gdXNlIHRoaXMgdmVyc2lvbi4NCiAgICBUaGlzIGhhcyBoYWQgc29tZSB0ZXN0aW5nIGJ5
IG91ciBDSSBvbiBXaXRoZXJzcG9vbiBhbmQgUm9tdWx1cywgYW5kIEkNCiAgICBkaWQgc29tZSBt
YW51YWwgdGVzdGluZyBvbiBSb211bHVzIGFuZCBQYWxtZXR0byAoaGFyZHdhcmUgYW5kIFFlbXUp
LiBJDQogICAgaW50ZW5kIHRvIG1lcmdlIGl0IHRvbW9ycm93Og0KICAgIA0KICAgICBodHRwczov
L3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2dlcnJpdC5vcGVu
Ym1jLTJEcHJvamVjdC54eXpfY19vcGVuYm1jX21ldGEtMkRhc3BlZWRfLTJCXzE2MzYzJmQ9RHdJ
QmFRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4
MHZYa2tjcklhcVU3VVNsNWcmbT1RaVNlZlB0UjYxcUxKbHg2NGRDaVFCVlh6REVKZkxyZHdWT056
MnItelE0JnM9bWFkbDRMSlRaVXhqcTRJWTFvZlVuMXVXa3RWYlRqVjhHSjBDQ0dNRmo2TSZlPQ0K
ICAgIA0KICAgID4gSWYgdGhlcmUgYXJlIHBhdGNoZXMgeW91IHdvdWxkIGxpa2UgdG8gYWRkIHRv
IDQuMTkgcGxlYXNlIHNlbmQgdGhlbSB0bw0KICAgID4gdGhlIGxpc3Qgd2l0aCB0aGUgJ2Rldi00
LjE5JyBzdWJqZWN0LiBUaGlzIGlzIHByb2JhYmx5IGJlc3QgZG9uZSBvbmNlDQogICAgPiBJJ3Zl
IHB1Ymxpc2hlZCB0aGUgdHJlZSwgc28geW91IGNhbiBlbnN1cmUgdGhleSBhcHBseSBhbmQgYXJl
IHRlc3RlZC4NCiAgICANCiAgICBQbGVhc2UgdGVzdCBvbiB5b3VyIHBsYXRmb3Jtcywgc3VibWl0
IHRoZSBwYXRjaCBzZXRzIHlvdSB3b3VsZCBsaWtlIHRvDQogICAgc2VlIGluY2x1ZGVkLg0KICAg
IA0KICAgIENoZWVycywNCiAgICANCiAgICBKb2VsDQogICAgDQoNCg==
