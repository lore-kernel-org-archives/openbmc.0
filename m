Return-Path: <prvs=4858315a04=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4858315a04=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="bTJpuzr9"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="AFgi7XHp"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42xVvN25Y7zF3mF
 for <openbmc@lists.ozlabs.org>; Sat, 17 Nov 2018 07:58:35 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.22/8.16.0.22) with SMTP id wAGKnamU025434;
 Fri, 16 Nov 2018 12:58:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=sb9qxYX4zAXWGroNMRBt0QNzpMO/9eWDMhzxGhmfh4w=;
 b=bTJpuzr9VfawBLMz07As2juT72LooRgi0TjlavFsGQq3ZnIUQDvXBp+eHUFAxt6as5U/
 K9rTZdO8Xn8Qq522+C61F52TY3zJ8ITSOBYnm+o+GEiyeBRURbVV9VsIUweiKdd3JpK5
 x6MmzktlDVdwlMpIt/Y4MZUqiK/YhC2H0qY= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2nt30urduj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 16 Nov 2018 12:58:26 -0800
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 16 Nov 2018 12:58:24 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Fri, 16 Nov 2018 12:58:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sb9qxYX4zAXWGroNMRBt0QNzpMO/9eWDMhzxGhmfh4w=;
 b=AFgi7XHp2x/EXb/URPK1S7gHsgNo2c+GC6R9plypwS6mVJf2+yoVoo4x7F4TYtzjR7GsEE2gGorXsOzCo9g6JIsS0g8xCsWFCoI0bY0sPtLEixwe0/Wk7nrjqzdON4IZ3ZmxfyILZLQvPc7PPXYErTwMnIQaoBz1e1TKRmTsszs=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1488.namprd15.prod.outlook.com (10.173.235.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.30; Fri, 16 Nov 2018 20:58:22 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f8fb:c0d5:46cd:cf56]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f8fb:c0d5:46cd:cf56%2]) with mapi id 15.20.1294.045; Fri, 16 Nov 2018
 20:58:22 +0000
From: Sai Dasari <sdasari@fb.com>
To: Oskar Senft <osk@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
CC: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "gmills@linux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>
Subject: Re: Submit board schematics to OpenBMC docs repo
Thread-Topic: Submit board schematics to OpenBMC docs repo
Thread-Index: AQHUfecCGIV3zRWTVEqxxjMxYuBjI6VSXEyA
Date: Fri, 16 Nov 2018 20:58:22 +0000
Message-ID: <BA3510D9-333A-40DB-9D03-43A5A2B2D963@fb.com>
References: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
In-Reply-To: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5:a7d3]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1488;
 20:c3TQAUyzswRC/p6IAirmVOfBf0sHQsmE9ybcqQVStNhTkpNj2UGsbnFtgD2HiI+fz4OirjB4i8R5O2NFzBrJHHNHlT3K8REuhHR53Wqf2kyG/il+dhxQE/PcPoMPMkRdy+U+qMTGxuN0cdS6A2atZX2jImvWy+pDwowkN+q+EMo=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 51dbdb3e-454c-4d92-6653-08d64c063ec4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1488; 
x-ms-traffictypediagnostic: MWHPR15MB1488:
x-microsoft-antispam-prvs: <MWHPR15MB1488C5DC944D8FE49AD95DDECEDD0@MWHPR15MB1488.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21748063052155)(28532068793085)(190501279198761)(227612066756510); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(3231415)(11241501184)(944501410)(52105112)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1488; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1488; 
x-forefront-prvs: 0858FF8026
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(136003)(396003)(39860400002)(376002)(189003)(199004)(186003)(46003)(6486002)(6436002)(68736007)(54896002)(8936002)(6306002)(6512007)(99286004)(76176011)(54906003)(5660300001)(476003)(33656002)(229853002)(25786009)(102836004)(486006)(478600001)(53936002)(6506007)(316002)(4326008)(446003)(81166006)(11346002)(2906002)(83716004)(6246003)(105586002)(97736004)(2900100001)(82746002)(106356001)(36756003)(110136005)(71200400001)(71190400001)(6116002)(14454004)(81156014)(2616005)(7736002)(86362001)(8676002)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1488;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Tpqyg3/p8/BLGu2M0Y3iXvWeF7FswarlwMlY8+OFsBd3d5s8oemw3GxPcp0RiOE1OLlWy4Hwi1cqpg2Vbo8X8LAkmyGrxOdN98D/cPTjpK82G7WcUoOxRd3an+zekLc2mACDHUvjBaIQouNym7LnNmc6B0nFi+TDzUQEKXyQxnrz3usT8KnD1tM7fwrM4q4WNbBolXMsAr4FxkCHkb/MdG5oUEKt7cNfZJF84i/qPn5KP7ATRI7IptSCNICSAZnfKHQt1gOmGdy9seIl+U1Z7djvy0/yleWTG28EZmmPjdsFWkI03EoJ7t6bHynaC0mopG9SRoQkhABl7s3rzyg5q+hcgsKNz/1hkLL+rXnCOmk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_BA3510D9333A40DB9D0343A5A2B2D963fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 51dbdb3e-454c-4d92-6653-08d64c063ec4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2018 20:58:22.4202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1488
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-16_11:, , signatures=0
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
X-List-Received-Date: Fri, 16 Nov 2018 20:58:41 -0000

