Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF32A606A31A
	for <openbmc@archiver.kernel.org>; Mon, 23 Nov 2026 11:42:45 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jY3vz2SDRz2y7r;
	Mon, 23 Nov 2026 22:42:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2406:e500:4440:2::701" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795434159;
	cv=pass; b=Ml+ZVX2X3mPpLIDB2JzEOty2NTn8KV62voNEgptmRoAHjAWiecXwRZduiQ0LC9Yw2q3XukVcxi71BRwj9gdYO6IwyUIYXqVkg0IORwOLlO+7T5TX9zg2hrsZAfv3ziMCCvxmi/UAxMFzgFCMfzRbd+oqZMhKXsVP6rAtb+aRwozd2aVcsLbtz/hi7l080/SPYDy6CIaxj2ySUvjdDoE17nxQu7HCqzUMBg004PYlN03W3I+1evHwaO/D6Q9DO66QqC2IVjujATAI13Nq5bse4LwLZQqvdehbUDZPo7bq2xwTe+86NngN0XF8VmUMpEtj/Y4fJix/MURMqPmW//WD2g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795434159; c=relaxed/relaxed;
	bh=qflCw6MLcC6/TPQ9uGOeHSFaR8cQduednA4IY9mtf8w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R8pIRgKuQWRM7FF4GNsa/WrPxT8tyj/FhwY+unJEJgI3157y+aXAzcVfZrAGDW5/alLcEJem0qBXofFamLxSUQ40z8/F049X/dyfvbOP8v50MNiV2VqkfNH6RtElF53d7UUo63aGPQHLbEGpwj6VwO0BJEO4QfJqVv3CoqsdA+pqyxT4tCqtjWUasqEsjgEd45muQmJmneVtUXdRzSOW3L+93tjoKhv86HtgTB/GCSYH3IZjVNQOeYWKQQY1LnDdRgj/17gXrH5JO3m08iuYBG6hqyF53R0eC7OOSitdNWTv5JPrL6qnfMY0v96s7Fnbh7KbO3SNu2HBkAvdBkcRDQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass (client-ip=2406:e500:4440:2::701; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=changhuang.liang@starfivetech.com; receiver=lists.ozlabs.org) smtp.mailfrom=starfivetech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=starfivetech.com (client-ip=2406:e500:4440:2::701; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=changhuang.liang@starfivetech.com; receiver=lists.ozlabs.org)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on20701.outbound.protection.partner.outlook.cn [IPv6:2406:e500:4440:2::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jY3vx6TNtz2xwP
	for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2026 22:42:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9XzFm0Guf64dy7oY6lTx17+UUzhSKI+6BGW191e/wAUnQD2U456MVmS/ckRP5lEBo3bByFu6YXC2XDiS5kYuhoZrxfs9dNRPnoTyYx40unk3KTY8fgKbfH5mTg47WohjsgSu3WLdedWU8lOl7Ru81ktzNmNrjJzrCwyJN3U3JBdWj8MkCEIAxaE8xq8OdhyRP+gqskDnInZlugoJmVvzvOOBDGDcZjOKKOlYNPvUkk8eAzBbPxFAgqm2LHyJadSs9k4WQquXvgwm/IKaD2l4hcsl2tTxdGzCMGPzUPM0xiU8SRsbpf9QK+hdNHhA7zyUJ7oKIz9qvYlxin6NMY+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qflCw6MLcC6/TPQ9uGOeHSFaR8cQduednA4IY9mtf8w=;
 b=TMww3eqBjQf7Q8kLOv1a4vZFch215ybPtt2AL60vkGyOVlgHzwi85kcdIU2hpryE6uEH7KCstJWqMUSWGNIV2geumnPfNrKLp1ozU8j/eX78aXaOA+So2ZyJza33m6XDJPWu0bZ/awLBnQT8OeS4pV/PKdk9c3Ti8tv4UTTzGoTrVIuV4lWFM2/zOzAjic+hPTaYjd9xibqtS79H6krPWat68+upE1aJhx0D9bnECthQksNISKY/lThrlrYCUNIN38Bzl7ffZHCQgEleS6AD/RhVvtF+M5Xiyo1P3Xb7Y2t3ur79YgSkfcGkDDVsrmFz4nrzGMYCaArML6mHtdD1cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1265.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 11:42:03 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 11:42:03 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 0/6] Add StarFive JHB100 PECI support
Thread-Topic: [PATCH v4 0/6] Add StarFive JHB100 PECI support
Thread-Index: AQHdX79MgESjguh3uE+6JouDVISisLc7v9Cg
Date: Mon, 23 Nov 2026 11:42:03 +0000
Message-ID:
 <ZQ4PR01MB120241AD34E2D3685954FF17F2452@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1265:EE_
