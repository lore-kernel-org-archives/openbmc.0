Return-Path: <prvs=48557a82bc=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=48557a82bc=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="VTsHqtLJ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="OYzijF0l"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vj0q3QhszF3G7
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 09:27:06 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wADMOuUx006975; Tue, 13 Nov 2018 14:27:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=RQqE/lS83+Pm16B3y3U7clIfmoEbHt5KLEJxzkr7dzg=;
 b=VTsHqtLJOOiHZBG2ux8CTo2S5NbGg4t00SFhokSCMCmYyCcpiseLnUgOrlE9qMl1T308
 1iZKqGhaup6b+Y2kS6r+zbzt3yx1EUTQftdw7FjWj3PJzDkw79xjJdmLXj1cpSFpKBW7
 ryeWwXggooCv4WZVaJha0ZQku3pYDcyqnxU= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2nr7cvg0ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 13 Nov 2018 14:27:00 -0800
Received: from frc-hub01.TheFacebook.com (2620:10d:c021:18::171) by
 frc-hub01.TheFacebook.com (2620:10d:c021:18::171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 13 Nov 2018 14:26:59 -0800
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.71) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 13 Nov 2018 14:26:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQqE/lS83+Pm16B3y3U7clIfmoEbHt5KLEJxzkr7dzg=;
 b=OYzijF0lAiHMAp83c1se1rvvyjij6eQtCwhieWU/74qXC8S2yzP9wpH6iLUfzK1J8KFpkoXKdpAiddNGSK5lq57e9W2bBhtAkHiPjOkxfOD/6nN8XWpYA/cYiNkJp2JQM2K6ZbBRp89mhEd/Iml2LKsL83lyJgTBRWcA2XQxWew=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1199.namprd15.prod.outlook.com (10.175.2.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Tue, 13 Nov 2018 22:26:58 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f8fb:c0d5:46cd:cf56]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f8fb:c0d5:46cd:cf56%2]) with mapi id 15.20.1294.045; Tue, 13 Nov 2018
 22:26:58 +0000
From: Sai Dasari <sdasari@fb.com>
To: Andrew Geissler <geissonator@gmail.com>
CC: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Infrastructure Workgroup Meeting Time
Thread-Topic: OpenBMC Infrastructure Workgroup Meeting Time
Thread-Index: AQHUerhyhff56KsKn0mKzpYbKF9ayKVNILSAgAEMDQD//450AIAAjAyA//99K4A=
Date: Tue, 13 Nov 2018 22:26:57 +0000
Message-ID: <B62494DE-51E1-4EB2-94D4-E53C096CCC3D@fb.com>
References: <0000000000002cf60d057a7c257b@google.com>
 <CACPK8Xc7M0QLB4rp3xf6mWzq-cVKrEFCWm7vhNoORwv3Fzd2Hw@mail.gmail.com>
 <CALLMt=r8i-bugAiHYwdbB+MadLV01FKnr8o3N4g75Y66LMhoLA@mail.gmail.com>
 <F19DABDF-B5E9-42B5-8001-1632DDF1ED8C@fb.com>
 <CALLMt=ojiD4ufVKUJfR7hwLTTMsZERrwjmsnRTJDMzjijM2jSA@mail.gmail.com>
In-Reply-To: <CALLMt=ojiD4ufVKUJfR7hwLTTMsZERrwjmsnRTJDMzjijM2jSA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5:f6df]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1199;
 20:SjpKV4oPHqvtLVTaXTalThF7CtxHEY1vJlF6Vbyu+iTY+nStMHZZvC5L38eu8dk6eDFthJJqq3i1Rkg2OLuKckm++6SUlzJo6LOtBxz1+iG744PYFltbV4qi92hSs5IYOy84RRSgHDw5hWWUiMb2qpPOOp3YJ1vhB3gJYYNZC2E=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 5df14cc9-049e-4051-d85a-08d649b71fdd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390060)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1199; 
