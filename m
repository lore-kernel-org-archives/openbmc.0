Return-Path: <prvs=4869891035=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4869891035=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="NJgLmjMt"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="gBOIjUry"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 434F236my8zDqqK
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 06:57:43 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.22/8.16.0.22) with SMTP id wARJtX5S013583;
 Tue, 27 Nov 2018 11:57:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=V5kOABVzw7IgFrCnp8aFjdqAaI9BAMaF8Isp/mKp0ZM=;
 b=NJgLmjMtBD55Q17fTIF8WlFdB1ndP1gbUEPClOcUS5j/bVykhbvglSR1vsgeqykWpiWq
 8qJeZrBCbftOiYIZnH8Cvw0AbCRZDVw9d0c+0w26lAX4UYiL6HJ6mxS9fNn+6vkWvtY8
 kfPSJ1diE5oZJ9szuP8VtaCKhuKhMa7fH2Y= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2p19a90pm1-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 27 Nov 2018 11:57:35 -0800
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 27 Nov 2018 11:57:33 -0800
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 27 Nov 2018 11:57:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5kOABVzw7IgFrCnp8aFjdqAaI9BAMaF8Isp/mKp0ZM=;
 b=gBOIjUrygtOttGj3t0nSX31XuTK0yftyj6kf6dzx9UYhNRfUS+n90r+feDGriXMkDjHs4083iYfRLVO2sa3f+VO8aLbm5EmB7sG7SFsTHxjmMulbe0di+19j2sAAmaSYNLp2o3S7RCzneZZpJywLrxKYDKaRXdN5zYUA/QF6r/E=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1583.namprd15.prod.outlook.com (10.173.235.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1361.16; Tue, 27 Nov 2018 19:57:31 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::ecc2:43ce:1a6f:1ff6]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::ecc2:43ce:1a6f:1ff6%7]) with mapi id 15.20.1361.019; Tue, 27 Nov 2018
 19:57:31 +0000
From: Sai Dasari <sdasari@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed.tanous@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Oskar Senft <osk@google.com>
Subject: Re: Submit board schematics to OpenBMC docs repo
Thread-Topic: Submit board schematics to OpenBMC docs repo
Thread-Index: AQHUfecCGIV3zRWTVEqxxjMxYuBjI6VS+uUAgA99BgCAAR0GAA==
Date: Tue, 27 Nov 2018 19:57:31 +0000
Message-ID: <610D7954-EAF3-4CB7-9B4B-7A067DA8E8B5@fb.com>
References: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
 <1bf30dfc-cc55-649d-3b0a-1cf29355daf9@intel.com>
 <d372150746d3f52901cbff4a4d422357d6f00676.camel@fuzziesquirrel.com>
