Return-Path: <prvs=9281b6405=Samuel.Jiang@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=9281b6405=samuel.jiang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 43rVtW3h8XzDqfL
 for <openbmc@lists.ozlabs.org>; Fri,  1 Feb 2019 19:40:51 +1100 (AEDT)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 01 Feb 2019 16:40:43 +0800
Received: from samueljiang-System-Product-Name.dhcpserver.local
 (10.243.91.252) by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1531.3; Fri, 1 Feb 2019 16:40:42 +0800
From: <Samuel.Jiang@quantatw.com>
To: <KWLIU@nuvoton.com>, <joel@jms.id.au>, <tomer.maimon@nuvoton.com>,
 <fran.hsu@quantatw.com>
CC: <openbmc@lists.ozlabs.org>
Subject: [PATCH v1 4/6] ARM: dts: nuvoton: nuvoton-npcm750-runbmc: Add i2c
 ioexpander nodes
Date: Fri, 1 Feb 2019 16:40:25 +0800
Message-ID: <20190201084027.19501-4-Samuel.Jiang@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201084027.19501-1-Samuel.Jiang@quantatw.com>
References: <20190201084027.19501-1-Samuel.Jiang@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.243.91.252]
X-ClientProxiedBy: mailbx07.quanta.corp (10.243.91.102) To
 mailbx06.quanta.corp (10.243.91.101)
X-TM-AS-Product-Ver: SMEX-12.0.0.1727-8.200.1013-24402.003
X-TM-AS-Result: No--7.353800-0.000000-31
X-TM-AS-MatchedID: 704421-121504-700918-701016-188019-700264-700163-700383-1
 21224-702638-702829-702474-701635-711871-780016-701177-700767-843079-121270
 -780011-708295-148004-148036-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
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
X-List-Received-Date: Fri, 01 Feb 2019 08:40:52 -0000

From: Samuel Jiang <Samuel.Jiang@quantatw.com>

Add i2c ioexpender nodes and define gpios which outside RunBMC Module

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 404 +++++++++++++++++++
 1 file changed, 404 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
index f2eda099d20a..a90c66ea2e17 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -35,6 +35,8 @@
 		i2c8 = &i2c8;
 		i2c9 = &i2c9;
 		i2c10 = &i2c10;
+    i2c11 = &i2c11;
+    i2c12 = &i2c12;
 		i2c13 = &i2c13;
 		spi0 = &spi0;
 		spi1 = &spi1;
@@ -450,6 +452,408 @@
 				status = "okay";
 			};
 
