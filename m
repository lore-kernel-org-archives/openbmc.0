Return-Path: <xow@google.com>
Received: from mail-pf0-x22e.google.com (mail-pf0-x22e.google.com
 [IPv6:2607:f8b0:400e:c00::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0srX4RsczDvck
 for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2016 04:20:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=JSMPS6QY; 
 dkim-atps=neutral
Received: by mail-pf0-x22e.google.com with SMTP id s8so59982321pfj.2
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=73XM1ceV3861oXdacZuXGhGima2Wy/VE1QeyDcB8dB4=;
 b=JSMPS6QY+Xzf3HKxVcdpn1/NIe6ppZ5sPijfW0A4V2beEUVNogr5mXjMq5AAdqKtjE
 1gnY61uglOoBR3+ogMQJ1/PGMnxUMBTlyHTVlBwznk+wkpo0oReH37DpOxNaoqRTB+Yq
 Knk96xRtwRDUVuMVdfFnL+9iWPTrzo/mHsJUZwDE8LRaEdBsMAQv+tEl0/dJV+7mRR9M
 YWtQNuHPwKO2URlakGOE+E/xkfEgcn7f9ILzxJkGorJ59QfUvERPr2DBq3JDL/WzDZ9m
 u9LMWoUyXqeyRfZLId8GO7B3OUVr5idOzzX3C/e5Eo58MSGKvXpOTcxbLhkcjroFVo3b
 jl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=73XM1ceV3861oXdacZuXGhGima2Wy/VE1QeyDcB8dB4=;
 b=KlzdNnluxgphtXNJgBarhDB2d+MyOb57D/Y9ZRHtkePeDvVEQEr6geiaKFLbA0vV0Y
 o19UApGmcD/NnSza1GpfbYEsM0WKUNskDGlUDXodSvwoB7MteGk3uDOxq8+VftFcglVb
 LL8yp25QwZwbfWOSm6oUdx7xethChk9ksxI/WffxUWBWiF6/u6fGGoce85YdEys3csqj
 bZkPLGR+6/eoOdpryZUqk0JHfpfKnmJqZDN0swEhfO12ZWV0+7xGHc33YAnafJv0lNSz
 R6/nsmQ64MS74dZCy7zBkDaW2QDKALH2Rv7dQImwFv9B55JxsbsZHbuIRQyf5RgByWFL
 YLQw==
X-Gm-Message-State: ABUngvfsd6FeZ9pYf2sZ1UnTvxg6abdetTrWVZAgt9ZL9NMol1rBLVreshlnH7qs9CIbomZb
X-Received: by 10.98.10.6 with SMTP id s6mr3531689pfi.8.1477070426458;
 Fri, 21 Oct 2016 10:20:26 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id f129sm6594037pfc.3.2016.10.21.10.20.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Oct 2016 10:20:26 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: f.fainelli@gmail.com
Cc: davem@davemloft.net, jaedon.shin@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 Xo Wang <xow@google.com>
Subject: [PATCH 2/2] net: phy: broadcom: Add support for BCM54612E
Date: Fri, 21 Oct 2016 10:20:13 -0700
Message-Id: <1477070413-92621-3-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1477070413-92621-1-git-send-email-xow@google.com>
References: <1477070413-92621-1-git-send-email-xow@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2016 17:20:29 -0000

This PHY has internal delays enabled after reset. This clears the
internal delay enables unless the interface specifically requests them.

Signed-off-by: Xo Wang <xow@google.com>
---
 drivers/net/phy/broadcom.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/brcmphy.h    |  1 +
 2 files changed, 49 insertions(+)

diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
index 870327e..583ef8a 100644
--- a/drivers/net/phy/broadcom.c
+++ b/drivers/net/phy/broadcom.c
@@ -337,6 +337,41 @@ static int bcm5481_config_aneg(struct phy_device *phydev)
 	return ret;
 }
 
+static int bcm54612e_config_aneg(struct phy_device *phydev)
+{
+	int ret;
+
+	/* First, auto-negotiate. */
+	ret = genphy_config_aneg(phydev);
+
+	/* Clear TX internal delay unless requested. */
+	if ((phydev->interface != PHY_INTERFACE_MODE_RGMII_ID) &&
+	    (phydev->interface != PHY_INTERFACE_MODE_RGMII_TXID)) {
+		/* Disable TXD to GTXCLK clock delay (default set) */
+		/* Bit 9 is the only field in shadow register 00011 */
+		bcm_phy_write_shadow(phydev, 0x03, 0);
+	}
+
+	/* Clear RX internal delay unless requested. */
+	if ((phydev->interface != PHY_INTERFACE_MODE_RGMII_ID) &&
+	    (phydev->interface != PHY_INTERFACE_MODE_RGMII_RXID)) {
+		u16 reg;
+
+		/* Errata: reads require filling in the write selector field */
+		bcm54xx_auxctl_write(phydev, MII_BCM54XX_AUXCTL_SHDWSEL_MISC,
+				     MII_BCM54XX_AUXCTL_MISC_RDSEL_MISC);
+		reg = phy_read(phydev, MII_BCM54XX_AUX_CTL);
+		/* Disable RXD to RXC delay (default set) */
+		reg &= ~MII_BCM54XX_AUXCTL_MISC_RXD_RXC_SKEW;
+		/* Clear shadow selector field */
+		reg &= ~MII_BCM54XX_AUXCTL_SHDWSEL_MASK;
+		bcm54xx_auxctl_write(phydev, MII_BCM54XX_AUXCTL_SHDWSEL_MISC,
+				     MII_BCM54XX_AUXCTL_MISC_WREN | reg);
+	}
+
+	return ret;
+}
+
 static int brcm_phy_setbits(struct phy_device *phydev, int reg, int set)
 {
 	int val;
@@ -485,6 +520,18 @@ static struct phy_driver broadcom_drivers[] = {
 	.ack_interrupt	= bcm_phy_ack_intr,
 	.config_intr	= bcm_phy_config_intr,
 }, {
+	.phy_id		= PHY_ID_BCM54612E,
+	.phy_id_mask	= 0xfffffff0,
+	.name		= "Broadcom BCM54612E",
+	.features	= PHY_GBIT_FEATURES |
+			  SUPPORTED_Pause | SUPPORTED_Asym_Pause,
+	.flags		= PHY_HAS_MAGICANEG | PHY_HAS_INTERRUPT,
+	.config_init	= bcm54xx_config_init,
+	.config_aneg	= bcm54612e_config_aneg,
+	.read_status	= genphy_read_status,
+	.ack_interrupt	= bcm_phy_ack_intr,
+	.config_intr	= bcm_phy_config_intr,
+}, {
 	.phy_id		= PHY_ID_BCM54616S,
 	.phy_id_mask	= 0xfffffff0,
 	.name		= "Broadcom BCM54616S",
@@ -600,6 +647,7 @@ static struct mdio_device_id __maybe_unused broadcom_tbl[] = {
 	{ PHY_ID_BCM5411, 0xfffffff0 },
 	{ PHY_ID_BCM5421, 0xfffffff0 },
 	{ PHY_ID_BCM5461, 0xfffffff0 },
+	{ PHY_ID_BCM54612E, 0xfffffff0 },
 	{ PHY_ID_BCM54616S, 0xfffffff0 },
 	{ PHY_ID_BCM5464, 0xfffffff0 },
 	{ PHY_ID_BCM5481, 0xfffffff0 },
diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
index 22c4421..60def78 100644
--- a/include/linux/brcmphy.h
+++ b/include/linux/brcmphy.h
@@ -18,6 +18,7 @@
 #define PHY_ID_BCM5421			0x002060e0
 #define PHY_ID_BCM5464			0x002060b0
 #define PHY_ID_BCM5461			0x002060c0
+#define PHY_ID_BCM54612E		0x03625e60
 #define PHY_ID_BCM54616S		0x03625d10
 #define PHY_ID_BCM57780			0x03625d90
 
-- 
2.8.0.rc3.226.g39d4020
