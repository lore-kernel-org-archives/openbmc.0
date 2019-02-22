Return-Path: <sschaeck@cisco.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cisco.com
 (client-ip=173.37.142.93; helo=alln-iport-6.cisco.com;
 envelope-from=sschaeck@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=cisco.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.b="lginS2RT"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=cisco.onmicrosoft.com header.i=@cisco.onmicrosoft.com
 header.b="jm4uRMtU"; dkim-atps=neutral
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445LNd3ML3zDqQG
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 17:02:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2382; q=dns/txt; s=iport;
 t=1550815377; x=1552024977;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=DBvo9zeeAjM4RiAXG+anSSiX0uGbVKe2kTZdQcGGaAU=;
 b=lginS2RTffWgX6QGlqIy9rPKdrIcQPNfw5iC7LI8+Ew1qAIUso/WkUee
 Vs9wrAhbK9ETUrqzGxGTD1u1zufGE+tt01uH1XRzrXTQn66fpWu+UKzj7
 Ue+j210Ho0eJk2Iwp/74eOMDMlp1wIOa2l1vhpvZUCJjdG2OHsu3us+x4 I=;
IronPort-PHdr: =?us-ascii?q?9a23=3AkRLcYxDDC0MctRI+GpJQUyQJPHJ1sqjoPgMT9p?=
 =?us-ascii?q?ssgq5PdaLm5Zn5IUjD/qs03kTRU9Dd7PRJw6rNvqbsVHZIwK7JsWtKMfkuHw?=
 =?us-ascii?q?QAld1QmgUhBMCfDkiuN+XhbyU3F8dqX15+9Hb9Ok9QS47z?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ANAABrjW9c/4cNJK1lFgUBAQEBAwE?=
 =?us-ascii?q?BAQcDAQEBgVEGAQEBCwGBMFADZ3QECyeEB4NHA4RQiw1KgWglmB6BJANUCwE?=
 =?us-ascii?q?BIwmEQAIXg2MiNAkNAQMBAQIBAQJtHAyFSwEEASMEDQwBATgECwIBCBoCJgI?=
 =?us-ascii?q?CAjAVEAIEAYMyAYFaAw0IAQ6gTAKKFHF8M4J4AQEFgTABg1cYggsIgQuEcIZ?=
 =?us-ascii?q?NF4FAP4ERJwwTghwwgx4DgWAXgnIxgiajVgkChzyLIRmCSZBDikuFTow9AgQ?=
 =?us-ascii?q?CBAUCDQEBBYFHOIFWcBVlAYJBCYITDBeDS2qEKoU/cgEBgSaOYwEB?=
X-IronPort-AV: E=Sophos;i="5.58,398,1544486400"; d="scan'208";a="240260044"
Received: from alln-core-2.cisco.com ([173.36.13.135])
 by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2019 05:52:18 +0000
Received: from XCH-RCD-016.cisco.com (xch-rcd-016.cisco.com [173.37.102.26])
 by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id x1M5qIuN032632
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
 Fri, 22 Feb 2019 05:52:18 GMT
Received: from xhs-rcd-003.cisco.com (173.37.227.248) by XCH-RCD-016.cisco.com
 (173.37.102.26) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 21 Feb 2019 23:52:17 -0600
Received: from xhs-rcd-003.cisco.com (173.37.227.248) by xhs-rcd-003.cisco.com
 (173.37.227.248) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 21 Feb 2019 23:52:17 -0600
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (72.163.14.9) by
 xhs-rcd-003.cisco.com (173.37.227.248) with Microsoft SMTP Server
 (TLS) id
 15.0.1395.4 via Frontend Transport; Thu, 21 Feb 2019 23:52:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
 s=selector1-cisco-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBvo9zeeAjM4RiAXG+anSSiX0uGbVKe2kTZdQcGGaAU=;
 b=jm4uRMtUm1nG8ZLF8fN2MWjvm8uKn33hvJBkO5M3YT8xBHa8Lbefch1sJm1eGhPZhkoYO+/BpGgfA3bJUx2Q5BbdTUcEgBNAHRwZ0ej4oE4c5INuCULnCmIc8IFgbfPhZt+DMVPbzww/3/Ulpek0Ngc+rKLzasI2EsCr4JPfksM=
Received: from CY1PR11MB1031.namprd11.prod.outlook.com (10.164.69.21) by
 CY1PR11MB1031.namprd11.prod.outlook.com (10.164.69.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.14; Fri, 22 Feb 2019 05:52:15 +0000
Received: from CY1PR11MB1031.namprd11.prod.outlook.com
 ([fe80::10b4:7c05:8b97:5e2c]) by CY1PR11MB1031.namprd11.prod.outlook.com
 ([fe80::10b4:7c05:8b97:5e2c%8]) with mapi id 15.20.1643.016; Fri, 22 Feb 2019
 05:52:15 +0000
From: "Stefan Schaeckeler (sschaeck)" <sschaeck@cisco.com>
To: =?utf-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>,
 Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: ECC memory of BMC  
Thread-Topic: ECC memory of BMC  
Thread-Index: AQHUybSi/1kxVex+v0iiRwJ/nsfKoaXp2kyAgAAY+oCAANi6gA==
Date: Fri, 22 Feb 2019 05:52:15 +0000
Message-ID: <B5923117-0BB8-4728-9C9F-E8977EE096BF@cisco.com>
References: <88e05768447d466ca674e12e20c650dc@quantatw.com>
 <96605da0-113a-4d43-994a-f081f30af71e@www.fastmail.com>
 <66dac7974c444060a9b4b1052b00d072@quantatw.com>
 <A87B34D9-87E4-4F33-BA6F-2ACBE10DE593@cisco.com>
In-Reply-To: <A87B34D9-87E4-4F33-BA6F-2ACBE10DE593@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.7.190210
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sschaeck@cisco.com; 
x-originating-ip: [2001:420:c0c8:1008::246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46ca8a28-a48c-4591-d2aa-08d69889e5e0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:CY1PR11MB1031; 
x-ms-traffictypediagnostic: CY1PR11MB1031:
x-ms-exchange-purlcount: 2
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtDWTFQUjExTUIxMDMxOzIzOmdodVd5QmtZZkJRRm5aS1VSQi8vVklQa1dv?=
 =?utf-8?B?NHBMSElFRGMySm9BQVpQMytXTTRmQ0xMN29hb0d1QngrSDVNQ05pa2ZOZzFk?=
 =?utf-8?B?aDdqaVU2VG9kcTkwbDVOSnFpK3FXYkNjcmVPK25OOGZMNjZqMkl4eWp3ejR0?=
 =?utf-8?B?eUwva1cwY2lJMEhvKzNuM2p0WDZjN083b0dWQm05UzJyK0xJRy9NODQveGpa?=
 =?utf-8?B?RE1hTzRlVHR6d2JGcUpDaGQ0bWVOUmp3bDQra3I5ZHJLNGo5NkEveUYyM3lt?=
 =?utf-8?B?Y3FQbWNxYUJoTW5GUjM3Z2dENWsxVGp0ZnJRRWNSSGhWT1NUTjRPdUUzS1ZO?=
 =?utf-8?B?SFN1TCt6SFJqQmlDQWlyR2RVNE9PTno1ZHlaNktlalkrbVptcWs1YVpNMTRj?=
 =?utf-8?B?cUdXUDBLOHZnSTNSb3I0R2FNcFNLbWdORU1zR05wRWNiR3JGYmdNQldwQXpP?=
 =?utf-8?B?b0xZYUo2TGJ3aEQ1N0dWYlE4YmhFZ1dIWkZNc3VKUStLVng1aFIva2lwZ0g0?=
 =?utf-8?B?aS9sSTFzbElzYnFNRWZjY0VJWHNhVkNxSnlhRjB2TmxNVDdOQnQ1a28vcXNt?=
 =?utf-8?B?OGYxdHNRSkhIUXIzUlRmT2RFMGNRK2dNczdDT3Y5blJEZ0RacmViS3M4Nktp?=
 =?utf-8?B?TVVrRCsxRmE3VUgraWNuNVJaWlZzNGovNmVCcXFDOXZrUjNzR3dTbHJia1dE?=
 =?utf-8?B?TWpyMXJaTFEzSGNRazA5Q1BQbmdWdk9qRUYyWjlXMjMyMDhaS3lTSERmamhv?=
 =?utf-8?B?VVg3T0IyWDJXUVZOUlR1Ym41WStnWlVwakJveXhLemZ5b0RZUS9NYis3VGI2?=
 =?utf-8?B?QThua3ZBYW9xejVROU5YcS81c2gxUXVzNmlBN2crUm80MGEra1NIbHM2KzVU?=
 =?utf-8?B?SE5QSHV5azNKbVdaSVV6dUZWSlAyM2hPQjhpc2I5TzJlaWpSNFdneW1PQ1l2?=
 =?utf-8?B?MlpMKzlqekN4RlJhaWE4RnZXVUFzdkt5OXVHeXJHQ29iemYreVA1OUdoL1Nx?=
 =?utf-8?B?WldobFpjQ1Y0b0ZGZjZqTzkyNlhaenV2eC9YMmN6S3hLVTNuTXk1bGREVEkr?=
 =?utf-8?B?eUtaeU1kOXpnQytaQy9vTmkzQ20xdHFmb1hUK3pYZGs2R0V4LzJpNjc2NUYv?=
 =?utf-8?B?UE5ZdVdaZUFWVmJxQjNIZEYwTlRldGk2T2w2ZXdIWHcrSzZORStpVXhhT3VG?=
 =?utf-8?B?dHFCUFpZSUhFb1NEeVlOKzArQk1ZakxFREpqd3dDTUFCWlRqZ2pqbHhmODFh?=
 =?utf-8?B?UjNIMjNPbkVJZlhDMTJvRllIWGg5UzVMRms5UHRTRTI2QlZyUE5lWHMxQ0xx?=
 =?utf-8?B?azFpMnFGc0xkRndrMmMrcGgxZUFJRkZHOTlJN3BtaVBuZmladFc0RDMvMnd3?=
 =?utf-8?B?OWtaL1NKbCtyeDJiWUl0RVRTaEpDTUY4UmYwUnlXVHN5QlZaNmlIWjBFdnlX?=
 =?utf-8?B?ZVVCSTNJZEZ3N085QWg1cDRrWmZCT3FSVG5FaCt2amF2Y28vOTlpK09tNDNI?=
 =?utf-8?B?dmRjNDJKVTBjSVF2S00rcjJST2hvaEJqY01Tamc2ajMwZ0JJdDNRVmJpWjJN?=
 =?utf-8?B?SStBMDJsYjRJaGloYi9tNGxqamY1dytGR0pwTGk1Z283N2hoRzBza3lyclFM?=
 =?utf-8?B?TXFWanlFQTBrRXdmRTNsS1VJQ015V0tCTGFmdkRRcFlsRHJ1b2Zydk5KMDJk?=
 =?utf-8?Q?twBWWt8GZXLCUKSLdrCt2v5hYpJtYqkB7Mb6Kn9?=
x-microsoft-antispam-prvs: <CY1PR11MB1031E7F48BDB30A3F3317A0CC77F0@CY1PR11MB1031.namprd11.prod.outlook.com>
x-forefront-prvs: 09565527D6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(39860400002)(346002)(136003)(189003)(199004)(2501003)(53936002)(68736007)(6486002)(76176011)(33656002)(6436002)(6506007)(106356001)(14454004)(6116002)(6512007)(99286004)(93886005)(6306002)(97736004)(446003)(102836004)(105586002)(476003)(2616005)(25786009)(11346002)(3480700005)(46003)(8676002)(82746002)(81166006)(81156014)(6246003)(486006)(2906002)(5660300002)(229853002)(36756003)(86362001)(305945005)(256004)(110136005)(58126008)(7736002)(316002)(8936002)(478600001)(186003)(83716004)(966005)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR11MB1031;
 H:CY1PR11MB1031.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FeKalzjyRd/9GU2RwvPA9J7ttiaWulfuVmativGrpkQWMTQX9xF7YF0rmiWN9je6xk62MSTlsYWZiuNc2V1h/0CrsMSxbfIfBRerfV8v78f+Usq4DQLfDAWT84jlaDLLUxSKwnLfelA25AWQNF0f2O3uc8R47jptagxPUYYaL4tDzp3JbMsXaUUM7sUYo9Y6xahtNZHPPTQKKTNBIFKomiP7RC9oxsLrvGhve+qGJuSqEPirPFnpFtymB5qgT/E55Bw1IBfDK87JcEU4C8XNof5KWAsNxNQ7/Uhc6PvAmBKMZ0Iwuy4Mn4QBn+LXniHjvhbOKP0V78sjMFTAs4WzbQeEbduAAjBXzMHp2IUT9xRW7TyP+mC/XR9vMmZsKmjtGG5IJ1xgnXrnn5MhywgcGCV7tCYMKTk1/uiXm+SjPz4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3211F5412F82748BEF689F5EAAD5562@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ca8a28-a48c-4591-d2aa-08d69889e5e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2019 05:52:15.2890 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR11MB1031
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.26, xch-rcd-016.cisco.com
X-Outbound-Node: alln-core-2.cisco.com
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
X-List-Received-Date: Fri, 22 Feb 2019 06:02:58 -0000

SGVsbG8gV2lsbCwNCg0KDQpPbmUgbW9yZSB0aGluZyBhYm91dCBlbmFibGluZyBFQ0M6DQoNCj4g
RUNDIG5lZWRzIHRvIGJlIGVuYWJsZWQgaW4gdS1ib290LiBUaGUgcmVhc29uIGlzIGV4cGxhaW5l
ZCBpbiBteSBmaXJzdCB1cGxvYWQNCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRj
aC8xMDczMjc2OS8NCj4gDQo+IE91ciB1LWJvb3QgZW5naW5lZXIgZGlkIGl0IGZvciB1cy4gSSBz
ZWUgdS1ib290IGNvZGUgaXMgZnVsbCBvZiAjaWZkZWYgQ09ORklHX0RSQU1fRUNDIGJsb2Nrcy4N
Cj4gSW4gdGhlb3J5LCBlbmFibGluZyB0aGlzIG9wdGlvbiBzaG91bGQgYmUgZW5vdWdoLg0KPiAN
Cj4gDQo+IC0gQSBnb29kIGluZGljYXRpb24gb2YgaGF2aW5nIEVDQyBzdWNjZXNzZnVsbHkgZW5h
YmxlZCBpcyBsaW51eCBhY3R1YWxseSBib290aW5nLg0KPiAtIEFub3RoZXIgaW5kaWNhdGlvbiBp
cyBhdmFpbGFibGUgbWVtb3J5IGJlaW5nIDgvOXRoIG9mIHdoYXQgaXQgdXNlZCB0byBiZSAoY2hl
Y2sgL3Byb2MvbWVtaW5mbykNCj4gLSBUaGVuLCBteSBkcml2ZXIgc2hvdWxkIG5vdCBsb2cgYW55
IGVycm9ycyBpbiBpdHMgcHJvYmUgZnVuY3Rpb24gKGNoZWNrIGRtZXNnKS4NCg0KDQpXaGlsZSB5
b3UgaGF2ZSBub3Qgc2V0IHVwIEVDQyBtb2RlIGluIHUtYm9vdCB5ZXQsIHlvdSBtaWdodCBiZSBh
YmxlIHRvIHVzZSB0aGUNCmVkYWMgZHJpdmVyIGJ5IHJlbW92aW5nIHRoZSBmb2xsb3dpbmcgY29k
ZSBpbiBhc3BlZWRfcHJvYmUoKQ0KDQoJLyogYmFpbCBvdXQgaWYgRUNDIG1vZGUgaXMgbm90IGNv
bmZpZ3VyZWQgKi8NCglyZWdtYXBfcmVhZChhc3BlZWRfcmVnbWFwLCBBU1BFRURfTUNSX0NPTkYs
ICZyZWcwNCk7DQoJaWYgKCEocmVnMDQgJiBBU1BFRURfTUNSX0NPTkZfRUNDKSkgew0KCQlkZXZf
ZXJyKCZwZGV2LT5kZXYsICJFQ0MgbW9kZSBpcyBub3QgY29uZmlndXJlZCBpbiB1LWJvb3RcbiIp
Ow0KCQlyZXR1cm4gLUVQRVJNOw0KCX0NCg0KVGhpcyB3aWxsIHJ1biB0aGUgcHJvYmUgZnVuY3Rp
b24gaG9wZWZ1bGx5IHRvIHRoZSBlbmQgYW5kIGV4cG9zZSB0aGUgc3lzZnMgbm9kZXMuDQpJIGhh
dmUgbm90IHRlc3RlZCBpdC4gTWF5YmUgeW91IG5lZWQgdG8gZnVydGhlciBidXRjaGVyIGRvd24g
dGhlIGRyaXZlcj8NCg0KDQpZb3UgY2FuIHRoZW4gaW5qZWN0IGZha2UgZWNjIGVycm9ycyB2aWEg
dGhlIGtlcm5lbCBkZWJ1ZyBmcmFtZXdvcms6DQoNCnJvb3RAYXNwZWVkLWFybTovIyBlY2hvIDQy
ID4gL3N5cy9rZXJuZWwvZGVidWcvZWRhYy9tYzAvZmFrZV9pbmplY3QgIA0KDQpyb290QGFzcGVl
ZC1hcm06LyMgZG1lc2cgfCB0YWlsIC0xDQpbICAyOTMuMDIwMDAwXSBFREFDIE1DMDogMSBDRSBG
QUtFIEVSUk9SIG9uIG1jIzBjc3JvdyMwY2hhbm5lbCMwIChjc3JvdzowIGNoYW5uZWw6MCBwYWdl
OjB4MCBvZmZzZXQ6MHgwIGdyYWluOjAgc3luZHJvbWU6MHgwIC0gZm9yIEVEQUMgdGVzdGluZyBv
bmx5KQ0KDQpyb290QGFzcGVlZC1hcm06LyMgY2F0IC9zeXMvZGV2aWNlcy9zeXN0ZW0vZWRhYy9t
Yy9tYzAvY2UqDQoxDQowDQoNCg0KQlRXLCBoZXJlIGFyZSBteSBub3RlcyBvbiBFREFDIGFuZCBF
Q0Mgb24gQXNwZWVkIHdoaWNoIHlvdSBtaWdodCBmaW5kDQppbnRlcmVzdGluZzogaHR0cDovL3N0
dWRlbnRzLmVuZ3Iuc2N1LmVkdS9+c3NjaGFlY2svbWlzYy9hc3BlZWQtZWRhYy5odG1sDQoNCg0K
DQpIb3BlIHRoYXQgaGVscHMsIFN0ZWZhbg0KDQo=
