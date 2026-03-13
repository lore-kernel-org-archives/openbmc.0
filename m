Return-Path: <openbmc+bounces-1480-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB4C106FD9B
	for <openbmc@archiver.kernel.org>; Fri, 13 Mar 2026 08:06:55 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fXHBc6WMTz3cJy;
	Fri, 13 Mar 2026 19:06:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773389208;
	cv=pass; b=Ld23bcqYWh9HUyfxLtOoMvmQbVHnvOd9fVcoCOMIsnsGrUHdaIhKQ7UTP8l1wgCUeBde4mWs35A+5yw5Q8gLqFllTAsBsMRgwlrzn2aagpUmcM6a/4dTrEsUCwzsd4RUfWmbY5UG4xm61/DHHebakddIeUj1rL5VaHaZlcGJT4xuypIp4vG7CrBwtIkFlEuW7wT6+EngJrOME33snHx0GfatUR+fjWdw/nMbQLN+xMCuLoJ93fiDZp4gAvRiqM/ztOacI2EO4BuKM9zMlRguaWYlmg5/WT6mR2t+g3w0mo7Copxf5xVTfV7Ov35uUj5T6L81EIY+3iNqQL8u9szFsw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773389208; c=relaxed/relaxed;
	bh=qpDXeJT0JHMd05s6RaPXEoK2jJUH5QetmLqWuoEa+cU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PlM//5LPrLfqNOPD5BSGuEFnsaQGGeIwzMDgjoskBYx/aa8LR8w832DDbP26p6/oxu/6swvzqQJY2pTTgvZ6hOrqlm9ivoQ/pk6jIWDlOu5q1rG+qjdkh11VqitXRlkQ1lIsz+UpTJf1XnpVD7b4EAUUzoCAvq8roOtniragOHu73ysqRLYHzDNHm1rd8EBZ+Zg1Vb2y24/eRsMkP5g6Pcy1RAxpZMFTgVsNjFXcpRFF6WM/b13tgvICnjHvp/AMzvZwBjVKPY5QtLzzi0Z4J8SJyZ3AlCvTfu/4EYN1inqVXneojzHpQmQbR34HbFPT0wQ1rFv80XVLLQSBbw4rhQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quantatw.com; dkim=pass (2048-bit key; unprotected) header.d=quantatw.com header.i=@quantatw.com header.a=rsa-sha256 header.s=selector1 header.b=fMLjo4Xh; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=litzung.chen@quantatw.com; receiver=lists.ozlabs.org) smtp.mailfrom=quantatw.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quantatw.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quantatw.com header.i=@quantatw.com header.a=rsa-sha256 header.s=selector1 header.b=fMLjo4Xh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quantatw.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=litzung.chen@quantatw.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fXHBc02xSz3cGM
	for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2026 19:06:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeJ1dCEOq5R1Y68nyiQ3UIXmTeKco+P4CmVsBCj0uNG2fveUVtEvBiyBVgGjlt6n+fIeDTBsLmb/d9j9OMHk4epCk1KRF88YbncdzuebRpe5JOMMZAw96H/oKE20stlszHf+qrKaMXF9R8wLCzpsFFiDd6A6S0LnDhSCEf/xW3MRsY7biFvsKw2BlbVqw8BUvP4L6zBKOC6NjmapZEzXJaIsHtIQU6cLt+UNSvqLF8Am4IEEgtRZPHUlZSy8P5sXiSHScLoJuWsNokeLQVKlRPth9Dd2srgeG2IMl6EaHEq0oR+dT5eCTzj5b2hUVryJHBI+QeHXhjtJVyeNIR/D9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpDXeJT0JHMd05s6RaPXEoK2jJUH5QetmLqWuoEa+cU=;
 b=iEjW4Q5eZDGYO+3fuQ4DFwkcE5juMc5lPCnnhA+Pl0GYlYD2BF9db6hCAXx+pyYQ9iZm8x486Rxsr10dVNXTdVcXW9A+qd5jCJCj4Fosy+h7ioEGuvXu5sXiO2FzGgh3jX+uVjHfiDhfmKNc0JG7SPINa813PjgUGYI6lmtB/PrvKlfWswbgxZi2uHjTjuwv7iNx28yzCOc6f3gVbaxuX88144vo/GmT5rMxx1H+6OLN2+PlcTTqtb4s0UwIFYYFPc+kBLOsUaH85+yZIJzb1MaAgXZZo6SjBBl9jcxb2/rohL8sfFSROoKgo4CEHZ5OJ1RnXNm8bNgAzcmImiChUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quantatw.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpDXeJT0JHMd05s6RaPXEoK2jJUH5QetmLqWuoEa+cU=;
 b=fMLjo4XhO78RBaYmwbrhRkqPOwL1uRV4itv0hWrizJjo1jfyW3Hh7GbIBaY2VrAGk2XhMwvYMzNI+YN6SbOBxeJM+Hp/GVF0G/jD3EUg8OFB0iE7A7moO13FAKN+HKjg5SA+IoRK6PMd375nC5ulVsmwqd75h7To5Yb8hC6PAmbFo8eRRiEcjeigO8nA8JJxpROGzr+WPq9M9AcVHDDu9si9/Ez1u6E9doya/Vho1NDpy2XwF0523TmFNixNiUe8r08Y+qrDqbuewEdNj2Zu2VFL6Lgmy1psaDM+0C6E1LeYiy72gipSPZPsXeI8yQIgxIFvWjf1c4i2Lnx+tfZAMA==
