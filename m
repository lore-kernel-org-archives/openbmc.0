Return-Path: <prvs=2807791ea6=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2807791ea6=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="o2cxlxTW"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="jPkgdHmF"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42L7Cy5bZ3zF3Ld
 for <openbmc@lists.ozlabs.org>; Thu, 27 Sep 2018 05:24:14 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.22/8.16.0.22) with SMTP id w8QJDd0b005070;
 Wed, 26 Sep 2018 12:24:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=BpfUGmbFSR4JxL5CVzRg5+k1anNQskTY2XillAo1v14=;
 b=o2cxlxTWCrPGnNuuz6dxy2dI+qPIpf5tEz/vVhYdROBIenS468k3j4o+QzAZFv2P58To
 B/UpwCeYICCtYIUMAOsgotf4SxQU90++a48v8O/qzWJWRrGT2/dEx7TJgtkx1RCPz+wS
 2eocvPU2/yJoXIFl0LNwEI2lcPOsOifDoMU= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2mretj8f80-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 26 Sep 2018 12:24:05 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.18) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Wed, 26 Sep 2018 12:24:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpfUGmbFSR4JxL5CVzRg5+k1anNQskTY2XillAo1v14=;
 b=jPkgdHmFvsUa90L8M6Ke8ha4EItmeXKiK4vamVbP2zsVH1ilgDxaY4qaSSQlkM2LR/f6nLdqab7tVEQ8xlNOAlOzBo0QoqTGpumGIyAioSBKKFEpqoc2PhBnX3zo1umP0sawfRRaDmYdm4m7RICuF4aF0mf+EZo5sQG+MzqeJuk=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1909.namprd15.prod.outlook.com (10.174.54.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.25; Wed, 26 Sep 2018 19:24:03 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::3cb5:8b7b:eafb:d86c]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::3cb5:8b7b:eafb:d86c%5]) with mapi id 15.20.1143.019; Wed, 26 Sep 2018
 19:24:03 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Geissler <geissonator@gmail.com>, Amithash Prasad <amithash@fb.com>
CC: Patrick Venture <venture@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: [Potential Spoof] Re: Link-up between Gerrit & Github
Thread-Topic: [Potential Spoof] Re: Link-up between Gerrit & Github
Thread-Index: AQHUVc57tQfuWqgSWECE6fpq6Opj6w==
Date: Wed, 26 Sep 2018 19:24:03 +0000
Message-ID: <1D9A9EDE-5BEC-47AF-BA2B-3BA5DC173EDF@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:26f]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1909;
 20:oWFxWMNGh2IiqRuNR3jb9Pe3FpJ/O+dfu91uoDpgnnQz08mppziRFMJDvR40l4qHBDqQ3sNCkh9LJBlJjwyfuhzVIYR827nBzvHyhwo64/QC63z6+LFo+e507gzWq5InBUN8eagLR01Opj9QGOU/oPCy0+yATLwNX+Mp8h9iD3U=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(366004)(376002)(39860400002)(396003)(346002)(136003)(57704003)(189003)(199004)(486006)(478600001)(105586002)(46003)(106356001)(14454004)(39060400002)(6436002)(82746002)(6246003)(2900100001)(2616005)(6486002)(54906003)(110136005)(36756003)(476003)(97736004)(99286004)(33656002)(6512007)(229853002)(316002)(5250100002)(305945005)(2906002)(5660300001)(6116002)(53936002)(25786009)(256004)(6636002)(6506007)(68736007)(102836004)(14444005)(83716004)(71200400001)(8676002)(81166006)(81156014)(34290500001)(186003)(7736002)(71190400001)(4326008)(86362001)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1909;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-correlation-id: 335ea8c8-a155-4981-1d13-08d623e59e5e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1909; 
x-ms-traffictypediagnostic: CY4PR15MB1909:
x-microsoft-antispam-prvs: <CY4PR15MB19093F4D4EDB6EB749B959A6DD150@CY4PR15MB1909.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231355)(11241501184)(944501410)(52105095)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051);
 SRVR:CY4PR15MB1909; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1909; 
x-forefront-prvs: 08076ABC99
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: PbQ1V4x5bLPLQT/gpAyghtbHqEZCOesL6pL0EAfyUsCNG3llM/2zCW8Hy1GrD6RNPVEZcwGFGxtBfoEOvZIGVf47isZ2aylnh8yk1xstM4KawitrbG/89QFg/fs16TQArPB7RdZWU7CuYcHAXe7NDWiBekg83OnnxEpRKH6YNTppZZUD5wf6wgiWgnDxJKGj+dlwQA2bx3ajAfNUO+xIv6Rpw3UmoHqU8ufnV86onOSNRAESpT7AnO6+OCa0/sQqMdi/v9+alaycaUxloQzjIsmPt5TyoPlCrE77MPAw6dvg0EJ/HNe14a5d0t3V7kzOBrh+hXuN6m4csuYEiP6hhcZ4RZWEI6moX1zi7eoJ1sk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EE8898658282E47B5E8C705E173B0D8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 335ea8c8-a155-4981-1d13-08d623e59e5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2018 19:24:03.0364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1909
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
X-List-Received-Date: Wed, 26 Sep 2018 19:24:15 -0000

ICAgIA0KICAgICAgICA+ID4gPiBJIGRpZCB0aGUgcmVzdGFydCBhbmQgc2F3IHNvbWUgb2Ygb3Vy
IG5ldyByZXBvcyBnZXQgc3luY2hlZCB1cA0KICAgICAgICA+DQogICAgICAgID4gQW5kcmV3LCBJ
IHRoaW5rIGl0J3MgdGltZSB0byByZXN0YXJ0IHRoZSBnZXJyaXQgc2VydmVyIGFnYWluISBJIGRv
bid0IHNlZSBwYXRjaGVzICsyZCBvbiBnZXJyaXQgZm9yICh0aGUgbmV3bHkgYWRkZWQpIG1ldGEt
ZmFjZWJvb2sgc2hvd2luZyB1cCBvbiBnaXRodWIgOi0oDQogICAgICAgIA0KICAgICAgICBEb25l
IQ0KICAgICAgICANCiAgICAgICAgPg0KICAgID4gICAgSSBzZWUgbWV0YS1mYWNlYm9vayBnb3Qg
c3luY2VkIHVwLiBCdXQgSSBkb24ndCBzZWUgbWV0YS1mYWNlYm9vayB1bmRlciBvcGVuYm1jLyBs
aWtlIG90aGVyIHJlcG8uIERvIEkgbmVlZCB0byBjcmVhdGUgc29tZSByZXF1ZXN0IHRvIGdldCBp
dCBpbmNsdWRlZCB1bmRlciBvcGVuYm1jIGRpcmVjdG9yeQ0KDQpOZXZlciBtaW5kLCBJIHNlZSBC
cmFkIGhhcyBwdXQgdGhpcyBmb3IgbWVyZ2UgaW50byBvcGVuYm1jLg0KICAgIA0KICAgIA0KDQo=
