Return-Path: <luke_chen@aspeedtech.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=luke_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
X-Greylist: delayed 355 seconds by postgrey-1.36 at bilbo;
 Thu, 07 Feb 2019 16:12:38 AEDT
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43w5zV0dKJzDqPM
 for <openbmc@lists.ozlabs.org>; Thu,  7 Feb 2019 16:12:37 +1100 (AEDT)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id x1754mmq016257
 for <openbmc@lists.ozlabs.org>; Thu, 7 Feb 2019 13:04:48 +0800 (GMT-8)
 (envelope-from luke_chen@aspeedtech.com)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x1754UuO016238;
 Thu, 7 Feb 2019 13:04:30 +0800 (GMT-8)
 (envelope-from luke_chen@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 7 Feb
 2019 13:06:27 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.23) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 7 Feb
 2019 13:06:26 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Thu, 7 Feb 2019 13:06:25 +0800
From: Luke Chen <luke_chen@aspeedtech.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Ryan Chen
 <ryan_chen@aspeedtech.com>, ShivahShankar Shakarnarayan rao
 <shivahshankar.shankarnarayanrao@aspeedtech.com>, Yunlin Tang
 <yunlin.tang@aspeedtech.com>,
 Dwarka Partani <dwarka.partani@aspeedtech.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Secure boot for BMC
Thread-Topic: Secure boot for BMC
Thread-Index: AQHUvV0gbkcxDvYbP0ae7816CL86yaXTywVR
Date: Thu, 7 Feb 2019 05:06:24 +0000
Message-ID: <0A4E4AC6-458B-4D9B-81B7-18A013D7E27F@aspeedtech.com>
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
In-Reply-To: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x1754UuO016238
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
X-List-Received-Date: Thu, 07 Feb 2019 05:12:38 -0000

SGkgQnJhZA0KQVNQRUVEIHRlYW0gd2FudHMgdG8gam9pbiB0aGlzIGRldmVsb3BtZW50Lg0KDQpU
aGFua3MuDQoNCrFxp9qquiBpUGhvbmUgtsewZQ0KDQo+IEJyYWQgQmlzaG9wIDxicmFkbGV5YkBm
dXp6aWVzcXVpcnJlbC5jb20+IKnzIDIwMTmmfjKk6zWk6SAyMjoxNCC8Z7lEoUcNCj4gDQo+IEhp
IGV2ZXJ5b25lDQo+IA0KPiBEb2VzIGFueW9uZSBoYXZlIHBsYW5zIHRvIHByb3ZpZGUgYSBzZWN1
cmUgQk1DIGJvb3QgaW1wbGVtZW50YXRpb24gdG8NCj4gT3BlbkJNQyBpbiB0aGUgMi43IG9yIDIu
OCB0aW1lZnJhbWU/ICBKdXN0IHRyeWluZyB0byBnZXQgYSBmZWVsIGZvciB3aG8NCj4gYWxsIHdh
bnRzIHRvIGNvbGxhYm9yYXRlIG9uIHRoaXMgYmVmb3JlIEkgc3VibWl0IGEgZGVzaWduIHRlbXBs
YXRlLg0KPiANCj4gdGh4IC0gYnJhZA0K