x-ms-office365-filtering-correlation-id: d7963fd0-a399-43ff-a2d6-08df4956cb08
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|38070700021|10067099003|56012099006|261028144727099003|261022105027099003|261021135927099003|261026121527099003|261026140227099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 wXL9JO3l9I70JqUyZERIQcfNMSelvO3Q8H0rgfJ9SIw4pGxNX85TmtuI4Mkq3fRSd4sxva+XKqXHKl6q5lWSwNZMa/dtoVd4GoT6A6I6YWNSGTS+YOVlIV2x4s2WuJERsdmTmtQ3Z0TN2WAhOQP+GOnKK4pX0hf+aSRmxOdDDfPfKH2R9YlS4PKOEaH2AWeWIIpJ3qO4VQro6Blsfu783TZz9T8drnJn/Xyhl2FP4+OQYLjVuxaKR8mrg98rp9BuXj9z+U4iOe1zlBa47+z7sEfzRBMG0Y64xJ8ukV5mR9kBUzY+agwVenK0yMX+/eYPd7Z2HVrg/HHe6xUDPxBEGwoRtxAxMXNVM3LF+z8cD2wJC0ivdJzyWX+c1zcW8gnjF8FW59Yq+drfntnczWWqrpuZ+Sxki28rmYwihJ3+YliTNDSDrHDbQboLXeyHoYL/99m3emGU8MU4GMwApkMZKDxDU1BEstyv0XKdyz1cm3j8x0vkOGgKARQrGscbFWMMwz8+RuQ7vIvBBwvBzGpVuKmb7WGs50shcMlY1O3oZiB7w5RQs7IThQD+fz5BBbrs
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(38070700021)(10067099003)(56012099006)(261028144727099003)(261022105027099003)(261021135927099003)(261026121527099003)(261026140227099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6C8sACFObz1+axDm/b2l3QW9El5jbsX5KNSSD8eUcAnYGBJ+kL7n1OVP0mPi?=
 =?us-ascii?Q?qcut5iKBJOAxZ4M/AZzZqEf1rNjT9I9mEfnHZn1xYlT2E9CZW5Ugah5wAHNP?=
 =?us-ascii?Q?f2bt7S6l9HqfdTcJO6/G6bs2v/SdDGMpU7op210Qmu1CEXATKlUBm1JMuGCh?=
 =?us-ascii?Q?zelA3TnNMEU/FfGVFSe+FoLhcnabW/+AvUPRsfAXzuMWmBAPmbc8ugAnWDl5?=
 =?us-ascii?Q?epUkCe3QTeYdFjnrsciWrD/lnhP7cJ3DJbBlXvsUlbyYndbC4TJWcwUpQNdi?=
 =?us-ascii?Q?NrcIZI1ExjacCVHsXjqFtnPe1s5u//I1Orx+CtHtjBw1yHxyEUWrqyV9DBXp?=
 =?us-ascii?Q?OTD4k6uxTs0lRVqQ1v1z8ZhaN0xEgjBuQueDj35R3vZahzpgdUOByKkcuXef?=
 =?us-ascii?Q?hIxUkUVkaLT5pbwpZZDD/91VpmF1TfyhKKEAIG/cBgH85CrOkLqDWI/ARvu9?=
 =?us-ascii?Q?qfCCj9kmVi0thsiFQ/3DSl5t+OZqFu7mlvYoptK8oyLWIWl1n78BvLkRTugC?=
 =?us-ascii?Q?rQgPUsnhh/zOrIRoXzNNeTjj6JvpKk2vgeoW/Aq1qjdGwvjSxsa5b+RJ7wQ0?=
 =?us-ascii?Q?njqe8WzkVWRQ2tdwp45Pzpd8RELR5vVg5WtUgAQnPk/Sl7eCcVgfFDBByGv7?=
 =?us-ascii?Q?iIivksOzGoQfgfTlLF2XYMxJp40TzLpry1Jgp+Ist+lOMj0AtCzn64qDOvk9?=
 =?us-ascii?Q?Ib3flkUPWoxwaHkKF0pQc1UFapNVFNz/mAsIhnlnh1UfvDLVa4Zdks2eMIjt?=
 =?us-ascii?Q?VDYZpi+N3XsQQT3dVwjOg4jeaib4DvXH85qHXiixFgm2gag1lk2QwYcYUWA1?=
 =?us-ascii?Q?7FYNpCiAVLsSLtH4+I2aZr9ZErNhUUxZ43+Nc3dzD7BfO/UjBLJa/8wlFvkn?=
 =?us-ascii?Q?02IeADyndOcHe2YYIQEUi+wpMLB9ZHSdQjP7GW7GdrLTFUPaUgFr6c3XAFRY?=
 =?us-ascii?Q?IBzza5k5uyziVBK1wzv5rgVOqQXwRn55OmE0yUrOjalsSGPNQfHv3uBRGF+K?=
 =?us-ascii?Q?O5LdhWHEFvr1FDgBCl0s1N36FJjjgBzLE50iY4iF9VckjQsycpnja6VuT0Jn?=
 =?us-ascii?Q?CZZewnOfelVLM9pN/o7Kf0LOyfXxeO5N7wedRNUqurogtLGmoFDCtB2WWVXI?=
 =?us-ascii?Q?SHL0MLVQS5W/ltP08QVg7DA+9G8d6RSkActqqIRfxqjdHngTjjk1Xhg56U0Y?=
 =?us-ascii?Q?VsrzdDNnzWSAN10EVNowVht3fYK2RzKe4SB4S3q5O/ypi3sQoqVGE1Pjeqxb?=
 =?us-ascii?Q?5OJQRe4t/Cap6tzFFm2M+EIyUuq+0LYznPPChsEATB8nQQtPgExtrNrPHWt/?=
 =?us-ascii?Q?w162A4tIvbcnCtSd8oVEJva390CW3RIdADqV2Uv8GzF35GGKIXGjc7DoXYNe?=
 =?us-ascii?Q?7Wc/xdS3FKcsNk3taSq+uOvu4wMWe1fKZNktrUJ1i8bL6w4Bu3yXwcyOXoiG?=
 =?us-ascii?Q?XNqwxDKn3UJzxO3aOFK6NLTzDAuwqCtKpWsUw7C/J0C90t2hF19PAgduAmqx?=
 =?us-ascii?Q?DK3idOn6k9VtZ7r6LUxjrvNpSCdPASqMxiotVrxNy9aiyis87H2xJw2EHq8M?=
 =?us-ascii?Q?1epimkGTzga9wQf2VSFrJxdSoGpURg60EAg5xpIEdEqEXnBXYhrRBKh7EyjJ?=
 =?us-ascii?Q?GZx6Kkwmj09b6fGzNvocHwmnBefm+SEmoZpVLPpU9xy+4n2aJzGF4TghomqP?=
 =?us-ascii?Q?m8H88m4S+D6qxzj5HIVgHSGp8FUnuXbqI5ANsNNwlJoECCaTiMRwlrWhIP5F?=
 =?us-ascii?Q?zf1Gpg8PbNLWswnXvWfA6Kq1dCaVzPg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d7963fd0-a399-43ff-a2d6-08df4956cb08
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 11:42:03.1668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GRDQIXlVTpT2e013SWVDkC9Yu6YfW4q1bbIayHVaZU2MvmJUWtz5/0uQJOJmQS37JNjRe3Tsns2sWxPDJDLCMbjNnd6craOttXHwDj+wArmDhAD2QkbCFj/0w21r4kq9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1265
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Iwona

> Add PECI controller driver for StarFive JHB100 SoC. The driver supports P=
ECI
> protocol communication for CPU thermal management.
>=20
> This series has been tested on the JHB100 EVB1 board.
>=20
> Changes since v3:
> PATCH 1/3/4/5/6:
> - Add Iwona's "Reviewed-by" tag.
>=20
> PATCH 2:
> - Reorder the linux/unaligned.h include.
> - Clear pending interrupts before starting a transfer.
> - Narrow the spinlock critical section.
>=20
> v3:
> https://lore.kernel.org/all/20261008100623.7085-1-changhuang.liang@star
> fivetech.com/
> v2:
> https://lore.kernel.org/all/20260928075956.62298-1-changhuang.liang@star
> fivetech.com/
> v1:
> https://lore.kernel.org/all/20260903133408.110847-1-changhuang.liang@st
> arfivetech.com/
>=20
> Changhuang Liang (6):
>   dt-bindings: peci: Add StarFive JHB100 PECI controller
>   peci: controller: Add StarFive JHB100 PECI driver
>   peci: Add support for PECI CC 0x83 retry condition
>   peci: cpu: Add Intel Granite Rapids support

A gentle ping on this series. All patches have now received your Reviewed-b=
y tags.=20
Do you plan to apply it soon, or would you prefer that I resend the series?

Best Regards,
Changhuang

