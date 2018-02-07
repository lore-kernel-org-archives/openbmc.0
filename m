Return-Path: <Chris.Ong@microsoft.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=104.47.40.91; helo=nam03-co1-obe.outbound.protection.outlook.com;
 envelope-from=chris.ong@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="DPAzS+LH"; dkim-atps=neutral
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0091.outbound.protection.outlook.com [104.47.40.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zc5yK03zMzF140
 for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2018 03:15:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=KSmUvIUBh2SqfiaDqPfFXMZKN8fB73efwgRptrdCC2E=;
 b=DPAzS+LHaJ6UUeJZjdgc2apD+SGK/47wPYwaB/k/wyN/PvBvqDXRuapCPKQ+Iu2XcGvLApWReIXkKq6vD9aYCWJkhJnP8i2CUbeqRPES+gtojbEUtLu6k83MQErMC3BFsFpYk8oSQBzQTVSmlGcB8FGuoqrIjriA8o0egoP1vhI=
Received: from BL0PR2101MB0897.namprd21.prod.outlook.com (52.132.23.146) by
 BL0PR2101MB1075.namprd21.prod.outlook.com (52.132.24.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.506.3; Wed, 7 Feb 2018 16:14:57 +0000
Received: from BL0PR2101MB0897.namprd21.prod.outlook.com
 ([fe80::cd60:6250:3347:f443]) by BL0PR2101MB0897.namprd21.prod.outlook.com
 ([fe80::cd60:6250:3347:f443%2]) with mapi id 15.20.0506.007; Wed, 7 Feb 2018
 16:14:56 +0000
From: Chris Ong <Chris.Ong@microsoft.com>
To: "Tanous, Ed" <ed.tanous@intel.com>, Yugi Mani <yupalani@microsoft.com>,
 Ali Larijani <alirhas@microsoft.com>, "Paul.Vancil@dell.com"
 <Paul.Vancil@dell.com>, "hramasub@in.ibm.com" <hramasub@in.ibm.com>,
 "Michael.E.Brown@dell.com" <Michael.E.Brown@dell.com>
CC: "Balaji.B.Rao@dell.com" <Balaji.B.Rao@dell.com>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "jwcarman@us.ibm.com" <jwcarman@us.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "pradeep.kumar36@tcs.com"
 <pradeep.kumar36@tcs.com>, "rolfb@us.ibm.com" <rolfb@us.ibm.com>
Subject: RE: Redfish on OpenBMC
Thread-Topic: Redfish on OpenBMC
Thread-Index: AQHTmjMB38s9HgMHYkiJ89jwQXHXiaOOMZ8AgAESj4CAAJbigIAABWvQgAf7RPCAAUu1AIAAAS8Q
Date: Wed, 7 Feb 2018 16:14:56 +0000
Message-ID: <BL0PR2101MB0897B2A1BB35747988A92BCDEAFC0@BL0PR2101MB0897.namprd21.prod.outlook.com>
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
 <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
 <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
 <c73bb370335c45dab208cb0e708a08f4@AUSX13MPS306.AMER.DELL.COM>
 <BL0PR2101MB09150499921D8E104CEB9618ADFA0@BL0PR2101MB0915.namprd21.prod.outlook.com>
 <MWHPR21MB0864D2D2F00B56C21A5917F4D6FC0@MWHPR21MB0864.namprd21.prod.outlook.com>
 <7E9441B1E5EFFD4681F54958E82169932F663F86@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F663F86@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=chong@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-02-07T16:14:54.5400735Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
 Sensitivity=General
x-originating-ip: [2001:4898:80e8:9::30c]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BL0PR2101MB1075;
 7:S5GozjWIo+qHQIoERZg1WCxF65SV3Z69jszlkY+3ktwZQEo/pMfASEZtVI1WSGeq09lE6wBv8tyIISmOxUdFSmCwtXR62Y1dmgMC+htE2+WUkUrDggHBKZq6A4fR6ZLGgXxyJjrtpmSqcZb/gr77ll4MkQOR//5zpK+OnYO0Ol9wdZSwrENaZ2zlgJ0cId33fdRE/TX3fCiDCypmxd54hZvwGzMe+Rp3PU6l5j42XlNzw7dEhaeCIK8yN4JhqZZT
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(39380400002)(39860400002)(346002)(376002)(366004)(396003)(13464003)(199004)(189003)(8990500004)(229853002)(74316002)(7736002)(86362001)(2201001)(106356001)(305945005)(86612001)(9686003)(3280700002)(6116002)(25786009)(2906002)(6436002)(7416002)(10090500001)(8666007)(3660700001)(55016002)(5250100002)(68736007)(93886005)(7116003)(5660300001)(72206003)(2501003)(2950100002)(478600001)(6246003)(14454004)(33656002)(8656006)(10290500003)(53936002)(99286004)(110136005)(54906003)(81166006)(81156014)(6506007)(102836004)(2900100001)(105586002)(59450400001)(22452003)(316002)(4326008)(1511001)(6346003)(8936002)(186003)(97736004)(53546011)(3480700004)(8676002)(7696005)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR2101MB1075;
 H:BL0PR2101MB0897.namprd21.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7a3f6553-e7ac-445c-44ca-08d56e45edf3
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7193020);
 SRVR:BL0PR2101MB1075; 
x-ms-traffictypediagnostic: BL0PR2101MB1075:
x-microsoft-antispam-prvs: <BL0PR2101MB107543C43C28A7D2C52D9507EAFC0@BL0PR2101MB1075.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(89211679590171)(65623756079841)(114017886912203)(274839183919467)(280536654915231)(104084551191319)(56004941905204)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(61425038)(6040501)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231101)(2400082)(944501161)(3002001)(6055026)(61426038)(61427038)(6041288)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(6072148)(201708071742011);
 SRVR:BL0PR2101MB1075; BCL:0; PCL:0; RULEID:; SRVR:BL0PR2101MB1075; 
