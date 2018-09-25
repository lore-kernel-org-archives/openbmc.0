Return-Path: <prvs=2806a6679a=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=2806a6679a=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="raOev9tI"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="XZ+00iRa"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42KSRK5sxXzF3K0
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 03:16:45 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8PHD7md009004; Tue, 25 Sep 2018 10:16:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=UQTJfLEhdi/kPX5Jd64Nsh553gltjYRHWs/qC5w+NZs=;
 b=raOev9tIED2qwg8Ocr1DgZjILH6I37psnj2cdKA8eyhHw+EWVBkoSEZw5yXvk3hneKT0
 9GaJ+c3RAGevWZE3xsNjhGPQXjacHTP+5fdAHMNBw5SEajh3F6NEyNg+daqHacJSWJWJ
 8o4FM7P1ESUEHnqGokNfhfSskL7WDZx7Jok= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2mqpfarwwn-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Sep 2018 10:16:41 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.22) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 25 Sep 2018 10:16:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQTJfLEhdi/kPX5Jd64Nsh553gltjYRHWs/qC5w+NZs=;
 b=XZ+00iRaioeQPJoAKzy6rMrllvcmCmu4BVej4UE8Dhfh/By8OO5vtEN0fYI4cXVPpvaDZJEmgSjU6zz5gpDa+qhkT5uvYhx7gELeWmc7LffcJDCNKCHjRY/VYVA1SlPwuxVJ2gCr0/ACr3yLuIq0kDeHEQWUv3HkatYopIFn9Aw=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1325.namprd15.prod.outlook.com (10.175.3.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.25; Tue, 25 Sep 2018 17:16:38 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::853e:9e1f:97d1:71d6]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::853e:9e1f:97d1:71d6%7]) with mapi id 15.20.1143.019; Tue, 25 Sep 2018
 17:16:38 +0000
From: Sai Dasari <sdasari@fb.com>
To: Andrew Geissler <geissonator@gmail.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Stewart Smith
 <stewart@linux.vnet.ibm.com>,
 Joel Stanley <joel.stan@gmail.com>, Jeremy Kerr <jk@ozlabs.org>
Subject: Re: OpenBMC Hackathon @ OpenPower Summit?
Thread-Topic: OpenBMC Hackathon @ OpenPower Summit?
Thread-Index: AQHUT4mLT0VpDUCnykiHSSnL3y5CK6T2exeA//+Ze4CACwMwgP//utkA
Date: Tue, 25 Sep 2018 17:16:37 +0000
Message-ID: <937C5B58-38CB-44C0-8F49-63019A5049B3@fb.com>
References: <E434E069-640B-40A5-A08D-6FF893B41182@fb.com>
 <CALLMt=p+dH3e-C2M8L9Zv43vTDw9rcd9MpfcqFXge2aTkzk6Hw@mail.gmail.com>
 <16FCAE4F-97EB-4D32-BB14-5C24578773A6@fb.com>
 <CALLMt=rEH2wBzB5RrHJTG93AgHJB-DaG7pJVs9_UNrktpoau1g@mail.gmail.com>
In-Reply-To: <CALLMt=rEH2wBzB5RrHJTG93AgHJB-DaG7pJVs9_UNrktpoau1g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:4c5b]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1325;
 20:2FxM2ZZi7IQNp9fkGe3qzE+/JSuhZPZrtj2LMGFACuw7FjS+0WqVd0sAQQsMJ0kNjvm+C4vvSfC+bsbq7lvhooWMbkGPuQdaq7smN0t3MDE6BdqlSEgRrY5d2xq8UNJKhV3KJl8fcEASwqNtd0peebYmNQJbGQQu+64kJwZzAWc=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 43d40e63-e889-4915-b00a-08d6230aa71f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1325; 
x-ms-traffictypediagnostic: MWHPR15MB1325:
x-microsoft-antispam-prvs: <MWHPR15MB132521E2DA8D703EE5BC6D2ACE160@MWHPR15MB1325.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(10436049006162)(85827821059158);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(3231355)(11241501184)(944501410)(52105095)(149066)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699051);
 SRVR:MWHPR15MB1325; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1325; 
