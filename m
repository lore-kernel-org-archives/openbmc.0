Return-Path: <prvs=48502dcd3d=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=48502dcd3d=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="GZ/o1Fhc"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Q4v+ktuu"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42r3ms0tJkzF3H1;
 Thu,  8 Nov 2018 11:19:04 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wA800TG2019362; Wed, 7 Nov 2018 16:18:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=DH23OvQOm/iKilHTiPR5sPCXMu4hFXN2UnPcW/AGkeI=;
 b=GZ/o1FhcEdP5pGseU3VaHmFAdWwhx9OpKqbv0Cf9ltwm+WMXJnHC4Lky2lHP0rpKBe3L
 WqYqjCQZEftoEWn2MQkVRPE08+arvmLRtRnw3mftFu95XdmdgeFLapD0YpKwOr8Jq7bL
 26iQ7NEpzfsRHgjyt/W4x/umzSdPP6zHfSs= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2nm9b68d64-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 07 Nov 2018 16:18:37 -0800
Received: from frc-hub05.TheFacebook.com (2620:10d:c021:18::175) by
 frc-hub05.TheFacebook.com (2620:10d:c021:18::175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 7 Nov 2018 16:18:31 -0800
Received: from FRC-CHUB11.TheFacebook.com (2620:10d:c021:18::30) by
 frc-hub05.TheFacebook.com (2620:10d:c021:18::175) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Wed, 7 Nov 2018 16:18:31 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.31) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Wed, 7 Nov 2018 19:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DH23OvQOm/iKilHTiPR5sPCXMu4hFXN2UnPcW/AGkeI=;
 b=Q4v+ktuuX1ldtEf5AaLrQP6Hr7Ts15cn+F+VNYsmmnrdj3A7qx3e6z98dOg8Dqsj7tz6a5gch/ZWH+GeLAOGvZIdsII9nx1LLeSzDRDra1fae+EzBqvQYpiG7a47XFi/sb+Vd56pcb5s1hMtVJMt78t9/tpIpTtfC7eavWU9rMk=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1661.namprd15.prod.outlook.com (10.175.140.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.21; Thu, 8 Nov 2018 00:18:29 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::709f:e3cd:1db:74d6]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::709f:e3cd:1db:74d6%2]) with mapi id 15.20.1294.034; Thu, 8 Nov 2018
 00:18:29 +0000
From: Tao Ren <taoren@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: Add Facebook BMC flash layout
Thread-Topic: [PATCH v2 1/2] ARM: dts: Add Facebook BMC flash layout
Thread-Index: AQHUdYk0ADCaMRjCYU+xz32xcxlND6VFAXgAgAAEiIA=
Date: Thu, 8 Nov 2018 00:18:29 +0000
Message-ID: <c5e56fc4-397f-a38b-6378-99eecce1180b@fb.com>
References: <20181106042829.2771226-1-taoren@fb.com>
 <1541635320.1462459.1569430616.0F5E4C4D@webmail.messagingengine.com>
In-Reply-To: <1541635320.1462459.1569430616.0F5E4C4D@webmail.messagingengine.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR18CA0027.namprd18.prod.outlook.com
 (2603:10b6:320:31::13) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::6:85f]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1661;
 20:JRE5HlumFGfBlZrkjeqKVFExfP5qnzaRoi914ZIy+JyqL4AJc0bsXOn9h4rW+DNkeFimC6K8Va1KvNUEkk73pBYSdYnU1IGcp951UGxUtbp/oiBDKwxhUJboV/RBlfwUwCs6x9YYIzf9PgOF50FK7Ba0bESTkcAoUb8o/SYL740=
