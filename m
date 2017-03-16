Return-Path: <maxims@google.com>
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkhd22B69zDqZ7
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:36:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QsqEMfmf"; 
 dkim-atps=neutral
Received: by mail-pg0-x22c.google.com with SMTP id g2so30990500pge.3
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 14:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Rc/CWVIs0bVtGtDETo4u+tG7IOPcjVn3IbrJYk811/M=;
 b=QsqEMfmfQYuB3ZVBRtE6JPtNwKgVZoPZWYiFuvPwQWGo4nshiVmA0zDeAdQ9xhbl/Y
 33khFTwIeGcCtgGb6hZtjPBma+O77ZIvYFF3RxsvvLKf66kqUbjGyaYsst4wKZZEGVJ+
 JWOTIzXkotR4RD2R7Ci87PUmLXnebW4y2UX3BCT062Au48YsNVGHGAcWUvTAghheQFaX
 Wiw2bnT0dcPlsfNlzNS7YXYSl67TqNjsa/QwAbBDmjqgJs/R/ctay6Q5lrd4C0e2ZuAK
 4Fi2WYssnQPRinso2XH81KEM2ZT1Mu/HHcsWTfMkQd4zmcDIkZP4Fw/RETyiAqu09UeW
 5+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Rc/CWVIs0bVtGtDETo4u+tG7IOPcjVn3IbrJYk811/M=;
 b=Bcvoap4GiELvd1DBr68zi711tsU21xuAIcqWrizD9HIcJsFrz5vPZ3wvauA9f8w7WI
 XrQhq+ubcJjJaYkjCuV8fmdTkbMntDwqOZYUCc6fhwk7XMcnUv0QC+bR+oguPEJJJYUZ
 eLsMVmEsJ5+7zy2Aer38cziT64sglpJ1dxzEML1KeyoyQrITo9jqREvszrnyhIweOn+C
 S0YXI+qaA9Rp4FzrHorkomGnfdA0OugbWipnza5hd9WMuKdlh4JbYMHv3vomEuWaAtE2
 ySXL0oA7xvzN9d0mAlGxuCzIr2ULNOS0dAHbogk+7UgfJRx0mqcWP+//pcg+M1dimrd6
 nQTA==
X-Gm-Message-State: AFeK/H0euP/BFoaDtf7KhMOEfvyuBHA9UES0Fy5RTdIxd3TMbCIo2hegw4XiIDBeU4AVHpgL
X-Received: by 10.98.82.216 with SMTP id g207mr12791703pfb.139.1489700212471; 
 Thu, 16 Mar 2017 14:36:52 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id v17sm2191375pgc.20.2017.03.16.14.36.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Mar 2017 14:36:51 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH 17/17] aspeed: Network Driver configuration for EVB
Date: Thu, 16 Mar 2017 14:36:24 -0700
Message-Id: <20170316213624.140344-18-maxims@google.com>
X-Mailer: git-send-email 2.12.0.367.g23dc2f6d3c-goog
In-Reply-To: <20170316213624.140344-1-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
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
X-List-Received-Date: Thu, 16 Mar 2017 21:36:55 -0000

Enable Network Driver along with network related commands -- ping, dhcp,
mii -- in ast2500 Eval Board's defconfig.

Add MAC devices' configuration to Eval Board Device Tree.

Signed-off-by: Maxim Sloyko <maxims@google.com>

---


---
 arch/arm/dts/ast2500-evb.dts  | 14 ++++++++++++++
 configs/evb-ast2500_defconfig |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm/dts/ast2500-evb.dts b/arch/arm/dts/ast2500-evb.dts
index 723941ac0b..c47ad684a5 100644
--- a/arch/arm/dts/ast2500-evb.dts
+++ b/arch/arm/dts/ast2500-evb.dts
@@ -36,3 +36,17 @@
 	u-boot,dm-pre-reloc;
 	status = "okay";
 };
+
+&mac0 {
+	compatible = "aspeed,ast2500-nic";
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mac1link_default>, <&pinctrl_mdio1_default>;
+};
+
+&mac1 {
+	compatible = "aspeed,ast2500-nic";
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mac2link_default>, <&pinctrl_mdio2_default>;
+};
diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index 08b5f85a34..d1548f7f3c 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -21,3 +21,10 @@ CONFIG_PINCTRL=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_ASPEED=y
 CONFIG_CMD_I2C=y
+CONFIG_DM_ETH=y
+CONFIG_AST_NIC=y
+CONFIG_CMD_NET=y
+CONFIG_CMD_PING=y
+CONFIG_CMD_DHCP=y
+CONFIG_MII=y
+CONFIG_CMD_MII=y
-- 
2.12.0.367.g23dc2f6d3c-goog
