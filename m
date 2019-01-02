Return-Path: <prvs=690505ef3d=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=690505ef3d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="WmJ/vdDS"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ZX6HUWfl"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43VNJS5RnLzDqHh
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jan 2019 07:41:59 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x02Kbqwa020288; Wed, 2 Jan 2019 12:41:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=HMwAi+Syx44H8F4emeB08rj2J1H7OdBhwgaW53c5d0A=;
 b=WmJ/vdDSynBtcw5ntPaXIaEAyenUKRVxsONvS9fgoey/ib7zZGjIVD4m1Ya4Li5170NE
 egElhnabTbMxcyLKGPMRrIbUpQbBIEnTFJQ5bW2C2BGqa417aq48ifSAmOD1tsPlFOsM
 wdoDTmi027KQ3laSyDnY0G/1ffH1lxpDaCg= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2ps0vu0rww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 02 Jan 2019 12:41:54 -0800
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 2 Jan 2019 12:41:52 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Wed, 2 Jan 2019 12:41:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMwAi+Syx44H8F4emeB08rj2J1H7OdBhwgaW53c5d0A=;
 b=ZX6HUWflvVh2cOP5ma8TbZAF+2FHfgeaLFYI8GJrjmOrNGRLtSJyZRWGxpKl6PONYRmuY/sljrid/s7uRrJQCEkGmLsd+ZpXu9xFGU/ishYnAXz+CQAMpRP/5y6tY8atYgQY7mrM5PqfluK1GdUfTAdc40STJMLXbWQIDGfXzvI=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1350.namprd15.prod.outlook.com (10.172.158.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1471.20; Wed, 2 Jan 2019 20:41:50 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::f9c6:952c:8b66:cc9d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::f9c6:952c:8b66:cc9d%9]) with mapi id 15.20.1471.019; Wed, 2 Jan 2019
 20:41:50 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Venture <venture@google.com>
CC: "Tanous, Ed" <ed.tanous@intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, James Feist <james.feist@linux.intel.com>
Subject: Re: Testing Phosphor-pid-control
Thread-Topic: Testing Phosphor-pid-control
Thread-Index: AQHUmIxTP8xlE76TH0O3H+2xLU7rIaWH5/IQ//+uAQCADF5SAIAAEBSAgAhmhgD//5UaAA==
Date: Wed, 2 Jan 2019 20:41:50 +0000
Message-ID: <FAAA7134-BC1A-4FBC-923B-25109107D389@fb.com>
References: <DFD47DF5-0CAE-4968-AF01-76B5884C2D58@fb.com>
 <7E9441B1E5EFFD4681F54958E821699345985566@ORSMSX114.amr.corp.intel.com>
 <2382D7CD-E130-4EDC-99AE-D993115C2A63@fb.com>
 <CAO=notwPOqcrNMG2H5Yc8kiZa6GGJv+FPbVqeumG9b=Btoc_pw@mail.gmail.com>
 <74BCEC89-4EFC-4FB7-BE76-0367361EDAA2@fb.com>
 <CAO=notwS+gXEVTa-7tqa54qvbmEntSyGJ+c5SeVe1w65yam50Q@mail.gmail.com>
