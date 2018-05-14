Return-Path: <yupalani@microsoft.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=104.47.32.128; helo=nam01-sn1-obe.outbound.protection.outlook.com;
 envelope-from=yupalani@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="Pv2X7IWv"; dkim-atps=neutral
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam01on0128.outbound.protection.outlook.com [104.47.32.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40l98y2qqZzF2dT
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 05:03:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsZtRGkXTdA9p0UbyGxXIZsnRMyfZrYO0LSlJDM/paA=;
 b=Pv2X7IWvOUy7asPxwZFJhd7RDBm30D1FrQzmd5j15FuBXCVcFQKk3xlign+tycyYG2LkyuaEmMq7QAM2rQSJe8BmOm/AAA/xAM2hwxHPrOkR7KVxTluqW9B5W+zbcoQfuaY9vlOUlvpnevHHxOI2CVKg/4+ayX2FTfbEEBjJ2Is=
Received: from MWHPR21MB0864.namprd21.prod.outlook.com (10.173.51.146) by
 MWHPR21MB0160.namprd21.prod.outlook.com (10.173.52.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.797.3; Mon, 14 May 2018 19:03:52 +0000
Received: from MWHPR21MB0864.namprd21.prod.outlook.com
 ([fe80::b85a:5aef:f32a:d034]) by MWHPR21MB0864.namprd21.prod.outlook.com
 ([fe80::b85a:5aef:f32a:d034%6]) with mapi id 15.20.0797.003; Mon, 14 May 2018
 19:03:52 +0000
From: Yugi Mani <yupalani@microsoft.com>
To: Lei YU <mine260309@gmail.com>, "Lakesh.Sharma@dell.com"
 <Lakesh.Sharma@dell.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: Aspeed AST2520 support in openbmc
Thread-Topic: Aspeed AST2520 support in openbmc
Thread-Index: AQHT5+BPanqUYFMLpkGTItPgQuhwGqQvSRWAgABTaEA=
Date: Mon, 14 May 2018 19:03:52 +0000
Message-ID: <MWHPR21MB0864CA3D12CAEFA86E1D3D7DD69C0@MWHPR21MB0864.namprd21.prod.outlook.com>
References: <495148e9d2b74b00b2fc6e5eedf13cc3@ausx13mpc109.AMER.DELL.COM>
 <CAARXrt=ee74cA2rx=KeBDCS_dENdDpEm7onPs+mzQwgv7N01Tw@mail.gmail.com>
In-Reply-To: <CAARXrt=ee74cA2rx=KeBDCS_dENdDpEm7onPs+mzQwgv7N01Tw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=yupalani@microsoft.com; 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-05-14T19:03:50.8717232Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
 Sensitivity=General
x-originating-ip: [2001:4898:80e8:c::1a5]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0160;
 7:zAnGqZJ+YIH/lHBDl/KupiejJ02X9kVkicgoPQVbXEE+m+hLhzcEY4ONdDsjKVx5kaZWLkiBkf7ACmqdTUfJH3b0iKmDPeHodLGVn4g4MEg9yfFTfkKU55dR6Frf0/bJcyoObe7sqrI413CS0Bag2oBrPgIpe9y++uFeToA2BqqAAs09LkrDWefkfGkgnF6Vq1+oPJeBGdq9u/UM/VIRKK0xgg1CWdK0xcffsVwkVcJsm4ILiY2O5tNr5YcKD9W8;
 20:5S+4Lu1N/DnmAFdDMS6RUE9OheFPH3HbSDJ9ivzIhP7bglOgCJAAux//cLQ1ttwsR/zt6oNWUQzLAfE1+DrS/aRlwtOPQgKc/LIReU7wNkE9aLgsE/ynyorR+UahEeDGlvRoNT8i/9ZsirCVd9ovVkxQCxVXy8c+JdQhiJVGRJo=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(2017052603328)(7193020);
 SRVR:MWHPR21MB0160; 
x-ms-traffictypediagnostic: MWHPR21MB0160:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yupalani@microsoft.com; 
x-microsoft-antispam-prvs: <MWHPR21MB0160BF3D562D80C30D901F08D69C0@MWHPR21MB0160.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(65623756079841)(56004941905204); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3231254)(2018427008)(944501410)(52105095)(3002001)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123560045)(20161123564045)(6072148)(201708071742011);
 SRVR:MWHPR21MB0160; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0160; 