x-forefront-prvs: 0576145E86
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Ong@microsoft.com; 
x-microsoft-antispam-message-info: M/kVidWIX1SrTFrRrW+OxSZFZjz+7UoJXkfsJX2Psyvkq5KYmsMV7UR7DCxPv8tORYRav9rcFByiYPgaterYIg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3f6553-e7ac-445c-44ca-08d56e45edf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2018 16:14:56.4283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR2101MB1075
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
X-List-Received-Date: Wed, 07 Feb 2018 16:15:06 -0000

SGkgRWQsDQoNCk9uIG91ciBBU1QyNTIwIHBsYXRmb3JtOg0KUmVhZGluZyBzZW5zb3JzIHVzaW5n
IFJlZGZpc2ggdGFrZXMgYWJvdXQgMTItMTMgc2Vjb25kcyBmb3IgYWJvdXQgMjAwIHNlbnNvcnMu
IElmIDEwIHRocmVhZHMgYXJlIHJlcXVlc3RpbmcgdGhlIHJlYWQgYXQgdGhlIHNhbWUgdGltZSwg
dGhlIGF2ZXJhZ2UgdGltZSB0byByZXR1cm4gaXMgYWJvdXQgNzAgc2Vjb25kcy4NCg0KRm9yIHJl
YWRpbmcgbG9ncywgaXQgdGFrZXMgYWJvdXQgMTAwIHNlY29uZHMgZm9yIDQwMDAgbG9nIGVudHJp
ZXMuIFRoZSB0aW1lIHNjYWxlcyBsaW5lYXJseSB3aXRoIHRoZSBudW1iZXIgb2YgbG9ncywgZS5n
LiBmb3IgMjAwMCBsb2dzLCBpdCB3b3VsZCB0YWtlIGFyb3VuZCA1MHMuDQoNCkNocmlzDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBUYW5vdXMsIEVkIDxlZC50YW5vdXNAaW50
ZWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgNywgMjAxOCA4OjA5IEFNDQpUbzog
WXVnaSBNYW5pIDx5dXBhbGFuaUBtaWNyb3NvZnQuY29tPjsgQWxpIExhcmlqYW5pIDxhbGlyaGFz
QG1pY3Jvc29mdC5jb20+OyBQYXVsLlZhbmNpbEBkZWxsLmNvbTsgaHJhbWFzdWJAaW4uaWJtLmNv
bTsgTWljaGFlbC5FLkJyb3duQGRlbGwuY29tDQpDYzogQmFsYWppLkIuUmFvQGRlbGwuY29tOyBi
cmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb207IGp3Y2FybWFuQHVzLmlibS5jb207IG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZzsgcHJhZGVlcC5rdW1hcjM2QHRjcy5jb207IHJvbGZiQHVzLmlibS5j
b207IENocmlzIE9uZyA8Q2hyaXMuT25nQG1pY3Jvc29mdC5jb20+DQpTdWJqZWN0OiBSRTogUmVk
ZmlzaCBvbiBPcGVuQk1DDQoNCj4gPiBQZXJmb3JtYW5jZQ0KPiA+IEhvdyBmYXN0IGlzIGl0Pw0K
PiBTeW5jaHJvbm91cyBBUEkgZm9yIFNlbnNvcnMgYW5kIFNFTCB0YWtlcyBsb25nZXIgdG8gcmVz
cG9uZC4NCj4gSXQgdGFrZXMgYWJvdXQgMTkgc2Vjb25kcyBmb3IgMTAwIHNlbnNvcnMgYW5kIG1v
cmUgdGhhbiA2IG1pbnV0ZXMgZm9yIA0KPiA0MDAwIGV2ZW50cy4NCj4gMTAgY29uY3VycmVudCBy
ZXF1ZXN0cyBjYW4gbWFrZSB0aGVtIDQtNSB0aW1lcyBzbG93ZXIgdGhhbiB1c3VhbC4NCj4gQXN5
bmNocm9ub3VzIEFQSSBmb3IgQk1DIGFuZCBjb21wb25lbnQgZmlybXdhcmUgdXBkYXRlIHRha2Vz
IDUtMTAgDQo+IG1pbnV0ZXMgYXMgZXhwZWN0ZWQuDQo+IFRoZXNlIHJlc3VsdHMgYXJlIG9uIEFT
VDI0MDAuDQoNCkRvIHlvdSBoYXZlIHRoZSBzYW1lIGRhdGEgZm9yIHlvdXIgMjUwMCBwbGF0Zm9y
bXM/DQoNCg==
