Return-Path: <prvs=69119f982c=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=69119f982c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="bFUcjp52"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="YCXkAs7E"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Z7LV4wGHzDqYB
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 10:11:44 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x08N1cLi004218; Tue, 8 Jan 2019 15:11:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=LYlE1y25W4zPmW3K5HqcJs0kfnoGETp3tylKtRDEYNg=;
 b=bFUcjp52CW0JzbdHyx7HxUYqg0G1QiJZNrNYFkmCLJJpEu6d/28H5rhNYaOv+9TcMfZ6
 Z+wNA5HSmAhdHbVgRAvIJ2Kzi0xyccNtI7hM5NFUFSJvg+hhzTLAP6EGENh71aDvLXlE
 urzx54cYyHbijIG13JjFHA1IId4XmPq92Nc= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2pw4qv03nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 08 Jan 2019 15:11:38 -0800
Received: from prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 8 Jan 2019 15:11:37 -0800
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 8 Jan 2019 15:11:37 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 8 Jan 2019 15:11:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYlE1y25W4zPmW3K5HqcJs0kfnoGETp3tylKtRDEYNg=;
 b=YCXkAs7EQIhqAlMkrGoKtY01dQ22ShUBvNIZ303fWE6voUR6rBSIym1jMcahaiS9NHxOy2RoE1gDf31LvW30QDRMeyTwAqvfytWcZeoQaZ6lFVrGepJJRmF7QjD7OaBamIB/sADnltxZN1uhksVsjOIJANY8jAF3aQXfIzQy468=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1525.namprd15.prod.outlook.com (10.172.157.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.9; Tue, 8 Jan 2019 23:11:35 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::f9c6:952c:8b66:cc9d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::f9c6:952c:8b66:cc9d%10]) with mapi id 15.20.1495.011; Tue, 8 Jan 2019
 23:11:35 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Matthew Barth <msbarth@linux.ibm.com>, Sai Dasari <sdasari@fb.com>,
 "liuxiwei@inspur.com" <liuxiwei@inspur.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Fan speed control
Thread-Topic: Fan speed control
Thread-Index: AQHUlmPa9RVzvtJvukS7iw8SULIx56WD/TCAgABGNQCABIpGAIAdOcaA//+UqQA=
Date: Tue, 8 Jan 2019 23:11:35 +0000
Message-ID: <054C42E2-072A-4284-BA66-FF1AC11FF564@fb.com>
References: <4E117ED9-B492-4197-A66F-45949E3D7178@fb.com>
 <CAHkHK09SisQ0s765c1DOV7Pe8NMOKw-UM+xe8dYdt5BWA-O9vQ@mail.gmail.com>
 <FB6A886A-9650-407B-9DCD-AD3F9FE9F130@fb.com>
 <CAHkHK0-yV-msA1EHFg-NXwaHWnV3V=xBhZpTRpf_F=EU8_oT=A@mail.gmail.com>
 <f06d98ed-fed2-e631-d0b1-c840b40e3beb@linux.ibm.com>
In-Reply-To: <f06d98ed-fed2-e631-d0b1-c840b40e3beb@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:2a38]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1525;
 20:1ygO9cugE67CnAF7YG5vxURVUPTdEZEnDsGdfFiucyVhegW+93cRYLSW3XY9OTi2Oaio1c+XFtV+cyaT+R0A1t0mSEZeCq7sNLX3gF8d9NM6Lur3KYl+qKeuayXekyrWzJEJLp6TmCkuKTUe3tB52wnjDK0OthFavVkobtsaPr4=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(396003)(376002)(136003)(39860400002)(346002)(366004)(199004)(189003)(6116002)(478600001)(36756003)(2616005)(11346002)(7736002)(476003)(6486002)(81156014)(229853002)(46003)(7116003)(6436002)(68736007)(93886005)(2906002)(5660300001)(486006)(446003)(81166006)(966005)(14454004)(53936002)(6306002)(8936002)(6512007)(83716004)(2501003)(105586002)(106356001)(554214002)(25786009)(3480700005)(33656002)(76176011)(4326008)(82746002)(99286004)(316002)(110136005)(6506007)(53546011)(71200400001)(71190400001)(86362001)(8676002)(256004)(102836004)(186003)(305945005)(97736004)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1525;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-correlation-id: f2e1d3b5-938d-40c4-e6b8-08d675bea2a5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1525; 
