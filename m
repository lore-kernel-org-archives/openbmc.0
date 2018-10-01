Return-Path: <prvs=38122c7c08=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=38122c7c08=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="XyCa4bLM"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ITOdEXH9"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42PHRg5ZjlzF38r;
 Tue,  2 Oct 2018 08:45:14 +1000 (AEST)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w91MgZ1a020370; Mon, 1 Oct 2018 15:45:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=Bsx0M94VQjoD+jqxLrHKffI+rrUrVK0QWhsNCNcZf60=;
 b=XyCa4bLMA8SNxuMTNg1YMvuuBvkgphWW0Xgosl+cRSV/vruCHBNck9dsFFDDx8z083fM
 /RlzUHC2dPNyyth9As0gbISw4BhZBqc5I7zVHbAX/Mjt9iXk2JjqcN29phUUMRE/yvmo
 oq3uF+yWvEM3a3YreB1jjYjWNmf+Otm7YyI= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0b-00082601.pphosted.com with ESMTP id 2mutg30dtp-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 01 Oct 2018 15:45:09 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.21) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Mon, 1 Oct 2018 18:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bsx0M94VQjoD+jqxLrHKffI+rrUrVK0QWhsNCNcZf60=;
 b=ITOdEXH9Gq8GixV1Qgx369qf+ed0d8quLgmCjj6iiuxoizVEgBYSIzbB9Pg4d0+qr2JfmGW3mkEWPlPqCdjvBrERzr4/93rYPTt9P+mwmX+w6oFlEZV44ySVt+S2OiUGAIBeQB7gUDh7rjrFCCGkTRtuigYo4Mgrwv7TYxm8Fqg=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1928.namprd15.prod.outlook.com (10.174.54.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1185.24; Mon, 1 Oct 2018 22:45:07 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2d43:ae9a:18c0:ac8b]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2d43:ae9a:18c0:ac8b%2]) with mapi id 15.20.1185.024; Mon, 1 Oct 2018
 22:45:06 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Justin . Lee1 @ Dell . com" <Justin.Lee1@Dell.com>, "joel @ jms . id .
 au" <joel@jms.id.au>, "linux-aspeed @ lists . ozlabs . org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc @ lists . ozlabs . org"
 <openbmc@lists.ozlabs.org>, Sai Dasari <sdasari@fb.com>, "netdev @ vger .
 kernel . org" <netdev@vger.kernel.org>, "christian @ cmd . nu"
 <christian@cmd.nu>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: Re: [Potential Spoof] Re: [PATCH v2] net/ncsi: Add NCSI OEM command
 support
Thread-Topic: [Potential Spoof] Re: [PATCH v2] net/ncsi: Add NCSI OEM command
 support
Thread-Index: AQHUWdhmYSUUlSHXT0u1cp/OwqmtAA==
Date: Mon, 1 Oct 2018 22:45:06 +0000
Message-ID: <4B3FCCBC-0A9B-47D0-876D-323D12DFD09B@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:f14e]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1928;
 20:uucsl3m5pdkxIRxQPJiN72mwWo1nVWLdvPVpFAmKp7vj8n5b6iHmJv8fRic4els3i5JYrF4CQBEc69rVoBAYzNyVU15THBHJu4OspVtFPX2W6Jp3zVzBgY1JUbZoXGXYkalfHuGaWXQnK5LRfmY6Xx68hF5Syt/Os6d7t5hFc70=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(136003)(396003)(366004)(376002)(199004)(189003)(86362001)(81166006)(81156014)(2616005)(186003)(305945005)(46003)(110136005)(33656002)(102836004)(316002)(5660300001)(53936002)(106356001)(105586002)(7736002)(478600001)(25786009)(2906002)(486006)(14444005)(6506007)(53546011)(97736004)(8936002)(2900100001)(36756003)(256004)(217873002)(6246003)(6116002)(14454004)(6436002)(229853002)(99286004)(476003)(5250100002)(83716004)(82746002)(8676002)(68736007)(71200400001)(71190400001)(6512007)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1928;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-correlation-id: 616c4563-cc07-4e1d-6fad-08d627ef88c6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1928; 
x-ms-traffictypediagnostic: CY4PR15MB1928:
x-microsoft-antispam-prvs: <CY4PR15MB1928A34E453B3A59310A9F84DDEF0@CY4PR15MB1928.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(65623756079841)(67672495146484);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(11241501184)(944501410)(52105095)(93006095)(93001095)(10201501046)(3002001)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051);
 SRVR:CY4PR15MB1928; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1928; 
