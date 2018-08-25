Return-Path: <prvs=1775c5d522=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1775c5d522=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="GdD49Maa"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="SM2WRPvi"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xzcn2qs7zDqSL
 for <openbmc@lists.ozlabs.org>; Sat, 25 Aug 2018 10:32:20 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7P0WHfm018874; Fri, 24 Aug 2018 17:32:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=s6NOicAQ5AMgkVCifE+I/ps3U6nn1oYujD0vXEt5eAE=;
 b=GdD49MaaW90DLVMhNvhn2pE4vX704h+j1HwczuVdtvQW4GKf6yY68HYIpuQ1JRP03RWc
 Wb26NgIrq9HI14t0+6dxS0nAmHhtZgJQSAQBnnoMXjx57DPpE2IHZFwrV/7Tkdm5Xk/S
 YtpmS3ViiI6shAwmus3u1bA9yhYVGfQi9ks= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2m2vnhg007-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 24 Aug 2018 17:32:17 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.23) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Fri, 24 Aug 2018 20:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6NOicAQ5AMgkVCifE+I/ps3U6nn1oYujD0vXEt5eAE=;
 b=SM2WRPvi/UyuUn1aLJ5c+5oM3nHF9ssYrAPb82zo2qC08FxELMJR5nYbUWvMZaWoqAzqAH4JVXA8qusqFbHmPegmH7hby5hrtX/daCgOKzsRg1cjK7WfWV+4jrjq6nFT1ZC5m1O8EuoJH5H6x90NiffNKKCKnoIb8/grJGwfZuA=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1888.namprd15.prod.outlook.com (10.174.100.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1080.14; Sat, 25 Aug 2018 00:32:14 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::6812:6836:3174:75c3]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::6812:6836:3174:75c3%3]) with mapi id 15.20.1059.023; Sat, 25 Aug 2018
 00:32:14 +0000
From: Sai Dasari <sdasari@fb.com>
To: "Tanous, Ed" <ed.tanous@intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: SOL Logging
Thread-Topic: SOL Logging
Thread-Index: AdQ768XuiEM9C2PZSeev9pRHOBKrsv//yT2A
Date: Sat, 25 Aug 2018 00:32:14 +0000
Message-ID: <9FAE534D-D728-4CCF-A050-1AD83FBBE255@fb.com>
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:3ff7]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1888;
 20:QHpeMfTfdwZSVEs+zl+nlCq5lw/aoUt9Kwt5uO3gaABE0wXUQhn7uid/LKlC9Jpj3dmWLU9jpLraLi1tBSa6fXO34MmF8mdkQP/FJ4SbF4tZAgFH1vg8C4j/mOZOqVQy8zRiJ/uDBzvRNCIpgHDtQdwH6d6vJF+U/dOaiwr+WiY=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: c3666202-f281-45ae-fe20-08d60a223465
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1888; 
x-ms-traffictypediagnostic: MWHPR15MB1888:
x-microsoft-antispam-prvs: <MWHPR15MB18889581EC9FC91C73C42938CE350@MWHPR15MB1888.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(192374486261705)(21748063052155)(17755550239193); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231311)(11241501184)(944501410)(52105095)(149027)(150027)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699016);
 SRVR:MWHPR15MB1888; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1888; 