In-Reply-To: <CAO=notwS+gXEVTa-7tqa54qvbmEntSyGJ+c5SeVe1w65yam50Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:7a7a]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1350;
 20:FG7ynxBKWQE7nMbasEQuLCAEyzQcse/5CMwlXm205Ej2zr6OagB+Q4in2MmaaMNehLGFqpoxAyF3OrDhLL+2RzZifqbSN4z8H6L/pDG6IsjZ6UNnGNfvvpY+zXtqd3d3ChYCCZ5ADbAnjjudDH8B3N410ct8FiGDsPt8VpWGrq8=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: bbc7eaea-5aa5-4ffc-258e-08d670f2b8fe
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1350; 
x-ms-traffictypediagnostic: CY4PR15MB1350:
x-microsoft-antispam-prvs: <CY4PR15MB1350A96A33C34C325C9477FFDD8C0@CY4PR15MB1350.namprd15.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(908002)(999002)(11241501185)(5005026)(6040522)(8220060)(2401047)(8121501046)(3231475)(944501520)(52105112)(3002001)(93006095)(93001095)(10201501046)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1350; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1350; 
x-forefront-prvs: 0905A6B2C7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(366004)(39860400002)(136003)(396003)(199004)(189003)(229853002)(5660300001)(6486002)(36756003)(6916009)(6116002)(86362001)(575784001)(186003)(46003)(2616005)(105586002)(97736004)(11346002)(446003)(106356001)(478600001)(33656002)(6506007)(14454004)(53546011)(76176011)(966005)(6246003)(4326008)(8936002)(6436002)(14444005)(6306002)(68736007)(256004)(54906003)(316002)(53936002)(7736002)(93886005)(3480700005)(486006)(8676002)(476003)(25786009)(81166006)(82746002)(71190400001)(71200400001)(6512007)(102836004)(305945005)(83716004)(81156014)(2906002)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1350;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fEHGqQp1x6FkoQv5T7TtMqIH2f42AxBWxSmvoYFCdFW0s4oKqwHGpRcjQhc/Ol+/jj6hfDAkm1EXCj/g8OwcqvrNwcBB8Nddi1IJVxHbgXebYJPXNKep14/UhNibiYR5K3PbYzQC9ASSJkfboqZIlvkXF3uWVq8JG3GC+/5twb4SGpNb6SUhiqSFqx73BHUQr/Dy5aFO8G+sp+LZtnrls5Rc/OJZF54paAsob6ogBngEBuJPOpnIUl+SGLH2v8kOtcXyqC4XNTsRG7W19/MdX5AhEMNglxYYWTFvIYCnqqMepNGUIV6a4S2yG/QvpD8m
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CDBC7CE9EA54149BBA51A65DAE24BC8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc7eaea-5aa5-4ffc-258e-08d670f2b8fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2019 20:41:50.6001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1350
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-02_08:, , signatures=0
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
X-List-Received-Date: Wed, 02 Jan 2019 20:42:01 -0000

