Return-Path: <prvs=6906ad8d56=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6906ad8d56=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ImHku3VK"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ZHPu8Sfh"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43VvcL6gVWzDqDh
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 04:12:29 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x03H7ZtJ016308; Thu, 3 Jan 2019 09:12:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=gMds02h+D/sBDIBxseBxzCT1QYw0exFNu8upSbQwFB0=;
 b=ImHku3VK2EuvtE4IH//HkTKgbyheWEwerwbhAt7jJ+KewnvhZhdxxM7eCcN/cb9wZefq
 0ZIz1BAomG7SpjDdZTq43ePrZ7g2AzXM+kyIjw+cS7DgLbh1ZJ9CIpsZu5OP4IZKUl8K
 q/MctoBGEA8YSidTkZQiTNdPRYe4gfndnOo= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2psncqg9ay-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 03 Jan 2019 09:12:26 -0800
Received: from frc-mbx05.TheFacebook.com (2620:10d:c0a1:f82::29) by
 frc-hub04.TheFacebook.com (2620:10d:c021:18::174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 3 Jan 2019 09:11:58 -0800
Received: from frc-hub06.TheFacebook.com (2620:10d:c021:18::176) by
 frc-mbx05.TheFacebook.com (2620:10d:c0a1:f82::29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 3 Jan 2019 09:11:58 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.76) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Thu, 3 Jan 2019 09:11:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMds02h+D/sBDIBxseBxzCT1QYw0exFNu8upSbQwFB0=;
 b=ZHPu8SfhHaEloNJkN/mjF5YetXlVNJOy17CTeHcxUUQm4qK/aDQwOqiSFJyCibPLftp3jXQ/Js3USsqDIQeVpxfa9uhQyh3QisqeE5b2Wlb6OM3z6dKzERhcqks69CY+nYsOzOaOJ/vR2JlCzDE3yShf2MxYqM+lYe5ngQ349kc=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1566.namprd15.prod.outlook.com (10.173.235.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.7; Thu, 3 Jan 2019 17:11:57 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::1476:dc37:cf4:ae1b]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::1476:dc37:cf4:ae1b%12]) with mapi id 15.20.1495.005; Thu, 3 Jan 2019
 17:11:57 +0000
From: Sai Dasari <sdasari@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
CC: William Carter <bill@opencompute.org>
Subject: Open Source Firmware Meetup@OCP Global Summit
Thread-Topic: Open Source Firmware Meetup@OCP Global Summit
Thread-Index: AQHUo4duCMBty6AE9kW2ppKAAaoVBA==
Date: Thu, 3 Jan 2019 17:11:56 +0000
Message-ID: <C4CC5FA5-79B9-4B46-88F5-701ED3B98172@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:63f3]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1566;
 20:sL7MANhchsj3A7VhD0+NVY6vCZt3r2Ugp32gaJR1uFuubA2lRBCVf4nYwQSo1IrFm7A+wBFD+bj62L9ETvW/WdmWTXOrMpKWZjPFd61cBnr6A5qqq5CAiwbGnzPCoMEebugOPkAqS9Jgb3uvxBfutQJIO9Y1JH+Gk8e+iZWZE3s=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: a5a1579f-c2c2-40ea-bf0b-08d6719e910c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1566; 
