Return-Path: <prvs=48502dcd3d=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=48502dcd3d=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="YeDDPjXf"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="gB/kMUn4"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42r4Z34c6VzF37r
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 11:54:50 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wA80rkTi004011; Wed, 7 Nov 2018 16:54:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=JGKJUDZgGuNuY9gPqHkAG3+IdGXwhxeXDuSWdU/D6hM=;
 b=YeDDPjXf7N3IxI0Pv4xCRHMyNZjPdKRIJ7yCBecC/F/XxlpY1OHm5LYyOdBpI8F75lM8
 4grktTk/UWUjrDnoSpuAvadEFCJ6hQPOknezYXfiOVoL2ByHR5QZPIHt5/ZVcfm7b2Iy
 AArrTe/nSt/G9Wb1nUMKRe0s0Ex6NSeyD9U= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2nma35057j-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 07 Nov 2018 16:54:46 -0800
Received: from frc-hub03.TheFacebook.com (2620:10d:c021:18::173) by
 frc-hub03.TheFacebook.com (2620:10d:c021:18::173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 7 Nov 2018 16:54:46 -0800
Received: from FRC-CHUB12.TheFacebook.com (2620:10d:c021:18::31) by
 frc-hub03.TheFacebook.com (2620:10d:c021:18::173) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Wed, 7 Nov 2018 16:54:46 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.32) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Wed, 7 Nov 2018 19:54:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGKJUDZgGuNuY9gPqHkAG3+IdGXwhxeXDuSWdU/D6hM=;
 b=gB/kMUn4wv5bvxGgOe2QsT8m2EAOVOBIc/C4/KDiFq5Fh5+8FoZ+vjbOL7u1u1ruIX+QIkZU+BDjNXNm5QzP5t1MTEPhv95FQyKu93Pcqmwcp7yajAQudJArE43wjftwdo7bYeVr4hu76qY09zx7wNKtT2wEfAvTMhRDag9d9xc=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1742.namprd15.prod.outlook.com (10.174.255.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.32; Thu, 8 Nov 2018 00:54:44 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::709f:e3cd:1db:74d6]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::709f:e3cd:1db:74d6%2]) with mapi id 15.20.1294.034; Thu, 8 Nov 2018
 00:54:44 +0000
From: Tao Ren <taoren@fb.com>
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: pull request to the u-boot-aspeed
Thread-Topic: pull request to the u-boot-aspeed
Thread-Index: AQHUdv2jVwtlFN/TBkeSZWS7lMM1JQ==
Date: Thu, 8 Nov 2018 00:54:44 +0000
Message-ID: <c59de915-9608-4c44-adc3-82d83d6e279a@fb.com>
References: <3ff8d429943e44139b73cb16199a560e@yadro.com>
 <3D1C8267-BC6F-44F1-B12F-020E147B225B@fb.com>
 <a6ba63dc-eecc-9a24-e479-8036d53804bd@fb.com>
 <CACPK8Xf6hD9ne530ZLWgE-Tuc9MCXiHrFpx-zJ_SdsDV81Lohw@mail.gmail.com>
In-Reply-To: <CACPK8Xf6hD9ne530ZLWgE-Tuc9MCXiHrFpx-zJ_SdsDV81Lohw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR22CA0015.namprd22.prod.outlook.com
 (2603:10b6:300:ef::25) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::6:85f]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1742;
 20:4wltvrB1dWXyGBkMxtDfcWWMn6E441zstKwUwMAGjDBjvaEuTPtvdS3qDon+tO2ACbT5MayD2v25LHbMgQTiRfluh8ZYZZfuUL2efmkhVQAXv+w8xktgGMxTlS4QhZJkTK/R+oF+1k+E3HSX172qd8pq3wHTHlMSzPE2tLqM6uc=
