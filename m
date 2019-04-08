Return-Path: <prvs=9001dc15b6=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=9001dc15b6=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Akln/moR"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="TeXctPx5"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dH6w3w86zDqDt
 for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2019 03:12:52 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x38H6mAv030962;
 Mon, 8 Apr 2019 10:12:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=SJXizRdbQx4cD2zlJBLDsVi6/xCSCvF2aJ9lSTkedvE=;
 b=Akln/moR2ascm3dKwrUqw6kVdnw7XxJSFg7BoqHyxwLdOzbZNFWsXps7PmjpMuNBs0Bh
 s+SecZrUJqFJavbbgoYTtXEjYPOerltIOtV2jYC8A1YdK5Cqam2+UTDFQQqh6xfWbF67
 4Xqr9ArAZvT02fGKUzDeR5mkBc1t4k+2DPY= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2rpqs9eyae-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 08 Apr 2019 10:12:43 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 8 Apr 2019 10:12:19 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 8 Apr 2019 10:12:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJXizRdbQx4cD2zlJBLDsVi6/xCSCvF2aJ9lSTkedvE=;
 b=TeXctPx5g2TqPR1fqsBFVlM7VqUR4RFqGhzdpprU3h5RaHsVoSDROzXM7QemefcUp2dNZ0LcIGhHs4SZxSvchtSL5kmf7FAHvjyP70PkjEsdbAnNAnPQE7xZtkFq5Q5GS+WZmkutw4ydMy9dQmHpy5o0TLpqI9HDyXqHAU6i5fk=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1287.namprd15.prod.outlook.com (10.172.181.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Mon, 8 Apr 2019 17:12:18 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d%3]) with mapi id 15.20.1771.016; Mon, 8 Apr 2019
 17:12:18 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Patrick Venture
 <venture@google.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: tracking master of upstream openbmc/openbmc subtrees
Thread-Topic: tracking master of upstream openbmc/openbmc subtrees
Thread-Index: AQHUvM2+J4qm7JzHxEKIRSBR3ZaOi6YuOoyAgAB/Y4CAAMA4AIAC81SA
Date: Mon, 8 Apr 2019 17:12:18 +0000
Message-ID: <E8CD178C-E220-4A17-8C96-C10A8992DB73@fb.com>
References: <20190204210735.6wgh7br7l45bj5xc@thinkpad.dyn.fuzziesquirrel.com>
 <20190405180457.m57lsbn6wu6tvjdr@thinkpad>
 <CAO=notxjMG0tHXOKFoWHsnjOhM-GhHBtD2YxPjcmNADfv6FLew@mail.gmail.com>
 <20190406130852.xlhoeue5qiz2o46d@thinkpad>
In-Reply-To: <20190406130852.xlhoeue5qiz2o46d@thinkpad>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:e700]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 993db729-afc5-4a6c-5b5d-08d6bc455af0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR15MB1287; 
x-ms-traffictypediagnostic: CY4PR15MB1287:
x-ms-exchange-purlcount: 5
x-microsoft-antispam-prvs: <CY4PR15MB1287FEAEFA21F2E6434FDFB3DD2C0@CY4PR15MB1287.namprd15.prod.outlook.com>
x-forefront-prvs: 0001227049
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(376002)(136003)(346002)(396003)(199004)(189003)(53754006)(316002)(6512007)(106356001)(14454004)(7736002)(4326008)(105586002)(6116002)(6246003)(33656002)(83716004)(68736007)(71200400001)(8676002)(97736004)(478600001)(5660300002)(71190400001)(81166006)(2906002)(81156014)(966005)(46003)(229853002)(186003)(305945005)(6506007)(8936002)(82746002)(86362001)(36756003)(11346002)(110136005)(446003)(256004)(93886005)(6436002)(6306002)(53936002)(14444005)(25786009)(486006)(76176011)(2616005)(476003)(99286004)(6486002)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1287;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S+uNftIDS8/LhzHRdYmT0AKRqso6jTyEvQ4dP9mAyIqoVbkTfpQqaJR9dR2GsR5nma0FRuyw3v5c/KnM/2+xBLBo+T2rICRybV4g7YGjRKsfXAVOKkQAsKUWBUF6Is41uUMAouAdGdOAyGTsLSlGxEe0W/THA95AYZXVY7Opd54sV+zDPCjL5OCXCXVgKltdKiywN7tq9L3c03jXfiPmrQRiBbpNQRIUAzboJEN6SH8MvjqOi1rVchzwFVgWgpKQlpoKiDiCaQpNKs77td7Fz/BNHF3IGTttD/PG+KLVU8h7tcb2Z+s3RzHokZnUUHgJ/INaFtY4QpbUAw4yZAtSJLBcqE+zRTTTnuA9bF6AL1kR7DgWcxA79FCSNelndj1HbwPQR+AnWUXC7JEyADKMYsQsYiyd9wwTGzAIjOlqQtM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D28E6FA1CE2D874183E486A15E627AA9@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 993db729-afc5-4a6c-5b5d-08d6bc455af0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2019 17:12:18.2779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1287
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-08_06:, , signatures=0
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
X-List-Received-Date: Mon, 08 Apr 2019 17:12:58 -0000

