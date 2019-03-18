Return-Path: <dthompson@mellanox.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.7.42; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=dthompson@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="efbgEMJG";
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70042.outbound.protection.outlook.com [40.107.7.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NV6q5tJjzDqJg
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 08:43:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zT/xcTx9eTuuESKiFy1Tl8sFjsyiMTpkuaxzib/kwM=;
 b=efbgEMJGDKgi0DZYeoTlPt9tGEdtzQ9tpzfE+Eu1XW+YqHt7kngwpYNq9RKjZrCKavRh2Tg87O+oAd0lFEvSA2VsVSWFm8sokfoFhRlj2gQHYnMONuUbJ6UMte5qtZ+o20uf3PcqHzMGgRL7F/TVbIngjWoq+P9GgstTzMURaqk=
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com (52.134.4.15) by
 VI1PR0502MB3071.eurprd05.prod.outlook.com (10.175.20.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Mon, 18 Mar 2019 21:43:22 +0000
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::2127:2c98:9e0f:ca16]) by VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::2127:2c98:9e0f:ca16%3]) with mapi id 15.20.1709.015; Mon, 18 Mar 2019
 21:43:22 +0000
From: David Thompson <dthompson@mellanox.com>
To: "joel@jms.id.au" <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH U-Boot v1] aspeed/ast-scu.c: add ast_get_m_pll_clk()
 support
Thread-Topic: [PATCH U-Boot v1] aspeed/ast-scu.c: add ast_get_m_pll_clk()
 support
Thread-Index: AQHUxWc0r6mUYKw1dkSYpt8djuii16XyzIpAgB9PZgA=
Date: Mon, 18 Mar 2019 21:43:21 +0000
Message-ID: <VI1PR0502MB3869B9FD35C1F70EE4C01842DD470@VI1PR0502MB3869.eurprd05.prod.outlook.com>
References: <b0566f5d7195c4f2dba0343e02ca96635c36a7c2.1550259966.git.dthompson@mellanox.com>
 <VI1PR0502MB386985C8560A3703F3674080DD7B0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
In-Reply-To: <VI1PR0502MB386985C8560A3703F3674080DD7B0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dthompson@mellanox.com; 
x-originating-ip: [216.156.69.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89209032-fb8b-4d0a-6c6c-08d6abeabe4e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:VI1PR0502MB3071; 
x-ms-traffictypediagnostic: VI1PR0502MB3071:
x-microsoft-antispam-prvs: <VI1PR0502MB3071D5F4401FA6A7328FEF7ADD470@VI1PR0502MB3071.eurprd05.prod.outlook.com>
x-forefront-prvs: 098076C36C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(366004)(396003)(376002)(346002)(199004)(189003)(13464003)(476003)(7736002)(55016002)(9686003)(53936002)(305945005)(26005)(256004)(53546011)(68736007)(11346002)(71200400001)(81166006)(71190400001)(81156014)(7696005)(102836004)(52536014)(8676002)(486006)(76176011)(8936002)(186003)(99286004)(25786009)(229853002)(316002)(106356001)(86362001)(446003)(3846002)(6506007)(478600001)(97736004)(4326008)(5660300002)(6246003)(2501003)(74316002)(66066001)(14454004)(105586002)(33656002)(6436002)(2906002)(6116002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0502MB3071;
 H:VI1PR0502MB3869.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: igwQ+HoDCv1Vqxa7kQi4qA0kdXrhT6N8GbGtq9nY54dqsXbpZpHvmmvYYJoijsPAb5PzVVk3MNYDJ0ZM2vM/rQvY6sa6v285tsK67FbrXIxVXYpnY17pEZ9uFrSOE7K3ZV5ifXhT6r7qo2D9zHXT1oXV+cee17Wahi8D6JrNtMyDQ7nMqESSBEmpgoOKRA9bS2IWrXTvO8j7SeOadO3Ag1jGQhoXOnFeTwS+5FErjUywae8kWcPgIfMBs47bxmZoSqivEABm+cxfegrcUGfv2kNb0tctpcYRDn5m5/nzx24MuVCvozEr3M9aEvFYlg3dPyU/QaQZMikUNOWm+SAXazFZNhI349sDRbn1LKRLjMusb9+xyx/DbF1VqEG/28lX6ehELs8ufetVZfKu6Zk9zZ5EzYb5HJG8ssAg20QYVT8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89209032-fb8b-4d0a-6c6c-08d6abeabe4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2019 21:43:22.2060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3071
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
X-List-Received-Date: Mon, 18 Mar 2019 21:43:33 -0000

Hello Joel and Andrew,

I'm re-sending this patch, please take a look when you get a chance
and let me know what you think.

Regards,
Dave


David Thompson
Sr. Staff Engineer, System SW
Mellanox Technologies
1900 West Park Drive, Suite 290
Westborough MA USA 01581
Direct: +1 508-475-6375



-----Original Message-----
From: David Thompson=20
Sent: Tuesday, February 26, 2019 6:34 PM
To: David Thompson <dthompson@mellanox.com>; joel@jms.id.au; Andrew Jeffery=
 <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Subject: RE: [PATCH U-Boot v1] aspeed/ast-scu.c: add ast_get_m_pll_clk() su=
pport

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
