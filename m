Return-Path: <openbmc+bounces-2599-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B672C982C9
	for <openbmc@archiver.kernel.org>; Wed, 16 Sep 2026 22:59:46 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hlZ8T5lZ3z2yqd;
	Thu, 17 Sep 2026 08:59:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789519407;
	cv=pass; b=TijAJ9ercKhE5EVuR5ip6Xj9Z+038DsmrYz+CYlq2Mw14oa79fQp1CgLClHNCyR+Js5vvQtbS4G5EwUi0ukRssNbp9nqGu54Gxe8sNRBY+5jmJNiUD6nzn6nveMhj7kbnGt8GagUAqqIAH6Vynf7JUNTEpkVKyKzG2Lv8IwEPUobjZ+ErQdZHVtKZHAjhEdu6Xk1eeVjNEj3BOKKjwnp6vOKCIApTa0ZEcAkbKcmygon9vvbIqus+2SZFyrv2kf+ZKqDTgGJrNFi/UsEBiLaziEnUqMv8Gg6GvT4ILpSXUKXiiZujtiFeMADW1rGuN9GsxXD6TV3YMQGfvq07cLsqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789519407; c=relaxed/relaxed;
	bh=WbBPaVSg99SDyo6LqQB3hvVnv6nmvASlYIxqxaIn2f4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hmz4diKMpQPWUlKwwNUf//NzvOiKOxAqLvVUBLMYULyxG7k8XYtbUmTdhcvhFuV6/TxeXE2gX+JFUiUjomAT5RZnEvpr7/VyNfx8hvGec7jtFtbWF9feiXD/DDqcBUrcVCinRPvGC4q3pHGxKuivqZ+XUR3eLQVQGwknr71B9q3PRw6F8qh/Xoo8ZegbPeO4ON7CY6zxBPDgCSm1wMxn2oK682spj4/S1CVYkW/+7kK2kH6cTStW9V8OD7lB6CyrcWPOtJaYVvpCETUsAOJwArGkhj+7c/ahyuTauW0DAFlyBvGYfcxBksOAb9v9Y6uFWfvXIZ5IFY+0qI8xgLMmYg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quantatw.com; dkim=pass (2048-bit key; unprotected) header.d=quantatw.com header.i=@quantatw.com header.a=rsa-sha256 header.s=selector1 header.b=n/iLiMPe; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=kyle.hsieh@quantatw.com; receiver=lists.ozlabs.org) smtp.mailfrom=quantatw.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quantatw.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quantatw.com header.i=@quantatw.com header.a=rsa-sha256 header.s=selector1 header.b=n/iLiMPe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quantatw.com (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=kyle.hsieh@quantatw.com; receiver=lists.ozlabs.org)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hl0Vj72pmz2xkr
	for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2026 10:43:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiZfeAgAsIMcIMNhO7/7zKek18y/737xQPmqwYgkUwLukALTKJaLIOuZEIsE8sXLyFhVKnlfWSRwHjIg+VL6sY634evFNsLMkP0cSaoZ97SysPjrgL3tT3kcNqBxC9xjH9jZfDlJm5JDDKlSn3Qio7S9uhY+qEhNI31dGV08FmvWQPYWZvubM+dnx1huGXh8M+NVfG+PPkFQay0C6Zh1AbrZq2KqBhjaVtNtFwFHzeKhM8VOpXIZ6nUkeCYAT+t7d8jjeScXnLiJDfpdEgLJlOf4OljA2oExEZbkIdglm+X6XNePRFs/8N3oMYyCNnKIYnFEIFSDfEhWCabqoE2jKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbBPaVSg99SDyo6LqQB3hvVnv6nmvASlYIxqxaIn2f4=;
 b=cdXvqImnvwYO/5+LxF4dfkrr0Y3Wu5nBTlq+66wZUtzfvWBvOgk/AK/cQVB/6YxEmy7GRtWvL4mrbj7/IC5yJQxjlowbNheJsBZjIialSqz9gMfhRMIAHyY6QGhaEHdFb+IMHgy2UN7U23J2JfRTqh3kyEA/yZl0nrwOgsWo5HpPjPy9aUDZWBKhscWFRkpyA4vkV3YRRuWlLlcq8zT0HPQTi8aZGEc27/2VuEBKvmmCtXTgjr3AEiswVZTa1Zfi5Q3LBKQamjCrELXhqZz3suJ6OXrMhuSwTiQ+G+03K7BmS9mUAuzspJINCXREaaM64xyjWDzuqF9zSHMn7QrQxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quantatw.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbBPaVSg99SDyo6LqQB3hvVnv6nmvASlYIxqxaIn2f4=;
 b=n/iLiMPeYJh72TrOCIYfpYEHjMarB7acem6hMcBEg3A7LgMG6uCqQl7YpbCA6a/fqBmeecHn8oXoHDwpv05ZPSqs9nSQOYRD7rULkYiWUS0hVKQeo6rWjhtE3qKige/Z+p7OsbpMvb21gFriXj3CeY0L40iQxlxdR46oCGibEpLgyjN+1ms6NVnnQOn4Lxo9HjQlvJ1wUYC6fz4/efpa6svZPaVGk/hXoxcR9ZAnN7s0abHwclpNRwF5VqknlHwmxmySnlp0LPdSA39bVIQoi2RrV8nohGEt9qTqpwNzF6QpgcSH/0fcufs3ME2wVpZ/xK5GSrpZICdq1sEHlUjWdQ==
