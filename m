Return-Path: <prvs=89841f00aa=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=89841f00aa=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="rrhvb8/e"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="hUVoUoHT"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QsBs5WfNzDqNf
 for <openbmc@lists.ozlabs.org>; Sat, 23 Mar 2019 05:10:09 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x2MHxLNr028658;
 Fri, 22 Mar 2019 11:10:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Oe7t/DHOzmcrWLcFY+X4wqlUgT07i7VdcJWAplWqce4=;
 b=rrhvb8/eH1o3mU49CqE/qw9d2l9SC/I8LjxavBAOyxLfnbzEFv0NlHBMpLB1Dgn8bX8R
 +w8Ex/xB11C/7vYlZq2sRi5PXUlQSur0cevUvsAmoCoTz5XSOB+bSMGyghgI15oLgljA
 emIlipD+DxgtrU01wMwYWbnbmY11y6B+kDU= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by m0089730.ppops.net with ESMTP id 2rcyv515p6-17
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 22 Mar 2019 11:10:04 -0700
Received: from frc-hub03.TheFacebook.com (2620:10d:c021:18::173) by
 frc-hub05.TheFacebook.com (2620:10d:c021:18::175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 22 Mar 2019 11:10:02 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.73) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 22 Mar 2019 11:10:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe7t/DHOzmcrWLcFY+X4wqlUgT07i7VdcJWAplWqce4=;
 b=hUVoUoHTKSFpQoi/qZDRT0QQXbSZNwCNZt3UR3nlSfiNj1GXjqqFVkpND7yPsxZx5Kl+BsMkMrNKkj+noKivwMUF5BFP4p+Cv6B/8JdxJSyNQNu89qm0m/HukbqKKSxNUYYawjVm2cTH90cJ55fLPQ0V08R7aC0cUJJ8BxpBsL0=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1845.namprd15.prod.outlook.com (10.172.75.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.15; Fri, 22 Mar 2019 18:10:01 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d%3]) with mapi id 15.20.1730.017; Fri, 22 Mar 2019
 18:10:01 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, Henbin Chang
 <henbinchang@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Some problems about FruDevice in the entity-manager
Thread-Topic: Some problems about FruDevice in the entity-manager
Thread-Index: AQHU4HIjSu1jDji9X0W42n4qWwRLc6YXzkGA//+wbwA=
Date: Fri, 22 Mar 2019 18:10:00 +0000
Message-ID: <740E00DF-F233-41A1-B894-9DB98A9AD62A@fb.com>
References: <CAG9c7cDQc=o_=vEFRAjRRq9bV2Fz6ZD7Osp+vkd2QRgxmGcXGg@mail.gmail.com>
 <bee0622c-8ae6-3db3-b7f7-9d48651cf907@linux.intel.com>
In-Reply-To: <bee0622c-8ae6-3db3-b7f7-9d48651cf907@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::97a5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02a6b573-59e0-4f62-49a9-08d6aef199d4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1845; 
x-ms-traffictypediagnostic: CY4PR15MB1845:
x-microsoft-antispam-prvs: <CY4PR15MB1845F4DCB5E81DBFA3691008DD430@CY4PR15MB1845.namprd15.prod.outlook.com>
x-forefront-prvs: 09840A4839
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(346002)(136003)(396003)(366004)(199004)(189003)(2616005)(83716004)(6512007)(71200400001)(486006)(6436002)(86362001)(7736002)(53936002)(6486002)(68736007)(82746002)(97736004)(229853002)(25786009)(5660300002)(110136005)(476003)(71190400001)(446003)(316002)(11346002)(33656002)(8676002)(478600001)(105586002)(106356001)(14454004)(99286004)(305945005)(46003)(186003)(6506007)(81156014)(102836004)(6116002)(2906002)(256004)(81166006)(6246003)(36756003)(76176011)(53546011)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1845;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 96lEU21sYxck7j5MPhadZUBLESKfoffuYHkfNqLUyvpxP497hxZDkhIDaNdvvr7qiQFHZuOUpXeqnsEel6KYwP/Ha3kSo4DNc2m9JcP9+vbaOr1IfHkcIVWecFWiLDJQjHSNJS6FLVcUq+ALD4nuk60gHT8lz16CYUpLwRtMyj064LN4ikr2nWoST7poOd2G2xU/EVAUIR2Y4P6WcmZSjWbHXM6Pr69vMMtut3tTQK8uR9Z+bdmCMhH8a3sQYBBiWlOvSahNKylBRbXTbTA4xjcIlPwKk2NmbZEhtua9nvPZuEpuoIEquCAu9btWzZwpUDpEROmVtAALSlOharIItDpItXjt67MkREyydFbpVO2+AnuqNIwmIQCEf3CLu3ylWp0hiTKHOfJkLGzOqRseKSwalcydbE0GY1MMTpKcHEg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2083A899D766F04D956CC1D366430393@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a6b573-59e0-4f62-49a9-08d6aef199d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2019 18:10:00.9220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1845
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-22_10:, , signatures=0
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
X-List-Received-Date: Fri, 22 Mar 2019 18:10:15 -0000

