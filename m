Return-Path: <prvs=2807791ea6=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2807791ea6=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="CNe9LgL1"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="WvH/VbRU"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42L4C44CF9zF3Lb;
 Thu, 27 Sep 2018 03:08:11 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.22/8.16.0.22) with SMTP id w8QH0CEZ002630;
 Wed, 26 Sep 2018 10:08:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=BUf65eW5hoQnwgoVFnuY0S98xbu/K0PIdoiBx1e7ku0=;
 b=CNe9LgL1yqFtQ3q+sZBRBbE6LvqWxu84VswNZh9XR6DW+3nd6zxSvptLnYRvuMgQV5+P
 i8uEqEAk7TPabhxnJJHi1jLsyH6WBUN+ly7XH8Uf+yBbz+W4/sDrFJbdh1uswkTyAuXv
 U4e1RLXZmRPik60LiciO+PojSVSp3V4AYaY= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2mrb32rtg6-12
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 26 Sep 2018 10:08:07 -0700
Received: from PRN-CHUB02.TheFacebook.com (2620:10d:c081:35::11) by
 PRN-CHUB09.TheFacebook.com (2620:10d:c081:35::18) with Microsoft SMTP Server
 (TLS) id 14.3.361.1; Wed, 26 Sep 2018 10:08:04 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.12) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Wed, 26 Sep 2018 10:08:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUf65eW5hoQnwgoVFnuY0S98xbu/K0PIdoiBx1e7ku0=;
 b=WvH/VbRUp40jE7awiAIRTb96oEnxDRDf6I+SgeZgCfeSScUny2gllPCcLMJrQ7UbRgyE3as6/DHnplN24MUZyj8/rnurchyUJdokE41yZTqTj8UCAsJ5gl3pROFCvfsJINqOk/xgWI50QCZ0N0QQKCpRSphZK7/rMu54JGRsr44=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1575.namprd15.prod.outlook.com (10.172.162.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Wed, 26 Sep 2018 17:07:45 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::3cb5:8b7b:eafb:d86c]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::3cb5:8b7b:eafb:d86c%5]) with mapi id 15.20.1143.019; Wed, 26 Sep 2018
 17:07:44 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>
CC: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "OpenBMC
 Maillist" <openbmc@lists.ozlabs.org>,
 Sai Dasari <sdasari@fb.com>, "Amithash Prasad" <amithash@fb.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "Justin.Lee1@Dell.com" <Justin.Lee1@Dell.com>
Subject: Re: [PATCH] net/ncsi: Add NCSI OEM command for FB Tiogapass
Thread-Topic: [PATCH] net/ncsi: Add NCSI OEM command for FB Tiogapass
Thread-Index: AQHUVGQCuhyiMmBSKk6Et/PYgx/FjqUAJQyAgAC0rgCAASG8AIAAXUmA
Date: Wed, 26 Sep 2018 17:07:43 +0000
Message-ID: <FC2694E0-2F55-4089-8544-668243C6ECA2@fb.com>
References: <20180925000840.4111212-1-vijaykhemka@fb.com>
 <CACPK8XcDExGvCNBcFqOOP+1zQFFs6pMao+7rsZrJFqxPgcY+1Q@mail.gmail.com>
 <F570466E-4F6C-4AE1-91E0-0B4ECC193BE0@fb.com>
 <7cd8a49a057f1032e126b1e104fcf61e4956e06d.camel@mendozajonas.com>
In-Reply-To: <7cd8a49a057f1032e126b1e104fcf61e4956e06d.camel@mendozajonas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:26f]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1575;
 20:0nMGL4LmiLLjc1opthNBBmYB5oSRBi016k6ZhMRNVXVvJkLgZiFi7D2lrRBVMKIRIcZypzWK32cS+YuUhYWHrIe+4FkXeyPu6fHbImZV6IGvWv/CCL0VRaB63eBB2ppi5LVaaozq10akY/+yUJ2KCEuNcEIMpkHW8Ucl2fXg0RI=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(136003)(376002)(346002)(366004)(51914003)(189003)(199004)(54906003)(102836004)(6116002)(6506007)(33656002)(14444005)(186003)(97736004)(6512007)(53936002)(2616005)(217873002)(110136005)(2906002)(4326008)(476003)(83716004)(93886005)(486006)(14454004)(71200400001)(82746002)(305945005)(446003)(478600001)(316002)(76176011)(11346002)(6486002)(25786009)(2900100001)(86362001)(6436002)(106356001)(68736007)(229853002)(99286004)(5250100002)(46003)(5660300001)(6246003)(256004)(8676002)(71190400001)(81166006)(81156014)(8936002)(105586002)(34290500001)(7736002)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1575;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-correlation-id: a301ac72-15b9-4337-2f63-08d623d29348
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1575; 
x-ms-traffictypediagnostic: CY4PR15MB1575:
x-microsoft-antispam-prvs: <CY4PR15MB1575C586C5CF7CA5AD4D23FBDD150@CY4PR15MB1575.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231355)(11241501184)(944501410)(52105095)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699051);
 SRVR:CY4PR15MB1575; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1575; 
