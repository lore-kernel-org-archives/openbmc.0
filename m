Return-Path: <prvs=9688b6f0ed=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=9688b6f0ed=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="CelELz9F"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="LCV5i4ei"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40x0fp5zxyzDrWY
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 05:15:26 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4UJEZME026263; Wed, 30 May 2018 12:15:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=xJw8IU7L3Q5WIlfFses3Ar6AV4iSSQPgW8OalBKkcI8=;
 b=CelELz9FMzGiI0W0sd/3stBvro5CwijVGhTpL0ZI6fibEA3XsrTsZgQXeDsimQ8pYLBK
 4zwaFR355piX+9lGOvxeIyze/4pmM2uHFTH2Owj/1xf1qAx2vHS41czPTqiBsmD2dq45
 lgi72iRqLqJAQ5OPAVgVsYnnodvjQV/ovSs= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2ja05crax8-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 30 May 2018 12:15:21 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.19) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Wed, 30 May 2018 12:15:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJw8IU7L3Q5WIlfFses3Ar6AV4iSSQPgW8OalBKkcI8=;
 b=LCV5i4eiWf5YM0FnS9rfKavVZ/cQNq3jaYGsU3k4GOMoxwSOJ9W00Hvl3Cxfm0dEnMO6VKK1IuNdb8rKWpnuVjRmoxiXUQvsL5b11SQAbW//9ZBYLc0KC4XfkO7y8kSNMOnX5FNSU0JC/EM4TdC4QRnmjVcabMD7SLmlEnK//G0=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1934.namprd15.prod.outlook.com (10.174.100.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.797.11; Wed, 30 May 2018 19:15:18 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::68b3:f3a8:a48c:692a]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::68b3:f3a8:a48c:692a%13]) with mapi id 15.20.0797.020; Wed, 30 May
 2018 19:15:18 +0000
From: Tao Ren <taoren@fb.com>
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Linux kenrel: Moving to a 4.17 base
Thread-Topic: Linux kenrel: Moving to a 4.17 base
Thread-Index: AQHT9/MguB54HNmjTEKXQMdT3gHvwqRIL9YA
Date: Wed, 30 May 2018 19:15:17 +0000
Message-ID: <DDD3C229-D613-4FB5-8A5B-D80ADC51CF6F@fb.com>
References: <CACPK8XfTDqprASF==8wjeH+KnpECiJHrSiQ9ugYuBEe+RM4tgw@mail.gmail.com>
In-Reply-To: <CACPK8XfTDqprASF==8wjeH+KnpECiJHrSiQ9ugYuBEe+RM4tgw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:4c8d]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1934;
 7:3rFo0N8XVm5yB5GmVZDDtZg4sEqiIr4e4+/Q/ZiZ+J8yDD+DIdqE9Hqw/TNmjmzrAO3zf0B0NS06Kx0QRpUVA/aE8DZMxBmOZ0m2PU3C/Hkeeg1YlvDuhY2vNvzFuqF5KH/xCpt+46gom+QnKt/zgyJWzKhVVDn8qG1t+rQSxQjEJWnWUn3rgX7zQ4uxUXKWpzYqXu0dJwktvPU1nri7ZrLJSu8AnC0p3S7LDANlF0kiHkjqyrGLwKElBnlhL9cb;
 20:etdacjiJTNTr4OLwEQxkasdbu482EhyKqN56ZC+aLo0f+LtutgdlXbY79WmuEwRvV5UxKcJnL1eco6cBozEgdX/xGq1CQ5ujf6q7+ITX1tXhft1cdQrLobj7l2S1igsqQhrbD33ZJDcnW3RYNLvpSeovHj8g7zq371JJYObL+m8=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1934; 
x-ms-traffictypediagnostic: MWHPR15MB1934:
x-microsoft-antispam-prvs: <MWHPR15MB1934CEB0BD34771FEBDF4910B26C0@MWHPR15MB1934.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(85827821059158)(67672495146484)(81227570615382); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(3231254)(11241501184)(944501410)(52105095)(10201501046)(149027)(150027)(6041310)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(6072148)(201708071742011)(7699016);
 SRVR:MWHPR15MB1934; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1934; 
