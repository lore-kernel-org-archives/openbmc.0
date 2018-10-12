Return-Path: <prvs=3823c09c2b=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3823c09c2b=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="YUBXKUYO"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="B6s4+egI"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Wv670mbzzF36F
 for <openbmc@lists.ozlabs.org>; Sat, 13 Oct 2018 03:52:58 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.22/8.16.0.22) with SMTP id w9CGnXpi028737
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 09:52:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=jcq+R2dp++Vlm12fxfiJrPqqXx+F3THdo5hdgG13edI=;
 b=YUBXKUYOmrnJR1FgYVFknnICzMnlWEQ8zW2a4BiynspWo5i3PlFxmDi3FvQAh8QuZqRT
 bsHKmdbs0wAePwh2S2GWVy/tgB2oFN9vNOPLBXgr90Et2dLKta1REKh9BCN6tG2brsBc
 py8143lXiSdE81JLaUQKgGvET9Y9eWr1WO0= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by m0089730.ppops.net with ESMTP id 2n2vyd8jwn-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 09:52:55 -0700
Received: from frc-hub02.TheFacebook.com (2620:10d:c021:18::172) by
 frc-hub02.TheFacebook.com (2620:10d:c021:18::172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 12 Oct 2018 09:52:44 -0700
Received: from FRC-CHUB12.TheFacebook.com (2620:10d:c021:18::31) by
 frc-hub02.TheFacebook.com (2620:10d:c021:18::172) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Fri, 12 Oct 2018 09:52:44 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.32) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Fri, 12 Oct 2018 12:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcq+R2dp++Vlm12fxfiJrPqqXx+F3THdo5hdgG13edI=;
 b=B6s4+egIAF9yWI1dV/B3uI3ceLXUZYKDTydgIaTlYsdCdgomyeZ13fBMnCd5s1uXIcA5a8P9FzCIRgUAtt3xhtYhjCl4oB8rQyUedFMh3lyu+N12AO3xBkmP33dYltIPJglLh8Mfh33o1pAYMjxNPrDD4f7+Zlak6uISJN26vHU=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1328.namprd15.prod.outlook.com (10.175.3.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.24; Fri, 12 Oct 2018 16:52:42 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::2937:a3e7:96c0:6dd6]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::2937:a3e7:96c0:6dd6%10]) with mapi id 15.20.1228.020; Fri, 12 Oct
 2018 16:52:42 +0000
From: Sai Dasari <sdasari@fb.com>
To: "Mihm, James" <James.Mihm@Intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Hackathon Day 3 Updated Agenda 
Thread-Topic: OpenBMC Hackathon Day 3 Updated Agenda 
Thread-Index: AdRheOrZUXjgaJ8PTAula+e84EUcTgAmGVYA
Date: Fri, 12 Oct 2018 16:52:42 +0000
Message-ID: <5DD7F79F-1899-41EB-9733-AFEFFC424C53@fb.com>
References: <C599FC839619124CAC44E062ABB7DFE2D700ED41@ORSMSX101.amr.corp.intel.com>
In-Reply-To: <C599FC839619124CAC44E062ABB7DFE2D700ED41@ORSMSX101.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:9053]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1328;
 20:BiriE7kzd0zkf/aclEilRqfO2S7NpljSRFh9c+xv8GPpoinlthRptFK7xjXop3m9nN9C+E0L2Uqf8VCmks0AadzCCQ8GOzgz0tNKTsv8mNb6tGpWUK5L5Fi+PSwP9HvJrJ7vhRw7h7TIktg+K9MNeEoHLGe5f+VBFXPkD55SJLs=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 8ab44dcc-26f6-4fa7-e845-08d630632097
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1328; 
x-ms-traffictypediagnostic: MWHPR15MB1328:
x-ld-processed: 8ae927fe-1255-47a7-a2af-5f3a069daaa2,ExtAddr
x-microsoft-antispam-prvs: <MWHPR15MB132852D22EC2E45689A8C453CEE20@MWHPR15MB1328.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(192374486261705)(65623756079841)(228905959029699); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(3231355)(11241501184)(944501410)(52105095)(10201501046)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991067);
 SRVR:MWHPR15MB1328; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1328; 
