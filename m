Return-Path: <sschaeck@cisco.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cisco.com
 (client-ip=173.37.86.78; helo=rcdn-iport-7.cisco.com;
 envelope-from=sschaeck@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=cisco.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.b="Ljun588N"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=cisco.onmicrosoft.com header.i=@cisco.onmicrosoft.com
 header.b="TEE45d7c"; dkim-atps=neutral
X-Greylist: delayed 690 seconds by postgrey-1.36 at bilbo;
 Fri, 22 Feb 2019 04:08:12 AEDT
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4451Bh71NTzDqQW
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 04:08:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2662; q=dns/txt; s=iport;
 t=1550768893; x=1551978493;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=mBqI0RY/p1O+300gpb/A2A24Vv2tAfHkUj80pi+nflc=;
 b=Ljun588NLKK++FOOC/fWnEvFVnpBqSBzsStGYs6qmQE+3q1ISk9h42hf
 GmU4EcQSojQ09EA/7SLItl5fD+TosspGc193+g6sxLSdmHodLUNRAA/QE
 6aQ9H3sfmk1PQn40WPplkmO7s9okVxyBs1LVX6dM5NKKiNMzfk6h9Urbi A=;
IronPort-PHdr: =?us-ascii?q?9a23=3AYgRqMxKFtCja84Xg69mcpTVXNCE6p7X5OBIU4Z?=
 =?us-ascii?q?M7irVIN76u5InmIFeBvKd2lFGcW4Ld5roEkOfQv636EU04qZea+DFnEtRXUg?=
 =?us-ascii?q?Mdz8AfngguGsmAXFbgJ/7jYic5NM9DT1RiuXq8NBsdFQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AnAADn1m5c/5pdJa1kHAEBAQQBAQc?=
 =?us-ascii?q?EAQGBUQcBAQsBgTBQA2d0BAsnhAeDRwOEUIsLSoINmB6BJANUCwEBGA8FhEA?=
 =?us-ascii?q?CF4NjIjQJDQEDAQECAQECbRwMhUsBAQQBIhEMAQE4DwIBBgIYAgImAgICJgo?=
 =?us-ascii?q?VEAIEARIbgwUBgVoDFQEOkQiQWgKKFHGBL4J4AQEFgTABg1IYggsDBYELiz0?=
 =?us-ascii?q?XgUA/gREnH4JMgwUZBBiBRzqCTzGCJpdKjAsJAoc8hm+EMRmTC4pJhU6KF4I?=
 =?us-ascii?q?iAgQCBAUCDQEBBYFHOIFWcBVlAYJBghwMF4NLhRSFP3IBCYEejmMBAQ?=
X-IronPort-AV: E=Sophos;i="5.58,396,1544486400"; d="scan'208";a="518973503"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
 by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2019 16:56:36 +0000
Received: from XCH-RCD-016.cisco.com (xch-rcd-016.cisco.com [173.37.102.26])
 by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id x1LGuaS6009157
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 21 Feb 2019 16:56:36 GMT
Received: from xhs-aln-003.cisco.com (173.37.135.120) by XCH-RCD-016.cisco.com
 (173.37.102.26) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 21 Feb 2019 10:56:36 -0600
Received: from xhs-aln-001.cisco.com (173.37.135.118) by xhs-aln-003.cisco.com
 (173.37.135.120) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 21 Feb 2019 10:56:35 -0600
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-001.cisco.com (173.37.135.118) with Microsoft SMTP Server (TLS) id
 15.0.1395.4 via Frontend Transport; Thu, 21 Feb 2019 10:56:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
 s=selector1-cisco-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBqI0RY/p1O+300gpb/A2A24Vv2tAfHkUj80pi+nflc=;
 b=TEE45d7cHnpJD7NgbpZIJmiNu/UTx6kvqXCkeD4vw2uXMCG6et59p9zH6+Zrpgdwxw2eJ9AhpgwwgVMaeYB98R+Lw8mUVi0QglT63ye8HjYKNZTR01ekbacI7mtsIR5PW289VmPyPVw8Aq5C0sa1r7S4JgZC45VwaT+5LNqrEZ0=
Received: from CY1PR11MB1031.namprd11.prod.outlook.com (10.164.69.21) by
 CY1PR11MB0795.namprd11.prod.outlook.com (10.163.237.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.14; Thu, 21 Feb 2019 16:56:34 +0000
Received: from CY1PR11MB1031.namprd11.prod.outlook.com
 ([fe80::10b4:7c05:8b97:5e2c]) by CY1PR11MB1031.namprd11.prod.outlook.com
 ([fe80::10b4:7c05:8b97:5e2c%8]) with mapi id 15.20.1643.016; Thu, 21 Feb 2019
 16:56:33 +0000
From: "Stefan Schaeckeler (sschaeck)" <sschaeck@cisco.com>
To: =?utf-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>,
 Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: ECC memory of BMC  
Thread-Topic: ECC memory of BMC  
Thread-Index: AQHUybSi/1kxVex+v0iiRwJ/nsfKoaXp2kyAgAAY+oA=
Date: Thu, 21 Feb 2019 16:56:33 +0000
Message-ID: <A87B34D9-87E4-4F33-BA6F-2ACBE10DE593@cisco.com>
References: <88e05768447d466ca674e12e20c650dc@quantatw.com>
 <96605da0-113a-4d43-994a-f081f30af71e@www.fastmail.com>
 <66dac7974c444060a9b4b1052b00d072@quantatw.com>
In-Reply-To: <66dac7974c444060a9b4b1052b00d072@quantatw.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.7.190210
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sschaeck@cisco.com; 
x-originating-ip: [2001:420:30d:1254:1000:5c0c:8a0d:62f5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa0d4871-fb24-4b6b-ac5e-08d6981d88e7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:CY1PR11MB0795; 
x-ms-traffictypediagnostic: CY1PR11MB0795:
x-ms-exchange-purlcount: 2
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtDWTFQUjExTUIwNzk1OzIzOm9wVmNNUWtQZVdvd0VLTzRWVlpGZWtWeG5i?=
 =?utf-8?B?RjJNV2tmV3VKZlNvcW54dkE4Zlg1MFpVcXIveFllQWkwKzNWWDcrdmVVa3VN?=
 =?utf-8?B?aHJPYnJzbkVxZmtIazZPM1JzcS9QalNzamJMejRVLzEwZkdRbDRKQ2Z3WEZG?=
 =?utf-8?B?M2QrSXZJMW9XeXdGSnNQWjhneWhvTjFRL3NEUUJzU2psT2dhZ2haL1RQbnZ1?=
 =?utf-8?B?UUdvaDVmQjVKL0w1VURPOC9Xa1NLVlUxTUNzeDNCSFVIV3F0S21vU2dqUkhR?=
 =?utf-8?B?ZG1kcTBnUHRJZiszS2hBNHIzQ2VrQ00yeUt4VXJSMFJqOWZCbWE2QjZId2ZE?=
 =?utf-8?B?bmNpVitob1FWdmtuTmJ5aE9SZGVZdkhJdzZNSlRZUjBNdzQ2Uk5XNzdZUDRo?=
 =?utf-8?B?QnZ5SWd6bUlDVm1iVFN4RFBKSXJPOStpT0tFNEoyVkoxazZuQmFmaWRTVGF6?=
 =?utf-8?B?cmUvK3NBMksxNWpTWitnQUJtbTUvd1dQRGM4VlAvV0JPTXA4UE5mL0E3cUJM?=
 =?utf-8?B?dzhnR3J2QWdiV1U2SkRlQUJDSm5hNC9Cb0ttcUlVU3VMam5rSTBTUjZiMzlD?=
 =?utf-8?B?QXdVMXo4MWVvT3N3bzdhdVZQQXJsOEJHOHJCRTJoRFRUSHVVYzFyVnIwOUVr?=
 =?utf-8?B?dHlDU3c3WndnQTVjVlBZSDhmU0ZlMFMvMklBbHBmNzl5MFNHdENhN0lKM0oz?=
 =?utf-8?B?S3BEeGJvbTFDZWZFN2tvZmowRHRHcUt4ZVNxN2NDTDlBZ0p5aVV5SkJUc3NE?=
 =?utf-8?B?R2JvSDQ1ZlF4WE9KbVFiTWw0d1pLaExIVkNWdDdlQnk0SmtkYlN1cHRKWXVu?=
 =?utf-8?B?UWgwSVdRRFUzck1sWmFPZXJFMDdjY3Vhek9JT290TTM2L2hWOC9zYTRnb2pK?=
 =?utf-8?B?M1hkQTVRR3RnQlhsWHBhbzc0LzBON1FtK1JvZHpsZUVpUFFWeFA5NnRTQmhm?=
 =?utf-8?B?bmlEYjNjTjZCV1pVUDIvVmlYcUxOa3NiakJ1a0hMa2lYdVcwdEQ3K2FyQXNx?=
 =?utf-8?B?SzU1dkFEd1RSZmxKS0xjb1ZBMFJSL3MrMkdPNU4xdHQrdVN3cDZPOEMyS0JF?=
 =?utf-8?B?SmVWbVMzdmNIWlh5T3BCUVFYeEV6RTZ4eUttSjZZc0tTMVFIVncxcUVScmpy?=
 =?utf-8?B?Q2JBR2V4MVNiREVjWTlwcmR5SUkvbkpVN2FGd01IS2tKZDVsRjZ5UHg0akZK?=
 =?utf-8?B?UVJSbUhkMGVjQndiOWdoODFqeXc2WXp2YnlpakFUaVpucmxWL29jbW1oQjBr?=
 =?utf-8?B?NktLQThnU3JaWGdHQUhqU2FmZ2t3dldBTmNNSjVtWUN1dnBISmpERy93elRn?=
 =?utf-8?B?Ly9hazgzNHhJdnViYnV3QlhpY1ZJeXVqbkJXM05wVmxaSUVncU1nVjB5RTVH?=
 =?utf-8?B?Y3NmblR5UU94V0FLVU15bWd1cFhkQ0ZtNktMSThxMVFqaUZCUW9VSnNDb2RX?=
 =?utf-8?B?VWtMN2NmdGg5a0F2dzZXdGJSaHFqejVYOXA0UjcwZWVBc21kQ3d2NGN0TnRq?=
 =?utf-8?B?cU5jbVB1b2ViR0tLRUZSbUVIQ2V1dW54MER5cjFqSTlpRVYwbHpESCtkL2NN?=
 =?utf-8?B?NnRKUWgrMjRPMmlkaWhWYzk4a1VaWnlKL3NtWFpCZENGU09PYm9QbC9vYWgw?=
 =?utf-8?B?YWhaanZQQ2haTWt3Y0pmSDNSdXlaZFZLSGcvMithTE5NelZCdHgvQndZZWx2?=
 =?utf-8?Q?uYAdtdZYw/efokzMl1Ly7JW7JsplhP/duZ6G2ed?=
x-microsoft-antispam-prvs: <CY1PR11MB079578EF528CEBBD1E1C5384C77E0@CY1PR11MB0795.namprd11.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(376002)(136003)(396003)(39860400002)(199004)(189003)(53754006)(186003)(316002)(446003)(99286004)(256004)(97736004)(3480700005)(36756003)(486006)(229853002)(6436002)(46003)(110136005)(6512007)(82746002)(6306002)(58126008)(53936002)(2501003)(11346002)(476003)(2616005)(5660300002)(14454004)(305945005)(7736002)(8676002)(2906002)(106356001)(25786009)(105586002)(966005)(33656002)(8936002)(68736007)(76176011)(71190400001)(83716004)(71200400001)(6506007)(81156014)(81166006)(102836004)(6486002)(6246003)(478600001)(6116002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR11MB0795;
 H:CY1PR11MB1031.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: be6UHWtcDHzj0Hk2EIo3D0GfwxXydt3UnjIZCZNe5RVvf7FhQ9vfLFrkkMwcQxxCBM3BIhKSwypt7p/e30xNU3wK35cy341RFqXcT87M/ku/o8KAbedZETw4b2xnt5aYbcbZ19i25kJP7omTuQNGko40UrdO2+AjL2jrkzH4xSgtWiUrpOFZFiClqKQJkJUyBuAnqJN3SKoV1TTeq5ooIyChG3UrY8ZdoAo5sLwuiwwBR+vhb/cWhRkYkLuni7B7cqnINt7XRddN67Qfvknq4mna56MYE3+GetcdkSxUB+dnnQ8lRj0B4qwusBeXdYzUJQXbtWqeP4djZpMZZiZaIaJsRNoHCg7MvLmwARw0WjiHwbJP8UcGwpLRXFxIFUDTF7Hk8WFwR51h3wWvbYhpSreHblaWjhkG9GJ6ATLMMLw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <370AEBD68A990B4F971267779639F564@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0d4871-fb24-4b6b-ac5e-08d6981d88e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 16:56:33.5910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR11MB0795
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.26, xch-rcd-016.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com
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
X-List-Received-Date: Thu, 21 Feb 2019 17:08:15 -0000

SGkgYWxsLA0KDQpFQ0MgbmVlZHMgdG8gYmUgZW5hYmxlZCBpbiB1LWJvb3QuIFRoZSByZWFzb24g
aXMgZXhwbGFpbmVkIGluIG15IGZpcnN0IHVwbG9hZCBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3BhdGNoLzEwNzMyNzY5Lw0KDQpPdXIgdS1ib290IGVuZ2luZWVyIGRpZCBpdCBmb3IgdXMu
IEkgc2VlIHUtYm9vdCBjb2RlIGlzIGZ1bGwgb2YgI2lmZGVmIENPTkZJR19EUkFNX0VDQyBibG9j
a3MuIEluIHRoZW9yeSwgZW5hYmxpbmcgdGhpcyBvcHRpb24gc2hvdWxkIGJlIGVub3VnaC4NCg0K
DQotIEEgZ29vZCBpbmRpY2F0aW9uIG9mIGhhdmluZyBFQ0Mgc3VjY2Vzc2Z1bGx5IGVuYWJsZWQg
aXMgbGludXggYWN0dWFsbHkgYm9vdGluZy4NCi0gQW5vdGhlciBpbmRpY2F0aW9uIGlzIGF2YWls
YWJsZSBtZW1vcnkgYmVpbmcgOC85dGggb2Ygd2hhdCBpdCB1c2VkIHRvIGJlIChjaGVjayAvcHJv
Yy9tZW1pbmZvKQ0KLSBUaGVuLCBteSBkcml2ZXIgc2hvdWxkIG5vdCBsb2cgYW55IGVycm9ycyBp
biBpdHMgcHJvYmUgZnVuY3Rpb24gKGNoZWNrIGRtZXNnKS4NCg0KIFN0ZWZhbg0KDQrvu79PbiAy
LzIwLzE5LCAxMToyNyBQTSwgIldpbGwgTGlhbmcgKOaigeawuOmJiSkiIDxXaWxsLkxpYW5nQHF1
YW50YXR3LmNvbT4gd3JvdGU6DQoNCiAgICBIaSBBbmRyZXcsDQogICAgDQogICAgDQogICAgVGhh
bmtzIGZvciB5b3VyIHJlc3BvbnNlLg0KICAgIA0KICAgIA0KICAgIFdlIGhhdmUgYWxzbyBmb3Vu
ZCBFREFDIGRyaXZlci4NCiAgICBXaGF0IHdlIHdhbnQgdG8gZG8gaXMgdG8gcmVjb3JkIHRoZSBF
Q0MgZXZlbnRzIHRvIFNFTC4NCiAgICANCiAgICANCiAgICB3ZSBhcmUgY29uc2lkZXJpbmcgdG8g
Y3JlYXRlIG5ldyBkYnVzIGFuZCBhIHNlcnZpY2UuDQogICAgDQogICAgDQogICAgRG8geW91IGhh
dmUgYW55IHN1Z2dlc3Rpb25zPw0KICAgIA0KICAgIA0KICAgIEJScywNCiAgICBXaWxsDQogICAg
DQogICAgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KICAgIOWvhOS7
tuiAhTogQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4NCiAgICDlr4Tku7bml6XmnJ86
IDIwMTnlubQy5pyIMjHml6Ug5LiL5Y2IIDAzOjEwDQogICAg5pS25Lu26ICFOiBvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmc7IFdpbGwgTGlhbmcgKOaigeawuOmJiSkNCiAgICDlia/mnKw6IFN0ZWZh
biBNIFNjaGFlY2tlbGVyDQogICAg5Li75peoOiBSZTogRUNDIG1lbW9yeSBvZiBCTUMgIA0KICAg
IA0KICAgIA0KICAgIE9uIFRodSwgMjEgRmViIDIwMTksIGF0IDE3OjE2LCBXaWxsIExpYW5nICjm
ooHmsLjpiYkpIHdyb3RlOg0KICAgID4gIA0KICAgID4gSGksDQogICAgPiAgDQogICAgPiB3ZSBh
cmUgdHJ5aW5nIHRvIGVuYWJsZSBFQ0Mgb24gQk1DIG1lbW9yeS4NCiAgICA+ICANCiAgICA+IGlz
IHRoZXJlIGFueSBleGlzdCBzb2x1dGlvbiBvbiBCTUM/DQogICAgDQogICAgV2VsbCwgZm9yIHdo
YXQgaXQncyB3b3J0aCBhIGtlcm5lbCBkcml2ZXIgaGFzIGJlZW4gc3VibWl0dGVkIHVwc3RyZWFt
IGFuZCBpcw0KICAgIHF1ZXVlZCBmb3IgdGhlIDUuMSBtZXJnZSB3aW5kb3c6DQogICAgDQogICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnAvYnAuZ2l0
L2NvbW1pdC8/aD1mb3ItbmV4dCZpZD05YjdlNjI0MmVlNGVmY2Q3ZjllZjY5OWJmMTk2NWUzYTUz
NDNmMjE2DQogICAgDQogICAgVGhlIHBhdGNoIGRvZXMgc2F5IGl0IG5lZWRzIGJvb3Rsb2FkZXIg
c3VwcG9ydCB0aG91Z2gsIGFuZCBJJ20gbm90IGV4YWN0bHkNCiAgICBzdXJlIHdoYXQgdGhhdCBp
bnZvbHZlcy4gSSd2ZSBhZGRlZCBTdGVmYW4gdG8gQ2MsIG1heWJlIGhlIGNhbiBwcm92aWRlIHNv
bWUNCiAgICBpbnNpZ2h0Lg0KICAgIA0KICAgIEFuZHJldw0KICAgIA0KICAgIA0KICAgIA0KICAg
IA0KDQo=
