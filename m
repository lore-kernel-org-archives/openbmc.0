Return-Path: <openbmc+bounces-2142-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1ECC43458
	for <openbmc@archiver.kernel.org>; Sat, 27 Jun 2026 18:20:54 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gngp669c4z2yS4;
	Sun, 28 Jun 2026 04:20:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782584446;
	cv=pass; b=HIrWsQWV83omTbzva+El4abwhBpL+lFaGQ0NzZs3tO/7M7NS2UxD9X+pgfnL3nqAbIYALlOLemVOn43xqvkkSlNDUEfVsKk8C8mmKceMDVSI6vNRpV/uG+rdm66H/MjiiufJhtXK4LPWTfTLt9Q/9/vssTowa9de96VfDgXRovZsczJNo82j+QxLNp1nAIkm9s6iIDqlhVc3viE7sE2hF3q0x+OdCzRzLlIiWJw8LVeQwjN6ujaSey8SP5rmZcFb4OxCpGBVO5rnOOacXOazplITpLPSPRzBDrpojIg9gudlOC22e2nAYFSkjX/79u6zIr0XGqk128rMiarOM0oXQw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782584446; c=relaxed/relaxed;
	bh=DQOjMRrpt89hkiVpuEp9Ng8YIoH2aXMwxX7UXi7hRwk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cblB/nGrYGHXs2LlT7zhXmyeB7+zXk5gwWqXOu0okelAX3uxznUc29Uo86YgFx/0ks4Kovdz1OOU4CJR9scQuoGMpnxBm1NTQRDWlu38m4wvczu2n3YWfF2QAxyRrz5R+tkSuPpQ2QFQ6PVT03VgXWiO57crAgJ/N0g3iRjjmV7haTBQMrBSIrznEFsAvO5O3754v+PUWpoSnZxaW8jrWWMqcQSABoyY0Xo2t29Iw8eAGZOxzK7+izFvNv/Vnj7Dc6bQlqNRbfquy8lFAAWNpkavLMSbEqw1jHFqJjMREKNmDwwkS9nxyFqW0GTrziuSUlSBMapEheLXNkO8hzOCcg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MkSkrXiv; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MkSkrXiv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gngp40mlhz2xyh
	for <openbmc@lists.ozlabs.org>; Sun, 28 Jun 2026 04:20:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4DkN3lkrP+9CecP6ps4OW797y3eUEXyJRTUsAToVF78oGi/0buotA5WSG3cS4Ky65FIBR75mN3IKdBYvwZu3JS4tFBu+5t8U9OL/14x9+NuwwEijMPRSXFSapBo3EWG//sdGs+5d437ciQhY0N5Pq9rPs5RJVZWekd60nuxA1EkweKk1C7/c/EkJzPwgI75/JegGqwJANR8js+xbv4pbvYNfS2BPbJOvV2Z8tH/n4s2MaIsysirOXaHP5NkKUGXO3o4rCadnhZS2uDibx+ibPVlHT3kIB5R1nxyJQmc08u6bLhenJUzgeEB3djpxieor8Ft6sXGLfI2ALg2Nafjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQOjMRrpt89hkiVpuEp9Ng8YIoH2aXMwxX7UXi7hRwk=;
 b=HOqmoxu4TXpChUqNDGkiEr7mPlv7QnDCOtKwmiNn4w9D7/Dng2HRr7zE82OrbgWCjqLPYxgsiqHy1+GvFvKolTlm90kw7Ui12Zyaa6vsR9BZC/TfEIS5wl3LhFJ2q4GA0Qpd7gjdiJuW37yRzUhfQB12ufas0YNE+XWXWJZAneep0rd47tp5cgpqF73lyjSNWS6n9xTbt3EM2Dp4BZZzZe4cLo4APMfpFoQO+eoBVcHwBjVf9vfbNT2qMxKvVuryuGZINrUctXbjn1IueS9tu6MZnc45dN68GDZOkWgTtp6udBHHUrf08YsK0+nrQtjy//1zl094DxJrp5SAzUgCYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQOjMRrpt89hkiVpuEp9Ng8YIoH2aXMwxX7UXi7hRwk=;
 b=MkSkrXiv5Pw/8ealu6EN8riYBf5t0FAgzCgBXiVE+q6uH587OUWdegOV2lK6KZlJreZNccRcpRxc3JvZsdgAKORDk94YXplV80FPIDj0V3x5RPulEsV6d0GQB8Ak5vyDvPNVQ5Bnu9ENqhg1AsCeRbU4EoTq4xu2KzRUWmnbTO7NZusJATyLSX9+X5cIuyqpzMs+IqaLGabpBLyEgMqUXriwX04mVtZBeTLmTRswsxwKKBlhfucqH2diBLsEsNPK+QL6PF5xMUu7wiNPGBRvE4WsR1XNs4o1EmTqGFJFwEke6Kcv0jTFR8dxZFVnxKTzdNWsZ67fkNARBG6jlZ3mIA==
