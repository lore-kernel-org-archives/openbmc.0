Return-Path: <prvs=48502dcd3d=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=48502dcd3d=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="mqR+JKjO"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="LRuZZ6sZ"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42r4P04vcyzF1pY
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 11:47:00 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wA80gXkA001864
 for <openbmc@lists.ozlabs.org>; Wed, 7 Nov 2018 16:46:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=K6JTV6udpdAFdtBbNYsXJEeMppApYrEJeNa+MZK9zBY=;
 b=mqR+JKjOD2MYQ8Ek066RC3mdobUVZC4ofe2KfRDuu+Uoi1zoQvnhow6p6mPjt30EfaFb
 A2erOq7FbPkCUgCRRESwFmskAJpZj2/aPhea9moyHSJSCbKx/epDWpvkuK8I3s76vSCb
 qOwVcUFUtZ6UiNSR7fSYV+qLme4+eHrOO3Q= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2nm85p8pap-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Nov 2018 16:46:58 -0800
Received: from frc-hub03.TheFacebook.com (2620:10d:c021:18::173) by
 frc-hub03.TheFacebook.com (2620:10d:c021:18::173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 7 Nov 2018 16:46:42 -0800
Received: from FRC-CHUB03.TheFacebook.com (2620:10d:c021:18::22) by
 frc-hub03.TheFacebook.com (2620:10d:c021:18::173) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Wed, 7 Nov 2018 16:46:42 -0800
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.23) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Wed, 7 Nov 2018 19:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6JTV6udpdAFdtBbNYsXJEeMppApYrEJeNa+MZK9zBY=;
 b=LRuZZ6sZlA112zksxc2T3Ho3jOEfuvcxBJyMO6/cABpBrrrD5RL+7v8tLH0HBshFRwDccVz1TXBbcscOiw26afAC4XH4QKyYNtGi89nrH88EC+yC5zwQfnBMd3Ex93EpeaqoJ/Foul8wZbf8iCCQWTw+FZ9Hc3jQkf37mGLmdPY=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1168.namprd15.prod.outlook.com (10.175.2.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.28; Thu, 8 Nov 2018 00:46:34 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::709f:e3cd:1db:74d6]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::709f:e3cd:1db:74d6%2]) with mapi id 15.20.1294.034; Thu, 8 Nov 2018
 00:46:34 +0000
From: Tao Ren <taoren@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add Facebook Backpack-CMM BMC
Thread-Topic: [PATCH v2 2/2] ARM: dts: aspeed: Add Facebook Backpack-CMM BMC
Thread-Index: AQHUdYk/xKQ/YGYkrUyew8XW7UhPVaVFB6UAgAAGRAA=
Date: Thu, 8 Nov 2018 00:46:34 +0000
Message-ID: <01a78e33-79d6-28bd-9b6e-346968c32d37@fb.com>
References: <20181106042842.2771782-1-taoren@fb.com>
 <1541636646.1469369.1569439336.00B37737@webmail.messagingengine.com>
In-Reply-To: <1541636646.1469369.1569439336.00B37737@webmail.messagingengine.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR19CA0088.namprd19.prod.outlook.com
 (2603:10b6:320:1f::26) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::6:85f]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1168;
 20:oJbtXPebSwQBTz/TIaeYUcuQcDgaiFRznW7IG/o3AL5ZF/zYww5+MqwlyPRRvyZgyyA+PZe1Ca5Wgt56eLXfh8Ew/SYdUErA/Z0N7YB1TCCkKW+0mCTjHEL5n1aA/eOR0D1YtZ8HPdal44MjTavcL6TPZXSyZYZAJj0JI2QKRT4=