x-ms-traffictypediagnostic: MWHPR15MB1199:
x-microsoft-antispam-prvs: <MWHPR15MB1199ED9F52517F791AE5B8F2CEC20@MWHPR15MB1199.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(85827821059158)(67672495146484)(65623756079841); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231382)(11241501184)(944501410)(52105112)(10201501046)(3002001)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1199; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1199; 
x-forefront-prvs: 085551F5A8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(346002)(396003)(366004)(376002)(199004)(189003)(99286004)(46003)(39060400002)(6436002)(2616005)(8676002)(93886005)(105586002)(186003)(6512007)(11346002)(33656002)(446003)(53546011)(86362001)(82746002)(71200400001)(102836004)(76176011)(5660300001)(71190400001)(4326008)(476003)(6506007)(6246003)(53936002)(486006)(1411001)(14454004)(6486002)(229853002)(54906003)(478600001)(97736004)(256004)(106356001)(8936002)(2906002)(83716004)(81156014)(316002)(7736002)(81166006)(36756003)(25786009)(14444005)(305945005)(6116002)(6916009)(68736007)(2900100001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1199;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: S5enq0eB5LJbeJdwATKFhMBWhkGw/wE8EV74UMuMyc/3m4W66efYlcJhNhMmpopqTTYDGp6Knj6uiOQTZ/1Fb9fzLeU1DpAFaYTbnI8mrEy4927bdRbCdNJE3YThWz/7t7r4OGJ7/Pnvs49sp7mX3PeHYHk0zljSKPIcLvpJ+2AMqU+oWOH92jEItOrw+squ6nRTX8QfgDaHlXgKGdtXz1+blyARYvpLW1MPTpE2ntZ8ngL36eMsuUOdy63h9YcoDKi52vYC5DxlSnQ9O4k11GI4MmGTnapnNGsIKfcqcSSP7nkCSEIWEVpWlGxgCRXJlCGIuw1JwRjaabHqYYwuFaF9w2Mm6w6nfoiGcF2FDb0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF8229916FB6F743B48ECCE2C8B64771@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df14cc9-049e-4051-d85a-08d649b71fdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2018 22:26:57.9947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1199
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-13_16:, , signatures=0
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
X-List-Received-Date: Tue, 13 Nov 2018 22:27:08 -0000

DQoNCu+7v09uIDExLzEzLzE4LCAyOjE1IFBNLCAiQW5kcmV3IEdlaXNzbGVyIiA8Z2Vpc3NvbmF0
b3JAZ21haWwuY29tPiB3cm90ZToNCg0KICAgIE9uIFR1ZSwgTm92IDEzLCAyMDE4IGF0IDM6NTQg
UE0gU2FpIERhc2FyaSA8c2Rhc2FyaUBmYi5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+DQogICAg
Pg0KICAgID4gT24gMTEvMTMvMTgsIDEyOjQyIFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQW5k
cmV3IEdlaXNzbGVyIiA8b3BlbmJtYy1ib3VuY2VzK3NkYXNhcmk9ZmIuY29tQGxpc3RzLm96bGFi
cy5vcmcgb24gYmVoYWxmIG9mIGdlaXNzb25hdG9yQGdtYWlsLmNvbT4gd3JvdGU6DQogICAgPiAg
ICAgPiA+DQogICAgPiAgICAgPiA+IFRoZSBvcHBvc2l0ZSB3ZWVrIG9mIHRoZSB0ZXN0IHdvcmtn
cm91cCwgVGh1cnNkYXksIDEwLTExYW0gQ2VudHJhbA0KICAgID4gICAgID4gPiBUaGUgb3Bwb3Np
dGUgd2VlayBvZiB0aGUgcmVsZWFzZSB3b3JrZ3JvdXAsIE1vbmRheSwgMy00cG0gQ2VudHJhbA0K
ICAgID4gICAgID4NCiAgICA+ICAgICA+IERvIHlvdSBtZWFuIEF1c3RyYWxpYW4gQ2VudHJhbCBT
dGFuZGFyZCBUaW1lPw0KICAgID4NCiAgICA+ICAgICBJIHRoaW5rIGJhc2VkIG9uIHRoZSBmZWVk
YmFjaywgSSdtIGdvaW5nIHRvIHRyeSBmb3IgYSBldmVyeSBvdGhlciB3ZWVrDQogICAgPiAgICAg
b24gV2VkbmVzZGF5LCAzLTRwbSBDZW50cmFsDQogICAgPg0KICAgID4gSXMgdGhpcyBXZWRuZXNk
YXkgb3IgTW9uZGF5IGFzIHBlciB0aGUgb3JpZ2luYWwgcG9sbD8NCiAgICANCiAgICBZZWFoIHNv
cnJ5LCBLdXJ0IG1lbnRpb25lZCB0byBtZSB0aGF0IGFzIHdlIGdldCBuZWFyIHJlbGVhc2UgdGlt
ZSwgdGhlIHJlbGVhc2UNCiAgICB3b3JrZ3JvdXAgbWF5IHdhbnQgdG8gZ28gYmFjayB0byBhIHdl
ZWtseSBtZWV0aW5nLCBzbyB0aGUgTW9uZGF5IDMtNHBtDQogICAgb25lIG5vIGxvbmdlciB3b3Jr
ZWQuIFNpbmNlIHRoZSBhZnRlcm5vb24gd2FzIHByZWZlcnJlZCwgSSBqdXN0IHN3aXRjaGVkDQog
ICAgaXQgdG8gYSBXZWRuZXNkYXkuIERvZXMgdGhhdCBub3Qgd29yayBmb3IgeW91IFNhaT8NCldv
cmtzIGZpbmUgZm9yIG1lLiBUaGFua3MgZm9yIGNvbmZpcm1hdGlvbiENCiAgICANCiAgICA+DQog
ICAgPiAgICAgVGhhbmtzIGZvciBhbGwgdGhlIHF1aWNrIHJlc3BvbnNlcyENCiAgICA+DQogICAg
PiAgICAgPg0KICAgID4gICAgID4gQ2hlZXJzLA0KICAgID4gICAgID4NCiAgICA+ICAgICA+IEpv
ZWwNCiAgICA+DQogICAgPg0KICAgIA0KDQo=
