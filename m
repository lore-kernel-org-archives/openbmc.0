Return-Path: <prvs=9497a70a9=Duke.Du@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=9497a70a9=duke.du@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 685 seconds by postgrey-1.36 at bilbo;
 Fri, 22 Feb 2019 20:25:12 AEDT
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 445Qt00h9nzDqSY
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 20:25:11 +1100 (AEDT)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 22 Feb 2019 17:13:43 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Fri, 22 Feb
 2019 17:13:41 +0800
Received: from mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381]) by
 mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381%11]) with mapi id
 15.01.1531.004; Fri, 22 Feb 2019 17:13:41 +0800
From: =?big5?B?RHVrZSBEdSAop/myu7nFKQ==?= <Duke.Du@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Add driver MAX31725/6 to linux kernel 4.19 
Thread-Topic: Add driver MAX31725/6 to linux kernel 4.19 
Thread-Index: AdTKjBaMNowG6gfeQf6yf8IfQoND0A==
Date: Fri, 22 Feb 2019 09:13:41 +0000
Message-ID: <31b8f5a5c7bb46f69a15ad91cdd450d2@quantatw.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24446.003
x-tm-as-result: No--5.330600-0.000000-31
x-tm-as-matchedid: 150588-701625-704425-700685-708060-700648-703523-704421-7
 00107-863519-700562-780013-148004-148133-10007-41000-42000-42003-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 22 Feb 2019 09:25:12 -0000

SGksIA0KCVRoZSBkcml2ZXIgTUFYMzE3MjUvNiBpcyBhZGRlZCB0byB0aGUgbGludXgga2VybmVs
IDQuMjAgYnV0IEkgd2FudCB0byBhZGQgZHJpdmVyIE1BWDMxNzI1LzYgdG8gbGludXgga2VybmVs
IDQuMTksIGhvdyBjYW4gSSBkbyA/DQoNClRoYW5rcy4NCkJlc3QgcmVnYXJkcywNCkR1a2UsIER1
DQpRdWFudGEgQ29tcHV0ZXIgSW5jLg0KVGVsOiArODg2LTMtMzI3MjM0NSBFeHQ6IDE4MDQ3DQpF
LU1haWw6IER1a2UuRHVAcXVhbnRhdHcuY29tDQoNCg==