x-ms-office365-filtering-correlation-id: da97bb94-9155-4b80-c21c-08d64513a1a3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1168; 
x-ms-traffictypediagnostic: MWHPR15MB1168:
x-microsoft-antispam-prvs: <MWHPR15MB1168FC4FEB396B258784483BB2C50@MWHPR15MB1168.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(81227570615382);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231382)(11241501184)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1168; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1168; 
x-forefront-prvs: 0850800A29
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(396003)(376002)(136003)(39860400002)(47680400002)(199004)(189003)(36756003)(256004)(476003)(486006)(11346002)(2616005)(446003)(76176011)(316002)(186003)(58126008)(53546011)(386003)(102836004)(6506007)(478600001)(52116002)(46003)(6916009)(2906002)(86362001)(229853002)(99286004)(25786009)(2501003)(7736002)(305945005)(8936002)(53936002)(6436002)(5640700003)(6512007)(71200400001)(71190400001)(6486002)(6246003)(345774005)(31696002)(8676002)(65826007)(81156014)(31686004)(5660300001)(81166006)(64126003)(105586002)(6116002)(65956001)(14454004)(65806001)(2900100001)(97736004)(2351001)(68736007)(106356001)(1730700003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1168;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: lXcKJgs7T9p/RYuWYg6hYXs7UXYfWVZXyEvceErei8ignezCn+qdYL896NDpJxYNtHPYbKmdW2BhkPNTNP6rl8omClXMg4NjWEQZ7wsf1G8kxZrviK1UTAoT8XhB83fsGOzlA27BZtW2CMukISNKXwPEyj8eUvZlytgA+7qNFxxpWdC/EOEvP67XW0cL7RVtQho2MZeNcUk1i4P4BIkzrG439wEJfCBEDOP162KyOJzAh/6LQ+ywuUfbA6xJRsWB6F/JX7tNkkOH1gY+kCZi/1huRcIhqC3aum38EXvwy1BdZI1/eBiBhYL/aLcliTg8mxfTyRV1W3JzCa0OkstfMwIWx95S52yBlMPYyBF1Yqg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D2B49880A3B30419A7E06A7B09B239A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: da97bb94-9155-4b80-c21c-08d64513a1a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2018 00:46:34.2906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1168
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
X-List-Received-Date: Thu, 08 Nov 2018 00:47:01 -0000

T24gMTEvNy8xOCA0OjI0IFBNLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToNCg0KPj4gKyZ1YXJ0MSB7
DQo+PiArCXN0YXR1cyA9ICJva2F5IjsNCj4+ICt9Ow0KPj4gKw0KPj4gKyZ1YXJ0MyB7DQo+PiAr
CXN0YXR1cyA9ICJva2F5IjsNCj4+ICt9Ow0KPj4gKw0KPj4gKyZ1YXJ0NCB7DQo+PiArCXN0YXR1
cyA9ICJva2F5IjsNCj4+ICt9Ow0KPiANCj4gVUFSVHMgMS00IHNob3VsZCBiZSBleHBsaWNpdGx5
IHBpbm11eGVkLiBJdCdzIGEgYml0IGZpZGRseSBhcyBlYWNoIG9mIHRoZSBVQVJUIGxpbmVzIGhh
cyBpdHMgb3duIG11eCBjb25maWd1cmF0aW9uLCBidXQgaXQgYXQgbGVhc3QgYWxsb3dzIHNvbWUg
ZmxleGliaWxpdHkgKGkuZS4gd2hldGhlciB5b3UganVzdCB3YW50IFJ4L1R4LCBvciBzb21ldGhp
bmcgbW9yZSkuIFNlZSBlLmcuIHRoZSB1YXJ0MSBub2RlIGluIGFyY2gvYXJtL2Jvb3QvZHRzL2Fz
cGVlZC1ibWMtb3BwLXJvbXVsdXMuZHRzLg0KDQpUaGFuayB5b3UgZm9yIHBvaW50aW5nIGl0IG91
dCBhbmQgSSB3aWxsIGZpeCBpdC4NCg0KPiBTcGVha2luZyBvZiBwaW5jdHJsLCBhcyBpdCdzIGFu
IEFTVDI1MDAgc3lzdGVtIHlvdSdsbCBwcm9iYWJseSB3YW50IHRvIGFkZCB0aGUgZm9sbG93aW5n
IHRvIGVuc3VyZSB5b3UgaGF2ZSBmdWxsIGNvbnRyb2wgb2YgdGhlIHBpbm11eCBjb25maWd1cmF0
aW9uOg0KPiANCj4gJnBpbmN0cmwgew0KPiAJYXNwZWVkLGV4dGVybmFsLW5vZGVzID0gPCZnZngg
JmxoYz47DQo+IH07DQo+IA0KPj4gKw0KPj4gKyZ1YXJ0NSB7DQo+PiArCXN0YXR1cyA9ICJva2F5
IjsNCj4+ICt9Ow0KPiANCj4gVUFSVDUgaGFzIGZpeGVkIHBpbnMsIHNvIG5vIHBpbmN0cmwgbmVj
ZXNzYXJ5IGhlcmUuDQoNCkdvdCBpdC4gVGhhbmsgeW91Lg0KDQoNCj4gWW91IHNhaWQgdGhpcyBp
biB0aGUgY29tbWl0IG1lc3NhZ2U6DQo+IA0KPj4gTm90ZTogSTJDIGRldmljZXMgb24gQmFja3Bh
Y2sgTGluZSBDYXJkcyBhbmQgRmFicmljIENhcmRzIGFyZSBub3QNCj4+IGxpc3RlZCBpbiB0aGUg
ZGV2aWNlIHRyZWUgZmlsZSBiZWNhdXNlIExpbmUvRmFicmljIENhcmRzIG1heSBiZQ0KPj4gdW5w
bHVnZ2VkLg0KPiANCj4gSXQncyBub3QgY2xlYXIgdG8gbWUgd2hhdCB0aGlzIGFjdHVhbGx5IG1l
YW5zLCBhbmQgSSdtIHRyeWluZyB0byByZWNvbmNpbGUgaXQgd2l0aCBlbmFibGluZyBhbGwgb2Yg
dGhlIGkyYyBidXNlcyBhcyBJJ20gY3VyaW91cyBhcyB0byB3aGV0aGVyIHRoYXQncyBuZWNlc3Nh
cnkuDQoNClNvcnJ5IGZvciB0aGUgY29uZnVzaW9uLiBJbiBnZW5lcmFsLCBhbGwgdGhlIGkyYyBi
dXNlcyBhcmUgaW5pdGlhbGl6ZWQgaW4gZGV2aWNlIHRyZWUsIGJ1dCBpMmMgbGVhZiBkZXZpY2Vz
IGFyZSBjcmVhdGVkIGZyb20gdXNlciBzcGFjZSBiZWNhdXNlIHRoZXNlIGkyYyBkZXZpY2VzIG1h
eSBiZSB1bnBsdWdnZWQgYXQgYm9vdCB0aW1lICh3aGljaCBjYXVzZXMgZHJpdmVyX3Byb2JlIGZh
aWx1cmVzKS4gTGV0IG1lIHJlZmluZSB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIHdpbGwgc2VuZCBv
dXQgdXBkYXRlZCBwYXRjaCBzb29uLg0KDQpUaGFua3MsDQpUYW8gUmVuDQo=