In-Reply-To: <d372150746d3f52901cbff4a4d422357d6f00676.camel@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: osk@google.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:d548]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1583;
 20:pFTn98JMrVvxKRev9tsmslHzMMObNsryZFV0aDxQE89h0y4BK1t1WKdAl7VICUtvMx2BuKynujkivzTAfSm+y4H7c2RC0+nOGdlkaTJwghavi7+9i1v1L0aAhAQgZyWf/JKzNptAug+pwsY67uh+Fok/sEbttZX1RcBnnbhtryQ=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 320266bc-9e18-4291-f18d-08d654a29152
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1583; 
x-ms-traffictypediagnostic: MWHPR15MB1583:
x-microsoft-antispam-prvs: <MWHPR15MB15837133E7832DE6E92A72FBCED00@MWHPR15MB1583.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(3231443)(11241501185)(944501410)(52105112)(148016)(149066)(150057)(6041310)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1583; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1583; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(39860400002)(136003)(346002)(376002)(396003)(366004)(199004)(189003)(478600001)(97736004)(33656002)(71190400001)(99286004)(6116002)(83716004)(4001150100001)(71200400001)(53546011)(2501003)(229853002)(6436002)(316002)(82746002)(6512007)(53936002)(25786009)(6486002)(110136005)(76176011)(106356001)(6506007)(105586002)(6246003)(68736007)(8676002)(36756003)(446003)(11346002)(102836004)(256004)(2616005)(476003)(305945005)(186003)(14454004)(46003)(5660300001)(2906002)(7736002)(86362001)(486006)(8936002)(81156014)(81166006)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1583;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 0MxFWJRtSr6Y/kl2u7y0Mo4Cy2zZYQ+bwl62mOUUP7BQJrNVi7JEM0sf1NlUB4fbh7s7YVGHCdLgXcmdVMxmeSXwVZlNeUWF8SDjoKw+sad2DJ5DgX1sGeKtiPJTH0AW6X//+RjNDGS3tf9N91GJ4yiEMitIz7FM+TX9PqX5TQWAqLv/tSm/vEila08AR3IuI9TXYgGJ9ukCpUfSBwTmtv1/xHGJFptaSUM118Ove/Zq/e61uDNPm/UxLwWQdnt1bqw+S5OXOLG1H+Tpu8OKb3zmgz0Bl14Ekg0Mb00/CwVBkFk9rhUyaNrYgSj2eqPnm61ZboQCNFuqpg0a5pS+ASq8VI+OoeremvZ2eRNMxLA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <16512D594427474989E233A435CC96F7@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 320266bc-9e18-4291-f18d-08d654a29152
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 19:57:31.7508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1583
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-27_16:, , signatures=0
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
X-List-Received-Date: Tue, 27 Nov 2018 19:57:49 -0000

