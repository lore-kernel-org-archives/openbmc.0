Return-Path: <prvs=5876031fb4=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5876031fb4=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="oSMeN+v9"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="R9kcOCTc"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4385Bz5gsfzDqjd
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 13:18:46 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wB42IOfS021729; Mon, 3 Dec 2018 18:18:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=AAQqDf+x8lKypJq1Ebg1pHjDaaiJXPg0xV0hSpp/G/o=;
 b=oSMeN+v9WuWzT/GZTDSB9P76jqUHIdh5uDCsSXD6gcFNqF8m5WD/SxLrqLgbRdVM2Rj+
 /N9dr6NRvTVV+qcf2llQOaunNSbq3EPGyRsp0imuLKsMPu3sHlvn3wAmr3X6/vptILOp
 iWQ4J4UlWI/OubWoZhuRucJA2PR4kQ6sMI0= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2p5e49gemf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 03 Dec 2018 18:18:38 -0800
Received: from frc-mbx01.TheFacebook.com (2620:10d:c0a1:f82::25) by
 frc-hub06.TheFacebook.com (2620:10d:c021:18::176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 3 Dec 2018 18:18:37 -0800
Received: from frc-hub01.TheFacebook.com (2620:10d:c021:18::171) by
 frc-mbx01.TheFacebook.com (2620:10d:c0a1:f82::25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 3 Dec 2018 18:18:36 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.71) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Mon, 3 Dec 2018 18:18:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAQqDf+x8lKypJq1Ebg1pHjDaaiJXPg0xV0hSpp/G/o=;
 b=R9kcOCTcYUm3Cbd2QFUHaQtDQN2KZQUKUER0o3agjIGNigUGocPUn77kGJSrPrYA09AIVCCLZlf+LfGl3Aexod3aoI53aD+3TjfmXRn6+4PxXzmRFFtUGSF5CD1BLwR48d4KrSNw/UeQvarSxexn9vqvU8K9t3hSSdkm0WKJjEI=
Received: from BN6PR15MB1265.namprd15.prod.outlook.com (10.172.206.15) by
 BN6PR15MB1553.namprd15.prod.outlook.com (10.172.152.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.22; Tue, 4 Dec 2018 02:18:35 +0000
Received: from BN6PR15MB1265.namprd15.prod.outlook.com
 ([fe80::88d6:6e49:6abf:47e0]) by BN6PR15MB1265.namprd15.prod.outlook.com
 ([fe80::88d6:6e49:6abf:47e0%7]) with mapi id 15.20.1382.020; Tue, 4 Dec 2018
 02:18:35 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Samuel Jiang
 <chyishian.jiang@gmail.com>, qianlihu <wangzhiqiang8906@gmail.com>,
 Gary Hsu <gary_hsu@aspeedtech.com>,
 "Ryan Chen <Ryan Chen" <ryan_chen@aspeedtech.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [HELP] ipmi-kcs didn't work
Thread-Topic: [HELP] ipmi-kcs didn't work
Thread-Index: AQHUfAaAMP2kbKDNOUGRurHcg5+B4KVPg+eAgACO1QCAASihgIAVbPaAgACKdwCAAIbQgIAA0d+A//+zjgCAAI7agP//rwCAgACNLoCAAQJWAIADPG2AgAAoU4A=
Date: Tue, 4 Dec 2018 02:18:34 +0000
Message-ID: <A4C4BC01-A05F-427A-994D-5F999B47229D@fb.com>
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
 <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
 <e63c758f-2eec-9e28-9381-4e28d2d8bb64@linux.intel.com>
 <4780f022-1c80-4b53-9eb1-0e3fe313c6a2@Spark>
 <db5cfcea-972d-2f50-05f4-266ab2c8f310@linux.intel.com>
 <87C3DCC8-F773-46A0-B8EC-5E3DC5E3983F@fb.com>
 <660c304f-60eb-f54a-f3b7-4d6d4481a96a@linux.intel.com>
 <A9318AC7-EE0E-4B84-84D1-A16695EE3FC0@fb.com>
 <b20d590b-be35-046e-26c2-2c1b2456309a@linux.intel.com>
 <253b7d32-1230-4111-a6dc-a84afddcc679@Spark>
 <25e866d4-749c-902b-86b2-3d38975dcc65@linux.intel.com>
In-Reply-To: <25e866d4-749c-902b-86b2-3d38975dcc65@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:64da]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR15MB1553;
 20:vcEA3JsbWkasXhDt4RgQs6DTdtO0wCZoad82aOtg0IoxGq+/BCUXOBGF95bF11358tZFfxbZ0T97L6zolzoETyfXr027VPKX16puH1hmIDL2htUR7BlRGDD2xF9jjxVwyDQi2XxPVo0/DUFMSPYxizo/BjqflOLK6GRVUvhHqjo=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: a426daf4-17e5-4bd2-9de9-08d6598ecb68
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR15MB1553; 
x-ms-traffictypediagnostic: BN6PR15MB1553:
x-microsoft-antispam-prvs: <BN6PR15MB1553714BC35423B84B635836DDAF0@BN6PR15MB1553.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231455)(999002)(11241501185)(944501493)(52105112)(93006095)(93001095)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:BN6PR15MB1553; BCL:0; PCL:0; RULEID:; SRVR:BN6PR15MB1553; 
x-forefront-prvs: 0876988AF0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(376002)(366004)(39860400002)(396003)(189003)(199004)(36756003)(81166006)(4326008)(6246003)(8936002)(6512007)(2906002)(33656002)(6116002)(97736004)(25786009)(14454004)(81156014)(446003)(39060400002)(93886005)(8676002)(478600001)(53936002)(165073002)(316002)(11346002)(6436002)(71190400001)(82746002)(476003)(46003)(106356001)(105586002)(68736007)(6486002)(5660300001)(229853002)(83716004)(14444005)(256004)(110136005)(71200400001)(486006)(76176011)(86362001)(99286004)(53546011)(102836004)(186003)(2616005)(6506007)(305945005)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR15MB1553;
 H:BN6PR15MB1265.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: csT4JwICj64/WiDR9voO7hucA7ix3loQatJiHZZIVA/twm9yc/EPeQTILVRpL7dT3iQMxehUHBI3cqO9Gt8v5eEeMCQGtJUY0RFh3JOIKSYsBgmDJ1uf0tzbA/jTcsgzzhQuMILrTJCDWkhk9pRVgdUM4LKeTLETanib7/j51bZ7C+qMxCKyLSds7YlxsSWINkKF7k83e2Ua9vbOyXzyxYlu8r/3yfCUFAgczxnelZqIuzMSZfQqhXaMj3WVrMPd1C2EreSYoWjxzkQ6oafvZ1pImv3sWSlp5sC+ATcG5n15c5SCh8nfEHRzhbDjlELJPGA2yrSAVjvEhQyoUVULeuYPGSL7I9hgfl9Lc4Si+RY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B51B80CDCC91249B54B40B2D4496EE8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a426daf4-17e5-4bd2-9de9-08d6598ecb68
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2018 02:18:35.0861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR15MB1553
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-04_01:, , signatures=0
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
X-List-Received-Date: Tue, 04 Dec 2018 02:18:52 -0000

