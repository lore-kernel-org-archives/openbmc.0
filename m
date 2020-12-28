Return-Path: <SRS0=Z7Cn=GA=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	CHARSET_FARAWAY_HEADER,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04A5C433E0
	for <openbmc@archiver.kernel.org>; Mon, 28 Dec 2020 13:57:16 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A04E520795
	for <openbmc@archiver.kernel.org>; Mon, 28 Dec 2020 13:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A04E520795
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=quantatw.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4JyF1JC7zDqBW
	for <openbmc@archiver.kernel.org>; Tue, 29 Dec 2020 00:57:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=6241cadec=scron.chang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=cdKbTyWg; 
 dkim-atps=neutral
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4D4JsC2GTxzDqBK
 for <openbmc@lists.ozlabs.org>; Tue, 29 Dec 2020 00:52:38 +1100 (AEDT)
IronPort-SDR: nqwo3wkN1goUjc/+ifPHD8xGIkOJLDtk3rk66iLybZIumLTWZdt1aQnaBD3ozxRp22iE3/ZXiN
 pip8wUDpVGbw==
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx02.quantatw.com with ESMTP; 28 Dec 2020 21:52:35 +0800
Received: from mailbx06.quanta.corp (10.243.91.101) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 28 Dec
 2020 21:52:34 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.56)
 by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Mon, 28 Dec 2020 21:52:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4m8aeuKzxqRuvJCCA+GRJCnsybjmsYiYCB9vCKwQXdUEcFWLUYqN+2afuFno5/q1eOjPAXWIpL9LIxC+nV+LPc0xb5H6FppqVReKRlfkMNGS6vv0B7RL2bMsc9wuwmZ+6DE13rglFACweDbeO5Stu+L+e+AUsMIljnQcziKbZxonshSOzY699XqDYnkNjDAfzOvIA3qSVetxKH0MTRTpOT3HI0hZxTMi83fupa4+zOBEihyaUk7cEGQD7D6Qt79Y8nQsQRPbweFCaXbBjTXLyD6f4K04KQRyRjmjZ/ApybQPdQlBb+Xeomcj/S1IZEru1p8fJpVecgwGfJkWISkFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXJH3NdOD7+nDZDuLeEa5jjYhY2bwesDz0gbj9o5bGo=;
 b=YIaiWXqHNOUBRB28o+w0NsBSZKXDKueMFYNc/RA5IckjMBi+n7ZyaEZwivVcTNIYLP6AtxX8fRlaZuKDHGwhrZUrVFCizoFIfbJi5CGVxs+PHiwtS3GasV7caMHK1OcMHuMuQRaUwVloDsOqryWmNi6LJRcn0fJr5WRR/+x2zZmZFpkDxuxqFjo7/i2DavyI0f7dqFi12kXJrwxqPx23aNo+z/Epi7ImM4WzT+on32ETgc1PNPrF35YF8ODyBH98MUtjGGO2Bd0Gy3Rg5w6tMTWM1NbTeoiXaaKagexwe3BCD864JbAjiE+6UfpCx9oer3/ztYc++RVllIwHTIFI3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXJH3NdOD7+nDZDuLeEa5jjYhY2bwesDz0gbj9o5bGo=;
 b=cdKbTyWgnbzwBNhtzAm8kDiSsykcMtRBednYkyd45rL64S7ZLJT4Bqu1lBRRlUxTb0T6+MMzt33jCRA559mI5/UzuZEt8BZOjdfZAq0YoN6S0oMIVpRGVbCOsTbTR7oGuZuZqCoxCjwlJwLBs4OE5tI5ixHPWm+HZ4MiG1ZLw1Q=