DQoNCu+7v09uIDMvMjIvMTksIDg6NTUgQU0sICJKYW1lcyBGZWlzdCIgPGphbWVzLmZlaXN0QGxp
bnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAgICBPbiAzLzIxLzE5IDEwOjQxIFBNLCBIZW5iaW4g
Q2hhbmcgd3JvdGU6DQogICAgPiBIaSBKYW1lcywNCiAgICA+IA0KICAgID4gVGhlcmUgaXMgRUVQ
Uk9NIChBVDI0QzY0KSB3aXRoIHRoZSB2YWxpZCBGUlUgZGF0YSBvbiBteSBib2FyZC4NCiAgICA+
IA0KICAgID4gQnV0IHRoZSBGcnVEZXZpY2Ugd291bGQgZmFpbCB0byBmb3JtYXQgaXQuDQogICAg
PiANCiAgICA+IEkgYWRkZWQgc29tZSBkZWJ1ZyBpbmZvcm1hdGlvbiB0byBkZXRlcm1pbmUgd2hh
dCdzIHdyb25nIHdpdGggaXQuDQogICAgPiANCiAgICA+IFRoZW4gSSBmb3VuZCB0aGUgZmxhZyB2
YXJpYWJsZSByZXR1cm5lZCBieSBpc0RldmljZTE2Qml0KCkgd2FzIGVxdWFsIDAuDQogICAgPiBU
aGF0J3MsIHRoZSBGcnVEZXZpY2UgY291bGQgdGhpbmsgaXQncyA4LWJpdCBFRVBST00uDQogICAg
PiAvKiBDaGVjayBmb3IgRGV2aWNlIHR5cGUgaWYgaXQgaXMgOCBiaXQgb3IgMTYgYml0ICovDQog
ICAgPiBpbnQgZmxhZyA9IGlzRGV2aWNlMTZCaXQoZmlsZSk7DQogICAgPiANCiAgICA+IFRoZXJl
IGlzIHRoZSBiZWxvdyBjb21tZW50IGluIHRoZSBpc0RldmljZTE2Qml0KCkuDQogICAgDQogICAg
VmlqYXksIGNhbiB5b3UgY29tbWVudCBvbiB0aGlzPw0KICAgIA0KICAgIEkgYmVsaWV2ZSB0aGUg
bG9naWMgaGVyZSB3YXMgdGhhdCB0aGUgMTZiaXQgZWVwcm9tcyBWaWpheSB3YXMgdXNpbmcgDQog
ICAgYXV0by1pbmNyZW1lbnQgdGhlIGFkZHJlc3MsIHNvIHJlYWRpbmcgdHdpY2Ugb3ZlciB0aGUg
aGVhZGVyIHNob3VsZCBnaXZlIA0KICAgIGRpZmZlcmVudCBhbnN3ZXJzLCBhcyB0aGUgY2hlY2tz
dW0gaXMgaW4gdGhlIGhlYWRlci4gVGhhdCBiZWluZyBzYWlkIEkgDQogICAgZG9uJ3QgaGF2ZSBh
bnkgMTZiaXQgZWVwcm9tcyBpbiBteSBzeXN0ZW0gc28gSSBoYXZlbid0IHRyaWVkIHRoaXMgDQog
ICAgYnJhbmNoLiBWaWpheSBhdXRob3JlZCB0aGlzIHNvIGhlIG1pZ2h0IGhhdmUgYSBiZXR0ZXIg
aWRlYSBvZiB3aGF0IGlzIA0KICAgIGdvaW5nIG9uLg0KICAgIA0KICAgIFRoYW5rcywNCiAgICAN
CiAgICBKYW1lcw0KDQpUaGUgaXNzdWVzIGhlcmUgaXMgZWVwcm9tIGluZGV4IGlzIG5vdCBhdCAw
MCB3aGljaCB3YXMgYW4gYXNzdW1wdGlvbi4gSW4gdGhpcyBjYXNlLCBpdA0KaXMgbm90IHBvaW50
aW5nIHRvIGZpcnN0IDggYnl0ZSBoZWFkZXIgYnV0IGl0IGlzIHBvaW50aW5nIHRvIGdhcmJhZ2Ug
d2hlcmUgYWxsIG5leHQgDQo4IGJ5dGVzIGFyZSBzYW1lIHdoaWNoIG1lYW5zIG15IGNoZWNrIGlz
IGZhaWxpbmcuIFdlIG5lZWQgYmV0dGVyIHdheSB0byBmaW5kIGlmIGkyYyBkZXZpY2UNCklzIGVl
cHJvbSBhbmQgdGhlbiBmaW5kIDggYml0IG9yIDE2IGJpdHMuIEkgd2lsbCBsb29rIGludG8gaXQu
IEluIHRoZSBtZWFud2hpbGUgdGhlcmUgaXMgcGF0Y2ggDQpmb3IgZGlyZWN0IHJlYWRpbmcgZnJv
bSBzeXNmcywgcGxlYXNlIHVzZSB0aGF0IGFuZCBzZWUgaWYgaXQgc29sdmVzIGZvciB0aW1lIGJl
aW5nLiBJIHdpbGwgc2VuZCBnZXJyaXQNCmxpbmsgZm9yIHBhdGNoIHNvb24uDQoNCi1WaWpheQ0K
DQogICAgDQogICAgDQogICAgPiANCiAgICA+IC8qIFJlYWQgNyBtb3JlIGJ5dGVzLCBpdCB3aWxs
IHJlYWQgc2FtZSBmaXJzdCBieXRlIGluIGNhc2Ugb2YNCiAgICA+ICAgKiA4IGJpdCBidXQgaXQg
d2lsbCByZWFkIG5leHQgYnl0ZSBpbiBjYXNlIG9mIDE2IGJpdA0KICAgID4gKi8NCiAgICA+IEJ1
dCB0aGUgcnVsZSBpc24ndCBhcHBsaWNhYmxlIHRvIG15IEVFUFJPTSAoQVQyNEM2NCkgLg0KICAg
ID4gcm9vdEBoZW5iaW46L3Zhci92b2xhdGlsZSMgaTJjdHJhbnNmZXIgLWYgLXkgNiB3MUAweDUw
IDAgcjENCiAgICA+IDB4MDANCiAgICA+IHJvb3RAaGVuYmluOi92YXIvdm9sYXRpbGUjIGkyY3Ry
YW5zZmVyIC1mIC15IDYgdzFAMHg1MCAwIHIxDQogICAgPiAweDAwDQogICAgPiByb290QGhlbmJp
bjovdmFyL3ZvbGF0aWxlIyBpMmN0cmFuc2ZlciAtZiAteSA2IHcxQDB4NTAgMCByMQ0KICAgID4g
MHgwMA0KICAgID4gcm9vdEBoZW5iaW46L3Zhci92b2xhdGlsZSMgaTJjdHJhbnNmZXIgLWYgLXkg
NiB3MUAweDUwIDAgcjENCiAgICA+IDB4MDANCiAgICA+IHJvb3RAaGVuYmluOi92YXIvdm9sYXRp
bGUjIGkyY3RyYW5zZmVyIC1mIC15IDYgdzFAMHg1MCAwIHIxDQogICAgPiAweDAwDQogICAgPiBy
b290QGhlbmJpbjovdmFyL3ZvbGF0aWxlIyBpMmN0cmFuc2ZlciAtZiAteSA2IHcxQDB4NTAgMCBy
MQ0KICAgID4gMHgwMA0KICAgID4gcm9vdEBoZW5iaW46L3Zhci92b2xhdGlsZSMgaTJjdHJhbnNm
ZXIgLWYgLXkgNiB3MUAweDUwIDAgcjENCiAgICA+IDB4MDANCiAgICA+IHJvb3RAaGVuYmluOi92
YXIvdm9sYXRpbGUjIGkyY3RyYW5zZmVyIC1mIC15IDYgdzFAMHg1MCAwIHIxDQogICAgPiAweDAw
DQogICAgPiByb290QGhlbmJpbjovdmFyL3ZvbGF0aWxlIw0KICAgID4gDQogICAgPiBDb3VsZCB5
b3UgZ2l2ZSBzb21lIHN1Z2dlc3Rpb24/DQogICAgPiANCiAgICA+IFRoYW5rcy4NCiAgICANCg0K
