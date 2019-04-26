Return-Path: <prvs=9019cfc672=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=9019cfc672=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="LSkRCAm/"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="C9oPVrHB"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rLKZ3L52zDqBW
 for <openbmc@lists.ozlabs.org>; Sat, 27 Apr 2019 03:15:22 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3QHD8ZD010881
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 10:15:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=85kr6YAduJXiPAR3EMFkF21SrNCApzDnRZPRmfKOhcQ=;
 b=LSkRCAm/1CGeRbTsDry0Z83tHFBb5C119+IhX9TpDW/kMGcKwuM+tpyWhSMFhp0HB2W5
 wZtPURAnrrMvw51RUPvA1Mn6FdGBZ8USMRIyDZLr9udnM/HeAGniBE5WAXoASUPFl45c
 BI/5HI2z0Fdpf/sNE1uU/RKSMlMuf3FMQ5k= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2s3mcc35tx-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 10:15:18 -0700
Received: from ash-exhub202.TheFacebook.com (2620:10d:c0a8:83::6) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 26 Apr 2019 10:15:17 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 26 Apr 2019 10:15:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85kr6YAduJXiPAR3EMFkF21SrNCApzDnRZPRmfKOhcQ=;
 b=C9oPVrHBVOSwegGh4g1b6Fp8zKZG9dJcymE+Mav9ZpIASQoo05wAPCfsD3XTAC9NtjZSvuAvjduErOI80v/SepUMzn9KeZpB78je61HYJ4PCj2frNe8zdEvhjCeNA4tUuYDIFFi8/EdrYy1maPriz4XIaGasCx2T7Qtx42ruWMw=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1151.namprd15.prod.outlook.com (10.175.2.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Fri, 26 Apr 2019 17:15:16 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::9ccc:f6fa:40e2:f1cd]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::9ccc:f6fa:40e2:f1cd%10]) with mapi id 15.20.1835.010; Fri, 26 Apr
 2019 17:15:16 +0000
From: Tao Ren <taoren@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: linux kernel compiler warnings ignored
Thread-Topic: linux kernel compiler warnings ignored
Thread-Index: AQHU/EEdc8Tcdc3JpkWpJ8UfFS0t06ZOjPYAgAAI+ACAABjHgA==
Date: Fri, 26 Apr 2019 17:15:16 +0000
Message-ID: <3e70541e-f308-1f50-1792-6c6b483a047c@fb.com>
References: <CAO=notxyVAx=LY+5tCUWaezZP67JKy7z3NT3SAUcKR64W8Pk_w@mail.gmail.com>
 <d4abbc06-a4ea-4cd0-95f7-b32cd388293e@www.fastmail.com>
 <CAO=notx9iWQoOLPxKiHm-V=B5b99XZhLQE5PkgNEPg-J_9apiQ@mail.gmail.com>
In-Reply-To: <CAO=notx9iWQoOLPxKiHm-V=B5b99XZhLQE5PkgNEPg-J_9apiQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR08CA0013.namprd08.prod.outlook.com
 (2603:10b6:301:5f::26) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:b23c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ca160f8-1116-43b5-831a-08d6ca6ac01d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MWHPR15MB1151; 
x-ms-traffictypediagnostic: MWHPR15MB1151:
x-microsoft-antispam-prvs: <MWHPR15MB11513AE27C5A0C093E78A895B23E0@MWHPR15MB1151.namprd15.prod.outlook.com>
x-forefront-prvs: 001968DD50
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(366004)(396003)(136003)(39860400002)(189003)(199004)(31686004)(11346002)(97736004)(76176011)(5640700003)(478600001)(6246003)(476003)(64126003)(2501003)(486006)(2906002)(52116002)(53936002)(256004)(68736007)(6436002)(99286004)(86362001)(31696002)(71200400001)(6916009)(229853002)(6486002)(71190400001)(66446008)(2351001)(66946007)(66556008)(36756003)(64756008)(66476007)(58126008)(6512007)(81166006)(8676002)(1730700003)(5660300002)(81156014)(65956001)(73956011)(65806001)(8936002)(6116002)(46003)(65826007)(446003)(14454004)(6506007)(386003)(102836004)(53546011)(7736002)(305945005)(2616005)(186003)(25786009)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1151;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dN+BQZFx8KJfaL2iPF+97HTSRfU8F5wDDSvvFFoYGWe8WguwvLu7siQxXOiWYzjVJpm3e4gCewkukJCPWxmslkBVhuxuo1qXgm/V+TwKiiIbzoj9WG6dQgSGHjg779zLkaF3VQ9m+aQ9WhT5g1mEPX2SffhEr7UGb2s9sFm8TBD4xayoLQT9S0MC7oiv0kw+L4M2l+ddOSca/NBNyFa2aThQke5w5ScJipv6J5j4Yg8qJX8twY7dTJeZWWbgdxFPG+hnZiXRbD8gvCBAUgdqpCon3wX55ULLFC50WWDd5OCtbNKYdsKvSrV9R7hzzGwp05mMg8LrTw1oggZbTD8sAB7PSzCXJuM3ln0MNzQhPONBvxT4i5zA1nwmNe5cHqMB+HKtN112hQxZIvhDYfgUW6jEHB8i8fV+zzYQGpP+9Ak=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F97873BB3B57F94CB15C1EBD45FAD653@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca160f8-1116-43b5-831a-08d6ca6ac01d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2019 17:15:16.3312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1151
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-26_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904260118
X-FB-Internal: deliver
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
X-List-Received-Date: Fri, 26 Apr 2019 17:15:32 -0000