x-forefront-prvs: 0688BF9B46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(39860400002)(376002)(346002)(39380400002)(189003)(199004)(478600001)(6486002)(966005)(2900100001)(14454004)(6116002)(86362001)(229853002)(6512007)(5250100002)(106356001)(105586002)(6436002)(82746002)(476003)(11346002)(486006)(2616005)(76176011)(99286004)(446003)(305945005)(7736002)(33656002)(46003)(25786009)(36756003)(53936002)(6506007)(59450400001)(102836004)(53546011)(186003)(5660300001)(6306002)(68736007)(6916009)(83716003)(316002)(8936002)(3280700002)(3660700001)(8676002)(81156014)(4326008)(2906002)(81166006)(345774005)(6246003)(97736004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1934;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: iUsiN8H/AJ+u9dwlDxRaBrWPjsHN3CdQrl30ApTvZYRFF8MQnHMJCcrMFG0EydxgOubQjEY1biQosJfa6U5u8BvEPzXMbW8e0GRzJivIO6BGIr4wKbsCbptrQMK/csGOG5jvCULGdpIXBEjJbww9gJ5xy/V61nXliTIhVJO+daOEH62VbJ2wYp/3v6xXOLxW
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1335575C33E6046BDD1E01E443D2C02@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 4aeed7f8-2536-420a-8994-08d5c661ae40
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aeed7f8-2536-420a-8994-08d5c661ae40
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2018 19:15:17.8823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1934
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-30_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2018 19:15:32 -0000

R290IGl0LiBUaGFuayB5b3UgSm9lbCBmb3IgdGhlIGRldGFpbGVkIGluZm8uDQoNCg0KVGhhbmtz
LA0KDQpUYW8NCg0K77u/T24gNS8zMC8xOCwgMTo0OSBBTSwgImpvZWwuc3RhbkBnbWFpbC5jb20g
b24gYmVoYWxmIG9mIEpvZWwgU3RhbmxleSIgPGpvZWwuc3RhbkBnbWFpbC5jb20gb24gYmVoYWxm
IG9mIGpvZWxAam1zLmlkLmF1PiB3cm90ZToNCg0KICAgIEhlbGxvIFRhbywNCiAgICANCiAgICBP
biAzMCBNYXkgMjAxOCBhdCAxNzo1NywgVGFvIFJlbiA8dGFvcmVuQGZiLmNvbT4gd3JvdGU6DQog
ICAgPiBUaGlzIGlzIGdyZWF0IG5ld3MhIEknbSBmcm9tIEZhY2Vib29rIE9wZW5CTUMgdGVhbSwg
YW5kIEknbSB3b3JraW5nIG9uIGVuYWJsaW5nIHlvdXIgTGludXggdHJlZSBpbiBGYWNlYm9vayBP
cGVuQk1DIGFuZCBsYXRlciBjb250cmlidXRpbmcgZml4ZXMgYmFjayB0byB0aGUgY29tbXVuaXR5
Lg0KICAgIA0KICAgIFRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrLg0KICAgIA0KICAgID4gSSBm
b3VuZCBhIGxvdCBvZiBnb29kIGRvY3VtZW50cyBhYm91dCBob3cgdG8gY29udHJpYnV0ZSBjb2Rl
LCBidXQgSSBjYW5ub3QgZmluZCBpbmZvcm1hdGlvbiByZWdhcmRpbmcgYnJhbmNoaW5nIHN0cmF0
ZWd5IGFuZCByZWxlYXNlIHRpbWVsaW5lLiBGb3IgZXhhbXBsZSwNCiAgICA+DQogICAgPiAxKSB3
aGF0IGFyZSB0aGUgbWFqb3IgcmVhc29ucy9mYWN0b3JzIHRvIHRyaWdnZXIgdGhlIHZlcnNpb24g
dXBncmFkZSAoNC4xMCB0byA0LjEzIGFuZCB0aGVuIDQuMTcpPw0KICAgID4NCiAgICA+IDIpIEFy
ZSB3ZSBwbGFubmluZyB0byBrZWVwIE9wZW5CTUMgbGludXgga2VybmVsIGluLXN5bmMgd2l0aCBU
b3J2YWxkcydzIHRyZWUgb3IgbGludXggc3RhYmxlIHRyZWU/DQogICAgPg0KICAgID4gMykgU2lu
Y2Ugd2UgYXJlIGRpc2N1c3NpbmcgT3BlbkJNQyByZWxlYXNlIHNjaGVkdWxlIGluIGFub3RoZXIg
dGhyZWFkLCBJJ20gY3VyaW91cyBob3cgdG8gYWxpZ24gbGludXggdHJlZSB3aXRoIE9wZW5CTUMg
cmVsZWFzZSBzY2hlZHVsZT8gRm9yIGV4YW1wbGUsIGNyZWF0aW5nIHRhZ3MgZm9yIE9wZW5CTUMg
cmVsZWFzZXM/DQogICAgDQogICAgTGFzdCB5ZWFyIEkgY2FtZSB1cCB3aXRoIGEgZGV2ZWxvcG1l
bnQgcHJvY2VzcyB0aGF0IGFpbWVkIGZvciB2ZXJ5DQogICAgcmVndWxhciByZWJhc2luZyBvbiB1
cHN0cmVhbToNCiAgICANCiAgICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvbGludXgvd2lr
aS9EZXZlbG9wbWVudFByb2Nlc3Mjb3BlbmJtYy1rZXJuZWwtbWFpbnRhaW5lcg0KICAgIA0KICAg
IFRoaXMgd2FzIG9wdGltaXN0aWMuIEluIHByYWN0aWNlLCBJJ3ZlIG5vdCBoYWQgdGhlIHRpbWUg
dG8gZG8gdGhpcyBhcw0KICAgIG9mdGVuIGFzIEkgd291bGQgbGlrZS4gV2UgaGF2ZSBzcGVudCBh
IGxvdCBvZiBlZmZvcnQgaW4gdGhlIHBhc3QgeWVhcg0KICAgIG9uIGlzIGdldHRpbmcgY29kZSB1
cHN0cmVhbSwgc28gdGhhdCBtb3ZpbmcgdG8gYSBuZXcgYmFzZSBpcyBhcyBlYXN5DQogICAgYXMg
cG9zc2libGUuDQogICAgDQogICAgSSB3b3VsZCBsaWtlIHRvIHByb3Bvc2Ugd2UgdHJ5IHRvIG1v
dmUgdG8gdGhlIG5ldyBrZXJuZWwgYmFzZSBhcw0KICAgIG1haW5saW5lIG1ha2VzIGEgbmV3IHJl
bGVhc2UuIFRoaXMgd291bGQgbWVhbiBhIHRocmVlIG1vbnRobHkgY2FkZW5jZSwNCiAgICB3aXRo
IHRoZSB0cmlnZ2VyIGJlaW5nIHRoZSB0YWdnaW5nIG9mIHRoZSBmaW5hbCByZWxlYXNlLg0KICAg
IA0KICAgIEJ5IGtlZXBpbmcgaW4gc3luYyB3aXRoIHVwc3RyZWFtLCB3ZSB3aWxsIGhhdmUgY29t
bXVuaXR5IHN1cHBvcnQgZnJvbQ0KICAgIHRoZSBzdGFibGUgdHJlZS4gSSB3aWxsIG1lcmdlIHRo
ZXNlIHBvaW50IHJlbGVhc2VzICh0aGUgeiBpbiB4LnkueiwgZWcNCiAgICA0LjE3LnopIGluIGFz
IHRoZXkgYXJlIHJlbGVhc2VkLg0KICAgIA0KICAgIE15IGdvYWwgaXMgdG8gaGF2ZSBPcGVuQk1D
IHByb2R1Y3RzIHNoaXBwaW5nIG1haW5saW5lIGtlcm5lbHMgd2l0aCBubw0KICAgIGZ1cnRoZXIg
cGF0Y2hlcy4gV2UgYXJlIHZlcnkgY2xvc2UgdG8gdGhpcyBnb2FsIGZvciBPcGVuUG93ZXIgUG93
ZXI5DQogICAgbWFjaGluZXMsIGFuZCBJIGxvb2sgZm9yd2FyZCB0byBzdXBwb3J0aW5nIG90aGVy
IHBsYXRmb3JtcyBhY2hpZXZlDQogICAgdGhpcyB0b28uDQogICAgDQogICAgQSBub24tZ29hbCBp
cyB0byBtYWludGFpbiBhIGxvbmctbGl2ZWQgc3RhYmxlIHRyZWUsIGFzIHRoaXMgdGFrZXMgdGlt
ZQ0KICAgIGF3YXkgZnJvbSB0aGUgZmlyc3QgZ29hbC4NCiAgICANCiAgICBDaGVlcnMsDQogICAg
DQogICAgSm9lbA0KICAgIA0KDQo=