Received: from TY0PR04MB7352.apcprd04.prod.outlook.com (2603:1096:405:14::6)
 by KUZPR04MB9224.apcprd04.prod.outlook.com (2603:1096:d10:56::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 08:06:23 +0000
Received: from TY0PR04MB7352.apcprd04.prod.outlook.com
 ([fe80::12b8:1dda:a0f0:74b6]) by TY0PR04MB7352.apcprd04.prod.outlook.com
 ([fe80::12b8:1dda:a0f0:74b6%6]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 08:06:23 +0000
From: =?iso-2022-jp?B?TGl0enVuZyBDaGVuICgbJEJERE14ey8bKEIp?=
	<Litzung.Chen@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: =?iso-2022-jp?B?TWFydGluIFBlbmcgKBskQldFPCM2VhsoQik=?=
	<Martin.Peng@quantatw.com>,
	=?iso-2022-jp?B?U3Rld2FyZCBTaGloICgbJEI7SzBOMlobKEIp?=
	<Steward.Shih@quantatw.com>
Subject:
 =?iso-2022-jp?B?GyRCMnNaQBsoQjogUXVhbnRhIENDTEEgU2NoZWR1bGUgQSB1cGRhdGUg?=
 =?iso-2022-jp?B?LSAyMDI2MDMxMw==?=
Thread-Topic: Quanta CCLA Schedule A update - 20260313
Thread-Index: AQHcssBIhsI64W4zKUaRvXm8QsUbkw==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 17
X-FaxNumberOfPages: 0
Date: Fri, 13 Mar 2026 08:06:23 +0000
Message-ID:
 <TY0PR04MB7352E978797799D8AE89289FF145A@TY0PR04MB7352.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-traffictypediagnostic:
 TY0PR04MB7352:EE_|KUZPR04MB9224:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 805a50d1-e97a-4b05-3158-08de80d76ad1
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 XxB76vvVwo3ksMwjqK+KBfXRI+qU0jdR26UD76sfNJq6zyIAZFboO7t0zzMRQ8p7wGHrcf/JDSXlxaLtjoGL/lSvNLRuBsFRr5RfUBATXOB1xiilsYc0A9kFatbFvyHIHIkTYJv+O67ejAznSdVo3z3J1FsvAGc0vq5JP/I0z1/y5WUH5qSJedZ9x/+s4GUJuuM+O/CGeGEDy02f3kXxqptwulKBeascuLVE0N7bgKDfUvjLieDjZM7TTX/w8mcysQwz5m0YzxmeGPzUwUOzD1d4kItISxX/jD31fwaUFrvpBzpr79Mjr5RNocveUU+taYRqmFOtJ01UVZNQD+6sY4xte4P/gVquCJf6a2M+KAZICYvaKHngsBzUkj8yECS9anUY+jMFb6VGloX0DVdL13XJtPa0YzgO9oCwaOwXNy1SbW6tUYbWCptFonTkt2J+qO1IWjiuwAsWd6MY9CYky1Bqlrbw/86ZP5bybYD7WfjXs6Al6zi0hxmv6EWHGHLxKH6WP4sSv8yNtqUGTl0m1/omLa1CHlOnykxluIjvOIFkbpzcm/DYvYCgLTVKS8avxlU3wyLVNloAs8v/+C9EjTumUOcEehwxaef9GMUF7iHSTCAr4WRBGpAgJati736keEg/QRfAp1OJSqrsnqVW01rd6F3oh8laQ+nzj+2ljBnINHuTWmSCB40Cosilw7VmraooT/I5iwc7k0tMRfJK6MVQyCXU3eVbtHk/D/A04CrffsdQG5zHs6mf3dD1pbDlUn7rZYNzuWKAjlDbjTXYckJ+r8exMr94aAAVzUwqXms=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR04MB7352.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?RXdQMGxCZUdub2Jsd3FUYTZ4SGJBaDZqT0Vvdjk0cERKUTEzblFNK3Er?=
 =?iso-2022-jp?B?VlpzcEJTSWZNR2oyR3kvS1QvdElBTHp5UEp4YTgwVXo3TUNERm5CaVJw?=
 =?iso-2022-jp?B?NitkWWpYOUJrQ2d0cld0eUY3SmIzVENvbWU3RGpCR1ovQmExVm52dHll?=
 =?iso-2022-jp?B?TnZ3NTVyQTJEZVI1QXpWeHhsV3gyWUxYMU8vUWdzcllFQWxNTU56YnF4?=
 =?iso-2022-jp?B?bTZJWjE0dFZCL1BtdG5FZ1NCa0F0WWpSSXVhYXEyMnY2VGVXeURHcnln?=
 =?iso-2022-jp?B?a0FybG9nVkxCNzhidDVnNm0wVjZMU243MFcvM3dYbW1VV2JodVNBL0lt?=
 =?iso-2022-jp?B?SDQ4VmNlbUFDQW9ZU2U2ekJmQ3M1MFZPRXk1bGV6VkpNOWpBMjh5cUVS?=
 =?iso-2022-jp?B?aC9zVjJCZVBGWTRrNVV3Rm1jeWpvYkRUMy8xNUowVlBqK2t3WGt2VVMz?=
 =?iso-2022-jp?B?R2ZQaTlZSFA2ZXIrTVRuUXhFWkFoM0tSeVJ1RkpiSnl2Y0lLWUpFZVZM?=
 =?iso-2022-jp?B?NG9NemJlZ0pTUE5ZakVIWTNaMW0rUXRJNEdkY0NaV3pjV2lyM1lmSk16?=
 =?iso-2022-jp?B?U2lodFNmWnR4UFJ6eXBRK05QWXR1Z0ppVWNkRXM1TnNNZEZWYkhZQzhz?=
 =?iso-2022-jp?B?YTBLbUtIOUZsczl2ZlI5TWJQSVpYanZDam1jRzNERVVkd3dmNzRZODNC?=
 =?iso-2022-jp?B?Rk9kR3J0WVFScTRReUlzQUpOT2NMekpKYS96d2ZUM0VxamYzRFhxYXlK?=
 =?iso-2022-jp?B?NjVXbk5ZejBnYU5PRTRiUGpZUmFUNjhVNjBWMW1zc3hmU3lpWE5sdVA3?=
 =?iso-2022-jp?B?bWZvZUN3NDhoMmhaRXp4RWNzYnIwN1cwRS9pMFpwKzBGN20wMXRONnZy?=
 =?iso-2022-jp?B?ay9tY0JabjMwZmFGV0ZEQ0x1RkJlcmlvcDlBYytTd29lZWRNRzFYeThQ?=
 =?iso-2022-jp?B?eGZMRVhnYjJiZzdzUUtwTTRTc1AyaVY5VEo1Q3AweEQwRUlETFp6NTJp?=
 =?iso-2022-jp?B?QVErT0d1ZkNGcm4wNkgxSlV5YkhuNUlJb1hDMVJRR1pkbkZ6Ui9kWU53?=
 =?iso-2022-jp?B?ckszQ2xLZFBhbG15OHVhZXJ6dWNtbzh2OUZZdW5wdmVnVkZ2M1I3aW1r?=
 =?iso-2022-jp?B?UmR2YTBBMGtib0xsMjRlS1F1dGZDazhoMHlURU1FQTdZQUNtUGpoN2Zz?=
 =?iso-2022-jp?B?RTN4cFprR0U4MDg2VUVIVnArcCtpaHcySDJnaXk1d0x0bHpmUHA3Mlc4?=
 =?iso-2022-jp?B?UHdRSElaeXZBVkNGbDNsakgxUUM5TDQzcDdCaHRudnRLVmN1U0JlL2Za?=
 =?iso-2022-jp?B?eU90cDVXZzYya2NZVmFqblBVQmNxOXhaNnFza3VKNjVhZFpCOW5GY2Jo?=
 =?iso-2022-jp?B?aUlnSGE4eTRwYlByLzQzbnJXSzRFNjJtV2RzMVcwZWc4cWZYSjJYVlN0?=
 =?iso-2022-jp?B?UytTTnQ2L0xaUkR3QXNZbzFjNER4em52SjNlOTE3aVBPYVYrQThKRC9a?=
 =?iso-2022-jp?B?TzB3ZGZzeDhaY0N4QloyQ2hmNzBhQzJyeEpYbVUrRnlFdnQ5eHJYLzBI?=
 =?iso-2022-jp?B?akZMdGkwb3RaUWhGd21sZ00vOHE2bFBQUEIrSFgxZHk1Q1Vub1RNZG5p?=
 =?iso-2022-jp?B?VWlMT2xieG12a01rVXVxdGVnUGhuaXlOMEhPcllMV1kvRnpHSmZ5MEVW?=
 =?iso-2022-jp?B?cEZIeDY3UExwWjZiMTJCTnNUVStJcURMSmxpOGNzKzhpb3ZxeU9JNEky?=
 =?iso-2022-jp?B?V3JRdytHa2ZtWlZzTnBhYmVQWEdWd1BoVXlTZnBLaGhDSnlYa1FQS3Aw?=
 =?iso-2022-jp?B?STRsY0lYeU5YZ2RIbGNxaCtpZlgyZnptNGQ5UkJWVnlDUjhsdkg0Znpt?=
 =?iso-2022-jp?B?RmhxUkpjVGtIN1gxZEVsRkYwc2JjUnVWeG93UW1UdnNBTGVScnA4dVIr?=
 =?iso-2022-jp?B?M1hGdmR2MDdENXhucnYrem1IS05aTGN6dFZFZW0xVDlUZHJXakE1SGND?=
 =?iso-2022-jp?B?ck5NVm94L0Vpc25kdmVvWVo3R25WKzR3VDhPYWcxNFV6U3VPTTI1WlZx?=
 =?iso-2022-jp?B?ZmozdVEyOGdDZkZCa1lSZENmOTNCbHF2ZHlac3RBdzFqelJIcUtyNThm?=
 =?iso-2022-jp?B?bXdYQXdyZzR6LzdZMERjVWlZOWRLOFZKN0pPYXgzaGpmL3pYdStaNmFD?=
 =?iso-2022-jp?B?bkR4Z0tveXpxSzR2cU1YWTZMckZEVGk1bHZ2T1dwNU5iaGRteHNCcUxq?=
 =?iso-2022-jp?B?QklhSVZoeHZTNmRNZmh1OVRWN0YyNmF4L3JxczFGRnQxa3J3Zmc1MUV4?=
 =?iso-2022-jp?B?Q3Y5SGYxK1NJR1NNSThJSUdaR3VHNEZ6WGh0UFF5c0NreENzQlV0L2Fa?=
 =?iso-2022-jp?B?cFY0d1pCellIQWllcjZINFdvZzdTc0VkU1NORnN1ZUk2VHpmQWp0UVgv?=
 =?iso-2022-jp?B?bzJKbThNc21UbFhOd0ZOTmNIcjk4Z2l0b2VoeDNhdWk4Z1hXeUUyaEVv?=
 =?iso-2022-jp?B?RnFNVm5DN3Y0V204ZTFUQkQzeFlhZm9vU1JaZz09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
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
X-MS-Exchange-CrossTenant-AuthSource: TY0PR04MB7352.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 805a50d1-e97a-4b05-3158-08de80d76ad1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 08:06:23.1265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bxwq5BI6DKuK8VDcscvn7Kq5JXMUBXbFcz/VYO60oxhJQj1MtVdQC5TaSOKdiHuC94MbT3akfoWG4IKFIG68alDVbStRIoacKrb0E/Q9D28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR04MB9224

Litzung Chen (=1B$BDDMx{/=1B(B) =1B$B4uK>2sZ@GgIuM97o=1B(B [Quanta CCLA Sch=
edule A update - 20260313]=1B$B!#=1B(B=