x-ms-traffictypediagnostic: CY4PR15MB1525:
x-microsoft-antispam-prvs: <CY4PR15MB15256B40B62B21C052790034DD8A0@CY4PR15MB1525.namprd15.prod.outlook.com>
x-forefront-prvs: 0911D5CE78
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HMCaqqPV2PaNeq6nZFPU/B5iQQ20Y33oEW50ytZpPEobhXxizIANzqoGmYtSwL4ejsAF9KVeTH+NmXq653AQ3qnrlAWw1GU72bvjpFko0V53/XG145waIRTwsOqhflO+hY9vGBi4SJyqDWaWnC6/Fm6wPykKfNNXXY0fXs0ebDOu+++MVYJ+MU+P0CYTy+9Wsn3loho+hwEg0D9+nkUywvtBGELI/aFbTgMc+t7V5evIv2jpTv4aH577KlQpNIgJ+auaJZAaI9642+dT3tkUXZ6B46GVGOz702TeBVwT0Hd7ehS8aAXJYum3YCFZRyO6
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8003E415930564ABB29362B090DCAFF@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e1d3b5-938d-40c4-e6b8-08d675bea2a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2019 23:11:35.1508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1525
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-08_13:, , signatures=0
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
X-List-Received-Date: Tue, 08 Jan 2019 23:11:47 -0000

