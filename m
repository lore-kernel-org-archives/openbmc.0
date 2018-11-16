Return-Path: <prvs=4858315a04=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4858315a04=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="mxEIrLnP"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="edK4U0/x"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42xXt01x67zF3hY
 for <openbmc@lists.ozlabs.org>; Sat, 17 Nov 2018 09:27:35 +1100 (AEDT)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAGMRTCM023335; Fri, 16 Nov 2018 14:27:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=/iN/PApFo7oJYKDBN/SGOZbhSmEgXb9rrgrxynevkPs=;
 b=mxEIrLnPMx/S8aam/LwXckNNDVlb16fBP/VeHQzG4SaGH/t/82BELyK2A1a3tedcmLYz
 kchvIuCkzQnJeiGzJe1SSwfjHp6uNNb3oFSvYxbahOnftWVZnjXLHVMa6uFEHbMbl2WQ
 fyQ8wPKdNCX0pkTkrO1m/wD3zLixWWsXd50= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0b-00082601.pphosted.com with ESMTP id 2nt57808ku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 16 Nov 2018 14:27:29 -0800
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 16 Nov 2018 14:27:27 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Fri, 16 Nov 2018 14:27:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iN/PApFo7oJYKDBN/SGOZbhSmEgXb9rrgrxynevkPs=;
 b=edK4U0/x8a9Hntx/br8d0h6zakCIGXp5KxJ2nTcFG6wdR1vDIVa19UcYVqusnf9ADKSOXteIlpqwS7/X/6VRbSNgWaxYxhk/bYVL6J4g0bD4Z2KLk/QPkbxlc0tnJY7AUKzb7zijpskPQHTLXjHQtt6vWFrDHXmPE2DA46PPJog=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1293.namprd15.prod.outlook.com (10.175.3.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.28; Fri, 16 Nov 2018 22:27:25 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f8fb:c0d5:46cd:cf56]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f8fb:c0d5:46cd:cf56%2]) with mapi id 15.20.1294.045; Fri, 16 Nov 2018
 22:27:25 +0000
From: Sai Dasari <sdasari@fb.com>
To: Oskar Senft <osk@google.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "bradleyb@fuzziesquirrel.com"
 <bradleyb@fuzziesquirrel.com>, "gmills@linux.vnet.ibm.com"
 <gmills@linux.vnet.ibm.com>
Subject: Re: Submit board schematics to OpenBMC docs repo
Thread-Topic: Submit board schematics to OpenBMC docs repo
Thread-Index: AQHUfecCGIV3zRWTVEqxxjMxYuBjI6VSXEyAgACIjgD//5BTAA==
Date: Fri, 16 Nov 2018 22:27:25 +0000
Message-ID: <2A161BFC-87CF-4FE9-9DC5-FF1712EE955C@fb.com>
References: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
 <BA3510D9-333A-40DB-9D03-43A5A2B2D963@fb.com>
 <CABoTLcTpMY4StimKijR4LmuSuc0dnnfxeTN=hv13WYghsOFcSw@mail.gmail.com>
In-Reply-To: <CABoTLcTpMY4StimKijR4LmuSuc0dnnfxeTN=hv13WYghsOFcSw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5:a7d3]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1293;
 20:2BWE9euFUQkoCh1i7OYxcYBidTpdOuT+IyFMpKl7dcXGx0IJcgJnFfICsn6M2uSe0TMw3rCvrt1Cw+NsS507lWgeFrIHrBFE25wsDyuews7BNb5BJdMvG70u49lZR2ZHKhA7NWdFrR6X8v6w779gpDYATMPImifJ5jCX38TdMOc=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 3ef864da-723b-4eb1-63ed-08d64c12afa2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1293; 
x-ms-traffictypediagnostic: MWHPR15MB1293:
x-microsoft-antispam-prvs: <MWHPR15MB1293E6B78C274809ABCBAEFFCEDD0@MWHPR15MB1293.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(21748063052155)(28532068793085)(190501279198761)(227612066756510);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231415)(11241501184)(944501410)(52105112)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1293; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1293; 
x-forefront-prvs: 0858FF8026
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(39860400002)(376002)(396003)(136003)(189003)(199004)(25786009)(966005)(2906002)(6506007)(33656002)(2900100001)(7736002)(6916009)(6306002)(236005)(53936002)(6512007)(6246003)(6116002)(54896002)(68736007)(186003)(76176011)(71190400001)(83716004)(86362001)(102836004)(606006)(14454004)(71200400001)(36756003)(476003)(256004)(446003)(8676002)(105586002)(106356001)(82746002)(8936002)(81166006)(81156014)(2616005)(11346002)(486006)(6486002)(54906003)(316002)(99286004)(229853002)(46003)(97736004)(5660300001)(478600001)(4326008)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1293;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: nVFK6sEQng64RzGQ8J4laLjvz+OvYZfH7UpIKsjJi40roKPGdk6m7PYlsgUzHRqq00LIHRstdoDGvNlX5Vj5bUHoba1sOl9YKSxxAdY4UgRVzQsLtd3PER1ib88nddQPlf1y15CDSzfraEHdcOwCQuZ7e5C10bTMui+LMmk9EJlQeTQpwBlBlq/5A/nFvluK/ynM1xgoxnyiqipZgzjMHPD/s3GvXwmMB6YuwmKSvPsG72HrcRtsFLkwBby6i4neo4N8lws9fF12vE1+2wzbD67DimqGU+9hlHwWrRmTC+Fz5dKwbHDTVP0HhTfqxFloDiSlINXOOmIWEDKfUwb51cwKsCAGeog9xzRVf6UQB8Q=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_2A161BFC87CF4FE99DC5FF1712EE955Cfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef864da-723b-4eb1-63ed-08d64c12afa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2018 22:27:25.7562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1293
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-16_12:, , signatures=0
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
X-List-Received-Date: Fri, 16 Nov 2018 22:27:37 -0000

