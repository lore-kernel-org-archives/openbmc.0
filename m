Return-Path: <prvs=07433930b3=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=07433930b3=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="bOYNLlxf"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="fpkdGrMp"; dkim-atps=neutral
X-Greylist: delayed 818 seconds by postgrey-1.36 at bilbo;
 Tue, 24 Jul 2018 10:27:49 AEST
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41ZK2F4sxLzDqk8
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jul 2018 10:27:48 +1000 (AEST)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6O0BduB016121; Mon, 23 Jul 2018 17:14:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=QnXfD4V5MlwtGOHHjZgh5V01vzRsJXn2iUR8R0ZR1qs=;
 b=bOYNLlxfmMJVVeZ+6WGO+AGz+ul8dT0YGPWsXlF6z5DkEcS0+p71BZ/Nlj4Iv66J1pAh
 EeeV4KQ7eKz4UgdR++ahi3f3iXdq6hyYV6GyxY9xq2OeIdf3ZBZYj2cDtJyG6Hawz319
 B07wOb1GoFteTRniTKxS7TB55mkLeec2g4M= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0b-00082601.pphosted.com with ESMTP id 2kdrra02n5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 23 Jul 2018 17:14:02 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.33) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Mon, 23 Jul 2018 20:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnXfD4V5MlwtGOHHjZgh5V01vzRsJXn2iUR8R0ZR1qs=;
 b=fpkdGrMpAQE6WS5fspuKnJ//g7JqfqRX2qPuGwMMJ7XNAixHo5ydlRnWP2hRcvgXf3mJH6aTnbtRoQRV80tqBJi9X5JQzKWO+uHspL47q4upLGWwKVP2KXDSplgVl8WBX1x4JSzEcxtyz37zKruWjs9mQc50LtBDnQ38qL0l0qc=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1934.namprd15.prod.outlook.com (10.174.100.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.973.16; Tue, 24 Jul 2018 00:13:59 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::2d74:d020:c226:979f]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::2d74:d020:c226:979f%5]) with mapi id 15.20.0973.022; Tue, 24 Jul 2018
 00:13:59 +0000
From: Sai Dasari <sdasari@fb.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>, Patrick Venture
 <venture@google.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: In-Band Firmware Update
Thread-Topic: In-Band Firmware Update
Thread-Index: AQHUIrEiBoo9uTdoPUKX95w0ctbvh6SdYNGA//+q4gA=
Date: Tue, 24 Jul 2018 00:13:59 +0000
Message-ID: <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
References: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
 <20180723221837.GI105329@mauery>
In-Reply-To: <20180723221837.GI105329@mauery>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:8403]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1934;
 20:3kFX/4N3lbYUj2p3ov4qd3zaOxlRO/g0D7BmOIIg0RY6/ZoJwTDwDWAykfX4VrbG25ynyKUUiD4SlAMM+4BelhnWWgjjtS5WCMtqDAPkDiG6vE/QBHSGt7nZYlzxoVgkhYHEQgPCeWf0UgZkhXUrsPLN9SDR/FPooL6LiVR9Rcc=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 892f66ad-4511-44bf-a244-08d5f0fa5a7e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989117)(5600073)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1934; 
x-ms-traffictypediagnostic: MWHPR15MB1934:
x-microsoft-antispam-prvs: <MWHPR15MB1934C1B7ECBA85E01EDE196ACE550@MWHPR15MB1934.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(65623756079841)(228905959029699);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231311)(11241501184)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(6072148)(201708071742011)(7699016);
 SRVR:MWHPR15MB1934; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1934; 
