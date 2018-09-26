Return-Path: <prvs=2807791ea6=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2807791ea6=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Z3VU5DJY"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="I9wSl4OL"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42L75p6T74zF3M4
 for <openbmc@lists.ozlabs.org>; Thu, 27 Sep 2018 05:18:53 +1000 (AEST)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8QJEFJh006535; Wed, 26 Sep 2018 12:18:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=tXMvvneEkRVTQix4c+zYflDz2DNqeWXEoqiwLkuuI2Y=;
 b=Z3VU5DJYRMfpVx0llfRDKBWbraJtm1053SEvXUSOLPvIBm9RJYfI4hfTram6As80909m
 e2eDw4tfHT6MmAHo369fH68PeP+77vLPVAcMR+X6REuqUBUpw/rtrotLi6B8vryodSvF
 ELdKSA9v4CKGrmMHxXeG2vWTnNyY3lMD+lU= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2mrfjv04wt-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 26 Sep 2018 12:18:46 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.26) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Wed, 26 Sep 2018 15:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXMvvneEkRVTQix4c+zYflDz2DNqeWXEoqiwLkuuI2Y=;
 b=I9wSl4OLLC5gp05kHvZk/e8r/sOpOpHuU5rgdL7ZgZrngiFGSb+jZhR8CjD9dcKoMXzt4jiTINRimnRmVIfOz8a3SNEtrr3WlEiRRb1Bf33wvSm3uNA4IPYHrLgOZIWvrZDA0HJVISBn4yBUKvBuIGvoinYt5wfpd9xuBOJiSO8=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1431.namprd15.prod.outlook.com (10.172.160.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.25; Wed, 26 Sep 2018 19:18:44 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::3cb5:8b7b:eafb:d86c]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::3cb5:8b7b:eafb:d86c%5]) with mapi id 15.20.1143.019; Wed, 26 Sep 2018
 19:18:43 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Geissler <geissonator@gmail.com>, Amithash Prasad <amithash@fb.com>
CC: Patrick Venture <venture@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Link-up between Gerrit & Github
Thread-Topic: Link-up between Gerrit & Github
Thread-Index: AQHUTrtG3mDlJ/8hL0OiySPiQOzzEqT0288AgALZ2ACAABFrgIAACXmAgAAGqgCAAAGVAIAAALKAgAsZSACAAASxgP//kTWA
Date: Wed, 26 Sep 2018 19:18:43 +0000
Message-ID: <583B3E48-9D8E-49EA-B7F8-2213F4FBB815@fb.com>
References: <CAO=notxg=KimTVEuJXgR-iN9T5FiKcMA2TJD-E6pM_KVO9338g@mail.gmail.com>
 <5C90478E-E89A-428D-873F-3E4CCD5595D4@fuzziesquirrel.com>
 <CAO=notz2-wfv_kep5FhGP9T7rdQehvSqBSECvPywNis=uRXTKw@mail.gmail.com>
 <CALLMt=rthqi3e3vHNbNFkjyhBEp8P6P8KoYC0e4XrdKMhip1Hg@mail.gmail.com>
 <CAO=notxPfx-RufZXncqAX5LsdJCaQLirgxy-M+3hFPKYvrpTDw@mail.gmail.com>
 <CALLMt=o2y0TpXZCwjw--MiLJWo_5tg38i2K00Ety1AScO1M9Ew@mail.gmail.com>
 <ED9FEA73-985B-4898-8255-F60580024A82@fuzziesquirrel.com>
 <CAO=notwdKFmckUgOCHdGWUsyAb3iSDd6aLoAg=PLULnFyFyJAA@mail.gmail.com>
 <MWHPR15MB1486F7ACD2A589B82CE0B9E9B2150@MWHPR15MB1486.namprd15.prod.outlook.com>
 <CALLMt=oj0mZwOKpKodC12r_vjCQ9n6Ysu5DH0bVP-NW6VsM+vw@mail.gmail.com>
