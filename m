Return-Path: <sschaeck@cisco.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cisco.com
 (client-ip=173.37.142.88; helo=alln-iport-1.cisco.com;
 envelope-from=sschaeck@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=cisco.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.b="f+njOCDw"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=cisco.onmicrosoft.com header.i=@cisco.onmicrosoft.com
 header.b="DYunh/63"; dkim-atps=neutral
X-Greylist: delayed 630 seconds by postgrey-1.36 at bilbo;
 Fri, 22 Feb 2019 17:02:53 AEDT
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445LNY2KVpzDqQG
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 17:02:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2028; q=dns/txt; s=iport;
 t=1550815373; x=1552024973;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=O/zKX7UGfCeucWeZC3CA1vC2C5FKSUU2j8AZkTFRU/s=;
 b=f+njOCDwlYyNTh8LDY/1U7E70OEGcdMRVuQ5p3E2JZ2SjmXyH7wggsM8
 YsbosbCmarIRu6STk4TCxw+StxNj73gDjysKLj0LcvGQCl7Z19hQYxKNx
 +08Z1qKO5g/5qSDks/zQnlmmpmwqyFR/PDdOwzbiLnsKXNn4dr58QwYgU s=;
IronPort-PHdr: =?us-ascii?q?9a23=3AYN14LRGbpdkDrvDiQFo+tJ1GYnJ96bzpIg4Y7I?=
 =?us-ascii?q?YmgLtSc6Oluo7vJ1Hb+e4z1Q3SRYuO7fVChqKWqK3mVWEaqbe5+HEZON0pNV?=
 =?us-ascii?q?cejNkO2QkpAcqLE0r+eeXxZCwzEc9BfFRk5Hq8d0NSHZW2ag=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AnAAAojW9c/4UNJK1lHAEBAQQBAQc?=
 =?us-ascii?q?EAQGBUQcBAQsBgTBQA4FbBAsnhAeDRwOEUIsNgleYHoEkA1QLAQEshEACF4N?=
 =?us-ascii?q?jIjQJDQEDAQECAQECbRwMhUsBBAEjEQwBATcBDwIBBgIaAiYCAgIwFRACBAE?=
 =?us-ascii?q?NBYMggVsDDQgBkACQWgKKFHGBL4J4AQEFhQgYggsIgQuLPReBQD+BEScfgky?=
 =?us-ascii?q?FAQcQI4JPMYImkFGTBQkCkl0SB5MMikuSCwIEAgQFAg0BAQWBRziBVnAVZQG?=
 =?us-ascii?q?CQYIcg26KU3KBKI5jAQE?=
X-IronPort-AV: E=Sophos;i="5.58,398,1544486400"; d="scan'208";a="240019455"
Received: from alln-core-11.cisco.com ([173.36.13.133])
 by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2019 05:52:27 +0000
Received: from XCH-RCD-014.cisco.com (xch-rcd-014.cisco.com [173.37.102.24])
 by alln-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id x1M5qRjC028652
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
 Fri, 22 Feb 2019 05:52:27 GMT
Received: from xhs-aln-002.cisco.com (173.37.135.119) by XCH-RCD-014.cisco.com
 (173.37.102.24) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 21 Feb 2019 23:52:26 -0600
Received: from xhs-rtp-003.cisco.com (64.101.210.230) by xhs-aln-002.cisco.com
 (173.37.135.119) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 21 Feb 2019 23:52:26 -0600
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-003.cisco.com (64.101.210.230) with Microsoft SMTP Server
 (TLS) id
 15.0.1395.4 via Frontend Transport; Fri, 22 Feb 2019 00:52:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
 s=selector1-cisco-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/zKX7UGfCeucWeZC3CA1vC2C5FKSUU2j8AZkTFRU/s=;
 b=DYunh/63cbJRNPflqqxWRcswYhe9IwgKpM2tXMc36p9BgmN6zuxTTN8T5XtCkZW7KOQ+hixxLZyWpEKsDl3yPyKolL5STznhuX3nyyFRvNLywsM4XMoZaqMmTgzNELeOJACH7+1b/QE4Z4tVIxDWFMNvbZW6nIlSHRZiZfkQ0F8=
Received: from CY1PR11MB1031.namprd11.prod.outlook.com (10.164.69.21) by
 CY1PR11MB1031.namprd11.prod.outlook.com (10.164.69.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.14; Fri, 22 Feb 2019 05:52:24 +0000
Received: from CY1PR11MB1031.namprd11.prod.outlook.com
 ([fe80::10b4:7c05:8b97:5e2c]) by CY1PR11MB1031.namprd11.prod.outlook.com
 ([fe80::10b4:7c05:8b97:5e2c%8]) with mapi id 15.20.1643.016; Fri, 22 Feb 2019
 05:52:24 +0000
From: "Stefan Schaeckeler (sschaeck)" <sschaeck@cisco.com>
To: =?utf-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>,
 Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
CC: "dkodihal@in.ibm.com" <dkodihal@in.ibm.com>
Subject: Re: ECC memory of BMC  
Thread-Topic: ECC memory of BMC  
Thread-Index: AQHUybSi/1kxVex+v0iiRwJ/nsfKoaXp2kyAgAEdUYCAABmdgP//utKA
Date: Fri, 22 Feb 2019 05:52:24 +0000
Message-ID: <EC804DC2-940C-431E-A358-B803CDE93F5C@cisco.com>
References: <88e05768447d466ca674e12e20c650dc@quantatw.com>
 <96605da0-113a-4d43-994a-f081f30af71e@www.fastmail.com>
 <66dac7974c444060a9b4b1052b00d072@quantatw.com>
 <8b3b8d3a-9cf5-4f7d-9993-e71fd3cd6e07@www.fastmail.com>
 <8f0d3dec56434a0484f6d5172c036ed4@quantatw.com>
In-Reply-To: <8f0d3dec56434a0484f6d5172c036ed4@quantatw.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.7.190210
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sschaeck@cisco.com; 
x-originating-ip: [2001:420:c0c8:1008::246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db46bf00-1f44-4b0d-6aa0-08d69889eb51
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:CY1PR11MB1031; 
x-ms-traffictypediagnostic: CY1PR11MB1031:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtDWTFQUjExTUIxMDMxOzIzOkFILzBObUNYR2VGLzI1Z2ZZdXZGWW9uT05B?=
 =?utf-8?B?dDNxWTc3YklnZmZ2RzB4QzRtTjFocXBFOGFuZDFVMFg1TnlXUTJPZU1keFVk?=
 =?utf-8?B?emEwMmFwWFh1QlZBYmlIb0NWS0hSN25iRzJmTWRlMWhNQ0lSRzRDYkJUd3Jj?=
 =?utf-8?B?ek1laGRHTWpXc0J4U0FWaVFHU2F1dks2OHNmdmo0dVpQQ1JBM2RJc2dKZzcv?=
 =?utf-8?B?WitKaWZoVkJRRjgyL2VlRFlEVnh2M2IwbDJEcTBkYkt0dVg0dlF3djFIb0t2?=
 =?utf-8?B?ZktsOUd3L1RZdXZZMHNVcER4bytZdjdvdmtVNjJHV0JyNjk1c3lMUDVrcnFv?=
 =?utf-8?B?MW8vcm1TOFAvaVhTUkpUaFRFU0JoNDNQZExzcVJYTlpkVTRNNHEzdXFLSDFE?=
 =?utf-8?B?NVd0UEk5YWRzNnM5eG1JS0Rrb2VyOXNzaXh6Y2UrV2U5ZGdHQkRHbmoyVjBJ?=
 =?utf-8?B?K0ppZFhVWlZDR01JYWN6eGtIY2ZNZGQrTEo1OEJJY1NFWVdQZmFHeGEvdmVx?=
 =?utf-8?B?WGFGSGttSzBodWhBQzJiMnVoL2c5SXN6NUFFME9mQ0trdEFIWWFRenJ2Rzhv?=
 =?utf-8?B?OG5PUFI0Wnk5QnJHY294d1F4c2JMVlFoYWtTbVExU0w0Vmk4eWZuOHZ2TVcr?=
 =?utf-8?B?cnQwaC80NDdnK00wRDAvM2lJYnpveUx3bnMvVzlsMVNKUnBtSkRIbHdaMkYz?=
 =?utf-8?B?NjVjNDd6Z0E5eGY5TXQ1QUVHb3BEVDRXWkhNS3NiUmN1VllQU0huK0FUR1dP?=
 =?utf-8?B?NHhXVDRLclRnNSs2UWFHeTZNZTFYQlJxQUQrRVFlWk9sb3pwQnlvSjFnSEFH?=
 =?utf-8?B?RFlzMlNqeFQyRFNyeDRCdGxhaERWNnZOZ20xZ3ppSUpyMUl4WExvYmpzWmJY?=
 =?utf-8?B?c2M1MjlUdUpNVE9HV0JSc2VRZ3h2c0hSOGV6cEZCMHU5bmFKcnpTeTE0emxa?=
 =?utf-8?B?S2FZZGVDVFhHbmtkVnZSV0NSQUVTY3FIK2g5VFoyS2YrWGFYL3FwYktUck9q?=
 =?utf-8?B?MXY2bG9WOU52U3RkMzFwZzJleThSTVdPVmx6RW8wbjJWVzRkRmRmRVNwSm9p?=
 =?utf-8?B?Ti9Ga3ZxYVkzcEdsSDY2dmZDRUF1NjljQVQ2d1Jyck5LVDhCc0tQUjh5QWVR?=
 =?utf-8?B?TjdTdUVodHMvZVR2NHg4ODNEdEU3TEhZM1Jlb0xJSGdNMzJYcUJsSGdJcFNi?=
 =?utf-8?B?TFdXMUtKYmlWaGg3aDhoWmVZVjBnY01JTGVPU0FqVjdSc1hzUFBhdyt4Y1Nk?=
 =?utf-8?B?VnZVVmkyc0MrZENsMkhUQzBQN1hXaUNXWExEZzZpZVBjbStXVFhLTjN3SDRv?=
 =?utf-8?B?NjFDUjJ6ekJvS1ROWHMwVklrMjFDejhYNVoyM3lhNWxUb1FYRUltc3ZDNzZD?=
 =?utf-8?B?ZDdaMEh4Y0k3TGNUZ0R0ODhRcFRWQXh1K0swREFtRS90NWVrRG9vL29PN2w2?=
 =?utf-8?B?UysveFhVaWkwM1drM3JsQUNvUmN4a2g0MFdwVXQ4THduR2NmdE5DNmwxdVhw?=
 =?utf-8?B?dkp3Q2tCKzB2THFocElrM2NKT1lWVkpnUENkR2k5cTh0SkwyY2dXUEh3eXFi?=
 =?utf-8?B?dTdtc25tYnM4NjBpRUxKTTJQeDV1Y01ydmxJOCtwNm1naWVpNXp1NmJYVGQ5?=
 =?utf-8?B?SlZLZkZvalhoUUJrQU5nd2R4TmhtOUdzNDRLbE0xWUFvS3p1VWVwSDVCR0dR?=
 =?utf-8?Q?nLoRDkFf0bCmjY3lm++a5KLo6ojJuvT16cMr/sK?=
x-microsoft-antispam-prvs: <CY1PR11MB10313FF9513A92C9A3BF5F23C77F0@CY1PR11MB1031.namprd11.prod.outlook.com>
x-forefront-prvs: 09565527D6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(39860400002)(346002)(136003)(189003)(199004)(2501003)(53936002)(68736007)(6486002)(76176011)(33656002)(6436002)(6506007)(106356001)(14454004)(6116002)(6512007)(99286004)(93886005)(97736004)(446003)(102836004)(105586002)(476003)(2616005)(25786009)(11346002)(3480700005)(46003)(8676002)(82746002)(81166006)(81156014)(6246003)(486006)(2906002)(5660300002)(229853002)(36756003)(86362001)(305945005)(256004)(110136005)(58126008)(7736002)(316002)(8936002)(14444005)(478600001)(186003)(4326008)(83716004)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR11MB1031;
 H:CY1PR11MB1031.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LKTGfnpcNIrFrFlte45eTS1Fkd60LQxN/YpS+6BdzE3vbuo71m36xL4t9sjqdhqbAz0dIaH3OmDB80816YGjCKRqYTJouUqo58FaobIQnxVkBb3ftSJzfHMZVmwdqIyzml4YE2mDigkgWjHsq5brzEq1wnAjFfb1vpLXknc2GiECiGGxxFJb4yzD/KRHACsrBmXZWczySL3brhVcLSQBJgnhhTlX5I1PHVCvqdqSy5Sb9L5O5nBjRrnaNtU1TUQI6ol+DqHkeFj/840QYFrnVFl1QXmWg9ke2ItxxobJB+ZFAAN+C2y/LNuBsXeIvtMcx6qVLdKVPiN6xSuPM7fLopg7POKjp19kzxjcVCPmSPbpJS+D2NEJfDDckDA4KLSBvoAZDXE2UNIHjp0QLkdLxyL5yHjRw8Tc53+hL6YkLpw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D75EF908B238F14F9F0FBE45F43220EF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: db46bf00-1f44-4b0d-6aa0-08d69889eb51
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2019 05:52:24.3845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR11MB1031
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.24, xch-rcd-014.cisco.com
X-Outbound-Node: alln-core-11.cisco.com
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
X-List-Received-Date: Fri, 22 Feb 2019 06:02:55 -0000

SGkgV2lsbCwNCg0K77u/T24gMi8yMS8xOSwgNjowMCBQTSwgIldpbGwgTGlhbmcgKOaigeawuOmJ
iSkiIDxXaWxsLkxpYW5nQHF1YW50YXR3LmNvbT4gd3JvdGU6DQoNCj4gPiA+IFdoYXQgd2Ugd2Fu
dCB0byBkbyBpcyB0byByZWNvcmQgdGhlIEVDQyBldmVudHMgdG8gU0VMLg0KPiA+ID4NCj4gPiA+
IHdlIGFyZSBjb25zaWRlcmluZyB0byBjcmVhdGUgbmV3IGRidXMgYW5kIGEgc2VydmljZS4NCj4g
PiANCj4gPiBSaWdodDsgSSB0aGluayB5b3UgbmVlZCB0byBjcmVhdGUgYSBuZXcgc2VydmljZSB0
aGF0IHBvbGxzIHRoZSBzeXNmcyBpbnRlcmZhY2UgZm9yDQo+ID4gdGhlIEVEQUMgZGV2aWNlLCBh
bmQgdGhlbiB1c2UgcGhvc3Bob3ItbG9nZ2luZyB0byBjcmVhdGUgZXJyb3IgbG9ncy4gDQo+DQo+
IFdlIGNvbnNpZGVyIGNyZWF0aW5nIHRoZSBmb2xsb3dpbmcgb2JqZWN0cyBmb3IgRC1CdXM6DQo+
IC1idXMgbmFtZSA6IC94eXovb3BlbmJtY19wcm9qZWN0L0VDQw0KPiAtb2JqZWN0IHBhdGggOiAv
eHl6L29wZW5ibWNfcHJvamVjdC9FQ0Mvc3RhdHVzDQo+IC1pbnRlcmZhY2UgOiB4eXoub3BlbmJt
Y19wcm9qZWN0Lk1lbW9yeS5NZW1vcnlFQ0MNCj4NCj4gYW5kIGVycm9yIHR5cGVzIGZvciB4eXo6
Om9wZW5ibWNfcHJvamVjdDo6TWVtb3J5OjpFY2M6OkVycm9yOjpjZUNvdW50IGFuZCAidWVDb3Vu
dCINCj4gYW5kICJpc0xvZ2dpbmdMaW1pdFJlYWNoZWQiIGZvciBwaG9zcGhvci1sb2dnaW5nIGVy
cm9yIG1lc3NhZ2UuDQoNCg0KTm90ZSwgdGhlIGRyaXZlciBhbHNvIGxvZ3MgdGhlIGFkZHJlc3Nl
cyBvZiB0aGUgcmVjb3ZlcmFibGUgYW5kIHVuLXJlY292ZXJhYmxlDQplcnJvcnMuIFBlcmhhcHMg
eW91IHdhbnQgdG8gZXhwb3NlIHRoZW0sIHRvbz8NCg0KVGhlIGVkYWMgZnJhbWV3b3JrIGlzIHVu
Zm9ydHVuYXRlbHkgbm90IGV4cG9zaW5nIHRoZW0gdGhyb3VnaCBzeXNmcy4gVGhleSBnZXQNCnBy
aW50ZWQgdGhyb3VnaCAiZWRhY19tY19oYW5kbGVfZXJyb3IoKSIgYXMgcHJpbnRrKEtFUk5fV0FS
TklORywgLi4uKSBhbmQgbG9vaw0KbGlrZQ0KDQpyb290QGFzcGVlZC1hcm06IyBkbWVzZyB8IGdy
ZXAgRURBQw0KWyAxNzE4LjkwMDAwMF0gRURBQyBNQzA6IDEgQ0UgYWRkcmVzcyhlcykgbm90IGF2
YWlsYWJsZSBvbiBtYyMwY3Nyb3cjMGNoYW5uZWwjMCAoY3Nyb3c6MCBjaGFubmVsOjAgcGFnZTow
eDAgb2Zmc2V0OjB4MCBncmFpbjowIHN5bmRyb21lOjB4MCkNClsgMTcxOC45MDAwMDBdIEVEQUMg
TUMwOiAxIENFIG9uIG1jIzBjc3JvdyMwY2hhbm5lbCMwIChjc3JvdzowIGNoYW5uZWw6MCBwYWdl
OjB4ODAwMDAgb2Zmc2V0OjB4MCBncmFpbjowIHN5bmRyb21lOjB4MCkNCg0KDQpJJ20gbm90IHN1
cmUgaWYgdGhlcmUgaXMgYW4gZWxlZ2FudCB3YXkgZm9yIHVzZXJzcGFjZSB0byByZXRyaWV2ZSBt
ZXNzYWdlcyBmcm9tDQp0aGUga2VybmVsIHJpbmcgYnVmZmVyLg0KDQogU3RlZmFuDQoNCg0KDQo=
