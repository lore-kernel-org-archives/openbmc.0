Return-Path: <prvs=690505ef3d=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=690505ef3d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="U8mfr8p+"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="TD4VbhSS"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43VL3P110fzDqGt
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jan 2019 06:00:24 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x02IxQGg028685; Wed, 2 Jan 2019 11:00:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=BIPh78s3yIZajpm+TMrUUCKQFN5KN1eMJ7AxQ1VxOxo=;
 b=U8mfr8p+QJeeeNOevoddFNKG5kUfrW8yqo9NY9YZXZF+zUmq6ADXsbu7Mz89Ona9Bt/H
 1VjP1fHhmoGCIPTaoM5ugUaeYUcwQdvEv16ZOCRipqlKOdANiSfl/J/7Vrtf9uUa+Fd1
 1prtsAUf85T0eb/7PSbNc53WBX2B8IRNzeI= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2ps2vfg1au-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 02 Jan 2019 11:00:18 -0800
Received: from prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 2 Jan 2019 11:00:17 -0800
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 2 Jan 2019 11:00:16 -0800
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Wed, 2 Jan 2019 11:00:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIPh78s3yIZajpm+TMrUUCKQFN5KN1eMJ7AxQ1VxOxo=;
 b=TD4VbhSSKNzTUf0jlKBStlqVoH+X0ZvtiUM2dx2LS4jSxLHQbhIy/6KZ9f+MBe4csZ6Kuqmg3E62oCosR2V0e2I4iPgwEmVR9sztJJ2FBviGKmE0x/+4eDOPRdH0kVdCso03M71k0V36S4Nt/04Ppctz4G+iMQMJ975uksXIBAE=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1255.namprd15.prod.outlook.com (10.172.180.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1471.20; Wed, 2 Jan 2019 19:00:15 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::f9c6:952c:8b66:cc9d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::f9c6:952c:8b66:cc9d%9]) with mapi id 15.20.1471.019; Wed, 2 Jan 2019
 19:00:15 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Venture <venture@google.com>
CC: "Tanous, Ed" <ed.tanous@intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: Testing Phosphor-pid-control
Thread-Topic: Testing Phosphor-pid-control
Thread-Index: AQHUmIxTP8xlE76TH0O3H+2xLU7rIaWH5/IQ//+uAQCADF5SAIAAEBSA
Date: Wed, 2 Jan 2019 19:00:14 +0000
Message-ID: <74BCEC89-4EFC-4FB7-BE76-0367361EDAA2@fb.com>
References: <DFD47DF5-0CAE-4968-AF01-76B5884C2D58@fb.com>
 <7E9441B1E5EFFD4681F54958E821699345985566@ORSMSX114.amr.corp.intel.com>
 <2382D7CD-E130-4EDC-99AE-D993115C2A63@fb.com>
 <CAO=notwPOqcrNMG2H5Yc8kiZa6GGJv+FPbVqeumG9b=Btoc_pw@mail.gmail.com>
In-Reply-To: <CAO=notwPOqcrNMG2H5Yc8kiZa6GGJv+FPbVqeumG9b=Btoc_pw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:7a7a]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1255;
 20:2b7u96VJHATkkyxHbZNJhfYsESD7ozlyTvnQuJ4KZNtxuqHFRGU4yPrFIyBbFMOZaYmjPcssnsFO/Nbawaxlk+IN8U2x4kZpemvwz+5YiC2889ID1671Q1mRvqB6x6aVb+HF4QmN+9STuMnMO69mn/XocB6JVKM/BUBkJJcQQ0w=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: e8edb728-f037-42c9-5a14-08d670e487d5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1255; 
