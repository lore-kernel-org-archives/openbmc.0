Return-Path: <sachnaik@cisco.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=cisco.com
 (client-ip=173.37.86.80; helo=rcdn-iport-9.cisco.com;
 envelope-from=sachnaik@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.b="kMYsDzwz"; 
 dkim-atps=neutral
X-Greylist: delayed 648 seconds by postgrey-1.36 at bilbo;
 Thu, 15 Feb 2018 05:54:23 AEDT
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 (using TLSv1.2 with cipher DHE-RSA-SEED-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhT8v5zT3zF1JT
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 05:54:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=280; q=dns/txt; s=iport;
 t=1518634464; x=1519844064;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XxCr8V8G35c25dHi6K8UEhfjaNu9jMWWJhlZyMDJooE=;
 b=kMYsDzwzIm/2LQXXjizteMCjHFcUU3E5NehMw8JHtLFIZ4CnaEKmgiIn
 A3gJ0GuMbWcxge+oZC4YX2IBCol/qZA1eNxbsQo1mosJWl0+P1E2zZZUj
 WyPyASxIzGVSMcRL9iq9JdUi2f6CRV53QVAxKzZ2muc5FNVyNXRzLA7nx g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0A9AwAUgoRa/5pdJa1dGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQcBAQEBAYNSgVYoCoNbmCiBW4E+lkKBOQNcCoU7AhqCY1YWAQIBAQE?=
 =?us-ascii?q?BAQECayiFJAYjEUUQAgEIGgImAgICMBUQAgQBDQWKNa9kgieFAYQAghMBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBAQEBAQEBAQEdgQ+Dc4IVgVeCEQyCeYUigxcxgjQFmieKCAk?=
 =?us-ascii?q?ClgOCBgGSPpdsAhEZAYE7ASYKKDKBHnAVZwGCG4R3eIxNgRkBAQE?=
X-IronPort-AV: E=Sophos;i="5.46,513,1511827200"; d="scan'208";a="349090659"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
 by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2018 18:43:29 +0000
Received: from XCH-RTP-016.cisco.com (xch-rtp-016.cisco.com [64.101.220.156])
 by rcdn-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id w1EIhST2021242
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Wed, 14 Feb 2018 18:43:28 GMT
Received: from xch-rtp-019.cisco.com (64.101.220.159) by XCH-RTP-016.cisco.com
 (64.101.220.156) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
 Wed, 14 Feb 2018 13:43:27 -0500
Received: from xch-rtp-019.cisco.com ([64.101.220.159]) by
 XCH-RTP-019.cisco.com ([64.101.220.159]) with mapi id 15.00.1320.000; Wed, 14
 Feb 2018 13:43:27 -0500
From: "Sachin Naik (sachnaik)" <sachnaik@cisco.com>
To: Patrick Venture <venture@google.com>, Lei YU <mine260309@gmail.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Porting hwmon sensors to openBMC
Thread-Topic: Porting hwmon sensors to openBMC
Thread-Index: AQHTlBxuKmJ99FNq7kGo+Rq4yMaexqOkXVHT///PkoA=
Date: Wed, 14 Feb 2018 18:43:27 +0000
Message-ID: <B969E7AE-CB86-4567-A022-AEA3A7265CA0@cisco.com>
References: <32335E8B-FAAF-4B96-9B2E-57FF1FAFDD1A@cisco.com>
 <CAARXrt=r8C5WvWKb33C4LDuJi9KW61aHp0G3+a3RzF7ArKe+Tg@mail.gmail.com>
 <CAO=notwMecK=GhvVUtgeVUZFV38K71Q5SSF0TeCS0CxY2W+axw@mail.gmail.com>
In-Reply-To: <CAO=notwMecK=GhvVUtgeVUZFV38K71Q5SSF0TeCS0CxY2W+axw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/f.1f.0.170216
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.154.162.14]
Content-Type: text/plain; charset="utf-8"
Content-ID: <06AAC741A4CBDF4CB64D744CED0578A4@emea.cisco.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 16 Feb 2018 12:14:16 +1100
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
X-List-Received-Date: Wed, 14 Feb 2018 18:54:25 -0000

VGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24uDQoNCg0KT24gMi8xNC8xOCwgMTA6MzYgQU0sICJQ
YXRyaWNrIFZlbnR1cmUiIDx2ZW50dXJlQGdvb2dsZS5jb20+IHdyb3RlOg0KDQogICAgQWZ0ZXIg
eW91IGFkZGVkIGNvbmZpZyBmaWxlcyBmb3IgdGhlIHRlbXBlcmF0dXJlIHNlbnNvcnMgd2l0aA0K
ICAgIHBob3NwaG9yLWh3bW9uJS5iYmFwcGVuZA0KDQo=