--_000_2A161BFC87CF4FE99DC5FF1712EE955Cfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpJIGd1ZXNzIHRoaXMgaXMgYSBxdWVzdGlvbiBvZiAjIG9mIHNtYWxsIHJlcG9zIHZzIGEgc2lu
Z2xlIGxhcmdlIHJlcG8gd2l0aCBhIGxvdCBvZiAic3R1ZmYiIGluIGl0LiBJIGdlbmVyYWxseSBw
cmVmZXIgZmV3ZXIgKHlldCBsYXJnZXIpIHJlcG9zIHZzLiB0aGUgb3ZlcmhlYWQgb2YgbWFuYWdp
bmcgbXVsdGlwbGUgc21hbGwgcmVwb3MuDQpNYXkgYmUgYW4gZXhhbXBsZSB3b3VsZCBjbGFyaWZ5
IGZvciBteSBzdWdnZXN0aW9uIG9mIGVtYmVkZGluZyBkZXRhaWxzIHdpdGggdGhlIG1hY2hpbmUu
IEkgd2FzIHJlZmVycmluZyB0byBoYXZpbmcg4oCYd2l0aGVyc3Bvb29u4oCZIHNjaGVtYXRpY3Mg
YWxvbmcgd2l0aCB0aGUgbWFjaGluZSBsYXllciBAIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1j
L29wZW5ibWMvdHJlZS9tYXN0ZXIvbWV0YS1pYm0vbWV0YS13aXRoZXJzcG9vbi4gVGhpcyB3aWxs
IHByb3ZpZGUgY29udGV4dCBmb3IgaG93IHRoaXMgbWFjaGluZSB3aXRoZXJzcG9vbiBpcyBkZXNp
Z25lZCB3aXRoIGFsbCB0aGUgZGV0YWlscy4oaHlwb3RoZXRpY2FsIGFzc3VtaW5nICB3aXRoZXJz
cG9vbiBzY2hlbWF0aWNzIGNhbiBiZSBzaGFyZWQgaW4gb3BlbikNCg==

--_000_2A161BFC87CF4FE99DC5FF1712EE955Cfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <BFE12D908EF63E4AAE95345BF5C624FF@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQph
OnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9yaXR5
Ojk5Ow0KCWNvbG9yOnB1cnBsZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnAubXNv
bm9ybWFsMCwgbGkubXNvbm9ybWFsMCwgZGl2Lm1zb25vcm1hbDANCgl7bXNvLXN0eWxlLW5hbWU6
bXNvbm9ybWFsOw0KCW1zby1tYXJnaW4tdG9wLWFsdDphdXRvOw0KCW1hcmdpbi1yaWdodDowaW47
DQoJbXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG87DQoJbWFyZ2luLWxlZnQ6MGluOw0KCWZvbnQt
c2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5F
bWFpbFN0eWxlMTgNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5
cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjEN
Cgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30N
CmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwv
aGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIj4NCjxk
aXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNw
OzwvbzpwPjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0idGV4dC1pbmRl
bnQ6LjVpbiI+SSBndWVzcyB0aGlzIGlzIGEgcXVlc3Rpb24gb2YgIyBvZiBzbWFsbCByZXBvcyB2
cyBhIHNpbmdsZSBsYXJnZSByZXBvIHdpdGggYSBsb3Qgb2YgJnF1b3Q7c3R1ZmYmcXVvdDsgaW4g
aXQuIEkgZ2VuZXJhbGx5IHByZWZlciBmZXdlciAoeWV0IGxhcmdlcikgcmVwb3MgdnMuIHRoZSBv
dmVyaGVhZCBvZiBtYW5hZ2luZyBtdWx0aXBsZSBzbWFsbCByZXBvcy48bzpwPjwvbzpwPjwvcD4N
CjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk1heSBiZSBhbiBleGFtcGxlIHdv
dWxkIGNsYXJpZnkgZm9yIG15IHN1Z2dlc3Rpb24gb2YgZW1iZWRkaW5nIGRldGFpbHMgd2l0aCB0
aGUgbWFjaGluZS4gSSB3YXMgcmVmZXJyaW5nIHRvIGhhdmluZyDigJh3aXRoZXJzcG9vb27igJkg
c2NoZW1hdGljcyBhbG9uZyB3aXRoIHRoZSBtYWNoaW5lIGxheWVyIEANCjxhIGhyZWY9Imh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvdHJlZS9tYXN0ZXIvbWV0YS1pYm0vbWV0YS13
aXRoZXJzcG9vbiI+DQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3RyZWUvbWFz
dGVyL21ldGEtaWJtL21ldGEtd2l0aGVyc3Bvb248L2E+LiBUaGlzIHdpbGwgcHJvdmlkZSBjb250
ZXh0IGZvciBob3cgdGhpcyBtYWNoaW5lIHdpdGhlcnNwb29uIGlzIGRlc2lnbmVkIHdpdGggYWxs
IHRoZSBkZXRhaWxzLihoeXBvdGhldGljYWwgYXNzdW1pbmcgJm5ic3A7d2l0aGVyc3Bvb24gc2No
ZW1hdGljcyBjYW4gYmUgc2hhcmVkIGluIG9wZW4pPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwv
ZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_2A161BFC87CF4FE99DC5FF1712EE955Cfbcom_--
