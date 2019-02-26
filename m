Return-Path: <prvs=79604a4035=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=79604a4035=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="qpYaEdbO"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="kZtUALob"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 448FQT5C35zDqJK
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 10:29:32 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x1QNStAQ021281;
 Tue, 26 Feb 2019 15:29:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=d2iaGoFaa4Y/7PiL9U09XRVCU1RDZahEElsy5L3PLeQ=;
 b=qpYaEdbO4gulG8MpV9mtKMn4Omy6H7Gt4jtNFO9HwylHJhG2NKCCDxkvns/DybxkcqkR
 o44ypsMZxXTWLjQ7syjZAUhQbLSJ5/X2q+O7AgobVytTtGlX+9iARdKLFFDLOLRRoYT6
 /9lBlGYtQKDLNj9QvCgNMdKUhkkJUDLrQWI= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2qwdakgcyn-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 26 Feb 2019 15:29:25 -0800
Received: from prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 26 Feb 2019 15:29:04 -0800
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 26 Feb 2019 15:29:03 -0800
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 26 Feb 2019 15:29:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2iaGoFaa4Y/7PiL9U09XRVCU1RDZahEElsy5L3PLeQ=;
 b=kZtUALob+B0iV4LcbRYau2x3Wv2BbvyDxWn1GbQD1bMQZZqoLut6M3mSYIQkzxc7F5OKbLKNpTcb/AqokpTFx49ogN2a9O6e38I6UxqbSzu5cghldnFbSr52rb+KTlkznujvw33DQOjUC7mpOaoZenqIgEUZrwWjzzPOt2ozfKM=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1303.namprd15.prod.outlook.com (10.172.178.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.15; Tue, 26 Feb 2019 23:29:02 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::c47c:32d3:4b03:adea]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::c47c:32d3:4b03:adea%3]) with mapi id 15.20.1643.019; Tue, 26 Feb 2019
 23:29:02 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>, Emily Shaffer
 <emilyshaffer@google.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Max IPMI buffer size
Thread-Topic: Max IPMI buffer size
Thread-Index: AQHUywupCNIn1P6nokCPZmCoJAC6dKXxU8GAgAERowD//9SAAA==
Date: Tue, 26 Feb 2019 23:29:01 +0000
Message-ID: <1CF1EB8B-62B8-4C69-BADE-4B0DE487E9BD@fb.com>
References: <E7B0409E-1C26-4A80-98CC-73987DCD0C6A@fb.com>
 <CAJoAoZnKrtDtaH91hn7OPtaBnmQiGR1GP32D+PAqdwaRaHpmYQ@mail.gmail.com>
 <20190226180440.GD44612@mauery.jf.intel.com>
In-Reply-To: <20190226180440.GD44612@mauery.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:f7fe]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0df00e2f-a15f-4706-798f-08d69c4230d7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1303; 
x-ms-traffictypediagnostic: CY4PR15MB1303:
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1303;
 20:R1bhhpwJHBQGlqRDp0CkwyLlR5uScsbguz9DFxZ+ISvoEx0By1qzcIfTptRKpifKNSaC3Op9N2Tfa6Rll6F9FpW9rPc8NOV5l2ZGhgDMhzyhmIMdNuw2b6WxhM4mBQIRC6Xaxc1SIGjg31j4vA4acRxO9JVUJn3kfPZiut2h2u4=