VGhhbmtzIE1hdHQsDQpDdXJyZW50bHksIEkgYW0gdXNpbmcgaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvcGhvc3Bob3ItcGlkLWNvbnRyb2wuDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQrvu79PbiAx
LzgvMTksIDE6MzYgUE0sICJNYXR0aGV3IEJhcnRoIiA8bXNiYXJ0aEBsaW51eC5pYm0uY29tPiB3
cm90ZToNCg0KICAgIA0KICAgIA0KICAgIE9uIDEyLzIxLzE4IDE6MTcgQU0sIEdlb3JnZSBMaXUo
5YiY6ZSh5LyfKSB3cm90ZToNCiAgICA+IGFwb2xvZ2l6ZSBmb3IgdGhlIGxhdGUgcmVwbHksIHdl
IGFyZSBwbGFubmluZyB0byB3cml0ZSBhIGRvY3VtZW50IGZvcg0KICAgID4gdGhlIGZhbiBjb25m
aWd1cmF0aW9uLg0KICAgID4gDQogICAgPiANCiAgICA+IE9uIFdlZCwgRGVjIDE5LCAyMDE4IGF0
IDE6NTkgQU0gU2FpIERhc2FyaSA8c2Rhc2FyaUBmYi5jb20+IHdyb3RlOg0KICAgID4+DQogICAg
Pj4NCiAgICA+Pg0KICAgID4+IE9uIDEyLzE3LzE4LCA5OjQ3IFBNLCAib3BlbmJtYyBvbiBiZWhh
bGYgb2YgR2VvcmdlIExpdSjliJjplKHkvJ8pIiA8b3BlbmJtYy1ib3VuY2VzK3NkYXNhcmk9ZmIu
Y29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mIGxpdXhpd2VpQGluc3B1ci5jb20+IHdy
b3RlOg0KICAgID4+DQogICAgPj4gICAgICBIaSBWaWpheQ0KICAgID4+DQogICAgPj4gICAgICBJ
IGFtIGFsc28gbGVhcm5pbmcgYWJvdXQgdGhlIGZhbiBjb25maWd1cmF0aW9uIHBhcnQgb2Ygb3Bl
bmJtYw0KICAgID4+ICAgICAgVGhlcmUgaXMgYSBkcmFmdCBodHRwczovL2dpdGh1Yi5jb20vbHh3
aW5zcHVyL29wZW5ibWMtZG9jLg0KICAgID4+ICAgICAgSSBob3BlIGl0IGNhbiBiZSB1c2VmdWwg
Zm9yIHlvdQ0KICAgID4+IFRoYW5rcyBHZXJvZ2UhIFRoaXMgaXMgZ3JlYXQgaW5mbyBhbmQgaG9w
ZSB5b3UgY2FuIHVwc3RyZWFtIHRoZXNlIGRvY3MgZm9yIGVhc2Ugb2YgZmluZGluZyBhbmQgZ3Jl
YXRseSBiZW5lZml0IG90aGVyIGNvbW11bml0eSBtZW1iZXJzLg0KICAgID4gDQogICAgPj4gICAg
ICBSZWdhcmRzDQogICAgPj4NCiAgICA+PiAgICAgIC1HZW9yZ2UNCiAgICA+Pg0KICAgID4+ICAg
ICAgT24gVHVlLCBEZWMgMTgsIDIwMTggYXQgNzo1NSBBTSBWaWpheSBLaGVta2EgPHZpamF5a2hl
bWthQGZiLmNvbT4gd3JvdGU6DQogICAgPj4gICAgICA+DQogICAgPj4gICAgICA+IFRlYW0sDQog
ICAgPj4gICAgICA+DQogICAgPj4gICAgICA+IEkgYW0gbG9va2luZyBmb3Ig4oCcZmFuIHNwZWVk
IGNvbnRyb2zigJ0gZmVhdHVyZSB0byBlbmFibGUgZm9yIFRpb2dhcGFzcy4gSSB1bmRlcnN0YW5k
IHRoYXQgdGhlcmUgYXJlIG1hbnkgYXBwcm9hY2hlcyBmb3IgdGhpcy4gUGxlYXNlIHBvaW50IG1l
IHRvIGFsbCBpbXBsZW1lbnRhdGlvbiBhbmQgYW55IGRldGFpbHMgYWJvdXQgZWFjaCBhcHByb2Fj
aCwgbWF5IGJlIHNvbWUgcHJvcyBhbmQgY29ucy4NCiAgICA+PiAgICAgID4NCiAgICA+PiAgICAg
ID4NCiAgICA+PiAgICAgID4NCiAgICA+PiAgICAgID4gUmVnYXJkcw0KICAgID4+ICAgICAgPg0K
ICAgID4+ICAgICAgPiAtVmlqYXkNCiAgICA+Pg0KICAgID4+DQogICAgPiANCiAgICANCiAgICBB
cyBKYW1lcyBwb2ludGVkIG91dCwgdGhlcmUgYXJlIDMgZmFuIGNvbnRyb2wgYXBwbGljYXRpb25z
IHdoZXJlIDIgYXJlIA0KICAgIGN1cnJlbnRseSBtYWludGFpbmVkIHJlcG9zLg0KICAgIA0KICAg
IG9ibWMtY29udHJvbC1mYW5fZ2l0LmJiICYgb2JtYy1waG9zcGhvci1mYW5kLmJiDQogICAgVG8g
bXkga25vd2xlZGdlLCB0aGVzZSB3ZXJlIHRoZSBmYW4gbWFuYWdlbWVudCByZWZlcmVuY2UgaW1w
bGVtZW50YXRpb25zIA0KICAgIHRoYXQgYXJlIG5vIGxvbmdlciBtYWludGFpbmVkIGFuZC9vciBz
dXBwb3J0ZWQuDQogICAgDQogICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3It
cGlkLWNvbnRyb2wNCiAgICAoVGhpcyBpcyBhIGNvbmZpZ3VyYWJsZSBQSUQgYmFzZWQgZmFuIGNv
bnRyb2wgYXBwbGljYXRpb24pDQogICAgDQogICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
cGhvc3Bob3ItZmFuLXByZXNlbmNlDQogICAgKFRoaXMgY29udGFpbnMgY29uZmlndXJhYmxlIGZh
biBwcmVzZW5jZSwgZmFuIG1vbml0b3JpbmcsIGFuZCBSUE0vUFdNIA0KICAgIGZhbiBjb250cm9s
IGFwcGxpY2F0aW9ucykNCiAgICANCiAgICBUaGUgZG9jIGRyYWZ0IHRoYXQgR2VvcmdlIHJlZmVy
ZW5jZWQgcmVsYXRlcyB0byB0aGUgDQogICAgcGhvc3Bob3ItZmFuLXByZXNlbmNlIHJlcG8uDQog
ICAgDQogICAgTWF0dA0KICAgIA0KICAgIA0KDQo=