Received: from IA0PR12MB7721.namprd12.prod.outlook.com (2603:10b6:208:433::20)
 by MW4PR12MB7015.namprd12.prod.outlook.com (2603:10b6:303:218::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Sat, 27 Jun
 2026 18:20:19 +0000
Received: from IA0PR12MB7721.namprd12.prod.outlook.com
 ([fe80::93d2:5162:edb7:f0b3]) by IA0PR12MB7721.namprd12.prod.outlook.com
 ([fe80::93d2:5162:edb7:f0b3%5]) with mapi id 15.21.0159.018; Sat, 27 Jun 2026
 18:20:19 +0000
From: "Jacky Huang (Engrg-Hardware 3)" <jackyhuang@nvidia.com>
To: Tan Siewert <tan.siewert@9elements.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
CC: "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"joel@jms.id.au" <joel@jms.id.au>
Subject: Re: [PATCH u-boot] ARM: dts: aspeed: Add Nvidia VR-NVL BMC
Thread-Topic: [PATCH u-boot] ARM: dts: aspeed: Add Nvidia VR-NVL BMC
Thread-Index: AQHdA/3ySpPzhbfjtUC3vwsF+nDMwLZO86kAgAPGs+s=
Date: Sat, 27 Jun 2026 18:20:19 +0000
Message-ID:
 <IA0PR12MB772150F553CECC110BC9348CA7EA2@IA0PR12MB7721.namprd12.prod.outlook.com>
References: <20260624172052.752986-1-jackyhuang@nvidia.com>
 <a49f7189-4633-46ee-a040-fda065e921f9@9elements.com>
In-Reply-To: <a49f7189-4633-46ee-a040-fda065e921f9@9elements.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB7721:EE_|MW4PR12MB7015:EE_
x-ms-office365-filtering-correlation-id: 0cd9f5b0-cdd6-47a1-1c08-08ded478beaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|22082099003|18002099003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 +p6dFB9FkL/fSI4AqWbmMjv6io74WrHO3mSt6yZCVJHuyvBs3pgqx4O+tOo5qh4xhnxhRYR9TXP7V6sFxMDR+UCVYtV0hSaBrkNmr1AE4+ri8/Yb9/XUkrACyfABuNKWKJva+gKIZEBjbQbbk1WWC0XYOicP3SpFZs1TBCX8kSQKzmBBa9PfvIOSf1SzbruJeeCVVEpx8S2skwZsBDiayo84w2+YPd0Q3immdM6iSWgmnFJHwjftY2zTis79jmOi9LHdAaouxCFsGJuGW4GDClIAY1E9jCJXdgZVfflBxW1A7VfiQh5Y83fKH6EniDsyHYESaeZxBx/ZBxJ/2toiz3QoGaLCipZVxT4nZOATxjQzvzb9DqhS9CU1OZzed35ZR20AmygxcIiklh54YELSinUKSj9DDISVEN46toG3KZuPDf0nHUpUURAAHFPy7fvLw6L7ppF0nY/yZW3uWOljM1xeHkXM6j+LOb0hZJ4XT+tbjdqOpKhHAitXBNoytKzgLC9vMoIptAX/L3D2jBfwLRamH8gvA/2wdWtJEUdP+Jilx+D5b+aRqvxJMBXbkNtfpVCU+Anwh+PYrX2wDGQSAnTGTV6JL4MiitTgFwBerbe5DTOw13NqGmiYnABEmFF0TsuiCVefeOH2pdnTJCDFN9dpU3uzp7GPusKbqwJ999GHoiAomkjZrCZ1U0jfPyfqJb7MxVChvm8kAkNiPaz2uwqJq78VYg+M00OBj/WAYz8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7721.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Q17t3+kVwEtp6A8XoVU562qd0bJ+CkSxlZSFh3Fm3POOeFwNBA026JrYxQ?=
 =?iso-8859-1?Q?2kOFCNOH1mLP8KD70c3q/c6lzc0lDzaDKGmp4/8xsTrEPLSQB1bvmNIKOz?=
 =?iso-8859-1?Q?s7gH5UX73OUrVSD9deS+PvlgifM1RwZWiC0/DENBs0D4MRbfMbmGCETv3o?=
 =?iso-8859-1?Q?tGZ7UnVg00beHWEro9fbhREPSB5VKHa/zJVA0vSocjEpHQeQ1thtkalEPh?=
 =?iso-8859-1?Q?O+RzXrquvfpVsN9rBPNb3PIZebtDpQapF7xkvjC0F2measpOq6tB8t/m++?=
 =?iso-8859-1?Q?nO3yATLxYCNb0WlTry9+rYVL6HsYaFlgOf4OdLLS1oppPGmTtdt6VcDb3R?=
 =?iso-8859-1?Q?J31uEmF8GdmdfycLqoZDygAzB0WHunta5leySEa1z268WDbPIAn5Gt5RnB?=
 =?iso-8859-1?Q?Oiu2Ao/mY+XWcStd/Eo0c2Mj1tKZq+3L4sMFX1tlBhFpkcO8rbOmCzl/eZ?=
 =?iso-8859-1?Q?hjhyrJ/J4d/FYFW6mklobXKcKCbrX2X5mKhvmNYV+lX5FAjk3n3RhyH55m?=
 =?iso-8859-1?Q?uld8i7nEooB676xncCDL/BEcl6lS84JD3ZMQmPPBO4jHEBsewr//XaMMJV?=
 =?iso-8859-1?Q?Hpp4f4GOk8ewmfWgt/7nY4PLX6Mpdno5p+TrF6uTbr8aUajEEp8WDihqvt?=
 =?iso-8859-1?Q?IRMIJDxOHViq779NV+l7wBTRuTxRhmC4sGPdn/MWwbhPIJokafquJCtOz+?=
 =?iso-8859-1?Q?Zp//q4xtuhf8miv3r1V36ekrzr8OdSkguREHSjyuOAj/UJ48LrSNAPw01i?=
 =?iso-8859-1?Q?0rqMxE9nFY2WzLy+Q4K94YMD1acJGqqngjj/T/hQol7zqFnD9w5UD5yiUz?=
 =?iso-8859-1?Q?ZkoBMqgYv3cOVKY6oYZWh1YcDoCJPynnJF0XoQoEfcLAHHbA6d6+hvlbUj?=
 =?iso-8859-1?Q?h+C2oRjarTZkdCzJh3TQQZmFjbeEBgqytAjJwOaT43KnDOmo4wevJAF6x2?=
 =?iso-8859-1?Q?AklElyeyVLZbuXqX/zvQ4TBc4LR9456/uvkTB7c17hWezVB1UD4o5QTBNq?=
 =?iso-8859-1?Q?0RdBM/vEEFWDAS9tYKlDEmoqoJ3LURmOx9vUdBFivf0XIAJkhrtDrtIzl3?=
 =?iso-8859-1?Q?7sD6zap/Iwg8QapxJ5+uW2vpuMb295dzd4Vy0h9a5nTiV5t0Cv/Dn/oc67?=
 =?iso-8859-1?Q?nj0zPRsdiC6B8M1ScvDYoeZnFaA8OEQhQg4GVc5qBxs3Iq/heRIXdzYVsB?=
 =?iso-8859-1?Q?AZ6BQzlxS1V9KhTjRKNfdPdns0gO5yg7uNRR3moqyEc83sR1DWVOVO8v/8?=
 =?iso-8859-1?Q?/QYCpe+OkHtzQYd+33Y8ZRop/djywhCkwirmhnxKCCNVm59kxlclU6H3hN?=
 =?iso-8859-1?Q?UnFxHMj7Us9aurmQcPhpxWZn8YCWe+gKfwjONgaokw5yATgFDHe90YisBW?=
 =?iso-8859-1?Q?7dHyfXhelVsZWWXOuvE05s/SUoBnUAj/mjUbf1RSE/tRwhMRB/TCg486KK?=
 =?iso-8859-1?Q?Fp6w1X8Y5EdS1NPO4CbA8kLR9F1EUGA56Q3PawdI+JahqwjRqtz//y5lUN?=
 =?iso-8859-1?Q?pBU0twWT75wV4YwUNMd4d7dWo650Bb7CzGd0lujqIUGlZEyy0vmPlqXAJL?=
 =?iso-8859-1?Q?9x0Raf1/G11KZMPYqjwV0gr2Vy2BUUe0mH3v9lkzylKJ7npT0IPOhsukPo?=
 =?iso-8859-1?Q?IuPo0qH4koOcS/khTlC0psHjtBPWvh2o4eUnoVjDcbmortm6qbSf3/wFzv?=
 =?iso-8859-1?Q?ykqPweRLzNN6oGVrS6Mxx59B0feA+aTJ6Be3yDWGMVSiVTUuypjopK2u8A?=
 =?iso-8859-1?Q?4Xh733hjfGBxrdtt9K3Q9RJ/3SKe69sVHkIg477lg9ubYb?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB7721.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd9f5b0-cdd6-47a1-1c08-08ded478beaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2026 18:20:19.2750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4iondkvMPhqR1S/899jRTyKOPKk+2aE39NM4K2ry7/NH87pUnfecbbJIeXplE1NSslQAzpNzKHQ1N1TAI2AIWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7015

Hi Tan,=0A=
=0A=
On 6/25/26 10:37 AM, Tan Siewert wrote:=0A=
>> +	ast2600-vr-bmc-nvidia.dtb \=0A=
>=0A=
> Sort alphabetically (i.e. after ast2600-intel.dtb)=0A=
=0A=
Will do. Sorted alphabetically in v2, placed between ast2600-tacoma.dtb=0A=
and ast2600-x4tf.dtb.=0A=
=0A=
>> +		mmc0 =3D &emmc_slot0;=0A=
>> +		mmc1 =3D &sdhci_slot0;=0A=
>> +		mmc2 =3D &sdhci_slot1;=0A=
>=0A=
> Do you use those on real hardware? If so, then you must enable them too.=
=0A=
=0A=
No, eMMC/SD are not used on this board. The kernel dts doesn't enable=0A=
them either, and the BMC boots and runs from SPI-NOR. I'll drop the=0A=
mmc0/1/2 aliases in v2.=0A=
=0A=
>> +		ethernet1 =3D &mac1;=0A=
>> +		ethernet2 =3D &mac2;=0A=
>> +		ethernet3 =3D &mac3;=0A=
>=0A=
> ethernet1, 2, and 3 are not enabled. No need to give them an alias.=0A=
=0A=
Right, only mac0 is used. Dropping ethernet1/2/3 in v2.=0A=
=0A=
>> +	aspeed,ecc-size-mb =3D <0>;=0A=
>=0A=
> aspeed,ecc-size-mb defaults to 0, no need to set it explicitly:=0A=
=0A=
Dropping it in v2; aspeed,ecc-enabled is kept.=0A=
=0A=
>> +		compatible =3D "spi-flash", "sst,w25q256";=0A=
>=0A=
> Compatible is unnecessary for all flash nodes. It defaults to=0A=
> "jedec,spi-nor" which is also a valid compatible in sf_probe.c.=0A=
> Also, sst,w25q256 does not exist as compatible in this u-boot tree.=0A=
=0A=
Thanks, I missed that. Removing the compatible from all flash nodes in=0A=
v2 so they fall back to jedec,spi-nor.=0A=
=0A=
>> +	flash@1 {=0A=
>> +		compatible =3D "spi-flash", "sst,w25q256";=0A=
>> +		status =3D "disabled";=0A=
>=0A=
> This node is disabled by default. No need to define it then.=0A=
=0A=
Agreed, removing the disabled flash@1 node in v2.=0A=
=0A=
Thanks for the review!=0A=
=0A=
Best regards,=0A=
Jacky=