DQoNCu+7v09uIDExLzI2LzE4LCAxMDo1OCBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEJyYWQg
QmlzaG9wIiA8b3BlbmJtYy1ib3VuY2VzK3NkYXNhcmk9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcg
b24gYmVoYWxmIG9mIGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT4gd3JvdGU6DQoNCiAgICBP
biBGcmksIDIwMTgtMTEtMTYgYXQgMTQ6MjYgLTA4MDAsIEVkIFRhbm91cyB3cm90ZToNCiAgICA+
IE9uIDExLzE2LzE4IDExOjU4IEFNLCBPc2thciBTZW5mdCB3cm90ZToNCiAgICA+ID4gSXMgdGhl
cmUgYSBnb29kIHBsYWNlIGluIE9wZW5CTUMgdG8gcG9zdCB0aGF0PyBNYXliZSB0aGUgZG9jcyBy
ZXBvPw0KICAgID4gPiBJdCdzIDQgUERGIGZpbGVzIHdpdGggPCAxMCBNaUIgaW4gdG90YWwuIEhh
dmluZyB0aGlzIGluZm9ybWF0aW9uDQogICAgPiA+IHB1YmxpY2x5IHBvc3RlZCBieSB0aGVtIHdv
dWxkIG1ha2UgZGV2ZWxvcG1lbnQgbXVjaCBlYXNpZXIuDQogICAgPiANCiAgICA+IE9uZSB0aGlu
ZyBJIHdvbmRlciBpcyB3aGV0aGVyIG9yIG5vdCB3ZSAodGhlIE9wZW5CTUMgcHJvamVjdCkgd2Fu
dHMNCiAgICA+IHRvDQogICAgPiBiZSBpbiB0aGUgYnVzaW5lc3Mgb2YgaG9zdGluZyBoYXJkd2Fy
ZSBzY2hlbWF0aWNzLiAgSXQgZmVlbHMgYSBsaXR0bGUNCiAgICA+IGJpdCBvdXQgb2Ygb3VyIHdo
ZWVsaG91c2UuICBJdCBzZWVtcyBsaWtlIGEgbXVjaCBiZXR0ZXIgdGhpbmcgZm9yIGFuDQogICAg
PiBvcmdhbml6YXRpb24gbGlrZSBPQ1AgdG8gbWFuYWdlLCB3aG8gZGVhbHMgaW4gYSBsb3Qgb2Yg
b3BlbiBwaHlzaWNhbA0KICAgID4gaGFyZHdhcmUsIGFuZCB1bmRlcnN0YW5kcyB0aGUgbGljZW5z
ZXMgYW5kIHN1YnRsZXRpZXMgYXJvdW5kIGhvc3RpbmcNCiAgICA+IHRoYXQga2luZCBvZiBkb2N1
bWVudGF0aW9uLg0KICAgID4gDQogICAgPiBGb3IgZXhhbXBsZSwgaXMgdGhlIGNvbXBhbnkgcGxh
bm5pbmcgb24gcmVsZWFzaW5nIHRoZSBzY2hlbWF0aWNzIHdpdGgNCiAgICA+IGENCiAgICA+IGNy
ZWF0aXZlIGNvbW1vbnMsIEFwYWNoZSwgb3IgTUlUIGxpY2Vuc2U/ICBJIGhhdmUgbm8gaWRlYSB0
aGUNCiAgICA+IHN1YnRsZXRpZXMNCiAgICA+IG9mIHRoYXQgd2hlbiBpdCBjb21lcyB0byBoYXJk
d2FyZSBzY2hlbWF0aWNzLCBidXQgbWF5YmUgc29tZW9uZSBlbHNlDQogICAgPiBkb2VzPyAgRG9l
cyBwb3N0aW5nIHRoZSBzY2hlbWF0aWNzIHdpdGggdGhhdCBsaWNlbnNlIG9wZW4gdGhlDQogICAg
PiBwb3NzaWJpbGl0eSBvZiBzb21lb25lIGNvcHlpbmcgdGhlIGhhcmR3YXJlPw0KICAgID4gDQog
ICAgPiBNYXliZSBpdCBtYWtlcyBtb3JlIHNlbnNlIHRvIHBvc3QgaXQgc29tZXdoZXJlIG91dHNp
ZGUgdGhlIE9wZW5CTUMNCiAgICA+IHByb2plY3QgKHRoZSBjb21wYW5pZXMgd2Vic2l0ZSBwZXJo
YXBzKSB0aGVuIHBvc3QgYSBsaW5rIHRvIGl0IHRvIHRoZQ0KICAgID4gbWFpbGluZyBsaXN0Pw0K
ICAgID4gDQogICAgPiBJJ20gbW9zdGx5IGp1c3QgdGhpbmtpbmcgb3V0IGxvdWQgYXQgdGhpcyBw
b2ludC4NCiAgICA+IA0KICAgID4gDQogICAgPiANCiAgICA+IEFzIGZhciBhcyB3aGVyZSB3ZSBw
dXQgaXQgaWYgd2UgZG8gZGVjaWRlIHRvIGhvc3QgaXQsIEkgZG9uJ3QgdGhpbmsgYQ0KICAgID4g
Z2l0IHJlcG8gaXMgdGhlIHJpZ2h0IGNob2ljZS4gIFNjaGVtYXRpY3MgYXJlbid0IGxpa2VseSB0
byBiZSBzb3VyY2UNCiAgICA+IGNvbnRyb2xsZWQgKGdpdmVuIHRoYXQgdGhleSdyZSBnb2luZyB0
byBiZSBib2FyZCBmaWxlcyBhbmQgUERGcywgbm90DQogICAgPiBlZGl0YWJsZSBzY2hlbWF0aWNz
KSBzbyBzb21lIGtpbmQgb2YgZmlsZSBkcm9wIHNlZW1zIGxpa2UgYSBiZXR0ZXINCiAgICA+IGNo
b2ljZSB0aGFuIHRoZSBkb2NzIHJlcG9zaXRvcnkuDQogICAgPiANCiAgICANCiAgICBmd2l3IEkg
IGFncmVlIHdpdGggRWQgb24gYWxsIHBvaW50cyBoZXJlLi4uDQoNCiBAT3NrYXIgU2VuZnQgQmFz
ZWQgb24gdGhpcyByZWNvbW1lbmRhdGlvbiwgSSB0aGluayBpdCB3b3VsZCBiZSBnb29kIHRvIGhv
c3Qgc2NoZW1hdGljcyBvdXRzaWRlIHRoZSBnaXRodWIgYW5kIHByb3ZpZGUgYSBzb2Z0bGluayBh
cyBhIHJlZmVyZW5jZS4gDQogICAgDQoNCg==