T24gNC8yNi8xOSA4OjQ2IEFNLCBQYXRyaWNrIFZlbnR1cmUgd3JvdGU6DQo+IE9uIEZyaSwgQXBy
IDI2LCAyMDE5IGF0IDg6MTQgQU0gQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4gd3Jv
dGU6DQo+Pg0KPj4NCj4+DQo+PiBPbiBGcmksIDI2IEFwciAyMDE5LCBhdCAwODowMSwgUGF0cmlj
ayBWZW50dXJlIHdyb3RlOg0KPj4+IEknbSBnZXR0aW5nIGZlZWRiYWNrIGZyb20gYSBwYXRjaHNl
dCBJIHNlbnQgdXBzdHJlYW0gdGhhdCB0aGVyZSBhcmUNCj4+PiBjb21waWxlciB3YXJuaW5ncy4g
IFdoaWNoIHN1cnByaXNlZCBtZSBiZWNhdXNlIG15IE9wZW5CTUMgYnVpbGRzIHdpdGgNCj4+PiB0
aG9zZSBwYXRjaGVzIGRvbid0IGNvbXBsYWluLiAgSSBpbWFnaW5lIHRoZXJlZm9yZSB3ZSBoYXZl
IHRoZW0NCj4+PiBzaWxlbmNlZCBhbmQgd2FzIGN1cmlvdXMgd2hlcmUgd2Ugc2lsZW5jZSB0aGVt
Lg0KPj4NCj4+IEhvdyBhcmUgeW91IGJ1aWxkaW5nIHRoZSBrZXJuZWw/DQo+Pg0KPj4gSSBzdHJv
bmdseSByZWNvbW1lbmQgeW91IGJ1aWxkIGtlcm5lbHMgZGlyZWN0bHkgZnJvbSB0aGUga2VybmVs
IHNvdXJjZSB0cmVlIHJhdGhlciB0aGFuIHVzaW5nIGJpdGJha2UsIGlmIHRoYXQncyB3aGF0IHlv
dSdyZSBkb2luZy4NCj4gDQo+IEknbSBidWlsZGluZyB0aGUga2VybmVsIHZpYSBiaXRiYWtlIGFz
IHlvdSBzdXJtaXNlZC4NCj4gDQo+Pg0KPj4gSW4gdGhlIGtlcm5lbCBzb3VyY2UgdHJlZSwgZG86
DQo+Pg0KPj4gJCBleHBvcnQgQVJDSD1hcm0NCj4+ICQgZXhwb3J0IENST1NTX0NPTVBJTEU9YXJt
LWxpbnV4LWdudWVhYmktDQo+PiAkIG1ha2UgYXNwZWVkX2c1X2RlZmNvbmZpZw0KPj4gJCBtYWtl
IFc9MSAtaiQobnByb2MpDQo+Pg0KPj4gVGhpcyBleHBvcnRzIGFyZSBmcm9tIG1lbW9yeSwgeW1t
di4NCj4gDQo+IFRoYW5rcy4gSSd2ZSBmaXJlZCBvZmYgYSBjb21wbGV0ZSBidWlsZCBvZiB0aGUg
a2VybmVsIHRvIGNhdGNoIHRoaXMuDQo+IEkgZG9uJ3QgaGF2ZSB0aGUgb3BlbmJtYyBTREsgdG9v
bGNoYWluIGluc3RhbGxlZCBhdCB0aGUgbW9tZW50LCBidXQNCj4gdGhhdCdzIG5vdCBhIGRpZmZp
Y3VsdCB0YXNrLg0KDQpJIGFsc28gbm90aWNlZCB0aGUgaXNzdWUgZWFybGllciB0aGlzIHdlZWsg
KGJpdGJha2UgZG9lc24ndCByZXBvcnQgdW51c2VkIHZhcmlhYmxlcyBpbiBteSBwYXRjaCkuIFRo
YW5rIHlvdSBBbmRyZXcgYW5kIFBhdHJpY2sgZm9yIHJhaXNpbmcgdGhlIHRvcGljIGFuZCBzaGFy
aW5nIHNvbHV0aW9ucy4NCg0KQ2hlZXJzLA0KDQpUYW8gDQo=