x-microsoft-antispam-prvs: <CY4PR15MB1303FBAE47615797AEC962D7DD7B0@CY4PR15MB1303.namprd15.prod.outlook.com>
x-forefront-prvs: 096029FF66
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(376002)(39860400002)(366004)(396003)(346002)(136003)(189003)(199004)(33656002)(106356001)(6246003)(305945005)(7736002)(81166006)(81156014)(2906002)(8676002)(82746002)(105586002)(97736004)(86362001)(36756003)(3480700005)(4744005)(6486002)(6116002)(53546011)(229853002)(6436002)(53936002)(6512007)(99286004)(446003)(76176011)(83716004)(71200400001)(14454004)(46003)(486006)(6506007)(6346003)(186003)(316002)(110136005)(71190400001)(102836004)(5660300002)(256004)(2616005)(476003)(8936002)(11346002)(68736007)(4326008)(478600001)(25786009)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1303;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qMLjBdznRPnJSUBLsRXWFJAOxKfxx8BdIBTClcv7oQF7ITXEKSbBAzrp73SOVkJc5HZAHjXUfoisBgAottAfby0d+814hzMm6g8iLLLMmgdXeWNFcVV2NxalCuBZ5feU4XSVIpoB580aaxlqCaX1e0cCQtH1utVIIGj+yBMdHQkvSys7ljBCGY+HX40pESxXdxww5b6ubEj16S+m9LItpPBnzQgUQ14U4l1F3dRIsCaECeIQJjL3GARjzWEXJ819U88zDKq7gs5glcz/m2/1st7F5gEbUK9KvARkC15WGqWSM91VRAU2tkmICiNUrchEPx4xQAUA3sGQ0CDWZiDWIce8d7YO1V9p4LXfaIgufhh3uiFY1ZwfrBlMu9r32npvxbV5B7GGcyGQzoDw+CU/Lk/DAhvcmt02T9dtPzposuk=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92CD39E66BDA7D40854691397325BAE6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df00e2f-a15f-4706-798f-08d69c4230d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2019 23:29:01.8634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1303
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-26_13:, , signatures=0
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
X-List-Received-Date: Tue, 26 Feb 2019 23:29:38 -0000

DQoNCu+7v09uIDIvMjYvMTksIDEwOjA1IEFNLCAiVmVybm9uIE1hdWVyeSIgPHZlcm5vbi5tYXVl
cnlAbGludXguaW50ZWwuY29tPiB3cm90ZToNCg0KICAgIE9uIDI1LUZlYi0yMDE5IDA1OjQ1IFBN
LCBFbWlseSBTaGFmZmVyIHdyb3RlOg0KICAgID5QZXJzb25hbGx5IEknZCBsaWtlIHRvIHNlZSB0
aGlzIGltcGxlbWVudGVkIGFzIHNvbWV0aGluZyB3ZSBjYW4gY29uZmlndXJlDQogICAgPmF0IGNv
bXBpbGUgdGltZSwgd2hhdCBkbyBvdGhlcnMgdGhpbms/DQogICAgDQogICAgTXkgZ29hbCB3YXMg
dG8gYmUgYWJsZSB0byBzZXQgdGhpcyBpbiB0aGUgDQogICAgL3Vzci9zaGFyZS9pcG1pLXByb3Zp
ZGVyL2NoYW5uZWxfY29uZmlnLmpzb24gZmlsZS4gRWFjaCBjaGFubmVsIGNhbiANCiAgICBzcGVj
aWZ5IGl0cyBtYXggdHJhbnNmZXIgc2l6ZS4gVGhlbiwgdGhlcmUgaXMgYSBsaWJjaGFubmVsbGF5
ZXIgQVBJIHRoYXQgDQogICAgY2FuIHByb3ZpZGUgdGhhdCB2YWx1ZSB0byBhbnlvbmUgdGhhdCBj
YXJlcy4NCkkgYWdyZWUuDQogICAgDQogICAgLS1WZXJub24NCiAgICANCiAgICA+T24gRnJpLCBG
ZWIgMjIsIDIwMTkgYXQgNDowNyBQTSBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4g
d3JvdGU6DQogICAgPg0KICAgID4+IFRlYW0sDQogICAgPj4NCiAgICA+PiBJIHNlZSBkZWZpbml0
aW9uIG9mIE1BWF9JUE1JX0JVRkZFUiBpcyA2NCBpbiBwaG9zcGhvci1pcG1pLWhvc3QvaXBtaWQu
aHBwLg0KICAgID4+IEFuZCB0aGVyZSBpcyBhIGNvbW1lbnQgdGhhdCBCVCBGSUZPIGluIEFTVDI0
MDAgY2FuIGhhbmRsZSBvbmx5IDY0IGJ5dGVzLiBXZQ0KICAgID4+IGFyZSB1c2luZyBBU1QyNTAw
IGFuZCBmb3Igb3VyIElQTUIgT0VNIGNvbW1hbmQsIHdlIG5lZWQgYnVmZmVyIG1heCBzaXplIHRv
DQogICAgPj4gYmUgMjU2LiBQbGVhc2Ugc3VnZ2VzdCBob3cgdG8gYWJvdXQgY2hhbmdlcy4NCiAg
ICA+Pg0KICAgID4+DQogICAgPj4NCiAgICA+PiBSZWdhcmRzDQogICAgPj4NCiAgICA+PiAtVmlq
YXkNCiAgICA+Pg0KICAgIA0KDQo=