x-forefront-prvs: 0775716B9D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(136003)(376002)(366004)(346002)(199004)(189003)(6486002)(6512007)(54896002)(86362001)(186003)(6306002)(6436002)(53936002)(7116003)(2900100001)(110136005)(478600001)(68736007)(3480700004)(5660300001)(83716003)(7736002)(221733001)(6246003)(36756003)(99286004)(229853002)(76176011)(81156014)(81166006)(8676002)(6116002)(5250100002)(102836004)(6506007)(97736004)(33656002)(82746002)(46003)(2906002)(8936002)(25786009)(14454004)(14444005)(256004)(316002)(11346002)(105586002)(476003)(2616005)(446003)(486006)(561944003)(106356001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1888;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 8GaXCNihbFbq8gK/1ZzfADPRKe7UXHpEtrPOQQHEwMOOMoMEvqWG1fs9UerpkePS6ZwI4imgBqLBrjRCAGMfTSvApJnpUZjWQwxmt2v97WhBailk09/GPkIHbe5ER/UC1jeIdwYT4dksPtEfyL4oy1VwFQbB7bHpv8iBVX98MTdj90LcZe3SSbhr0coPSbEPwgOb4diwziKr8oaYpySuBQy2tmVZuxRb0dPoOsCoxC7xapBnGy/8lxyxXRnOvwNtRH5p51g5nTSAFygdWrZQJP5KZrdgTI88UjPBDiSVZe1VWTzb+MI8kTHCO6Yje0Edkxpcdu4ZQNMKD50TvFH/9+ipKorQmIseyCQX+EzzpTo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_9FAE534DD7284CCFA0501AD83FBBE255fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c3666202-f281-45ae-fe20-08d60a223465
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2018 00:32:14.2206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1888
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-24_10:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Aug 2018 00:32:26 -0000

--_000_9FAE534DD7284CCFA0501AD83FBBE255fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pkluc3RlYWQsIG90aGVyIEJNQ3MgaW1wbGVtZW50IGl0IGFzIGEgY2lyY3VsYXIgYnVmZmVyIGlu
c2lkZSB0aGUgQk1DIGl0c2VsZiwgd2hpY2ggYWxsb3dzIFNPTCB0byBsb2cgZGF0YSBhbGwgdGhl
IHRpbWUsIG5vdCBqdXN0IHdoaWxlIHRoZSB1c2VyIGlzIGxvZ2dlZCBpbi4gIEkgdGhpbmsgYXJj
aGl0ZWN0aW5nIGl0IHRoaXMgd2F5IHdvdWxkIGJlIG11Y2ggbW9yZSB1c2VmdWwgZm9yID5hZG1p
bnMgY29uc3VtaW5nIE9wZW5CTUMsIGFuZCBtYWtlIHVzIG1vcmUgdXNlZnVsIGFzIGEgc29sdXRp
b24uICBEb2luZyBpdCB0aGlzIHdheSBhbHNvIGNhbiBtYWtlIHRoZSBTT0wgbG9nIGF2YWlsYWJs
ZSB0byBJUE1JIGFuZCBSZWRmaXNoLCBhcyB3ZWxsIGFzIGEgZmlsZSBkb3dubG9hZCwgd2hpY2gg
aW1wcm92ZXMgdGhlIHVzYWJpbGl0eSBxdWl0ZSBhIGJpdC4gIE1vc3QgPnBsYWNlcyBJIHNlZSB0
aGUgU09MIGxvZ2dpbmcgcmVxdWVzdGVkIGlzIGZvciBhdWRpdCB0eXBlIHB1cnBvc2VzLCB3aGlj
aCB0aGUgamF2YXNjcmlwdCBiYXNlZCB2ZXJzaW9uIGNhbuKAmXQgZG8uDQoNCisxIGZvciB0aGlz
IGRlc2lnbiBwcm9wb3NhbCBvZiBoYXZpbmcgYSBjaXJjdWxhciBidWZmZXIgaW5zaWRlIEJNQyB0
aGF0IGNhcHR1cmVzIHRoZSBIb3N04oCZcyBjb25zb2xlIGFsbCB0aGUgdGltZS4gQ291cGxlIG9m
IHRob3VnaHRzIG9uIHRoaXM6IDEpIG1ha2Ugc3VyZSB0aGVzZSBjb25zb2xlIGxvZ3MgYXJlIGF2
YWlsYWJsZSB0byBwcml2aWxlZ2VkIHVzZXIgb25seSAoZS5nLiByb290KSAyKSBjb25zaWRlciB0
aGUgY2FzZSBvZiBwcmVzZXJ2aW5nIHRoZSBsb2dzIChvciBwZXJpb2RpY2FsbHkgb2ZmbG9hZCBm
cm9tIEJNQykgdG8gbm90IGxvc2UgdGhlbSBkdWUgdG8gQk1DIHJlYm9vdHMuDQoNCj5J4oCZbSBs
b29raW5nIGZvciBmZWVkYmFjayBmcm9tIHRoZSBjb21tdW5pdHkgaGVyZS4gIEFzIHdyaXR0ZW4s
IEkgZG9u4oCZdCB0aGluayB0aGUgamF2YXNjcmlwdCBjb25zb2xlIGV4cG9ydCBpcyBhIHVzZWZ1
bCBmZWF0dXJlIGdpdmVuIGl0cyBsaW1pdGF0aW9ucy4gIERvIG90aGVycyBhZ3JlZT8gIEFtIEkg
b2ZmIGJhc2U/ICBBcmUgdGhlcmUgdXNlIG1vZGVscyB3aGVyZSBoYXZpbmcgYSBsb2cgPm9mIG9u
bHkgdGhlIGN1cnJlbnQgc2Vzc2lvbiBpcyB1c2VmdWw/ICBTaG91bGQgd2UgZG9jdW1lbnQgdGhl
IGxpbWl0YXRpb25zIHNvIHdlIGNhbiByZXNwb25kIHRvIGJ1Z3MgaW4gdGhlIGZ1dHVyZT8NCg0K
T25lIHBvc3NpYmxlIHVzZWNhc2UgKG5vdCBjZXJ0YWluIHRob3VnaCkgdGhpcyBmZWF0dXJlIG9m
IGtlZXBpbmcgbG9nIG9mIG9ubHkgY3VycmVudCBzZXNzaW9uIGlzIGZvciBzZWN1cml0eSByZWFz
b24gd2hlcmUgdGhlIGN1cnJlbnQgdXNlcuKAmXMgY29uc29sZSBzZXNzaW9uIGxvZyBpcyBhdmFp
bGFibGUgdG8gb25seSB0aGF0IHVzZXIuDQoNCg==

--_000_9FAE534DD7284CCFA0501AD83FBBE255fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <7303152FDA6BDD4E91E5467FEB40B302@namprd15.prod.outlook.com>
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
YW4uRW1haWxTdHlsZTE4DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsOw0KCWZvbnQtZmFtaWx5
OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0Kc3Bhbi5FbWFpbFN0
eWxlMTkNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6IkNh
bGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0K
CXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30NCkBwYWdl
IFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4g
MS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQot
LT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZs
aW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj4mZ3Q7SW5zdGVhZCwgb3RoZXIgQk1DcyBpbXBsZW1lbnQgaXQgYXMgYSBjaXJjdWxh
ciBidWZmZXIgaW5zaWRlIHRoZSBCTUMgaXRzZWxmLCB3aGljaCBhbGxvd3MgU09MIHRvIGxvZyBk
YXRhIGFsbCB0aGUgdGltZSwgbm90IGp1c3Qgd2hpbGUgdGhlIHVzZXIgaXMgbG9nZ2VkIGluLiZu
YnNwOyBJIHRoaW5rIGFyY2hpdGVjdGluZyBpdCB0aGlzIHdheSB3b3VsZCBiZSBtdWNoIG1vcmUg
dXNlZnVsIGZvciAmZ3Q7YWRtaW5zIGNvbnN1bWluZw0KIE9wZW5CTUMsIGFuZCBtYWtlIHVzIG1v
cmUgdXNlZnVsIGFzIGEgc29sdXRpb24uJm5ic3A7IERvaW5nIGl0IHRoaXMgd2F5IGFsc28gY2Fu
IG1ha2UgdGhlIFNPTCBsb2cgYXZhaWxhYmxlIHRvIElQTUkgYW5kIFJlZGZpc2gsIGFzIHdlbGwg
YXMgYSBmaWxlIGRvd25sb2FkLCB3aGljaCBpbXByb3ZlcyB0aGUgdXNhYmlsaXR5IHF1aXRlIGEg
Yml0LiZuYnNwOyBNb3N0ICZndDtwbGFjZXMgSSBzZWUgdGhlIFNPTCBsb2dnaW5nIHJlcXVlc3Rl
ZCBpcyBmb3IgYXVkaXQgdHlwZQ0KIHB1cnBvc2VzLCB3aGljaCB0aGUgamF2YXNjcmlwdCBiYXNl
ZCB2ZXJzaW9uIGNhbuKAmXQgZG8uPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiYjNDM7MSBmb3Ig
dGhpcyBkZXNpZ24gcHJvcG9zYWwgb2YgaGF2aW5nIGEgY2lyY3VsYXIgYnVmZmVyIGluc2lkZSBC
TUMgdGhhdCBjYXB0dXJlcyB0aGUgSG9zdOKAmXMgY29uc29sZSBhbGwgdGhlIHRpbWUuIENvdXBs
ZSBvZiB0aG91Z2h0cyBvbiB0aGlzOiAxKSBtYWtlIHN1cmUgdGhlc2UgY29uc29sZSBsb2dzIGFy
ZSBhdmFpbGFibGUgdG8gcHJpdmlsZWdlZCB1c2VyIG9ubHkgKGUuZy4gcm9vdCkgMikgY29uc2lk
ZXINCiB0aGUgY2FzZSBvZiBwcmVzZXJ2aW5nIHRoZSBsb2dzIChvciBwZXJpb2RpY2FsbHkgb2Zm
bG9hZCBmcm9tIEJNQykgdG8gbm90IGxvc2UgdGhlbSBkdWUgdG8gQk1DIHJlYm9vdHMuPG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPiZndDtJ4oCZbSBsb29raW5nIGZvciBmZWVkYmFjayBmcm9tIHRo
ZSBjb21tdW5pdHkgaGVyZS4mbmJzcDsgQXMgd3JpdHRlbiwgSSBkb27igJl0IHRoaW5rIHRoZSBq
YXZhc2NyaXB0IGNvbnNvbGUgZXhwb3J0IGlzIGEgdXNlZnVsIGZlYXR1cmUgZ2l2ZW4gaXRzIGxp
bWl0YXRpb25zLiZuYnNwOyBEbyBvdGhlcnMgYWdyZWU/Jm5ic3A7IEFtIEkgb2ZmIGJhc2U/Jm5i
c3A7IEFyZSB0aGVyZSB1c2UgbW9kZWxzIHdoZXJlIGhhdmluZyBhIGxvZyAmZ3Q7b2Ygb25seSB0
aGUNCiBjdXJyZW50IHNlc3Npb24gaXMgdXNlZnVsPyZuYnNwOyBTaG91bGQgd2UgZG9jdW1lbnQg
dGhlIGxpbWl0YXRpb25zIHNvIHdlIGNhbiByZXNwb25kIHRvIGJ1Z3MgaW4gdGhlIGZ1dHVyZT88
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+T25lIHBvc3NpYmxlIHVzZWNhc2UgKG5vdCBjZXJ0YWlu
IHRob3VnaCkgdGhpcyBmZWF0dXJlIG9mIGtlZXBpbmcgbG9nIG9mIG9ubHkgY3VycmVudCBzZXNz
aW9uIGlzIGZvciBzZWN1cml0eSByZWFzb24gd2hlcmUgdGhlIGN1cnJlbnQgdXNlcuKAmXMgY29u
c29sZSBzZXNzaW9uIGxvZyBpcyBhdmFpbGFibGUgdG8gb25seSB0aGF0IHVzZXIuDQo8bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPC9k
aXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_9FAE534DD7284CCFA0501AD83FBBE255fbcom_--
