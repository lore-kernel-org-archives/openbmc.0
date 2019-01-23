Return-Path: <prvs=69266c3e89=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=69266c3e89=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="P2obe6H8"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="A/fg+ls7"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lDZH3PBwzDqBX
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 05:38:30 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0NIXkDj026419; Wed, 23 Jan 2019 10:38:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=RyNgzmH59tb8AtMfMUeHEqhlpkeaFDAYF5KhzQgdTvE=;
 b=P2obe6H8+IxhHaMUNbOOFMBYFQTYEVYzF8H20N45PdGjAM0vhJsTCXE2bzI3QHNq4xK2
 iWRYtzSRLdKMWUBDlIwL7BHzK2LJPT82VK+tMvceDOZxDfX8nTBZjFlBo434lktzBKHc
 BNQUuSwwkcqXRBOqAvgVfiQuUFIHBZjBMvg= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2q6ukt0g5d-15
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 23 Jan 2019 10:38:25 -0800
Received: from prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 23 Jan 2019 10:38:08 -0800
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 23 Jan 2019 10:38:07 -0800
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Wed, 23 Jan 2019 10:38:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyNgzmH59tb8AtMfMUeHEqhlpkeaFDAYF5KhzQgdTvE=;
 b=A/fg+ls7NObWSnyDIWowcdRID9tFghlWXpKNGFQQNYoee8Us6fe9ydG4tK1p44EPvCrmDnxCRSo+394D5X+UETcEYrm/JJAZwn4InZF4fJnInhTvH5ylEX0LQ880bGjxpXBOn1RKj7vCbmavqgvfFfqC1mRjJfJBDvfwmpMUqLg=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1720.namprd15.prod.outlook.com (10.174.53.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.30; Wed, 23 Jan 2019 18:38:06 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b4e4:1e1f:8c5d:9a8c]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b4e4:1e1f:8c5d:9a8c%4]) with mapi id 15.20.1537.031; Wed, 23 Jan 2019
 18:38:06 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Li, Yong B" <yong.b.li@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
CC: "cheng.c.yang@intel.com" <cheng.c.yang@intel.com>, "osk@google.com"
 <osk@google.com>
Subject: Re: configuring lpc register from user space
Thread-Topic: configuring lpc register from user space
Thread-Index: AQHUsq7mJL8Gq6TnZUm014bNCUUai6W8GF+AgACRtgA=
Date: Wed, 23 Jan 2019 18:38:06 +0000
Message-ID: <59F90F62-E2EF-4CD1-A0BB-5F2F6CB4D91A@fb.com>
References: <898F383C-6AB8-4AF0-91F4-680CA01C2D50@fb.com>
 <3aa23d34-2d9b-7500-1fb0-a211377ecc4d@linux.intel.com>
In-Reply-To: <3aa23d34-2d9b-7500-1fb0-a211377ecc4d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:90a4]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1720;
 20:M9UM902M8TDBBrNPwOf4ypLFmNSYdrIG1iM15Ylm9p3R4oHbg6Q027XhVyH6t4iLHDAX3x30cRZ9KDaifbjlAE1FfRHXUcIaDeuL7q6gZEs/2co6tjRKRJIPpFzi8GKOhrV250pWz3RQkkh+LCQfqbF/XSqgFQPUR85Y3dPxxME=
