Return-Path: <yupalani@microsoft.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=104.47.34.109; helo=nam01-by2-obe.outbound.protection.outlook.com;
 envelope-from=yupalani@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="Qd0cyzxb"; dkim-atps=neutral
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam01on0109.outbound.protection.outlook.com [104.47.34.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lm5t23HvzF2Ln
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 04:18:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVXN2tLtWAQMmBcSxcJy4lBOgeQ1DHz9DLH+ztjoQD4=;
 b=Qd0cyzxbuxx4NXmEkOAJ2TydlAx50jeJ8RsFmFSzgRYOx+IkOYDOuX1qryRjKIBCDheIMH2H64Ch2I11EMOBtqn/rBSR5LBXAKyELEz02j7VzSn6Q4hVY6D6zAw9AwmCk1tb8ybrGUc7D/oLOlSXA0e4mJk6KC67w3jIkSRvdHA=
Received: from MWHPR21MB0864.namprd21.prod.outlook.com (10.173.51.146) by
 MWHPR21MB0782.namprd21.prod.outlook.com (10.173.51.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.797.1; Tue, 15 May 2018 18:18:19 +0000
Received: from MWHPR21MB0864.namprd21.prod.outlook.com
 ([fe80::b85a:5aef:f32a:d034]) by MWHPR21MB0864.namprd21.prod.outlook.com
 ([fe80::b85a:5aef:f32a:d034%6]) with mapi id 15.20.0797.004; Tue, 15 May 2018
 18:18:19 +0000
From: Yugi Mani <yupalani@microsoft.com>
To: Lei YU <mine260309@gmail.com>, Adriana Kobylak <anoo@linux.vnet.ibm.com>
CC: Stewart Smith <stewart@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: BMC Image Signing Proposal
Thread-Topic: BMC Image Signing Proposal
Thread-Index: AQHToRsVyP6JP+mT8kapTMVsySP6DaOxTlMAgAef1wCAd7JLAIABCDqg
Date: Tue, 15 May 2018 18:18:19 +0000
Message-ID: <MWHPR21MB0864432C6CB8EF9A575589B0D6930@MWHPR21MB0864.namprd21.prod.outlook.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au> <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
 <87lggezywe.fsf@linux.vnet.ibm.com>
 <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
 <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
 <874lm8pjd7.fsf@linux.vnet.ibm.com>
 <e1431b039c817b23b49b6f5833760152@linux.vnet.ibm.com>
 <CAARXrtn6M=tzE-yMJWN4yaSHZJUYksMT=vMvVymY0kvgQJ4bfQ@mail.gmail.com>
In-Reply-To: <CAARXrtn6M=tzE-yMJWN4yaSHZJUYksMT=vMvVymY0kvgQJ4bfQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=yupalani@microsoft.com; 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-05-15T18:18:17.8960482Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
 Sensitivity=General
x-originating-ip: [2001:4898:80e8:c::1a5]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0782;
 7:Ws+KwH1BdtRDW5ZnfeJJah8zf7V2XmEFtl89plassKy+QkbF1XjyYEc3c40t3vIzS4O7HoXzA0LfDmdikqdLWVMFORYGiaQeMiNrI35B0atLJ4h2YvKCWOgh4/ZQU/iL+BxGVb/8z7RSp29PWep4O//Uz6xzHXU055Lz0o6V82dFRZAxdyKpcNNNFje//NVxczuCg4C8f/zYu26MDFOmKZWUIAEA29xfWh+7Vbn2QgdNW0bwfwtRQ6HTJIXk8KxF;
 20:+YXCYm+TjYQffJio7SgJ+4vB8uxPn3wRBx43klEtLGOqk+iwHNcdJstyzs//ClxASLArW4Ib3uPML09WeoYsrn4EXD+ch/ZbjIdyM7MMrKsJcu5GGxwmY4ilcswb0jXmif5R4z5iSGg3zt8U209E4RMKl2vufzWT/ksiecJzyWc=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(48565401081)(2017052603328)(7193020);
 SRVR:MWHPR21MB0782; 
x-ms-traffictypediagnostic: MWHPR21MB0782:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yupalani@microsoft.com; 
x-microsoft-antispam-prvs: <MWHPR21MB0782376778AE6D6440356BC5D6930@MWHPR21MB0782.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(189930954265078)(65623756079841)(219752817060721)(104084551191319); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231254)(2018427008)(944501410)(52105095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699015);
 SRVR:MWHPR21MB0782; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0782; 
x-forefront-prvs: 0673F5BE31
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(396003)(366004)(39380400002)(39860400002)(13464003)(199004)(189003)(7736002)(305945005)(3660700001)(33656002)(561944003)(229853002)(8990500004)(3480700004)(74316002)(81166006)(4326008)(39060400002)(97736004)(478600001)(81156014)(3280700002)(8676002)(6506007)(486006)(446003)(476003)(46003)(59450400001)(53546011)(186003)(86612001)(6116002)(2906002)(86362001)(102836004)(5250100002)(8936002)(11346002)(22452003)(106356001)(105586002)(316002)(25786009)(68736007)(54906003)(110136005)(6436002)(93886005)(7696005)(76176011)(99286004)(9686003)(6306002)(966005)(2900100001)(10090500001)(14454004)(10290500003)(5660300001)(6246003)(53936002)(55016002)(42262002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0782;
 H:MWHPR21MB0864.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: F9CU5JY6ohlYg+mROmEubIW8zNGnuN3ADDHKQQM0nIuiJN33JNzKBIAjjWj6AQpRk1GIOEJ5bKXC3L2xlXDbqfN2bI33hgHrK6FB2qFP4A9Ke8MIuULkw7RTdQ0Gittw/JADjv1jSxkHUPneMvaeqq8QtVqwvOeZRC8/Ui152BRrHfYyUq+++QbVUKB6eRPP
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 59011d64-bda3-4348-f6f3-08d5ba903c44
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59011d64-bda3-4348-f6f3-08d5ba903c44
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2018 18:18:19.1482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0782
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
X-List-Received-Date: Tue, 15 May 2018 18:18:27 -0000

R29vZCBwb2ludC4gV2UgYXQgTVNGVCBhcmUgdXNpbmcgbGVnYWN5IChub24tVUJJKSBsYXlvdXQu
IFdlIGhhdmUgYSBtYW5pZmVzdCBmb3IgYm9vdCB2ZXJpZmljYXRpb24gYW5kIHdlIGFwcGVuZCB0
aGUgaGFzaCB0byBpbWFnZSBmb3IgdXBkYXRlIHZlcmlmaWNhdGlvbi4gDQpJIGNhbiBzaGFyZSBk
ZXRhaWxzIGFib3V0IHRoZSBkZXNpZ24vaW1wbGVtZW50YXRpb24sIGlmIHlvdSBoYXZlIGFueSBz
cGVjaWZpYyBxdWVzdGlvbnMuIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IG9wZW5ibWMgPG9wZW5ibWMtDQo+IGJvdW5jZXMreXVwYWxhbmk9bWljcm9zb2Z0LmNvbUBs
aXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2YgTGVpIFlVDQo+IFNlbnQ6IE1vbmRheSwgTWF5
IDE0LCAyMDE4IDc6MDYgUE0NCj4gVG86IEFkcmlhbmEgS29ieWxhayA8YW5vb0BsaW51eC52bmV0
LmlibS5jb20+DQo+IENjOiBTdGV3YXJ0IFNtaXRoIDxzdGV3YXJ0QGxpbnV4LnZuZXQuaWJtLmNv
bT47IE9wZW5CTUMgTWFpbGxpc3QNCj4gPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCj4gU3Vi
amVjdDogUmU6IEJNQyBJbWFnZSBTaWduaW5nIFByb3Bvc2FsDQo+IA0KPiBJJ2QgbGlrZSB0byBi
cmluZyB0aGlzIHRvcGljIGFnYWluLg0KPiANCj4gQXMgSSBrbm93IGltYWdlIHNpZ25pbmcgZmVh
dHVyZSBpcyBjb21wbGV0ZWQgZm9yIGJvdGggQk1DIGFuZCBQTk9SOg0KPiBodHRwczovL25hMDEu
c2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdA0K
PiBodWIuY29tJTJGb3BlbmJtYyUyRnBob3NwaG9yLWJtYy1jb2RlLQ0KPiBtZ210JmRhdGE9MDIl
N0MwMSU3Q3l1cGFsYW5pJTQwbWljcm9zb2Z0LmNvbSU3QzEyZjI1MGFlMTk5YjQNCj4gMzJiZTg5
YTA4ZDViYTA4OTc3MyU3QzcyZjk4OGJmODZmMTQxYWY5MWFiMmQ3Y2QwMTFkYjQ3JTdDMSU3Qw0K
PiAwJTdDNjM2NjE5NDY4NDI0MDA3MzQzJnNkYXRhPUdIQkJnbTlnOWtCcGZOQXpZeGd2ZUZvR1dY
WGwxDQo+IFFPcjhmSHdaTkpOdk5BJTNEJnJlc2VydmVkPTANCj4gaHR0cHM6Ly9uYTAxLnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXQNCj4gaHVi
LmNvbSUyRm9wZW5ibWMlMkZvcGVucG93ZXItcG5vci1jb2RlLQ0KPiBtZ210JmRhdGE9MDIlN0Mw
MSU3Q3l1cGFsYW5pJTQwbWljcm9zb2Z0LmNvbSU3QzEyZjI1MGFlMTk5YjQNCj4gMzJiZTg5YTA4
ZDViYTA4OTc3MyU3QzcyZjk4OGJmODZmMTQxYWY5MWFiMmQ3Y2QwMTFkYjQ3JTdDMSU3Qw0KPiAw
JTdDNjM2NjE5NDY4NDI0MDA3MzQzJnNkYXRhPUNSMm8lMkZnVm5IUGZNcjd3OGZ3T1llUnNiT2RG
DQo+IEIzVk1pQiUyRkZVQ25FMmFIRSUzRCZyZXNlcnZlZD0wDQo+IA0KPiBIb3dldmVyLCB0aGUg
YWJvdmUgcmVwb3MgYXJlIG9ubHkgZm9yIHN5c3RlbXMgd2l0aCBVQkktRlMgZmVhdHVyZS4NCj4g
TW9zdCBvZiBtYWNoaW5lcyBhcmUgc3RpbGwgdXNpbmcgdGhlICJsZWdhY3kiIG9ibWMgZmxhc2gg
bGF5b3V0LCBhbmQgdGh1cw0KPiB0aGV5IGRvIG5vdCBoYXZlIGltYWdlIHNpbmdpbmcgZmVhdHVy
ZS4NCj4gDQo+IFNvIEkgd291bGQgbGlrZSB0byBhc2sgZm9yIGlkZWFzIGFib3V0IGhvdyB0byBz
dXBwb3J0IGltYWdlIHNpZ25pbmcNCj4gZmVhdHVyZSBmb3IgbWFjaGluZXMgd2l0aCAibGVnYWN5
IiBmbGFzaCBsYXlvdXQ/DQo+IDEuIFNob3VsZCB3ZSB1c2UgVUJJLUZTIGZvciBtYWNoaW5lcyB0
aGF0IHJlcXVpcmVzIGltYWdlIHNpZ25pbmcNCj4gZmVhdHVyZT8NCj4gMi4gT3Igc2hvdWxkIHdl
IGltcGxlbWVudCBpbWFnZSBzaWduaW5nIGZlYXR1cmUgb24gImxlZ2FjeSIgZmxhc2ggbGF5b3V0
DQo+IGFzIHdlbGw/DQo+IA0KPiBUaGFua3MhDQo=