In-Reply-To: <CALLMt=oj0mZwOKpKodC12r_vjCQ9n6Ysu5DH0bVP-NW6VsM+vw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:26f]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1431;
 20:25AmAROYZgc3I8qRY00afuLCEsrs1MqCHu5dElxk8kprhLUIDAZPK5z97o/2/cJ2ACkbJ5ZCbs95fOo7LxkSyqjArVFo657YIKCvskSu9w5lCBXv6U8Lb/m27eBpMT7bA7cmoIvu679WNsNNODwxJh8E9VCP0pEykJ8px8uxn6E=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(396003)(376002)(366004)(346002)(39860400002)(136003)(57704003)(189003)(199004)(6436002)(8676002)(305945005)(36756003)(476003)(11346002)(6512007)(7736002)(53936002)(8936002)(68736007)(6636002)(2906002)(81166006)(81156014)(5660300001)(6486002)(6116002)(82746002)(256004)(14444005)(39060400002)(486006)(2616005)(229853002)(6246003)(446003)(2900100001)(4326008)(33656002)(46003)(86362001)(93886005)(110136005)(54906003)(99286004)(83716004)(71200400001)(34290500001)(25786009)(106356001)(316002)(71190400001)(76176011)(105586002)(478600001)(14454004)(102836004)(186003)(97736004)(6506007)(5250100002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1431;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-correlation-id: 850d9287-3415-4ef8-ab06-08d623e4e006
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1431; 
x-ms-traffictypediagnostic: CY4PR15MB1431:
x-microsoft-antispam-prvs: <CY4PR15MB14314CD851DCED8BDF95D5A5DD150@CY4PR15MB1431.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231355)(11241501184)(944501410)(52105095)(10201501046)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123558120)(201708071742011)(7699051);
 SRVR:CY4PR15MB1431; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1431; 
x-forefront-prvs: 08076ABC99
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: i6R22+uSraNh647kkXpRZrxguxghb+8kO3/aeysCccxR/6UVk4DkPh5BRJXUn3ZPXq8mr8d2weHwq3LK5k+eAKTPmYPv7S7LvB57DIWB51yTIhcrN4iQepc9Rk73TbMf05PY6hx0Y0jBduNcCQu1dEL3+J5khWUNaD30qaMSX92isWUewHUU32nCE1s25UHPESmzxaDdkI8Q+UwIbmo0VOpgPMzdss5/pPR+z45ao8LPuJy5i3xsI0106XgMvRT+ZPc9XZ1MGudqhwPDLc2bpOdWYMZ3q44JAQRA/leNgG5E5MgUiAIP9N0i/g8u0aGRmysrf12wkXXkMCnB39+tXT5JoNFmOjYPQepzM368gpM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <A29390C5BA231641B6FE583F4A2A2911@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 850d9287-3415-4ef8-ab06-08d623e4e006
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2018 19:18:43.6411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1431
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
X-List-Received-Date: Wed, 26 Sep 2018 19:18:56 -0000

DQogICAgPiA+ID4gSSBkaWQgdGhlIHJlc3RhcnQgYW5kIHNhdyBzb21lIG9mIG91ciBuZXcgcmVw
b3MgZ2V0IHN5bmNoZWQgdXANCiAgICA+DQogICAgPiBBbmRyZXcsIEkgdGhpbmsgaXQncyB0aW1l
IHRvIHJlc3RhcnQgdGhlIGdlcnJpdCBzZXJ2ZXIgYWdhaW4hIEkgZG9uJ3Qgc2VlIHBhdGNoZXMg
KzJkIG9uIGdlcnJpdCBmb3IgKHRoZSBuZXdseSBhZGRlZCkgbWV0YS1mYWNlYm9vayBzaG93aW5n
IHVwIG9uIGdpdGh1YiA6LSgNCiAgICANCiAgICBEb25lIQ0KICAgIA0KICAgID4NCiAgICBJIHNl
ZSBtZXRhLWZhY2Vib29rIGdvdCBzeW5jZWQgdXAuIEJ1dCBJIGRvbid0IHNlZSBtZXRhLWZhY2Vi
b29rIHVuZGVyIG9wZW5ibWMvIGxpa2Ugb3RoZXIgcmVwby4gRG8gSSBuZWVkIHRvIGNyZWF0ZSBz
b21lIHJlcXVlc3QgdG8gZ2V0IGl0IGluY2x1ZGVkIHVuZGVyIG9wZW5ibWMgZGlyZWN0b3J5DQoN
Cg==
