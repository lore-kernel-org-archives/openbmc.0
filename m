Return-Path: <dthompson@mellanox.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.14.79; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=dthompson@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="rzEGlImZ";
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140079.outbound.protection.outlook.com [40.107.14.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 448FWW0VXTzDqM4
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 10:33:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAhlSkg+nYLURRBYao4WigXD5aV6JmT0ldhzfbTO8l0=;
 b=rzEGlImZsZ9BkBU1yh4tRMRjBCkimUHU2oqpeT9q4EM8yGjk4aG7QrlABDsCxZheKvCJNGwfoKticjtxFdVWicMvSl7prURqmy+ymeAtCqvjVciMfGM4lyLD/3KqdAJviSsP9FCkfUmN/dF0phHgKbqQXd3pADB+uftgF9zIzn4=
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com (52.134.4.15) by
 VI1PR0502MB3632.eurprd05.prod.outlook.com (52.134.7.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.16; Tue, 26 Feb 2019 23:33:53 +0000
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::2127:2c98:9e0f:ca16]) by VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::2127:2c98:9e0f:ca16%3]) with mapi id 15.20.1643.019; Tue, 26 Feb 2019
 23:33:53 +0000
From: David Thompson <dthompson@mellanox.com>
To: David Thompson <dthompson@mellanox.com>, "joel@jms.id.au"
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH U-Boot v1] aspeed/ast-scu.c: add ast_get_m_pll_clk()
 support
Thread-Topic: [PATCH U-Boot v1] aspeed/ast-scu.c: add ast_get_m_pll_clk()
 support