x-forefront-prvs: 08076ABC99
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: RUIzHeZwRQDrDP+EQ0vhl9/tQhtSAEr2iiesHTepc+9yaT8/BMUDp+51CD6yGQQGFwsg9TUocB/b7uyTXtyb213tvvx95qYkiG//RjzzVgY/YjtLEEJzE3up6JmJ0ukQpHqKAHRecvtGQrG2ktfS94uM9GcpUZeIixOum1wfJr51Wa6p2piyaJFExhqDQcvmiCjwAw65z7EaTjmcAjrGWOxhk7sVkz3jmwTgJDA/y80fxVlYFLdFgR72QuQROenBtTA0rVe2WoV28kya4Sb8+YBDj51ovBxWVil5MH8FAraamiW48bVO+cTAyf1pVxdeDdwFsSxW40bduuLdeOw0Oz8L53sV02hpNhJT612U+2Y=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BF9203642953E42AC8CBCC8C55A3144@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a301ac72-15b9-4337-2f63-08d623d29348
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2018 17:07:43.8798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1575
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-26_08:, , signatures=0
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
X-List-Received-Date: Wed, 26 Sep 2018 17:08:18 -0000

PiAgICBIaSBWaWpheSwNCiAgICANCiA+ICBUaGFua3MgZm9yIHRoZSBwYXRjaDsgYmVmb3JlIEkg
Z2V0IHRvbyBpbnRvIGEgcmV2aWV3IHRob3VnaCBJJ2QgbGlrZSB0bw0KID4gIGxvb3AgaW4gSnVz
dGluIChjYydkKSB3aG8gSSBrbm93IGlzIGFsc28gd29ya2luZyBvbiBhbiBPRU0gY29tbWFuZCBw
YXRjaC4NCiA+ICBUaGUgY2hhbmdlcyBoZXJlIGFyZSB2ZXJ5IHNwZWNpZmljIChlZy4gYSBjb21t
YW5kIHNwZWNpZmljIGNvbmZpZyBvcHRpb24NCiA+ICAiQ09ORklHX05DU0lfT0VNX0NNRF9HRVRf
TUFDIiksIHdoaWNoIGlzIG9rIG9uIGEgc21hbGwgc2NhbGUgYnV0IGlmIHdlDQogPiAgc3RhcnQg
dG8gYWRkIGFuIGluY3JlYXNpbmcgYW1vdW50IG9mIGNvbW1hbmRzIGNvdWxkIGdldCBvdXQgb2Yg
aGFuZC4NCiA+ICBBcyBJIHVuZGVyc3RhbmQgSnVzdGluJ3MgdmVyc2lvbiBhZGRzIGEgZ2VuZXJp
YyBoYW5kbGVyLCB1c2luZyB0aGUgTkNTSQ0KID4gIE5ldGxpbmsgaW50ZXJmYWNlIHRvIHBhc3Mg
T0VNIGNvbW1hbmRzIGFuZCByZXNwb25zZXMgdG8gYW5kIGZyb20NCiA+ICB1c2Vyc3BhY2UsIHdo
aWNoIGRvZXMgdGhlIGFjdHVhbCBwYWNrZXQgaGFuZGxpbmcuDQogPiAgSXQgd291bGQgYmUgZ29v
ZCB0byBjb21wYXJlIHRoZXNlIHR3byBhcHByb2FjaGVzIGZpcnN0IGJlZm9yZSBjb21taXR0aW5n
DQogPiAgdG8gYW55IG9uZSBwYXRoDQogICAgDQpIaSBTYW0sDQpNeSBvZW0gY29tbWFuZCBoYW5k
bGVyIGlzIGdlbmVyaWMgYW5kIGNhbiBiZSB1c2VkIGZvciBhbnkgb2VtIGNvbW1hbmRzIGFuZCBv
ZW0gcmVzcG9uc2UgaGFuZGxlciBjYW4gYmUgbWFkZSBtb3JlIGdlbmVyaWMuIFdlIGNhbiBjZXJ0
YWlubHkgd3JpdGUgYSB3cmFwcGVyIHRvIHN1cHBvcnQgbmV0bGluayBvZW0gY29tbWFuZCB0byBy
ZWNlaXZlIGZvcm0gdXNlciBzcGFjZS4gVGhlcmUgYXJlIE1lbGxhbm94IHNwZWNpZmljIGZ1bmN0
aW9ucyB3aGljaCBzZW5kcyBNZWxsYW5veCBzcGVjaWZpYyByZXF1ZXN0LiBUaGVzZSBuZWVkZWQg
YXMgYSBwYXJ0IG9mIGluaXRpYWwgY29uZmlndXJhdGlvbi4gV2UgY2FuIHJlbW92ZSBLY29uZmln
IG9wdGlvbiB3aXRoIG1vcmUgZ2VuZXJpYyBhcHByb2FjaC4NCg0KLVZpamF5IA0KDQo=
