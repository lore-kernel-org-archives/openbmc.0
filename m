Return-Path: <prvs=5890bfcd82=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5890bfcd82=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="WAEFzOzf"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="eiZOqKAR"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43K8Pm2PpvzDq6P
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 07:14:35 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wBIKBOa3003001; Tue, 18 Dec 2018 12:14:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=y6QPv7OTkmy087OoBvtHyeGtqiP38DKvf4bU9bkricA=;
 b=WAEFzOzfhvYLkOMO9XLZPlo+Qm4Cx2WJ0jcMzSVynYhgDtFncDc3A05C9PYSWDmvsweb
 8bOkdmfjHHnfbD6GlFNEp/tIZrJB+nftdVlLPp94KGwK1JQpYBHL1J9DBSRKhG+s8ohy
 V46SA50CWZ8klr4lYS57adHOUXwBd6uiPA8= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2pf4fhgksu-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 18 Dec 2018 12:14:28 -0800
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 18 Dec 2018 12:13:39 -0800
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 18 Dec 2018 12:13:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6QPv7OTkmy087OoBvtHyeGtqiP38DKvf4bU9bkricA=;
 b=eiZOqKARPy5rhilzJd1VupQZyKrQv8iZmcXymohew0tYnYf6K+gu9052/J4xXIWA+HzIi+KW91cPb5y79qf9kxG8fGEnL4LNhH1EQ/+Wl4AEWV91WNAiBNSEvFHEZ1xEZ3gzpx2E/ehr+cbZx7M2gwrdjxWFc6CBoFxHZAkV4OE=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1383.namprd15.prod.outlook.com (10.172.160.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.22; Tue, 18 Dec 2018 20:13:38 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1bd:fa86:857:9b04]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1bd:fa86:857:9b04%10]) with mapi id 15.20.1446.018; Tue, 18 Dec 2018
 20:13:38 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>,
 =?utf-8?B?R2VvcmdlIExpdSjliJjplKHkvJ8p?= <liuxiwei@inspur.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Fan speed control
Thread-Topic: Fan speed control
Thread-Index: AQHUlmPa9RVzvtJvukS7iw8SULIx56WD/TCAgAC7RgD//5vIAIAAh1wA//+N04A=
Date: Tue, 18 Dec 2018 20:13:38 +0000
Message-ID: <603F58E2-C3DB-4FB1-99FD-EB407EE2BA88@fb.com>
References: <4E117ED9-B492-4197-A66F-45949E3D7178@fb.com>
 <CAHkHK09SisQ0s765c1DOV7Pe8NMOKw-UM+xe8dYdt5BWA-O9vQ@mail.gmail.com>
 <a3125cb9-f3f8-2314-ea2f-1787b5292dd2@linux.intel.com>
 <E60EE44E-09FB-4D78-897B-CD0D0567929A@fb.com>
 <93064318-a17b-624b-89a0-033cb2cd8fa6@linux.intel.com>
In-Reply-To: <93064318-a17b-624b-89a0-033cb2cd8fa6@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:5cc9]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1383;
 20:n2hY15F1vKmm5Ivir2tTXgmXXNHcY4FN4/1abuoWJBWORcfL+bqwZxSmAWF4jSPfsx8vZvuHgiHcR86exmJ+NBHczTgxOZt9abcrovBLtSmtJzpQVYW4p4hwbj1k2s6o3AQPyTQ+a6O1Xi5HDD6DVI5IzLD9sjK35ZAbULgVbu4=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: ad827e51-65e0-4a07-fc09-08d665254c4a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1383; 
x-ms-traffictypediagnostic: CY4PR15MB1383:
x-microsoft-antispam-prvs: <CY4PR15MB138388C5F5C8B76D4CCE0E27DDBD0@CY4PR15MB1383.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(11241501185)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(3231475)(944501520)(52105112)(93006095)(93001095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1383; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1383; 
x-forefront-prvs: 08902E536D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(376002)(136003)(39860400002)(346002)(199004)(189003)(6116002)(558084003)(446003)(6246003)(14454004)(4326008)(256004)(53936002)(2906002)(110136005)(7116003)(305945005)(966005)(6306002)(6512007)(93886005)(102836004)(97736004)(86362001)(99286004)(6436002)(6506007)(36756003)(33656002)(76176011)(229853002)(7736002)(81156014)(2616005)(81166006)(478600001)(186003)(71190400001)(83716004)(71200400001)(68736007)(476003)(5660300001)(316002)(46003)(82746002)(105586002)(8676002)(11346002)(106356001)(3480700005)(6486002)(486006)(8936002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1383;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: M6Ohto+wgc2SRWzhRsiEjCs9BOqOnmvLoHM99qypB7UHtvgB/nBHxllE/JCsFZpzeDybJaeC5OW4a8SoSekH7IMy3WBYBh0OvxhED/TH2mdGMznRDsa/beB/rIKoPQUt5a6nFkXFn/G9Z/ymPvQtx0V1wOTC/ND0az9B5Y30/+IUcrFKPUbg5nGaRc8Yo1N7oGfxpocnJPY17N6iqeeE2F0FdcHKg+0tz57Te9PB8nk2wV7X3yozQ+rrKH7tdbDWXkN+K1tCvonLIlu5xO2CRnUFeaPg6fth73QY4wCGl9x+u/f7itSEsp0G2ruJ+0cv
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <4968A5702A3714478A525C42DD67BC5C@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ad827e51-65e0-4a07-fc09-08d665254c4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2018 20:13:38.6821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1383
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-18_08:, , signatures=0
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
X-List-Received-Date: Tue, 18 Dec 2018 20:14:37 -0000

DQoNCu+7v09uIDEyLzE4LzE4LCAxMTowMiBBTSwgIkphbWVzIEZlaXN0IiA8amFtZXMuZmVpc3RA
bGludXguaW50ZWwuY29tPiB3cm90ZToNCg0KICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1j
L3Bob3NwaG9yLXBpZC1jb250cm9sL2Jsb2IvbWFzdGVyL2RidXMvZGJ1c2NvbmZpZ3VyYXRpb24u
Y3BwDQoNClRoYW5rcyBKYW1lcw0KDQo=