Thread-Index: AQHUxWc0r6mUYKw1dkSYpt8djuii16XyzIpA
Date: Tue, 26 Feb 2019 23:33:53 +0000
Message-ID: <VI1PR0502MB386985C8560A3703F3674080DD7B0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
References: <b0566f5d7195c4f2dba0343e02ca96635c36a7c2.1550259966.git.dthompson@mellanox.com>
In-Reply-To: <b0566f5d7195c4f2dba0343e02ca96635c36a7c2.1550259966.git.dthompson@mellanox.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dthompson@mellanox.com; 
x-originating-ip: [108.20.21.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c04bd14f-4f59-4e4b-3fb8-08d69c42de92
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:VI1PR0502MB3632; 
x-ms-traffictypediagnostic: VI1PR0502MB3632:
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; VI1PR0502MB3632;
 23:RzaDLdOjH9YYAhByzMiVnaEX3x7wAvVEifM/74H?=
 =?us-ascii?Q?CNredbXSqxIyACV2vHzELhxRcHL9QwslUrIWuH30aaoHD9WBn+N6DJIReozG?=
 =?us-ascii?Q?Lx8Iez14BG8HjWGWH+q/yqEQne2/5oNkurEBzzbaszCQvfL6CMLM8nQmokP/?=
 =?us-ascii?Q?1JAnGuYOfiDc0HptdJdxDHTshYwENkiK6lKm2zbS7rohHkpqHGzeymCbQv5d?=
 =?us-ascii?Q?ZlmFF+rPrAylVFjSu/05GKBsaNpdvMmwVF6Dr6kengaY9cL7T56UpatbYtx+?=
 =?us-ascii?Q?BLCBDw6FP2SVTdLW16i828rsOO9y9opLdlPgf7fU+PxyOeKqxeMcPnJUKekr?=
 =?us-ascii?Q?RMKebPdlvL+1SfCNB1jjjX7fZHwNQxe/o0WhgOLpD2eQTNyM6O2rAYkZHKpV?=
 =?us-ascii?Q?5Gav508j4zoGhHv7xMdpP3CdfpADrorEUnWsC/tzYbjDMt0nC7QxsrlsKDqn?=
 =?us-ascii?Q?BKkEUm2Vo1B8plSo9kJacBNz+vdY85GotbmJfDiE8eQjhf6K4dZyzQvEVkHc?=
 =?us-ascii?Q?2+LVdzBQbJAT6uZVkZ2PYGFI8Em6j/FaTXpepN/Qh8M3s7a87XMFzgU6GAxV?=
 =?us-ascii?Q?uarnvczpUj5SwjEWAx1StGRaWnb2yaMjyhK2ZSA3k+24ptVmNUdqDhL4MiOg?=
 =?us-ascii?Q?tBhPu0z1Bke/VODvGLifma41+vs7y100JM4F7Ch1Gg83bYbNViTcinOIxIgg?=
 =?us-ascii?Q?C9LgDD1yyhRPUh3UIfrTEL+C6FkWSQo274xIrMIxwS5JDSjl3zMFROqzooUN?=
 =?us-ascii?Q?Q1BN/xIbp9zTgJ2+o844Ye/Y9nzzfUxFyGdRwkVOPKJCd93nLz80pzRQq0Eu?=
 =?us-ascii?Q?vf6mHQ4NmP9TeZiiDEPci9oIOxR61RPAELrgflFutb1oMh6HTcQSgAxpsGtY?=
 =?us-ascii?Q?KxqhX0BL7d9U7WX0TpFgCAk44QX7gEoJ/cWP/QJF+mkaBH3/wuEONb4ngafO?=
 =?us-ascii?Q?agAOJiIfj+85zlW+2m0pq6u7ohOqsNrsvB1ydrvV3lKLocE//lYc+QWz3VaL?=
 =?us-ascii?Q?RShmdfVHLyz5IJzyvbqJBLqSxoTw7co6T+7nx6bECttghL/SOKcQc9ZTwcUa?=
 =?us-ascii?Q?ebHFZdycYG/YQDAwW1JBJR2rQ3zBEWYHY62ogx4AZ4G1gW4Ru4yL57l1U8L5?=
 =?us-ascii?Q?PQSCBEZcjp0VIVmk5WK83h0kZ+PzAQmrFZgxGcB4BXlNok9U2pCs+w9MrNVl?=
 =?us-ascii?Q?H8y6RA4Wj6NqjIYUux9avVkn1nbipIktG5r20olp7SVviI7yxlzDuTKJAHRw?=
 =?us-ascii?Q?956wfXRqHH9z1Cp1TDZc=3D?=
x-microsoft-antispam-prvs: <VI1PR0502MB3632DA195D45A828F2BC4FDEDD7B0@VI1PR0502MB3632.eurprd05.prod.outlook.com>
x-forefront-prvs: 096029FF66
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(376002)(366004)(136003)(396003)(199004)(189003)(13464003)(74316002)(486006)(7696005)(305945005)(97736004)(33656002)(105586002)(76176011)(106356001)(446003)(11346002)(256004)(53936002)(476003)(14454004)(2906002)(68736007)(2501003)(25786009)(55016002)(4326008)(9686003)(6116002)(3846002)(186003)(478600001)(26005)(6436002)(53546011)(6506007)(102836004)(99286004)(71190400001)(71200400001)(8676002)(86362001)(66066001)(229853002)(110136005)(5660300002)(81156014)(81166006)(8936002)(7736002)(316002)(52536013)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0502MB3632;
 H:VI1PR0502MB3869.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KYiRG3dh5JRxS0FLUw5lLQRr97C2eLBmj/DNwn4bf0t3FJN+H1j81HqdEpTf31Oe8EnHxaUbvIAUKwG6fnFXdBgDAFjhMcwCDRfA1YAY5s5qbp3FfgN1H5ny+75RXzd9peMsTRwqPPD1HfUyWbr66DYsvgzIrV0h/vst1/nPmqw0Dw+vKlBFr9ZqfENq0m2aqoT+Klvm9WI5P2Z0LdnwOiU5X8rCuAOlEOo4ogEj6t9cRoh1aJsJ+Kl2P/s2nDvjn9/OTE6l/p6OG3/Uk8/4/VrYtLmHkLark0xO8IrFVIf+Kr/H9Qhjw2IgAbYuOK8iEIhjDCTEC+o3phsVwTxEYGV7qKDwVz+8jZj04bvqcaBZWqQcpVLzDMN73QSjdDfGjWbJ9tDj99RIytpEIghNyHnp6+Mij5q8OmmfWMZmOsQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04bd14f-4f59-4e4b-3fb8-08d69c42de92
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2019 23:33:53.3933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3632
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
X-List-Received-Date: Tue, 26 Feb 2019 23:33:59 -0000

+Andrew

-----Original Message-----
From: David Thompson <dthompson@mellanox.com>=20
Sent: Friday, February 15, 2019 3:19 PM
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org; David Thompson <dthompson@mellanox.com>
Subject: [PATCH U-Boot v1] aspeed/ast-scu.c: add ast_get_m_pll_clk() suppor=
t

The source code for ast_get_m_pll_clk() is adapted from the file "arch/arm/=
mach-aspeed/ast-bmc-scu.c" contained in the bootloader portion of the ASPEE=
D AST2500 SDK.

The values for "A2" silicon revision IDs are from the document "AST2500/AST=
2520 Integrated Remote Management Processor A2 Datasheet", version 1.6, pag=
es 373-374.

Signed-off-by: David Thompson <dthompson@mellanox.com>
Reviewed-by: Shravan Ramani <sramani@mellanox.com>
---
 arch/arm/include/asm/arch-aspeed/ast_scu.h |  1 +
 arch/arm/mach-aspeed/ast-scu.c             | 30 ++++++++++++++++++++++++++=
++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/=
asm/arch-aspeed/ast_scu.h
index d248416..dcbc673 100644
--- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
+++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
@@ -37,6 +37,7 @@ extern void ast_scu_get_who_init_dram(void);
=20
 extern u32 ast_get_clk_source(void);
 extern u32 ast_get_h_pll_clk(void);
+extern u32 ast_get_m_pll_clk(void);
 extern u32 ast_get_ahbclk(void);
=20
 extern u32 ast_scu_get_vga_memsize(void); diff --git a/arch/arm/mach-aspee=
d/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c index 0cc0d67..6184ff4 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -100,6 +100,10 @@ static struct soc_id soc_map_table[] =3D {
 	SOC_ID("AST2510-A1", 0x04010103),
 	SOC_ID("AST2520-A1", 0x04010203),
 	SOC_ID("AST2530-A1", 0x04010403),
+	SOC_ID("AST2500-A2", 0x04030303),
+	SOC_ID("AST2510-A2", 0x04030103),
+	SOC_ID("AST2520-A2", 0x04030203),
+	SOC_ID("AST2530-A2", 0x04030403),
 };
=20
 void ast_scu_init_eth(u8 num)
@@ -235,6 +239,32 @@ u32 ast_get_h_pll_clk(void)
 	return clk;
 }
=20
+u32 ast_get_m_pll_clk(void)
+{
+	u32 clk =3D 0;
+	u32 m_pll_set =3D ast_scu_read(AST_SCU_M_PLL);
+
+	if (m_pll_set & SCU_M_PLL_OFF)
+		return 0;
+
+	/* Programming */
+	clk =3D ast_get_clk_source();
+	if (m_pll_set & SCU_M_PLL_BYPASS) {
+		return clk;
+	} else {
+		/* P =3D SCU20[13:18]
+		 * M =3D SCU20[5:12]
+		 * N =3D SCU20[0:4]
+		 * mpll =3D 24MHz * [(M+1) /(N+1)] / (P+1)
+		 */
+		clk =3D ((clk * (SCU_M_PLL_GET_MNUM(m_pll_set) + 1)) /
+			   (SCU_M_PLL_GET_NNUM(m_pll_set) + 1)) /
+			(SCU_M_PLL_GET_PDNUM(m_pll_set) + 1);
+	}
+	debug("m_pll =3D %d\n", clk);
+	return clk;
+}
+
 u32 ast_get_ahbclk(void)
 {
 	unsigned int axi_div, ahb_div, hpll;
--
2.1.2
