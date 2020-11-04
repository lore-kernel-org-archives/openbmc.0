Return-Path: <SRS0=lSEV=EK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,
	CHARSET_FARAWAY_HEADER,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4169CC2D0A3
	for <openbmc@archiver.kernel.org>; Wed,  4 Nov 2020 07:11:32 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B7912224E
	for <openbmc@archiver.kernel.org>; Wed,  4 Nov 2020 07:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B7912224E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=quantatw.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQyW32mZhzDqYn
	for <openbmc@archiver.kernel.org>; Wed,  4 Nov 2020 18:11:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=570e719da=scron.chang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CQySv3FfyzDqFH
 for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2020 18:09:31 +1100 (AEDT)
IronPort-SDR: y9KLFcYZQsXfH1AbyZ/MIvQnlG66JcG+2mUTjLNUwhzD2HbkmEfEX39N4f0GLgFbyP8u3H6sQh
 teON34u/jSKg==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 04 Nov 2020 15:09:29 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 4 Nov 2020
 15:09:11 +0800
Received: from mailbx12.quanta.corp ([192.168.57.12]) by mailbx12.quanta.corp
 ([192.168.57.12]) with mapi id 15.01.2044.004;
 Wed, 4 Nov 2020 15:09:11 +0800
From: =?big5?B?U2Nyb24gQ2hhbmcgKLFppfKptSk=?= <Scron.Chang@quantatw.com>
To: "jamwang@google.com" <jamwang@google.com>, "edtanous@google.com"
 <edtanous@google.com>, "cheng.c.yang@linux.intel.com"
 <cheng.c.yang@linux.intel.com>
Subject: Question for psusensor.
Thread-Topic: Question for psusensor.
Thread-Index: Adaw/8PHvy/BwvbiSJK9DolAAznLMw==
Date: Wed, 4 Nov 2020 07:09:11 +0000
Message-ID: <ce9e26973b2349739e7b8f8d7eb77282@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

SGkgYWxsLA0KDQogIEkgZ290IGEgcHJvYmxlbSBpbiBjcmVhdGluZyBqc29uIGZpbGUgZm9yIFBT
VVNlbnNvci4gV291bGQgeW91IGdpdmUgbWUgc29tZSBzdWdnZXN0aW9ucyBmb3IgdGhhdD8NCg0K
ICBJdCBzZWVtcyBQU1VTZW5zb3Igb25seSBzdXBwb3J0IHRoZSBhYmlsaXR5IHRvIGN1c3RvbWl6
ZSB0aGUgc2NhbGluZyBmYWN0b3IgZm9yIGVhY2ggc2Vuc29yLiBIb3dldmVyLCBpbiBvdXIgc2l0
dWF0aW9uLCB3ZSB3YW50IHNvbWUgZmllbGRzLCBsaWtlICJnYWluIiBhbmQgIm9mZnNldCIsIGlu
IGpzb24gdG8gY2FsaWJyYXRlIHJlYWRpbmcgdmFsdWUuIEFuZCBJIG5vdGljZWQgdGhpcyBoYXMg
YmVlbiBkaXNjdXNzZWQgaW4gbGFzdCB5ZWFyIChodHRwczovL2xpc3RzLm96bGFicy5vcmcvcGlw
ZXJtYWlsL29wZW5ibWMvMjAxOS1PY3RvYmVyLzAxODcxOC5odG1sKS4NCg0KICBUaHVzLCBJIHdv
bmRlciB3aGV0aGVyIHRob3NlIGZpZWxkcyB3b3VsZCBiZSBpbXBsZW1lbnRlZCBpbiB0aGUgZnV0
dXJlID8NCg0KU2Nyb24gQ2hhbmcNCkUtTWFpbCAgU2Nyb24uQ2hhbmdAcXVhbnRhdHcuY29tDQpF
eHQuICAgIDExOTM2DQoNCg0K
