Return-Path: <openbmc+bounces-2331-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E486BC54FD2
	for <openbmc@archiver.kernel.org>; Thu, 30 Jul 2026 04:53:33 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h9cKK73jMz2yMn;
	Thu, 30 Jul 2026 14:53:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785375166;
	cv=pass; b=CQ3wxewJwDq9WwqMjnYupSdD8WuDXGn3j31ufWnkSoc3MOf6k448HpygukRlJwYxj1bhJQUAMTB4yo/IeiF1E1hMrN+560lc6CTSztGLDgzXcxQ+ZE5Xy7gnjuj60bL4o64s/xrqvHNZwlDSiMSouXIYfgVSL6xoK9LZ+lNSg8tcXZZKFleiVyEzA7XX/N5RpzxcSZ5r6Vmri5Ic7nrfztyp0JIx9mYcMua3sMKRGm6NqRWfRfIWf2G3zDoZ6FOHsiymdLedNgatX7l39l56PIKT34I+8iHDcmJxeQdQi5q8T4ZtGxY7L6tp8Mp+2QBeSlogaNtISLkFVtqlvl4gmw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785375166; c=relaxed/relaxed;
	bh=2PAgFYBvCMI7+NQu9nV3L7gKT9MdU7C85ko47yZ7xUE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JS5F4ih7481GgAk/EMp2gtyZb+a0zeXPHcGDSJpXrMY2dPjYG/1B3X8d02WsCQzYIRUlUAxLnfY4HS2W+dBw0QleJjoGCeO2/td5mqSkqXaSsvQit9SShhb2vVxzt3bGi4m+6CxzQbVwdmLovz51x1lto17gmHtw+cI2X8HpaTUjPOFnDauk7MqNL8MWzOGixkzoOfgZZB7aPT8Ukukfwgm/cyYM8wxverjVdTkpF6+xEoHol/RAERyXpJvO8aZkEukl/X2PvCnyMNngF7ZjGvEsk1iwx7CtucKCoNo4aBwIE2H/ASaphMV7S1+rW87nTvd+RIjv2gPOqz/1LfK3CQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; dkim=pass (2048-bit key; unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256 header.s=selector1 header.b=pexZrsx4; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=kflin@nuvoton.com; receiver=lists.ozlabs.org) smtp.mailfrom=nuvoton.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256 header.s=selector1 header.b=pexZrsx4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nuvoton.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=kflin@nuvoton.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h9Wsm0Hbsz2yDs
	for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2026 11:32:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qeXqqoKCvOaxCaXwXzWJ4G3SBDiU5grPidoIE+Hs+16ZtT2aJX9CRytIYJG5KG624heWUDipFATtdS9WA8gud3PB7Ox8ImVP/s07IJYB5hcfzbn2kRm+IXBM1Ky8NTqGfeYc/0jnm/vrZBif7KWOcNi+LaeaARoU7NQfYsAaULhuCXbqqlk/xRM9XF9zT13Yxwq7T4nPXP7Mtz7YbCU0hji6XY6KnSf8xDvPajxnnt3NRNrUpxYW5SRsosno+UsCc5triG7zOga4wokl/l88qPhAMNzHKsdjItzPZMidObLlSo67Uu66Eg28xqgwOrZdwDeLjSXBEktiNRxFFoC6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PAgFYBvCMI7+NQu9nV3L7gKT9MdU7C85ko47yZ7xUE=;
 b=yUEDOt1N8u19dvgkc+4HCWlCwnpYLHjkd9BTH3pTfbCqhfjWe8YDVRwNspO0qUShKpHZcNttxEKHqyAdYzXHevPIlyO4oEa5INvLSY6BmVphA5b9NtUgS7CuscHrOTCU4zfs/5RHzX9riqBAXcnd8uCygeYRHcalwxC97lAE9Hei7swON+HIfHSgBpytc049qvbqPr5Q2387NUSAtyAphJzGxtSzV5YFi+AbpH7OtOnTLZi0wzBRvlCc96sOskXkgAnlGJG50G7WQ6pbloxAolyIBsSPmlf9U75o8CDMND06dzhNNWRlWmN3Q9AJ1uzk8yleMkDi6vfCTyBF7lTzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PAgFYBvCMI7+NQu9nV3L7gKT9MdU7C85ko47yZ7xUE=;
 b=pexZrsx4AScpHJqOSnev5LpiNfBbT/+yzw89VFWVDz7mUiC+HlS7eR4bBW/H8hpEFnNK+nrOEEA8SX+l5YZUhr9yZP83AWzsFUYwTTOJZHF6dLNNOXMZqSj8YuSHJ8WygqAlpPy0tNgp+/8irhR72NQsgCkjqdoqYXHDA2p4tPLcRA9NtmqKg1ZwQwA6ECtvJrPjnbXLXALJIhEY8/KGDm4AJzEUn6SjyrnbQhpEblZt4KYxCt5jHfMWehAisUcPPHQIV853l8OlBosOvZquOm4sZ++GQy6ezzUivMq47fUBQBxFISDFg3D/oINROcD4++W7ro3MXBc8ZCkzUFCEHA==