x-forefront-prvs: 08062C429B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(396003)(136003)(39860400002)(366004)(199004)(189003)(81166006)(39060400002)(81156014)(68736007)(8676002)(5250100002)(71200400001)(34290500001)(71190400001)(83716004)(8936002)(25786009)(46003)(4326008)(186003)(33656002)(486006)(446003)(11346002)(2616005)(476003)(7736002)(305945005)(105586002)(102836004)(106356001)(6306002)(229853002)(53936002)(14454004)(966005)(478600001)(97736004)(2900100001)(6486002)(6512007)(6436002)(2906002)(6246003)(36756003)(316002)(93886005)(6116002)(6916009)(53546011)(6506007)(1411001)(99286004)(82746002)(54906003)(76176011)(86362001)(5660300001)(575784001)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1325;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Luy+gH6Gj//ECOOmG/L74GX+J7SSdQQZgXEHzOjwI3iAp2Qninls3L3W9B8mfljEg6FimRAffOXOKs8sdUlo3dB2YFJWlOgYLU0KoyG7PoS7ylYHqxC6qMPY5S6/agMhNM78DFUY3U4zWXMP2p3f0ROWVQeUWB5051Hgsx4KY3j1BMRlg1QEP7kb6hhfd/QSTRzieGT0/IsRunyqGF3i8KGFCe3WXcIk3HEqDGas7pWlbaExcxdsele2TgE5x92G+ZmIRpYSIF+evgvHrB8ctU6IGKJivgKHN+q+mF6O7UwWBAluQtc9FalhUA8J3hzrD5XIHKcmE7CpASdpA6HeY3pH+jFQkPzWCTDpkNUPF0E=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <260DB25168E29A4CB21B2E3F7922024F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d40e63-e889-4915-b00a-08d6230aa71f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2018 17:16:37.8359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1325
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-25_10:, , signatures=0
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
X-List-Received-Date: Tue, 25 Sep 2018 17:16:46 -0000

T24gOS8yNS8xOCwgNzoyNCBBTSwgIkFuZHJldyBHZWlzc2xlciIgPGdlaXNzb25hdG9yQGdtYWls
LmNvbT4gd3JvdGU6DQogDQogICAgSSd2ZSBzdGFydGVkIHRoZSBzZXJpZXMgb2YgZG9jIHVwZGF0
ZXMgaW4NCiAgICBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0
cHMtM0FfX2dlcnJpdC5vcGVuYm1jLTJEcHJvamVjdC54eXpfLTIzX2Nfb3BlbmJtY19kb2NzXy0y
Ql8xMjk5NCZkPUR3SUZhUSZjPTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmcj1EODA0QmJfZzhGa0lh
Q2pqYl9yZzdBJm09eXIzSm5ReExMVUVTeDE2Y3hYQ1g0aGlReXZMVXNYaEw1SWVETy1vbV9jOCZz
PXZ5bElMT1ZPc3d0YVBHeXoyMlJPVXd3d24wYzdqYTNaMkY2Q2NTUFlwc3MmZT0NCiAgICANCiAg
ICBGZWVkYmFjayBhbHdheXMgd2VsY29tZS4gVGhlIGdvYWwgaXMgdG8gaGF2ZSBzbWFsbCB0dXRv
cmlhbHMgdGhhdA0KICAgIHBlb3BsZSBjYW4gZm9sbG93IHRvIGdldCB1cA0KICAgIGFuZCBnb2lu
ZyB3aXRoIE9wZW5CTUMgZGV2ZWxvcG1lbnQuICBXZSdsbCBiZSB3YWxraW5nIHRocm91Z2ggdGhl
c2UNCiAgICB3aXRoIHBlb3BsZSBhdCB0aGUgdXBjb21pbmcgc3VtbWl0Lg0KVGhhbmtzIEFuZHJl
dyEgTG92ZSB0aGlzIGdyZWF0IGVmZm9ydCB0byBvbmJvYXJkIG5ldyBlbmdpbmVlcnMgdG8gdGhl
IGNvbW11bml0eSEhDQogICAgDQogICAgRnV0dXJlIGRvY3MgSSdtIHRoaW5raW5nIGFyZToNCiAg
ICAtIEFkZGluZyBhIG5ldyBzeXN0ZW1zIChiaXRiYWtlIGxheWVyLCBrZXJuZWwgY2hhbmdlcykN
CiAgICAtIFN5c3RlbWQgcGhvc3Bob3Igc2VydmljZSBtYW5pcHVsYXRpb24gYW5kIHVzYWdlDQog
ICAgLSBEZWJ1Z2dpbmcNCiAgICAtIE1heWJlIHRha2luZyBzb21lb25lIHRocm91Z2ggdGhlIHBy
b2Nlc3Mgb2YgYSBnZXJyaXQgY29tbWl0LCBkb24ndA0KICAgIHdhbnQgdG8gYmUgcmVkdW5kYW50
IHdpdGggb3VyIGV4aXN0aW5nIGRvYyB0aG91Z2gNCiAgDQoNCg==
