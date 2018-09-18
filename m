Return-Path: <prvs=2799d38cdb=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=2799d38cdb=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="BLYKh1cn"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="NehRxa7N"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FG2H64PJzDrS3
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 07:13:59 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8ILCajn013729; Tue, 18 Sep 2018 14:13:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=16SlzkWt4SOUh+3LXl7IE3SFEHJheXf2djvHEJYUHM4=;
 b=BLYKh1cnfSN9uuT+1uNjq08p7tX1C6Hpon7MunWUb+57TnBFWQc8KkYvX5L/BEtwOR1n
 s7MFqeJaGBu1NKIC3zx1WR98STICN93EsCM1KoYz0SzOHycf9F1+QOo4qZxf76wjxhGi
 LQBW62Eqefah+N2HoKHQTmLVltmZynfXYXU= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2mk7uk0881-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 18 Sep 2018 14:13:55 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.18) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Tue, 18 Sep 2018 14:13:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16SlzkWt4SOUh+3LXl7IE3SFEHJheXf2djvHEJYUHM4=;
 b=NehRxa7NF3vXYCXATnP63Lssy6wzpY2Y001l3wWFNkxFi5PqDZ9nubP74sySIThUwS6ExKU/uC857WMauB/N+3GB83JYlp6TKaGGmmJkgcuCawPyzmM5U9ZhQh9sCfzbGrNHH5P6QateB4tpllvYAOcQwfvD+kTTjU5fV4ANO6Y=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1856.namprd15.prod.outlook.com (10.174.255.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1143.18; Tue, 18 Sep 2018 21:13:52 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::853e:9e1f:97d1:71d6]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::853e:9e1f:97d1:71d6%7]) with mapi id 15.20.1143.017; Tue, 18 Sep 2018
 21:13:52 +0000
From: Sai Dasari <sdasari@fb.com>
To: Andrew Geissler <geissonator@gmail.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Stewart Smith
 <stewart@linux.vnet.ibm.com>,
 Joel Stanley <joel.stan@gmail.com>, Jeremy Kerr <jk@ozlabs.org>
Subject: Re: OpenBMC Hackathon @ OpenPower Summit?
Thread-Topic: OpenBMC Hackathon @ OpenPower Summit?
Thread-Index: AQHUT4mLT0VpDUCnykiHSSnL3y5CK6T2exeA//+Ze4A=
Date: Tue, 18 Sep 2018 21:13:52 +0000
Message-ID: <16FCAE4F-97EB-4D32-BB14-5C24578773A6@fb.com>
References: <E434E069-640B-40A5-A08D-6FF893B41182@fb.com>
 <CALLMt=p+dH3e-C2M8L9Zv43vTDw9rcd9MpfcqFXge2aTkzk6Hw@mail.gmail.com>
In-Reply-To: <CALLMt=p+dH3e-C2M8L9Zv43vTDw9rcd9MpfcqFXge2aTkzk6Hw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:bc75]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1856;
 20:ES7MTk/M0sHZawSjPB9wUgWRs5bSucM0+O2DeFIwreS27Vi9qd1KacHuYQVrpZykUoC+rBj4G/6TAbqr5jnU2CAgxawaht7uLRB8RfvIHorKSNo0blX5wYDWJ0gzRC/k9ypeugG4B2B//zoX2rydG56Or9saebhvG/8tODiyNvc=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 26334590-adf7-4f7d-eced-08d61daba2bd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1856; 
x-ms-traffictypediagnostic: MWHPR15MB1856:
x-microsoft-antispam-prvs: <MWHPR15MB18563AA7BC1EEE89AD14D5E0CE1D0@MWHPR15MB1856.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(85827821059158);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(11241501184)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(201708071742011)(7699050);
 SRVR:MWHPR15MB1856; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1856; 
