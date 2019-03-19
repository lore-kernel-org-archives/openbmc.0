Return-Path: <prvs=898122b368=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=898122b368=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="PpTKbgBG"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="kk9LrilE"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44P5yZ2KSMzDqJ7
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 08:38:29 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2JLY7Nc000321; Tue, 19 Mar 2019 14:38:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=8EhVfCDfu3M0DYxYaHQdWEZAVaXeK7LUAFA1zhdxs/s=;
 b=PpTKbgBGP6oDTc8oNP2JN/uELIvFOtXBvGe/Bz3tLhY63gz/EwoJbjX2oQRIj+cDDr8a
 zJZrG5ECKIUUZLA30DqrtfHXKdt3YfLes9JmlLoMXvqbHV3Fbp9+YitPPhX4vTSYeRfE
 LVBFbE01vUDDuisTNmsETgmQksCB0ScuzxE= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2rb45c928u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2019 14:38:22 -0700
Received: from prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 19 Mar 2019 14:38:21 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 19 Mar 2019 14:38:21 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 19 Mar 2019 14:38:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EhVfCDfu3M0DYxYaHQdWEZAVaXeK7LUAFA1zhdxs/s=;
 b=kk9LrilEc2wmd5KcCe9zLhOLfc07NiGzMnCUkKXTFXS+fTp0XPayY627+2nH5YlLLXl69HgGdoOb4wkBLFFh07Tmu20BM/oKK7cPcjkxRsT3ZcJR1D1abOIjFAKf21rIfqHqQJ/whkh+/+8zKjGnprd2yFWZSCOz94O5Ur68bCk=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1845.namprd15.prod.outlook.com (10.172.75.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Tue, 19 Mar 2019 21:38:20 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d%3]) with mapi id 15.20.1709.015; Tue, 19 Mar 2019
 21:38:20 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, John Wang <wangzqbj@inspur.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [fru-device and intel-ipmi-oem] ipmitool fru print can not output
 psu information
Thread-Topic: [fru-device and intel-ipmi-oem] ipmitool fru print can not
 output psu information
Thread-Index: AQHU3kRkrA04gU7aa0K3j0EqmgAGxaYTASaAgAB5loD//4uGAA==
Date: Tue, 19 Mar 2019 21:38:20 +0000
Message-ID: <32F54D6A-F27D-4875-91F2-602CC076BD72@fb.com>
References: <CAHkHK08Otxm88OQGjG+b0QEgv_mExyObqOj6aZGSwmzMfZO_mw@mail.gmail.com>
 <BEEDBD8E-30FE-46C9-9847-C4E06A67DA49@fb.com>
 <9a21ef4b-07af-d761-a214-03739373c762@linux.intel.com>
