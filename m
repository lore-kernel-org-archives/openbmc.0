Return-Path: <Eugene.Cho@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.218; helo=esa8.dell-outbound.iphmx.com;
 envelope-from=eugene.cho@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="M/2KKcLR"; 
 dkim-atps=neutral
X-Greylist: delayed 641 seconds by postgrey-1.36 at bilbo;
 Wed, 02 May 2018 03:32:44 AEST
Received: from esa8.dell-outbound.iphmx.com (esa8.dell-outbound.iphmx.com
 [68.232.149.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40b7lc1GnVzF2Qw
 for <openbmc@lists.ozlabs.org>; Wed,  2 May 2018 03:32:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1525195964; x=1556731964;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g/bTm3Gu0Zdpk3sY/YoCH2Jg5PHq1e/RbypD6uF8WaA=;
 b=M/2KKcLRlyse4fO57tsC0RvNH3Mh3zzYVGi1OywJpWDr5IFS9PBO3+PF
 lQEU2Qw+IYaMuyYrMroxDNHhJJzQJN742yv5B2SmYYrD4WtKHjTXK5rDB
 iyi8OKruHN8t9icpNVaHlAQHGfUXrNJLksDLORpeeIIdB4z61y00yXlQg 0=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GQAAAVoehah2Ka6ERcGgEBAQEBAgEBA?=
 =?us-ascii?q?QEIAQEBAYQWgQgyg2KUfoF0gQ+TFIF4C4RsAhqCXCE2FgECAQEBAQEBAgEBAhA?=
 =?us-ascii?q?BAQEKCwkIKC+CNSKCUwEBAQECASMRRRACAQgaAiYCAgJFEAIEAQ0NhHYJCKkZg?=
 =?us-ascii?q?hyHZ1+CR4EJhw+CE4QahRCCY4JUAowQjAIIjkOMX5A8gSUjAoICcIMUgi0ajga?=
 =?us-ascii?q?QJ4EYAQE?=
X-IPAS-Result: =?us-ascii?q?A2GQAAAVoehah2Ka6ERcGgEBAQEBAgEBAQEIAQEBAYQWgQg?=
 =?us-ascii?q?yg2KUfoF0gQ+TFIF4C4RsAhqCXCE2FgECAQEBAQEBAgEBAhABAQEKCwkIKC+CN?=
 =?us-ascii?q?SKCUwEBAQECASMRRRACAQgaAiYCAgJFEAIEAQ0NhHYJCKkZghyHZ1+CR4EJhw+?=
 =?us-ascii?q?CE4QahRCCY4JUAowQjAIIjkOMX5A8gSUjAoICcIMUgi0ajgaQJ4EYAQE?=
Received: from esa4.dell-outbound2.iphmx.com ([68.232.154.98])
 by esa8.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2018 12:21:56 -0500
From: <Eugene.Cho@dell.com>
Received: from ausxippc106.us.dell.com ([143.166.85.156])
 by esa4.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2018 23:21:56 +0600
X-LoopCount0: from 10.166.132.131
X-IronPort-AV: E=Sophos;i="5.49,351,1520917200"; d="scan'208";a="245960486"
X-DLP: DLP_GlobalPCIDSS
To: <andrew@aj.id.au>, <joel@jms.id.au>
CC: <openbmc@lists.ozlabs.org>
Subject: RE: [RFC PATCH linux dev-4.13 1/3] soc: aspeed: Miscellaneous control
 interfaces
Thread-Topic: [RFC PATCH linux dev-4.13 1/3] soc: aspeed: Miscellaneous
 control interfaces
Thread-Index: AQHT0hKUQl2wjrUQNUm9NJn3QqEL/aQHxt0AgAAMggCAE2V10A==
Date: Tue, 1 May 2018 17:21:41 +0000
Message-ID: <d0d76c65aa504f63a4105207941ec24c@AUSX13MPC105.AMER.DELL.COM>
References: <20180412035145.21488-1-andrew@aj.id.au>
 <20180412035145.21488-2-andrew@aj.id.au>
 <CACPK8Xco1vLEFtxTmfp_roN0khOfdYMQAjN+R4mgo6DScwRZWA@mail.gmail.com>
 <1524109954.2421916.1343180600.297713A4@webmail.messagingengine.com>
In-Reply-To: <1524109954.2421916.1343180600.297713A4@webmail.messagingengine.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titusconfig: No Restrictions 04051212
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvIiwiaWQiOiIwNjYzOTRjZS0zNzMwLTQ2MDUtYWM1Yy1mMjMxOTE0ZjExZWEiLCJwcm9wcyI6W3sibiI6IkNsYXNzaWZpY2F0aW9uIiwidmFscyI6W3sidmFsdWUiOiJObyBSZXN0cmljdGlvbnMifV19LHsibiI6IlN1YmxhYmVscyIsInZhbHMiOltdfSx7Im4iOiJFeHRlcm5hbENvcnJlc3BvbmRlbmNlIiwidmFscyI6W119XX0sIlN1YmplY3RMYWJlbHMiOltdLCJUTUNWZXJzaW9uIjoiMTYuMi4xMS4wIiwiVHJ1c3RlZExhYmVsSGFzaCI6Inc1UThmV0J6WllNVmNnNERRUm9UU1BlUEQyaDErZ2Y5Rlh3cDNleHhEcHc9In0=
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
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
X-List-Received-Date: Tue, 01 May 2018 17:32:45 -0000

DQo+PiBBbiBvYnNlcnZhdGlvbjogSXQncyB0aGUgb25seSB0aGluZyBpbnNpZGUgdGhpcyBmaWxl
IHRoYXQgaXMgYXNwZWVkIA0KPj4gc3BlY2lmaWMuIElmIG5vdCBmb3IgdGhlIG5hbWUsIGl0IGNv
dWxkIGJlIGdlbmVyaWMgY29kZS4NCg0KPkkgYWdyZWUsIGhlbmNlIHNvbWUgb2YgdGhlIGJ1bGxl
dCBwb2ludHMgaW4gdGhlIGNvdmVyIGxldHRlci4gQnV0IGl0J3MgbmFtZSBhbmQgbG9jYXRpb24g
d2FzIGFsc28gcGFydGx5IGRyaXZlbiBieSBBcm5kJ3Mgc3VnZ2VzdGlvbiB0aGF0IHdlIHN0aWNr
IHRoZSBqdW5rIGluIGRyaXZlcnMvc29jLCBhbmQgaXQgZmVsdCBhIGJpdCB3ZWlyZCBub3QgdG8g
dXNlIGFzcGVlZCBpbiB0aGUgbmFtZSA+Z2l2ZW4gdGhlIGNvbnZlbnRpb24gdGhlcmUuDQoNCkp1
c3QgRllJIC0gV2UndmUgZ290IHRoZSBzYW1lIGV4YWN0IHByb2JsZW0gb24gTnV2b3RvbiAoanVz
dCBvZGRzIGFuZCBlbmRzIGluIG1pc2MgcmVnaXN0ZXJzKS4gRG9lcyB0aGlzIGltcGx5IHdlIHdp
bGwgbmVlZCBhIHNvYy9ucGNtNzUwIHdoaWNoIGFsc28gZG9lcyB0aGUgZXhhY3Qgc2FtZSB0aGlu
Zz8NCg0KSSdtIGd1ZXNzaW5nIG1ha2luZyBpdCB0b28gZ2VuZXJpYyAtIHdpbGwgbWFrZSBpdCBo
YXJkZXIgdG8gZ2V0IHVwc3RyZWFtPw0KDQo=