x-forefront-prvs: 0823A5777B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(376002)(366004)(396003)(39860400002)(189003)(199004)(36756003)(46003)(8936002)(53936002)(68736007)(14454004)(4743002)(11346002)(476003)(2900100001)(446003)(102836004)(186003)(25786009)(86362001)(110136005)(2616005)(106356001)(478600001)(105586002)(486006)(229853002)(76176011)(2501003)(7736002)(97736004)(33656002)(305945005)(8676002)(6246003)(5250100002)(15650500001)(5660300001)(6486002)(6116002)(81166006)(256004)(6506007)(14444005)(6436002)(316002)(2906002)(83716004)(71190400001)(6512007)(99286004)(81156014)(82746002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1328;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: cldujjGEvCbFn3puWlZV1oFMUQtD1trkzCDKC+xOcxvUYbnFmL6jZ7IxmzpeadWmc2bLb5h0/vzKXroeN86weBz1eEAci1H7B5mH3CR541InE1e0ALRdDjJFfT+BEiXZFGKMszK9LsSueiCEJyQmn0taDq2bRPMOaddi15dWkcyx2x+IEH5EkKc4oWlwCiUk3asa716rcoToI224ykOLOoFsvAGNCth2I1MqIkdyjdEPS/rGeyGMMhWV7uC/L1G2eDx4s7MQKUH6LARofzpQJU5UbpVg1ty3TSsTzE4L2jyvY7m01HWmECo1ajpkNuOT/EDocitrg6PQnYXNgwNqHesXa/li/p9Kx/bM3axgG5g=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F3BB7B6938C4C4F90B1804E9B7D7933@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab44dcc-26f6-4fa7-e845-08d630632097
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2018 16:52:42.5004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1328
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-12_13:, , signatures=0
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
X-List-Received-Date: Fri, 12 Oct 2018 16:53:04 -0000

VGhhbmtzIGEgbG90IEphbWVzIChhbmQgSW50ZWwgbGVhZGVyc2hpcCB0ZWFtKSBmb3IgaG9zdGlu
ZyBPcGVuQk1DIEhhY2thdGhvbiBldmVudCBzdWNjZXNzZnVsbHkuDQoNCkl0IHdhcyBodW1ibGlu
ZyBleHBlcmllbmNlIHRvIG1lZXQgYW1hemluZyAoYW5kIHJlc3BlY3RmdWwpIGRldmVsb3BlcnMg
YWNyb3NzIGRpdmVyc2UgaW5kdXN0cnkgcGFydG5lcnMgd2l0aCBzb2xlIGZvY3VzIG9uIHByb3Zp
ZGluZyBiZXR0ZXIgQk1DIHNvbHV0aW9uIQ0KDQrvu79PbiAxMC8xMS8xOCwgODo1OCBBTSwgIm9w
ZW5ibWMgb24gYmVoYWxmIG9mIE1paG0sIEphbWVzIiA8b3BlbmJtYy1ib3VuY2VzK3NkYXNhcmk9
ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mIGphbWVzLm1paG1AaW50ZWwuY29t
PiB3cm90ZToNCg0KICAgIERheSAzICAgICBUZWNoIFRhbGtzICBUaHVyc2RheSwgT2N0b2JlciAx
MXRoLCAyMDE4DQogICAgICAgICAgICAgICAgICAgICAgICBEaXNjdXNzaW9uIExlYWRlciAgICAg
ICAgIFRvcGljDQogICAgICA5OjAwIEFNICAgU3VwcmVldGggVmVua2F0ZXNoICAgICBPcGVuQk1D
IGVuYWJsZW1lbnQgb24gQXJtIFJlZmVyZW5jZSBQbGF0Zm9ybXMgUm9hZG1hcC9QbGFuIHdpdGgg
ZW1waGFzaXMgb24gUExETS9NQ1RQLg0KICAgICAgOTo0NSBBTSAgIE5pbGFuIE5haWRvbyAgICAg
ICAgICAgICAgICAgTUNUUCBTdXBwb3J0DQogICAgMTA6MzAgQU0gICBTdXJ5YWthbnRoIFNla2Fy
ICAgICAgICAgIE9PQiBCSU9TIENvbmZpZ3VyYXRpb24gYW5kIHVwZGF0ZXMNCiAgICAxMToxNSBB
TSAgIFNoYXJhZCBLaGV0YW4gICAgICAgICAgICAgICBQZXJzcGVjdGl2ZXMgb24gT3BlbkJNQw0K
ICAgIDEyOjAwIFBNICAgTHVuY2ggQnJlYWsgICAgICAgICAgICAgICAgICAgUmVsYXggYW5kIGVu
am95DQogICAgICAxOjAwIFBNICAgSm9zZXBoIFJleW5vbGRzIChyZW1vdGUpDQogICAgICAgICAg
ICAgICAgICAgICAgICBKYW1lcyBNaWhtICAgICAgICAgICAgICAgICAgIFNlY3VyaXR5IHdvcmtp
bmcgZ3JvdXAgdXBkYXRlLCBpbmNpZGVudCByZXBvbnNlLCBzcHkgY2hpcHMsIHRocmVhdCBtb2Rl
bCwgaGFyZHdhcmUgZ3VpZGFuY2UNCiAgICAgMTo0NSBQTSAgIEVkIFRhbm91cyAgICAgICAgICAg
ICAgICAgICAgICAgIEtWTSAmIFZpcnR1YWwgTWVkaWENCiAgICAgMjozMCBQTSAgICAtLSBvcGVu
IC0tICAgICAgICAgICAgICAgICAgICAgICAgIEJNQyBEZXZpY2UgRW5hYmxlbWVudCAtIGZ1dHVy
ZSByZXF1aXJlbWVudHMgKGUuZy4sIGkzYyBzdXBwb3J0LCBjcnlwdG8sIGZ1c2VzLCBmdyBtZWFz
dXJlbWVudHMpDQogICAgIDM6MDAgUE0gICAgLS0gb3BlbiAtLSAgICAgICAgICAgICAgICAgICAg
ICAgICBSZXNwb25zaXZlbmVzcyBhbmQgcGVyZm9ybWFuY2UgbGltaXRhdGlvbnMgb2YgdGhlIGN1
cnJlbnQgYXJjaGl0ZWN0dXJlIGFuZCBpbXBsZW1lbnRhdGlvbg0KICAgICAzOjMwIFBNICAgIC0t
IG9wZW4gLS0gICAgICAgICAgICAgICAgICAgICAgICAgSG93IHRvIGltcHJvdmUgb3ZlcmFsbCBw
ZXJmb3JtYW5jZSBvZiBCTUMgYW5kIHJlZHVjZSBib290IHRpbWUNCiAgICAgNDowMCBQTSAgIEph
bWVzIE1paG0gLw0KICAgICAgICAgICAgICAgICAgICAgICBTYWkgRGFzYXJpICAgICAgICAgICAg
ICAgICAgICAgICAgRW5nYWdlbWVudHMgd2l0aCBPQ1AgLSBIYXJkd2FyZSBNYW5hZ2VhYmlsaXR5
LCBTZWN1cml0eQ0KICAgICA0OjMwIFBNICAgSmFtZXMgTWlobSAgICAgICAgICAgICAgICAgICAg
V3JhcC11cA0KICAgICA0OjQ1IFBNICAgRmluIGRlbCBkaWEgDQogICAgICAgICAgICANCiAgICAg
ICAgICAgIA0KICAgIEhhY2tpbmcgU2Vzc2lvbnMgICAgICAgIA0KICAgICAgICBjb250aW51YXRp
b24gZnJvbSBkYXkgMiANCiAgICAgICAgTnV2b3RvbiBEZW1vIG9mIE9wZW5CTUMgb24gUG9sZWcg
KG5wY203eHgpIGNoaXANCiAgICAgICAgRnJlZS1mb3JtIGRlbW9uc3RyYXRpb24gb2Ygd29yayBh
Y2NvbXBsaXNoZWQgZHVyaW5nIGhhY2thdGhvbiAgIA0KICAgICAgICAgICAgDQogICAgDQogICAg
SmFtZXMgTWlobSANCiAgICBJbnRlbCAtIEludGVsIERDRyBCTUMgQ29yZSBGaXJtd2FyZQ0KICAg
ICg1MDMpIDI2NC01MTI5IA0KICAgIA0KICAgIA0KICAgIA0KDQo=
