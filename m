Return-Path: <yupalani@microsoft.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=104.47.33.98; helo=nam01-bn3-obe.outbound.protection.outlook.com;
 envelope-from=yupalani@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="OEI7cQKa"; dkim-atps=neutral
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0098.outbound.protection.outlook.com [104.47.33.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbnHQ4FN3zF0Zv
 for <openbmc@lists.ozlabs.org>; Wed,  7 Feb 2018 14:43:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=fUTnQc9dfTFv0fd2uCL3atunbKZc6lkJ+0prfrllkYE=;
 b=OEI7cQKa2KDG4YkPLYQHQmv4G52doZggDjseHQSJq+ePw58NYytW9+wor/NN9nKTEfD8bC0huUb8sagFpBKz6tYtj/4oOMML5HlWHrMpVQWmmUFl72iXagE326Qpo6DcEFCw2dDPxpOVNmFVtC0gMa4y1fC7Ol1raye4F8iALag=
Received: from MWHPR21MB0864.namprd21.prod.outlook.com (10.173.51.146) by
 MWHPR21MB0847.namprd21.prod.outlook.com (10.173.51.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.506.3; Wed, 7 Feb 2018 03:43:38 +0000
Received: from MWHPR21MB0864.namprd21.prod.outlook.com ([10.173.51.146]) by
 MWHPR21MB0864.namprd21.prod.outlook.com ([10.173.51.146]) with mapi id
 15.20.0506.007; Wed, 7 Feb 2018 03:43:24 +0000
From: Yugi Mani <yupalani@microsoft.com>
To: Ali Larijani <alirhas@microsoft.com>, "Paul.Vancil@dell.com"
 <Paul.Vancil@dell.com>, "hramasub@in.ibm.com" <hramasub@in.ibm.com>,
 "Michael.E.Brown@dell.com" <Michael.E.Brown@dell.com>
CC: "Balaji.B.Rao@dell.com" <Balaji.B.Rao@dell.com>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "ed.tanous@intel.com" <ed.tanous@intel.com>, "jwcarman@us.ibm.com"
 <jwcarman@us.ibm.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 "pradeep.kumar36@tcs.com" <pradeep.kumar36@tcs.com>, "rolfb@us.ibm.com"
 <rolfb@us.ibm.com>, Chris Ong <Chris.Ong@microsoft.com>
Subject: RE: Redfish on OpenBMC
Thread-Topic: Redfish on OpenBMC
Thread-Index: AQHTmjMB38s9HgMHYkiJ89jwQXHXiaOOMZ8AgAESj4CAAJbigIAABWvQgAf7RPA=
Date: Wed, 7 Feb 2018 03:43:24 +0000
Message-ID: <MWHPR21MB0864D2D2F00B56C21A5917F4D6FC0@MWHPR21MB0864.namprd21.prod.outlook.com>
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
 <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
 <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
 <c73bb370335c45dab208cb0e708a08f4@AUSX13MPS306.AMER.DELL.COM>
 <BL0PR2101MB09150499921D8E104CEB9618ADFA0@BL0PR2101MB0915.namprd21.prod.outlook.com>
In-Reply-To: <BL0PR2101MB09150499921D8E104CEB9618ADFA0@BL0PR2101MB0915.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=alirhas@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-02-01T18:29:25.5300929Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
 Sensitivity=General
x-originating-ip: [73.109.60.251]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0847;
 7:+J8eIBzgVqkjODVCa7hYBL1jSuAKG9BHFMPfIb9hknZAbSbPJ3yMzAsV+RtdXe/1q1AyLv5cpsTPQoo1qIC+f2dtg0JQBepjNdg+RsORtEsElMfxjSwGkSCK4aO5Dz4Nh4Y6Nfmi/knOMrJPF1jlgm8XE2pCBepMDEiVoZ31walJONfGDsBxlCu5z/ui/gNwGY/OA1TsjB6GBtXmGfsghup3AhexEvXYpduLQW6hj5jqv2dsEq5XrI1YLjal9hid
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 77c3b4ad-d400-435d-f7a3-08d56ddcf12b
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7193020);
 SRVR:MWHPR21MB0847; 
x-ms-traffictypediagnostic: MWHPR21MB0847:
x-microsoft-antispam-prvs: <MWHPR21MB0847D12CB9E135C97333E985D6FC0@MWHPR21MB0847.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863)(192374486261705)(56004941905204); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(61425038)(6040501)(2401047)(5005006)(8121501046)(3002001)(3231101)(2400082)(944501161)(10201501046)(93006095)(93001095)(6055026)(61426038)(61427038)(6041288)(20161123564045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(6072148)(201708071742011);
 SRVR:MWHPR21MB0847; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0847; 
x-forefront-prvs: 0576145E86
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(396003)(376002)(366004)(39380400002)(189003)(199004)(1511001)(105586002)(7416002)(107886003)(93886005)(3660700001)(8936002)(81166006)(81156014)(8676002)(66066001)(229853002)(10290500003)(6246003)(3480700004)(3280700002)(74316002)(7736002)(99286004)(305945005)(110136005)(54906003)(2201001)(77096007)(8656006)(97736004)(22452003)(316002)(14454004)(4326008)(25786009)(86362001)(68736007)(478600001)(86612001)(2906002)(7116003)(5660300001)(26005)(6346003)(59450400001)(6506007)(76176011)(7696005)(102836004)(53546011)(2900100001)(2950100002)(2501003)(9686003)(10090500001)(53936002)(8990500004)(106356001)(33656002)(6436002)(8666007)(6116002)(3846002)(55016002)(42262002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0847;
 H:MWHPR21MB0864.namprd21.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yupalani@microsoft.com; 
x-microsoft-antispam-message-info: as8HG4kFJWlKT2W9AlzFSj7FbvZFyxLoXN3RNExI4eu+oQ+b+xzm7GmYWjH8Kfe0GXCpduKcCMtC0UbYunDKTA==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c3b4ad-d400-435d-f7a3-08d56ddcf12b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2018 03:43:24.6354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0847
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Feb 2018 03:43:49 -0000

T24gMDEvMzEvMjAxOCAxMDoxNyBQTSBNaWNoYWVsIEJyb3duIDxNaWNoYWVsLkUuQnJvd25AZGVs
bC5jb20+IHdyb3RlOg0KPiBEbyB5b3UgaGF2ZSBhIHJlZGZpc2ggc2VydmVyIGltcGxlbWVudGF0
aW9uPw0KWWVzDQoNCj4gSXMgaXQgT3BlbiBTb3VyY2U/DQpOb3QgeWV0LCBidXQgd2lsbCBiZSBv
cGVuIHNvdXJjZWQgYWZ0ZXIgTEYgdHJhbnNmZXINCg0KPiBJZiBub3QsIGFyZSB5b3UgcGxhbm5p
bmcgb24gb3BlbiBzb3VyY2luZyBpdD8NClllcw0KDQo+IFdoYXQgaXMgdGhlIGxpY2Vuc2U/DQpN
SVQNCg0KPiBJcyBpdCBwb3N0ZWQgdG8gZ2l0aHViIG9yIG90aGVyIHB1YmxpYyBzb3VyY2UgY29u
dHJvbD8NCk5vdCB5ZXQsIGFmdGVyIExGIHRyYW5zZmVyDQoNCj4gRG9lcyBpdCBwYXNzIHRoZSBE
TVRGIHJlZGZpc2ggc2VydmljZSB2YWxpZGF0b3I/DQpJbiBwcm9ncmVzcy4gVmFsaWRhdG9yIHRv
b2wgcmFuIGJ1dCBkaWRu4oCZdCBnZW5lcmF0ZSBhIHJlcG9ydCBhbmQgDQpjb25mb3JtYW5jZSB0
b29sIG5lZWQgdG8gYmUgcG9ydGVkIHRvIFB5dGhvbiAyLjcuDQoNCj4gV2hhdCBsYW5ndWFnZSBp
cyBpdCB3cml0dGVuIGluPw0KUHl0aG9uIDIuNw0KDQo+IEhvdyBiaWcgaXMgaXQ/DQpTaXplIGlz
IGFwcHJveGltYXRlbHkgNjUwS0IgKENoZXJyeVB5ICsgQm90dGxlKSwgDQpub3QgaW5jbHVkaW5n
IHB5dGhvbiwgc2NoZW1hIGFuZCB0ZW1wbGF0ZXMNCg0KPiBDYW4gaXQgYmUgZWFzaWx5IGV4dGVu
ZGVkL3JlLXVzZWQgYnkgYW55Ym9keSBlbHNlIHNoaXBwaW5nIA0KPiBjb21wbGlhbnQgb3BlbmJt
YyBpbXBsZW1lbnRhdGlvbnM/DQpJdCBpcyBpbnRlZ3JhdGVkIHdpdGggYSBmb3JrIG9mIE9wZW5C
TUMgYW5kIGJlaW5nIHNoaXBwZWQgDQppbiBmZXcgZXhwYW5zaW9uIGJveCBwcm9kdWN0cyBhdCBN
aWNyb3NvZnQuDQoNCj4gQ2FuIHlvdSBhZGQgT0VNIGV4dGVuc2lvbnMgdG8gZXhpc3RpbmcgUmVk
ZmlzaCBSZXNvdXJjZXMgDQo+IHdpdGhvdXQgImZvcmtpbmciIHRoZSBjb2RlYmFzZT8NCk5vLCBp
dCBpcyBhIGZsYXQgc3RydWN0dXJlIG5vdyBhbmQgYW55IGN1c3RvbWl6YXRpb24gd291bGQgcmVx
dWlyZSBmb3JraW5nDQoNCj4gQ2FuIHlvdSBjaGFuZ2UgdGhlIGltcGxlbWVudGF0aW9uIGZvciBh
IHNpbmdsZSBSZWRmaXNoIFJlc291cmNlIFByb3BlcnR5IA0KPiB3aXRob3V0IGZvcmtpbmc/DQpO
bw0KDQo+IENhbiB5b3UgYWRkIG5ldyBSZWRmaXNoIFJlc291cmNlcyB3aXRob3V0IGZvcmtpbmc/
DQpObw0KDQo+IFBlcmZvcm1hbmNlDQo+IEhvdyBmYXN0IGlzIGl0Pw0KU3luY2hyb25vdXMgQVBJ
IGZvciBTZW5zb3JzIGFuZCBTRUwgdGFrZXMgbG9uZ2VyIHRvIHJlc3BvbmQuIA0KSXQgdGFrZXMg
YWJvdXQgMTkgc2Vjb25kcyBmb3IgMTAwIHNlbnNvcnMgYW5kIG1vcmUgdGhhbiA2IG1pbnV0ZXMg
Zm9yIDQwMDAgZXZlbnRzLiANCjEwIGNvbmN1cnJlbnQgcmVxdWVzdHMgY2FuIG1ha2UgdGhlbSA0
LTUgdGltZXMgc2xvd2VyIHRoYW4gdXN1YWwuIA0KQXN5bmNocm9ub3VzIEFQSSBmb3IgQk1DIGFu
ZCBjb21wb25lbnQgZmlybXdhcmUgdXBkYXRlIHRha2VzIDUtMTAgbWludXRlcyBhcyBleHBlY3Rl
ZC4gDQpUaGVzZSByZXN1bHRzIGFyZSBvbiBBU1QyNDAwLiANCg0KPiBEb2VzIGl0IGltcGxlbWVu
dCBTU0w/DQpZZXMNCg0KPiBTZWN1cml0eQ0KPiBXaGF0IGlzIHRoZSBzZWN1cml0eSBtb2RlbD8N
CkJhc2ljIGF1dGhlbnRpY2F0aW9uICh1c2VyL3B3ZCkNCg0KPiBOb24tcm9vdCBzdXBwb3J0PyBD
YW4gaXQgcnVuIGFzIGEgbm9uLXByaXZpbGVnZWQgdXNlcj8NCkdvb2QgcXVlc3Rpb24uIEN1cnJl
bnRseSBpdCBpcyBydW5uaW5nIGFzIHJvb3QsIHdlIGhhdmVu4oCZdCB0cmllZCBub24tcm9vdCB0
aG91Z2guIA0KU2luY2UgeW91IGFza2VkLCB3ZSBtaWdodCBhcyB3ZWxsIHdvdWxkIGxpa2UgdG8g
c3RhcnQgdGhpcyBzZXJ2aWNlIGFzIG5vbi1yb290LiANCg0KPiBEb2VzIGl0IGltcGxlbWVudCBi
YXNpYyBhdXRoZW50aWNhdGlvbiBhbmQgdGhlIHJlZGZpc2ggc3BlYyB4LWF1dGgtdG9rZW4gYXV0
aGVudGljYXRpb24/DQpCYXNpYyBhdXRoIG9ubHkuIFRva2VuIGF1dGggaXMgbm90IGEgcmVxdWly
ZW1lbnQgZm9yIHVzIGF0IHRoaXMgdGltZS4gDQoNCj4gRG9lcyBpdCBpbXBsZW1lbnQgdGhlIHJl
ZGZpc2ggc3RhbmRhcmQgcHJpdmlsZWdlIG1hcCBtb2RlbD8NCldlIGhhdmUgb25lIHVzZXIgb25s
eS4gV2UgZG9u4oCZdCBoYXZlIGFjY291bnQgc2VydmljZSwgcm9sZSBhbmQgcHJpdmlsZWdlLiAN
Ck11bHRpcGxlIHVzZXJzIGFuZCByb2xlcyBhcmUgbm90IGEgcmVxdWlyZW1lbnQgZm9yIHVzIGF0
IHRoaXMgdGltZS4gDQoNCj4gRXZlbnRpbmc6DQo+IEZvciB3cml0aW5nIGEgVUkgb24gdG9wIG9m
IHJlZGZpc2gsIHNvbWV0aGluZyBsaWtlIFNTRSBpcyBhIG5pY2UtdG8taGF2ZSB0byBhdm9pZCBw
b2xsaW5nIGluIHRoZSBicm93c2VyLiANCj4gVGhlcmUgYXJlIGEgY291cGxlIG9mIHByb3Bvc2Vk
IFNTRSBleHRlbnNpb25zIHRoYXQgaGF2ZSBub3QgeWV0IGJlZW4gYXBwcm92ZWQuDQo+IEhvdyBt
dWNoIHdvcmsgdG8gaW1wbGVtZW50IFNTRSBzdXBwb3J0IHRvIGRvIHRoaW5ncyBsaWtlIHdhdGNo
IFByb3BlcnR5IGNoYW5nZXM/DQo+IElzIHRoZSBzdGFuZGFyZCByZWRmaXNoIGV2ZW50aW5nIG1v
ZGVsIHN1cHBvcnRlZD8NCj4gU2VjdXJpdHkgbW9kZWwgaW50ZWdyYXRlZCB3aXRoIGV2ZW50aW5n
PyBEbyBldmVudGluZyByZWNvcmRzIGdldCB0aGUgc2FtZSBzZWN1cml0eSB0cmVhdG1lbnQgYXMg
R0VUIHJlcXVlc3RzPw0KRXZlbnRTZXJ2aWNlLCBTZXJ2ZXItU2VudCBFdmVudCBhbmQgVUkgYXJl
IG5vdCBhIHJlcXVpcmVtZW50IGZvciB1cy4gDQpJZiB0aG9zZSB3ZXJlIHRvIGJlIHN1cHBvcnRl
ZCwgYW4gb3B0aW9uIHRvIGVuYWJsZS9kaXNhYmxlIA0KdGhlc2UgZmVhdHVyZXMgYXMgbmVlZGVk
IGF0IGJ1aWxkLXRpbWUgd291bGQgYmUgYmV0dGVyLg0KDQo+IERldmVsb3BtZW50OiBjYW4gaXQg
cnVuIG91dHNpZGUgb2Ygb3BlbmJtYz8NCkltcGxlbWVudGVkIHVzaW5nIFB5dGhvbiAyLjcsIHNv
IHNob3VsZCBydW4gb24gYW55IHBsYXRmb3JtLiANCkJ1dCBpdCBhbHNvIHRyaWVzIHRvIGFjY2Vz
cyBsb2NhbCBmaWxlcyBhbmQgZGJ1cyBvYmplY3RzLiANCkl0IGxpa2VseSB3b3VsZCByZXF1aXJl
IHNvbWUgY2hhbmdlcyB0byBydW4gb3V0c2lkZSBvZiBvcGVuYm1jLg0KDQotWXVnaQ0K
