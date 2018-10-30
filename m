Return-Path: <prvs=4841c10275=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4841c10275=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Lbay9KFt"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="HZ3IyN/7"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42l0kM2nsDzF1Pl
 for <openbmc@lists.ozlabs.org>; Wed, 31 Oct 2018 05:44:22 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9UIcVj3030294; Tue, 30 Oct 2018 11:44:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=J6OON0ROuetauVb6T59YqrQgQVrmH8xzTgUqcdvQ3EU=;
 b=Lbay9KFtCkd0Ewoljg38zKxuC5ImKqx/EPcZQYq4fBykxGF+iYVP5SHBi3NcRuiLTWCP
 ef962zw4OA6mARkhXyoMaUZl/PZAYfdI1AhoibRvkDcmoIztXCB3YLdQ9xzQwwCBUQMD
 egBh4gp5EjgagsOVpyoR2Kc2urT3WHT0l1U= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2netfs0k09-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 30 Oct 2018 11:44:19 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 30 Oct 2018 11:44:03 -0700
Received: from PRN-CHUB02.TheFacebook.com (2620:10d:c081:35::11) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Tue, 30 Oct 2018 11:44:03 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.12) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Tue, 30 Oct 2018 11:44:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6OON0ROuetauVb6T59YqrQgQVrmH8xzTgUqcdvQ3EU=;
 b=HZ3IyN/77qFCWcGZhf9osdzxYKgt2WMiZ8qtlDCaEbzoSUGJ5okSOG/7qA3CGAaOTXW64UZEpz+Bu8JHfov8YgXsI8uIDn+ysqc7OupkHc54hHB6NhLU+EtG5LOQ2rT8QCjva5CFEx0TQnkJ/q74ZnxvP20IIIYtaQ1j7oBum3c=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1325.namprd15.prod.outlook.com (10.175.3.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1273.21; Tue, 30 Oct 2018 18:44:01 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::11cd:add9:dd51:383d]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::11cd:add9:dd51:383d%6]) with mapi id 15.20.1273.027; Tue, 30 Oct 2018
 18:44:01 +0000