x-ms-office365-filtering-correlation-id: 9fcd625f-baec-4622-841a-08d68161eab7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1720; 
x-ms-traffictypediagnostic: CY4PR15MB1720:
x-microsoft-antispam-prvs: <CY4PR15MB1720DEEBB745A91931D68369DD990@CY4PR15MB1720.namprd15.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(39860400002)(136003)(366004)(189003)(199004)(6116002)(229853002)(4744005)(36756003)(97736004)(6436002)(6486002)(53936002)(2501003)(6512007)(82746002)(6306002)(71200400001)(966005)(83716004)(99286004)(14454004)(68736007)(2906002)(33656002)(478600001)(71190400001)(8936002)(4326008)(305945005)(486006)(81156014)(81166006)(6506007)(8676002)(102836004)(53546011)(14444005)(54906003)(105586002)(86362001)(46003)(76176011)(256004)(106356001)(11346002)(2616005)(6246003)(110136005)(476003)(316002)(186003)(446003)(25786009)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1720;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: D8zT5to+WEQEbIF1O7dBDlpVLY+EdTOAU2Ud51BxBCjK/WtnyGwXlgRs8CuD+mgGrefs2GJDujIedJO0YJ6wmkAfMl4cUtn4oTcizzafxuPHRiG2yJ+Ejm0MrnaCX36IRPURWI+SGQjKJvnTzXSmRzyh7krxNiA60HxndHreb7rFBE4uv/SYV+/WLuTeviUPGaEHdwj2rDEh1kL4QeUegpaynCDU8rYcJuebmQlT4GEikqsbtWqnRX3ztXGehXJWUCKb2H3H1KpjA1GL/oF7fwyZqX3DqZrDrSHmAc7NdgvsdsLCfE/+CJ3PQ/IXyN3bU5RSMF96CqrOwHvjAskXcTMXOZ6odl147P96zWoEbhpu26fg2jrOcnN9h2uEjH1UyRxSvJDuI0e4Hha9sNZs69vcYAvDvdd3VRdly88WNFc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF408CEA2A8487488894840F7FB20ACC@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcd625f-baec-4622-841a-08d68161eab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 18:38:06.8897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1720
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-23_10:, , signatures=0
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
X-List-Received-Date: Wed, 23 Jan 2019 18:38:32 -0000

VGhhbmtzIFlvbmcgZm9yIHRoaXMgYnV0IHRoaXMgcGF0Y2ggaXMgc3RpbGwgbm90IGluIHJlcG8u
IERvIHlvdSBrbm93IHdoYXQgaXMgcGVuZGluZyBmb3IgYXBwcm92YWw/DQoNCu+7v09uIDEvMjIv
MTksIDU6NTYgUE0sICJMaSwgWW9uZyBCIiA8eW9uZy5iLmxpQGxpbnV4LmludGVsLmNvbT4gd3Jv
dGU6DQoNCiAgICBIaSBWaWpheSwNCiAgICANCiAgICBGb3IgdGhlIFVBUlQgcm91dGVpbmcsIHRo
ZXJlIGlzIGEga2VybmVsIGRldmljZSBkcml2ZXIsIGl0IHdpbGwgZXhwb3J0IA0KICAgIHNldmVy
YWwgZW50aXRpZXMgaW4gc3lzZnMsIHlvdSBjYW4gYWRqdXN0IHRoZSByb3V0aW5nLg0KICAgIA0K
ICAgIGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9f
cGF0Y2h3b3JrLm96bGFicy5vcmdfcGF0Y2hfOTY5MjM4XyZkPUR3SUNhUSZjPTVWRDBSVHRObFRo
M3ljZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2WGtrY3JJYXFVN1VTbDVn
Jm09RlBqdVFFLXZIM05sbHBNWm1sQ0RXYTJmWG9LYlVFRld5TVJkam1GZXo0cyZzPWliUURJNTFI
UkhvVFh5OExielU4aDJYS3d1a0c1VWE0d0VTYldMMWFhOUkmZT0NCiAgICANCiAgICBUaGFua3Ms
DQogICAgWW9uZw0KICAgIE9uIDEvMjMvMjAxOSA4OjAyIEFNLCBWaWpheSBLaGVta2Egd3JvdGU6
DQogICAgPg0KICAgID4gVGVhbSwNCiAgICA+DQogICAgPiBJIGtub3cgL2Rldi9tZW0gaXMgbm90
IHN1cHBvcnRlZCBpbiBwcm9kdWN0aW9uLCBJIG5lZWQgdG8gY29uZmlndXJlIA0KICAgID4gc29t
ZSBscGMgcmVnaXN0ZXIgdG8gcm91dGUgdWFydCBvdXRwdXQsIHNvIHBsZWFzZSBzdWdnZXN0IHdo
YXQgaXMgdGhlIA0KICAgID4gYmVzdCB3YXlzIHRvIGRvIHRoZSBzYW1lLiBJcyB0aGVyZSBhbnkg
YXBwbGljYXRpb24gb3IgZHJpdmVyIGludGVyZmFjZSANCiAgICA+IGF2YWlsYWJsZSB3aGljaCBj
YW4gYmUgdXNlZCB0byBzZXQgc29tZSBscGMgcmVnaXN0ZXIgbGlrZSAweDFFNzg5MDlDLg0KICAg
ID4NCiAgICA+IFJlZ2FyZHMNCiAgICA+DQogICAgPiAtVmlqYXkNCiAgICA+DQogICAgDQogICAg
DQoNCg==
