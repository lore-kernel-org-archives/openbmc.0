Return-Path: <yupalani@microsoft.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=104.47.37.114; helo=nam02-cy1-obe.outbound.protection.outlook.com;
 envelope-from=yupalani@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="PzJfQKQz"; dkim-atps=neutral
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0114.outbound.protection.outlook.com [104.47.37.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40n4s417nYzF1x4
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 07:56:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVYpRVIWFIURUVftM5SN0kZylxhqYBSg4pWNQhgh3B8=;
 b=PzJfQKQzSDRMOTE5x0axlZHC2zURPLSPXW1Xjx3aQTVWAcD9P4YH94n9xGCnM4cb7CF3LjgaCYGb5qI0I+p+QsPlgW8aNPTkOTh6yUNprlghYIcRRHLwyIAzF4CzLyl4uTuHpI08zqrY6lNJRL9eVYavwL4VwZn8YfqOunORL/o=
Received: from MWHPR21MB0864.namprd21.prod.outlook.com (10.173.51.146) by
 MWHPR21MB0845.namprd21.prod.outlook.com (10.173.51.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.797.1; Thu, 17 May 2018 21:56:44 +0000
Received: from MWHPR21MB0864.namprd21.prod.outlook.com
 ([fe80::b85a:5aef:f32a:d034]) by MWHPR21MB0864.namprd21.prod.outlook.com
 ([fe80::b85a:5aef:f32a:d034%6]) with mapi id 15.20.0797.007; Thu, 17 May 2018
 21:56:44 +0000
From: Yugi Mani <yupalani@microsoft.com>
To: "Tanous, Ed" <ed.tanous@intel.com>, "Michael.E.Brown@dell.com"
 <Michael.E.Brown@dell.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>,
 "hramasub@in.ibm.com" <hramasub@in.ibm.com>, "Balaji.B.Rao@dell.com"
 <Balaji.B.Rao@dell.com>, "bradleyb@fuzziesquirrel.com"
 <bradleyb@fuzziesquirrel.com>, "pradeep.kumar36@tcs.com"
 <pradeep.kumar36@tcs.com>, "rolfb@us.ibm.com" <rolfb@us.ibm.com>, Chris Ong
 <Chris.Ong@microsoft.com>, Ali Larijani <alirhas@microsoft.com>
Subject: RE: Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group working
 call
Thread-Topic: Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group
 working call
Thread-Index: AdPsYkRv1Xl4DXIGTxCVOcJsabY0fQBvTmKAAAGWxVAAAPnbMA==
Date: Thu, 17 May 2018 21:56:44 +0000
Message-ID: <MWHPR21MB08646F9FE514003ED7288D8DD6910@MWHPR21MB0864.namprd21.prod.outlook.com>
References: <0af13b580c2e4930a98204349822a82b@ausx13mps334.AMER.DELL.COM>
 <MWHPR21MB086447F0749C77694C01B331D6910@MWHPR21MB0864.namprd21.prod.outlook.com>
 <7E9441B1E5EFFD4681F54958E82169933A0B9D36@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169933A0B9D36@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=yupalani@microsoft.com; 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-05-17T21:56:42.4940760Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
 Sensitivity=General
x-originating-ip: [2001:4898:80e8:c::3ae]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0845;
 7:QavQw5v2seOsqio4woy3mXMIpdtsuqPgOIyd2aS7+P5cFlZSF6z6OHw1jHZ0uCwjiFTC+ajTPWobpNPHPlczwsV2yGWpUWeN9NhAmdWsMUvbLRSm7ohRJcSXZVBmlrb6b61AzpNxAadZIAaAgwiorLMskMqJAQFTET5SYrr72ik28DxJSLdJeEy43T41unISSdj4dG9hG1A9OAIiDe1sR97HCfrFCEmiLXzjKSgWrAHUkIuAal1l9PRaLuspA6Y2;
 20:Cvkh5hd/372hfT0gYLK9w02YpamjHi6ZnGyD6LK+TgYaT22uc+MFlB0ojNup152mTlLLGSGq5tqI5AAJmX+JxiZVXPCceci6nyouicN/roZ4TE55C22+v9Cr5SFVnolxVU/8MiQ4U3IPgSeuFzhH6CB8j9HcWCMI9g6WhRlXBq4=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(2017052603328)(7193020);
 SRVR:MWHPR21MB0845; 
x-ms-traffictypediagnostic: MWHPR21MB0845:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yupalani@microsoft.com; 
x-microsoft-antispam-prvs: <MWHPR21MB0845C7F448D1BF493AFDFCA5D6910@MWHPR21MB0845.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(89211679590171)(189930954265078)(65623756079841)(114017886912203)(274839183919467)(219752817060721)(280536654915231)(104084551191319)(56004941905204);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231254)(2018427008)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);
 SRVR:MWHPR21MB0845; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0845; 