DQoNCu+7v09uIDEvMi8xOSwgMTE6MDUgQU0sICJQYXRyaWNrIFZlbnR1cmUiIDx2ZW50dXJlQGdv
b2dsZS5jb20+IHdyb3RlOg0KDQogICAgT24gV2VkLCBKYW4gMiwgMjAxOSBhdCAxMTowMCBBTSBW
aWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4gSGkg
UGF0cmljaywNCiAgICA+IEkgYW0gbm90IHNlZWluZyBhbnkgY2hhbmdlIGluIGZhbiBzcGVlZCB3
aGVuIEkgcmVhZCBod21vbiB2YWx1ZXMuIENhbiB5b3UgcGxlYXNlIGdpdmUgbWUgYW55IGZvcm11
bGEgaG93IGl0IGlzIHVzaW5nIGRhdGEgdG8gY2hhbmdlIHNwZWVkLiBCZWNhdXNlIEkgdHJpZWQg
ZmFraW5nIHNldmVyYWwgdGVtcGVyYXR1cmVzIGFuZCBmaW5hbGx5IGNvdWxkIG1ha2UgdGhpcyBj
aGFuZ2Ugd2hlbiBJIGJyaW5nIHRlbXBlcmF0dXJlIGJlbG93IDEwIGJ1dCBpdCBkb2Vzbid0IGNo
YW5nZSB3aGVuIEkgdGFrZSB0ZW1wZXJhdHVyZSB0byBtb3JlIHRoYW4gbWF4IHZhbHVlLg0KICAg
IA0KICAgIFdoaWNoIFBJRCBjb250cm9sbGVyIGFyZSB5b3UgdXNpbmc/ICBJZiB5b3Ugb25seSBo
YXZlIHNlbnNvcnMNCiAgICBjb25maWd1cmVkIHRoZW4gdGhlcmUncyBub3RoaW5nIHRvIHB1c2gg
dGhlIGNoYW5nZXMsIHByZXN1bWFibHkgeW91DQogICAgaGF2ZSBhIFBJRCBhZGRlZC4gIERlcGVu
ZGluZyBvbiB3aGljaCB5b3UgY2hvc2UsIGRlcGVuZHMgb24gd2hhdCdzDQogICAgaGFwcGVuaW5n
IHdpdGggaXQgLS0gdGhhdCdzIHdoeSBJJ20gYXNraW5nIGZvciBtb3JlLiAgVGhlIGZvcm11bGEg
Zm9yDQogICAgdGhlICJub3JtYWwiIHBpZCBjb250cm9sbGVyIGlzIHN1Y2ggdGhhdCBpdCB0cmll
cyB0byByZWR1Y2UgdGhlDQogICAgImVycm9yIiBiZXR3ZWVuIHRoZSBzZXQtcG9pbnQgYW5kIHRo
ZSByZWFsIGZhbiBzcGVlZHMuDQoNCkkgYW0gdXNpbmcgYmFzaWMgY29uZmlndXJhdGlvbiBmb3Ig
cGlkIGFzIGJlbG93LiBJIG1heSBoYXZlIHRvIHJldmlzaXQgdGhlc2UgZGF0YSwgcGxlYXNlIGFk
dmlzZSBpZiBJIGFtIG1pc3NpbmcgYW55dGhpbmcgaGVyZS4NCiAgICAgICAgeyAgIA0KICAgICAg
ICAgICAgIkNsYXNzIjogImZhbiIsDQogICAgICAgICAgICAiRkZHYWluQ29lZmZpY2llbnQiOiAw
LjAxLA0KICAgICAgICAgICAgIkZGT2ZmQ29lZmZpY2llbnQiOiAwLjAsDQogICAgICAgICAgICAi
SUNvZWZmaWNpZW50IjogMC4wLA0KICAgICAgICAgICAgIklMaW1pdE1heCI6IDAuMCwNCiAgICAg
ICAgICAgICJJTGltaXRNaW4iOiAwLjAsDQogICAgICAgICAgICAiSW5wdXRzIjogWw0KICAgICAg
ICAgICAgICAgICJNQl9GQU4wX1RBQ0giDQogICAgICAgICAgICBdLCAgDQogICAgICAgICAgICAi
TmFtZSI6ICJNQl9GQU4wX1RBQ0giLA0KICAgICAgICAgICAgIk91dExpbWl0TWF4IjogMTAwLjAs
DQogICAgICAgICAgICAiT3V0TGltaXRNaW4iOiAzMC4wLA0KICAgICAgICAgICAgIk91dHB1dHMi
OiBbDQogICAgICAgICAgICAgICAgIlB3bSAxIg0KICAgICAgICAgICAgXSwNCiAgICAgICAgICAg
ICJQQ29lZmZpY2llbnQiOiAwLjAsDQogICAgICAgICAgICAiU2xld05lZyI6IDAuMCwNCiAgICAg
ICAgICAgICJTbGV3UG9zIjogMC4wLA0KICAgICAgICAgICAgIlR5cGUiOiAiUGlkIiwNCiAgICAg
ICAgICAgICJab25lcyI6IFsNCiAgICAgICAgICAgICAgICAiUGlkIDEiDQogICAgICAgICAgICBd
DQogICAgICAgIH0sICANCg0KICAgIA0KICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bo
b3NwaG9yLXBpZC1jb250cm9sL2Jsb2IvbWFzdGVyL3BpZC9lYy9waWQuY3BwI0w0Mw0KICAgIA0K
ICAgIFRoZXJlJ3MgYWxzbyBhIHN0ZXAtd2lzZSBjb250cm9sbGVyIG9wdGlvbiwgd2hpY2ggaXMg
d2h5IEknbSBhc2tpbmcuDQpIb3cgdG8gY29uZmlndXJlIHN0ZXAtd2lzZSBjb250cm9sbGVyIGFz
IHdlIG5lZWQgZm9yIGxpbmVhciBjb25maWd1cmF0aW9uIGFzIHdlbGwuDQogICAgDQogICAgPg0K
ICAgID4gUmVnYXJkcw0KICAgID4gLVZpamF5DQogICAgPg0KICAgID4gT24gMTIvMjgvMTgsIDE6
NTAgQU0sICJQYXRyaWNrIFZlbnR1cmUiIDx2ZW50dXJlQGdvb2dsZS5jb20+IHdyb3RlOg0KICAg
ID4NCiAgICA+ICAgICBPbiBUaHUsIERlYyAyMCwgMjAxOCBhdCAxMjo1NyBQTSBWaWpheSBLaGVt
a2EgPHZpamF5a2hlbWthQGZiLmNvbT4gd3JvdGU6DQogICAgPiAgICAgPg0KICAgID4gICAgID4g
SGkgRWQsDQogICAgPiAgICAgPiBJIGFtIGFibGUgdG8gb3ZlcnJpZGUgYW5kIHJlYWQgaXQgYmFj
ayBidXQgbm90IHNlZWluZyBhbnkgY2hhbmdlIGluIHB3bSBkYXRhIGFzIHdlbGwgYXMgZmFuIHNw
ZWVkLiBJIGhhdmUgc3dhbXBkIHJ1bm5pbmcuDQogICAgPg0KICAgID4gICAgIFlvdSBtZWFuIHRo
ZSBkYnVzIHJlYWRzIG9mIHRoZSB2YWx1ZXMgYXJlbid0IGNoYW5naW5nPyAgSSdtIG5vdCBhcw0K
ICAgID4gICAgIGZhbWlsaWFyIHdpdGggdGhlIGRidXMtc2Vuc29yIGludGVncmF0aW9uIGJleW9u
ZCBydW4tdGltZQ0KICAgID4gICAgIGNvbmZpZ3VyYXRpb24sIHZlcnN1cyBydW4tdGltZSBzdGF0
ZS4gIFN3YW1wZCBpdHNlbGYgZG9lc24ndCBleHBvc2UNCiAgICA+ICAgICBQSUQgaW5mb3JtYXRp
b24gb3Igc2V0LXBvaW50IGluZm9ybWF0aW9uIHVubGVzcyB0aGF0J3MgZG9uZSBpbiB0aGUNCiAg
ICA+ICAgICBzdGVwIGNvbnRyb2xsZXIgKGFuZCBJIGRpZG4ndCBzZWUgdGhhdCBhc3BlY3QgaW4g
dGhhdCBvYmplY3QpLg0KICAgID4NCiAgICA+ICAgICBPciBhcmUgeW91IHNheWluZyB0aGF0IHRo
ZSBmYW4gc3BlZWRzIGFyZW4ndCBjaGFuZ2luZyB3aGVuIHlvdSByZWFkDQogICAgPiAgICAgdGhl
IGh3bW9uIHZhbHVlcz8NCiAgICA+DQogICAgPiAgICAgPg0KICAgID4gICAgID4gUmVnYXJkcw0K
ICAgID4gICAgID4gLVZpamF5DQogICAgPiAgICAgPg0KICAgID4gICAgID4gT24gMTIvMjAvMTgs
IDEwOjE0IEFNLCAiVGFub3VzLCBFZCIgPGVkLnRhbm91c0BpbnRlbC5jb20+IHdyb3RlOg0KICAg
ID4gICAgID4NCiAgICA+ICAgICA+ICAgICBBc3N1bWluZyB5b3XigJlyZSB1c2luZyBkYnVzLXNl
bnNvcnMgKHdoaWNoIEnigJltIHByZXR0eSBzdXJlIHlvdSBhcmUpOg0KICAgID4gICAgID4NCiAg
ICA+ICAgICA+ICAgICBTdXBwb3J0IGZvciBvdmVycmlkaW5nIHNlbnNvciB2YWx1ZXMgd2FzIHJl
Y2VudGx5IGxhbmRlZCBpbiB0aGlzIGNvbW1pdDoNCiAgICA+ICAgICA+ICAgICBodHRwczovL3Vy
bGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2dlcnJpdC5vcGVuYm1j
LTJEcHJvamVjdC54eXpfLTIzX2Nfb3BlbmJtY19kYnVzLTJEc2Vuc29yc18tMkJfMTYxNzdfJmQ9
RHdJR2FRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBWZ3Bu
Q1I4MHZYa2tjcklhcVU3VVNsNWcmbT0xSi01ZUpsNERyYzJMS2NRMlNkT05jMDJ1UjVjaWgzUDY4
bTY2UWNNWW9nJnM9Yzk3OThxbUlfcEEzaG56Qjk3b2FZRks4eUZUbXdyeGRwQWVScnVpNHFrWSZl
PQ0KICAgID4gICAgID4NCiAgICA+ICAgICA+ICAgICBPdmVycmlkaW5nIGEgc2Vuc29yIHZhbHVl
IHdpdGggYSAiZmFrZSIgc2Vuc29yIHJlYWRpbmcgc2hvdWxkIGJlIGFzIGVhc3kgYXMgc2ltcGx5
IGNhbGxpbmcgU2V0UHJvcGVydHkgb24gdGhlIGRidXMgaW50ZXJmYWNlLg0KICAgID4gICAgID4N
CiAgICA+ICAgICA+ICAgICBFeGFtcGxlIGFzIHRlc3RlZCBvbiBteSBzeXN0ZW0gKHlvdXIgcGF0
aCBuYW1lcyBtYXkgdmFyeSkNCiAgICA+ICAgICA+ICAgICBkYnVzLXNlbmQgLS1zeXN0ZW0gLS1w
cmludC1yZXBseSAtLWRlc3Q9eHl6Lm9wZW5ibWNfcHJvamVjdC5DUFVTZW5zb3IgL3h5ei9vcGVu
Ym1jX3Byb2plY3Qvc2Vuc29ycy90ZW1wZXJhdHVyZS9Db3JlXzFfQ1BVMCBvcmcuZnJlZWRlc2t0
b3AuREJ1cy5Qcm9wZXJ0aWVzLlNldCBzdHJpbmc6eHl6Lm9wZW5ibWNfcHJvamVjdC5TZW5zb3Iu
VmFsdWUgc3RyaW5nOlZhbHVlIHZhcmlhbnQ6ZG91YmxlOjEuMA0KICAgID4gICAgID4NCiAgICA+
ICAgICA+ICAgICBhbmQgdmVyaWZ5IGJ5IHJlYWRpbmcgaXQgYmFjayBvdXQ6DQogICAgPiAgICAg
Pg0KICAgID4gICAgID4gICAgIGRidXMtc2VuZCAtLXN5c3RlbSAtLXByaW50LXJlcGx5IC0tZGVz
dD14eXoub3BlbmJtY19wcm9qZWN0LkNQVVNlbnNvciAveHl6L29wZW5ibWNfcHJvamVjdC9zZW5z
b3JzL3RlbXBlcmF0dXJlL0NvcmVfMV9DUFUwIG9yZy5mcmVlZGVza3RvcC5EQnVzLlByb3BlcnRp
ZXMuR2V0QWxsIHN0cmluZzp4eXoub3BlbmJtY19wcm9qZWN0LlNlbnNvci5WYWx1ZQ0KICAgID4g
ICAgID4NCiAgICA+ICAgICA+DQogICAgPg0KICAgID4NCiAgICANCg0K
