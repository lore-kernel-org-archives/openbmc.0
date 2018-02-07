Return-Path: <yupalani@microsoft.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=104.47.42.124; helo=nam03-by2-obe.outbound.protection.outlook.com;
 envelope-from=yupalani@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="ZOX1JlsJ"; dkim-atps=neutral
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam03on0124.outbound.protection.outlook.com [104.47.42.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbnPH1XDzzF0yf
 for <openbmc@lists.ozlabs.org>; Wed,  7 Feb 2018 14:48:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4EdliXUUhe8HiGjE1imVfFAQV1YvecapEPzemQVIxwA=;
 b=ZOX1JlsJet8Ty3pxDz1GFHyGEq2Es3zQwdbcy4cA3AldGgSzXzCzqDF7FTxaCGnxj0gRf58pda0WMQ5fGIABLRWmZbWBUapo2MIQwZwn29p832dfsZsAFPji8aTxDGKc2hGlRrKNNV3sAW/mWmfVdoKNpYVJeq86/HQMI92+NqQ=
Received: from MWHPR21MB0864.namprd21.prod.outlook.com (10.173.51.146) by
 MWHPR21MB0752.namprd21.prod.outlook.com (10.173.51.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.506.4; Wed, 7 Feb 2018 03:48:42 +0000
Received: from MWHPR21MB0864.namprd21.prod.outlook.com ([10.173.51.146]) by
 MWHPR21MB0864.namprd21.prod.outlook.com ([10.173.51.146]) with mapi id
 15.20.0506.007; Wed, 7 Feb 2018 03:48:42 +0000
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
Thread-Index: AQHTmjMB38s9HgMHYkiJ89jwQXHXiaOOMZ8AgAESj4CAAJbigIAABWvQgAf7RPCAAHuUsA==
Date: Wed, 7 Feb 2018 03:48:41 +0000
Message-ID: <MWHPR21MB0864F176FAC58CACB07E5342D6FC0@MWHPR21MB0864.namprd21.prod.outlook.com>
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
 <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
 <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
 <c73bb370335c45dab208cb0e708a08f4@AUSX13MPS306.AMER.DELL.COM>
 <BL0PR2101MB09150499921D8E104CEB9618ADFA0@BL0PR2101MB0915.namprd21.prod.outlook.com>
 <MWHPR21MB0864D2D2F00B56C21A5917F4D6FC0@MWHPR21MB0864.namprd21.prod.outlook.com>
In-Reply-To: <MWHPR21MB0864D2D2F00B56C21A5917F4D6FC0@MWHPR21MB0864.namprd21.prod.outlook.com>
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
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0752;
 7:pHeS/4eCI04apxAQBO1UxvDW1/MySn6clECF0QZbiSaht/2TISZjJh7Rs8rNIKea6m4cAQbE/X7G6Y5Z5blUNNEed+RCKLu0/0qajZZIR5m23CM7xd7G+81ASbZPUnDVy2mzMT+edUyV+ees1TgRbzgfoTPUZJ7JNlL04fVcigN804uR5ojjUySq2LMOtg66zUneX1LJLeYxm338Bx7dLbZoqFXxi216+64GqO4Plm1tSqboAnp/YrEyhfCXHsld
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(366004)(376002)(396003)(39860400002)(39380400002)(346002)(189003)(199004)(6506007)(2940100002)(14454004)(8656006)(6346003)(2900100001)(93886005)(102836004)(7696005)(8990500004)(76176011)(6436002)(10090500001)(6246003)(4326008)(478600001)(316002)(59450400001)(97736004)(25786009)(107886003)(22452003)(33656002)(229853002)(10290500003)(105586002)(54906003)(110136005)(86612001)(3480700004)(86362001)(66066001)(7116003)(2501003)(8936002)(1511001)(81156014)(81166006)(8676002)(2201001)(2950100002)(3660700001)(3280700002)(2906002)(5660300001)(26005)(99286004)(53936002)(106356001)(7416002)(68736007)(74316002)(9686003)(55016002)(6116002)(77096007)(3846002)(8666007)(305945005)(7736002)(42262002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0752;
 H:MWHPR21MB0864.namprd21.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8ac3288f-bb99-4627-1940-08d56dddae33
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7193020);
 SRVR:MWHPR21MB0752; 
x-ms-traffictypediagnostic: MWHPR21MB0752:
x-microsoft-antispam-prvs: <MWHPR21MB07525164619B2D162C4FC852D6FC0@MWHPR21MB0752.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(61425038)(6040501)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3231101)(2400082)(944501161)(3002001)(6055026)(61426038)(61427038)(6041288)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(6072148)(201708071742011);
 SRVR:MWHPR21MB0752; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0752; 
x-forefront-prvs: 0576145E86
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yupalani@microsoft.com; 
x-microsoft-antispam-message-info: HEypkC896Ndd3ZbwJ31alPY1/nUFet6R56c7UMHPWwCf6t9zwyTjDBH6jmkvAA5u3pOygB9zurtNEQ8m/QuT3w==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac3288f-bb99-4627-1940-08d56dddae33
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2018 03:48:41.8365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0752
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
X-List-Received-Date: Wed, 07 Feb 2018 03:48:51 -0000

SGVyZSBhcmUgc29tZSBtb3JlIHJlcXVpcmVtZW50cyBiYXNlZCBvbiBvdXIgZXhwZXJpZW5jZSB3
aXRoIFJlZGZpc2g6DQoxLiBDb25jdXJyZW5jeQ0KV2ViIFNlcnZlciBhbmQgRnJhbWV3b3JrIHNo
b3VsZCBiZSBhYmxlIHRvIHNlcnZlIG11bHRpcGxlIEdFVCByZXF1ZXN0cyBhdCBhIHRpbWUuIA0K
UE9TVC9QQVRDSC9QVVQvREVMRVRFIHJlcXVlc3RzIGNhbiBiZSBzZXF1ZW50aWFsLiANCg0KMi4g
RGV0ZXJtaW5pc3RpYw0KU2VydmljZSBzaG91bGQgYmUgdGltZSBkZXRlcm1pbmlzdGljLCBib3Ro
IGJvb3QgdGltZSBhbmQgcnVuIHRpbWUuIA0KQ29uY3VycmVuY3kgc2hhbGwgbm90IGltcGFjdCBk
ZXRlcm1pbmlzdGljIHByb3BlcnR5IG9mIHRoZSBzZXJ2aWNlLiANCkFsbCByZXF1ZXN0cyBzaGFs
bCBiZSByZXNwb25kZWQgKHN1Y2Nlc3MvZmFpbHVyZSkgd2l0aGluIGFjY2VwdGFibGUgdGltZSBs
aW1pdHMuIA0KV2hlcmUgc29tZSByZXF1ZXN0cyBjYW5ub3QgYmUgY29tcGxldGVkIHdpdGhpbiB0
aW1lIGxpbWl0cywgDQpzZXJ2aWNlIHNoYWxsIHJlc3BvbmQgd2l0aCBzdGF0dXMgYW5kIGV4cGVj
dGVkIHRpbWUgdG8gY29tcGxldGUuIA0KDQozLiBDYWNoZWQgRGF0YQ0KRGF0YSBzaGFsbCBiZSBj
YWNoZWQgYnkgUmVkZmlzaCBzZXJ2aWNlIGFuZCB1cGRhdGVkIG9uIGRidXMgc2lnbmFscy4gDQpD
b2xsZWN0aW5nIHJlcXVpcmVkIGluZm9ybWF0aW9uIG9uIGRlbWFuZCBhZHZlcnNlbHkgaW1wYWN0
cyBwZXJmb3JtYW5jZS4gDQpSZWRmaXNoIHNob3VsZCByYXRoZXIgY2FjaGUgdGhlIGluZm9ybWF0
aW9uIGFuZCBrZWVwIHVwZGF0aW5nIGl0cyBjYWNoZSANCm9uIG5vdGlmaWNhdGlvbiBmcm9tIGRi
dXMgdGhhdCB0aGUgcHJvcGVydHkoaWVzKSBvZiBpbnRlcmVzdCBoYXMgYmVlbiBtb2RpZmllZC4g
DQoNCjQuIFBsYXRmb3JtIGRlcGVuZGVudC9pbmRlcGVuZGVudCBsYXllcg0KU2hhbGwgcHJvdmlk
ZSBhIGNsZWFyIGlzb2xhdGlvbiBiZXR3ZWVuIGNvcmUgdnMgcGxhdGZvcm0gcHJvcGVydGllcy4g
DQpDYW4gY29uc2lkZXIgb2JqZWN0IG9yaWVudGVkIGFwcHJvYWNoIGZvciBwbGF0Zm9ybSAmIG9l
bSBsYXllciANCnRvIG92ZXJyaWRlIGNvcmUgbWV0aG9kcyBhbmQgb2JqZWN0cy4gQ3VzdG9taXpl
ZCBob29rcyBhbmQgaGFuZGxlcnMgDQpjYW4gYmUgcHJvdmlkZWQgYnkgcGxhdGZvcm0gbGF5ZXIg
d2hpbGUgdGhlIGRhdGEgbW9kZWwgDQpiZXR3ZWVuIGxheWVycyBpcyBtYWludGFpbmVkIGNvbnNp
c3RlbnQgYWNyb3NzIHBsYXRmb3Jtcy4gDQoNCjUuIERNVEYgU3VwcG9ydA0KUmVkZmlzaCBoYXZl
IHF1aXRlIGEgbG90IG9mIGdhcHMgaW4gc29tZSBvZiB0aGUgYmFzaWMgcmVxdWlyZW1lbnRzIG9m
IGEgQk1DLiANCmEpIEZSVSAmIEZSVSBDb2xsZWN0aW9uIFNjaGVtYQ0KYikgU2Vuc29yICYgU2Vu
c29yIENvbGxlY3Rpb24gU2NoZW1hDQpjKSBDb21wb25lbnQgRmlybXdhcmUgVXBkYXRlIChQU1Us
IEJJT1MsIENQTEQsIGV0YykNCmQpIE1hc3RlciBXcml0ZS1SZWFkDQplKSBDbGVhciBQU1UgRmF1
bHRzDQpXZSBuZWVkIERNVEYgdG8gYWN0aXZlbHkgYWRkL3VwZGF0ZSBSZWRmaXNoIHNjaGVtYXMg
dGhhdCBhcmUgZnVuZGFtZW50YWwgdG8gYW55IEJNQy4NCg0KNy4gRXJyb3IgQ29kZXMNClJlZGZp
c2ggTG9nRW50cnkgc2NoZW1hIGRvZXNu4oCZdCBvZmZlciBhIHBsYWNlaG9sZGVyIGZvciBlcnJv
ciBjb2RlcyANCnRoYXQgYXV0b21hdGlvbiB0b29scyBjYW4gcmVhZCB0byBjYXRlZ29yaXplIHRo
ZSBldmVudHMgYW5kIHRyaWdnZXIgYWN0dWF0b3JzLiANCk9uZSBvcHRpb24gaXMgdG8gcmVwdXJw
b3NlIE9FTSBmaWVsZC4gDQoNCjguIFBhZ2luYXRpb24NCkV2ZW50IGxvZ3MgY2FuIGdldCB0b28g
YmlnIGFuZCBwYWdpbmF0ZWQgdmlldyBpcyBoZWxwZnVsDQoNCjkuIEZpbHRlcmluZw0KUXVlcnkg
cGFyYW1ldGVyIHRvIGZpbHRlciB0aGUgcmVzcG9uc2UgbGltaXRlZCB0byBjZXJ0YWluIGNyaXRl
cmlhDQoNCjEwLiBBbmNob3JzDQpTY2hlbWFzIGxpa2UgQ2hhc3NpcyBhbmQgTWFuYWdlciBoYXZl
IGEgYnVuY2ggb2YgcHJvcGVydGllcyANCnRoYXQgbm90IGFsbCByZXF1ZXN0cyBtaWdodCBiZSBp
bnRlcmVzdGVkIGluLiANCkl0IGlzIGJldHRlciB0byBiZSBhYmxlIHRvIHJlcXVlc3QganVzdCBh
IGZyYWdtZW50IG9mIGEgcmVzb3VyY2UgdXNpbmcg4oCYI+KAmS4gDQoNCjExLiBSYXRlIExpbWl0
aW5nDQpTZXJ2ZXIgc2hhbGwgcmV0dXJuIEhUVFAgNDI5IHdoZW4gbnVtYmVyIG9mIHJlcXVlc3Rz
IGNyb3NzIG1heCBsaW1pdCBwZXJtaXNzaWJsZSBmcm9tIGEgY2xpZW50LiANCldlIG5lZWQgc29t
ZSBwcm90ZWN0aW9uIGFnYWluc3QgRGVuaWFsIG9mIFNlcnZpY2UuDQoNCi1ZdWdpDQo=