x-forefront-prvs: 067553F396
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(376002)(39380400002)(39860400002)(346002)(13464003)(189003)(199004)(229853002)(6246003)(7696005)(76176011)(25786009)(316002)(1511001)(46003)(5660300001)(10090500001)(446003)(6636002)(11346002)(86612001)(2201001)(575784001)(86362001)(6506007)(105586002)(966005)(186003)(486006)(102836004)(8558605004)(53546011)(478600001)(106356001)(10290500003)(3660700001)(14454004)(97736004)(2906002)(7736002)(8676002)(81156014)(81166006)(8936002)(476003)(53936002)(2501003)(110136005)(99286004)(22452003)(8990500004)(8666007)(6116002)(5250100002)(74316002)(2900100001)(305945005)(6436002)(33656002)(8656006)(68736007)(6306002)(9686003)(55016002)(3280700002)(921003)(1121003)(42262002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0845;
 H:MWHPR21MB0864.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 72hncYcRsVgCM6cor61LltpqSYJyDqLwlG4S46K5xGKGB5XD9Z9xcAEkR6lD6uaZb3ZT8pVYhF/WoluwXbpuwPfcEseE13utTjIT9GbjICICapyQzk2oZZ2AjVVOwxsmmQoQs91eZ4J0I22RqQLJEfvAbhiEF/mMv4CFyQoz4JdyY510mDe4sR0d5pGUdB+r
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 6aeb6058-41bd-48a2-03c5-08d5bc41145c
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aeb6058-41bd-48a2-03c5-08d5bc41145c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2018 21:56:44.1752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0845
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
X-List-Received-Date: Thu, 17 May 2018 21:56:57 -0000

Q29vbCwgdGhhbmtzLiANCg0KVGhpcyBzY2hlbWEgaXMgZmFyIGZyb20gc2F0aXNmeWluZyBhbGwg
RlJVIG5lZWRzIHRob3VnaC4gRG8geW91IHBsYW4gdG8gdXNlIEFzc2VtYmx5IHNjaGVtYSBmb3Ig
RlJVPw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFRhbm91cywgRWQg
PGVkLnRhbm91c0BpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMTcsIDIwMTggMjoy
OCBQTQ0KPiBUbzogWXVnaSBNYW5pIDx5dXBhbGFuaUBtaWNyb3NvZnQuY29tPjsgTWljaGFlbC5F
LkJyb3duQGRlbGwuY29tOw0KPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IFBhdWwuVmFuY2ls
QGRlbGwuY29tOw0KPiBocmFtYXN1YkBpbi5pYm0uY29tOyBCYWxhamkuQi5SYW9AZGVsbC5jb207
DQo+IGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbTsgcHJhZGVlcC5rdW1hcjM2QHRjcy5jb207
DQo+IHJvbGZiQHVzLmlibS5jb207IENocmlzIE9uZyA8Q2hyaXMuT25nQG1pY3Jvc29mdC5jb20+
OyBBbGkgTGFyaWphbmkNCj4gPGFsaXJoYXNAbWljcm9zb2Z0LmNvbT4NCj4gU3ViamVjdDogUkU6
IE1lZXRpbmcgTWludXRlcyA1LzE0IC0tIFJFOiBPcGVuQk1DIFJlZGZpc2ggd29ya2luZw0KPiBn
cm91cCB3b3JraW5nIGNhbGwNCj4gDQo+IEFwb2xvZ2llcyBmb3IgdGhlIEhUTUwgZW1haWwuICBJ
IGdvdCB0cmlnZ2VyIGhhcHB5IGFuZCBzZW50IGl0IGZyb20gdGhlDQo+IHdyb25nIGNsaWVudC4g
IFBsYWludGV4dCB2ZXJzaW9uIG9mIGNvbnRlbnQgaXMgYmVsb3c6DQo+IA0KPiBJdCBsb29rcyBs
aWtlIGl0IGdvdCBwdWJsaXNoZWQgb24gTW9uZGF5IGluIHRoZSAyMDE4LjEgU2NoZW1hIGRyb3Au
DQo+IFlvdSdyZSBsb29raW5nIGZvciB0aGUgQXNzZW1ibHkgc2NoZW1hICJBc3NlbWJseV92MS54
bWwiIHBvc3RlZA0KPiBoZXJlOg0KPiANCj4gaHR0cHM6Ly9uYTAxLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZ3DQo+IHd3LmRtdGYub3JnJTJGc2l0
ZXMlMkZkZWZhdWx0JTJGZmlsZXMlMkZzdGFuZGFyZHMlMkZkb2N1bWVudHMlDQo+IDJGRFNQODAx
MF8yMDE4LjEuemlwJmRhdGE9MDIlN0MwMSU3Q3l1cGFsYW5pJTQwbWljcm9zb2Z0LmNvbSU3DQo+
IENmMjI1M2QxMGIxMGE0NDE0ZDQ5MzA4ZDViYzNkMDkwOSU3QzcyZjk4OGJmODZmMTQxYWY5MWFi
MmQ3Y2QwMQ0KPiAxZGI0NyU3QzElN0MwJTdDNjM2NjIxODkyNzAwMjc2NDk1JnNkYXRhPW5nd1A1
R1UwRUhnaGJ5SXBkDQo+IDVTY0pUbkI0VXJOTFpGVVAlMkJoNjZRUXdWaE0lM0QmcmVzZXJ2ZWQ9
MA0KPiANCj4gLUVkDQoNCg==
