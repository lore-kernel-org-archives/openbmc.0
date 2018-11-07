Return-Path: <prvs=4849b2cf4d=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4849b2cf4d=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="IWBZpkQW"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Oq/gJhuV"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42qz6X4mjnzF3Jy
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 07:49:04 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wA7KmaMG023201
 for <openbmc@lists.ozlabs.org>; Wed, 7 Nov 2018 12:49:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=SBpI6Wi1GtpVseSv5BuSOuTOw6JIoVg9OAaLTc4ZvKQ=;
 b=IWBZpkQW2kgxCh+6V9FtfEJM1mtJBqeao9vGOC+EzDnC+T8wTPdEoaZuLQ/PAFM6vYyi
 LPfXIb/hlQ+70V3U/XuMpuN1Nhc+3L8uxjJtfO2bR0Ud21YqvxJacug0W0q5ul0pZ8G/
 4aBh8U9opG/tRsiTw9SR+0S9MWlTYfZQQBM= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2nm65dg88k-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Nov 2018 12:49:02 -0800
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 7 Nov 2018 12:49:01 -0800
Received: from PRN-CHUB11.TheFacebook.com (2620:10d:c081:35::20) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Wed, 7 Nov 2018 12:49:01 -0800
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.21) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Wed, 7 Nov 2018 12:49:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBpI6Wi1GtpVseSv5BuSOuTOw6JIoVg9OAaLTc4ZvKQ=;
 b=Oq/gJhuVLKO9Qk/B1WGi5gOqrKA8FajrvGSDAxatxs+prDj2UsUMZOe9Plgoz/EJe5aMjMynYtb787QOtCtrFVeU5EV3Jf+lswhsECoH3k0OsGYF64cFsSTvXIAVC9x+nXuNkznK/sX8PhNAuumQYfWdZyI5PyxES5SElsCdIus=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1535.namprd15.prod.outlook.com (10.173.235.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.21; Wed, 7 Nov 2018 20:49:00 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::709f:e3cd:1db:74d6]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::709f:e3cd:1db:74d6%2]) with mapi id 15.20.1294.034; Wed, 7 Nov 2018
 20:49:00 +0000
From: Tao Ren <taoren@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [Potential Spoof] Re: pull request to the u-boot-aspeed
Thread-Topic: [Potential Spoof] Re: pull request to the u-boot-aspeed
Thread-Index: AQHUdms1fdBLenHzmkOwOFO/q9XDLqVELk+AgACbdgA=
Date: Wed, 7 Nov 2018 20:49:00 +0000
Message-ID: <a6ba63dc-eecc-9a24-e479-8036d53804bd@fb.com>
References: <3ff8d429943e44139b73cb16199a560e@yadro.com>
 <3D1C8267-BC6F-44F1-B12F-020E147B225B@fb.com>
In-Reply-To: <3D1C8267-BC6F-44F1-B12F-020E147B225B@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR1201CA0015.namprd12.prod.outlook.com
 (2603:10b6:301:4a::25) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::6:85f]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1535;
 20:Jadg+VA3DLMPxmIVTwjPshBQPRTWFwlSknqsaiwme7EtimikJ83k+nnP0eFqJ3bTqCm8w9vaYKN1eyXM0J4/BlhcgdPedEjF0TcsESPlSKCC8Nz2OtwEVLN6prszygWDFXJA44jtBBgKdM/WS58PuwPTPmkcp0wt5q/gsLg3BW0=
x-ms-office365-filtering-correlation-id: 26249bcc-da68-42dd-e3cf-08d644f2717b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1535; 
x-ms-traffictypediagnostic: MWHPR15MB1535:
x-microsoft-antispam-prvs: <MWHPR15MB153507F8CD605FA36A1BADEEB2C40@MWHPR15MB1535.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231382)(11241501184)(944501410)(52105095)(93006095)(93001095)(148016)(149066)(150057)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1535; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1535; 
x-forefront-prvs: 08497C3D99
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(376002)(136003)(346002)(366004)(199004)(189003)(6436002)(5640700003)(86362001)(99286004)(6116002)(2900100001)(53936002)(105586002)(6306002)(6512007)(52116002)(6916009)(14454004)(64126003)(97736004)(65956001)(81166006)(81156014)(1730700003)(106356001)(65806001)(8676002)(8936002)(229853002)(31686004)(6486002)(46003)(486006)(2501003)(476003)(446003)(186003)(11346002)(2616005)(2351001)(31696002)(6246003)(256004)(966005)(478600001)(102836004)(76176011)(65826007)(68736007)(5660300001)(25786009)(305945005)(316002)(53546011)(36756003)(386003)(6506007)(71200400001)(7736002)(71190400001)(2906002)(58126008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1535;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: sty+LNCqEZYjcniWUTKgTQJlcbrdOdbM2ALPcRXhiQtZLlCFpNW6gSsPcfLm8Gp8czoA/+j+WJYKda7/G40umr94891Uf+rzPrcXe8FxcY8N9t1ttE+YO0i9bp8a8V+gRvTppJUPMV8vXEnD2zn0afBQiiLQdc+yahKDsXgH1XMgJtbTlV39QgpAeRiBv2ta7SO05vvfgZcLagw07wS7GUyRC6OYAQufXKU4rhjH6GNQC/S3vXLgQawwLNud+X7YQ7ksRMkgZ6Y5te+H7Di8Yy/jDOFiCP33AfW1tPef2/IvIGsTG9OLAz9FYOsgyyWapGu1MFbsFGby8zTOfZ+pxmLnzip2KhDpNI3SixQwWqY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <929C64975CDD8D4593BC3519B5674714@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 26249bcc-da68-42dd-e3cf-08d644f2717b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2018 20:49:00.1066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1535
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-07_17:, , signatures=0
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
X-List-Received-Date: Wed, 07 Nov 2018 20:49:09 -0000

T24gMTEvNy8xOCAxMTozMiBBTSwgU2FpIERhc2FyaSB3cm90ZToNCj4gSGkgQWxleGFuZGVyLA0K
PiANCj4gVGhlIHByb2Nlc3MgZm9yIHUtYm9vdCBjaGFuZ2VzIGlzIHNpbWlsYXIgdG8ga2VybmVs
IGNoYW5nZXMgd2hpY2ggaXMgZG9jdW1lbnRlZEAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
ZG9jcy9ibG9iL21hc3Rlci9rZXJuZWwtZGV2ZWxvcG1lbnQubWQuIEkgYmVsaWV2ZSBpdCBkb2Vz
IG5vdCBpbnZvbHZlIGdlcnJpdCB3aGljaCBpcyBmb3IgY29yZSBPcGVuQk1DIHVzZXJsYW5kIGZl
YXR1cmUgZGV2ZWxvcG1lbnQuDQoNClRoYW5rIHlvdSBTYWkgZm9yIHNoYXJpbmcgdGhlIGxpbmsu
IEknbSBhY3R1YWxseSBsb29raW5nIGF0IGJlbG93IHBhZ2UgZm9yIGtlcm5lbCBwYXRjaGVzOiB3
aGljaCBvbmUgaXMgdXAgdG8gZGF0ZT8NCg0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvbGlu
dXgvd2lraS9EZXZlbG9wbWVudFByb2Nlc3MgDQoNCg0KVGhhbmtzLA0KDQpUYW8gUmVuDQo=