In-Reply-To: <9a21ef4b-07af-d761-a214-03739373c762@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:dfbc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a126206-3ee2-4018-4efc-08d6acb334d4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1845; 
x-ms-traffictypediagnostic: CY4PR15MB1845:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CY4PR15MB1845B5FB032836172D621576DD400@CY4PR15MB1845.namprd15.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(366004)(136003)(346002)(396003)(189003)(199004)(106356001)(7736002)(105586002)(46003)(97736004)(6306002)(11346002)(476003)(6512007)(53936002)(446003)(486006)(2616005)(256004)(86362001)(5660300002)(33656002)(110136005)(186003)(305945005)(6116002)(8676002)(68736007)(81166006)(76176011)(6506007)(53546011)(478600001)(71190400001)(81156014)(82746002)(71200400001)(2906002)(316002)(25786009)(99286004)(14454004)(229853002)(8936002)(6436002)(83716004)(36756003)(102836004)(6246003)(6486002)(966005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1845;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5RZPXN3zjypMtGWVcRRwUU3jveRUIeh6X4aCFCwrLfMvjN9dKXt+HACk+h4HhSFMEzAyyntj/BuxiQ0XLVKdMxaz291OrZ6O6PYCg8duuB4jlVt8WhH/9ahG6vkxYemO1E33BhrWGhcZHkHIQUgs602xHJMge+SUZ4hNFEotelEzdhqwKoKmocDEtoZXq12A9Vne5xv4uDB8B+I7tgKox2rhO+sPIy/gSoc+jvLxGv7+f5GDcFlznaNmZcil9eZDucEeYfwFvZEqXbL3qP47Qb9tCoNM7H4KRdQOaLkMx1a05yvDX+7wPgG9j36xgCCTf7YX/YBv3HBP+gZndwolcoH2gU8NPZpm3kKvXpiKiVkt3JxBNcz/V6P4ljltGlstOfqyU8pL2ROmdQeBFvvIyWbeKgafDsw3tTQVitm+IGA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1731AD69C77E674F8EC2B11941D9E527@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a126206-3ee2-4018-4efc-08d6acb334d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 21:38:20.4696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1845
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-19_11:, , signatures=0
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
X-List-Received-Date: Tue, 19 Mar 2019 21:38:31 -0000

DQoNCu+7v09uIDMvMTkvMTksIDI6MzUgUE0sICJKYW1lcyBGZWlzdCIgPGphbWVzLmZlaXN0QGxp
bnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAgICANCiAgICA+IFlvdSBuZWVkIGEgc2VwYXJhdGUg
Y29uZmlndXJhdGlvbiBmb3IgeW91ciBib2FyZC4NCiAgICANCiAgICBUaGlzIHNob3VsZCBub3Qg
YmUgbmVlZGVkLg0KSSBhZ3JlZSBhcyB0aGlzIGlzIG5vdCByZXF1aXJlZCBpZiB5b3Ugb25seSBu
ZWVkIGZydSBkYXRhIGJ1dCBmb3IgYWxsIHNlbnNvcnMgaW5mb3JtYXRpb24gaXQgaXMgcmVxdWly
ZWQgdG8gaGF2ZSBjb25maWd1cmF0aW9uIGZpbGUuDQogICAgDQogICAgPiANCiAgICA+IFJlZ2Fy
ZHMNCiAgICA+IC1WaWpheQ0KICAgID4gDQogICAgPiBPbiAzLzE5LzE5LCA0OjEwIEFNLCAib3Bl
bmJtYyBvbiBiZWhhbGYgb2YgSm9obiBXYW5nIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWth
PWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZiB3YW5nenFiakBpbnNwdXIuY29t
PiB3cm90ZToNCiAgICA+IA0KICAgID4gICAgICBCeSBjaGVja2luZyB0aGUgY29kZSwgSSBmb3Vu
ZCB0aGF0IGZydS1kZXZpY2Ugc2VlbXMgdG8gbmVlZCB0byBiZSB1c2VkDQogICAgPiAgICAgIHdp
dGggaW50ZWwtaXBtaS1vZW0sDQogICAgPiAgICAgIGFuZCBpdCBzZWVtcyB0aGF0IG5vIGFkZGl0
aW9uYWwgY29uZmlndXJhdGlvbiBpcyByZXF1aXJlZChjb3JyZWN0Pz8pLg0KICAgIA0KICAgIFNo
b3VsZCBiZSB0cnVlLg0KICAgIA0KICAgID4gICAgICANCiAgICA+ICAgICAgT24gbXkgbWFjaGlu
ZSx0aGVyZSBhcmUgdHdvIEZSVSxvbmUgaXMgL2V0Yy9mcnUvYmFzZWJvYXJkLmZydS5iaW4sdGhl
DQogICAgPiAgICAgIG90aGVyIGlzIHBzdSBmcnUuDQogICAgPiAgICAgIChUaGVyZSBpcyBvbmx5
IG9uZSBwc3UpLg0KICAgID4gICAgICANCiAgICA+ICAgICAgQnV0LGlwbWl0b29sIGZydSBwcmlu
dCBjYW4gb25seSBvdXRwdXQgdGhlIGZydSBvZiBiYXNlYm9hcmQuDQogICAgPiAgICAgICQgaXBt
aXRvb2wgLUkgbGFucGx1cyAtSCAxMDAuMi43Ni4yMTMgLVUgcm9vdCAtUCAwcGVuQm1jIGZydSBw
cmludA0KICAgID4gICAgICBGUlUgRGV2aWNlIERlc2NyaXB0aW9uIDogQnVpbHRpbiBGUlUgRGV2
aWNlIChJRCAwKQ0KICAgID4gICAgICANCiAgICA+ICAgICAgZnJ1LWRldmljZSBmb3VuZCBwc3Ug
aXRzZWxmIGFuZCBoYWQgdGhlIGNvcnJlY3Qgb3V0cHV0IG9uIGRidXM6DQogICAgPiAgICAgIGJ1
c2N0bCB0cmVlIHh5ei5vcGVuYm1jX3Byb2plY3QuRnJ1RGV2aWNlDQogICAgPiAgICAgIOKUlOKU
gC94eXoNCiAgICA+ICAgICAgICDilJTilIAveHl6L29wZW5ibWNfcHJvamVjdA0KICAgID4gICAg
ICAgICAg4pSU4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlDQogICAgPiAgICAgICAg
ICAgIOKUnOKUgC94eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZS9EUFNfODAwQUJfMTZfQQ0K
ICAgID4gICAgICAgICAgICDilJTilIAveHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvT041
MjYzID4gICAgICBidXNjdGwgaW50cm9zcGVjdCB4eXoub3BlbmJtY19wcm9qZWN0LkZydURldmlj
ZQ0KICAgID4gICAgICAveHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvRFBTXzgwMEFCXzE2
X0E6ICAgICAgLQ0KICAgID4gICAgICAuQUREUkVTUyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwcm9wZXJ0eSAgdSAgICAgICAgIDgwDQogICAgPiAgICAgICAgZW1pdHMtY2hhbmdlDQogICAg
PiAgICAgIC5CVVMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByb3BlcnR5ICB1ICAg
ICAgICAgNQ0KICAgID4gICAgICAgIGVtaXRzLWNoYW5nZQ0KICAgID4gICAgICAuQ29tbW9uX0Zv
cm1hdF9WZXJzaW9uICAgICAgICAgICAgICBwcm9wZXJ0eSAgcyAgICAgICAgICIxIg0KICAgID4g
ICAgICAgIGVtaXRzLWNoYW5nZQ0KICAgID4gICAgICAuUFJPRFVDVF9MQU5HVUFHRV9DT0RFICAg
ICAgICAgICAgICBwcm9wZXJ0eSAgcyAgICAgICAgICIyNSINCiAgICA+ICAgICAgICBlbWl0cy1j
aGFuZ2UNCiAgICA+ICAgICAgLlBST0RVQ1RfTUFOVUZBQ1RVUkVSICAgICAgICAgICAgICAgcHJv
cGVydHkgIHMgICAgICAgICAiREVMVEEiDQogICAgPiAgICAgICAgZW1pdHMtY2hhbmdlDQogICAg
PiAgICAgIC5QUk9EVUNUX1BBUlRfTlVNQkVSICAgICAgICAgICAgICAgIHByb3BlcnR5ICBzICAg
ICAgICAgIiAgICAgICAgICAiDQogICAgPiAgICAgICAgZW1pdHMtY2hhbmdlDQogICAgPiAgICAg
IC5QUk9EVUNUX1BST0RVQ1RfTkFNRSAgICAgICAgICAgICAgIHByb3BlcnR5ICBzICAgICAgICAg
IkRQUy04MDBBQi0xNg0KICAgID4gICAgICBBIiBlbWl0cy1jaGFuZ2UNCiAgICA+ICAgICAgLlBS
T0RVQ1RfU0VSSUFMX05VTUJFUiAgICAgICAgICAgICAgcHJvcGVydHkgIHMNCiAgICA+ICAgICAg
IkhFUkQxNjI5MDAyMzA5IiBlbWl0cy1jaGFuZ2UNCiAgICA+ICAgICAgLlBST0RVQ1RfVkVSU0lP
TiAgICAgICAgICAgICAgICAgICAgcHJvcGVydHkgIHMgICAgICAgICAiUzJGIg0KICAgID4gICAg
ICAgIGVtaXRzLWNoYW5nZQ0KICAgIA0KICAgIFRoaXMgc2hvdWxkIGJlIGFsbCB0aGF0IGlzIG5l
ZWRlZC4gVGhlIGJhc2Vib2FyZCBpdHNlbGYgd29ya3Mgd2l0aG91dCANCiAgICBhbnkgc2RyIGRh
dGEgZHVlIHRvIGlwbWl0b29sIGltcGxlbWVudGF0aW9uIHRyZWFkaW5nIElEIDAgc3BlY2lhbC4g
SXQgaXMgDQogICAgcHJvYmFibHkgZmFpbGluZyBzb21ld2hlcmUgd2l0aCB0aGUgc2RyIGNyZWF0
aW9uIC8gcmVhZGluZy4gSSB3b3VsZCANCiAgICBjaGVjayB0aGF0IGBpcG1pdG9vbCBzZHIgZWxp
c3QgZnJ1YCBpcyByZXR1cm5pbmcgYW4gc2RyIGZvciB0aGF0IGZydS4NCiAgICANCiAgICBodHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy9pbnRlbC1pcG1pLW9lbS9ibG9iL21hc3Rlci9zcmMvc3Rv
cmFnZWNvbW1hbmRzLmNwcCNMNDAwIA0KICAgIGlzIHdoZXJlIHRoZSBGcnVTRFIgYXJlIGNyZWF0
ZWQuIFRoaXMgYWxzbyByZXF1aXJlcyBTRFIgY29tbWFuZHMgaGVyZTogDQogICAgaHR0cHM6Ly9n
aXRodWIuY29tL29wZW5ibWMvaW50ZWwtaXBtaS1vZW0vYmxvYi9tYXN0ZXIvc3JjL3NlbnNvcmNv
bW1hbmRzLmNwcCNMODg2DQogICAgDQogICAgLSBKYW1lcw0KICAgIA0KICAgIA0KDQo=