Received: from SEZPR04MB7902.apcprd04.prod.outlook.com (2603:1096:101:231::9)
 by KL1PR04MB7540.apcprd04.prod.outlook.com (2603:1096:820:126::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Wed, 16 Sep
 2026 00:43:00 +0000
Received: from SEZPR04MB7902.apcprd04.prod.outlook.com
 ([fe80::cde2:f1eb:4379:b196]) by SEZPR04MB7902.apcprd04.prod.outlook.com
 ([fe80::cde2:f1eb:4379:b196%5]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 00:43:00 +0000
From: =?big5?B?S3lsZSBIc2llaCAowcKsRqZOKQ==?= <Kyle.Hsieh@quantatw.com>
To: Paul Fedsen <paul-fedsen@design.tech>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject:
 =?big5?B?pl7C0DogW0V4dGVybmFsXSAgRndkOiBwaG9zcGhvci1ibWMtY29kZS1tZ210IGRl?=
 =?big5?Q?velopment?=
Thread-Topic: [External]  Fwd: phosphor-bmc-code-mgmt development
Thread-Index: AQHdRPHnGYopQD37ZUuPDRhAITdIFLbQXqJk
Date: Wed, 16 Sep 2026 00:42:59 +0000
Message-ID:
 <SEZPR04MB7902BF81ACEBD11B6B8449ECE2B92@SEZPR04MB7902.apcprd04.prod.outlook.com>
References:
 <CAPzB2v5-R-+xQQYwJwjj-g8heEmxU_RLzjKsc6eGqFVNf+cB-w@mail.gmail.com>
 <CAPzB2v7FUUoAcksgwvRhQSOwZqUJYdpgP8rr--8HmJWroJvzjg@mail.gmail.com>
In-Reply-To:
 <CAPzB2v7FUUoAcksgwvRhQSOwZqUJYdpgP8rr--8HmJWroJvzjg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR04MB7902:EE_|KL1PR04MB7540:EE_
x-ms-office365-filtering-correlation-id: e8b6e988-7bac-402d-a4b1-08df138b7548
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|13003099007|38070700021|56012099006|8096899003|4143699003|10067099003|11063799006|6133799003;
x-microsoft-antispam-message-info:
 ql7qrd2uIZXNf9U7MQQgfwKqZdohsAxDNepXONiW16syo5s8L4zabwB+TbVfbAfvGJAlNgkUmLRfY6m1QmChAnQ3KloEXgg76GhGO4YbBmWTRokEDwLAXeGNM/CrCuzyaV2DLO6wqTgQLIWaKqDLqL5+9hbQMA+LCPbJwDw1r7IzuRy+hU/PVlQbkbQlyp/nYHCFDWAfgQQZFQjAu05XJbDwEv1WPHPs/1rwYDqiRS4TE3ZMahi8y2BsSNV07CdQT8O3tGTbGpQ+jHZ+NpGMPol9IsSKQyT5Lxf60T137D+u9hWv8SyPY0dAQbucTMGH3Dgb+tswxsc3n8qQR8UByyB1p8qkjDYtGpiBD3vTu6u8goJvqTEDkOp7AtC6PrtxPPj3PCrKvv6ewo873LQVbmQtSIaE6ZK0lkHJzVzL+uHRt0X50UppKZnmpyMNOjsw1QSqQlMeFWmXJdaYcD3P39BcYFzaLUQdVLNEYR0zEOyLg7I02hAlUVlPdsx4sOl8Ihf2bBqpHV3DOuQjhQGVVaQzaWCgsbdCJFwjFu99UkiorxVF0f5MQ6liTkPJTQO69jQPAgle5mQY1tq9nI2oVOgs+loHOuwrHiGjm+ERm5gt5qyXMp3tbWR1/E/tE1nrA7AhyoYJWBNtBWk4x2apPSkzwS11/XZsOJhTKMnojX4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR04MB7902.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(13003099007)(38070700021)(56012099006)(8096899003)(4143699003)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?VXRSVXpKeU84K1ZXVVBwVWZGUlBCUEhTWU1NMlB6YlA3N2RYdjFFYVk2SGZxZ01j?=
 =?big5?B?Qi9ab1lIMkVjYVlxa3Jnb1R5MnlHVzZrVVB6RUIzZjlqdm9QdGlsVENvMHZoQm5C?=
 =?big5?B?WWZpVTZlZS8xRWJsLzV5ZmYrNGVnbnRCNHNHdEpWR1M4Mm50NWIyS3J6MlJodkI0?=
 =?big5?B?Rm82ZUhQakVOVSs4RE84bUlUVG5RQXZVOENzbGozTTBXRzFzcDQzazlCV0tTZWNI?=
 =?big5?B?YXRqeFhTUlBLb0hyRHpzcnl5dnBuYy9teGdvdGl2UzVOZGNKeHUzTTBVUVdxWDRM?=
 =?big5?B?ZXZzN1J0dmRYcUVqRiswN24zK2ttd3VMdDZoRU5QeThmN3d3VTkvWEtnUXdYMFRL?=
 =?big5?B?NkplWkpDMTlBeWk0cHBJb0tmN1JiL29LNEpnOGxxYmpWTk85cjNXWWdqdUxrTEZu?=
 =?big5?B?TjF1MWhXMXRKNHd3dzdRZUZqQ2ZEZ3k4RzJmcGN2TlB1K2cvdXNQdGM0eUhkRmZt?=
 =?big5?B?Qy9BQmJuMEVzOUFTcVVBOXF1UnM5L0NpNmhvV3Z6L1N2ZDg1ekV3YThYeXRwdzFv?=
 =?big5?B?eWxoYTZXK1k0NU50RkxOZ1U3dzZHbVlTeHhyeXl5NHkvMmRWVFdSQWtIUjZDUGcy?=
 =?big5?B?a0tJbTJyVElHTlk0TlVHT1ltdFArKy9QZE9oOHBucDJyWUF1WElKVEgyTFdlNzdC?=
 =?big5?B?NkR1SlFGSE9ub0NFQit6ZStWT1QwTGpiTW9jVnlzVi9JNk5hbDU3ZHZsQWx5Qkho?=
 =?big5?B?QzlWM3dudEoxQithZTdWV3k1SWNmemJpTWZQV3lEdVZVY0JnTUhqS1JsTnIzNDFk?=
 =?big5?B?UjNra0dXU2VtMFBNcktabVZlSDhwS1hNbkVuNzBuNDF2cEFHL3pDbWlFanZrdVMv?=
 =?big5?B?ek1nUjkzRGc5cnE0eUxobnRTVjRMbm1YRVN6WHJPOU85UGpMM0VCMDdDWWNFa0ts?=
 =?big5?B?YmxJNEh5aUd4bVFHcWlpWkI4M3M5QWl2cCtuOHRZamhmM3RxRjNQYlgwQTBUem5F?=
 =?big5?B?RXJPNXJ5eDlQdGhRZGQ0SVBlRjRvS3lqb2JNeFVpSkxPZFl4QXVxWUZ1Q3p5OVNL?=
 =?big5?B?bmU1QmZ4Mitqcm9oQUlwRkkwRzFwRFZMcDVHMEF4TVdQTFZ1TVZDampBOUNUeUpX?=
 =?big5?B?Zm1Mbmsvc3dibGIrSEIwalBNbGkzWVBWWGlFcW1wVC84eUdZL1RPbTlVUWc1cThh?=
 =?big5?B?anIxOGhoMkFZN2wwa0lOOTlNcjZzd1A0ckdneTRiSm1SYk1vYUkwZUdPNXJGaCtT?=
 =?big5?B?VkJEWDVrS2VDSVhMNHVXSkd5NEM0RTJpU1Mzc3Nkb1NveVRMR215dDA4dkMvY0kx?=
 =?big5?B?SnUwSjlRb0pPZXUvM0xBVWhQWk1zdVNmK0pIK3NJQ05Sb1Q3TUlHME8ycHdVYTRv?=
 =?big5?B?ZGtiRWFtcmVwR3NvY0RPbk0yeFJxczYrQmQ2V3hxeXd3QXBHQm9ORmViMFh2K0NI?=
 =?big5?B?dGEwNnozWU9WYjlDK29KcmhFMEg4d1U5RG9zUVczekRiSEt1TlRNb3krRVdpTlJl?=
 =?big5?B?VklyU2c2c1Fic1B5L3B2Y2IyRk9QODNwSGw4VzRTeHBwbFpvWCt5cUViUWlSZUpR?=
 =?big5?B?Unc1RmRZUStqTUZwQXhISEV6VWtGMk01MGN4NFFCZnpXUnFkZGt2N1RvNS9EMk9N?=
 =?big5?B?UjZvN2FRSUc3ZVVjQk8vcHJCTXE0b2xBL3N1WFIxcDlpSzZzZlAySjZlNk5LSThR?=
 =?big5?B?SHZuanlDUnZ3S3NXOEFLVDFOelNYRVpCMmJ6T3hHcHptVGtxdm1xeDlONUJwTGRJ?=
 =?big5?B?VXg3RVZ6K3VHN0MyeEJHNlFlS1A5YXVsZGVrVm5PRFJlOHVGanllY2RiUEJaa1Vj?=
 =?big5?B?SmdnV0NSZzhrb0JOcnhtZjBPRENsdW1JaHZHL01XblhYV0ZyLzEwbHdGZnZSM2tU?=
 =?big5?B?VG9nVThtTk4zV2Y3QTBkSUxUcS9GZXI1aFFpdnF0blpoOHNNNDFWV1ZRNDd4cEhQ?=
 =?big5?B?WHM0Z2VzUzdLbjBzVzg2d012YStPcTJDR2J5MGdFelRmWjN2SHhLNXRNcXd2a1Zh?=
 =?big5?B?WkRieHRFeVAwaDJoMXdlUUVOUnZtbUJuLzNqSWwxYitvTVdGWFVJa1BlSHl4OEtE?=
 =?big5?B?M2ZGZnhQZEEwUFE5alRQRUwyQ20wS3ZxRkNtN3MwWExVUlhNM0FHYXZyRlh1NE1K?=
 =?big5?B?TURHMXFDMVhFbmxGQjZOeEYrUWc4WHUvRVlJQjJxTWxFZVMxcHVUUTJsMjdZT0dk?=
 =?big5?B?bzdTbkFqcUNsUHhIUzlBSXo0VS9vRmNNR1dnMGNoVmFWUXdZRHZrL252YklzSFJQ?=
 =?big5?B?aHRRNmQzN0p0UG9lTXoyU2EvSVFRUT09?=
Content-Type: multipart/alternative;
	boundary="_000_SEZPR04MB7902BF81ACEBD11B6B8449ECE2B92SEZPR04MB7902apcp_"
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
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR04MB7902.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b6e988-7bac-402d-a4b1-08df138b7548
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 00:42:59.8480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sWKdNK99SRMe/G5/14OpCflAI1lUYbdRe72G1LExZc2G3MuNwnfozJu5Y+H2B0t09Cf2IjEaI2I9ngj+7dosrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7540

--_000_SEZPR04MB7902BF81ACEBD11B6B8449ECE2B92SEZPR04MB7902apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGksDQoNClRoYW5rcyBmb3IgcmVhY2hpbmcgb3V0LiBNeSBjaGFuZ2UgaGFkIGEgZmFpcmx5IG5h
cnJvdyBtb3RpdmF0aW9uOiB3ZSBuZWVkIHRvIHVwZGF0ZSBTUEkgZGV2aWNlcyBvdGhlciB0aGFu
IHRoZSBob3N0IEJJT1Mgb24gb3VyIHBsYXRmb3JtLCBhbmQgdGhlIGV4aXN0aW5nIGRhZW1vbiBo
YWQgdGhhdCBsb2dpYyBoYXJkLWNvZGVkIGZvciBCSU9TLiBTbyA0ODRmNzc5MiBqdXN0IHNwbGl0
IHRoZSBCSU9TIHNwZWNpZmljcyBvdXQgb2YgdGhlIGdlbmVyaWMgU1BJIHBhcnQgYW5kIG1hZGUg
dGhlIGRhZW1vbiBwaWNrIHRoZSBkZXZpY2UgdHlwZSBmcm9tIHRoZSBFTSBjb25maWd1cmF0aW9u
LiBJdCBkb2VzIG5vdCB0b3VjaCBlZXByb20tZGV2aWNlLCBhbmQgSSBoYXZlIG5vIHBsYW5zIHRv
IGNoYW5nZSBpdC4NCg0KSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24gb24gd2hldGhlciBT
UEkgYW5kIEkyQyBFRVBST00gaGFuZGxpbmcgc2hvdWxkIGV2ZW50dWFsbHkgY29udmVyZ2UgoVgg
bXkgcGxhdGZvcm0gaGFzIG5vIEkyQyBFRVBST00sIHNvIEkgY2FuJ3QgdGVzdCB0aGF0IHBhdGgg
YW5kIHdvdWxkIHJhdGhlciBub3QgcmVmYWN0b3IgY29kZSBJIGNhbid0IHZhbGlkYXRlLg0KDQpC
ZXN0IHJlZ2FyZHMsDQpLeWxlIEhzaWVoDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KsUil86rMOiBQYXVsIEZlZHNlbiA8cGF1bC1mZWRzZW5AZGVzaWduLnRlY2g+DQqxSKXzpOm0
wTogMjAyNqZ+OaTrMTWk6SCkVaTIIDA1OjA5DQqmrKXzqsw6IG9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZyA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPjsgS3lsZSBIc2llaCAowcKsRqZOKSA8S3ls
ZS5Ic2llaEBxdWFudGF0dy5jb20+DQqlRKauOiBbRXh0ZXJuYWxdIEZ3ZDogcGhvc3Bob3ItYm1j
LWNvZGUtbWdtdCBkZXZlbG9wbWVudA0KDQpZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20g
cGF1bC1mZWRzZW5AZGVzaWduLnRlY2guIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudDxodHRw
czovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24+DQogSGVsbG8hDQoNCiBX
ZSBhcmUgdHJ5aW5nIHRvIHVwc3RyZWFtIGEgcGF0Y2hzZXQgaHR0cHM6Ly9nZXJyaXQub3BlbmJt
Yy5vcmcvYy9vcGVuYm1jL3Bob3NwaG9yLWJtYy1jb2RlLW1nbXQvKy85Mzg0MyAsIGFuZCB5b3Ug
cmVjZW50bHkgbWVyZ2VkIGNvbW1pdCA0ODRmNzc5MjlmOWRlOWJiMGVlYzk4Mjg4Y2FjNzg0OTI5
OTAwMTY4ICJodHRwczovL2dlcnJpdC5vcGVuYm1jLm9yZy9jL29wZW5ibWMvcGhvc3Bob3ItYm1j
LWNvZGUtbWdtdC8rLzkzODQzIi4gSXQgbG9va3MgbGlrZSB3ZSdyZSB0cnlpbmcgdG8gZG8gdGhl
IHNhbWUgdGhpbmcsIGJ1dCBjaG9zZSBhcmNoaXRlY3R1cmFsbHkgZGlmZmVyZW50IGltcGxlbWVu
dGF0aW9ucy4gSSdkIGxpa2UgdG8gZGlzY3VzcyB0aGlzIHNvIHRoYXQgd2UgcmVtYWtlIG91ciBw
YXRjaHNldCBjb25zaXN0ZW50bHkuDQpTbywgb3VyIHZpc2lvbiB3YXMgdGhhdCBTUEkgRUVQUk9N
cyBhcmUgY29uY2VwdHVhbGx5IHRoZSBzYW1lIGFzIEkyQyBFRVBST01zOyB0aGV5IGV2ZW4gaGF2
ZSBtYXRjaGluZyBhZGRyZXNzaW5nIHNjaGVtZXM6IGJ1cyAjIGFuZCBhZGRyZXNzICh3aGljaCB0
cmFuc2xhdGVzIHRvIENTIGluZGV4IGZvciBTUEkpLiBFRVBST01EZXZpY2Ugc2VydmljZXMgYWxy
ZWFkeSBoYWQgYWxsIHRoZSBjb3JlIGxvZ2ljLCBzbyB3ZSBzZXBhcmF0ZWQgZ2VuZXJpYyBTUElE
ZXZpY2UgY29kZSBmcm9tIFNQSUJpb3Mgc2VydmljZSwgcHV0IGl0IGluIGNvbW1vbi8gYW5kIHJl
dXNlZCBpdC4NCkluIHRoZSBtZWFudGltZSBzZWVtcyB0aGF0IHlvdSBkZWNpZGVkIHRoZSBvcHBv
c2l0ZTogU1BJQmlvcyBzZXJ2aWNlIGdldHMgcmVuYW1lZCB0byBTUElGbGFzaCBhbmQgaGFuZGxl
cyBhbGwgc29ydHMgb2YgU1BJIEVFUFJPTXMsIHdoaWxlIEVFUFJPTURldmljZSBlZmZlY3RpdmVs
eSBiZWNvbWVzIEVFUFJPTUkyQ0RldmljZSBhbmQgc3BlY2lhbGl6ZXMgaW4gaGFuZGxpbmcgSTJD
IEVFUFJPTXMuDQpIb3cgKGFuZCB3aGV0aGVyKSBhcmUgeW91IHBsYW5uaW5nIHRvIGFkZHJlc3Mg
dGhlIGZhY3QgdGhhdCBJMkMgYW5kIFNQSSBhcmUgc3RpbGwgdmVyeSBtdWNoIHRoZSBzYW1lIHRo
aW5ncywgZXZlbiBvbiB0aGUga2VybmVsIEFQSSBsZXZlbCA/IERvZXMgaXQgZXZlbiBtYWtlIHNl
bnNlIHRvIGtlZXAgdHdvIHNlcGFyYXRlIHNlcnZpY2VzID8NCldlJ2QgbGlrZSB0byBkaXNjdXNz
IHRoZXNlIHRoaW5ncyB3aXRoIHlvdSBpbiBvcmRlciB0byBnZXQgbW92aW5nIGluIGEgcHJvcGVy
IGRpcmVjdGlvbi4gRG8geW91IG1heWJlIGhhdmUgbW9yZSBwZW5kaW5nIHBhdGNoZXMgZm9yIHVz
IHRvIGNvbnNpZGVyID8NCg==

--_000_SEZPR04MB7902BF81ACEBD11B6B8449ECE2B92SEZPR04MB7902apcp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for reaching out. My change had a fairly narrow motivation: we need =
to update SPI devices other than the host BIOS on our platform, and the exi=
sting daemon had that logic hard-coded for BIOS. So 484f7792 just split the=
 BIOS specifics out of the generic
 SPI part and made the daemon pick the device type from the EM configuratio=
n. It does not touch eeprom-device, and I have no plans to change it.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I don't have a strong opinion on whether SPI and I2C EEPROM handling should=
 eventually converge =A1X my platform has no I2C EEPROM, so I can't test th=
at path and would rather not refactor code I can't validate.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Best regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Kyle Hsieh</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B1H=A5=F3=AA=CC:</b> Paul Feds=
en &lt;paul-fedsen@design.tech&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2026=A6~9=A4=EB15=A4=E9 =A4U=A4=C8 05:09<br>
<b>=A6=AC=A5=F3=AA=CC:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlab=
s.org&gt;; Kyle Hsieh (=C1=C2=ACF=A6N) &lt;Kyle.Hsieh@quantatw.com&gt;<br>
<b>=A5D=A6=AE:</b> [External] Fwd: phosphor-bmc-code-mgmt development</font=
>
<div>&nbsp;</div>
</div>
<div>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" alig=
n=3D"left" style=3D"background:revert!important; border:revert!important; b=
ottom:revert!important; color:revert!important; direction:revert!important;=
 display:revert!important; font-size:revert!important; height:revert!import=
ant; letter-spacing:revert!important; line-height:revert!important; margin:=
revert!important; opacity:revert!important; order:revert!important; outline=
:revert!important; overflow:revert!important; padding:revert!important; pos=
ition:revert!important; tab-size:revert!important; table-layout:revert!impo=
rtant; text-align:revert!important; text-indent:revert!important; text-orie=
ntation:revert!important; text-overflow:revert!important; text-transform:re=
vert!important; top:revert!important; vertical-align:revert!important; visi=
bility:revert!important; white-space:revert!important; width:revert!importa=
nt; word-break:revert!important; word-spacing:revert!important; writing-mod=
e:revert!important; zoom:revert!important; border:0!important; display:tabl=
e!important; width:100%!important; table-layout:fixed!important; border-col=
lapse:seperate!important; float:none!important; border-spacing:0px 0px!impo=
rtant">
<tbody style=3D"background:revert!important; border:revert!important; botto=
m:revert!important; color:revert!important; direction:revert!important; dis=
play:revert!important; font-size:revert!important; height:revert!important;=
 letter-spacing:revert!important; line-height:revert!important; margin:reve=
rt!important; opacity:revert!important; order:revert!important; outline:rev=
ert!important; overflow:revert!important; padding:revert!important; positio=
n:revert!important; tab-size:revert!important; table-layout:revert!importan=
t; text-align:revert!important; text-indent:revert!important; text-orientat=
ion:revert!important; text-overflow:revert!important; text-transform:revert=
!important; top:revert!important; vertical-align:revert!important; visibili=
ty:revert!important; white-space:revert!important; width:revert!important; =
word-break:revert!important; word-spacing:revert!important; writing-mode:re=
vert!important; zoom:revert!important; display:block!important">
<tr style=3D"background:revert!important; border:revert!important; bottom:r=
evert!important; color:revert!important; direction:revert!important; displa=
y:revert!important; font-size:revert!important; height:revert!important; le=
tter-spacing:revert!important; line-height:revert!important; margin:revert!=
important; opacity:revert!important; order:revert!important; outline:revert=
!important; overflow:revert!important; padding:revert!important; position:r=
evert!important; tab-size:revert!important; table-layout:revert!important; =
text-align:revert!important; text-indent:revert!important; text-orientation=
:revert!important; text-overflow:revert!important; text-transform:revert!im=
portant; top:revert!important; vertical-align:revert!important; visibility:=
revert!important; white-space:revert!important; width:revert!important; wor=
d-break:revert!important; word-spacing:revert!important; writing-mode:rever=
t!important; zoom:revert!important">
<td valign=3D"middle" width=3D"1px" bgcolor=3D"#A6A6A6" cellpadding=3D"7px =
2px 7px 2px" style=3D"background:revert!important; border:revert!important;=
 bottom:revert!important; color:revert!important; direction:revert!importan=
t; display:revert!important; font-size:revert!important; height:revert!impo=
rtant; letter-spacing:revert!important; line-height:revert!important; margi=
n:revert!important; opacity:revert!important; order:revert!important; outli=
ne:revert!important; overflow:revert!important; padding:revert!important; p=
osition:revert!important; tab-size:revert!important; table-layout:revert!im=
portant; text-align:revert!important; text-indent:revert!important; text-or=
ientation:revert!important; text-overflow:revert!important; text-transform:=
revert!important; top:revert!important; vertical-align:revert!important; vi=
sibility:revert!important; white-space:revert!important; width:revert!impor=
tant; word-break:revert!important; word-spacing:revert!important; writing-m=
ode:revert!important; zoom:revert!important; padding:7px 2px 7px 2px!import=
ant; background-color:#A6A6A6!important; width:0px!important">
</td>
<td valign=3D"middle" width=3D"100%" bgcolor=3D"#EAEAEA" cellpadding=3D"7px=
 5px 7px 15px" color=3D"#212121" style=3D"background:revert!important; bord=
er:revert!important; bottom:revert!important; color:revert!important; direc=
tion:revert!important; display:revert!important; font-size:revert!important=
; height:revert!important; letter-spacing:revert!important; line-height:rev=
ert!important; margin:revert!important; opacity:revert!important; order:rev=
ert!important; outline:revert!important; overflow:revert!important; padding=
:revert!important; position:revert!important; tab-size:revert!important; ta=
ble-layout:revert!important; text-align:revert!important; text-indent:rever=
t!important; text-orientation:revert!important; text-overflow:revert!import=
ant; text-transform:revert!important; top:revert!important; vertical-align:=
revert!important; visibility:revert!important; white-space:revert!important=
; width:revert!important; word-break:revert!important; word-spacing:revert!=
important; writing-mode:revert!important; zoom:revert!important; width:100%=
!important; background-color:#EAEAEA!important; padding:7px 5px 7px 15px!im=
portant; font-family:wf_segoe-ui_normal,Segoe UI,Segoe WP,Tahoma,Arial,sans=
-serif!important; font-size:12px!important; font-weight:normal!important; c=
olor:#212121!important; text-align:left!important; word-wrap:break-word!imp=
ortant">
<div style=3D"background:revert!important; border:revert!important; bottom:=
revert!important; color:revert!important; direction:revert!important; displ=
ay:revert!important; font-size:revert!important; height:revert!important; l=
etter-spacing:revert!important; line-height:revert!important; margin:revert=
!important; opacity:revert!important; order:revert!important; outline:rever=
t!important; overflow:revert!important; padding:revert!important; position:=
revert!important; tab-size:revert!important; table-layout:revert!important;=
 text-align:revert!important; text-indent:revert!important; text-orientatio=
n:revert!important; text-overflow:revert!important; text-transform:revert!i=
mportant; top:revert!important; vertical-align:revert!important; visibility=
:revert!important; white-space:revert!important; width:revert!important; wo=
rd-break:revert!important; word-spacing:revert!important; writing-mode:reve=
rt!important; zoom:revert!important">
You don't often get email from paul-fedsen@design.tech. <a href=3D"https://=
aka.ms/LearnAboutSenderIdentification" style=3D"background:revert!important=
; color:revert!important; direction:revert!important; display:revert!import=
ant; font-size:revert!important; opacity:revert!important; visibility:rever=
t!important">
Learn why this is important</a> </div>
</td>
<td valign=3D"middle" align=3D"left" width=3D"75px" bgcolor=3D"#EAEAEA" cel=
lpadding=3D"7px 5px 7px 5px" color=3D"#212121" style=3D"background:revert!i=
mportant; border:revert!important; bottom:revert!important; color:revert!im=
portant; direction:revert!important; display:revert!important; font-size:re=
vert!important; height:revert!important; letter-spacing:revert!important; l=
ine-height:revert!important; margin:revert!important; opacity:revert!import=
ant; order:revert!important; outline:revert!important; overflow:revert!impo=
rtant; padding:revert!important; position:revert!important; tab-size:revert=
!important; table-layout:revert!important; text-align:revert!important; tex=
t-indent:revert!important; text-orientation:revert!important; text-overflow=
:revert!important; text-transform:revert!important; top:revert!important; v=
ertical-align:revert!important; visibility:revert!important; white-space:re=
vert!important; width:revert!important; word-break:revert!important; word-s=
pacing:revert!important; writing-mode:revert!important; zoom:revert!importa=
nt; width:75px!important; background-color:#EAEAEA!important; padding:7px 5=
px 7px 5px!important; font-family:wf_segoe-ui_normal,Segoe UI,Segoe WP,Taho=
ma,Arial,sans-serif!important; font-size:12px!important; font-weight:normal=
!important; color:#212121!important; text-align:left!important; word-wrap:b=
reak-word!important">
</td>
</tr>
</tbody>
</table>
<div>
<div dir=3D"ltr">
<div class=3D"x_gmail_quote x_gmail_quote_container">
<div class=3D"x_gmail_attr">&nbsp;Hello!</div>
<div dir=3D"ltr" class=3D"x_gmail_attr"><br>
</div>
<div dir=3D"ltr" class=3D"x_gmail_attr">&nbsp;We are trying to upstream a p=
atchset&nbsp;<a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-c=
ode-mgmt/+/93843" originalsrc=3D"https://gerrit.openbmc.org/c/openbmc/phosp=
hor-bmc-code-mgmt/+/93843" target=3D"_blank">https://gerrit.openbmc.org/c/o=
penbmc/phosphor-bmc-code-mgmt/+/93843</a>
 , and you recently merged commit&nbsp;<span style=3D"font-family:monospace=
"><span style=3D"color:rgb(178,104,24); background-color:rgb(255,255,255)">=
484f77929f9de9bb0eec98288cac784929900168 &quot;</span></span><a href=3D"htt=
ps://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/93843" originals=
rc=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/93843" =
target=3D"_blank">https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mg=
mt/+/93843</a>&quot;.
 It looks like we're trying to do the same thing, but chose architecturally=
 different implementations. I'd like&nbsp;to discuss this so that we remake=
 our patchset consistently.
<div>So, our vision was that SPI EEPROMs are conceptually&nbsp;the same as =
I2C EEPROMs; they even have matching addressing schemes: bus # and address =
(which translates to CS index for SPI). EEPROMDevice services already had a=
ll the core logic, so we separated generic
 SPIDevice code from SPIBios service, put it in common/ and reused&nbsp;it.=
</div>
<div>In the meantime seems that you decided the opposite: SPIBios service g=
ets renamed to SPIFlash and handles all sorts of SPI EEPROMs, while EEPROMD=
evice effectively becomes EEPROMI2CDevice and specializes in handling I2C E=
EPROMs.</div>
<div>How (and whether) are you planning to address the fact that I2C and SP=
I are still very much the same things, even on the kernel API level ? Does =
it even make sense to keep two separate services ?</div>
<div>We'd like to discuss these things with you in order to get moving in a=
 proper direction. Do you maybe have more pending patches for us to conside=
r ?</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_SEZPR04MB7902BF81ACEBD11B6B8449ECE2B92SEZPR04MB7902apcp_--