DQoNCu+7v09uIDQvNi8xOSwgNjowOSBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEJyYWQgQmlz
aG9wIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3Jn
IG9uIGJlaGFsZiBvZiBicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+IHdyb3RlOg0KDQogICAg
T24gRnJpLCBBcHIgMDUsIDIwMTkgYXQgMDY6NDA6NTNQTSAtMDcwMCwgUGF0cmljayBWZW50dXJl
IHdyb3RlOg0KICAgID5PbiBGcmksIEFwciA1LCAyMDE5IGF0IDExOjA0IEFNIEJyYWQgQmlzaG9w
IDxicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+IHdyb3RlOg0KICAgID4+DQogICAgPj4gT24g
TW9uLCBGZWIgMDQsIDIwMTkgYXQgMDQ6MDc6MzVQTSAtMDUwMCwgQnJhZCBCaXNob3Agd3JvdGU6
DQogICAgPj4gPkhpIGV2ZXJ5b25lDQogICAgPj4gPg0KICAgID4+ID5KdXN0IGEgaGVhZHMgdXAg
LSBpbiB0aGUgdmVyeSBuZWFyIGZ1dHVyZSBJJ2QgbGlrZSB0byBzdGFydCB0cmFja2luZyB0aGUN
CiAgICA+PiA+bWFzdGVyIGJyYW5jaCBvZiBvdXIgdXBzdHJlYW0gc3VidHJlZXMgLSBwb2t5LCBt
ZXRhLW9wZW5lbWJlZGRlZCwNCiAgICA+PiA+bWV0YS1zZWN1cml0eSwgbWV0YS1yYXNwYmVycnlw
aSBhbmQgbWV0YS14aWxpbng6DQogICAgPj4gPg0KICAgID4+ID5odHRwczovL3VybGRlZmVuc2Uu
cHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2dlcnJpdC5vcGVuYm1jLTJEcHJvamVj
dC54eXpfMTczODcmZD1Ed0lCQWcmYz01VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JnI9djlNVTBLaTlw
V25UWENXd2pIUFZncG5DUjgwdlhra2NySWFxVTdVU2w1ZyZtPUV1TVpfVzFuNDh1TG1ZLW8yQ3lf
SVhma3JfLTNha19PRDI1N2VHTExQSkkmcz0tSHJRSUZrMlhnTzBOX0hMQXJJaHg3d3h4TjB4SlZL
UTdyU0p5YUdxbWR3JmU9DQogICAgPj4gPg0KICAgID4+ID5UaGlzIHJlbW92ZXMgdGhlIG5lZWQg
dG8gYmFja3BvcnQgZml4ZXMgZnJvbSB0aGVzZSBwcm9qZWN0cyBhbmQgdGhpbmtpbmcNCiAgICA+
PiA+Z2VuZXJhbGx5LCBtaWdodCBpbmNyZWFzZSB0aGUgY29sbGFib3JhdGlvbiBiZXR3ZWVuIHRo
ZSBPcGVuQk1DDQogICAgPj4gPmNvbW11bml0eSBhbmQgdGhlIHVwc3RyZWFtIGNvbW11bml0aWVz
IG9uIHdoaWNoIG91ciBwcm9qZWN0IHNvDQogICAgPj4gPmZ1bmRhbWVudGFsbHkgZGVwZW5kcy4N
CiAgICA+PiA+DQogICAgPj4gPkluIHByYWN0aWNlIHRoaXMgd2lsbCByZWFsbHkganVzdCBsb29r
IGxpa2U6DQogICAgPj4gPg0KICAgID4+ID5odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVu
Ym1jL2NvbW1pdC9jZGY0ODU5ZjllNzQyOTMwOTBkNzljMDI5NDlmYTZhNjk0YmRiMWQ1DQogICAg
Pj4gPg0KICAgID4+ID5idXQgdGhlIGNvbW1pdHMgd2lsbCBoYXZlIG1vcmUgY29udGVudCBhbmQg
aGFwcGVuIG1vcmUgZnJlcXVlbnRseS4NCiAgICA+PiA+DQogICAgPj4gPlRoZXJlIGFyZSBhIGNv
dXBsZSBjYXZlYXRzIC0gb25lLCB1cHN0cmVhbSBtYXkgYnJlYWsgbW9yZSBmcmVxdWVudGx5DQog
ICAgPj4gPnRoYW4gaXQgZG9lcyBvbiB0aGUgc3RhYmxlIGJyYW5jaGVzLCBhbmQgdHdvLCBnaXZl
biB0aGUgbG9jYXRpb24gb2YNCiAgICA+PiA+dGhlc2UgcHJvamVjdHMgaW4gdGhlIHN0YWNrIChs
b3cpLCBtb3JlIGZyZXF1ZW50IHJlYmFzZXMgd2lsbCByZXN1bHQgaW4NCiAgICA+PiA+c29tZSBp
bXBhY3QgdG8gdGhlIGRldmVsb3BtZW50IHdvcmtmbG93IChtb3JlIHRpbWUgYnVpbGRpbmcgYmVj
YXVzZSBhDQogICAgPj4gPnBhdGNoIHdhcyBhcHBsaWVkIHRvIGdjYywgZXRjKS4NCiAgICA+PiA+
DQogICAgPj4gPlRvIG1pdGlnYXRlIG51bWJlciBvbmUsIEkgd2lsbCBzdWJtaXQgcmViYXNlcyBh
cyBwYXRjaGVzIHRvIGdlcnJpdCB3aGVyZQ0KICAgID4+ID5vdXIgQ0kgdGVzdHMgY2FuIHJ1bi4g
IElmIHRoZXkgZmluZCBhbnkgcHJvYmxlbXMsIEkgd29uJ3QgbWVyZ2UgdGhlDQogICAgPj4gPnJl
YmFzZSB1bnRpbCBhIHJlc29sdXRpb24gaXMgZm91bmQuICBBZGRpdGlvbmFsbHkgaWYgeW91IGZp
bmQgYW55DQogICAgPj4gPnByb2JsZW1zIHZpYSBzb21lIG90aGVyIGNoYW5uZWwgdGhhbiBvdXIg
Q0ksIGxldCBtZSBrbm93IGFuZCBhZ2FpbiBJDQogICAgPj4gPndvbid0IGFwcGx5IHRoZSByZWJh
c2UgdW50aWwgYSByZXNvbHV0aW9uIGNhbiBiZSBmb3VuZC4gIFB1dCBhbm90aGVyIHdheQ0KICAg
ID4+ID5JIGRvbid0IGludGVuZCB0byByZWJhc2Ugb250byB1cHN0cmVhbXMgd2l0aCBrbm93biBw
cm9ibGVtcyBmb3IgdXMuDQogICAgPj4gPg0KICAgID4+ID5UbyBtaXRpZ2F0ZSBudW1iZXIgdHdv
LCBJIHdhcyB0aGlua2luZyBJJ2QganVzdCBzdWJtaXQgcmViYXNlcyB3ZWVrbHkuDQogICAgPj4g
Pg0KICAgID4+ID5RdWVzdGlvbnMvY29uY2VybnM/DQogICAgPj4gPg0KICAgID4+ID50aHggLSBi
cmFkDQogICAgPj4NCiAgICA+PiBKdXN0IGEgcXVpY2sgdXBkYXRlIC0gVGhhbmtzIHRvIHNvbWUg
aGVscCBhbmQgbW90aXZhdGlvbiBmcm9tIFdpbGxpYW0NCiAgICA+PiBhbmQgb3RoZXJzLCB0aGlz
IHdpbGwgKHByb2JhYmx5KSBoYXBwZW4vYmVnaW4gdG9kYXkuICBBIGNvdXBsZSB0aGluZ3MgdG8N
CiAgICA+PiBub3RlLg0KICAgID4+DQogICAgPj4gMSAtIElmIHlvdSBtYWludGFpbiBhIGxheWVy
LCB5b3UnbGwgbmVlZCB0byB1cGRhdGUgeW91ciBsYXllcg0KICAgID4+IGNvbXBhdGliaWxpdHkg
bGlrZSB0aGlzOg0KICAgID4+DQogICAgPj4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQu
Y29tL3YyL3VybD91PWh0dHBzLTNBX19nZXJyaXQub3BlbmJtYy0yRHByb2plY3QueHl6XzIwMTUw
JmQ9RHdJQkFnJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBW
Z3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmbT1FdU1aX1cxbjQ4dUxtWS1vMkN5X0lYZmtyXy0zYWtf
T0QyNTdlR0xMUEpJJnM9Qkx3RGQwVmxtejM5am0xR3RjN1FoNEtuVkg5dk40Zzg4RG5LYjhkRC1S
QSZlPQ0KICAgID4NCiAgICA+Rm91bmQgc29tZSBvdGhlciBsYXllcnMgdGhhdCBuZWVkZWQgdXBk
YXRpbmcuICBPbmUgb2Ygd2hpY2ggYmVjYXVzZQ0KICAgID5pdCdzIHBhcnQgb2YgdGhlIENJLiAg
U2VudCBwYXRjaGVzIGZvciByZXZpZXcgd2l0aCB0aGUgc2FtZSB0b3BpYy4NCiAgICANCiAgICBU
aGFua3MgUGF0cmljay4gIFNvbWVob3cgSSBkaWRuJ3QgcmVhbGl6ZSB0aGF0IHRpb2dhcGFzcyBo
YWQgYmVlbiB0dXJuZWQNCiAgICBvbiA6LSgNClRpb2FnYXBhc3Mgd2FzIHR1cm5lZCBvbiBpbiBD
SSA0IG1vbnRocyBiYWNrLiBJIHdpbGwgbWFpbnRhaW4gYW5kIHN1cHBvcnQgdGlvZ2FwYXNzIHRy
ZWUgaWYgYW55IHVwZGF0ZSByZXF1aXJlZCBoZXJlLg0KICAgIA0KICAgID5UaGFua3MNCiAgICA+
DQogICAgPj4NCiAgICA+PiBBbHRob3VnaCB5b3Ugd29uJ3QgbmVlZCB0byBrZWVwIHRodWQgY29t
cGF0aWJpbGl0eSBsaWtlIHRoYXQgY29tbWl0DQogICAgPj4gZG9lcy4NCiAgICA+Pg0KICAgID4+
IDIgLSBJIGRlY2lkZWQgdG8gcmVtb3ZlIHJzeXNsb2cgaW5jbHVzaW9uIGJ5IGRlZmF1bHQNCiAg
ICA+PiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0Ff
X2dlcnJpdC5vcGVuYm1jLTJEcHJvamVjdC54eXpfMjAyMTQmZD1Ed0lCQWcmYz01VkQwUlR0TmxU
aDN5Y2Q0MWIzTVV3JnI9djlNVTBLaTlwV25UWENXd2pIUFZncG5DUjgwdlhra2NySWFxVTdVU2w1
ZyZtPUV1TVpfVzFuNDh1TG1ZLW8yQ3lfSVhma3JfLTNha19PRDI1N2VHTExQSkkmcz1OdFU3cnY1
bldqaEJUNnRSbkFYbnpidmVEMmVTNzlsbW12SEhUelFUTlJJJmU9IGJlY2F1c2Ugb2YNCiAgICA+
PiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1sb2dnaW5nL2lzc3Vlcy8xOS4g
IFRoaXMgYWxsb3dzIHVzDQogICAgPj4gdG8gbW92ZSBvdXIgdXBzdHJlYW0gc3VidHJlZXMgZm9y
d2FyZCBhbmQgZGVidWcNCiAgICA+PiBvcGVuYm1jL3Bob3NwaG9yLWxvZ2dpbmcjMTkgaW4gcGFy
YWxsZWwgLSBJIGV4cGVjdCB0aGVyZSBhcmVuJ3QgdG9vIG1hbnkNCiAgICA+PiB1c2VycyBvZiBy
c3lzbG9nIGFueXdheS4gIElmIEknbSB3cm9uZyBhYm91dCB0aGF0IHBsZWFzZSBsZXQgbWUga25v
dyBidXQNCiAgICA+PiBJIGFsc28gZXhwZWN0IHRoYXQgaXNzdWUgdG8gZ2V0IGZpeGVkIHVwIGlu
IHRoZSBuZXh0IGNvdXBsZSB3ZWVrcw0KICAgID4+IHJlZ2FyZGxlc3MuDQogICAgPj4NCiAgICA+
PiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSd2ZSBjYXVzZWQgYW55b25lIHBhaW4gd2l0aCBhbnkg
b2YgdGhpcy4NCiAgICA+Pg0KICAgID4+IHRoeCAtIGJyYWQNCiAgICANCg0K
