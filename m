Return-Path: <Eugene.Cho@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.229; helo=esa6.dell-outbound.iphmx.com;
 envelope-from=eugene.cho@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="sTxYU439"; 
 dkim-atps=neutral
Received: from esa6.dell-outbound.iphmx.com (esa6.dell-outbound.iphmx.com
 [68.232.149.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hhp7160KzF2Fl
 for <openbmc@lists.ozlabs.org>; Fri, 11 May 2018 04:39:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1525977551; x=1557513551;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1UWxvA0WAO+e88I9m9fJmC1hcvFTS+oYWN1fX5lk0SM=;
 b=sTxYU439tdhlBpVK9vA5phUZSNUxAoEi97JWcHBU4Hwk3x4F1QtxMshf
 HHYOdOw4PYrDImL7c52trxwvlJIQiIY7g3oxpwfdlaQOAnHZSwNjPaY+2
 iwVRG1mfVuf8ipBD9YEySSLzJzP0cUP89zUZfpFd7PWDMN3mKr+5JKerX A=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GcAAD0kPRah2Oa6ERcGwEBAQEDAQEBC?=
 =?us-ascii?q?QEBAYQWgQkyg2eIA4xugXmBD1+SVIF4C4RsAhqCZyE0GAECAQEBAQEBAgEBAhA?=
 =?us-ascii?q?BAQEKCwkIKC+CNSKCUwEBAQECASMRRQULAgEIGgImAgICRRACBAENDYMbgXAJC?=
 =?us-ascii?q?KtXghyHaF+CSIEJhxyCE4Qah3OCVAKYLQcCjkeBMIs9giuOK4ElHIILcIMUgi0?=
 =?us-ascii?q?ajgaQD4EYAQE?=
X-IPAS-Result: =?us-ascii?q?A2GcAAD0kPRah2Oa6ERcGwEBAQEDAQEBCQEBAYQWgQkyg2e?=
 =?us-ascii?q?IA4xugXmBD1+SVIF4C4RsAhqCZyE0GAECAQEBAQEBAgEBAhABAQEKCwkIKC+CN?=
 =?us-ascii?q?SKCUwEBAQECASMRRQULAgEIGgImAgICRRACBAENDYMbgXAJCKtXghyHaF+CSIE?=
 =?us-ascii?q?JhxyCE4Qah3OCVAKYLQcCjkeBMIs9giuOK4ElHIILcIMUgi0ajgaQD4EYAQE?=
Received: from esa6.dell-outbound2.iphmx.com ([68.232.154.99])
 by esa6.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2018 13:39:07 -0500
From: <Eugene.Cho@dell.com>
Received: from ausc60ps301.us.dell.com ([143.166.148.206])
 by esa6.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 May 2018 00:39:04 +0600
X-LoopCount0: from 10.166.132.130
X-IronPort-AV: E=Sophos;i="5.49,386,1520917200"; d="scan'208";a="1149511259"
X-DLP: DLP_GlobalPCIDSS
To: <andrew@aj.id.au>, <joel@jms.id.au>, <benh@kernel.crashing.org>
CC: <openbmc@lists.ozlabs.org>
Subject: RE: [RFC PATCH linux dev-4.13 1/3] soc: aspeed: Miscellaneous control
 interfaces
Thread-Topic: [RFC PATCH linux dev-4.13 1/3] soc: aspeed: Miscellaneous
 control interfaces
Thread-Index: AQHT0hKUQl2wjrUQNUm9NJn3QqEL/aQHxt0AgAAMggCAE2V10IANedUAgACdI8A=
Date: Thu, 10 May 2018 18:39:02 +0000
Message-ID: <4036e67550b341668ac78fd6e493f878@AUSX13MPC105.AMER.DELL.COM>
References: <20180412035145.21488-1-andrew@aj.id.au>
 <20180412035145.21488-2-andrew@aj.id.au>
 <CACPK8Xco1vLEFtxTmfp_roN0khOfdYMQAjN+R4mgo6DScwRZWA@mail.gmail.com>
 <1524109954.2421916.1343180600.297713A4@webmail.messagingengine.com>
 <d0d76c65aa504f63a4105207941ec24c@AUSX13MPC105.AMER.DELL.COM>
 <1525917124.2417085.1366924696.1ADBC6F3@webmail.messagingengine.com>
In-Reply-To: <1525917124.2417085.1366924696.1ADBC6F3@webmail.messagingengine.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titusconfig: No Restrictions 04051212
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvIiwiaWQiOiI0OGEwNzk0Mi02YjQ2LTQ0YTYtOTU3Ny01YjY0YzIxYTIwOTYiLCJwcm9wcyI6W3sibiI6IkNsYXNzaWZpY2F0aW9uIiwidmFscyI6W3sidmFsdWUiOiJObyBSZXN0cmljdGlvbnMifV19LHsibiI6IlN1YmxhYmVscyIsInZhbHMiOltdfSx7Im4iOiJFeHRlcm5hbENvcnJlc3BvbmRlbmNlIiwidmFscyI6W119XX0sIlN1YmplY3RMYWJlbHMiOltdLCJUTUNWZXJzaW9uIjoiMTYuMi4xMS4wIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImFYYkZDT25kOTdhdzBha1JwRkRzWnZQVldaYUF0ZHAzSjAwZG9EYTdWVDA9In0=
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2018 18:39:12 -0000

SGV5IEFuZHJldyAtIA0KDQo+IEhhdmUgeW91IHBsYXllZCB3aXRoIHRoZSBpbXBsZW1lbnRhdGlv
biBhdCBhbGw/IFdvdWxkIGJlIGdvb2QgdG8gZ2V0IHNvbWUgY29uc2Vuc3VzIG9uIGl0IGJlaW5n
IGEgZGVjZW50IGFwcHJvYWNoIGhlcmUgYmVmb3JlIHdlIGdvIHVwc3RyZWFtIHdpdGggaXQuIEkg
YWxzbyBuZWVkIHRvIGFkZCBkZXZpY2V0cmVlIGJpbmRpbmdzIGFuZCBBQkkgZG9jdW1lbnRhdGlv
bi4uLg0KDQpZZWEgd2UgaGF2ZSBhICJEZWxsIiBkcml2ZXIgd2hpY2ggYWxtb3N0IG1hdGNoZXMg
ZXhhY3RseSBhc3BlZWQtYm1jLW1pc2MuYyAoc3lzZnMgbm9kZSBwZXIgcmVnaXN0ZXIgZmllbGQu
Li4gIGxhYmVsLHJlZy1vZmZzZXQsIGFuZCBiaXQtbWFzayBjb25maWd1cmVkIHZpYSBkdCkuIA0K
SSB0aGluayB3aGF0IHlvdSBnb3QgaXMgZ29vZCwgb25seSB0aGluZyBJIHdvdWxkIHNheSBpcyBt
YXliZSByZW1vdmUgdGhlIHJlZmVyZW5jZXMgdG8gYXNwZWVkPw0KDQo=