Received: from SE2PPFDCEB9F38F.apcprd03.prod.outlook.com
 (2603:1096:108:1::4ab) by SEZPR03MB7146.apcprd03.prod.outlook.com
 (2603:1096:101:ee::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 01:32:20 +0000
Received: from SE2PPFDCEB9F38F.apcprd03.prod.outlook.com
 ([fe80::d21b:5ec3:6074:9b97]) by SE2PPFDCEB9F38F.apcprd03.prod.outlook.com
 ([fe80::d21b:5ec3:6074:9b97%3]) with mapi id 15.21.0245.012; Thu, 30 Jul 2026
 01:32:20 +0000
From: "KFLIN@nuvoton.com" <KFLIN@nuvoton.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>
CC: "hverkuil@kernel.org" <hverkuil@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, "KWLIU@nuvoton.com" <KWLIU@nuvoton.com>
Subject: RE: [PATCH v2] media: nuvoton: npcm-video: quiesce VCD IRQ before
 teardown
Thread-Topic: [PATCH v2] media: nuvoton: npcm-video: quiesce VCD IRQ before
 teardown
Thread-Index: AQHdFQw5TridVPSB50uzQLwKZ3wBv7aC6nCAgAJxiZA=
Date: Thu, 30 Jul 2026 01:32:20 +0000
Message-ID:
 <SE2PPFDCEB9F38F4F7367238FF9188F67ECA4C92@SE2PPFDCEB9F38F.apcprd03.prod.outlook.com>
References: <04a332fc-2025-4a74-ae4d-1d8f30fe20bf@kernel.org>
 <20260716101539.3129478-1-fanwu01@zju.edu.cn>
 <efb34ca7-27bf-413e-85b2-e7bb6b80cf2c@kernel.org>
In-Reply-To: <efb34ca7-27bf-413e-85b2-e7bb6b80cf2c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE2PPFDCEB9F38F:EE_|SEZPR03MB7146:EE_
x-ms-office365-filtering-correlation-id: 4fe3cd8c-70b0-473d-d267-08deedda65df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 oqWHpOxcS9IdYX4rTkLHpgVe40Y7w7cYFKKfOprd8Epebdlp2L2DpDrQzlH0Hktc4TOyrlU8Rxdb24QG3K17bSfm+wVwDa9c81XE4uswHnTnagr93K4O9ziZrb1bvMtAmOptLYOZxP2bOEeS1ctU5n98h7Z+k7hBXOFokC4XZCKr+4j26mdJSYDvOFynFhDqlqKjK9hwR1HMGu5Xpo4He9MjpbTQsjTCg/R9uQKEMnJBnTRQ1xKvY6wbqYky/RAlmlvckXJaTfEUAQB5HPjvecOT1CR3MFF+ABr5+n3gkSQ7yTZxmCUR52VQi9m0Bgj7byOQqmIFbIqj3jI62ksz+zollECQulxprX6JLhNOvnkmoHurkclIvPVCLS3ju6XYjhKDXk/2TDpUSMnzogSvFDngJylYHkShxu4J/13DfJaGSdmZpdQvbLprboYLfELfNR4nSymc2oHh9Lib/0MJzTppw8hXIEhcCUvWZJJtN7cNPkqA70oyluz10agz0Dg6MxDNMWaBXMPlHgolIs/Y7FSxGHssPxlyZWRdWJHmucA2qo2MxvWSPqb1LfHKpraE3vfbbLUHsFQhN7CMyB+p5K2q6lKV7/lQJK7k8wYZ+3yOTpWrGKNxssFcDJlzODd5BAF54akX7xwZ7pd1oaPgesghLqAqv3C8Tf0fnZoBbHJ+QLRFKQiqEXTsxkwSZiZCT34RVvWDl6/dGUNEBj8SpnXAzcsl0M5JuKbi7UiVgDQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2PPFDCEB9F38F.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a0hsTE5NVnRXclR0SnpzVWRjQnBuOWpPMTdzdkorK3htd0ZPb0RLemR2YkNn?=
 =?utf-8?B?UXNTNngvVXE0UWlhVmxySEs4eHJmKzVkY3pYY2thWmZnNFNKZkRrbmFhaEdU?=
 =?utf-8?B?ZTBEZE1vT3V5TUtlc3hQSTV1RXdscWd5MUFIS2luQ1FRUkh5YmsxVHNJYVJy?=
 =?utf-8?B?Y1l5RTNLV1J4YnJYb2ZNSnpQbnU0bVh4RDJsOUFvODE5aEh0SzBqQXRwVEdS?=
 =?utf-8?B?WHNHZlcrajY3T3lUcXBrd2xnMndudGlaTzZ1aGZnZjZ6Z3V2d0dLclo4em5x?=
 =?utf-8?B?Y2lyc1RqMXR4WmJGb1hkR056RlNYNE53YUhGejF2RHRtRGxDTlNyY1J1K3ZO?=
 =?utf-8?B?Y1JPOHJPd3lYbGllTEt1UUFvTHUrWHVsS0pjc1EvdHQ4Wm1od1JscTdOTnhP?=
 =?utf-8?B?aWh5M29GSUFoQXJuTkFQMGp2R2NEWTZCNVZpRFFTK0NQVGRlM0w1YTZiZmsw?=
 =?utf-8?B?N3h6QnlEL01MbFgwWTVuZlM3emJPcGNBelJ1b3FTc3pGVUw5SE8wdVBwcVRy?=
 =?utf-8?B?dk1rYVhlU0l5djNJS0QvcncvQk1hemlJTG5Pd1R1MzJFcTB5OG9WWDNCN1Z4?=
 =?utf-8?B?ZElMSzQreDdHYTJnK2FRQnlORk1sU3pUSjI1Q1QzT2xORWtvY2ExL2F2ai9t?=
 =?utf-8?B?bWVlSjViSzBhMktTUEp0bEhia3d3WWdvTWV2N1ZmbDVCdDhwaTJQRE5hdGtM?=
 =?utf-8?B?Zkx3ekV1VGdIM0pBSVZFZk9QWm42Z3M3cEY1K1h6VGZ6Z1J0NUdxUFNkSTVX?=
 =?utf-8?B?V01abW1jaWZyYWJ5eTlVZFJPL0FtblJVaVN3VkRSaWpKckFWU1VzaHIxZVcy?=
 =?utf-8?B?NnpiUHlvTW1CWEN5NGF3UVk1ZCs1c3pPNnh0NmduMmxlNElxczFmTUo3VnJZ?=
 =?utf-8?B?aXI0VkxDUU5XQVVWNXo3NXQwMWJBenhUZ0FtOGk4UUZZeHR1TGpLZ3JyK3pz?=
 =?utf-8?B?SXFEajAvZk1GY1c0ZndWR1drQmhTd2ZpZmhiOVNWdm5mYXdjWW93RmN2VnBr?=
 =?utf-8?B?dXFXN0M3VnZJUzEySVVXdG1Yekc1cTlJNG5BdVJzSlZuc3c4V2ZMNHpkQVFl?=
 =?utf-8?B?ZXNVcy9hRzJINnlYMmV0aGhnejJoT281NTJ0RXVHS2xtRE1QNldCcEx6OTZ6?=
 =?utf-8?B?V0h4U016Sms1UG1HYWhQZ0YydU90L1VNZlhtMXdYU0tSV1hlQzU0RHRHTFhk?=
 =?utf-8?B?ZWJYclRZdldmWWxnNEhtMVovZURVcFd5a1lsandpS3R3UnpSRnp2cWVhZ3Fp?=
 =?utf-8?B?ZGFJZjA4bGQveXcyMmxOQWFiem1oT0lqUE1PNjRYRW5MdmpJazRDdGl3aDlQ?=
 =?utf-8?B?ZWltTDBydlA2N0ZCL2haNGQxY2tVRUtaOUZkNmIzclQwbG5JVkNCYWVYMHBj?=
 =?utf-8?B?dGJJNkRvOVp1R054TStIektrcGplbklHQVVyNkN6Vi8rWC8rbWRWVmltVHZl?=
 =?utf-8?B?UTNRRWI5NTBaMUh2UzB0REtuSjJuQ0dkN0VtYlFtMmJQQmdwczZoWGNLWjlr?=
 =?utf-8?B?b1lrc3NjazI3K3BIVGNmVVVtdEgrSzBSRGhBL3lGMmtuS1ZnajNyZUUxdEJi?=
 =?utf-8?B?clBBUkpwcU05VkY1RnYrOEtGSHRkaDFBV0Z1akdLQURMVTJVcEpUYXRCN25Y?=
 =?utf-8?B?LzE4dnRhcHZjWGhLMHZlK0t4bjNrZjFtT1B0SG1uUzVweXI1UUhSMTFHemdz?=
 =?utf-8?B?VEdnQi9hZlFrTkNESGltWE9RQmlNbE9HQXRPYStmU2VxTmJSNnZqK1pDUk9i?=
 =?utf-8?B?WjdqYmJ1VTdDRkJ3eTA1STRqaVR3YncrNHJ1eU9TN05pdFFrN0t1ZndYQlRT?=
 =?utf-8?B?TlMydkdyUHhSSnZDVm5zY3dySTg3TmUwQjB5L0xRaEhmSDF6bEhCSXQxTHpk?=
 =?utf-8?B?RFpUTmVTTEVrcjEydU1Tdi8xOVN1S29pb3JucTF2NHQrUHF0QjVmU1hnRG9v?=
 =?utf-8?B?L21wRVAvMWFYUEdEcTl5czVKZHRrM3JGWURCTjZQTmJoQWhVVHJBbEt6SWlH?=
 =?utf-8?B?UnpCcm1qSEhpL0NFNVdIRWw2UzlUd25Ja3h0dGdscUhQakY0SnYwN29ETUd0?=
 =?utf-8?B?MTZrdVdacVZkWXkxTzdMWmFqUUsxM1lZdW0vTDlEakNPUkNBaVRCUVlGSXZD?=
 =?utf-8?B?emN2YW85WHU0ZXQ0bjhoSFlteUtaZTVpa3RXZWVUb3QrVGdvNHlrL1N1UWxS?=
 =?utf-8?B?LzNNWVFmN1lKZ2dMLzV1NkVBaVRLZEZxNVpBRmw5ZzlFUllRd0JBekhsSnlK?=
 =?utf-8?B?TnN0WG05ZUV1YUFtdWpnNTk1WkpXVHBFSmhVeHdIejR5d1M2MFlhQzI2OFBm?=
 =?utf-8?Q?EYUcEOm62aglLyFmRg?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE2PPFDCEB9F38F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe3cd8c-70b0-473d-d267-08deedda65df
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 01:32:20.0965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3opz7STtuyyX++9RyNcXxfErpmMC58LdbFwwgbXO59E4jQuiFlHAmqTDfYD4VVAdBcutmkG6O9aB8Z4iymrj2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7146

SGkgSGFucywgRmFuLA0KDQpJJ3ZlIHRlc3RlZCB0aGlzIHBhdGNoIG9uIG91ciBwbGF0Zm9ybSBh
bmQgZGlkIG5vdCBvYnNlcnZlIGFueSBpc3N1ZXMuDQpUaGFua3MgZm9yIHRoZSBwYXRjaC4NCg0K
VGVzdGVkLWJ5OiBNYXJ2aW4gTGluIDxrZmxpbkBudXZvdG9uLmNvbT4NCg0KUmVnYXJkcywNCk1h
cnZpbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEhhbnMgVmVya3Vp
bCA8aHZlcmt1aWwrY2lzY29Aa2VybmVsLm9yZz4NCj4gU2VudDogVHVlc2RheSwgSnVseSAyOCwg
MjAyNiA4OjEyIFBNDQo+IFRvOiBGYW4gV3UgPGZhbnd1MDFAemp1LmVkdS5jbj47IENTMjAgS1dM
aXUgPEtXTElVQG51dm90b24uY29tPjsNCj4gQ1MyMCBLRkxpbiA8S0ZMSU5AbnV2b3Rvbi5jb20+
DQo+IENjOiBodmVya3VpbEBrZXJuZWwub3JnOyBtY2hlaGFiQGtlcm5lbC5vcmc7IGxpbnV4LW1l
ZGlhQHZnZXIua2VybmVsLm9yZzsNCj4gb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjJdIG1lZGlhOiBudXZvdG9uOiBucGNtLXZpZGVvOiBxdWllc2NlIFZD
RCBJUlEgYmVmb3JlDQo+IHRlYXJkb3duDQo+DQo+IENBVVRJT04gLSBFeHRlcm5hbCBFbWFpbDog
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdQ0KPiBhY2tu
b3dsZWRnZSB0aGUgc2VuZGVyIGFuZCBjb250ZW50Lg0KPg0KPg0KPiBDYW4gTnV2b3RvbiB0ZXN0
IHRoaXMgcGF0Y2g/IEkgZmVlbCBoYXBwaWVyIGlmIHRoaXMgaXMgZ2l2ZW4gYSBxdWljayB0ZXN0
Lg0KPg0KPiBSZWdhcmRzLA0KPg0KPiAgICAgICAgIEhhbnMNCj4NCj4gT24gMTYvMDcvMjAyNiAx
MjoxNSwgRmFuIFd1IHdyb3RlOg0KPiA+IFRoZSBWQ0QgSVJRIGlzIGRldm0tcmVxdWVzdGVkLCBi
dXQgbnBjbV92aWRlb19yZW1vdmUoKSBmcmVlcyB0aGUgdmlkZW8NCj4gPiBvYmplY3QgYmVmb3Jl
IGRldnJlcyByZWxlYXNlcyB0aGF0IElSUS4gIFRoZSB0aHJlYWRlZCBoYW5kbGVyDQo+ID4gZGVy
ZWZlcmVuY2VzDQo+ID4gdmlkZW8tPnZjZF9yZWdtYXAgYmVmb3JlIGNoZWNraW5nIFZJREVPX1NU
UkVBTUlORywgc28gYW4gaW50ZXJydXB0IGluDQo+ID4gdmlkZW8tPnRoYXQNCj4gPiBpbnRlcnZh
bCBjYW4gYWNjZXNzIGZyZWVkIG1lbW9yeS4NCj4gPg0KPiA+IFJlcXVlc3QgdGhlIElSUSB3aXRo
IElSUUZfTk9fQVVUT0VOLiAgRW5hYmxlIGl0IGFmdGVyIHN0YXJ0aW5nIGNhcHR1cmUNCj4gPiBh
bmQgc2V0dGluZyBWSURFT19TVFJFQU1JTkcsIGFuZCBkaXNhYmxlIGl0IGZpcnN0IGluIHN0b3Bf
c3RyZWFtaW5nKCkuDQo+ID4gZGlzYWJsZV9pcnEoKSB3YWl0cyBmb3IgYW4gaW4tZmxpZ2h0IHRo
cmVhZGVkIGhhbmRsZXIgdG8gZmluaXNoLCBhZnRlcg0KPiA+IHdoaWNoIHN0b3Bfc3RyZWFtaW5n
KCkgY2FuIG1hc2sgYW5kIHJlc2V0IHRoZSBWQ0Qgd2l0aG91dCBhIGhhbmRsZXINCj4gPiByZS1l
bmFibGluZyBpdC4NCj4gPg0KPiA+IFVzZSB2YjJfdmlkZW9fdW5yZWdpc3Rlcl9kZXZpY2UoKSBk
dXJpbmcgcmVtb3ZlLiAgSXQgcmVsZWFzZXMgdGhlIHZiMg0KPiA+IHF1ZXVlIGFuZCBjYWxscyBz
dG9wX3N0cmVhbWluZygpIGZvciBhbiBhY3RpdmUgc3RyZWFtLCBlbnN1cmluZyB0aGF0DQo+ID4g
dGhlIElSUSBpcyBkaXNhYmxlZCBiZWZvcmUgdGhlIHZpZGVvIG9iamVjdCBpcyBmcmVlZC4gIERv
IG5vdCByZWxlYXNlDQo+ID4gdGhlIHF1ZXVlIHNlcGFyYXRlbHkuDQo+ID4NCj4gPiBJZiBzdHJl
YW1pbmcgaXMgbmV2ZXIgc3RhcnRlZCwgSVJRRl9OT19BVVRPRU4ga2VlcHMgdGhlIElSUSBkaXNh
YmxlZA0KPiA+IHVudGlsIGRldnJlcyByZWxlYXNlcyBpdC4NCj4gPg0KPiA+IFRoaXMgaXNzdWUg
d2FzIGZvdW5kIGJ5IGFuIGluLWhvdXNlIHN0YXRpYyBhbmFseXNpcyB0b29sLg0KPiA+DQo+ID4g
Rml4ZXM6IDQ2YzE1YTRmZjFmNCAoIm1lZGlhOiBudXZvdG9uOiBBZGQgZHJpdmVyIGZvciBOUENN
IHZpZGVvDQo+ID4gY2FwdHVyZSBhbmQgZW5jb2RpbmcgZW5naW5lIikNCj4gPiBDYzogc3RhYmxl
QHZnZXIua2VybmVsLm9yZw0KPiA+IEFzc2lzdGVkLWJ5OiBDb2RleDpncHQtNS42DQo+ID4gU2ln
bmVkLW9mZi1ieTogRmFuIFd1IDxmYW53dTAxQHpqdS5lZHUuY24+DQo+ID4gLS0tDQo+ID4gQ2hh
bmdlcyBzaW5jZSB2MToNCj4gPiAtIEZvbGxvdyBIYW5zIFZlcmt1aWwncyBzdWdnZXN0aW9uIHRv
IHRpZSBJUlEgZW5hYmxlbWVudCB0byB0aGUgc3RyZWFtaW5nDQo+ID4gICBsaWZlY3ljbGUgKElS
UUZfTk9fQVVUT0VOICsgZW5hYmxlX2lycS9kaXNhYmxlX2lycSkgYW5kIHRvIHVzZQ0KPiA+ICAg
dmIyX3ZpZGVvX3VucmVnaXN0ZXJfZGV2aWNlKCkgZm9yIHRlYXJkb3duLg0KPiA+DQo+ID4gQ29t
cGlsZS10ZXN0ZWQgb25seTsgSSBkbyBub3QgaGF2ZSBOUENNIGhhcmR3YXJlLCBzbyBydW50aW1l
IHRlc3RpbmcNCj4gPiBieSB0aGUgTnV2b3RvbiBtYWludGFpbmVycyB3b3VsZCBiZSBhcHByZWNp
YXRlZC4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9udXZvdG9uL25wY20t
dmlkZW8uYyB8IDkgKysrKysrLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9udXZvdG9uL25wY20tdmlkZW8uYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9udXZvdG9uL25wY20tdmlkZW8uYw0KPiA+IGluZGV4IDUyNTA1YWYzNWMwOC4uYzI4ZDlkN2Vk
ZDgzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnV2b3Rvbi9ucGNt
LXZpZGVvLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL251dm90b24vbnBjbS12
aWRlby5jDQo+ID4gQEAgLTEyMCw2ICsxMjAsNyBAQCBzdHJ1Y3QgbnBjbV92aWRlbyB7DQo+ID4N
Cj4gPiAgICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGJ1ZmZlcnM7DQo+ID4gICAgICAgc3RydWN0IG11
dGV4IGJ1ZmZlcl9sb2NrOyAvKiBidWZmZXIgbGlzdCBsb2NrICovDQo+ID4gKyAgICAgaW50IGly
cTsNCj4gPiAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+ICAgICAgIHVuc2lnbmVkIGlu
dCBzZXF1ZW5jZTsNCj4gPg0KPiA+IEBAIC0xNDg2LDYgKzE0ODcsNyBAQCBzdGF0aWMgaW50IG5w
Y21fdmlkZW9fc3RhcnRfc3RyZWFtaW5nKHN0cnVjdA0KPiB2YjJfcXVldWUgKnEsIHVuc2lnbmVk
IGludCBjb3VudCkNCj4gPiAgICAgICB9DQo+ID4NCj4gPiAgICAgICBzZXRfYml0KFZJREVPX1NU
UkVBTUlORywgJnZpZGVvLT5mbGFncyk7DQo+ID4gKyAgICAgZW5hYmxlX2lycSh2aWRlby0+aXJx
KTsNCj4gPiAgICAgICByZXR1cm4gMDsNCj4gPiAgfQ0KPiA+DQo+ID4gQEAgLTE0OTQsNiArMTQ5
Niw3IEBAIHN0YXRpYyB2b2lkIG5wY21fdmlkZW9fc3RvcF9zdHJlYW1pbmcoc3RydWN0DQo+IHZi
Ml9xdWV1ZSAqcSkNCj4gPiAgICAgICBzdHJ1Y3QgbnBjbV92aWRlbyAqdmlkZW8gPSB2YjJfZ2V0
X2Rydl9wcml2KHEpOw0KPiA+ICAgICAgIHN0cnVjdCByZWdtYXAgKnZjZCA9IHZpZGVvLT52Y2Rf
cmVnbWFwOw0KPiA+DQo+ID4gKyAgICAgZGlzYWJsZV9pcnEodmlkZW8tPmlycSk7DQo+ID4gICAg
ICAgY2xlYXJfYml0KFZJREVPX1NUUkVBTUlORywgJnZpZGVvLT5mbGFncyk7DQo+ID4gICAgICAg
cmVnbWFwX3dyaXRlKHZjZCwgVkNEX0lOVEUsIDApOw0KPiA+ICAgICAgIHJlZ21hcF93cml0ZSh2
Y2QsIFZDRF9TVEFULCBWQ0RfU1RBVF9DTEVBUik7IEBAIC0xNzA3LDkgKzE3MTAsMTANCj4gPiBA
QCBzdGF0aWMgaW50IG5wY21fdmlkZW9faW5pdChzdHJ1Y3QgbnBjbV92aWRlbyAqdmlkZW8pDQo+
ID4gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBmaW5kIFZDRCBJUlFcbiIp
Ow0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+ID4gICAgICAgfQ0KPiA+ICsg
ICAgIHZpZGVvLT5pcnEgPSBpcnE7DQo+ID4NCj4gPiAgICAgICByYyA9IGRldm1fcmVxdWVzdF90
aHJlYWRlZF9pcnEoZGV2LCBpcnEsIE5VTEwsIG5wY21fdmlkZW9faXJxLA0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJUlFGX09ORVNIT1QsIERFVklDRV9OQU1FLCB2
aWRlbyk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElSUUZfT05F
U0hPVCB8IElSUUZfTk9fQVVUT0VOLA0KPiA+ICsgREVWSUNFX05BTUUsIHZpZGVvKTsNCj4gPiAg
ICAgICBpZiAocmMgPCAwKSB7DQo+ID4gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxl
ZCB0byByZXF1ZXN0IElSUSAlZFxuIiwgaXJxKTsNCj4gPiAgICAgICAgICAgICAgIHJldHVybiBy
YzsNCj4gPiBAQCAtMTgwNyw4ICsxODExLDcgQEAgc3RhdGljIHZvaWQgbnBjbV92aWRlb19yZW1v
dmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICBzdHJ1Y3QgdjRs
Ml9kZXZpY2UgKnY0bDJfZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gICAgICAgc3Ry
dWN0IG5wY21fdmlkZW8gKnZpZGVvID0gdG9fbnBjbV92aWRlbyh2NGwyX2Rldik7DQo+ID4NCj4g
PiAtICAgICB2aWRlb191bnJlZ2lzdGVyX2RldmljZSgmdmlkZW8tPnZkZXYpOw0KPiA+IC0gICAg
IHZiMl9xdWV1ZV9yZWxlYXNlKCZ2aWRlby0+cXVldWUpOw0KPiA+ICsgICAgIHZiMl92aWRlb191
bnJlZ2lzdGVyX2RldmljZSgmdmlkZW8tPnZkZXYpOw0KPiA+ICAgICAgIHY0bDJfY3RybF9oYW5k
bGVyX2ZyZWUoJnZpZGVvLT5jdHJsX2hhbmRsZXIpOw0KPiA+ICAgICAgIHY0bDJfZGV2aWNlX3Vu
cmVnaXN0ZXIodjRsMl9kZXYpOw0KPiA+ICAgICAgIGlmICh2aWRlby0+ZWNlLmVuYWJsZSkNCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQogVGhlIHByaXZpbGVnZWQgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGNvbnRh
aW5lZCBpbiB0aGlzIGVtYWlsIGlzIGludGVuZGVkIGZvciB1c2Ugb25seSBieSB0aGUgYWRkcmVz
c2VlcyBhcyBpbmRpY2F0ZWQgYnkgdGhlIG9yaWdpbmFsIHNlbmRlciBvZiB0aGlzIGVtYWlsLiBJ
ZiB5b3UgYXJlIG5vdCB0aGUgYWRkcmVzc2VlIGluZGljYXRlZCBpbiB0aGlzIGVtYWlsIG9yIGFy
ZSBub3QgcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJ5IG9mIHRoZSBlbWFpbCB0byBzdWNoIGEgcGVy
c29uLCBwbGVhc2Uga2luZGx5IHJlcGx5IHRvIHRoZSBzZW5kZXIgaW5kaWNhdGluZyB0aGlzIGZh
Y3QgYW5kIGRlbGV0ZSBhbGwgY29waWVzIG9mIGl0IGZyb20geW91ciBjb21wdXRlciBhbmQgbmV0
d29yayBzZXJ2ZXIgaW1tZWRpYXRlbHkuIFlvdXIgY29vcGVyYXRpb24gaXMgaGlnaGx5IGFwcHJl
Y2lhdGVkLiBJdCBpcyBhZHZpc2VkIHRoYXQgYW55IHVuYXV0aG9yaXplZCB1c2Ugb2YgY29uZmlk
ZW50aWFsIGluZm9ybWF0aW9uIG9mIE51dm90b24gaXMgc3RyaWN0bHkgcHJvaGliaXRlZDsgYW5k
IGFueSBpbmZvcm1hdGlvbiBpbiB0aGlzIGVtYWlsIGlycmVsZXZhbnQgdG8gdGhlIG9mZmljaWFs
IGJ1c2luZXNzIG9mIE51dm90b24gc2hhbGwgYmUgZGVlbWVkIGFzIG5laXRoZXIgZ2l2ZW4gbm9y
IGVuZG9yc2VkIGJ5IE51dm90b24uDQo=