x-ms-office365-filtering-correlation-id: 6b001d72-81ea-4e47-e518-08d6450fb51f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1661; 
x-ms-traffictypediagnostic: MWHPR15MB1661:
x-microsoft-antispam-prvs: <MWHPR15MB16615A38AC7A5F00930CEB28B2C50@MWHPR15MB1661.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(81227570615382);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231382)(11241501184)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1661; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1661; 
x-forefront-prvs: 0850800A29
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(366004)(39860400002)(136003)(376002)(47680400002)(189003)(199004)(97736004)(25786009)(14454004)(8936002)(81166006)(81156014)(8676002)(64126003)(2201001)(65956001)(2501003)(478600001)(68736007)(11346002)(486006)(186003)(345774005)(65826007)(31696002)(65806001)(2616005)(476003)(105586002)(446003)(106356001)(53936002)(305945005)(110136005)(2906002)(6246003)(6512007)(86362001)(386003)(102836004)(53546011)(6506007)(6116002)(7736002)(6486002)(58126008)(2900100001)(316002)(99286004)(14444005)(256004)(76176011)(31686004)(229853002)(36756003)(71200400001)(6436002)(71190400001)(46003)(5660300001)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1661;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: dJ0Ps0AopyRRDBLfMd4snhqL/V0m8ha+gTcl4rRxA1mCxWGN95uQvOHsfjWaTTQpumryQbGyEHa2GvzqG+w7Mj7SrvCNGxWSKFd+NaKg3dVH9xwynmRym7zG3dYu9Zcph3KGjf314m41atqi/TUcarqShM8QU47KxvBv8+IDLP4Atg6T3cB+cKv+c1JVsGCty2fKyLO4IfnikA5BED2p+/eZuqccCzpIg5EgWAESYRIBkEVWRrAHnm/FPp1h7m+Y9OoQdYTpsH85b1p/D9mjRySkJyOSCOMbKNct1JscxjEeDlmxzRR7ETOsU2p1X025R7gYYyG/Cmj195x0tO7Sd7F0nW5lxDxrBKW9LP/77SQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA72D04B552D874EB6AA65BC2AB7A6D6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b001d72-81ea-4e47-e518-08d6450fb51f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2018 00:18:29.2596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1661
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
X-List-Received-Date: Thu, 08 Nov 2018 00:19:10 -0000

T24gMTEvNy8xOCA0OjAyIFBNLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToNCj4+ICtwYXJ0aXRpb25z
IHsNCj4+ICsJY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsNCj4+ICsJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQo+PiArCSNzaXplLWNlbGxzID0gPDE+Ow0KPj4gKw0KPj4gKwl1LWJvb3RA
MCB7DQo+PiArCQlyZWcgPSA8MHgwIDB4NjAwMDA+Ow0KPj4gKwkJbGFiZWwgPSAidS1ib290IjsN
Cj4+ICsJfTsNCj4+ICsNCj4+ICsJdS1ib290LWVudkA2MDAwMCB7DQo+PiArCQlyZWcgPSA8MHg2
MDAwMCAweDIwMDAwPjsNCj4+ICsJCWxhYmVsID0gImVudiI7DQo+PiArCX07DQo+PiArDQo+PiAr
CWZpdEA4MDAwMCB7DQo+PiArCQlyZWcgPSA8MHg4MDAwMCAweDFiODAwMDA+Ow0KPj4gKwkJbGFi
ZWwgPSAiZml0IjsNCj4+ICsJfTsNCj4+ICsNCj4+ICsJZGF0YTBAMWMwMDAwMCB7DQo+PiArCQly
ZWcgPSA8MHgxYzAwMDAwIDB4NDAwMDAwPjsNCj4+ICsJCWxhYmVsID0gImRhdGEwIjsNCj4+ICsJ
fTsNCj4+ICsNCj4+ICsJZmxhc2gwQDAgew0KPj4gKwkJcmVnID0gPDB4MCAweDIwMDAwMDA+Ow0K
Pj4gKwkJbGFiZWwgPSAiZmxhc2gwIjsNCj4+ICsJfTsNCj4gDQo+IElzIHRoaXMgbmVjZXNzYXJ5
PyBJc24ndCB0aGUgc2FtZSB0aGluZyBhY2hpZXZlZCB3aXRoIHRoZSAvZGV2L210ZDAgZGV2aWNl
Pw0KDQpIaSBBbmRyZXcsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldyEgVGhlIG5ldyBsYXlv
dXQgZmlsZSBpcyBuZWVkZWQgbWFpbmx5IGJlY2F1c2Ugb2YgImRhdGEwIiBwYXJ0aXRpb246IHNl
dmVyYWwgZmFjZWJvb2sgcGxhdGZvcm1zIHVzZSB0aGUgcGFydGl0aW9uIGFzICJwZXJzaXN0ZW50
IiBzdG9yYWdlLg0KDQpBcyBmb3IgImZsYXNoMCIsIHRlY2huaWNhbGx5IGl0J3Mgbm90IG5lZWRl
ZCAoYXMgeW91IHBvaW50ZWQgb3V0LCAvZGV2L210ZDAgY292ZXJzIHRoZSBlbnRpcmUgZmxhc2gg
aWYgbWFzdGVyX3BhcnRpdGlvbiBpcyBlbmFibGVkKS4gSXQncyBzdGlsbCBoZXJlIHRvIGF2b2lk
IGJyZWFraW5nIHNvbWUgbGVnYWN5IGFwcGxpY2F0aW9ucy4NCg0KDQpUaGFua3MsDQpUYW8gUmVu
DQo=
