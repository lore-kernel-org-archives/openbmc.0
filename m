Return-Path: <yupalani@microsoft.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=104.47.34.117; helo=nam01-by2-obe.outbound.protection.outlook.com;
 envelope-from=yupalani@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="VW5ZKsUO"; dkim-atps=neutral
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam01on0117.outbound.protection.outlook.com [104.47.34.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zdWyC0yTszF0ZY
 for <openbmc@lists.ozlabs.org>; Sat, 10 Feb 2018 10:49:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cQt5YWRaSazBy+VmMKletFzeGvMhtiRXENL/tDTp06c=;
 b=VW5ZKsUO5IZz4XORKZwtFGX/fgv3bZ+z2N6odkwaeVVw3xNgdWwvvRR4oBncUc0n+H/782W37ARyqJw8Q9PyPeooKy/83MWOTswF873XpSdAQ9HQuPEFPGqIAG9ya/bCCXD03uO5FrlBAqiIWjWXF8+OEHQtykCR1EKsh5BwBI8=
Received: from MWHPR21MB0864.namprd21.prod.outlook.com (10.173.51.146) by
 MWHPR21MB0637.namprd21.prod.outlook.com (10.175.141.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.506.3; Fri, 9 Feb 2018 23:49:46 +0000
Received: from MWHPR21MB0864.namprd21.prod.outlook.com ([10.173.51.146]) by
 MWHPR21MB0864.namprd21.prod.outlook.com ([10.173.51.146]) with mapi id
 15.20.0506.011; Fri, 9 Feb 2018 23:49:45 +0000
From: Yugi Mani <yupalani@microsoft.com>
To: "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>, Chris Ong
 <Chris.Ong@microsoft.com>, "Tanous, Ed" <ed.tanous@intel.com>, Ali Larijani
 <alirhas@microsoft.com>, "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>,
 "hramasub@in.ibm.com" <hramasub@in.ibm.com>, "Michael.E.Brown@dell.com"
 <Michael.E.Brown@dell.com>
CC: "rolfb@us.ibm.com" <rolfb@us.ibm.com>, "jwcarman@us.ibm.com"
 <jwcarman@us.ibm.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 "pradeep.kumar36@tcs.com" <pradeep.kumar36@tcs.com>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "Balaji.B.Rao@dell.com" <Balaji.B.Rao@dell.com>
Subject: RE: Redfish on OpenBMC
Thread-Topic: Redfish on OpenBMC
Thread-Index: AQHTmjMB38s9HgMHYkiJ89jwQXHXiaOOMZ8AgAESj4CAAJbigIAABWvQgAf7RPCAAUu1AIAAAS8QgAFx8QCAAdhfEA==
Date: Fri, 9 Feb 2018 23:49:45 +0000
Message-ID: <MWHPR21MB086430FC98C8732B1DC7FAEBD6F20@MWHPR21MB0864.namprd21.prod.outlook.com>
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
 <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
 <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
 <c73bb370335c45dab208cb0e708a08f4@AUSX13MPS306.AMER.DELL.COM>
 <BL0PR2101MB09150499921D8E104CEB9618ADFA0@BL0PR2101MB0915.namprd21.prod.outlook.com>
 <MWHPR21MB0864D2D2F00B56C21A5917F4D6FC0@MWHPR21MB0864.namprd21.prod.outlook.com>
 <7E9441B1E5EFFD4681F54958E82169932F663F86@ORSMSX114.amr.corp.intel.com>
 <BL0PR2101MB0897B2A1BB35747988A92BCDEAFC0@BL0PR2101MB0897.namprd21.prod.outlook.com>
 <53D123781965AE42A2ABEE982B242E417C8E5B6E@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <53D123781965AE42A2ABEE982B242E417C8E5B6E@IRSMSX102.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=yupalani@microsoft.com; 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-02-09T23:49:44.0756657Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
 Sensitivity=General
x-originating-ip: [2001:4898:80e8:4::6c7]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0637;
 7:/ee79bUfHH3Cn35vZZlU7nhPz3CwOQSlKU7tRsH2bOZasmk03ETy8lkPE2cg+gmIchwMagM3sxIUGlDIr+BnsAze08WnReii5S1BYZ0Fcur4fwckdUGLYomThDNfvDhkquW3y4/94UhnV+IA0AuIAkEsu1cGd+fMrcAWita9eIpcMPdLOyqPfqkwMYTDJAWJxTdIIUB2rUpVy+SMbyT8sXBnMPiiS/WvSHaHDQV4D+lW00e1bCH4fMzphpwVqVya
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(366004)(396003)(39380400002)(376002)(199004)(189003)(102836004)(3480700004)(105586002)(97736004)(8656006)(86612001)(2501003)(6116002)(68736007)(2950100002)(6506007)(53546011)(229853002)(10290500003)(9686003)(6346003)(316002)(110136005)(54906003)(33656002)(2900100001)(6246003)(8990500004)(10090500001)(305945005)(4326008)(478600001)(25786009)(7416002)(6436002)(55016002)(7736002)(106356001)(14454004)(2201001)(22452003)(74316002)(8666007)(3660700001)(93886005)(7116003)(2906002)(3280700002)(77096007)(5660300001)(186003)(76176011)(1511001)(86362001)(7696005)(99286004)(8936002)(81156014)(81166006)(8676002)(53936002)(42262002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0637;
 H:MWHPR21MB0864.namprd21.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b378e0dd-0c54-487b-722d-08d57017cc6a
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7193020);
 SRVR:MWHPR21MB0637; 
x-ms-traffictypediagnostic: MWHPR21MB0637:
x-microsoft-antispam-prvs: <MWHPR21MB0637E26179ED8CF8FCAC1D4FD6F20@MWHPR21MB0637.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(61425038)(6040501)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(3231101)(2400082)(944501161)(10201501046)(6055026)(61426038)(61427038)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(6072148)(201708071742011);
 SRVR:MWHPR21MB0637; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0637; 
x-forefront-prvs: 057859F9C5
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yupalani@microsoft.com; 
x-microsoft-antispam-message-info: HDFGYH5yC+XojHYHFX9Nno3ZhabEjN/J14mqv9L+XLqRJ4NWJkP23r0L+0bRF9CPo7gzgoLxIFbqG34gtI8+wg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b378e0dd-0c54-487b-722d-08d57017cc6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2018 23:49:45.7088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0637
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
X-List-Received-Date: Fri, 09 Feb 2018 23:49:56 -0000

T24gVGh1cnNkYXksIEZlYnJ1YXJ5IDgsIDIwMTggNjoxNyBBTSwgUmFwa2lld2ljeiwgUGF3ZWwg
W3Bhd2VsLnJhcGtpZXdpY3pAaW50ZWwuY29tXSB3cm90ZToNCg0KPiAtIGdldmVudCBhbmQgdXdz
Z2ksIHRob3NlIGFyZSB0d28gaW5kZXBlbmRlbnQgcmVkZmlzaCBzZXJ2ZXINCj4gaW1wbGVtZW50
YXRpb25zPw0KWWVzLCB3ZSBoYWQgZ2V2ZW50IGFuZCB1d3NnaSBvbiBBU1QyNDAwLiANCmdldmVu
dCBhbmQgY2hlcnJ5cHkgb24gQVNUMjUwMC4gDQpDaHJpcydzIHJlc3VsdHMgYXJlIHVzaW5nIGNo
ZXJyeXB5LiANCldlIGFyZSBub3Qgc3VwcG9ydGluZyBnZXZlbnQgYW55bW9yZSBvbiBib3RoIHBs
YXRmb3JtcyBiZWNhdXNlIG9mIGl0cyBsYWNrIG9mIGNvbmN1cnJlbmN5IGFiaWxpdHkuIA0KDQo+
IC0gZG8geW91IGhhdmUgYW55IHRyYWZmaWMgZHVyaW5nIHJldHJpZXZpbmcgcm9vdCBzZXJ2aWNl
Pw0KU3lzdGVtIFVuZGVyIFRlc3QgKFNVVCkgd2FzIG9uIGNvcnBvcmF0ZSBuZXR3b3JrLiBTeXN0
ZW0gbWlnaHQgaGF2ZSByZWNlaXZlZCBzb21lIGJyb2FkY2FzdCBwYWNrZXRzLCBidXQgc2hvdWxk
bid0IGhhdmUgcmVjZWl2ZWQgYW55IHVuaWNhc3QgcGFja2V0cyBleGNlcHQgZm9yIFJlZGZpc2gg
Y29tbWFuZHMuIA0KDQo+IC0gV2FzIGl0IHdpdGggQmFzaWMgSFRUUCBBdXRoLCBvciB3aXRob3V0
IGFueT8NCkFzIEhhcmkgaWRlbnRpZmllZCBiZWZvcmUgc2VydmljZSByb290IHJlcXVlc3RzIHdl
cmUgdW5hdXRoZW50aWNhdGVkIGFuZCBvdGhlciByZXF1ZXN0cyB0aGF0IHdlIGJlbmNobWFya2Vk
IHdlcmUgd2l0aCBiYXNpYyBhdXRoLiANCg0KPiBDb2RlIHNpemU6DQo+IC0gcmVhbCBjb2RlIHNp
emUsIG5vdCBvbiBjb21wcmVzc2VkIGZpbGUgc3lzdGVtDQpXZSBzZXQgdGhpcyBmbGFnICJCQl9H
RU5FUkFURV9NSVJST1JfVEFSQkFMTFMiIGluIG91ciBjb25mIGZpbGUuIFNpemUgSSBzZW50IHdh
cyBmb3IgdGFyIGZpbGUuIA0KDQo+IC0gd2hhdCdzIHRoZSBzaXplIG9mIGRlcGVuZGVudCBsaWJy
YXJpZXMgKGFscmVhZHkgZXhpc3RpbmcgaW4gT3BlbkJNQw0KPiBlbnZpcm9ubWVudCB2cy4gdGhl
IG5ldyBvbmUgcmVxdWlyZWQgb25seSBieSBnaXZlbiBSZWRmaXNoDQo+IGltcGxlbWVudGF0aW9u
KT8NCkkgd2lsbCBjYWxjdWxhdGUgYW5kIGxldCB5b3Uga25vdy4gDQoNCiA+IFBlcmZvcm1hbmNl
Og0KPiAtIFdlIG5lZWQgY29tbW9uIHNjcmlwdCBmb3IgbWVhc3VyZW1lbnQNCklmIHlvdSBhcmUg
dXNpbmcgY3VybCBvbiBsaW51eCwgdGhlbSAidGltZSBjdXJsIC4uLiIgd291bGQgZG8uIA0KDQo+
IC0gQW5kIGNvbW1vbiBtZXRob2QsIEknZCBwcmVmZXIgcnVubmluZyBvbiBtYWNoaW5lIGRpcmVj
dGx5DQo+IGNvbm5lY3RlZCB0byB0aGUgT3BlbkJNQyBwbGF0Zm9ybSB0byBtaW5pbWl6ZSBuZXR3
b3JrIGxhdGVuY3ksIG9yIHRvDQo+IHJ1biBpdCBvdmVyIGxvb3BiYWNrIGludGVyZmFjZSBvbiB0
aGUgcGxhdGZvcm0sIGJ1dCB0aGlzIG1heSBhZmZlY3QNCj4gY29udGV4dCBzd2l0Y2hpbmcNCldl
IGRpZCBpdCBvbiByZWd1bGFyIGNvcnBvcmF0ZSBuZXR3b3JrLiANCg0KPiAtIFRoZSBwZXJmb3Jt
YW5jZSB3aWxsIHN0aWxsIGJlIGJpYXNlZCBieSB0aGUgQ1BVIHRoZSBSZWRmaXNoIGlzIHJ1bm5p
bmcsDQo+IGJ1dCBpdCB3aWxsIGJlIGNsb3NlciB0byBtYWtlIGl0IGNvbXBhcmFibGUuDQpUaGVy
ZSBhcmUgbG90cyBvZiBwYXJhbWV0ZXJzIHRoYXQgY2FuIGFmZmVjdCBSZWRmaXNoIHJlc3BvbnNl
IHRpbWUgLSBudW1iZXIgb2YgcHJvY2Vzc2VzIHJ1bm5pbmcsIHByaW9yaXR5IG9mIHJlZGZpc2gg
c2VydmljZSwgc2l6ZSBvZiByZXNwb25zZSwgaG93IHJlZGZpc2ggZ2F0aGVycyByZXNwb25zZSBk
YXRhLCB3aGF0IGlzIHRoZSBmb3JtYXQgb2Ygc291cmNlIGRhdGEsIGFwYXJ0IGZyb20gQ1BVICYg
TmV0d29yayB0aGF0IHlvdSBpZGVudGlmaWVkLiANCkl0IGlzIHJlYWxseSBoYXJkIHRvIGRvIGFw
cGxlcy1hcHBsZXMgYXMgeW91IHNhaWQuIA0K