SGkgSmF5LA0KSSBmb3VuZCBpc3N1ZSwgQXMgbHBjLWN0cmwgZHJpdmVyIHByb2JlIGlzIGZhaWxp
bmcgYmVjYXVzZSBJIGRpZG4ndCBkZWZpbmUgZmxhc2ggYW5kIG1lbW9yeS1yZWdpb24gaW4gRFQg
Zm9yIGxwYy1jdHJsIHdoaWNoIHByb2JlIGxvb2sgZm9yLiBCeSBkZWZpbmluZyB0aGVzZSBscGMt
Y3RybCBkcml2ZXIgY29tZXMgdXAgYW5kIGVuYWJsZSBscGMgY2xvY2suIEl0IGlzIHdvcmtpbmcg
Zm9yIG1lIG5vdyB3aXRoIHRoaXMgRFQgY2hhbmdlLg0KDQpSZWdhcmRzDQotVmlqYXkNCg0K77u/
T24gMTIvMy8xOCwgNzo1NCBBTSwgIkphZSBIeXVuIFlvbyIgPGphZS5oeXVuLnlvb0BsaW51eC5p
bnRlbC5jb20+IHdyb3RlOg0KDQogICAgT24gMTIvMS8yMDE4IDg6MjkgQU0sIFNhbXVlbCBKaWFu
ZyB3cm90ZToNCiAgICA+IEFwb2xvZ2l6ZSBmb3Igc2VuZGluZyBvdXQgbm8gY29udGVudCBtYWls
IGZpcnN0Lg0KICAgID4gDQogICAgPiBKYWUsDQogICAgPiBUaGUgYXNwZWVkX2dhdGVzIGluIGNs
ay1hc3BlZWQuYyBwZXJoYXBzIGFzIHRvZG8gc3VnZ2VzdCBhc2tpbmcgQXNwZWVkIA0KICAgID4g
dGhlIGFjdHVhbCBwYXJlbnQgZGF0YSBmb3IgY2hlY2sgaW5pdGlhbGl6aW5nPw0KICAgID4gDQog
ICAgDQogICAgWWVzLCB0aGF0IG1ha2VzIHNlbnNlLg0KICAgIA0KICAgIEhpIEdhcnkgYW5kIFJ5
YW4sDQogICAgDQogICAgQ2FuIHlvdSBwbGVhc2UgdGVsbCB1cyB3aGF0IGlzIHRoZSBhY3R1YWwg
cGFyZW50IGNsb2NrIHNvdXJjZSBvZiBMUEMgSVA/DQogICAgSSBtZWFuIHRoZSBvcGVyYXRpb25h
bCBjbG9jayBvZiBMUEMgSVAgaGFyZHdhcmUgYmxvY2ssIG5vdCB0aGUgaW50ZXJmYWNlDQogICAg
Y2xvY2suDQogICAgDQogICAgVGhhbmtzLA0KICAgIEphZQ0KICAgIA0KICAgID4gVmlqYXksDQog
ICAgPiBJIHRyYWNlZCBscGMtY3RybCBtb2R1bGUsIGl0IHNlZW1zIGRpcmVjdCB1cGRhdGUgdGhl
IHNhbWUgDQogICAgPiBBU1BFRURfQ0xLX0dBVEVfTENMSyByZWdpc3RlciBtYXAgYml0IHRvIGVu
YWJsZS4gSWYgcGFyZW50IGRhdGEgaXMgDQogICAgPiBkaXNhYmxlZCwgaXQgY291bGQgZW5hYmxl
IGluIGR0cy4NCiAgICA+IFRoZSBkZXZpY2UgdHJlZSBkZXRhaWwsIEkgcmVmZXJlbmNlIGl0IGZy
b20gYXNwZWVkLWc1LmR0c2kuIEhvcGUgaXQgDQogICAgPiBjb3VsZCBoZWxwIHlvdSBmb3Igd29y
ay4NCiAgICA+IA0KICAgID4gVGhhbmtzLA0KICAgID4gDQogICAgPiBTYW11ZWwgSmlhbmcNCiAg
ICA+IE9uIERlYyAxLCAyMDE4LCA3OjA0IEFNICswODAwLCBKYWUgSHl1biBZb28gLCB3cm90ZToN
CiAgICA+PiBPbiAxMS8zMC8yMDE4IDQ6MzkgUE0sIFZpamF5IEtoZW1rYSB3cm90ZToNCiAgICA+
Pj4NCiAgICA+Pj4NCiAgICA+Pj4gT24gMTEvMzAvMTgsIDExOjI5IEFNLCAiSmFlIEh5dW4gWW9v
IiA8amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4gDQogICAgPj4+IHdyb3RlOg0KICAgID4+
Pg0KICAgID4+PiBPbiAxMS8zMC8yMDE4IDEyOjU3IFBNLCBWaWpheSBLaGVta2Egd3JvdGU6DQog
ICAgPj4+Pg0KICAgID4+Pj4gT24gMTEvMzAvMTgsIDc6MzEgQU0sICJKYWUgSHl1biBZb28iIDxq
YWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPiANCiAgICA+Pj4+IHdyb3RlOg0KICAgID4+Pj4N
CiAgICA+Pj4+IE9uIDExLzI5LzIwMTggOTowMCBQTSwgU2FtdWVsIEppYW5nIHdyb3RlOg0KICAg
ID4+Pj4+IEhpIEphZSwNCiAgICA+Pj4+Pg0KICAgID4+Pj4+IFdlIGFsc28gZW5jb3VudGVyZWQg
dGhlIHNhbWUgc2l0dWF0aW9uIGEgbW9udGggYWdvLg0KICAgID4+Pj4+IFdlIHRyeSB0byBlbmFi
bGUgdGhlIExQQyBjbG9jayBvbiBkZXZpY2V0cmVlIHRvIHJlc29sdmUgdGhpcyANCiAgICA+Pj4+
PiBwcm9ibGVtIG5vdA0KICAgID4+Pj4+IGRpcmVjdCBtb2RpZnkgY2xvY2sgZHJpdmVyLg0KICAg
ID4+Pj4+DQogICAgPj4+Pj4gbHBjX2N0cmw6IGxwYy1jdHJsQDAgew0KICAgID4+Pj4+IOKAgyBj
b21wYXRpYmxlID0gImFzcGVlZCxhc3QyNTAwLWxwYy1jdHJs4oCdOw0KICAgID4+Pj4+IOKAgyBy
ZWcgPSA8MHgwIDB4ODA+Ow0KICAgID4+Pj4+IOKAgyBjbG9ja3MgPSA8JnN5c2NvbiBBU1BFRURf
Q0xLX0dBVEVfTENMSz47DQogICAgPj4+Pj4gc3RhdHVzID0g4oCcb2theeKAnTsNCiAgICA+Pj4+
PiB9Ow0KICAgID4+Pj4+DQogICAgPj4+Pj4gSG93ZXZlciwgSeKAmW0gbm90IHN1cmUgd2hpY2gg
aXMgYmV0dGVyIGZvciBMUENfQ0xDSyBzZXR0aW5nLg0KICAgID4+Pj4+IFdoZXRoZXIgd2Ugc2hv
dWxkIG1vZGlmeSBkcml2ZXIgaWYgb3JpZ2luYWwgZGF0YSBpcyBlbmFibGVkIG9yIHNob3VsZA0K
ICAgID4+Pj4+IGVuYWJsZSBvbiB0aGUgZGV2aWNlIHRyZWUsIGNvcnJlY3Q/DQogICAgPj4+Pj4N
CiAgICA+Pj4+Pg0KICAgID4+Pj4NCiAgICA+Pj4+IEhpIFNhbXVlbCwNCiAgICA+Pj4+DQogICAg
Pj4+PiBZZXMsIHlvdSBhcmUgcmlnaHQuIEkgcmVhbGl6ZWQgdGhhdCBrY3NfYm1jX2FzcGVlZC5j
IGRvZXNuJ3QgaGF2ZSBhbnkNCiAgICA+Pj4+IGNsb2NrIGNvbnRyb2wgY29kZSBzbyBhZGRpbmcg
YSBjbG9ja3Mgc2V0dGluZyBpbnRvIGtjcyBkdHNpIGNvZGUgZG9lc24ndA0KICAgID4+Pj4gbWFr
ZSBhbnkgaGVscC4gQWxzbywgaXQgd2FzIHRoZSByZWFzb24gd2h5IHRoZSBjaGFuZ2UgaXMgbmVl
ZGVkIG9uDQogICAgPj4+PiBjbGstYXNwZWVkLmMuIEVuYWJsaW5nIGxwY19jdHJsIG5vZGUgeW91
IHN1Z2dlc3RlZCBzZWVtcyBhIHJpZ2h0IHdheS4NCiAgICA+Pj4+DQogICAgPj4+PiBIaSBWaWph
eSwNCiAgICA+Pj4+IENhbiB5b3UgcGxlYXNlIHRyeSB0aGUgd2F5IFNhbXVlbCBzdWdnZXN0ZWQg
YWZ0ZXIgcmVtb3ZpbmcgY2hhbmdlcyBJDQogICAgPj4+PiBnYXZlIHlvdS4gU2FtdWVsJ3Mgc29s
dXRpb24gbG9va3MgZ29vZCB0byBtZS4NCiAgICA+Pj4+DQogICAgPj4+PiBUaGFua3MsDQogICAg
Pj4+PiBKYWUNCiAgICA+Pj4+DQogICAgPj4+PiBKYWUsDQogICAgPj4+PiBJIGNhbiB0cnkuIFdl
IGNhbiBjZXJ0YWlubHkgZW5hYmxlIGxwY19jdHJsIG5vZGUgYnV0IGluIG15IA0KICAgID4+Pj4g
dW5kZXJzdGFuZGluZyB0aGF0DQogICAgPj4+PiB3ZSBzdGlsbCBuZWVkIHRoaXMgYmVsb3cgcGF0
Y2ggdG8gcmVkZWZpbmUgQVNQRUVEX0NMS19HQVRFX0xDTEsgdmFsdWUgdG8NCiAgICA+Pj4+IGFk
ZCBDUklUSUNBTC4gSSBtaWdodCBiZSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlLg0KICAgID4+Pj4g
LSBbQVNQRUVEX0NMS19HQVRFX0xDTEtdID0geyA4LCA1LCAibGNsay1nYXRlIiwgTlVMTCwgMCB9
LCAvKiBMUEMgKi8NCiAgICA+Pj4+ICsgW0FTUEVFRF9DTEtfR0FURV9MQ0xLXSA9IHsgOCwgNSwg
ImxjbGstZ2F0ZSIsIE5VTEwsIA0KICAgID4+Pj4gQ0xLX0lTX0NSSVRJQ0FMIH0sIC8qIExQQyAq
Lw0KICAgID4+Pj4NCiAgICA+Pj4NCiAgICA+Pj4gVmlqYXksDQogICAgPj4+DQogICAgPj4+IEkg
Y2hlY2tlZCB0aGF0IGxwY19jdHJsIG1vZHVsZSBoYXMgY2xvY2tzIGR0IHByb3BlcnR5IGhhbmRs
aW5nIGNvZGUgaW4NCiAgICA+Pj4gdGhlIG1vZHVsZSBzbyBJIHRoaW5rIHRoZSBMQ0xLIHdvdWxk
IGJlIGVuYWJsZWQgd2l0aG91dCB0aGUgY2xrLWFzcGVlZC5jDQogICAgPj4+IGZpeC4gSSBjYW4n
dCB0ZXN0IGl0IG5vdyBiZWNhdXNlIEknbSBpbiBhIGJ1c2luZXNzIHRyaXAgc28gcGxlYXNlIHRl
c3QNCiAgICA+Pj4gaXQuIEknbGwgYWxzbyBjaGVjayBpdCB3aGVuIEkgYmFjayB0byBvZmZpY2Ug
YSB3ZWVrIGFmdGVyLg0KICAgID4+Pg0KICAgID4+PiBUaGFua3MsDQogICAgPj4+IEphZQ0KICAg
ID4+Pg0KICAgID4+PiBKYWUsDQogICAgPj4+IEkgcmVtb3ZlZCBhYm92ZSBhc3BlZWQgY2xvY2sg
ZHJpdmVyIHBhdGNoLCBhbmQgZW5hYmxlZCBscGMtY3RybCBub2RlIA0KICAgID4+PiBpbiBkdHMg
YWxzbyByZW1vdmVkIGNsb2NrIGRlZmluaXRpb24gZnJvbSBrY3MuIEFuZCBJIGRvbid0IHNlZSBo
b3N0IA0KICAgID4+PiBpcyBnZXR0aW5nIHBvd2VyZWQgb24uIEl0IHdvcmtzIG9ubHkgd2l0aCBj
bG9jayBkcml2ZXIgY2hhbmdlLg0KICAgID4+Pg0KICAgID4+PiBBbmQgSSBzdGlsbCBkaWRuJ3Qg
dW5kZXJzdGFuZCBob3cgZW5hYmxpbmcgbHBjLWN0cmwgbm9kZSB3aWxsIA0KICAgID4+PiBpbml0
aWFsaXplIEFTUEVFRF9DTEtfR0FURV9MQ0xLIHRvIENSSVRJQ0FMLg0KICAgID4+Pg0KICAgID4+
PiAtVmlqYXkNCiAgICA+Pj4NCiAgICA+Pg0KICAgID4+IFZpamF5LA0KICAgID4+DQogICAgPj4g
VGhhbmtzIFZpamF5IGZvciBzaGFyaW5nIHRoZSB0ZXN0IHJlc3VsdC4gSSdsbCBhbHNvIGNoZWNr
IGl0IG9uIG15DQogICAgPj4gaGFyZHdhcmUgd2hlbiBJIGdldCBiYWNrIHRvIG9mZmljZS4gV2ls
bCBzaGFyZSBteSB0ZXN0IHJlc3VsdCB0b28uDQogICAgPj4NCiAgICA+PiBUaGFua3MgYWdhaW4s
DQogICAgPj4gSmFlDQogICAgDQoNCg==
