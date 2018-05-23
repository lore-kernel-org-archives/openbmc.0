Return-Path: <prvs=8681eb44b9=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=8681eb44b9=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Jwer0dZJ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="JL55brOZ"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40rfDb0qc0zF0wf
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 03:11:06 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4NH8Cxw010954; Wed, 23 May 2018 10:11:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=01rd+NrsU7/7YJnHDfB7rB+fu/ALW6jT6zo5Irr/AJA=;
 b=Jwer0dZJttyvp3fAoeB/xrDDmkYEqrh97eGT4YZETVEF9PK3mAhgcwybU8q+RQDLbYZ3
 CP0Z5AGR9JxmJI6kw4kdiKgipKvh84kP6rJqYSpNaqpOtLZTCwfJSXwaOIme8sKqQut7
 3pRE+kqQ6LL1xIIFCGlooRJVeUvG6jQDlV0= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2j59vwggkq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 23 May 2018 10:11:01 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.19) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Wed, 23 May 2018 10:10:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01rd+NrsU7/7YJnHDfB7rB+fu/ALW6jT6zo5Irr/AJA=;
 b=JL55brOZQ82s+KlQBMHvrQ1SZ0JApjiisbjnz30xk3++3+1lB6sB2quU3xuK5fouv/gdhdYjEgou5qJ9erRGZO88sboXTaZ9ZYM0LmtItzYEwM/kyEcE0JUhd4hRlgunTpKDLRSLV+FzAjc6lH3F+NKbFY676O4wZs0mszTg22A=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1278.namprd15.prod.outlook.com (10.175.3.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.797.11; Wed, 23 May 2018 17:10:58 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::59c1:5366:83b0:e39b]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::59c1:5366:83b0:e39b%13]) with mapi id 15.20.0776.019; Wed, 23 May
 2018 17:10:58 +0000
From: Sai Dasari <sdasari@fb.com>
To: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Community Meetings
Thread-Topic: Community Meetings
Thread-Index: AdPyt1i7D7Jr4rimRWCiqATcbOo7p///jf2A
Date: Wed, 23 May 2018 17:10:58 +0000
Message-ID: <62AC8D1D-C4FA-40F0-B820-126D900CA3F9@fb.com>
References: <AM4PR0802MB23062619ABE44754D92668EE806B0@AM4PR0802MB2306.eurprd08.prod.outlook.com>
In-Reply-To: <AM4PR0802MB23062619ABE44754D92668EE806B0@AM4PR0802MB2306.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5:30b2]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1278;
 7:aJ3OxgDnbVhH6LaQLyhE5FOPsjL+weYLxZNXh7+CKxWdczfxv6myPyz/EwEVi0xb9Q2obj4T1YBrqXEVVPS0fuUfbzt/0V8EITKNgWhoieTY7NgRkfALSfojfpbDI10YnGA6vyzHMqjK4/ziDCScD8GYcCsjS+wln7fyrT9lvCDbOFtseEbvYfzM0QVRm6WjUqr3OMWT5h++KrJFm5okNzyz1adHdI7RfuF8M2SrC7SZncWyKpGechIm/8BpRMmw;
 20:HQwXiCXIjR5BSVSsDlgDVhZQXoXrXm0xdRxN030MkQ8hfZXXIslFaYcIxETW5rmYo5CjjlBbD264t8Dskwt7bSPOmdjhGTaWz0C4ziEVbbbfFD4mYpn8wdem88ne/oupWa7dIOKthzbt+oxGOKZL10qJWRjlIkgeK6aJduis5vs=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1278; 
x-ms-traffictypediagnostic: MWHPR15MB1278:
x-microsoft-antispam-prvs: <MWHPR15MB1278F2A54465E281E20CD5B8CE6B0@MWHPR15MB1278.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(180628864354917)(166708455590820)(65623756079841)(21748063052155);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231254)(11241501184)(944501410)(52105095)(93006095)(93001095)(10201501046)(3002001)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(6072148)(201708071742011)(7699016);
 SRVR:MWHPR15MB1278; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1278; 
