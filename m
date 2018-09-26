Return-Path: <prvs=28074a2eee=amithash@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=28074a2eee=amithash@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="o0JyBOmv"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="c8fvzVlv"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42L6CY0thfzF3Lc
 for <openbmc@lists.ozlabs.org>; Thu, 27 Sep 2018 04:38:47 +1000 (AEST)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8QIanQV007883; Wed, 26 Sep 2018 11:38:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=nD/4mALR3/EGnZYau9GlSLvCjoCSTgK3iiF7OvfrX/Q=;
 b=o0JyBOmvUzH4B9/aB5B7PDlb6WR1rh/rOZlJ0I0Z/7TcKClRdca0veibkmfya0tM1kBj
 HWfbr4TFZJiN/CVKcz4A2A+EOeHLRx7sr5dTVYMWDawbj/XPDqxMUhKN0WJJJWtDiqmQ
 AnR4JJQpfDCkOUL8UZ8t9CR1q6ea9BZ2hEY= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0b-00082601.pphosted.com with ESMTP id 2mr9m29j31-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 26 Sep 2018 11:38:40 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.34) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Wed, 26 Sep 2018 14:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD/4mALR3/EGnZYau9GlSLvCjoCSTgK3iiF7OvfrX/Q=;
 b=c8fvzVlvRrtApzJxOAXDhJXjPliXUaWZXfdkdd6Gcm4Sb15tz63SDpZXdl3PvXN/Mwwcj6niExNA0AZRSR9qehRl/xmfjufxPLXqbqkmM8AapqraduP2gu7nuxVpq0JcT0oD/SE/lEvPeSjQSi+HyRm3kZd4nYDVsE2VCTUFWQ8=
Received: from MWHPR15MB1486.namprd15.prod.outlook.com (10.173.235.7) by
 MWHPR15MB1232.namprd15.prod.outlook.com (10.175.2.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1143.19; Wed, 26 Sep 2018 18:38:28 +0000
Received: from MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::95c3:c255:4645:a776]) by MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::95c3:c255:4645:a776%10]) with mapi id 15.20.1164.024; Wed, 26 Sep
 2018 18:38:28 +0000
From: Amithash Prasad <amithash@fb.com>
To: Patrick Venture <venture@google.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Link-up between Gerrit & Github
Thread-Topic: Link-up between Gerrit & Github
Thread-Index: AQHUTrsz5HxrCb/Gukiu17ljgDRHE6T029AAgALZ1wCAABFrgIAACXmAgAAGqgCAAAGVAIAAALKAgAsYvHk=
Date: Wed, 26 Sep 2018 18:38:28 +0000
Message-ID: <MWHPR15MB1486F7ACD2A589B82CE0B9E9B2150@MWHPR15MB1486.namprd15.prod.outlook.com>
References: <CAO=notxg=KimTVEuJXgR-iN9T5FiKcMA2TJD-E6pM_KVO9338g@mail.gmail.com>
 <5C90478E-E89A-428D-873F-3E4CCD5595D4@fuzziesquirrel.com>
 <CAO=notz2-wfv_kep5FhGP9T7rdQehvSqBSECvPywNis=uRXTKw@mail.gmail.com>
 <CALLMt=rthqi3e3vHNbNFkjyhBEp8P6P8KoYC0e4XrdKMhip1Hg@mail.gmail.com>
 <CAO=notxPfx-RufZXncqAX5LsdJCaQLirgxy-M+3hFPKYvrpTDw@mail.gmail.com>
 <CALLMt=o2y0TpXZCwjw--MiLJWo_5tg38i2K00Ety1AScO1M9Ew@mail.gmail.com>
 <ED9FEA73-985B-4898-8255-F60580024A82@fuzziesquirrel.com>,
 <CAO=notwdKFmckUgOCHdGWUsyAb3iSDd6aLoAg=PLULnFyFyJAA@mail.gmail.com>
In-Reply-To: <CAO=notwdKFmckUgOCHdGWUsyAb3iSDd6aLoAg=PLULnFyFyJAA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:c51e]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1232;
 20:0TTWDHryrStFXIJKIIVXxUAKEF9591EXn6e9uKRQJnRsIsFgbZIOhn9DJU8slNseDFKuNIIfo8vFPa/qxmmeuztRlEHZRNAaU8qoznbRaYd79iff3foAPEN0xKFRUFqjXxK8ShahwyW2jxI8DTUhoU279s0luyaeof6CmW4926g=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 4d79f3f7-b0d7-41ea-c3a6-08d623df4085
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1232; 
x-ms-traffictypediagnostic: MWHPR15MB1232:
x-microsoft-antispam-prvs: <MWHPR15MB1232A41357E43AE6D1B3133AB2150@MWHPR15MB1232.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(11241501184)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051);
 SRVR:MWHPR15MB1232; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1232; 
x-forefront-prvs: 08076ABC99
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(346002)(376002)(396003)(136003)(199004)(189003)(5660300001)(558084003)(81166006)(4326008)(2906002)(14454004)(74316002)(25786009)(7736002)(105586002)(106356001)(34290500001)(256004)(33656002)(11346002)(486006)(305945005)(478600001)(93886005)(8936002)(186003)(81156014)(6436002)(2900100001)(99286004)(110136005)(229853002)(6116002)(5250100002)(7696005)(97736004)(76176011)(446003)(46003)(71200400001)(68736007)(6246003)(102836004)(9686003)(6506007)(55016002)(8676002)(71190400001)(86362001)(53936002)(476003)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1232;
 H:MWHPR15MB1486.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: ODIc76k6nFG+z1m78/8pehj61uvi0qGr1/ywYO12aPerYksFAH48hMEW9Ufy/F/RYyaLRb7wkhphGaP8XTUSfSNs5qcJE+INoaRRG+uBXOF029DEn/TsQ8Hb8baMpoTjpjwZWNTRV4MwIWs9xoapKP9+9ijLhm17TP8w+ryOoREgndrKiGZz21Qlo184UW+U91zkJA0C3ZnlQr17ukHq6D/SFsqA36xfA0YQsDRqK0F2nePIvkGTxxEF9NxvyG+d37DDvRYGJGPaDDbeMJsHOo5E/Mc/mE1y8v9zlwUzUbIC7LDRBVez09Psr8W/+j/1tVfUKBNzKaRossJ+bQBrSorK+s1wvWXgAmljRt9bi9o=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d79f3f7-b0d7-41ea-c3a6-08d623df4085
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2018 18:38:28.4816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1232
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
X-List-Received-Date: Wed, 26 Sep 2018 18:38:49 -0000

> > I did the restart and saw some of our new repos get synched up

Andrew, I think it's time to restart the gerrit server again! I don't see p=
atches +2d on gerrit for (the newly added) meta-facebook showing up on gith=
ub :-(