Received: from TYZPR04MB4416.apcprd04.prod.outlook.com (2603:1096:400:21::10)
 by TYZPR04MB4237.apcprd04.prod.outlook.com (2603:1096:400:24::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Mon, 28 Dec
 2020 13:52:31 +0000
Received: from TYZPR04MB4416.apcprd04.prod.outlook.com
 ([fe80::e455:cdf7:7a3a:6e9b]) by TYZPR04MB4416.apcprd04.prod.outlook.com
 ([fe80::e455:cdf7:7a3a:6e9b%5]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 13:52:31 +0000
From: =?big5?B?U2Nyb24gQ2hhbmcgKLFppfKptSk=?= <Scron.Chang@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [entity-manager]Should I add min,max to legacy.json?
Thread-Topic: [entity-manager]Should I add min,max to legacy.json?
Thread-Index: AdbdH6A8Opx47rgpRCuwFHgpVjfezA==
Date: Mon, 28 Dec 2020 13:52:30 +0000
Message-ID: <TYZPR04MB4416F10FB143300652DAF8E286D90@TYZPR04MB4416.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4f41705-3352-4881-24bf-08d8ab37d231
x-ms-traffictypediagnostic: TYZPR04MB4237:
x-microsoft-antispam-prvs: <TYZPR04MB42371D41AC3F1CAC739C564286D90@TYZPR04MB4237.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0mpg6bkzu5Qx3rvpiQ52SWqqTQtos5UXO9xRQagBH1BN/0a42MOtHmO5036iniFJg5MbFkou8WFzuz5dkxO28c8h+vhmMc+4FVmnYHEH2ut4d4/1DlpiYxZ6saGIr0b+Pe2wZNZRLoDhWXy3WhuRxVJPgspmf1+X04emBbyocHFBavbGJUqQeOSEvYGwuf02II+0sJ92W9vimMdxB53fLFmTTlxTVEtQJk6WpZD0BTidR6ZP51yN4Lcb9Ye4XdUNNnrkSWOsNnllH0xsmqxVNbmCMEBDaekFHBkrCTFH4Zlmhk0fVjP2fN/QvI39OHxxMwD01tFJGoXijN7DSeL/2IQxqMnGVX9gvs/JAw8MqGiBOP9mf4fRpG2gbc5J/rCBdPk1RuN2WEh2FDgw4LfxjKtOGsKdk/+qA2UI+km7X2V5fWD7ALRD2NyZOo+p2GCOxU3zFpeUm++bKnpl3dk8Uw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR04MB4416.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(66476007)(85182001)(76116006)(83380400001)(478600001)(86362001)(55016002)(186003)(7696005)(66556008)(966005)(71200400001)(8676002)(33656002)(9686003)(6506007)(8936002)(66946007)(2906002)(6916009)(316002)(26005)(52536014)(64756008)(5660300002)(4744005)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?QWFNQzkvU3U4b0xEWlBIWDJURXpDRFFwcFJGNkFCMXZOcWcvcGpRRlNDKzAzcjRP?=
 =?big5?B?S1gyNjdHRFY2cUd2WUpab0tEVkdLLzVQWG1MQXlnMjltdXFmeFNLSTdFMlFHaFpQ?=
 =?big5?B?SC9zeVU1WWIxVlo1cGFrSVNXV1c0Ujg3NmFIUGpuMzBPdVp1blVoQmNCVEFsYi9t?=
 =?big5?B?a3NKTklNYzYzZ0VEcERJenp2Q1VESlJJa1Q0QVhWdlNabVVBS0xKZU1BWlVuajZv?=
 =?big5?B?UTNCRXJ5OG9JTGpXb2JsK1FEMDdjVGRLZHFoMVpmTWtrQkt3NFdLai9jdTA1RVdn?=
 =?big5?B?aVlmNVNzNGtrVnFOM3NMMjROT092Y2o1YVMyMGU0djdkZEU5WWM1ZHFlYTRIbW15?=
 =?big5?B?UHdCSHdVdjZWa1ZnbExTa2dHNFNLYzZPQi92YWhmLzJCTk10MXhRd1lXN3VZRFlJ?=
 =?big5?B?TUVKeVlKdkRtSlYyM29WZ242c2hkbFVDVTF0L2x6VEt3WitpcjMxb3R6dGFvbzZi?=
 =?big5?B?N21nZ1YxSHhaMU53SkV5Z0M1Q0U4NUk4SGJ4c3ZDeE4vWmVZbnRVMzdMN1JwU3ll?=
 =?big5?B?REVYWkl4dlZCSXBDUWIweGdKQkV6RE5JRG9PZkRQbE5QcVlpUE5zRjZHa2ZsOGlk?=
 =?big5?B?NmNVV2dvRmJZY0ZDRzR5ZDh2QzZzUGhxaEt1TldCWjBCQVliT2NRM285STc4MnY5?=
 =?big5?B?cDBUT2lwTFNVLzlEdnRDT3F5VDN1Vk5qNjBjUmx6SHhTcGhwK2F5N1NRRjNreWgy?=
 =?big5?B?aVJBYmMrWW1NUG1WamhidmNVUEJTYTdCVnBWbHRPUFNGVzdCRndQUXlnRFBWUXpC?=
 =?big5?B?UHlQcXp3bVIwSFBwcXd1NEtVZk1tdDRCbjJ1RjU2TXlrUTVJNEtuMkdXcFd3QWU4?=
 =?big5?B?WldmUm9qUDMvcnozQUcxQUc4MFJPbm9paTJIOEJ6cThjTEpNOUZ0bEh1VE5LQ3l6?=
 =?big5?B?N2VETXlvZjZaVmZ4dHBLZUR1TFBpWitpcFN5UHJ4VGlSOGU2ZHgybHI0ejhUUWlh?=
 =?big5?B?aDBMT3VkVlNsU2g1K1lXc3lCWWlCMjIrRmZBTWJacENzNCtJcnk3eWprUUI5ZUhS?=
 =?big5?B?WUdtWXdwWE4vUTdxTS9tbGxuYytVKzNhaEJDNW82OXBBQ082U3JGamtnYmtTa3dw?=
 =?big5?B?MGVUcnI0alVVeWZZdmE5aC9FZFo5NGFZQ2VRbkJJRW4xeU5Vdm81SGt4TlNEQjVh?=
 =?big5?B?NVdYTm9WM0xTRkdGalQ2WEhTcVlTSnhkdlZ5eU95VDZuTkNGZUt2djE3SVhFNEtF?=
 =?big5?Q?RC3ZZ8sa2Zc/1rlDa3+GnEy00VReg8wEKtqxjTjSCRA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB4416.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f41705-3352-4881-24bf-08d8ab37d231
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2020 13:52:30.9976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PhIuJArKu6FpPeU6Hy3cSPThtC43tXiqb37dH2wbkxCmqGNI+YhxjdLUNeGB8SK6OS5N2ZC+hCRQ63xG5oLDLGHnQqWILAXrwd7gHjyuWg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4237
X-OriginatorOrg: quantatw.com
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

SGkgYWxsLA0KIA0KICBJbiBteSBjYXNlLCBsb3RzIG9mIGRidXMtc2Vuc29ycy9QU1VTZW5zb3Ig
YXJlIHVzaW5nLiBSZWZlciB0byB0aGUgaGludCBpbiBQU1VTZW5zb3JNYWluLmNwcCBMNTc2IHRv
IGRlZmluZSB0aGUgdmFsdWUgb2YgbWF4aW11bS9taW5pbXVtLCBsb3RzIG9mIG9iamVjdHMgbGlr
ZSB2b3V0MV9tYXgsIGlvdXQxX21pbqFLIGFyZSBkZWZpbmVkIGluIG15IGNvbmZpZ3VyYXRpb24g
ZmlsZS4gRXZlbiB0aG91Z2ggaXQgd29ya3MgKGNoZWNrIGJ5IGlwbWl0b29sIHNlbnNvciBjb21t
YW5kKSwgdGhpcyBqc29uIGRhdGEgY2FuJ3QgcGFzcyB0byBlbnRpdHktbWFuYWdlci9zY3JpcHRz
L3ZhbGlkYXRlLWNvbmZpZ3MucHkuIFRoZSByZWFzb24gc2hvdWxkIGJlIHRoZXJlIGFyZSBubyBv
YmplY3RzIG9mIFBTVSBzZW5zb3JzJyBtYXhpbXVtIGFuZCBtaW5pbXVtIGluIGVudGl0eS1tYW5h
Z2VyL3NjaGVtYS9sZWdhY3kuanNvbi4gU2hvdWxkIEkgZGlyZWN0bHkgYWRkIHRob3NlIG1heGlt
dW0gYW5kIG1pbmltdW0gb2JqZWN0cyB0byBzY2hlbWEvbGVnYWN5Lmpzb24gYW5kIHN1Ym1pdCBz
Y2hlbWEvbGVnYWN5Lmpzb24gdG8gdXBzdHJlYW0/DQogDQpSZWY6IGh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuYm1jL2RidXMtc2Vuc29ycy9ibG9iLzIzYzk2ZTdjMjQ5YjQxZWZlY2MxMGJhN2FjYmE4
MjYwM2E1NGI5OTYvc3JjL1BTVVNlbnNvck1haW4uY3BwI0w1NzYNCiANCkkgd291bGQgYXBwcmVj
aWF0ZSBhbnkgc3VnZ2VzdGlvbnMuDQoNClNjcm9uIENoYW5nDQpFLU1haWwgIFNjcm9uLkNoYW5n
QHF1YW50YXR3LmNvbQ0KRXh0LiAgICAxMTkzNg0KDQo=