x-forefront-prvs: 0799B1B2D7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(136003)(366004)(376002)(396003)(189003)(199004)(446003)(256004)(6436002)(86362001)(25786009)(6916009)(8676002)(5660300001)(106356001)(1411001)(5250100002)(53936002)(33656002)(2900100001)(76176011)(6486002)(36756003)(4326008)(6512007)(83716003)(82746002)(476003)(316002)(8936002)(2616005)(81156014)(478600001)(14454004)(6246003)(54906003)(229853002)(39060400002)(6116002)(97736004)(68736007)(186003)(305945005)(11346002)(105586002)(6506007)(486006)(46003)(7736002)(99286004)(81166006)(102836004)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1856;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: B1fHIzTbebphl0kOtoGyr/A5pJinT8mmq1Udh6VXis8xfzh3uWDZlo16vgu0GaTmEwxCQCNSB2neyRSe7yskh61doOmt5h60pTVxOVAuw8lGe7M8lzhhq/wyNQVS7TcQBWI8ioO78S3ezftZnnqJUImN+ChFp8rZMXgQo3f0vC0YXGQL/Q/O9LhrlQjQHKHjpZiXBqjKqzfJs2BZJsh4APg/YEHTMR8HAgB13s/f3AEohDvfOZiyfZS4K/Nwq0lDu6obWnPvXgU/X/f0QN8Wsn7TBY+kF8pkAk9KfQCDKEFb+Omp3HTUsji2jXzrdbHmyrhiFeIGKNEA5pC+Zzs2RBLTHRXpTtR/D9trx0DUF5o=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0DC0D3E597EC94FB0A84703FCA5F398@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 26334590-adf7-4f7d-eced-08d61daba2bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2018 21:13:52.4971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1856
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-18_08:, , signatures=0
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
X-List-Received-Date: Tue, 18 Sep 2018 21:14:00 -0000

DQoNCu+7v09uIDkvMTgvMTgsIDE6MjEgUE0sICJBbmRyZXcgR2Vpc3NsZXIiIDxnZWlzc29uYXRv
ckBnbWFpbC5jb20+IHdyb3RlOg0KDQogICAgDQogICAgSGV5IFNhaSwgbG9va3MgbGlrZSBTdGV3
YXJ0LCBKb2VsLCBKZXJlbXksIGFuZCBteXNlbGYgd2lsbCBhbGwgYmUgYXR0ZW5kaW5nLg0KICAg
IA0KICAgIFdlJ3JlIGp1c3QgYnVpbGRpbmcgdGhlIGFnZW5kYSBub3cgYnV0IHdlIHdlcmUgdGhp
bmtpbmcgc29tZSBiYXNpYw0KICAgIG92ZXJ2aWV3cywgdGhlbiBzb21lIGtlcm5lbCBoYWNraW5n
LCBTREsvUUVNVSBoYWNraW5nIChzeXN0ZW1kLA0KICAgIGpvdXJuYWxkLCBzZXJ2aWNlIGludHJv
cyksIGFuZCBzb21lIGN1c3RvbWl6YXRpb24gaGFja2luZyAoYWRkaW5nIG5ldw0KICAgIG1hY2hp
bmUgbGF5ZXIsIGN1c3RvbWl6aW5nIHdlYiBVSSBmb3IgeW91ciBzeXN0ZW0pLiAgQW55IG90aGVy
DQogICAgdGhvdWdodHMvaWRlYXMgZnJvbSB0aGUgZ3JvdXAgYXBwcmVjaWF0ZWQuICBUaGUgb3Zl
cmFsbCBnb2FsIGlzIHRvDQogICAgdGVhY2ggcGVvcGxlIHVuZmFtaWxpYXIgd2l0aCBvcGVuYm1j
IGhvdyB0byBkaXZlIGluIGFuZCBzdGFydCBoYWNraW5nDQogICAgYXQgaXQuIFRoZSBPcGVuQk1D
IGNvbW11bml0eSBoYWNrYXRob24gd2lsbCBiZSBhdCB0aGUgSW50ZWwgc3VtbWl0DQogICAgbWlk
ZGxlIG9mIG5leHQgbW9udGggdXAgaW4gT3JlZ29uLg0KVGhhbmtzIEFuZHJldyEgT3ZlcmFsbCBn
b2FsIGlzIGF3ZXNvbWUgYW5kIGxvb2sgZm9yd2FyZCB0byBtZWV0IGF0IHN1bW1pdCENCiAgICAN
CiAgICANCiAgICANCg0K