+			i2c11: i2c@8b000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				pca9539_g1a: pca9539-g1a@74 {
+					compatible = "nxp,pca9539";
+					reg = <0x74>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					reset-gpios = <&gpio7 4 GPIO_ACTIVE_LOW>;    /* Rst gpio228 */
+					G1A_P0_0 {
+						gpio-hog;
+						gpios = <0 0>;
+						output-high;
+						line-name = "TPM_BMC_ALERT_N";
+					};
+					G1A_P0_1 {
+						gpio-hog;
+						gpios = <1 0>;
+						input;
+						line-name = "FM_BIOS_TOP_SWAP";
+					};
+					G1A_P0_2 {
+						gpio-hog;
+						gpios = <2 0>;
+						input;
+						line-name = "FM_BIOS_PREFRB2_GOOD";
+					};
+					G1A_P0_3 {
+						gpio-hog;
+						gpios = <3 0>;
+						input;
+						line-name = "BMC_SATAXPCIE_0TO3_SEL";
+					};
+					G1A_P0_4 {
+						gpio-hog;
+						gpios = <4 0>;
+						input;
+						line-name = "BMC_SATAXPCIE_4TO7_SEL";
+					};
+					G1A_P0_5 {
+						gpio-hog;
+						gpios = <5 0>;
+						output-low;
+						line-name = "FM_UV_ADR_TRIGGER_EN_N";
+					};
+					G1A_P0_6 {
+						gpio-hog;
+						gpios = <6 0>;
+						input;
+						line-name = "RM_THROTTLE_EN_N";
+					};
+					G1A_P1_0 {
+						gpio-hog;
+						gpios = <8 0>;
+						input;
+						line-name = "FM_BMC_TPM_PRES_N";
+					};
+					G1A_P1_1 {
+						gpio-hog;
+						gpios = <9 0>;
+						input;
+						line-name = "FM_CPU0_SKTOCC_LVT3_N";
+					};
+					G1A_P1_2 {
+						gpio-hog;
+						gpios = <10 0>;
+						input;
+						line-name = "FM_CPU1_SKTOCC_LVT3_N";
+					};
+					G1A_P1_3 {
+						gpio-hog;
+						gpios = <11 0>;
+						input;
+						line-name = "PSU1_ALERT_N";
+					};
+					G1A_P1_4 {
+						gpio-hog;
+						gpios = <12 0>;
+						input;
+						line-name = "PSU2_ALERT_N";
+					};
+					G1A_P1_5 {
+						gpio-hog;
+						gpios = <13 0>;
+						input;
+						line-name = "H_CPU0_FAST_WAKE_LVT3_N";
+					};
+					G1A_P1_6 {
+						gpio-hog;
+						gpios = <14 0>;
+						output-high;
+						line-name = "I2C_MUX1_RESET_N";
+					};
+					G1A_P1_7 {
+						gpio-hog;
+						gpios = <15 0>;
+						input;
+						line-name = "FM_CPU_CATERR_LVT3_N";
+					};
+				};
+				pca9539_g1b: pca9539-g1b@75 {
+					compatible = "nxp,pca9539";
+					reg = <0x75>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					/*reset-gpios = <&gpio7 4 GPIO_ACTIVE_LOW>;     Rst gpio228 */
+					G1B_P0_0 {
+						gpio-hog;
+						gpios = <0 0>;
+						input;
+						line-name = "PVDDQ_ABC_PINALERT_N";
+					};
+					G1B_P0_1 {
+						gpio-hog;
+						gpios = <1 0>;
+						input;
+						line-name = "PVDDQ_DEF_PINALERT_N";
+					};
+					G1B_P0_2 {
+						gpio-hog;
+						gpios = <2 0>;
+						input;
+						line-name = "PVDDQ_GHJ_PINALERT_N";
+					};
+					G1B_P0_3 {
+						gpio-hog;
+						gpios = <3 0>;
+						input;
+						line-name = "PVDDQ_KLM_PINALERT_N";
+					};
+					G1B_P0_5 {
+						gpio-hog;
+						gpios = <5 0>;
+						input;
+						line-name = "FM_BOARD_REV_ID0";
+					};
+					G1B_P0_6 {
+						gpio-hog;
+						gpios = <6 0>;
+						input;
+						line-name = "FM_BOARD_REV_ID1";
+					};
+					G1B_P0_7 {
+						gpio-hog;
+						gpios = <7 0>;
+						input;
+						line-name = "FM_BOARD_REV_ID2";
+					};
+					G1B_P1_0 {
+						gpio-hog;
+						gpios = <8 0>;
+						input;
+						line-name = "FM_OC_DETECT_EN_N";
+					};
+					G1B_P1_1 {
+						gpio-hog;
+						gpios = <9 0>;
+						input;
+						line-name = "FM_FLASH_DESC_OVERRIDE";
+					};
+					G1B_P1_2 {
+						gpio-hog;
+						gpios = <10 0>;
+						output-low;
+						line-name = "FP_PWR_ID_LED_N";
+					};
+					G1B_P1_3 {
+						gpio-hog;
+						gpios = <11 0>;
+						output-low;
+						line-name = "BMC_LED_PWR_GRN";
+					};
+					G1B_P1_4 {
+						gpio-hog;
+						gpios = <12 0>;
+						output-low;
+						line-name = "BMC_LED_PWR_AMBER";
+					};
+					G1B_P1_5 {
+						gpio-hog;
+						gpios = <13 0>;
+						output-high;
+						line-name = "FM_BMC_FAULT_LED_N";
+					};
+					G1B_P1_6 {
+						gpio-hog;
+						gpios = <14 0>;
+						output-high;
+						line-name = "FM_CPLD_BMC_PWRDN_N";
+					};
+					G1B_P1_7 {
+						gpio-hog;
+						gpios = <15 0>;
+						output-high;
+						line-name = "BMC_LED_CATERR_N";
+					};
+				};
+			};
+
+			i2c12: i2c@8c000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				pca9539_g2a: pca9539-g2a@74 {
+					compatible = "nxp,pca9539";
+					reg = <0x74>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					reset-gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;    /* Rst gpio188 */
+					G2A_P0_0 {
+						gpio-hog;
+						gpios = <0 0>;
+						output-high;
+						line-name = "BMC_PON_RST_REQ_N";
+					};
+					G2A_P0_1 {
+						gpio-hog;
+						gpios = <1 0>;
+						output-high;
+						line-name = "BMC_RST_IND_REQ_N";
+					};
+					G2A_P0_2 {
+						gpio-hog;
+						gpios = <2 0>;
+						input;
+						line-name = "RST_BMC_RTCRST";
+					};
+					G2A_P0_3 {
+						gpio-hog;
+						gpios = <3 0>;
+						output-high;
+						line-name = "FM_BMC_PWRBTN_OUT_N";
+					};
+					G2A_P0_4 {
+						gpio-hog;
+						gpios = <4 0>;
+						output-high;
+						line-name = "RST_BMC_SYSRST_BTN_OUT_N";
+					};
+					G2A_P0_5 {
+						gpio-hog;
+						gpios = <5 0>;
+						output-high;
+						line-name = "FM_BATTERY_SENSE_EN_N";
+					};
+					G2A_P0_6 {
+						gpio-hog;
+						gpios = <6 0>;
+						output-high;
+						line-name = "FM_BMC_READY_N";
+					};
+					G2A_P0_7 {
+						gpio-hog;
+						gpios = <7 0>;
+						input;
+						line-name = "IRQ_BMC_PCH_SMI_LPC_N";
+					};
+					G2A_P1_0 {
+						gpio-hog;
+						gpios = <8 0>;
+						input;
+						line-name = "FM_SLOT4_CFG0";
+					};
+					G2A_P1_1 {
+						gpio-hog;
+						gpios = <9 0>;
+						input;
+						line-name = "FM_SLOT4_CFG1";
+					};
+					G2A_P1_2 {
+						gpio-hog;
+						gpios = <10 0>;
+						input;
+						line-name = "FM_NVDIMM_EVENT_N";
+					};
+					G2A_P1_3 {
+						gpio-hog;
+						gpios = <11 0>;
+						input;
+						line-name = "PSU1_BLADE_EN_N";
+					};
+					G2A_P1_4 {
+						gpio-hog;
+						gpios = <12 0>;
+						input;
+						line-name = "BMC_PCH_FNM";
+					};
+					G2A_P1_5 {
+						gpio-hog;
+						gpios = <13 0>;
+						input;
+						line-name = "FM_SOL_UART_CH_SEL";
+					};
+					G2A_P1_6 {
+						gpio-hog;
+						gpios = <14 0>;
+						input;
+						line-name = "FM_BIOS_POST_CMPLT_N";
+					};
+				};
+				pca9539_g2b: pca9539-g2b@75 {
+					compatible = "nxp,pca9539";
+					reg = <0x75>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					/*reset-gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;*/
+					G2B_P0_0 {
+						gpio-hog;
+						gpios = <0 0>;
+						input;
+						line-name = "FM_CPU_MSMI_LVT3_N";
+					};
+					G2B_P0_1 {
+						gpio-hog;
+						gpios = <1 0>;
+						input;
+						line-name = "FM_BIOS_MRC_DEBUG_MSG_DIS";
+					};
+					G2B_P0_2 {
+						gpio-hog;
+						gpios = <2 0>;
+						input;
+						line-name = "FM_CPU1_DISABLE_BMC_N";
+					};
+					G2B_P0_3 {
+						gpio-hog;
+						gpios = <3 0>;
+						output-low;
+						line-name = "BMC_JTAG_SELECT";
+					};
+					G2B_P0_4 {
+						gpio-hog;
+						gpios = <4 0>;
+						output-low;
+						line-name = "PECI_MUX_SELECT";
+					};
+					G2B_P0_5 {
+						gpio-hog;
+						gpios = <5 0>;
+						output-high;
+						line-name = "I2C_MUX2_RESET_N";
+					};
+					G2B_P0_6 {
+						gpio-hog;
+						gpios = <6 0>;
+						input;
+						line-name = "FM_BMC_CPLD_PSU2_ON";
+					};
+					G2B_P0_7 {
+						gpio-hog;
+						gpios = <7 0>;
+						output-high;
+						line-name = "PSU2_ALERT_EN_N";
+					};
+					G2B_P1_0 {
+						gpio-hog;
+						gpios = <8 0>;
+						output-high;
+						line-name = "FM_CPU_BMC_INIT";
+					};
+					G2B_P1_1 {
+						gpio-hog;
+						gpios = <9 0>;
+						output-high;
+						line-name = "IRQ_BMC_PCH_SCI_LPC_N";
+					};
+					G2B_P1_2 {
+						gpio-hog;
+						gpios = <10 0>;
+						output-low;
+						line-name = "PMB_ALERT_EN_N";
+					};
+					G2B_P1_3 {
+						gpio-hog;
+						gpios = <11 0>;
+						output-high;
+						line-name = "FM_FAST_PROCHOT_EN_N";
+					};
+					G2B_P1_4 {
+						gpio-hog;
+						gpios = <12 0>;
+						output-high;
+						line-name = "BMC_NVDIMM_PRSNT_N";
+					};
+					G2B_P1_5 {
+						gpio-hog;
+						gpios = <13 0>;
+						output-low;
+						line-name = "FM_BACKUP_BIOS_SEL_H_BMC";
+					};
+					G2B_P1_6 {
+						gpio-hog;
+						gpios = <14 0>;
+						output-high;
+						line-name = "FM_PWRBRK_N";
+					};
+				};
+			};
+
 			i2c13: i2c@8d000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.17.1