x-forefront-prvs: 067270ECAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(346002)(376002)(39860400002)(39380400002)(199004)(189003)(13464003)(6306002)(55016002)(53936002)(8990500004)(10090500001)(9686003)(68736007)(74316002)(11346002)(446003)(46003)(486006)(476003)(25786009)(97736004)(8666007)(2900100001)(305945005)(7736002)(8676002)(81156014)(81166006)(8936002)(99286004)(76176011)(86612001)(4326008)(53546011)(102836004)(86362001)(3280700002)(7696005)(39060400002)(6246003)(3660700001)(6506007)(186003)(106356001)(105586002)(33656002)(2906002)(5250100002)(2501003)(6116002)(5660300001)(478600001)(22452003)(10290500003)(110136005)(966005)(14454004)(6436002)(229853002)(316002)(42262002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0160;
 H:MWHPR21MB0864.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 53Ur9N8tEgIFn6Qos8Gv0blwg851VQN9ZjM/bgNyo73ZsvYNucBWUSu+2Z8PJIjNB3HtF3qj3l9CrpfjS/Clcf9q/z8d/iupqdMTf+nkWEBGOtNGOukmmUvNRM6Xyy+2iup7ra7zu6Bc9vZ26w+lIItkLjx+F/wovHLN7O+Ata0MgXQ5LW5p+zg55n2+22Iv
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 4a8d860d-99ca-40d2-6f2e-08d5b9cd6f32
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8d860d-99ca-40d2-6f2e-08d5b9cd6f32
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2018 19:03:52.6242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0160
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 May 2018 19:04:04 -0000

QlNQIGlzIGhlcmUgLSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3RyZWUvbWFz
dGVyL21ldGEtb3BlbmJtYy1ic3AvbWV0YS1hc3BlZWQvbWV0YS1hc3QyNTAwDQoNCkNvbmYgaXMg
aGVyZSAtIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvdHJlZS9tYXN0ZXIvbWV0
YS1vcGVuYm1jLW1hY2hpbmVzL21ldGEtZXZiL21ldGEtZXZiLWFzcGVlZC9tZXRhLWV2Yi1hc3Qy
NTAwDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuYm1jIDxv
cGVuYm1jLQ0KPiBib3VuY2VzK3l1cGFsYW5pPW1pY3Jvc29mdC5jb21AbGlzdHMub3psYWJzLm9y
Zz4gT24gQmVoYWxmIE9mIExlaSBZVQ0KPiBTZW50OiBNb25kYXksIE1heSAxNCwgMjAxOCA3OjA0
IEFNDQo+IFRvOiBMYWtlc2guU2hhcm1hQGRlbGwuY29tDQo+IENjOiBPcGVuQk1DIE1haWxsaXN0
IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQo+IFN1YmplY3Q6IFJlOiBBc3BlZWQgQVNUMjUy
MCBzdXBwb3J0IGluIG9wZW5ibWMNCj4gDQo+IE9uIFRodSwgTWF5IDEwLCAyMDE4IGF0IDU6NTQg
QU0sICA8TGFrZXNoLlNoYXJtYUBkZWxsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIZWxsbw0KPiA+
DQo+ID4gSSBBc3BlZWQgQVNUMjUyMCBzdXBwb3J0ZWQgYnkgb3BlbmJtYyA/DQo+IA0KPiBZZXMs
IGl0J3MgcHJldHR5IG11Y2ggdGhlIHNhbWUgYXMgQVNUMjUwMCBleGNlcHQgdGhhdCBpdCBoYXMg
bm8gVkdBLg0KPiBTbyBpdCdzIHN1cHBvcnRlZC4NCj4gDQo+ID4gSSBkb24ndCBzZWUgaXQgaW4g
IGZvbGRlciBtZXRhLW9wZW5ibWMtbWFjaGluZXMvbWV0YS1hcm0NCj4gPg0KPiA+IHJlZ2FyZHMN
Cj4gPiBsYWtlc2gNCg==