x-forefront-prvs: 0812095267
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: bwy6BZdqn7b0g9AOsDhQKfJ3IhbfB/px6MV+E4C6FHKF3H3N0pXoG92L50N9GKmY7sair9hsT5NqLvnJIFje6SFvIrfGHfSa1lL940zrt8WR+4yq1HmDDi9j5p5Fh53URNj0LDsr9TxI0xIVGN/tpuQEnmba+6D0J4w1piaVRxJfUFknOOQa+P8NUVGx9xq6p72xpmf6xfP9u6Av3JjHp0LE1Ou/+jra39Epm/k/dHyU5y7BNc3OGvVLv6AvN30qUIsWxlNKE9GSczTZ11nnBn+mnNjEQwQuzZkWWGG+1j70n6QnSHZoaqmRg+o5h9hs8o/mhzBQEYJPghbWjGG5dpAXbpOcu7mdgoERrTdE2QI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <99F1E284771711418882EA07AF529756@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 616c4563-cc07-4e1d-6fad-08d627ef88c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2018 22:45:06.3158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1928
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-01_12:, , signatures=0
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
X-List-Received-Date: Mon, 01 Oct 2018 22:45:21 -0000

DQoNCu+7v09uIDkvMjgvMTgsIDY6MjEgUE0sICJMaW51eC1hc3BlZWQgb24gYmVoYWxmIG9mIFZp
amF5IEtoZW1rYSIgPGxpbnV4LWFzcGVlZC1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0
cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZiB2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KDQog
ICAgDQogICAgDQogICAgPiBPbiA5LzI4LzE4LCA2OjA3IFBNLCAiVmlqYXkgS2hlbWthIiA8dmlq
YXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICANCiAgICAgPiAgIFRoaXMgcGF0Y2ggYWRkcyBP
RU0gY29tbWFuZHMgYW5kIHJlc3BvbnNlIGhhbmRsaW5nLiBJdCBhbHNvIGRlZmluZXMgT0VNDQog
ICAgID4gICBjb21tYW5kIGFuZCByZXNwb25zZSBzdHJ1Y3R1cmUgYXMgcGVyIE5DU0kgc3BlY2lm
aWNhdGlvbiBhbG9uZyB3aXRoIGl0cw0KICAgICA+ICAgaGFuZGxlcnMuDQogICAgID4gICANCiAg
ICAgPiAgIG5jc2lfY21kX2hhbmRsZXJfb2VtOiBUaGlzIGlzIGEgZ2VuZXJpYyBjb21tYW5kIHJl
cXVlc3QgaGFuZGxlciBmb3IgT0VNDQogICAgID4gICBjb21tYW5kcw0KICAgICA+ICAgbmNzaV9y
c3BfaGFuZGxlcl9vZW06IFRoaXMgaXMgYSBnZW5lcmljIHJlc3BvbnNlIGhhbmRsZXIgZm9yIE9F
TSBjb21tYW5kcw0KICAgICAgIA0KICAgICAgVGhpcyBpcyBhIGdlbmVyaWMgcGF0Y2ggZm9yIE9F
TSBjb21tYW5kIGhhbmRsaW5nLCBUaGVyZSB3aWxsIGJlIGFub3RoZXIgcGF0Y2ggDQogICAgICBm
b2xsb3dpbmcgdGhpcyB0byBoYW5kbGUgc3BlY2lmaWMgT0VNIGNvbW1hbmRzIGZvciBlYWNoIHZl
bmRvci4gQ3VycmVudGx5IEkgaGF2ZQ0KICAgICAgZGVmaW5lZCAyIHZlbmRvci9tYW51ZmFjdHVy
ZXIgaWQgYmVsb3cgaW4gaW50ZXJuYWwuaCwgbW9yZSBjYW4gYmUgYWRkZWQgaGVyZSBmb3INCiAg
ICAgIG90aGVyIHZlbmRvcnMuIEkgaGF2ZSBub3QgZGVmaW5lZCBuY3NpX3JzcF9vZW1faGFuZGxl
ciBpbiB0aGlzIHBhdGNoIGFzIHRoZXkgYXJlIA0KICAgICAgTlVMTCwgYnV0IHRoZXJlIHdpbGwg
YmUgYSBkZWZpbmVkIGhhbmRsZXJzIGZvciBlYWNoIHZlbmRvciBpbiBuZXh0IHBhdGNoLiANCiAg
ICAgDQpTYW0sIEpvZWwsIEp1c3RpbiwgcGxlYXNlIHJldmlldyB0aGlzIHBhdGNoLiBJIGhhdmUg
MiBtb3JlIHBhdGNoIGNvbWluZyBmb3IgQnJvYWRjb20gYW5kIE1lbGxhbm94LiANCg0K