x-ms-office365-filtering-correlation-id: 7fc29a5f-a8ad-4eae-4fd7-08d64514c5c2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1742; 
x-ms-traffictypediagnostic: MWHPR15MB1742:
x-microsoft-antispam-prvs: <MWHPR15MB1742105C27B112CCEC1D39D4B2C50@MWHPR15MB1742.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(67672495146484);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231382)(11241501184)(944501410)(52105095)(148016)(149066)(150057)(6041310)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1742; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1742; 
x-forefront-prvs: 0850800A29
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(376002)(346002)(39860400002)(136003)(199004)(189003)(6512007)(65826007)(6306002)(5660300001)(68736007)(86362001)(106356001)(81156014)(81166006)(6486002)(105586002)(65806001)(65956001)(64126003)(305945005)(2900100001)(229853002)(7736002)(71200400001)(256004)(6436002)(53936002)(8676002)(31696002)(6116002)(71190400001)(6916009)(58126008)(52116002)(25786009)(99286004)(76176011)(4326008)(6246003)(316002)(53546011)(102836004)(93886005)(966005)(2906002)(486006)(11346002)(14454004)(476003)(386003)(2616005)(446003)(6506007)(97736004)(31686004)(46003)(8936002)(478600001)(36756003)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1742;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: wHY+hchjCgS3xVmrBBfFN4U+SuevgZZpUb1sh5eMvL891z/X4UC/ygViPa7KZ0DhhgZuoEUnSE7hcKuPc+W+Z7CrCD8qZJY/oBfRbr2S6/0u3ax10jpfD1iSi0pt1j6vQX9eLRN+/vKMuZHuyPDbJFebCmqzKanRBJSJ33cwN1jFyLE6sRihxlXOWYXnyHvh6CK51FkdRC65L9HG062E9tnUq/OHwWrPSfVvD3jrh1Gy5niWyfPs6fAEAalOHS3fzYhWWKeJX/wYIkHEen8LTKeujsTUM+N5F6dXmPzhyqeMXhHSdNF1M+mqCWTIC2TgpLx3ai4cKWRl7OMjc3wjJitbQOSXqKdP48yexutygwg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <45E1F4743F03BB4AA12D80D34991440D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc29a5f-a8ad-4eae-4fd7-08d64514c5c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2018 00:54:44.1356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1742
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-07_19:, , signatures=0
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
X-List-Received-Date: Thu, 08 Nov 2018 00:54:52 -0000

T24gMTEvNy8xOCA0OjM1IFBNLCBKb2VsIFN0YW5sZXkgd3JvdGU6DQo+IE9uIFRodSwgOCBOb3Yg
MjAxOCBhdCAwNzoxOSwgVGFvIFJlbiA8dGFvcmVuQGZiLmNvbT4gd3JvdGU6DQo+Pg0KPj4gT24g
MTEvNy8xOCAxMTozMiBBTSwgU2FpIERhc2FyaSB3cm90ZToNCj4+PiBIaSBBbGV4YW5kZXIsDQo+
Pj4NCj4+PiBUaGUgcHJvY2VzcyBmb3IgdS1ib290IGNoYW5nZXMgaXMgc2ltaWxhciB0byBrZXJu
ZWwgY2hhbmdlcyB3aGljaCBpcyBkb2N1bWVudGVkQCBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJt
Yy9kb2NzL2Jsb2IvbWFzdGVyL2tlcm5lbC1kZXZlbG9wbWVudC5tZC4gSSBiZWxpZXZlIGl0IGRv
ZXMgbm90IGludm9sdmUgZ2Vycml0IHdoaWNoIGlzIGZvciBjb3JlIE9wZW5CTUMgdXNlcmxhbmQg
ZmVhdHVyZSBkZXZlbG9wbWVudC4NCj4+DQo+PiBUaGFuayB5b3UgU2FpIGZvciBzaGFyaW5nIHRo
ZSBsaW5rLiBJJ20gYWN0dWFsbHkgbG9va2luZyBhdCBiZWxvdyBwYWdlIGZvciBrZXJuZWwgcGF0
Y2hlczogd2hpY2ggb25lIGlzIHVwIHRvIGRhdGU/DQo+Pg0KPj4gaHR0cHM6Ly9naXRodWIuY29t
L29wZW5ibWMvbGludXgvd2lraS9EZXZlbG9wbWVudFByb2Nlc3MNCj4gDQo+IEkndmUga2VwdCB0
aGUgd2lraSBvbmUgbW9yZSB1cCB0byBkYXRlIGFzIEkgZmluZCBpdCBoYXMgYSBsb3dlcg0KPiBi
YXJyaWVyIHRvIGVudHJ5IHdoZW4gbWFraW5nIGVkaXRzIGFuZCB1cGRhdGVzLg0KPiANCj4gSG93
ZXZlciwgSSB0aGluayB0aGV5IGFyZSBjb21wbGltZW50YXJ5LiBJZiBub3QsIGxldCBtZSBrbm93
IHdoZXJlDQo+IHRoZXkgY29udHJhZGljdCBhbmQgd2UgY2FuIHVuaWZ5IHRoZSBkb2N1bWVudGF0
aW9uLg0KDQoNClRoYW5rcyBKb2VsIGZvciB0aGUgY2xhcmlmeS4gSWYgeW91IGRvbid0IG1pbmQs
IEkgY2FuIG1vdmUvY29tYmluZSBhbGwgdGhlIGtlcm5lbCBzdHVmZiB0byBvcGVuYm1jL2xpbnV4
L3dpa2kvRGV2ZWxvcG1lbnRQcm9jZXNzIGFuZCBsaW5rIHRoZSBwYWdlIGluIG9wZW5ibWMvZG9j
cy9ibG9iL21hc3Rlci9rZXJuZWwtZGV2ZWxvcG1lbnQubWQuDQoNClRoYW5rcywNClRhbyBSZW4N
Cg==