From: Sai Dasari <sdasari@fb.com>
To: Andrew Geissler <geissonator@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: Infrastructure Workgroup?
Thread-Topic: Infrastructure Workgroup?
Thread-Index: AQHUcGkKjGSZ7oCERkanVdiE2vlmA6U3quAA
Date: Tue, 30 Oct 2018 18:44:01 +0000
Message-ID: <B607D6AA-DB1A-4E20-85C4-1B1821CDC2EA@fb.com>
References: <CALLMt=qiyO0HHqp3fj=XFqCnMx2XWqR-m8Wn+OgSTGBKS5f=-w@mail.gmail.com>
In-Reply-To: <CALLMt=qiyO0HHqp3fj=XFqCnMx2XWqR-m8Wn+OgSTGBKS5f=-w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5:c7ce]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1325;
 20:RmyzgI499zWvr9IJTdcCPQqACTaU2RKmkOxpu73TsvxNOT4NvpL62oIDnQt/2RrKb2d+GZ13jkaSzHjm9QeD8feSh5CWcnRHdYbTpOyzsVAmjvS8b+og48uEqTaLZSlVA4qgKirOvp0tHlcRBWrveZUyx2B8+ZScBniC4+olwlA=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: d98ae0eb-a5d7-4758-d088-08d63e97a916
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1325; 
x-ms-traffictypediagnostic: MWHPR15MB1325:
x-microsoft-antispam-prvs: <MWHPR15MB1325AAB10FDF41F41ADCBA04CECC0@MWHPR15MB1325.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(5213294742642)(209352067349851)(65623756079841)(85827821059158); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231382)(11241501184)(944501410)(52105095)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1325; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1325; 
x-forefront-prvs: 08417837C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(136003)(366004)(39860400002)(376002)(346002)(396003)(199004)(189003)(446003)(476003)(81166006)(81156014)(46003)(229853002)(486006)(8936002)(6512007)(11346002)(2616005)(53936002)(6436002)(14454004)(2906002)(86362001)(256004)(6246003)(110136005)(25786009)(68736007)(478600001)(3480700004)(14444005)(2900100001)(7736002)(316002)(6116002)(82746002)(7116003)(33656002)(8676002)(305945005)(5250100002)(102836004)(39060400002)(6486002)(97736004)(71200400001)(71190400001)(83716004)(36756003)(105586002)(106356001)(99286004)(6506007)(76176011)(5660300001)(186003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1325;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 6mWTcdvz4nvE6H05Ligw/Ez6dB5QXUchGTynHmAFnLMA3ipErc0xaCZn4KQCVH2onN1S1MWdM23zQ+z/mb1YTLDONmHt333vxFhbaNKDQcThHOUdTBQogkirk8QTnjtL0a2U4tP0vfQneVVDssnDWHzR6gXeDLa/JRdbcdmzSWKgFKpckTVTv6Ek7HkmoA05BzVpGbcaYs64WJZmcK2zRmvQgFrEHJerv3dm605TvTNqU/70Bnbs9PFXe2IRXi87GRcbRiVXYwH0L35DHdyqJbf2KJkUyBPRghUnqvkAvcBW0JBHk0S3GACPgUlIGPeD+30urBGByMMFhDINN4zV3PEqVzoIUdVN0sgHqqmSH7k=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <49CA42419E35C244A0D8EFE39182C4A8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d98ae0eb-a5d7-4758-d088-08d63e97a916
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2018 18:44:01.6551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1325
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-30_11:, , signatures=0
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
X-List-Received-Date: Tue, 30 Oct 2018 18:44:28 -0000

DQoNCu+7v09uIDEwLzMwLzE4LCA4OjU1IEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQW5kcmV3
IEdlaXNzbGVyIiA8b3BlbmJtYy1ib3VuY2VzK3NkYXNhcmk9ZmIuY29tQGxpc3RzLm96bGFicy5v
cmcgb24gYmVoYWxmIG9mIGdlaXNzb25hdG9yQGdtYWlsLmNvbT4gd3JvdGU6DQoNCiAgICBCYXNl
ZCBvbiBzb21lIHJlY2VudCBkaXNjdXNzaW9uIGluIHRoaXMgYXJlYSwgSSdtIGNvbnRlbXBsYXRp
bmcNCiAgICBmb3JtaW5nIGFuIEluZnJhc3RydWN0dXJlIHdvcmtncm91cC4gVGhlIGZvY3VzIHdv
dWxkIGJlIG9uIGltcHJvdmluZw0KICAgIG91ciBDSSBpbmZyYXN0cnVjdHVyZSBhbmQgdGhlIHNj
cmlwdHMgYW5kIHRvb2xzIGFyb3VuZCBpdC4NCiAgICANCiAgICBUaGVyZSdzIGJlZW4gYSBsb3Qg
b2YgZ3JlYXQgY29tbXVuaXR5IGVmZm9ydCBhbHJlYWR5IGFyb3VuZCBvdXIgQ0kNCiAgICBidWls
ZCBzY3JpcHRzLg0KICAgIA0KICAgIFNvbWUgdGhvdWdodHMgb24gZ29hbHM6DQogICAgLSBEb2N1
bWVudGluZyB0aGUgZXhpc3RpbmcgZmxvdw0KICAgIC0gQWx0ZXJuYXRpdmVzIHRvIGV4aXN0aW5n
IGZsb3cgKGFiaWxpdHkgdG8gdXNlIGZyZWVseSBwcm92aWRlcyBjbG91ZHMNCiAgICBmb3Igb3Bl
biBzb3VyY2UgcHJvamVjdHMsIC4uLikNCiAgICAtIE1hbmFnaW5nIHRoZSBKZW5raW5zIG5vZGVz
IC0gQnJpbmdpbmcgbmV3IG5vZGVzIG9ubGluZSBxdWlja2x5DQogICAgKGNoZWYsIHB1cHBldCwg
YW5zaWJsZT8pDQogICAgLSBNYW5hZ2luZyBhbmQgb3B0aW1pemluZyB0aGUgQ0kgZmxvdyAocmVw
b3NpdG9yeSBDSSwgbWV0YSBDSSwgb3BlbmJtYyBDSSkNCiAgICAtLSBXaGljaCBzeXN0ZW1zIGRv
IHdlIGJ1aWxkPw0KICAgIC0gUHJvY2VzcyBmb3IgYWRkaW5nIGhhcmR3YXJlIENJIChtZWNoYW5p
c20gZm9yIGluZGl2aWR1YWxzIHRvIGFkZCBIVw0KICAgIENJIHRvIGdlcnJpdCBjb21taXRzKQ0K
ICAgIC0gT3B0aW1pemF0aW9ucyB0byBleGlzdGluZyBzY3JpcHRzIChkb2NrZXIgYnVpbGRpbmcs
IENJLCBRRU1VKQ0KICAgIC0gR2Vycml0LCBKZW5raW5zLCBhbmQgYnVpbGQgbm9kZSBwZXJpb2Rp
YyB1cGRhdGUgcHJvY2Vzcw0KICAgIC0gT3ZlcmFsbCBtYWludGVuYW5jZSBhbmQgcmVzcG9uc2li
aWxpdGllcyBmb3IgaW5mcmFzdHJ1Y3R1cmUNCiAgICANCiAgICBUaG91Z2h0cyBvciBpbnRlcmVz
dD8NClRoYW5rcyBmb3Igc3RhcnRpbmcgdGhpcyBncmVhdCBpbml0aWF0aXZlISBXaWxsIGJlIGhh
cHB5IHRvIGJlIHBhcnQgb2YgdGhpcyBpbmZyYSB3b3JrZ3JvdXAuICAgIA0KICAgIEFuZHJldw0K
ICAgIA0KDQo=
