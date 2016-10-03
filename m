Return-Path: <william.bjlinan@hotmail.com>
Received: from COL004-OMC4S14.hotmail.com (col004-omc4s14.hotmail.com
 [65.55.34.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3snkFg4CdpzDrDv
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 01:00:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b=Q1uMW5h3; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com ([65.55.34.199])
 by COL004-OMC4S14.hotmail.com over TLS secured channel with Microsoft
 SMTPSVC(7.5.7601.23008); Mon, 3 Oct 2016 07:00:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OpKsC9l0ml6vlWZH/9etDtDWXROQahiWH4r9tl1kwh4=;
 b=Q1uMW5h3N4n5nPrQIyP8/Z+2egg9/xOEhRXvdEBm+GFufR6xBwpHtKulZOH87KCI9QFQKMuDvDVUzed+gcRI9Cxy6r80k87zjhAJ5ToDwjlbF7wuh9PG75O0HD/G5waRFYpS0owpG2gw/NcJgcWEPmBD1iIJekH7zt9f/Q4PoMGwgu8MONZioDlRjnPSmqIr1QOGrU+XntJ15BTCeVjkp6mz6RrnKObPsPhCsh2Ns+pCUH3NfFNCDsUkJa/MfIERX0p3vIdMDW++N28vPqG2YFAa607JJwTCd/V4zD4SUMeAhCWZc2QBf5SDkloJHINwuxSYaYK5d8uEwm+jVjWRug==
Received: from HK2APC01FT115.eop-APC01.prod.protection.outlook.com
 (10.152.248.54) by HK2APC01HT018.eop-APC01.prod.protection.outlook.com
 (10.152.249.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.629.5; Mon, 3 Oct
 2016 13:59:59 +0000
Received: from TY1PR06MB0863.apcprd06.prod.outlook.com (10.152.248.57) by
 HK2APC01FT115.mail.protection.outlook.com (10.152.248.194) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.629.5 via Frontend
 Transport; Mon, 3 Oct 2016 13:59:58 +0000
Received: from TY1PR06MB0863.apcprd06.prod.outlook.com ([10.164.99.139]) by
 TY1PR06MB0863.apcprd06.prod.outlook.com ([10.164.99.139]) with mapi id
 15.01.0649.021; Mon, 3 Oct 2016 13:59:58 +0000
From: Li Nan <william.bjlinan@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: IPMI LAN command story design - try 3rd send
Thread-Topic: IPMI LAN command story design - try 3rd send
Thread-Index: AQHSHX4EV3As9hwocUyH/bdovV4DKA==
Date: Mon, 3 Oct 2016 13:59:58 +0000
Message-ID: <TY1PR06MB0863871D99A02C72E98F2462F6C20@TY1PR06MB0863.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=softfail (sender IP is 10.152.248.57)
 smtp.mailfrom=hotmail.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=fail action=none
 header.from=hotmail.com;
received-spf: SoftFail (protection.outlook.com: domain of transitioning
 hotmail.com discourages use of 10.152.248.57 as permitted sender)
x-tmn: [c62I15v008vi3FpSoOhik+1VQch+vpQE]
x-eopattributedmessage: 0
x-microsoft-exchange-diagnostics: 1; HK2APC01HT018;
 6:80s7F4bB7YfRnG/FAPR8iOVZJp9RwRr4y6RQ2anfaWYmmEodHuA6nlutLttYDR7xwAmeXQUk1IzL5lX+gaS8XKohobjv/ZNQU4MphsQHsOC4WDJ0ek8ezarW4lRHVPPmi89zNyU9lZzLLoBH5Qsi/8bnQcdrnCpZJqUDFxeNbKJuz+gUcjJ2bMh3no0LlMV0BjEWbXJvPkCg7yJBE+qHSodHQ6UZeCGdU2Ti4sM7QIzLgZPCfLe3ljEHZqgCaTIhXQwjjQZTm98o0CegMzvq657cwOp1Yx5RGR4SbpNHdnM=;
 5:06EoSNZWD1gBsa3HhtIqoVtTw+cGhXCzqeELPfGecT0I7Eg1/KFqsrLnEyYVdFIHlWSUXfjOvVbhtd5vU2sqE5lCE/kj8hRpYPXJmjPkiP4+lgmMjeThFIhI6+1voU7VmNpTvVHp8lv4E8h49UeXUQ==;
 24:noq8LUQQrt5auBnVqn06fZ7WY7IZeoKAYYcYeiHp7q8g0Yf/S+ZXykByjpOrK2TfbrdKGCqlPjmWolQ7PD+WpFKh5P5f6jXmwXWek4rj5KY=;
 7:pOtoouAZhlpoMwLO2PmakLYLkxUky4RuT7xDXE1w01Dr9uIcUtGsqYzn2J8kbqjMZezAv4BwhKjgeu3RDePYkHFrxCfuFylu1dwC7yJxWxZZT5UMjXiyP1pjkqNjmAbUsTvv+zA92lwgKEsjGVb75TgP7U01zGa6uZiea3i4ITvgpnMSkyAhsVdxWG4D1zDs4bAUiCWfPHynaCqE+31ejKQKwXpkdOrqEVhe6APlG1ebYr5FUgfLJ4P+r85yMdWHo7wQjgeLTUEh7H2CP/tOFKKrxXhb9oB11sg9WGfLrnxRbBxCQrmCMUr2G+1Xiwdn
x-forefront-antispam-report: EFV:NLI; SFV:NSPM; SFS:(10019020)(98900003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:HK2APC01HT018;
 H:TY1PR06MB0863.apcprd06.prod.outlook.com; FPR:; SPF:None; LANG:en; 
x-ms-office365-filtering-correlation-id: 75f88f89-d58a-4d7e-527f-08d3eb959011
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(1601124038)(1603103081)(1601125047)(1603101230); SRVR:HK2APC01HT018; 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(432015012)(82015046);
 SRVR:HK2APC01HT018; BCL:0; PCL:0; RULEID:; SRVR:HK2APC01HT018; 
x-forefront-prvs: 008421A8FF
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_TY1PR06MB0863871D99A02C72E98F2462F6C20TY1PR06MB0863apcp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2016 13:59:58.7879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT018
X-OriginalArrivalTime: 03 Oct 2016 14:00:02.0225 (UTC)
 FILETIME=[6F947210:01D21D7E]
X-Mailman-Approved-At: Tue, 04 Oct 2016 01:21:41 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Oct 2016 14:00:11 -0000

--_000_TY1PR06MB0863871D99A02C72E98F2462F6C20TY1PR06MB0863apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgdGVhbSwNCg0KSSdtIHdvcmtpbmcgb24gdGhlIHN0b3J5IG9mIENvbmZpcm0gTEFOIENvbW1h
bmQgbWVldCBJUE1JIDIuMA0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy9pc3N1
ZXMvNDQ0DQoNCg0KPGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvaXNzdWVzLzQ0
ND4NCg0KSSBzdW1tYXJpemUgc29tZSBmaWVsZHMgb2Ygc2V0dGluZ3MgYmVsb3csIGFuZCBuZWVk
IHNvbWUgaGVscCB0byBjb25maXJtIHRoZSBkaXJlY3Rpb24gb2YgbXkgd29yay4NCg0KYGBgDQoN
CjEuICAgIElQTUkgTEFOIGNvbW1hbmQgc3RhdHVzIGFuZCB3b3JrIHBsYW4NCjEuMS4gIEN1cnJl
bnQgc3RhdHVzDQpJUE1JIExBTiBjb21tYW5kIGNvbnNpc3RzIG9mIDQgY29tbWFuZCAoIHJlZmVy
IHRvIElQTUkgMi4wIFNwZWMsIENoYXB0ZXIgMjMgKTogIFNldCBMQU4gQ29uZmlndXJhdGlvbiBQ
YXJhbWV0ZXJzLCBHZXQgTEFOIENvbmZpZ3VyYXRpb24gUGFyYW1ldGVycywgU3VzcGVuZCBCTUMg
QVJQcyBhbmQgR2V0IElQL1VEUC9STUNQIFN0YXRpc3RpY3MuDQpFeGlzdGluZyBjb2RlIGluY2x1
ZGVzIGltcGxlbWVudGF0aW9uIG9mIFNldC9HZXQgTEFOIGNvbmZpZ3VyYXRpb24gUGFyYW1ldGVy
cy4gKCBSZWZlciB0byBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1ob3N0LWlw
bWlkL2Jsb2IvbWFzdGVyL3RyYW5zcG9ydGhhbmRsZXIuY3BwICkNCjEuMi4gIElQTUkgTEFOIENv
bW1hbmQgSGFuZGxpbmcNCkV4YW1wbGUgZm9yIFNldCBMQU4gQ29uZmlndXJhdGlvbiBQYXJhbWV0
ZXJzLg0KUGFyYW1ldGVyDQoNCiMNCk51bWJlcg0KDQpJUE1JIGhhbmRsaW5nDQoNCmRidXMgbWV0
aG9kDQoNClNldCBJbiBQcm9ncmVzcyhWb2xhdGlsZSkNCg0KMA0KDQpwaG9zcGhvci1ob3N0LWlw
bWlkL3RyYW5zcG9ydGhhbmRsZXIuY3BwLCBMaW5lIDIwOS4NCnZhcmlhYmxlIGxhbl9zZXRfaW5f
cHJvZ3Jlc3MgYWN0IGFzIGEgc3RhdGVtYWNoaW5lLg0KDQpObyBuZWVkLg0KDQpBdXRoZW50aWNh
dGlvbiBUeXBlIFN1cHBvcnQoUmVhZCBPbmx5KQ0KDQoxDQoNCnBob3NwaG9yLWhvc3QtaXBtaWQv
dHJhbnNwb3J0aGFuZGxlci5jcHAsIExpbmUgMzA1Lg0KU2V0ICB0byAweDQgKE1ENSkNCg0KTm8g
bmVlZC4NCg0KQXV0aGVudGljYXRpb24gVHlwZQ0KRW5hYmxlcw0KDQoyDQoNCnBob3NwaG9yLWhv
c3QtaXBtaWQvdHJhbnNwb3J0aGFuZGxlci5jcHAsIExpbmUgMzExLg0KU2V0IHRvIDB4NCwgMHg0
LCAweDQsIDB4NCwgMHg0Lg0KDQpObyBuZWVkLg0KDQpJUCBBZGRyZXNzDQoNCjMNCg0KcGhvc3Bo
b3ItaG9zdC1pcG1pZC90cmFuc3BvcnRoYW5kbGVyLmNwcCwgTGluZSAxNjkuDQoNCg0KcGhvc3Bo
b3ItbmV3b3JrZC9uZXRtYW4ucHk6IExpbmUgMjY2OiBTZXRBZGRyZXNzNA0KDQpNQUMgQWRkcmVz
cw0KKGNhbiBiZSBSZWFkIE9ubHkpDQoNCjUNCg0KcGhvc3Bob3ItaG9zdC1pcG1pZC90cmFuc3Bv
cnRoYW5kbGVyLmNwcCwgTGluZSAxNzQuDQoNCg0KcGhvc3Bob3ItbmV3b3JrZC9uZXRtYW4ucHk6
IExpbmUgMzM0OiBTZXRId0FkZHJlc3MuDQoNClN1Ym5ldCBNYXNrDQoNCjYNCg0KcGhvc3Bob3It
aG9zdC1pcG1pZC90cmFuc3BvcnRoYW5kbGVyLmNwcCwgTGluZSAxOTkuDQoNCg0KcGhvc3Bob3It
bmV3b3JrZC9uZXRtYW4ucHk6IExpbmUgMjY2OiBTZXRBZGRyZXNzNA0KDQpEZWZhdWx0IEdhdGV3
YXkgQWRkcmVzcw0KDQoxMg0KDQpwaG9zcGhvci1ob3N0LWlwbWlkL3RyYW5zcG9ydGhhbmRsZXIu
Y3BwLCBMaW5lIDIwNC4NCg0KDQpwaG9zcGhvci1uZXdvcmtkL25ldG1hbi5weTogTGluZSAyNjY6
IFNldEFkZHJlc3M0DQoNCg0KSGFuZGxpbmcgb2YgR2V0IExBTiBDb25maWd1cmF0aW9uIFBhcmFt
ZXRlcnMgY29tbWFuZCBpcyBzaW1pbGFyIHRvIFNldCBMQU4gQ29uZmlndXJhdGlvbiBQYXJhbWV0
ZXJzLiBSZWZlciB0byBwaG9zcGhvci1ob3N0LWlwbWlkL3RyYW5zcG9ydGhhbmRsZXIuY3BwIGFu
ZCBwaG9zcGhvci1uZXR3b3JrZC9uZXRtYW4ucHkuDQoxLjMuICBHYXAgYmV0d2VlbiBjdXJyZW50
IGNvZGUgYW5kIElQTUkgU3BlYyAyLjANCg0KTEFOIENvbmZpZ3VyYXRpb24gUGFyYW1ldGVyIExp
c3QNClBhcmFtZXRlcg0KDQojDQpOdW1iZXINCg0KUGFyYW1ldGVyIERhdGEoIG5vbi12b2xhdGls
ZSB1bmxlc3Mgb3RoZXJ3aXNlIG5vdGVkICkNCg0KQml0IGZpZWxkDQoNCkRlc2NyaXB0aW9uDQoN
CkN1cnJlbnQgc3RhdHVzL05vdGUNCiggWWVzID0gY3VycmVudCBzdXBwb3J0Lg0KTm8gPSBub3Qg
c3VwcG9ydC4gKQ0KDQpTZXQgSW4gUHJvZ3Jlc3MoVm9sYXRpbGUpDQoNCjANCg0KYnl0ZSAxDQoN
Cg0KDQowMGIgLT0gc2V0IGNvbXBsZXRlDQowYWIgPSBzZXQgaW4gcHJvZ3Jlc3MNCjEwYiA9IGNv
bW1pdCB3cml0ZQ0KMTFiID0gcmVzZXJ2ZWQNCg0KWWVzDQoNCkF1dGhlbnRpY2F0aW9uIFR5cGUg
U3VwcG9ydChSZWFkIE9ubHkpDQoNCjENCg0KYnl0ZSAxDQoNCg0KDQpBdXRoZW50aWNhdGlvbiB0
eXBlKHMpIGVuYWJsZWQgZm9yIHRoaXMgY2hhbm5lbChiaTB0ZmllbGQpOg0KQWxsIGJpdHM6IDFi
ID1zdXBwb3J0ZWQNCjBiPSBhdXRoZW50aWNhdGlvbiB0eXBlIG5vdCBhdmFpbGFibGUgZm9yIHVz
ZS4NCg0KWzVdIKhDIE9FTSBwcm9wcmlldGFyeQ0KWzRdIKhDIHN0cmFpZ2h0IHBhc3N3b3JkIC8g
a2V5DQpbM10gqEMgcmVzZXJ2ZWQNClsyXSCoQyBNRDUNClsxXSCoQyBNRDINClswXSAtIG5vbmUN
Cg0KWWVzLg0KTUQ1DQoNCg0KQXV0aGVudGljYXRvbiBUeXBlDQpFbmFibGVzDQoNCjINCg0KDQoN
Cg0KDQpUaGlzIGZpZWxkIGlzIHVzZWQgdG8gY29uZmlndXJlIHdoaWNoIEF1dGhlbnRpY2F0aW9u
IFR5cGVzIGFyZSBhdmFpbGFibGUgZm9yIHVzZSB3aGVuIGEgcmVtb3RlIGNvbnNvbGUgYWN0aXZh
dGVzIGFuIElQTUkgbWVzc2FnaW5nIGNvbm5lY3Rpb24gdG8gdGhlIEJNQyBmb3IgYSBnaXZlbiBy
ZXF1ZXN0ZWQgbWF4aW11bSBwcml2aWxlZ2UgbGV2ZWwuDQoNClllcy4NCk1ENQ0KDQpJUCBBZGRy
ZXNzDQoNCjMNCg0KZGF0YSAxOjQNCk1TLWJ5dGUgZmlyc3QNCg0KDQoNCklQIEFkZHJlc3MNCg0K
WWVzDQoNCklQIEFkZHJlc3MgU291cmNlDQoNCjQNCg0KZGF0YTENCg0KDQoNCmFkZHJlc3Mgc291
cmNlDQowaCCoQyB1bnNwZWNpZmllZA0KMWggPSBzdGF0aWMgYWRkcmVzcyAobWFudWFsbHkgY29u
ZmlndXJlZCkNCjJoID0gYWRkcmVzcyBvYnRhaW5lZCBieSBCTUMgcnVubmluZyBESENQDQozaCA9
IGFkZHJlc3MgbG9hZGVkIGJ5IEJJT1Mgb3Igc3lzdGVtIHNvZnR3YXJlDQo0aCA9IGFkZHJlc3Mg
b2J0YWluZWQgYnkgQk1DIHJ1bm5pbmcgb3RoZXIgYWRkcmVzcyBhc3NpZ25tZW50IHByb3RvY29s
DQoNCg0KTm8uDQoNCk1BQyBBZGRyZXNzDQooY2FuIGJlIFJlYWQgT25seSkNCg0KNQ0KDQpkYXRh
IDE6Ng0KDQoNCg0KTUFDIEFkZHJlc3MgZm9yIG1lc3NhZ2VzIHRyYW5zbWl0dGVkIGZyb20gQk1D
Lg0KTVMtYnl0ZSBmaXJzdC4NCg0KWWVzLg0KDQpTdWJuZXQgTWFzaw0KDQo2DQoNCmRhdGExOjQN
Cg0KDQoNCg0KDQpZZXMNCg0KSVB2NCBIZWFkZXIgUGFyYW1ldGVyDQoNCjcNCg0KZGF0YTENCg0K
DQoNCg0KDQpObw0KDQpQcmltYXJ5IFJNQ1AgUG9ydCBOdW1iZXIob3B0aW9uYWwpDQoNCjgNCg0K
ZGF0YTE6Mg0KDQoNCg0KDQoNCk5vLg0KDQpTZWNvbmRhcnkgUk1DUCBQb3J0IE51bWJlcihvcHRp
b25hbCkNCg0KOQ0KDQpkYXRhMToyDQoNCg0KDQoNCg0KTm8uDQoNCkJNQy1nZW5lcmF0ZWQgQVJQ
IGNvbnRyb2wgKG9wdGlvbmFsKQ0KDQoxMA0KDQpkYXRhMQ0KDQoNCg0KDQoNCk5vLg0KDQpHcmF0
dWl0b3VzIEFSUCBpbnRlcnZhbCAob3B0aW9uYWwpDQoNCjExDQoNCg0KDQoNCg0KDQoNCk5vLg0K
DQpEZWZhdWx0IEdhdGV3YXkgIEFkZHJlc3MNCg0KMTINCg0KDQoNCg0KDQoNCg0KWWVzDQoNCkRl
ZmF1bHQgR2F0ZXdheSBNQUMgQWRkcmVzcw0KDQoxMw0KDQoNCg0KDQoNCg0KDQpOby4NCg0KQmFj
a3VwIEdhdGV3YXkgQWRkcmVzcw0KDQoxNA0KDQoNCg0KDQoNCg0KDQpOby4NCg0KQmFja3VwIEdh
dGV3YXkgTUFDIEFkZHJlc3MNCg0KMTUNCg0KDQoNCg0KDQoNCg0KTm8uDQoNCkNvbW11bml0eSBT
dHJpbmcNCg0KMTYNCg0KDQoNCg0KDQoNCg0KTm8uDQoNCk51bWJlciBvZiBEZXN0aW5hdGlvbnMo
IFJlYWQgT25seSApDQoNCjE3DQoNCg0KDQoNCg0KDQoNCk5vLg0KDQpEZXN0aW5hdGlvbiBUeXBl
ICh2b2xhdGlsZSAvIG5vbi12b2xhdGlsZSCoQyBzZWUgZGVzY3JpcHRpb24gKQ0KDQoxOA0KDQoN
Cg0KDQoNCg0KDQpOby4NCg0KRGVzdGluYXRpb24gQWRkcmVzcw0KDQoxOQ0KDQoNCg0KDQoNCg0K
DQpOby4NCg0KRm9sbG93aW5nIHBhcmFtZXRlcnMgYXJlIGludHJvZHVjZWQgd2l0aCBJUE1JIHYy
LjAvUk1DUCsNCg0KODAyLjFxIFZMQU4gSUQgKDEyLWJpdCkNCg0KMjANCg0KDQoNCg0KDQoNCg0K
Tm8uDQoNCjgwMi4xcSBWTEFOIFByaW9yaXR5DQoNCjIxDQoNCg0KDQoNCg0KDQoNCk5vLg0KDQpS
TUNQKyBNZXNzYWdpbmcgQ2lwaGVyIFN1aXRlIEVudHJ5IFN1cHBvcnQoIFJlYWQgT25seSApDQoN
CjIyDQoNCg0KDQoNCg0KDQoNCk5vLg0KDQpSTUNQKyBNZXNzYWdpbmcgQ2lwaGVyIFN1aXRlIEVu
dHJpZXMoIFJlYWQgT25seSApDQoNCjIzDQoNCg0KDQoNCg0KDQoNCk5vLg0KDQpSTUNQKyBNZXNz
YWdpbmcgQ2lwaGVyIFN1aXRlIFByaXZpbGVnZSBMZXZlbHMNCg0KMjQNCg0KDQoNCg0KDQoNCg0K
Tm8uDQoNCkRlc3RpbmF0aW9uIEFkZHJlc3MgVkxBTiBUQUdzDQoNCjI1DQoNCg0KDQoNCg0KDQoN
Ck5vLg0KDQpCYWQgUGFzc3dvcmQgVGhyZXNob2xkDQoNCjI2DQoNCg0KDQoNCg0KDQoNCk5vLg0K
DQpJUHY2L0lQdjQgU3VwcG9ydA0KDQo1MA0KDQoNCg0KDQoNCg0KDQpOby4NCg0KSVB2Ni9JUHY0
IEFkZHJlc3NpbmcgRW5hYmxlcw0KDQo1MQ0KDQoNCg0KDQoNCg0KDQpOby4NCg0KSVB2Ni9JUHY0
IEhlYWRlciBTdGF0aWMgVHJhZmZpYyBDbGFzcw0KDQo1Mg0KDQoNCg0KDQoNCg0KDQpOby4NCg0K
SVB2NiBIZWFkZXIgU3RhdGljIEhvcCBMaW1pdA0KDQo1Mw0KDQoNCg0KDQoNCg0KDQpOby4NCg0K
SVB2NiBIZWFkZXIgRmxvdyBMYWJlbA0KDQo1NA0KDQoNCg0KDQoNCg0KDQpOby4NCg0KSVB2NiBT
dGF0dXMNCg0KNTUNCg0KDQoNCg0KDQoNCg0KTm8uDQoNCklQdjYgU3RhdGljIEFkZHJlc3Nlcw0K
DQo1Ng0KDQoNCg0KDQoNCg0KDQpOby4NCg0KSVB2NiBESENQdjYgU3RhdGljIERVSUQgc3RvcmFn
ZSBsZW5ndGgNCg0KNTcNCg0KDQoNCg0KDQoNCg0KTm8uDQoNCklQdjYgREhDUHY2IFN0YXRpYyBE
VUlEcw0KDQo1OA0KDQoNCg0KDQoNCg0KDQpOby4NCg0KSVB2NiBEeW5hbWljICggU0xBQUMvREhD
UHY2KSBBZGRyZXNzDQoNCjU5DQoNCg0KDQoNCg0KDQoNCk5vLg0KDQpJUHY2IERIQ1B2NiBEeW5h
bWljIERVSUQgc3RvcmFnZSBsZW5ndGgNCg0KNjANCg0KDQoNCg0KDQoNCg0KTm8uDQoNCklQdjYg
REhDUHY2IER5bmFtaWMgRFVJRHMNCg0KNjENCg0KDQoNCg0KDQoNCg0KTm8uDQoNCklQdjYgREhD
UHY2IFRpbWluZyBDb25maWd1cmF0aW9uIFN1cHBvcnQNCg0KNjINCg0KDQoNCg0KDQoNCg0KTm8u
DQoNCklQdjYgREhDUHY2IFRpbWluZyAmIENvbmZpZ3VyYXRpb24NCg0KNjMNCg0KDQoNCg0KDQoN
Cg0KTm8uDQoNCklQdjYgUm91dGVyIEFkZHJlc3MgQ29uZmlndXJhdGlvbiBDb250cm9sDQoNCjY0
DQoNCg0KDQoNCg0KDQoNCk5vLg0KDQpJUHY2IFN0YXRpYyBSb3V0ZXIgMSBJUCBBZGRyZXNzDQoN
CiA2NQ0KDQoNCg0KDQoNCg0KDQpOby4NCg0KSVB2NiBTdGF0aWMgUm91dGVyIDEgTUFDIEFkZHJl
c3MNCg0KNjYNCg0KDQoNCg0KDQoNCg0KTm8uDQoNCklQdjYgU3RhdGljIFJvdXRlciAxIFByZWZp
eCBMZW5ndGgNCg0KNjcNCg0KDQoNCg0KDQoNCg0KTm8uDQoNCklQdjYgU3RhdGljIFJvdXRlciAx
IFByZWZpeCBWYWx1ZQ0KDQo2OA0KDQoNCg0KDQoNCg0KDQpOby4NCg0KSVB2NiBTdGF0aWMgUm91
dGVyIDIgQWRkcmVzcw0KDQo2OQ0KDQoNCg0KDQoNCg0KDQpOby4NCg0KSVB2NiBTdGF0aWMgUm91
dGVyIDIgTUFDIEFkZHJlc3MNCg0KNzANCg0KDQoNCg0KDQoNCg0KTm8uDQoNCklQdjYgU3RhdGlj
IFJvdXRlciAyIFByZWZpeCBMZW5ndGgNCg0KNzENCg0KDQoNCg0KDQoNCg0KTm8uDQoNCklQdjYg
U3RhdGljIFJvdXRlciAyIFByZWZpeCBWYWx1ZQ0KDQo3Mg0KDQoNCg0KDQoNCg0KDQpOby4NCg0K
TnVtYmVyIG9mIER5bmFtaWMgUm91dGVyIEluZm8gU2V0cw0KDQo3Mw0KDQoNCg0KDQoNCg0KDQpO
by4NCg0KSVB2NiBEeW5hbWljIFJvdXRlciBJbmZvIElQIEFkZHJlc3MNCg0KNzQNCg0KDQoNCg0K
DQoNCg0KTm8uDQoNCklQdjYgRHluYW1pYyBSb3V0ZXIgSW5mbyBNQUMgQWRkcmVzcw0KDQo3NQ0K
DQoNCg0KDQoNCg0KDQpOby4NCg0KSVB2NiBEeW5hbWljIFJvdXRlciBJbmZvIFByZWZpeCBMZW5n
dGgNCg0KNzYNCg0KDQoNCg0KDQoNCg0KTm8uDQoNCklQdjYgRHluYW1pYyBSb3V0ZXIgSW5mbyBQ
cmVmaXggVmFsdWUNCg0KNzcNCg0KDQoNCg0KDQoNCg0KTm8uDQoNCklQdjYgRHluYW1pYyBSb3V0
ZXIgUmVjZWl2ZWQgSG9wIExpbWl0DQoNCjc4DQoNCg0KDQoNCg0KDQoNCk5vLg0KDQpJUHY2IE5l
aWdoYm9yIERpc2NvdmVyeSAvIFNMQUFDIFRpbWluZyBDb25maWd1cmF0aW9uIFN1cHBvcnQNCg0K
NzkNCg0KDQoNCg0KDQoNCg0KTm8uDQoNCklQdjYgTmVpZ2hib3IgRGlzY292ZXJ5IC8gU0xBQUMg
VGltaW5nIENvbmZpZ3VyYXRpb24NCg0KODANCg0KDQoNCg0KDQoNCg0KTm8uDQoNCk9FTSBQYXJh
bWV0ZXJzDQoNCjE5MjoyNTUNCg0KDQoNCg0KDQoNCg0KTm8uDQoNCg0KDQoxLjQuICBXb3JrIFBs
YW4NCjEuNC4xLiAgICAgIFNldCBMQU4gQ29uZmlndXJhdGlvbiBQYXJhbWV0ZXJzDQoxLjQuMi4g
ICAgICBHZXQgTEFOIENvbmZpZ3VyYXRpb24gUGFyYW1ldGVycw0KSSBmaWd1cmUgb3V0IHdoYXQg
d2Ugc3VwcG9ydCBpbiBwaG9zcGhvci1uZXR3b2tkIHJlcG8gKCBSZWZlciB0bzoNCmh0dHBzOi8v
Z2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLW5ldHdvcmtkL2Jsb2IvbWFzdGVyL25ldG1hbi5w
eSApIDoNCg0KICAqICAgU2V0IEluIFByb2dyZXNzLA0KICAqICAgQXV0aGVudGljYXRpb24gVHlw
ZSBTdXBwb3J0LA0KICAqICAgQXV0aGVudGljYXRpb24gVHlwZSBFbmFibGVzLA0KICAqICAgSVAg
QWRkcmVzcywNCiAgKiAgIE1BQyBBZGRyZXNzLA0KICAqICAgU3VibmV0IE1hc2ssDQogICogICBE
ZWZhdWx0IEdhdGV3YXkgQWRkcmVzcw0KU28gSSB0aGluayB3ZSBvbmx5IHN1cHBvcnQgZXhpc3Rp
bmcgY29uZmlndXJhdGlvbi4NCkhvdyBjYW4gSSBpbXBsZW1lbnQgdGhlIHJlc3Qgb2YgdGhlIGNv
bmZpZ3VyYXRpb25zL3BhcmFtZXRlcnM/IChvcGVuIGlzc3Vlcz8pDQoxLjQuMy4gICAgICBBUlAN
Ck5vdCBpbXBsZW1lbnRlZCBpbiBUb22hr3MgSVBNSSBuZXR3b3JrIHN0b3J5Lg0KU2hvdWxkIEkg
cmVmZXIgdG8gb3BlbmJtYy9pbXBvcnQtbGF5ZXJzL21ldGEtb3BlbmVtYmVkZGVkL21ldGEtbmV0
d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvYXJwdGFibGVzID8NCk9wdGlvbmFsIGNvbW1hbmQuIE5v
dCB0byBpbXBsZW1lbnQ/DQoxLjQuNC4gICAgICBJUC9VRFAvUk1DUCBzdGF0aXN0aWNzDQpTZWVt
cyBsaWtlIGl0IHdhcyBub3QgaW1wbGVtZW50ZWQgaW4gb2JtYyBzdG9yaWVzIHRvby4NClRoaXMg
aXMgYW4gb3B0aW9uYWwgY29tbWFuZC4gTm90IHRvIGltcGxlbWVudD8NCg0KMi4gICAgSVBNSSBM
QU4gQ29tbWFuZHMgaW4gSVBNSSBTcGVjIDIuMCAtLSBGb3JtYXQNCg0KMS4xLiAgU2V0IExBTiBD
b25maWd1cmF0aW9uIFBhcmFtZXRlcnMgY29tbWFuZA0KU2V0IExBTiBDb25maWd1cmF0aW9uIFBh
cmFtZXRlcnMgY29tbWFuZA0KDQpCeXRlDQoNCkJpdCBmaWVsZA0KDQpEZXNjcmlwdGlvbg0KDQpT
dXBwb3J0DQoNClJlcXVlc3QgRGF0YQ0KDQoxDQoNCls3OjRdDQoNCnJlc2VydmVkDQoNCg0KDQoN
Cg0KDQoNClszOjBdDQoNCkNoYW5uZWwgbnVtYmVyDQoNCg0KDQoNCg0KMg0KDQoNCg0KUGFyYW1l
dGVyIHNlbGVjdG9yDQoNCg0KDQoNCg0KMzpODQoNCg0KDQpDb25maWd1cmF0aW9uIHBhcmFtZXRl
ciBkYXRhDQoNCg0KDQpSZXNwb25zZSBEYXRhDQoNCjENCg0KQ29tcGxldGlvbiBjb2RlDQoNCjgw
aCA9IHBhcmFtZXRlciBub3Qgc3VwcG9ydGVkLg0KODFoID0gYXR0ZW1wdCB0byBzZXQgdGhlIKGu
c2V0IGluIHByb2dyZXNzoa8gdmFsdWUgKGluIHBhcmFtZXRlciAjMCkgd2hlbiBub3QgaW4gdGhl
IKGuc2V0IGNvbXBsZXRloa8gc3RhdGUuIChUaGlzIGNvbXBsZXRpb24gY29kZSBwcm92aWRlcyBh
IHdheSB0byByZWNvZ25pemUgdGhhdCBhbm90aGVyIHBhcnR5IGhhcyBhbHJlYWR5IKGuY2xhaW1l
ZKGvIHRoZSBwYXJhbWV0ZXJzKQ0KODJoID0gYXR0ZW1wdCB0byB3cml0ZSByZWFkLW9ubHkgcGFy
YW1ldGVyDQo4M2ggPSBhdHRlbXB0IHRvIHJlYWQgd3JpdGUtb25seSBwYXJhbWV0ZXINCg0KRXhp
c3RpbmcgY29kZSBzdXBwb3J0cyA3IExBTiBjb21tYW5kOg0KU2V0IEluIFByb2dyZXNzLA0KQXV0
aGVudGljYXRpb24gVHlwZSBTdXBwb3J0LA0KQXV0aGVudGljYXRpb24gVHlwZSBFbmFibGVzLA0K
SVAgQWRkcmVzcywNCk1BQyBBZGRyZXNzLA0KU3VibmV0IE1hc2ssDQpEZWZhdWx0IEdhdGV3YXkg
QWRkcmVzcy4NClJlZmVyIHRvOg0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3It
bmV0d29ya2QvYmxvYi9tYXN0ZXIvbmV0bWFuLnB5DQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoN
Cg0KMS4yLiAgR2V0IExBTiBDb25maWd1cmF0aW9uIFBhcmFtZXRlcnMgQ29tbWFuZA0KR2V0IExB
TiBDb25maWd1cmF0aW9uIFBhcmFtZXRlcnMgQ29tbWFuZA0KDQpCeXRlDQoNCkJpdCBmaWVsZA0K
DQpEZXNjcmlwdGlvbg0KDQpTdXBwb3J0DQoNClJlcXVlc3QgRGF0YQ0KDQoxDQoNCls3XQ0KDQow
YiA9IGdldCBwYXJhbWV0ZXINCjFiID0gZ2V0IHBhcmFtZXRlciByZXZpc2lvbiBvbmx5DQoNCg0K
DQoNCg0KDQoNCls2OjRdDQoNCnJlc2VydmVkDQoNCg0KDQoNCg0KDQoNClszOjBdDQoNCkNoYW5u
ZWwgbnVtYmVyDQoNCg0KDQoNCg0KMg0KDQoNCg0KUGFyYW1ldGVyIHNlbGVjdG9yDQoNCg0KDQoN
Cg0KMw0KDQoNCg0KU2V0IFNlbGVjdG9yLiBTZWxlY3RzIGEgZ2l2ZW4gc2V0IG9mIHBhcmFtZXRl
cnMgdW5kZXIgYSBnaXZlbiBQYXJhbWV0ZXIgc2VsZWN0b3IgdmFsdWUuDQowMGggaWYgcGFyYW1l
dGVyIGRvbqGvdCB1c2UgYSBTZXQgU2VsZWN0b3IuDQoNCg0KDQoNCg0KNA0KDQoNCg0KQmxvY2sg
U2VsZWN0b3IgKDAwaCBpZiBwYXJhbWV0ZXIgZG9lcyBub3QgcmVxdWlyZSBhIGJsb2NrIG51bWJl
cikNCg0KDQoNClJlc3BvbnNlIERhdGENCg0KMQ0KDQpbNzowXQ0KDQpDb21wbGV0aW9uIENvZGUu
DQpHZW5lcmljIGNvZGVzLCBwbHVzIGZvbGxvd2luZyBjb21tYW5kLXNwZWNpZmljIGNvbXBsZXRp
b24gY29kZShzKToNCjgwaCA9IHBhcmFtZXRlciBub3Qgc3VwcG9ydGVkLg0KDQpFeGlzdGluZyBj
b2RlIHN1cHBvcnRzIDcgTEFOIGNvbW1hbmQ6DQpTZXQgSW4gUHJvZ3Jlc3MsDQpBdXRoZW50aWNh
dGlvbiBUeXBlIFN1cHBvcnQsDQpBdXRoZW50aWNhdGlvbiBUeXBlIEVuYWJsZXMsDQpJUCBBZGRy
ZXNzLA0KTUFDIEFkZHJlc3MsDQpTdWJuZXQgTWFzaywNCkRlZmF1bHQgR2F0ZXdheSBBZGRyZXNz
Lg0KUmVmZXIgdG8gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItbmV0d29ya2Qv
YmxvYi9tYXN0ZXIvbmV0bWFuLnB5DQoNCg0KDQoyDQoNCls3OjBdDQoNClBhcmFtZXRlciByZXZp
c2lvbi4NCkZvcm1hdDogTVNOID0gcHJlc2VudCByZXZpc2lvbi4gTFNOID0gb2xkZXN0IHJldmlz
aW9uIHBhcmFtZXRlciBpcyBiYWNrd2FyZCBjb21wYXRpYmxlIHdpdGguIDExaCBmb3IgcGFyYW1l
dGVycyBpbiB0aGlzIHNwZWNpZmljYXRpb24uDQoNCg0KDQpUaGUgZm9sbG93aW5nIGRhdGEgYnl0
ZXMgYXJlIG5vdCByZXR1cm5lZCB3aGVuIHRoZSChrmdldCBwYXJhbWV0ZXIgcmV2aXNpb24gb25s
eaGvIGJpdCBpcyAxYi4NCg0KDQoNCjM6Tg0KDQoNCg0KQ29uZmlndXJhdGlvbiBwYXJhbWV0ZXIg
ZGF0YS4NCklmIHRoZSByb2xsYmFjayBmZWF0dXJlIGlzIGltcGxlbWVudGVkLCB0aGUgQk1DIG1h
a2VzIGEgY29weSBvZiB0aGUgZXhpc3RpbmcgcGFyYW1ldGVycyB3aGVuIHRoZSChrnNldCBpbiBw
cm9ncmVzc6GvIHN0YXRlIGJlY29tZXMgYXNzZXJ0ZWQgKFNlZSB0aGUgU2V0IGluIFByb2dyZXNz
IHBhcmFtZXRlciAjMCkuIFdoaWxlIHRoZSChrnNldCBpbiBwcm9ncmVzc6GvIHN0YXRlIGlzIGFj
dGl2ZSwgdGhlIEJNQyB3aWxsIHJldHVybiBkYXRhIGZyb20gdGhpcyBjb3B5IG9mIHRoZSBwYXJh
bWV0ZXJzLCBwbHVzIGFueSB1bmNvbW1pdHRlZCBjaGFuZ2VzIHRoYXQgd2VyZSBtYWRlIHRvIGRh
dGEuIE90aGVyd2lzZSwgdGhlIEJNQyByZXR1cm5zIHBhcmFtZXRlciBkYXRhIGZyb20gbm9uLXZv
bGF0aWxlIHN0b3JhZ2UuDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0K
DQoNCg0KDQoNCg0KMS4yLjEuICAgICAgREhDUHY2IFRpbWluZyBQYXJhbWV0ZXJzDQpOb3Qgc3Vw
cG9ydC4NCjEuMi4yLiAgICAgIE5laWdoYm9yIGRpc2NvdmVyeSAvIFNMQUFDIFRpbWluZyBQYXJh
bWV0ZXJzDQpOb3Qgc3VwcG9ydC4NCjEuMy4gIFN1c3BlbmQgQk1DIEFSUHMgY29tbWFuZA0KU3Vz
cGVuZCBCTUMgQVJQcyBDb21tYW5kDQoNCkJ5dGUNCg0KQml0IGZpZWxkDQoNCkRlc2NyaXB0aW9u
DQoNClN1cHBvcnQNCg0KUmVxdWVzdA0KDQoxDQoNCls3OjRdDQoNClJlc2VydmVkDQoNCg0KDQoN
Cg0KDQoNClszOjBdDQoNCkNoYW5uZWwgbnVtYmVyDQoNCg0KDQoNCg0KMg0KDQpbNzoyXQ0KDQpS
ZXNlcnZlZA0KDQoNCg0KDQoNCg0KDQpbMV0NCg0KQVJQIHJlc3BvbnNlIHN1c3BlbmQuDQoNCg0K
DQoNCg0KDQoNClswXQ0KDQpHcmF0dWl0b3VzIEFSUCBzdXNwZW5kDQoNCg0KDQpSZXNwb25kDQoN
CjENCg0KDQoNCkNvbXBsZXRpb24gY29kZQ0KDQpEbyBub3Qgc3VwcG9ydC4NCg0KKCBTaG91bGQg
cmVmZXIgdG8NCm9wZW5ibWMvaW1wb3J0LWxheWVycy9tZXRhLW9wZW5lbWJlZGRlZC9tZXRhLW5l
dHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2FycHRhYmxlcz8gKQ0KDQoNCg0KMg0KDQoNCg0KcHJl
c2VudCBzdGF0ZSBvIGYgQVJQIHN1c3BlbnNpb24NCg0KDQoNCg0KDQpbNzoyXQ0KDQpyZXNlcnZl
DQoNCg0KDQoNCg0KWzFdDQoNCg0KDQoNCg0KDQoNClswXQ0KDQoNCg0KQWRkcmVzcyBSZXNvbHV0
aW9uIFByb3RvY29sLg0KMS40LiAgR2V0IElQL1VEUC9STUNQIFN0YXRpc3RpY3MgQ29tbWFuZA0K
R2V0IElQL1VEUC9STUNQIFN0YXRpc3RpY3MgQ29tbWFuZA0KDQpCeXRlDQoNCkJpdCBmaWVsZA0K
DQpEZXNjcmlwdGlvbg0KDQpTdXBwb3J0DQoNClJlcXVlc3QgRGF0YQ0KDQoxDQoNCls3OjRdDQoN
CnJlc2VydmVkDQoNCg0KDQoNCg0KDQoNClszOjBdDQoNCkNoYW5uZWwgbnVtYmVyDQoNCg0KDQoN
Cg0KMg0KDQpbNzoxXQ0KDQpjbGVhciBzdGF0aXN0aWNzDQoNCg0KDQoNCg0KDQoNClswXQ0KDQoN
Cg0KDQoNClJlc3BvbmQgRGF0YQ0KDQoxDQoNCg0KDQpDb21wbGV0aW9uIENvZGUNCg0KUk1DUCBp
cyBpbXBsZW1lbnRlZCBpbiBvcGVuYm1jLg0KUmVmZXIgdG8NCmh0dHBzOi8vZ2l0aHViLmNvbS9v
cGVuYm1jL29wZW5ibWMvaXNzdWVzLzQzMiAgYW5kIHNvIG9uLg0KRGlzY3Vzc2VkIHdpdGggVG9t
LCB0aGVzZSBzdGF0aXN0aWNzIGlzIG5vdCBpbXBsZW1lbnRlZCBpbiBwaG9zcGhvci1uZXR3b3Jr
ZC4NCg0KDQoNCjI6Mw0KDQoNCg0KSVAgUGFja2V0cyBSZWNlaXZlZC4NCg0KDQoNCjQ6NQ0KDQoN
Cg0KUmVjZWl2ZWQgSVAgSGVhZGVyIEVycm9ycw0KDQoNCg0KNjo3DQoNCg0KDQpSZWNlaXZlZCBJ
UCBBZGRyZXNzIEVycm9ycw0KDQoNCg0KODo5DQoNCg0KDQpGcmFnbWVudGVkIElQIFBhY2tldHMg
UmVjZWl2ZWQNCg0KDQoNCjEwOjExDQoNCg0KDQpJUCBQYWNrZXRzIFRyYW5zbWl0dGVkDQoNCg0K
DQoxMjoxMw0KDQoNCg0KVURQIFBhY2tldHMgUmVjZWl2ZWQNCg0KDQoNCjE0OjE1DQoNCg0KDQpW
YWxpZCBSTUNQIFJlY2VpdmVkDQoNCg0KDQoxNjoxNw0KDQoNCg0KVURQIFByb3h5IFBhY2tldHMg
UmVjZWl2ZWQNCg0KDQoNCjE4OjE5DQoNCg0KDQpVRFAgUHJveHkgUGFja2V0cyBkcm9wcGVkDQoN
Cg0KMy4gICAgRW5kDQoNCmBgYA0KDQo=

--_000_TY1PR06MB0863871D99A02C72E98F2462F6C20TY1PR06MB0863apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<p>Hi team,</p>
<p><font color=3D"black" size=3D"3" face=3D"Calibri,Arial,Helvetica,sans-se=
rif"><span id=3D"x_x_divtagdefaultwrapper" style=3D"font-size:12pt; backgro=
und-color:white">I'm working on the story of Confirm LAN Command meet IPMI =
2.0<br>
<a previewremoved=3D"true" href=3D"https://github.com/openbmc/openbmc/issue=
s/444" target=3D"_blank" id=3D"LPlnk883255" class=3D"x_x_OWAAutoLink">https=
://github.com/openbmc/openbmc/issues/444</a></span></font></p>
<p><font color=3D"black" size=3D"3" face=3D"Calibri,Arial,Helvetica,sans-se=
rif"><span id=3D"x_x_divtagdefaultwrapper" style=3D"font-size:12pt; backgro=
und-color:white"><a previewremoved=3D"true" href=3D"https://github.com/open=
bmc/openbmc/issues/444" target=3D"_blank" id=3D"LPlnk883255" class=3D"x_x_O=
WAAutoLink"><br>
</a></span></font></p>
<p><font color=3D"black" size=3D"3" face=3D"Calibri,Arial,Helvetica,sans-se=
rif"><span id=3D"x_x_divtagdefaultwrapper" style=3D"font-size:12pt; backgro=
und-color:white"></span><span id=3D"x_x_divtagdefaultwrapper" style=3D"font=
-size:12pt; background-color:white">I summarize
 some fields of settings below, and need some help to confirm the direction=
 of my work.</span></font></p>
<p></p>
<p>```<br>
</p>
<p></p>
<div>
<h1 style=3D"mso-list:l0 level1 lfo1"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.<span style=3D"font:7.0pt &quot;Time=
s New Roman&quot;">&nbsp;&nbsp;&nbsp;
</span></span></span>IPMI LAN command status and work plan</h1>
<h2 style=3D"mso-list:l0 level2 lfo1"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.1.<span style=3D"font:7.0pt &quot;Ti=
mes New Roman&quot;">&nbsp;
</span></span></span>Current status</h2>
<p class=3D"MsoNormal">IPMI LAN command consists of 4 command ( refer to IP=
MI 2.0 Spec, Chapter 23 ):<span style=3D"mso-spacerun:yes">&nbsp;
</span>Set LAN Configuration Parameters, Get LAN Configuration Parameters, =
Suspend BMC ARPs and Get IP/UDP/RMCP Statistics.</p>
<p class=3D"MsoNormal">Existing code includes implementation of Set/Get LAN=
 configuration Parameters. ( Refer to
<a previewremoved=3D"true" id=3D"LPlnk696020" href=3D"https://github.com/op=
enbmc/phosphor-host-ipmid/blob/master/transporthandler.cpp">
https://github.com/openbmc/phosphor-host-ipmid/blob/master/transporthandler=
.cpp</a> )</p>
<h2 style=3D"mso-list:l0 level2 lfo1"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.2.<span style=3D"font:7.0pt &quot;Ti=
mes New Roman&quot;">&nbsp;
</span></span></span>IPMI LAN Command Handling</h2>
<p class=3D"MsoNormal">Example for Set LAN Configuration Parameters.</p>
<table class=3D"MsoTableGrid" style=3D"border-collapse:collapse;border:none=
;mso-border-alt:solid windowtext .5pt;=0A=
 mso-yfti-tbllook:1184;mso-padding-alt:0in 5.4pt 0in 5.4pt" cellpadding=3D"=
0" cellspacing=3D"0" border=3D"1">
<tbody>
<tr style=3D"mso-yfti-irow:0;mso-yfti-firstrow:yes">
<td style=3D"width:89.95pt;border:solid windowtext 1.0pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"120">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Parameter</p>
</td>
<td style=3D"width:47.6pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
#</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Number</p>
</td>
<td style=3D"width:138.6pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"185">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPMI handling</p>
</td>
<td style=3D"width:105.85pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"141">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
dbus method</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:1">
<td style=3D"width:89.95pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"120">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Set In Progress(Volatile)</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
0</p>
</td>
<td style=3D"width:138.6pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"185">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
phosphor-host-ipmid/transporthandler.cpp, Line 209.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
variable lan_set_in_progress act as a statemachine.</p>
</td>
<td style=3D"width:105.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"141">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No need.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:2">
<td style=3D"width:89.95pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"120">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Authentication Type Support(Read Only)</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
1</p>
</td>
<td style=3D"width:138.6pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"185">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
phosphor-host-ipmid/transporthandler.cpp, Line 305.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Set<span style=3D"mso-spacerun:yes">&nbsp; </span>to 0x4 (MD5)</p>
</td>
<td style=3D"width:105.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"141">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No need.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:3">
<td style=3D"width:89.95pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"120">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Authentication Type</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Enables</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
2</p>
</td>
<td style=3D"width:138.6pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"185">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
phosphor-host-ipmid/transporthandler.cpp, Line 311.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Set to 0x4, 0x4, 0x4, 0x4, 0x4. </p>
</td>
<td style=3D"width:105.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"141">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No need.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:4">
<td style=3D"width:89.95pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"120">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IP Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
3</p>
</td>
<td style=3D"width:138.6pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"185">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
phosphor-host-ipmid/transporthandler.cpp, Line 169.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:105.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"141">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
phosphor-neworkd/netman.py: Line 266: SetAddress4</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:5">
<td style=3D"width:89.95pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"120">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
MAC Address</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
(can be Read Only)</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
5</p>
</td>
<td style=3D"width:138.6pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"185">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
phosphor-host-ipmid/transporthandler.cpp, Line 174.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:105.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"141">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
phosphor-neworkd/netman.py: Line 334: SetHwAddress.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:6">
<td style=3D"width:89.95pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"120">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Subnet Mask</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
6</p>
</td>
<td style=3D"width:138.6pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"185">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
phosphor-host-ipmid/transporthandler.cpp, Line 199.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:105.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"141">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
phosphor-neworkd/netman.py: Line 266: SetAddress4</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:7;mso-yfti-lastrow:yes">
<td style=3D"width:89.95pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"120">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Default Gateway Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
12</p>
</td>
<td style=3D"width:138.6pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"185">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
phosphor-host-ipmid/transporthandler.cpp, Line 204.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:105.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"141">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
phosphor-neworkd/netman.py: Line 266: SetAddress4</p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Handling of Get LAN Configuration Parameters command=
 is similar to Set LAN Configuration Parameters. Refer to phosphor-host-ipm=
id/transporthandler.cpp and phosphor-networkd/netman.py.</p>
<h2 style=3D"mso-list:l0 level2 lfo1"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.3.<span style=3D"font:7.0pt &quot;Ti=
mes New Roman&quot;">&nbsp;
</span></span></span>Gap between current code and IPMI Spec 2.0</h2>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">LAN Configuration Parameter List</p>
<table class=3D"MsoTableGrid" style=3D"border-collapse:collapse;border:none=
;mso-border-alt:solid windowtext .5pt;=0A=
 mso-yfti-tbllook:1184;mso-padding-alt:0in 5.4pt 0in 5.4pt" cellpadding=3D"=
0" cellspacing=3D"0" border=3D"1">
<tbody>
<tr style=3D"mso-yfti-irow:0;mso-yfti-firstrow:yes">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Parameter</p>
</td>
<td style=3D"width:47.6pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
#</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Number</p>
</td>
<td style=3D"width:58.35pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Parameter Data( non-volatile unless otherwise noted )</p>
</td>
<td style=3D"width:32.2pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Bit field</p>
</td>
<td style=3D"width:122.85pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Description</p>
</td>
<td style=3D"width:75.45pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Current status/Note</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
( Yes =3D current support.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No =3D not support. )</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:1">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Set In Progress(Volatile)</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
0</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
byte 1 </p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
00b -=3D set complete</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
0ab =3D set in progress</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
10b =3D commit write</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
11b =3D reserved</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Yes</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:2">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Authentication Type Support(Read Only)</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
1</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
byte 1</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Authentication type(s) enabled for this channel(bi0tfield):</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
All bits: 1b =3Dsupported</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
0b=3D authentication type not available for use.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[5] =A8C OEM proprietary</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[4] =A8C straight password / key</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[3] =A8C reserved</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[2] =A8C MD5</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[1] =A8C MD2</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[0] - none</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Yes. </p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
MD5</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:3">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Authenticaton Type</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Enables</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
2</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
This field is used to configure which Authentication Types are available fo=
r use when a remote console activates an IPMI messaging connection to the B=
MC for a given requested maximum privilege level.</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Yes.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
MD5</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:4">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IP Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
3</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
data 1:4</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
MS-byte first</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IP Address</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Yes</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:5">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IP Address Source</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
4</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
data1</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
address source</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
0h =A8C unspecified</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
1h =3D static address (manually configured)</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
2h =3D address obtained by BMC running DHCP</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
3h =3D address loaded by BIOS or system software</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
4h =3D address obtained by BMC running other address assignment protocol</p=
>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:6">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
MAC Address</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
(can be Read Only)</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
5</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
data 1:6</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
MAC Address for messages transmitted from BMC.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
MS-byte first.</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Yes.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:7">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Subnet Mask</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
6</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
data1:4</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Yes</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:8">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv4 Header Parameter</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
7</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
data1</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:9">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Primary RMCP Port Number(optional)</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
8</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
data1:2</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:10">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Secondary RMCP Port Number(optional)</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
9</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
data1:2</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:11">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
BMC-generated ARP control (optional)</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
10</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
data1</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:12">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Gratuitous ARP interval (optional)</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
11</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:13">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Default Gateway<span style=3D"mso-spacerun:yes">&nbsp; </span>Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
12</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Yes</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:14">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Default Gateway MAC Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
13</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:15">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Backup Gateway Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
14</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:16">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Backup Gateway MAC Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
15</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:17">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Community String </p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
16</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:18">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Number of Destinations( Read Only )</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
17</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:19">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Destination Type (volatile / non-volatile =A8C see description )</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
18</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:20">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Destination Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
19</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:21">
<td colspan=3D"6" style=3D"width:431.5pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"575">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Following parameters are introduced with IPMI v2.0/RMCP&#43;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:22">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
802.1q VLAN ID (12-bit)</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
20</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:23">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
802.1q VLAN Priority</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
21</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:24">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
RMCP&#43; Messaging Cipher Suite Entry Support( Read Only )</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
22</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:25">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
RMCP&#43; Messaging Cipher Suite Entries( Read Only )</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
23</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:26">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
RMCP&#43; Messaging Cipher Suite Privilege Levels</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
24</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:27">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Destination Address VLAN TAGs</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
25</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:28">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Bad Password Threshold</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
26</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:29">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6/IPv4 Support</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
50</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:30">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6/IPv4 Addressing Enables</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
51</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:31">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6/IPv4 Header Static Traffic Class</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
52</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:32">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Header Static Hop Limit</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
53</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:33">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Header Flow Label</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
54</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:34">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Status</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
55</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:35">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Static Addresses</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
56</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:36">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 DHCPv6 Static DUID storage length</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
57</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:37">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 DHCPv6 Static DUIDs</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
58</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:38">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Dynamic ( SLAAC/DHCPv6) Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
59</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:39">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 DHCPv6 Dynamic DUID storage length</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
60</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:40">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 DHCPv6 Dynamic DUIDs</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
61</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:41">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 DHCPv6 Timing Configuration Support</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
62</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:42">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 DHCPv6 Timing &amp; Configuration</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
63</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:43">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Router Address Configuration Control</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
64</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:44">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Static Router 1 IP Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
<span style=3D"mso-spacerun:yes">&nbsp;</span>65</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:45">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Static Router 1 MAC Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
66</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:46">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Static Router 1 Prefix Length</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
67</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:47">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Static Router 1 Prefix Value</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
68</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:48">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Static Router 2 Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
69</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:49">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Static Router 2 MAC Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
70</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:50">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Static Router 2 Prefix Length</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
71</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:51">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Static Router 2 Prefix Value</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
72</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:52">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Number of Dynamic Router Info Sets</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
73</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:53">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Dynamic Router Info IP Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
74</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:54">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Dynamic Router Info MAC Address</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
75</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:55">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Dynamic Router Info Prefix Length</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
76</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:56">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Dynamic Router Info Prefix Value </p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
77</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:57">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Dynamic Router Received Hop Limit</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
78</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:58">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Neighbor Discovery / SLAAC Timing Configuration Support</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
79</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:59">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IPv6 Neighbor Discovery / SLAAC Timing Configuration</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
80</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:60;mso-yfti-lastrow:yes">
<td style=3D"width:95.05pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"127">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
OEM Parameters</p>
</td>
<td style=3D"width:47.6pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"63">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
192:255</p>
</td>
<td style=3D"width:58.35pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"78">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:32.2pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"43">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:122.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"164">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.45pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
No.</p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">&nbsp;</p>
<h2 style=3D"mso-list:l0 level2 lfo1"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.4.<span style=3D"font:7.0pt &quot;Ti=
mes New Roman&quot;">&nbsp;
</span></span></span>Work Plan</h2>
<h3 style=3D"mso-list:l0 level3 lfo1"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.4.1.<span style=3D"font:7.0pt &quot;=
Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span>Set LAN Configuration Parameters</h3>
<h3 style=3D"mso-list:l0 level3 lfo1"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.4.2.<span style=3D"font:7.0pt &quot;=
Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span>Get LAN Configuration Parameters</h3>
<p class=3D"MsoNormal">I figure out what we support in phosphor-netwokd rep=
o ( Refer to:</p>
<p class=3D"MsoNormal"><a previewremoved=3D"true" id=3D"LPlnk832643" href=
=3D"https://github.com/openbmc/phosphor-networkd/blob/master/netman.py">htt=
ps://github.com/openbmc/phosphor-networkd/blob/master/netman.py</a> ) :</p>
<ul nodeid=3D"1">
<li>Set In Progress,</li><li>Authentication Type Support,</li><li>Authentic=
ation Type Enables,</li><li>IP Address,</li><li>MAC Address,</li><li>Subnet=
 Mask,</li><li>Default Gateway Address</li></ul>
<p class=3D"MsoNormal">So I think we only support existing configuration.</=
p>
<p class=3D"MsoNormal">How can I implement the rest of the configurations/p=
arameters? (open issues?)</p>
<h3 style=3D"mso-list:l0 level3 lfo1"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.4.3.<span style=3D"font:7.0pt &quot;=
Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span>ARP </h3>
<p class=3D"MsoNormal">Not implemented in Tom=A1=AFs IPMI network story. </=
p>
<p class=3D"MsoNormal">Should I refer to openbmc/import-layers/meta-openemb=
edded/meta-networking/recipes-support/arptables ?</p>
<p class=3D"MsoNormal">Optional command. Not to implement?</p>
<h3 style=3D"mso-list:l0 level3 lfo1"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.4.4.<span style=3D"font:7.0pt &quot;=
Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span>IP/UDP/RMCP statistics</h3>
<p class=3D"MsoNormal">Seems like it was not implemented in obmc stories to=
o.</p>
<p class=3D"MsoNormal">This is an optional command. Not to implement?</p>
<p class=3D"MsoNormal">&nbsp;</p>
<h1 style=3D"mso-list:l0 level1 lfo1"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">2.<span style=3D"font:7.0pt &quot;Time=
s New Roman&quot;">&nbsp;&nbsp;&nbsp;
</span></span></span>IPMI LAN Commands in IPMI Spec 2.0 -- Format</h1>
<p class=3D"MsoNormal">&nbsp;</p>
<h2 style=3D"mso-list:l2 level2 lfo2"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.1.<span style=3D"font:7.0pt &quot;Ti=
mes New Roman&quot;">&nbsp;
</span></span></span>Set LAN Configuration Parameters command</h2>
<table class=3D"MsoTableGrid" style=3D"border-collapse:collapse;border:none=
;mso-border-alt:solid windowtext .5pt;=0A=
 mso-yfti-tbllook:1184;mso-padding-alt:0in 5.4pt 0in 5.4pt" cellpadding=3D"=
0" cellspacing=3D"0" border=3D"1">
<tbody>
<tr style=3D"mso-yfti-irow:0;mso-yfti-firstrow:yes">
<td style=3D"width:1.0in;border:solid windowtext 1.0pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"96">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Set LAN Configuration Parameters command</p>
</td>
<td style=3D"width:26.8pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"36">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Byte</p>
</td>
<td style=3D"width:62.85pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Bit field</p>
</td>
<td style=3D"width:76.85pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"102">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Description</p>
</td>
<td style=3D"width:193.0pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"257">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Support</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:1">
<td style=3D"width:1.0in;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"96">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Request Data</p>
</td>
<td style=3D"width:26.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"36">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
1</p>
</td>
<td style=3D"width:62.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[7:4]</p>
</td>
<td style=3D"width:76.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"102">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
reserved</p>
</td>
<td style=3D"width:193.0pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"257">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:2">
<td style=3D"width:1.0in;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"96">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:26.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"36">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:62.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[3:0]</p>
</td>
<td style=3D"width:76.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"102">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Channel number</p>
</td>
<td style=3D"width:193.0pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"257">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:3">
<td style=3D"width:1.0in;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"96">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:26.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"36">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
2</p>
</td>
<td style=3D"width:62.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:76.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"102">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Parameter selector</p>
</td>
<td style=3D"width:193.0pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"257">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:4">
<td style=3D"width:1.0in;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"96">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:26.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"36">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
3:N</p>
</td>
<td style=3D"width:62.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:76.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"102">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Configuration parameter data</p>
</td>
<td style=3D"width:193.0pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"257">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:5">
<td style=3D"width:1.0in;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"96">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Response Data</p>
</td>
<td style=3D"width:26.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"36">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
1</p>
</td>
<td style=3D"width:62.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Completion code</p>
</td>
<td style=3D"width:76.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"102">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
80h =3D parameter not supported.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
81h =3D attempt to set the =A1=AEset in progress=A1=AF value (in parameter =
#0) when not in the =A1=AEset complete=A1=AF state. (This completion code p=
rovides a way to recognize that another party has already =A1=AEclaimed=A1=
=AF the parameters)</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
82h =3D attempt to write read-only parameter</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
83h =3D attempt to read write-only parameter</p>
</td>
<td style=3D"width:193.0pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"257">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Existing code supports 7 LAN command:</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Set In Progress,</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Authentication Type Support,</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Authentication Type Enables,</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IP Address,</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
MAC Address,</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Subnet Mask,</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Default Gateway Address.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
<span style=3D"mso-ansi-language:DE" lang=3D"DE">Refer to:</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
<span style=3D"mso-ansi-language:DE" lang=3D"DE">https://github.com/openbmc=
/phosphor-networkd/blob/master/netman.py</span></p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:6;mso-yfti-lastrow:yes">
<td style=3D"width:1.0in;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"96">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
<span style=3D"mso-ansi-language:DE" lang=3D"DE">&nbsp;</span></p>
</td>
<td style=3D"width:26.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"36">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
<span style=3D"mso-ansi-language:DE" lang=3D"DE">&nbsp;</span></p>
</td>
<td style=3D"width:62.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
<span style=3D"mso-ansi-language:DE" lang=3D"DE">&nbsp;</span></p>
</td>
<td style=3D"width:76.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"102">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
<span style=3D"mso-ansi-language:DE" lang=3D"DE">&nbsp;</span></p>
</td>
<td style=3D"width:193.0pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"257">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
<span style=3D"mso-ansi-language:DE" lang=3D"DE">&nbsp;</span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"mso-ansi-language:DE" lang=3D"DE">&nb=
sp;</span></p>
<p class=3D"MsoNormal"><span style=3D"mso-ansi-language:DE" lang=3D"DE">&nb=
sp;</span></p>
<p class=3D"MsoNormal"><span style=3D"mso-ansi-language:DE" lang=3D"DE">&nb=
sp;</span></p>
<h2 style=3D"mso-list:l2 level2 lfo2"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.2.<span style=3D"font:7.0pt &quot;Ti=
mes New Roman&quot;">&nbsp;
</span></span></span>Get LAN Configuration Parameters Command</h2>
<table class=3D"MsoTableGrid" style=3D"border-collapse:collapse;border:none=
;mso-border-alt:solid windowtext .5pt;=0A=
 mso-yfti-tbllook:1184;mso-padding-alt:0in 5.4pt 0in 5.4pt" cellpadding=3D"=
0" cellspacing=3D"0" border=3D"1">
<tbody>
<tr style=3D"mso-yfti-irow:0;mso-yfti-firstrow:yes">
<td style=3D"width:86.3pt;border:solid windowtext 1.0pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Get LAN Configuration Parameters Command</p>
</td>
<td style=3D"width:25.95pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"35">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Byte</p>
</td>
<td style=3D"width:.5in;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"48">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Bit field</p>
</td>
<td style=3D"width:196.95pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"263">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Description</p>
</td>
<td style=3D"width:86.3pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Support</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:1">
<td style=3D"width:86.3pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Request Data</p>
</td>
<td style=3D"width:25.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"35">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
1</p>
</td>
<td style=3D"width:.5in;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"48">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[7]</p>
</td>
<td style=3D"width:196.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"263">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
0b =3D get parameter</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
1b =3D get parameter revision only</p>
</td>
<td style=3D"width:86.3pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:2">
<td style=3D"width:86.3pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:25.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"35">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:.5in;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"48">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[6:4]</p>
</td>
<td style=3D"width:196.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"263">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
reserved</p>
</td>
<td style=3D"width:86.3pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:3">
<td style=3D"width:86.3pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:25.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"35">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:.5in;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"48">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[3:0]</p>
</td>
<td style=3D"width:196.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"263">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Channel number</p>
</td>
<td style=3D"width:86.3pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:4">
<td style=3D"width:86.3pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:25.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"35">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
2</p>
</td>
<td style=3D"width:.5in;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"48">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:196.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"263">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Parameter selector</p>
</td>
<td style=3D"width:86.3pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:5">
<td style=3D"width:86.3pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:25.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"35">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
3</p>
</td>
<td style=3D"width:.5in;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"48">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:196.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"263">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Set Selector. Selects a given set of parameters under a given Parameter sel=
ector value.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
00h if parameter don=A1=AFt use a Set Selector.</p>
</td>
<td style=3D"width:86.3pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:6">
<td style=3D"width:86.3pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:25.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"35">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
4</p>
</td>
<td style=3D"width:.5in;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"48">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:196.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"263">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Block Selector (00h if parameter does not require a block number)</p>
</td>
<td style=3D"width:86.3pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:7">
<td style=3D"width:86.3pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Response Data</p>
</td>
<td style=3D"width:25.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"35">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
1</p>
</td>
<td style=3D"width:.5in;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"48">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[7:0]</p>
</td>
<td style=3D"width:196.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"263">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Completion Code.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Generic codes, plus following command-specific completion code(s):</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
80h =3D parameter not supported.</p>
</td>
<td style=3D"width:86.3pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Existing code supports 7 LAN command:</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Set In Progress,</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Authentication Type Support,</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Authentication Type Enables,</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IP Address,</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
MAC Address,</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Subnet Mask,</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Default Gateway Address.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Refer to https://github.com/openbmc/phosphor-networkd/blob/master/netman.py=
</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:8">
<td style=3D"width:86.3pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:25.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"35">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
2</p>
</td>
<td style=3D"width:.5in;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"48">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[7:0]</p>
</td>
<td style=3D"width:196.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"263">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Parameter revision.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Format: MSN =3D present revision. LSN =3D oldest revision parameter is back=
ward compatible with. 11h for parameters in this specification.</p>
</td>
<td style=3D"width:86.3pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:9">
<td colspan=3D"5" style=3D"width:431.5pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"575">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
The following data bytes are not returned when the =A1=AEget parameter revi=
sion only=A1=AF bit is 1b.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:10">
<td style=3D"width:86.3pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:25.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"35">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
3:N</p>
</td>
<td style=3D"width:.5in;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"48">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:196.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"263">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Configuration parameter data.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
If the rollback feature is implemented, the BMC makes a copy of the existin=
g parameters when the =A1=AEset in progress=A1=AF state becomes asserted (S=
ee the Set in Progress parameter #0). While the =A1=AEset in progress=A1=AF=
 state is active, the BMC will return data from this
 copy of the parameters, plus any uncommitted changes that were made to dat=
a. Otherwise, the BMC returns parameter data from non-volatile storage.</p>
</td>
<td style=3D"width:86.3pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:11">
<td style=3D"width:86.3pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:25.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"35">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:.5in;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"48">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:196.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"263">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:86.3pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:12;mso-yfti-lastrow:yes">
<td style=3D"width:86.3pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:25.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"35">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:.5in;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"48">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:196.95pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"263">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:86.3pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"115">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">&nbsp;</p>
<h3 style=3D"mso-list:l2 level3 lfo2"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.2.1.<span style=3D"font:7.0pt &quot;=
Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span>DHCPv6 Timing Parameters</h3>
<p class=3D"MsoNormal">Not support.</p>
<h3 style=3D"mso-list:l2 level3 lfo2"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.2.2.<span style=3D"font:7.0pt &quot;=
Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span>Neighbor discovery / SLAAC Timing Parameters</h3>
<p class=3D"MsoNormal">Not support.</p>
<h2 style=3D"mso-list:l2 level2 lfo2"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.3.<span style=3D"font:7.0pt &quot;Ti=
mes New Roman&quot;">&nbsp;
</span></span></span>Suspend BMC ARPs command</h2>
<table class=3D"MsoTableGrid" style=3D"border-collapse:collapse;border:none=
;mso-border-alt:solid windowtext .5pt;=0A=
 mso-yfti-tbllook:1184;mso-padding-alt:0in 5.4pt 0in 5.4pt" cellpadding=3D"=
0" cellspacing=3D"0" border=3D"1">
<tbody>
<tr style=3D"mso-yfti-irow:0;mso-yfti-firstrow:yes">
<td style=3D"width:81.9pt;border:solid windowtext 1.0pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"109">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Suspend BMC ARPs Command</p>
</td>
<td style=3D"width:75.85pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Byte</p>
</td>
<td style=3D"width:78.15pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"104">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Bit field</p>
</td>
<td style=3D"width:1.15in;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"110">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Description</p>
</td>
<td style=3D"width:112.8pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"150">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Support</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:1">
<td style=3D"width:81.9pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"109">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Request</p>
</td>
<td style=3D"width:75.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
1</p>
</td>
<td style=3D"width:78.15pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"104">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[7:4]</p>
</td>
<td style=3D"width:1.15in;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"110">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Reserved</p>
</td>
<td style=3D"width:112.8pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"150">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:2">
<td style=3D"width:81.9pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"109">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:78.15pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"104">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[3:0]</p>
</td>
<td style=3D"width:1.15in;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"110">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Channel number</p>
</td>
<td style=3D"width:112.8pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"150">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:3">
<td style=3D"width:81.9pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"109">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
2</p>
</td>
<td style=3D"width:78.15pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"104">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[7:2]</p>
</td>
<td style=3D"width:1.15in;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"110">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Reserved</p>
</td>
<td style=3D"width:112.8pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"150">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:4">
<td style=3D"width:81.9pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"109">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:78.15pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"104">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[1]</p>
</td>
<td style=3D"width:1.15in;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"110">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
ARP response suspend.</p>
</td>
<td style=3D"width:112.8pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"150">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:5">
<td style=3D"width:81.9pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"109">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:78.15pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"104">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[0]</p>
</td>
<td style=3D"width:1.15in;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"110">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Gratuitous ARP suspend</p>
</td>
<td style=3D"width:112.8pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"150">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:6">
<td style=3D"width:81.9pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"109">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Respond</p>
</td>
<td style=3D"width:75.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
1</p>
</td>
<td style=3D"width:78.15pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"104">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:1.15in;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"110">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Completion code</p>
</td>
<td rowspan=3D"5" style=3D"width:112.8pt;border-top:none;=0A=
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid =
windowtext 1.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"150">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Do not support.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
( Should refer to</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
openbmc/import-layers/meta-openembedded/meta-networking/recipes-support/arp=
tables? )</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:7">
<td style=3D"width:81.9pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"109">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
2</p>
</td>
<td style=3D"width:78.15pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"104">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:1.15in;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"110">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
present state o f ARP suspension</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:8">
<td style=3D"width:81.9pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"109">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:78.15pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"104">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[7:2]</p>
</td>
<td style=3D"width:1.15in;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"110">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
reserve</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:9">
<td style=3D"width:81.9pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"109">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:78.15pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"104">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[1]</p>
</td>
<td style=3D"width:1.15in;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"110">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:10;mso-yfti-lastrow:yes">
<td style=3D"width:81.9pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"109">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:75.85pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"101">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:78.15pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"104">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[0]</p>
</td>
<td style=3D"width:1.15in;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"110">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal">Address Resolution Protocol.</p>
<h2 style=3D"mso-list:l2 level2 lfo2"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">1.4.<span style=3D"font:7.0pt &quot;Ti=
mes New Roman&quot;">&nbsp;
</span></span></span>Get IP/UDP/RMCP Statistics Command</h2>
<table class=3D"MsoTableGrid" style=3D"border-collapse:collapse;border:none=
;mso-border-alt:solid windowtext .5pt;=0A=
 mso-yfti-tbllook:1184;mso-padding-alt:0in 5.4pt 0in 5.4pt" cellpadding=3D"=
0" cellspacing=3D"0" border=3D"1">
<tbody>
<tr style=3D"mso-yfti-irow:0;mso-yfti-firstrow:yes">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Get IP/UDP/RMCP Statistics Command</p>
</td>
<td style=3D"width:35.0pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Byte</p>
</td>
<td style=3D"width:30.8pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Bit field</p>
</td>
<td style=3D"width:63.0pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Description</p>
</td>
<td style=3D"width:231.15pt;border:solid windowtext 1.0pt;=0A=
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt=
:=0A=
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=
=3D"308">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Support</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:1">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Request Data</p>
</td>
<td style=3D"width:35.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
1</p>
</td>
<td style=3D"width:30.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[7:4]</p>
</td>
<td style=3D"width:63.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
reserved</p>
</td>
<td style=3D"width:231.15pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"308">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:2">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:35.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:30.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[3:0]</p>
</td>
<td style=3D"width:63.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Channel number</p>
</td>
<td style=3D"width:231.15pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"308">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:3">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:35.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
2</p>
</td>
<td style=3D"width:30.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[7:1]</p>
</td>
<td style=3D"width:63.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
clear statistics</p>
</td>
<td style=3D"width:231.15pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"308">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:4">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:35.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:30.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[0]</p>
</td>
<td style=3D"width:63.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:231.15pt;border-top:none;border-left:=0A=
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1=
.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"308">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:5">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Respond Data</p>
</td>
<td style=3D"width:35.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
1</p>
</td>
<td style=3D"width:30.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:63.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Completion Code</p>
</td>
<td rowspan=3D"10" style=3D"width:231.15pt;border-top:none;=0A=
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid =
windowtext 1.0pt;=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"308">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
RMCP is implemented in openbmc. </p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Refer to</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
https://github.com/openbmc/openbmc/issues/432 <span style=3D"mso-spacerun:y=
es">&nbsp;</span>and so on.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Discussed with Tom, these statistics is not implemented in phosphor-network=
d.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:6">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:35.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
2:3</p>
</td>
<td style=3D"width:30.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:63.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IP Packets Received.</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:7">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:35.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
4:5</p>
</td>
<td style=3D"width:30.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:63.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Received IP Header Errors</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:8">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:35.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
6:7</p>
</td>
<td style=3D"width:30.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:63.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Received IP Address Errors</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:9">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:35.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
8:9</p>
</td>
<td style=3D"width:30.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:63.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Fragmented IP Packets Received</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:10">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:35.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
10:11</p>
</td>
<td style=3D"width:30.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:63.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
IP Packets Transmitted</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:11">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:35.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
12:13</p>
</td>
<td style=3D"width:30.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:63.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
UDP Packets Received</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:12">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:35.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
14:15</p>
</td>
<td style=3D"width:30.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:63.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Valid RMCP Received</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:13">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:35.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
16:17</p>
</td>
<td style=3D"width:30.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:63.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
UDP Proxy Packets Received</p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:14;mso-yfti-lastrow:yes">
<td style=3D"width:71.55pt;border:solid windowtext 1.0pt;=0A=
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:s=
olid windowtext .5pt;=0A=
  padding:0in 5.4pt 0in 5.4pt" valign=3D"top" width=3D"95">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:35.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"47">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
18:19</p>
</td>
<td style=3D"width:30.8pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"41">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
</td>
<td style=3D"width:63.0pt;border-top:none;border-left:none;=0A=
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;=
=0A=
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid window=
text .5pt;=0A=
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt" valign=
=3D"top" width=3D"84">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
UDP Proxy Packets dropped</p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal">&nbsp;</p>
<h1 style=3D"mso-list:l0 level1 lfo1"><span style=3D"mso-fareast-font-famil=
y:&quot;Calibri Light&quot;;mso-fareast-theme-font:major-latin;=0A=
mso-bidi-font-family:&quot;Calibri Light&quot;;mso-bidi-theme-font:major-la=
tin"><span style=3D"mso-list:Ignore">3.<span style=3D"font:7.0pt &quot;Time=
s New Roman&quot;">&nbsp;&nbsp;&nbsp;
</span></span></span>End</h1>
<p>```<br>
</p>
</div>
<br>
<p></p>
</div>
</body>
</html>

--_000_TY1PR06MB0863871D99A02C72E98F2462F6C20TY1PR06MB0863apcp_--