x-forefront-prvs: 0743E8D0A6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(256004)(2906002)(6246003)(6512007)(68736007)(3480700004)(2616005)(6306002)(5250100002)(14444005)(97736004)(478600001)(966005)(2900100001)(105586002)(102836004)(14454004)(53546011)(106356001)(53936002)(6506007)(36756003)(476003)(11346002)(446003)(15650500001)(186003)(4326008)(25786009)(5660300001)(316002)(33656002)(6116002)(81156014)(81166006)(6486002)(76176011)(8676002)(305945005)(229853002)(6436002)(82746002)(8936002)(110136005)(7736002)(99286004)(83716003)(86362001)(486006)(46003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1934;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: w6St1TqtPQ5aXH2KQKkXk7LW82WcQ+hCeD4SkPThHt1iiOZtzLdMk/0c/GTRriuhwLJMtbAvf6DqA4iwDAgONnehJY47VRgTyMHhoDxIuyrhUQYufbmzZTwA5JaevBHg9kJ/ejyz47jD7nFwk/R6KXN76WXmKI7vv7yiV9SieijtVwHko1GrLNsPDHMSsqypHpo3tBQTtZt6tKSse5TFT8MRzw298CscCpNdoTCnyPSU6LPBYaR+a9ZWfFjUSAglN/2HKLLuC3CS364tFrXfvnZevxqkcCrGPS+v5rjUNOSyCwjtCRN9ZI68zyMpwlNM4CftkMat9ut4eqL1Ou9zEuKAgAqUB7FizO9qO27UwZI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <A734D250A4A9284CB289F5BEA75D62FB@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 892f66ad-4511-44bf-a244-08d5f0fa5a7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2018 00:13:59.1160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1934
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-23_07:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jul 2018 00:27:51 -0000

DQoNCu+7v09uIDcvMjMvMTgsIDM6MTkgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBWZXJub24g
TWF1ZXJ5IiA8b3BlbmJtYy1ib3VuY2VzK3NkYXNhcmk9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcg
b24gYmVoYWxmIG9mIHZlcm5vbi5tYXVlcnlAbGludXguaW50ZWwuY29tPiB3cm90ZToNCg0KICAg
IE9uIDIzLUp1bC0yMDE4IDExOjEzIEFNLCBQYXRyaWNrIFZlbnR1cmUgd3JvdGU6DQogICAgPkkn
dmUgc3RhcnRlZCB0byBpbXBsZW1lbnQgdGhlIGhvc3QtdG9vbCBvdXRzaWRlIG9mIGdvb2dsZTMs
IGFuZA0KICAgID5zdGFydGVkIHNwbGl0dGluZyB1cCB0aGUgT0VNIGhhbmRsZXIgdGhhdCBjb3Jy
ZXNwb25kcyB3aXRoIGl0Lg0KICAgID5Ib3dldmVyLCBmaXJzdGx5LCBJJ3ZlIHN1Ym1pdHRlZCB0
aGUgZGVzaWduIGZvciB0aGUgcHJvdG9jb2wgZm9yDQogICAgPnJldmlldywgcGxlYXNlIGxldCBt
ZSBrbm93IGlmIHlvdSdyZSBpbnRlcmVzdGVkIGFuZCBJJ2xsIGFkZCB5b3UgdG8NCiAgICA+dGhl
IHJldmlldy4gIElJUkMsIHRoZXJlIHdhcyBhdCBsZWFzdCBvbmUgaW50ZXJlc3RlZCBwYXJ0eSBv
dXRzaWRlIG9mDQogICAgPnVzLg0KICAgIA0KICAgIEkgYW0gaW50ZXJlc3RlZCBpbiBjb21pbmcg
dXAgd2l0aCBhIGNvbW1vbiAoT3BlbkJNQyBPRU0gbGV2ZWwpIHNldCBvZiANCiAgICBGaXJtd2Fy
ZSBOZXRGbiBjb21tYW5kcyB0aGF0IHdpbGwgYWxsb3cgYWxsIHVzZXJzIG9mIE9wZW5CTUMgdG8g
YmUgYWJsZSANCiAgICB0byB1c2UgY29tbW9uLCBvcGVuLXNvdXJjZSB1dGlsaXRpZXMgdG8gZG8g
ZmlybXdhcmUgdXBkYXRlcy4gSWYgdGhleSBhcmUgDQogICAgSVBNSSBjb21tYW5kcywgdGhpcyB3
b3VsZCBpbmNsdWRlIGluLWJhbmQgKHdpdGggS0NTL0JUIGZvciANCiAgICBjb21tYW5kL2NvbnRy
b2wgYW5kIFVTQiBmb3IgdHJhbnNmZXIpIG9yIG91dC1vZi1iYW5kIChvdmVyIFJNQ1ArKS4NCiAg
ICANCiAgICBSYXRoZXIgdGhhbiB1c2UgdGhlIE9FTSBOZXRGbiwgZm9yIGZpcm13YXJlIHVwZGF0
ZXMsIHdlIHNob3VsZCBiZSB1c2luZyANCiAgICB0aGUgRmlybXdhcmUgTmV0Rm4uICBUaGUgZW50
aXJlIEZpcm13YXJlIE5ldEZuIGlzIGNvbnNpZGVyZWQgdG8gYmUgT0VNIA0KICAgIHBlciB0aGUg
SVBNSSBzcGVjLiBJIHdvdWxkIHByb3Bvc2UgdGhhdCB3ZSBzaW1wbHkgcHJvdmlkZSBhIGNvbW1v
biANCiAgICBpbXBsZW1lbnRhdGlvbiBmb3IgT3BlbkJNQyAoYXMgYSBwcm92aWRlciBsaWJyYXJ5
LCBvZiBjb3Vyc2UsIHNvIGl0IA0KICAgIGNvdWxkIGJlIHJlcGxhY2VkIGlmIGEgZG93bnN0cmVh
bSBPRU0gZG9lc24ndCB3YW50IGl0KS4NCkFueSB0aG91Z2h0cyBvbiByZXVzaW5nL2xldmVyYWdp
bmcgdGhlIFBJQ01HJ3MgaHBtIHNwZWMgQCBodHRwczovL3d3dy5waWNtZy5vcmcvb3BlbnN0YW5k
YXJkcy9oYXJkd2FyZS1wbGF0Zm9ybS1tYW5hZ2VtZW50LyAuIA0KT25lIG9mIHRoZSBiZW5lZml0
IHdvdWxkIGJlIHRoZSBzdGFuZGFyZCAnaXBtaXRvb2wnIGhhcyBuYXRpdmUgc3VwcG9ydCBmb3Ig
dGhlIHVwZGF0ZSBhbmQgY2hhbmdlcyBhcmUgbGltaXRlZCB0byBCTUMgZi93LiANCk9uIGEgZG93
bnNpZGUsIHRoZSBmaXJtd2FyZSBiaW5hcnkgaGFzIHRvIGJlIHJlcGFja2FnZWQgYXMgLmhwbSBm
b3JtYXQgZm9yIHRoaXMgcHJvdG9jb2wgdG8gZG8gc29tZSBwcmVwYXJhdGlvbiBzdGVwcyBhcyBp
dCBzdXBwb3J0IG11bHRpcGxlIGYvdyBjb21wb25lbnRzIGluIGEgc2luZ2xlIHBhY2thZ2UuIA0K
ICAgIA0KICAgIC0tVmVybm9uDQogICAgDQoNCg==