x-forefront-prvs: 06818431B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009001)(428001)(377454003)(164054003)(40434003)(199002)(189002)(20776003)(69226001)(63696002)(74876001)(74706001)(36756003)(33656001)(77096001)(76786001)(76796001)(81542001)(54356001)(93136001)(92566001)(46102001)(221733001)(64706001)(82746002)(81342001)(92726001)(15975445006)(77982001)(59766001)(16236675002)(56816005)(80022001)(76482001)(90146001)(65816001)(83716003)(87936001)(19300405004)(56776001)(15202345003)(54316002)(74366001)(44376005)(87266001)(2656002)(4396001)(47976001)(50986001)(95666003)(49866001)(47736001)(51856001)(85306002)(79102001)(85852003)(83072002)(21056001)(97336001)(94946001)(93516002)(95416001)(94316002)(86362001)(97186001)(80976001)(81686001)(83322001)(19580405001)(81816001)(31966008)(74662001)(19580395003)(53806001)(74502001)(47446002)(3826001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR15MB1278;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: OYowRzbBdXfrocdTuOtecB8J3e1WLs/Nel12bg22slZYg/+4KaVa9U/oPMk8Auq83NtP+m3/FXwDj5IWUF6BILLtYK//K7pK6SYcTJ5MTtBVPP4qZAj3Yyc/w2LB1HlMVmN8LMsisM+1LzmT5eZPPMT1k6Y9n8ertP/iI15mbpKInFUkXIQEniDLl6FlXYbbSI1t54yidtGrOus+jVPR2A==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_62AC8D1DC4FA40F0B820126D900CA3F9fbcom_"
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 4dfe3586-7769-4bde-6cd0-08d5c0d026f0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfe3586-7769-4bde-6cd0-08d5c0d026f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2018 17:10:58.0408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1278
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-23_07:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
X-List-Received-Date: Wed, 23 May 2018 17:11:12 -0000

--_000_62AC8D1DC4FA40F0B820126D900CA3F9fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2VsY29tZSBTdXByZWV0aCB0byBPcGVuQk1DIGNvbW11bml0eS4gVGhlIHdlZWtseSBtZWV0aW5n
IGluZm8gY2FuIGJlIGZvdW5kQCBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3dp
a2kvV2Vla2x5LUNvbW11bml0eS1UZWxlY29uDQoNCi1TYWkuDQoNCkZyb206IG9wZW5ibWMgPG9w
ZW5ibWMtYm91bmNlcytzZGFzYXJpPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnPiBvbiBiZWhhbGYg
b2YgU3VwcmVldGggVmVua2F0ZXNoIDxTdXByZWV0aC5WZW5rYXRlc2hAYXJtLmNvbT4NCkRhdGU6
IFdlZG5lc2RheSwgTWF5IDIzLCAyMDE4IGF0IDEwOjA5IEFNDQpUbzogIm9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZyIgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IENvbW11bml0
eSBNZWV0aW5ncw0KDQpIZWxsbyBPcGVuYm1jIGNvbW11bml0eSwNCg0KSSBhbSBmcm9tIEFybSBh
bmQganVzdCBzdGFydGVkIGxvb2tpbmcgaW50byBvcGVuYm1jIGVuYWJsZW1lbnQuDQpJIGFtIHN1
YnNjcmliZWQgdG8gdGhlIG1haWxpbmcgbGlzdCwgSG93ZXZlciwgSSBhbSB1bmFibGUgdG8gcGFy
dGljaXBhdGUgaW4gY29tbXVuaXR5IG1lZXRpbmdzIGFzDQpJIGRvbuKAmXQgc2VlIGFueSBtZWV0
aW5nIHJlcXVlc3RzIG9uIHRoZSBtYWlsaW5nIGxpc3QuDQoNCkl0IHdpbGwgYmUgYXBwcmVjaWF0
ZWQsIGlmIHNvbWVvbmUgY291bGQgaGVscCBtZSBvbiBob3cgdG8gc3Vic2NyaWJlIHRvDQpvcGVu
Ym1jIGRldmVsb3BlciBjb21tdW5pdHkgbWVldGluZ3MuDQoNCkkgYW0gYXR0ZW5kaW5nICAoRE1U
RikgUE1DSSB3b3JrIGdyb3VwIG1lZXRpbmdzLCBidXQgbm90IHN1cmUgd2hldGhlciB0aGVyZSBp
cyBvcGVuYm1jIGRldmVsb3BlciBjb21tdW5pdHkNCm1lZXRpbmcgYXMgd2VsbC4NCg0KVGhhbmtz
LA0KU3VwcmVldGgNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWls
IGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJp
dmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRl
bnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3Jl
IG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCg==

--_000_62AC8D1DC4FA40F0B820126D900CA3F9fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <5F27BECA7394D8479F65FBC7BDE52BEA@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpw
Lm1zb25vcm1hbDAsIGxpLm1zb25vcm1hbDAsIGRpdi5tc29ub3JtYWwwDQoJe21zby1zdHlsZS1u
YW1lOm1zb25vcm1hbDsNCgltc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzsNCgltYXJnaW4tcmlnaHQ6
MGluOw0KCW1zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvOw0KCW1hcmdpbi1sZWZ0OjBpbjsNCglm
b250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNw
YW4uRW1haWxTdHlsZTE4DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsOw0KCWZvbnQtZmFtaWx5
OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0Kc3Bhbi5FbWFpbFN0
eWxlMTkNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6IkNh
bGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0K
CXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30NCkBwYWdl
IFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4g
MS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQot
LT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZs
aW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj5XZWxjb21lIFN1cHJlZXRoIHRvIE9wZW5CTUMgY29tbXVuaXR5LiBUaGUgd2Vla2x5
IG1lZXRpbmcgaW5mbyBjYW4gYmUgZm91bmRADQo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy9vcGVuYm1jL3dpa2kvV2Vla2x5LUNvbW11bml0eS1UZWxlY29uIj5odHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3dpa2kvV2Vla2x5LUNvbW11bml0eS1UZWxlY29uPC9h
PjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4tU2FpLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9u
ZTtib3JkZXItdG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBp
biI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBw
dDtjb2xvcjpibGFjayI+RnJvbTogPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEy
LjBwdDtjb2xvcjpibGFjayI+b3BlbmJtYyAmbHQ7b3BlbmJtYy1ib3VuY2VzJiM0MztzZGFzYXJp
PWZiLmNvbUBsaXN0cy5vemxhYnMub3JnJmd0OyBvbiBiZWhhbGYgb2YgU3VwcmVldGggVmVua2F0
ZXNoICZsdDtTdXByZWV0aC5WZW5rYXRlc2hAYXJtLmNvbSZndDs8YnI+DQo8Yj5EYXRlOiA8L2I+
V2VkbmVzZGF5LCBNYXkgMjMsIDIwMTggYXQgMTA6MDkgQU08YnI+DQo8Yj5UbzogPC9iPiZxdW90
O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZxdW90OyAmbHQ7b3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwvYj5Db21tdW5pdHkgTWVldGluZ3M8bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZu
YnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SGVsbG8gT3BlbmJt
YyBjb21tdW5pdHksPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkkgYW0gZnJvbSBBcm0gYW5kIGp1
c3Qgc3RhcnRlZCBsb29raW5nIGludG8gb3BlbmJtYyBlbmFibGVtZW50LjxvOnA+PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SSBhbSBzdWJzY3JpYmVkIHRvIHRoZSBtYWlsaW5nIGxp
c3QsIEhvd2V2ZXIsIEkgYW0gdW5hYmxlIHRvIHBhcnRpY2lwYXRlIGluIGNvbW11bml0eSBtZWV0
aW5ncyBhcw0KPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5JIGRvbuKAmXQg
c2VlIGFueSBtZWV0aW5nIHJlcXVlc3RzIG9uIHRoZSBtYWlsaW5nIGxpc3QuIDxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj5JdCB3aWxsIGJlIGFwcHJlY2lhdGVkLCBpZiBzb21lb25lIGNvdWxkIGhl
bHAgbWUgb24gaG93IHRvIHN1YnNjcmliZSB0bw0KPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj5vcGVuYm1jIGRldmVsb3BlciBjb21tdW5pdHkgbWVldGluZ3MuPG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPkkgYW0gYXR0ZW5kaW5nJm5ic3A7IChETVRGKSBQTUNJIHdvcmsgZ3Jv
dXAgbWVldGluZ3MsIGJ1dCBub3Qgc3VyZSB3aGV0aGVyIHRoZXJlIGlzIG9wZW5ibWMgZGV2ZWxv
cGVyIGNvbW11bml0eQ0KPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5tZWV0
aW5nIGFzIHdlbGwuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRoYW5rcyw8bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlN1cHJlZXRoPG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj5JTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFp
bCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHBy
aXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBu
b3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250
ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLA0KIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0
b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCjxv
OnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_62AC8D1DC4FA40F0B820126D900CA3F9fbcom_--
