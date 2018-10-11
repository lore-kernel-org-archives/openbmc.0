Return-Path: <Feng_Xie2@jabil.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=jabil.com
 (client-ip=104.47.40.91; helo=nam03-co1-obe.outbound.protection.outlook.com;
 envelope-from=feng_xie2@jabil.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jabil.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jabil.onmicrosoft.com header.i=@jabil.onmicrosoft.com
 header.b="pb2V/VmY"; dkim-atps=neutral
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0091.outbound.protection.outlook.com [104.47.40.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WD5c3t7PzDrhS
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 01:35:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jabil.onmicrosoft.com; 
 s=selector1-jabil-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfIP9S5aGThIY8EJM+7SAAWkDq79cVLD7BN+7bSRUhE=;
 b=pb2V/VmY8EX959XM/6t7taiUZWHxLOwbPf/U7i9hIRxXtX9NaYa3F1aQhjwSaL8tjQzk8KHmb6uQDGKE0C/YiuCNh27P+D6xMZrdun6/qtijf2O5k+aNrW7XSL9p0UPtrvMNMtxf9fq4IOluMqWCtF10Ws1n9pu1eAE9I3A01KU=
Received: from BN7PR02MB5300.namprd02.prod.outlook.com (20.176.176.214) by
 BN7PR02MB4100.namprd02.prod.outlook.com (52.132.223.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.23; Thu, 11 Oct 2018 14:35:09 +0000
Received: from BN7PR02MB5300.namprd02.prod.outlook.com
 ([fe80::4184:bbd8:7834:d92f]) by BN7PR02MB5300.namprd02.prod.outlook.com
 ([fe80::4184:bbd8:7834:d92f%3]) with mapi id 15.20.1228.020; Thu, 11 Oct 2018
 14:35:09 +0000
From: Feng Xie <Feng_Xie2@jabil.com>
To: Derek Tsai <dstsai704@gmail.com>, Sai Dasari <sdasari@fb.com>, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>
CC: Feng Xie <Feng_Xie2@jabil.com>
Subject: RE: Off-the-shelf platforms for OpenBMC
Thread-Topic: Off-the-shelf platforms for OpenBMC
Thread-Index: AdRg0ObE3zsdoTvLQp6nMG7+o8hlVv//nysAgADBZ4D//yPhoA==
Date: Thu, 11 Oct 2018 14:35:09 +0000
Message-ID: <BN7PR02MB5300E28F0AC217AED7EED261CAE10@BN7PR02MB5300.namprd02.prod.outlook.com>
References: <BN7PR02MB5300DFB69593AA2DFACE8CBFCAE00@BN7PR02MB5300.namprd02.prod.outlook.com>
 <46997EA1-1B92-420C-9397-6E6D005C8E06@fb.com>
 <CY1PR1201MB101757941C4699ED973B1328A9E10@CY1PR1201MB1017.namprd12.prod.outlook.com>
In-Reply-To: <CY1PR1201MB101757941C4699ED973B1328A9E10@CY1PR1201MB1017.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcZnhpZVxhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLWU3Mzk0MWYyLWNkNjItMTFlOC04NWNkLTE4NWUwZmU1ZTcyY1xhbWUtdGVzdFxlNzM5NDFmNC1jZDYyLTExZTgtODVjZC0xODVlMGZlNWU3MmNib2R5LnR4dCIgc3o9IjE0ODUiIHQ9IjEzMTgzNzQyMTMxNjgzMTkyMiIgaD0iR2FzbmgyYUVmZzVZQWpIcXpka0pMR1ZpR29nPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Feng_Xie2@jabil.com; 
x-originating-ip: [184.185.47.46]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN7PR02MB4100;
 20:DwH97feECJF6VqhMsMIqKhhVL7W0mROLrAfYX7RWSORSMtjQwTsIxg6Is+1lR6/59yPdlw81ESwDfiekxGYTwwjn+j4ciCgbtpMyBVBMSAifSJFfW0Yc+VGMWQssKRPjIjsJ/TdY02fSa2UfHQDtuvu5NbmRs36t6KFtcY79hWM=
x-ms-office365-filtering-correlation-id: dd0042e8-8319-4183-0f51-08d62f86bedc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BN7PR02MB4100; 
x-ms-traffictypediagnostic: BN7PR02MB4100:
x-microsoft-antispam-prvs: <BN7PR02MB410036FF89F8B5A69729D660CAE10@BN7PR02MB4100.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(85827821059158)(67672495146484)(21534305686606)(65623756079841); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(944501410)(4982022)(52105095)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123564045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991055);
 SRVR:BN7PR02MB4100; BCL:0; PCL:0; RULEID:; SRVR:BN7PR02MB4100; 
x-forefront-prvs: 08220FA8D6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(376002)(366004)(346002)(39860400002)(189003)(199004)(51874003)(13464003)(66066001)(3846002)(186003)(4326008)(229853002)(105586002)(33656002)(97736004)(6116002)(106356001)(316002)(16799955002)(14454004)(5250100002)(2906002)(8676002)(8936002)(74316002)(81166006)(81156014)(305945005)(966005)(7736002)(478600001)(72206003)(53936002)(102836004)(6436002)(26005)(6246003)(25786009)(110136005)(71200400001)(9686003)(55016002)(6306002)(2900100001)(7696005)(53376002)(107886003)(76176011)(86362001)(71190400001)(68736007)(5660300001)(11346002)(99286004)(446003)(476003)(486006)(53546011)(256004)(39060400002)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN7PR02MB4100;
 H:BN7PR02MB5300.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: jabil.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: IUiRBlINRsy64ZZLP3Qaws9lgZr5jrsyGg2550NPIQlaT3palbhm9YocHdoa7cMg2dbyvvPpkt4rEZUTa06o2lwh1oLdiGjWKM5n+mmbdVpyYH+wxIuKvKy8P2MVjuIolMaElxRL3iYnRLp9PzB6nPtA2GjyE2Acp/gG6UlCRgdVl3ptk8jkAVoArhzLt9SH3kLKgVhKbShbbjx5tOmlczepER1sH/8wRJXpYxrN+vSc8RF401YCEULuNzOtKSYc/a9zHb9xt3Ak1611KgjlgBt8HYVObQ+AC2gAZEdEtbCUGG8jyWa7fGD5qpKHsZXcWxCMv3xFXc++J3yLTxGgQ1lzfT/+UF1qSDrDejh34qc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: jabil.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0042e8-8319-4183-0f51-08d62f86bedc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2018 14:35:09.3189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc876b21-f134-4c12-a265-8ed26b7f0f3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4100
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
X-List-Received-Date: Thu, 11 Oct 2018 14:35:17 -0000

SGkgU2FpIGFuZCBEZXJlaywNCg0KICAgICAgICAgVGhhbmtzIGEgbG90IGZvciB0aGUgcXVpY2sg
cmVzcG9uc2UhIEkgd2lsbCBldmFsdWF0ZSBhbGwgdGhlIHRocmVlIHByb2R1Y3RzIHlvdSBzdWdn
ZXN0ZWQuIA0KDQpGZW5nDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBEZXJl
ayBUc2FpIDxkc3RzYWk3MDRAZ21haWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAx
MCwgMjAxOCA5OjI1IFBNDQpUbzogU2FpIERhc2FyaSA8c2Rhc2FyaUBmYi5jb20+OyBGZW5nIFhp
ZSA8RmVuZ19YaWUyQGphYmlsLmNvbT47IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZz4NClN1YmplY3Q6IFJlOiBPZmYtdGhlLXNoZWxmIHBsYXRmb3JtcyBmb3IgT3Bl
bkJNQw0KDQpKdXN0IGN1cmlvdXMgaWYgYW55b25lIGhhcyB0cmllZCB0aGUgV2hpdGVib3g6DQpo
dHRwczovL3d3dy5zZXJ2ZXJzZGlyZWN0LmNvbS9TZXJ2ZXJzL2lkLVIxNTYwL1IxNTYwXy1fV0hJ
VEVCT1hfT1BFTl8xVV80X0JheQ0KDQpTZWVtcyB0byBiZSBhIGJldHRlciB2YWx1ZSB0aGFuIFBv
cnR3ZWxsJ3MgTmVwdHVuZS4NCg0KVGhhbmtzLA0KRGVyZWsNCg0K77u/T24gMTAvMTAvMTgsIDE6
NTMgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBTYWkgRGFzYXJpIiA8b3BlbmJtYy1ib3VuY2Vz
K2RlcmVrLnRzYWk9amluLXRzYWkuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mIHNk
YXNhcmlAZmIuY29tPiB3cm90ZToNCg0KICAgICAgICANCiAgICAgICAgICAgICAgSSBhbSBuZXcg
dG8gT3BlbkJNQy4gSSB3YW50IHRvIHRyeSBPcGVuQk1DIG9uIHNvbWUgb2ZmLXRoZS1zaGVsZiBo
YXJkd2FyZSBwbGF0Zm9ybXMuIENhbiBhbnlib2R5IHJlY29tbWVuZCBzb21lIHByb2R1Y3RzICh3
aXRoIGRldmVsb3BtZW50IHRvb2xraXRzKT8gVGhhbmtzIGluIGFkdmFuY2UhDQogICAgV2VsY29t
ZSBGZW5nIHRvIE9wZW5CTUMgY29tbXVuaXR5ISANCiAgICANCiAgICBJIHdvdWxkIHN0YXJ0IHRy
eWluZyB0byBnZXQgYW4gZXZhbHVhdGlvbiBraXQgYnkgY29udGFjdGluZyBCTUMgU29DIFZlbmRv
ciBlLmcuIGh0dHBzOi8vd3d3LmFzcGVlZHRlY2guY29tL3Byb2R1Y3RzLnBocD9mUGF0aD0yMCZy
SWQ9NDQwDQogICAgSWYgeW91IHBsYW4gdG8gd29yayBvbiBob3N0IChCSU9TL1VFRkkpPC0+Qk1D
IGludGVyYWN0aW9ucywgcmVjb21tZW5kIGFub3RoZXIgb2ZmLXRoZS1zaGVsZiBwcm9kdWN0IHRo
YXQgaGFzIENPTWUgY29ubmVjdG9yIHRvIHBsdWctaW4gaG9zdCBwcm9jZXNzb3IgZS5nLiBAIGh0
dHA6Ly9wb3J0d2VsbC5jb20vc29sdXRpb25zL3BkZi9Qb3J0d2VsbC1OZXB0dW5lLUFscGhhLU9w
ZW5CTUMtRGV2ZWxvcG1lbnQtS2l0LnBkZg0KICAgICAgICAgDQogICAgDQogICAgDQo=