x-ms-traffictypediagnostic: MWHPR15MB1566:
x-microsoft-antispam-prvs: <MWHPR15MB15660C017219A880F72138ABCE8D0@MWHPR15MB1566.namprd15.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(908002)(999002)(11241501185)(5005026)(6040522)(8220060)(2401047)(8121501046)(93006095)(93001095)(10201501046)(3231475)(944501520)(52105112)(3002001)(6041310)(20161123558120)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1566; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1566; 
x-forefront-prvs: 0906E83A25
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(396003)(346002)(366004)(39860400002)(199004)(189003)(2906002)(6116002)(486006)(476003)(316002)(46003)(83716004)(54896002)(6306002)(236005)(6512007)(53936002)(7736002)(8676002)(71200400001)(81166006)(71190400001)(6436002)(36756003)(2616005)(102836004)(6506007)(256004)(14444005)(99286004)(97736004)(6916009)(106356001)(8936002)(81156014)(105586002)(82746002)(5660300001)(186003)(68736007)(25786009)(478600001)(6486002)(14454004)(86362001)(4326008)(410100003)(33656002)(966005)(606006)(15940465004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1566;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0HMk72m8S7uQzXd7OGYMyEyWk+dVOsEdyrZn/QPeynFhB3r9p4weHaAprOr8+dT2wSXfzlD1X0mghqP0NG5V/4t80SPkvqNDB4L7OFd2ipN28ugP3RY9czAESTddeKD06CBxm/zg/le/+UT2EnAq5soCqtgJbIKXXd9L2h4zajwMWQaivAbImzHGJcaFk1DGzJkupVWVZvwEsIC/C6LKfIUPXVYsg2NtUW8K/cGjcczNLyfj/4+XaBI/bPaTFKU9ryqY/FG2hRJGZHL1AJAu6vhDSAxg3cC96+AlrRxeFrgPVG9wvW/0cl4v6yObOxRX
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_C4CC5FA579B94B4688F5701ED3B98172fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a1579f-c2c2-40ea-bf0b-08d6719e910c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2019 17:11:57.0105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1566
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-03_07:, , signatures=0
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
X-List-Received-Date: Thu, 03 Jan 2019 17:12:36 -0000

--_000_C4CC5FA579B94B4688F5701ED3B98172fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGVhbSwNCg0KVGhhbmtzIHRvIE9DUCBGb3VuZGF0aW9uIGZvciBob3N0aW5nIGEgZmlyc3QgZXZl
ciBtZWV0dXAgZm9yIE9wZW4gU291cmNlIEZpcm13YXJlIERldmVsb3BlcnMgYXQgdXBjb21pbmcg
T0NQIGdsb2JhbCBzdW1taXQgQCBodHRwczovL3d3dy5vcGVuY29tcHV0ZS5vcmcvc3VtbWl0L2ds
b2JhbC1zdW1taXQuIFRoaXMgd2lsbCBiZSBhIDItZGF5IGV2ZW50IGFuZCB0aGUgdGVudGF0aXZl
IHNjaGVkdWxlIGNhbiBiZSBmb3VuZCBhdCBodHRwczovLzIwMTlvY3BnbG9iYWxzdW1taXQuc2No
ZWQuY29tL3ZlbnVlL0xMMjArQy4NCg0KVGhlIHB1cnBvc2Ugb2YgdGhpcyBtZWV0dXAgaXMgdG8g
ZW5jb3VyYWdlIGNvbGxhYm9yYXRpb24gYW1vbmcgZmlybXdhcmUgZW5naW5lZXJzIHdvcmtpbmcg
aW4gdmFyaW91cyBPQ1Agd29ya2dyb3VwcyBsaWtlIEhhcmR3YXJlIE1hbmFnZW1lbnQgKE9wZW5C
TUMsIE9wZW5STUMpLCBPcGVuIFN5c3RlbSBGaXJtd2FyZSAoQ29yZWJvb3QsIExpbnV4Qm9vdCwg
VUVGSS9FREtJSSksIFNlY3VyaXR5IChDZXJiZXJ1cywgUEZSIHNvbHV0aW9ucykgZXRjLiAgRWFj
aCBvZiB0aGVzZSBjb21tdW5pdHkgcHJvamVjdHMgYXJlIGVuY291cmFnZWQgdG8gbWFrZSB1c2Ug
b2YgdGhpcyBtZWV0dXAgdG8gYWNjZWxlcmF0ZSBwcm9ncmVzcyBpbiByZXNwZWN0aXZlIGFyZWEu
IEZldyAoYnV0IG5vdCBsaW1pdGVkKSAgdGhpbmdzIHRoYXQgY291bGQgYmUgYWNjb21wbGlzaGVk
IHdpdGggdGhpcyBtZWV0dXAgYXJlOiB0byByZXZpZXcgYW5kIHJldmlzZSByZXF1aXJlbWVudHMv
c3BlY2lmaWNhdGlvbnMvcm9hZG1hcHMsIGhhY2sgYSBmZWF0dXJlIGFuZCB1cHN0cmVhbSBjb2Rl
LCByZXNvbHZlIGFueSBjb21wbGV4IHBlbmRpbmcgaXNzdWVzIGV0Yy4NCg0KRHVlIHRvIGRpdmVy
c2l0eSBvZiBmaXJtd2FyZSB0ZWFtcyBhbmQvb3IgIHByb2plY3RzLCBpdCB3b3VsZCBiZSBncmVh
dCB0byBwbGFuIHRoZSB0b3BpYyBzdHJlYW1zIG9mIGNvbW1vbiBpbnRlcmVzdCBiZWZvcmVoYW5k
IHRvIG1heGltaXplIHRoZSBiZW5lZml0IG9mIHRoaXMgZmFjZSB0byBmYWNlIG1lZXR1cCBvcHBv
cnR1bml0eS4gUGxlYXNlIGZpbmQgYSBzaGFyZWQgZG9jIHRvIGxpc3QgY29tbW9uIHRvcGljcyBv
ZiBpbnRlcmVzdCBAIGh0dHBzOi8vZG9jcy5nb29nbGUuY29tL3NwcmVhZHNoZWV0cy9kLzFjS0FZ
RlAyZkVoZ0JvRUJqR3JDck9BcTYtMDFueVg1M005cnJMYUp4bGs0L2VkaXQ/dXNwPXNoYXJpbmcN
Cg0KUGxlYXNlIGxldCBtZSBrbm93IGZvciBtb3JlIGluZm8gYW5kL29yIGFueSBzdWdnZXN0aW9u
cy4NCg0KVGhhbmtzLA0KU2FpLg0KDQo=

--_000_C4CC5FA579B94B4688F5701ED3B98172fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <2704D5959D640D4E8F12AADDBD52F0CC@namprd15.prod.outlook.com>
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
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpz
cGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNwYW4uYXBwbGUtY29udmVydGVkLXNw
YWNlDQoJe21zby1zdHlsZS1uYW1lOmFwcGxlLWNvbnZlcnRlZC1zcGFjZTt9DQouTXNvQ2hwRGVm
YXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTt9DQpAcGFnZSBXb3JkU2VjdGlvbjEN
Cgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30N
CmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwv
aGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3MiI+
DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImNvbG9yOmJsYWNrIj5UZWFtLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+PG86cD4mbmJzcDs8L286cD48
L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNr
Ij5UaGFua3MgdG8gT0NQIEZvdW5kYXRpb24gZm9yIGhvc3RpbmcgYSBmaXJzdCBldmVyIG1lZXR1
cCBmb3IgT3BlbiBTb3VyY2UgRmlybXdhcmUgRGV2ZWxvcGVycyBhdCB1cGNvbWluZyBPQ1AgZ2xv
YmFsIHN1bW1pdCBADQo8YSBocmVmPSJodHRwczovL3d3dy5vcGVuY29tcHV0ZS5vcmcvc3VtbWl0
L2dsb2JhbC1zdW1taXQiPmh0dHBzOi8vd3d3Lm9wZW5jb21wdXRlLm9yZy9zdW1taXQvZ2xvYmFs
LXN1bW1pdDwvYT48L3NwYW4+LjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+IFRoaXMgd2lsbCBi
ZSBhIDItZGF5IGV2ZW50IGFuZCB0aGUgdGVudGF0aXZlIHNjaGVkdWxlIGNhbiBiZSBmb3VuZCBh
dDxzcGFuIGNsYXNzPSJhcHBsZS1jb252ZXJ0ZWQtc3BhY2UiPiZuYnNwOzwvc3Bhbj48YSBocmVm
PSJodHRwczovLzIwMTlvY3BnbG9iYWxzdW1taXQuc2NoZWQuY29tL3ZlbnVlL0xMMjAmIzQzO0Mi
PjxzcGFuIHN0eWxlPSJjb2xvcjojOTU0RjcyIj5odHRwczovLzIwMTlvY3BnbG9iYWxzdW1taXQu
c2NoZWQuY29tL3ZlbnVlL0xMMjAmIzQzO0M8L3NwYW4+PC9hPi48bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPiZuYnNw
OzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJjYXJl
dC1jb2xvcjogcmdiKDAsIDAsIDApO2ZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7b3JwaGFuczog
YXV0bzt0ZXh0LWFsaWduOnN0YXJ0O3dpZG93czogYXV0bzstd2Via2l0LXRleHQtc2l6ZS1hZGp1
c3Q6IGF1dG87LXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4O3dvcmQtc3BhY2luZzowcHgi
Pg0KPHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj5UaGUgcHVycG9zZSBvZiB0aGlzIG1lZXR1cCBp
cyB0byBlbmNvdXJhZ2UgY29sbGFib3JhdGlvbiBhbW9uZyBmaXJtd2FyZSBlbmdpbmVlcnMgd29y
a2luZyBpbiB2YXJpb3VzIE9DUCB3b3JrZ3JvdXBzIGxpa2UgSGFyZHdhcmUgTWFuYWdlbWVudCAo
T3BlbkJNQywgT3BlblJNQyksIE9wZW4gU3lzdGVtIEZpcm13YXJlIChDb3JlYm9vdCwgTGludXhC
b290LCBVRUZJL0VES0lJKSwgU2VjdXJpdHkgKENlcmJlcnVzLA0KIFBGUiBzb2x1dGlvbnMpIGV0
Yy4gJm5ic3A7RWFjaCBvZiB0aGVzZSBjb21tdW5pdHkgcHJvamVjdHMgYXJlIGVuY291cmFnZWQg
dG8gbWFrZSB1c2Ugb2YgdGhpcyBtZWV0dXAgdG8gYWNjZWxlcmF0ZSBwcm9ncmVzcyBpbiByZXNw
ZWN0aXZlIGFyZWEuIEZldyAoYnV0IG5vdCBsaW1pdGVkKSAmbmJzcDt0aGluZ3MgdGhhdCBjb3Vs
ZCBiZSBhY2NvbXBsaXNoZWQgd2l0aCB0aGlzIG1lZXR1cCBhcmU6IHRvIHJldmlldyBhbmQgcmV2
aXNlIHJlcXVpcmVtZW50cy9zcGVjaWZpY2F0aW9ucy9yb2FkbWFwcywNCiBoYWNrIGEgZmVhdHVy
ZSBhbmQgdXBzdHJlYW0gY29kZSwgcmVzb2x2ZSBhbnkgY29tcGxleCBwZW5kaW5nIGlzc3VlcyBl
dGMuPHNwYW4gY2xhc3M9ImFwcGxlLWNvbnZlcnRlZC1zcGFjZSI+Jm5ic3A7PC9zcGFuPjxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJjYXJldC1jb2xv
cjogcmdiKDAsIDAsIDApO2ZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7b3JwaGFuczogYXV0bzt0
ZXh0LWFsaWduOnN0YXJ0O3dpZG93czogYXV0bzstd2Via2l0LXRleHQtc2l6ZS1hZGp1c3Q6IGF1
dG87LXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4O3dvcmQtc3BhY2luZzowcHgiPg0KPHNw
YW4gc3R5bGU9ImNvbG9yOmJsYWNrIj4mbmJzcDs8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTtmb250LXZh
cmlhbnQtY2Fwczogbm9ybWFsO29ycGhhbnM6IGF1dG87dGV4dC1hbGlnbjpzdGFydDt3aWRvd3M6
IGF1dG87LXdlYmtpdC10ZXh0LXNpemUtYWRqdXN0OiBhdXRvOy13ZWJraXQtdGV4dC1zdHJva2Ut
d2lkdGg6IDBweDt3b3JkLXNwYWNpbmc6MHB4Ij4NCjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+
RHVlIHRvIGRpdmVyc2l0eSBvZiBmaXJtd2FyZSB0ZWFtcyBhbmQvb3ImbmJzcDsgcHJvamVjdHMs
IGl0IHdvdWxkIGJlIGdyZWF0IHRvIHBsYW4gdGhlIHRvcGljIHN0cmVhbXMgb2YgY29tbW9uIGlu
dGVyZXN0IGJlZm9yZWhhbmQgdG8gbWF4aW1pemUgdGhlIGJlbmVmaXQgb2YgdGhpcyBmYWNlIHRv
IGZhY2UgbWVldHVwIG9wcG9ydHVuaXR5LiBQbGVhc2UgZmluZCBhIHNoYXJlZCBkb2MgdG8gbGlz
dCBjb21tb24NCiB0b3BpY3Mgb2YgaW50ZXJlc3QgQCA8YSBocmVmPSJodHRwczovL2RvY3MuZ29v
Z2xlLmNvbS9zcHJlYWRzaGVldHMvZC8xY0tBWUZQMmZFaGdCb0VCakdyQ3JPQXE2LTAxbnlYNTNN
OXJyTGFKeGxrNC9lZGl0P3VzcD1zaGFyaW5nIj4NCmh0dHBzOi8vZG9jcy5nb29nbGUuY29tL3Nw
cmVhZHNoZWV0cy9kLzFjS0FZRlAyZkVoZ0JvRUJqR3JDck9BcTYtMDFueVg1M005cnJMYUp4bGs0
L2VkaXQ/dXNwPXNoYXJpbmc8L2E+DQo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIiBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTtmb250LXZhcmlhbnQt
Y2Fwczogbm9ybWFsO29ycGhhbnM6IGF1dG87dGV4dC1hbGlnbjpzdGFydDt3aWRvd3M6IGF1dG87
LXdlYmtpdC10ZXh0LXNpemUtYWRqdXN0OiBhdXRvOy13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6
IDBweDt3b3JkLXNwYWNpbmc6MHB4Ij4NCjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+Jm5ic3A7
PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9ImNhcmV0
LWNvbG9yOiByZ2IoMCwgMCwgMCk7Zm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDtvcnBoYW5zOiBh
dXRvO3RleHQtYWxpZ246c3RhcnQ7d2lkb3dzOiBhdXRvOy13ZWJraXQtdGV4dC1zaXplLWFkanVz
dDogYXV0bzstd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7d29yZC1zcGFjaW5nOjBweCI+
DQo8c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPlBsZWFzZSBsZXQgbWUga25vdyBmb3IgbW9yZSBp
bmZvIGFuZC9vciBhbnkgc3VnZ2VzdGlvbnMuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCIgc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7Zm9udC12YXJp
YW50LWNhcHM6IG5vcm1hbDtvcnBoYW5zOiBhdXRvO3RleHQtYWxpZ246c3RhcnQ7d2lkb3dzOiBh
dXRvOy13ZWJraXQtdGV4dC1zaXplLWFkanVzdDogYXV0bzstd2Via2l0LXRleHQtc3Ryb2tlLXdp
ZHRoOiAwcHg7d29yZC1zcGFjaW5nOjBweCI+DQo8c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPiZu
YnNwOzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJj
YXJldC1jb2xvcjogcmdiKDAsIDAsIDApO2ZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7b3JwaGFu
czogYXV0bzt0ZXh0LWFsaWduOnN0YXJ0O3dpZG93czogYXV0bzstd2Via2l0LXRleHQtc2l6ZS1h
ZGp1c3Q6IGF1dG87LXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4O3dvcmQtc3BhY2luZzow
cHgiPg0KPHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj5UaGFua3MsPG86cD48L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwg
MCk7Zm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDtvcnBoYW5zOiBhdXRvO3RleHQtYWxpZ246c3Rh
cnQ7d2lkb3dzOiBhdXRvOy13ZWJraXQtdGV4dC1zaXplLWFkanVzdDogYXV0bzstd2Via2l0LXRl
eHQtc3Ryb2tlLXdpZHRoOiAwcHg7d29yZC1zcGFjaW5nOjBweCI+DQo8c3BhbiBzdHlsZT0iY29s
b3I6YmxhY2siPlNhaS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+
PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_C4CC5FA579B94B4688F5701ED3B98172fbcom_--