--_000_BA3510D9333A40DB9D0343A5A2B2D963fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

IElzIHRoZXJlIGEgZ29vZCBwbGFjZSBpbiBPcGVuQk1DIHRvIHBvc3QgdGhhdD8gTWF5YmUgdGhl
IGRvY3MgcmVwbz8gSXQncyA0IFBERiBmaWxlcyB3aXRoIDwgMTAgTWlCIGluIHRvdGFsLiBIYXZp
bmcgdGhpcyBpbmZvcm1hdGlvbiBwdWJsaWNseSBwb3N0ZWQgYnkgdGhlbSB3b3VsZCBtYWtlIGRl
dmVsb3BtZW50IG11Y2ggZWFzaWVyLg0KR3JlYXQgdG8gaGF2ZSBzY2hlbWF0aWNzIGFsb25nIHdp
dGggdGhlIHNvdXJjZSBjb2RlIGZvciBiZXR0ZXIgdW5kZXJzdGFuZGluZy4gUXVpY2sgdGhvdWdo
dCB0byBzY2FsZSB0aGlzIGZvciB2YXJpb3VzIG1hY2hpZW5zLiBTaW5jZSB0aGVzZSBzY2hlbWF0
aWNzIGFyZSBzcGVjaWZpYyB0byBhIG1hY2hpbmUsIGhvdyBhYm91dCBzaGFyaW5nIGl0IGluIGEg
bWFjaGluZSBzcGVjaWZpYyByZXBvIGluc3RlYWQgb2YgY29tbW9uIOKAmGRvY3PigJkgcmVwbz8g
TWlnaHQgaGVscCB0byBwcm92aWRlIG1vcmUgY29udGV4dCBmb3IgdGhlIG1hY2hpbmUgaGFyZHdh
cmUuDQoNCg==

--_000_BA3510D9333A40DB9D0343A5A2B2D963fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <CC3CF6387FAD214AB7ED77B72C5FC003@namprd15.prod.outlook.com>
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
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpw
Lm1zb25vcm1hbDAsIGxpLm1zb25vcm1hbDAsIGRpdi5tc29ub3JtYWwwDQoJe21zby1zdHlsZS1u
YW1lOm1zb25vcm1hbDsNCgltc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzsNCgltYXJnaW4tcmlnaHQ6
MGluOw0KCW1zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvOw0KCW1hcmdpbi1sZWZ0OjBpbjsNCglm
b250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNw
YW4uRW1haWxTdHlsZTE4DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQt
ZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHls
ZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMC4wcHQ7fQ0KQHBhZ2UgV29yZFNlY3Rp
b24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBp
bjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+
DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRG
NzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZu
YnNwO0lzIHRoZXJlIGEgZ29vZCBwbGFjZSBpbiBPcGVuQk1DIHRvIHBvc3QgdGhhdD8gTWF5YmUg
dGhlIGRvY3MgcmVwbz8gSXQncyA0IFBERiBmaWxlcyB3aXRoICZsdDsgMTAgTWlCIGluIHRvdGFs
LiBIYXZpbmcgdGhpcyBpbmZvcm1hdGlvbiBwdWJsaWNseSBwb3N0ZWQgYnkgdGhlbSB3b3VsZCBt
YWtlIGRldmVsb3BtZW50IG11Y2ggZWFzaWVyLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+R3JlYXQgdG8gaGF2ZSBzY2hlbWF0aWNzIGFsb25nIHdpdGggdGhlIHNvdXJjZSBj
b2RlIGZvciBiZXR0ZXIgdW5kZXJzdGFuZGluZy4gUXVpY2sgdGhvdWdodCB0byBzY2FsZSB0aGlz
IGZvciB2YXJpb3VzIG1hY2hpZW5zLiBTaW5jZSB0aGVzZSBzY2hlbWF0aWNzIGFyZSBzcGVjaWZp
YyB0byBhIG1hY2hpbmUsIGhvdyBhYm91dCBzaGFyaW5nIGl0IGluIGEgbWFjaGluZSBzcGVjaWZp
YyByZXBvIGluc3RlYWQgb2YNCiBjb21tb24g4oCYZG9jc+KAmSByZXBvPyBNaWdodCBoZWxwIHRv
IHByb3ZpZGUgbW9yZSBjb250ZXh0IGZvciB0aGUgbWFjaGluZSBoYXJkd2FyZS48bzpwPjwvbzpw
PjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4N
CjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_BA3510D9333A40DB9D0343A5A2B2D963fbcom_--