x-ms-traffictypediagnostic: CY4PR15MB1255:
x-microsoft-antispam-prvs: <CY4PR15MB12556DEC9F026C5CEA8EB36FDD8C0@CY4PR15MB1255.namprd15.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(908002)(999002)(11241501185)(5005026)(6040522)(8220060)(2401047)(8121501046)(10201501046)(93006095)(93001095)(3231475)(944501520)(52105112)(3002001)(6041310)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1255; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1255; 
x-forefront-prvs: 0905A6B2C7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(396003)(366004)(39860400002)(346002)(199004)(189003)(11346002)(6436002)(102836004)(6506007)(93886005)(53546011)(53936002)(575784001)(76176011)(2906002)(46003)(54906003)(229853002)(5660300001)(6486002)(6916009)(83716004)(71190400001)(71200400001)(14444005)(86362001)(256004)(486006)(3480700005)(6116002)(33656002)(106356001)(305945005)(82746002)(25786009)(14454004)(6246003)(99286004)(186003)(81166006)(81156014)(8676002)(478600001)(8936002)(7736002)(316002)(36756003)(966005)(68736007)(4326008)(6306002)(6512007)(476003)(2616005)(97736004)(446003)(105586002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1255;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e/j/XDO5fAVeE6lVbwqjj1BuCwA0E54FX/5mikdiDUq9GexVeVhhB+rNeAYE/KFWsZEIVDD5BAY9NAr9rB449UdBdXIJ64SHPmM2m8Yw5PrbZYAr+khYzJ+AWv5D53YeWxovND0DL4k6TL3CgdFpysgMtYOXAvSsrORI6Y/tzJ6Aww2Jlk7sKTn+3d6sMGjur40N3Tt/srShIKNcqrGatVoBj+j1/hwlnqwlEasavKLYJrRpeTDZ+4GoXBXP3OhXog4+3g0sC25ZqXr/aHPDQK+zqKMW+eEA2rQjjZpTGDLd/bRh89EG6YFVBOAz5t7D
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <F184EA7AAEC3B348955F4C02C4630B26@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e8edb728-f037-42c9-5a14-08d670e487d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2019 19:00:15.1077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1255
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
X-List-Received-Date: Wed, 02 Jan 2019 19:00:34 -0000

SGkgUGF0cmljaywNCkkgYW0gbm90IHNlZWluZyBhbnkgY2hhbmdlIGluIGZhbiBzcGVlZCB3aGVu
IEkgcmVhZCBod21vbiB2YWx1ZXMuIENhbiB5b3UgcGxlYXNlIGdpdmUgbWUgYW55IGZvcm11bGEg
aG93IGl0IGlzIHVzaW5nIGRhdGEgdG8gY2hhbmdlIHNwZWVkLiBCZWNhdXNlIEkgdHJpZWQgZmFr
aW5nIHNldmVyYWwgdGVtcGVyYXR1cmVzIGFuZCBmaW5hbGx5IGNvdWxkIG1ha2UgdGhpcyBjaGFu
Z2Ugd2hlbiBJIGJyaW5nIHRlbXBlcmF0dXJlIGJlbG93IDEwIGJ1dCBpdCBkb2Vzbid0IGNoYW5n
ZSB3aGVuIEkgdGFrZSB0ZW1wZXJhdHVyZSB0byBtb3JlIHRoYW4gbWF4ICB2YWx1ZS4NCg0KUmVn
YXJkcw0KLVZpamF5DQoNCu+7v09uIDEyLzI4LzE4LCAxOjUwIEFNLCAiUGF0cmljayBWZW50dXJl
IiA8dmVudHVyZUBnb29nbGUuY29tPiB3cm90ZToNCg0KICAgIE9uIFRodSwgRGVjIDIwLCAyMDE4
IGF0IDEyOjU3IFBNIFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAg
ICA+DQogICAgPiBIaSBFZCwNCiAgICA+IEkgYW0gYWJsZSB0byBvdmVycmlkZSBhbmQgcmVhZCBp
dCBiYWNrIGJ1dCBub3Qgc2VlaW5nIGFueSBjaGFuZ2UgaW4gcHdtIGRhdGEgYXMgd2VsbCBhcyBm
YW4gc3BlZWQuIEkgaGF2ZSBzd2FtcGQgcnVubmluZy4NCiAgICANCiAgICBZb3UgbWVhbiB0aGUg
ZGJ1cyByZWFkcyBvZiB0aGUgdmFsdWVzIGFyZW4ndCBjaGFuZ2luZz8gIEknbSBub3QgYXMNCiAg
ICBmYW1pbGlhciB3aXRoIHRoZSBkYnVzLXNlbnNvciBpbnRlZ3JhdGlvbiBiZXlvbmQgcnVuLXRp
bWUNCiAgICBjb25maWd1cmF0aW9uLCB2ZXJzdXMgcnVuLXRpbWUgc3RhdGUuICBTd2FtcGQgaXRz
ZWxmIGRvZXNuJ3QgZXhwb3NlDQogICAgUElEIGluZm9ybWF0aW9uIG9yIHNldC1wb2ludCBpbmZv
cm1hdGlvbiB1bmxlc3MgdGhhdCdzIGRvbmUgaW4gdGhlDQogICAgc3RlcCBjb250cm9sbGVyIChh
bmQgSSBkaWRuJ3Qgc2VlIHRoYXQgYXNwZWN0IGluIHRoYXQgb2JqZWN0KS4NCiAgICANCiAgICBP
ciBhcmUgeW91IHNheWluZyB0aGF0IHRoZSBmYW4gc3BlZWRzIGFyZW4ndCBjaGFuZ2luZyB3aGVu
IHlvdSByZWFkDQogICAgdGhlIGh3bW9uIHZhbHVlcz8NCiAgICANCiAgICA+DQogICAgPiBSZWdh
cmRzDQogICAgPiAtVmlqYXkNCiAgICA+DQogICAgPiBPbiAxMi8yMC8xOCwgMTA6MTQgQU0sICJU
YW5vdXMsIEVkIiA8ZWQudGFub3VzQGludGVsLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4gICAg
IEFzc3VtaW5nIHlvdeKAmXJlIHVzaW5nIGRidXMtc2Vuc29ycyAod2hpY2ggSeKAmW0gcHJldHR5
IHN1cmUgeW91IGFyZSk6DQogICAgPg0KICAgID4gICAgIFN1cHBvcnQgZm9yIG92ZXJyaWRpbmcg
c2Vuc29yIHZhbHVlcyB3YXMgcmVjZW50bHkgbGFuZGVkIGluIHRoaXMgY29tbWl0Og0KICAgID4g
ICAgIGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9f
Z2Vycml0Lm9wZW5ibWMtMkRwcm9qZWN0Lnh5el8tMjNfY19vcGVuYm1jX2RidXMtMkRzZW5zb3Jz
Xy0yQl8xNjE3N18mZD1Ed0lHYVEmYz01VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JnI9djlNVTBLaTlw
V25UWENXd2pIUFZncG5DUjgwdlhra2NySWFxVTdVU2w1ZyZtPTFKLTVlSmw0RHJjMkxLY1EyU2RP
TmMwMnVSNWNpaDNQNjhtNjZRY01Zb2cmcz1jOTc5OHFtSV9wQTNobnpCOTdvYVlGSzh5RlRtd3J4
ZHBBZVJydWk0cWtZJmU9DQogICAgPg0KICAgID4gICAgIE92ZXJyaWRpbmcgYSBzZW5zb3IgdmFs
dWUgd2l0aCBhICJmYWtlIiBzZW5zb3IgcmVhZGluZyBzaG91bGQgYmUgYXMgZWFzeSBhcyBzaW1w
bHkgY2FsbGluZyBTZXRQcm9wZXJ0eSBvbiB0aGUgZGJ1cyBpbnRlcmZhY2UuDQogICAgPg0KICAg
ID4gICAgIEV4YW1wbGUgYXMgdGVzdGVkIG9uIG15IHN5c3RlbSAoeW91ciBwYXRoIG5hbWVzIG1h
eSB2YXJ5KQ0KICAgID4gICAgIGRidXMtc2VuZCAtLXN5c3RlbSAtLXByaW50LXJlcGx5IC0tZGVz
dD14eXoub3BlbmJtY19wcm9qZWN0LkNQVVNlbnNvciAveHl6L29wZW5ibWNfcHJvamVjdC9zZW5z
b3JzL3RlbXBlcmF0dXJlL0NvcmVfMV9DUFUwIG9yZy5mcmVlZGVza3RvcC5EQnVzLlByb3BlcnRp
ZXMuU2V0IHN0cmluZzp4eXoub3BlbmJtY19wcm9qZWN0LlNlbnNvci5WYWx1ZSBzdHJpbmc6VmFs
dWUgdmFyaWFudDpkb3VibGU6MS4wDQogICAgPg0KICAgID4gICAgIGFuZCB2ZXJpZnkgYnkgcmVh
ZGluZyBpdCBiYWNrIG91dDoNCiAgICA+DQogICAgPiAgICAgZGJ1cy1zZW5kIC0tc3lzdGVtIC0t
cHJpbnQtcmVwbHkgLS1kZXN0PXh5ei5vcGVuYm1jX3Byb2plY3QuQ1BVU2Vuc29yIC94eXovb3Bl
bmJtY19wcm9qZWN0L3NlbnNvcnMvdGVtcGVyYXR1cmUvQ29yZV8xX0NQVTAgb3JnLmZyZWVkZXNr
dG9wLkRCdXMuUHJvcGVydGllcy5HZXRBbGwgc3RyaW5nOnh5ei5vcGVuYm1jX3Byb2plY3QuU2Vu
c29yLlZhbHVlDQogICAgPg0KICAgID4NCiAgICANCg0K
