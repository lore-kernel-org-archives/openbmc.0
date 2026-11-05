Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4D5606A329
	for <openbmc@archiver.kernel.org>; Thu,  5 Nov 2026 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U8UDOd7x
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jL5gm2svQz2xyh;
	Fri, 06 Nov 2026 02:24:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::122e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793892244;
	cv=none; b=eQSzQeeyfhIbnbRRD2Q1kM0zkr3OEQ0ZdAaZZdyFz1gbVVGx+GXnEMbHYO0l7C4qvhF9SSEXczwkM8i4mewcgL7Xt43TFhAulKQdSrrYSPjdWOIB7G4/uPuv4mr4SUr8K3kmIJDEkBNx0mkiadoNuUHEIJBpJ4V7tuKDfQv2uh0qY3IfpA/9eqkyLlsWS2MrI/NV3f3glVLG2FehGBvlTxOOTv8Z/meDar5TgfBtGekoURNNH219kZhr2v4TeyGX7sQy3mZnXrq8bEvSIMWp06kuct1o7ExioCbFYwIrdLy7xQXoDjB5dCFCrixo4Fxa5oE2x/ocnd8bifGWu0pTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793892244; c=relaxed/relaxed;
	bh=sNeCcAcnq+kq7Knv2crVqvIQp/nQfPFY9SZmNDJttrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l6WIeNLtiJiUCkkPLCJVafMYOnejF5q8nsuuBfh66ZX9BLviNqNMTE/YrgcPJMM+1meYIwrNte+KCPHAp7B3g9XMNBGh0K0Y6RNYwhVEiUDkeS3zquJHWM9M5Vjec4jZ/LXzRYe7sjnCBGX6D3j+j3iUmwMZTKEKs5DS991+aph+iw7DphK2Xm/Ji0v8vKcj1XcE+XK4sYPaW0jgFnrZftSABXqnbyLfJgICDg51HNJPH7+/xdvkyMU42in85umz9fICXlnIKxLckiPBrHg1uX42lTa4L/cZDmM9zYwoYKhlXf6vjpRyVMIYvffPa2AJs9OtUIVuwpp97FCBVp8Yqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U8UDOd7x; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::122e; helo=mail-dl1-x122e.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U8UDOd7x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::122e; helo=mail-dl1-x122e.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x122e.google.com (mail-dl1-x122e.google.com [IPv6:2607:f8b0:4864:20::122e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jL5gk0nWpz2xN4
	for <openbmc@lists.ozlabs.org>; Fri, 06 Nov 2026 02:24:00 +1100 (AEDT)
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-19305bcb72cso1823307c88.1
        for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2026 07:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793892239; x=1794497039; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNeCcAcnq+kq7Knv2crVqvIQp/nQfPFY9SZmNDJttrk=;
        b=U8UDOd7xgrLzUaqfOqQPNT/AkkMTHdvWGMYWCNW6Q6l5ciBnIhzFScyTwjRY1mqvR+
         IPwMwBlqqmdLGf3wFpoWZ5WPHnZz/rXEb85fJHDPBC/YwZFrNCXk5lCmujv7aCBIJ/YJ
         ptucH2+Li1AR3K7n6pUTBsafO5Go4P7u0Cl3guAXWzRPhXj5FVCrPDnYTReKDpwMThfZ
         B4c3rhttjUqFVZ3Y8WVpFvFSp3ZCY9BNC6qc5LOn1oRaD2B/n5n/JweDurskF0H5bFIm
         VsKCfvVDHOFh+Xi47INtjr4mITD/Rd/SYScan/7ANLViI2b8uu+f75Q8JIrOCws6weer
         oB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892239; x=1794497039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sNeCcAcnq+kq7Knv2crVqvIQp/nQfPFY9SZmNDJttrk=;
        b=WkMSiVr0c/foJeZWir5JJo4qrEM5w1mba+eNbnN5gxlD2oBx/qKtuI/8JY93+pB5YX
         6JrymdftmIzuOqKnJ8RV3PLcn7PP60ZwhW4mW/8/E/0HgGVYWBXPja81jiurr7CpHPVw
         UbVbwMDqqmsMFKUvBbU68ie3PbAzKceZOJ1cWysXg7sNWqb5Kf+Q5TNielPbErRI2Dev
         5ZmirJBbfUYpmzz6yh+B1Pu/u702JhIybtORkSit/YQ7mkXpzudQf4Qe3Eg2woW+vas9
         lw+UvTTfpxvRgiVVrbBHxZA+zM49n0/wtzqEB6mNLDEpR0wm8v3ewaaqVOh8whYS4MOB
         f2sA==
X-Forwarded-Encrypted: i=1; AKwUvBx+klh2opudX+eZ/AP15KHYYflSTUpqRuUqi6ikvFzaep4fUrr2kse/79MWMCp79C3psjcM7LOp@lists.ozlabs.org
X-Gm-Message-State: APuU4Z81M8o74cEH9K8eSNWqSRgm5p7nMm4sB/HmHHlHEokil804ELiC
	FUOm7WT0VsEpgN6XoK8f1tvnwExc9bRlclSZjCUuPJDOkHNkKtaXBeMs
X-Gm-Gg: AYBFou1mtZrZ+zlqIRQ+m5ZTqob6joUZHQe5Y0vHiUhA8tb/iNelHPOJmUaevGo0mKZ
	lBXImzfDCWjfpM7K6T0H+y7B0Jf0iCCLY3b3xopI7ZnuGEMtPjCsqc7cW+uNtJdI6SqaIEsuVC5
	H5SD7n0MCq8dS0sEBWvvbEh2ErAI6ssVJmhTGVjRoRnaD2BthQzNy/KPTSeriwZDef/nefuCz48
	0hghXANtmTjue/UlZM63zYmtvx5rjtZJIMjoWk2WcTNiThY2bJegbSNkQoNxKwI2xaxBqobgDDj
	BRcAVxZAJ8UgtZYMJAO1qMOIUdtbN7wE8rD5JUaIs5Vye0Fn960CkGqCSNy93jUoTFSPn65Cr0l
	MD6lLbbymJKDdmWbmDp+3C64x1IQXXYJg0oA/YUNCv6UGIm5T7c8mXAETK74ctgEB8gTaPjJnoY
	idgHhLQATcZk6gFdP4AhKyP/sRmx0SnR1HUa3dBYhPQxKzyZX3ulbP0s9BGGx9pXYQNWPArxL5X
	b19edAhpXtihK6A10QgqeC3kKelIuTOt4aE9BLeJFlEeY8fnuHWuzV1Ja1755c2alrZcXc+sDS1
	7YYsqj0Hi0wQ5rRwX5yGXmaq5Yqpt7rbZ6YWRUa0QyhXCQ==
X-Received: by 2002:a05:7022:f108:b0:150:c9c5:1ce4 with SMTP id a92af1059eb24-1ac55960a70mr24069179c88.6.1793892236997;
        Thu, 05 Nov 2026 07:23:56 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245ac2f44sm17862752c88.0.2026.11.05.07.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:23:56 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linusw@kernel.org
Cc: andrew@codeconstruct.com.au,
	joel@jms.id.au,
	brgl@kernel.org,
	tan.siewert@9elements.com,
	billy_tsai@aspeedtech.com,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v3] pinctrl: aspeed: Hand over global GPIOP passthrough to local mux controls
Date: Thu,  5 Nov 2026 20:53:47 +0530
Message-ID: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022024314.48623-1-prasanth.padarthi10@gmail.com>
References: <20261022024314.48623-1-prasanth.padarthi10@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On B650D4U, GPIO-only host power control fails when SCU51C[9]
enables GPIOP passthrough, even after the normal GPIO request path
clears the individual SCU4BC selections.

Transfer globally selected GPIOP0-P5 THRU roles to SCU4BC[29:24]
before registering the controller, then clear the active shared
sources. Leave PWM selection and the strap-source selector unchanged.
Clear SCU510[28] through SCU514 and verify the shared enables cleared.

If handover fails, retain an instance-local error and reject affected
GPIO and mux requests before changing their mux state. Check every
pin in a mux group before calling the shared helper. Retain prepared
local selections after partial failure rather than blindly restoring
a shared enable.

Probe-time normalization policy, concurrent SCU writers and
post-handover registration failure remain open design questions.
Electrical continuity, mixed-pair forwarding, protected-write paths,
PWM coexistence and SCU510[28] hardware handling remain unvalidated.

The implementation passed remote power-on, remote graceful power-off
and physical-button power-on tests on B650D4U with an OpenBMC Linux
6.18.24-based kernel. The rebased version was ARM compile-tested on
v7.4-rc1 using aspeed_g5_defconfig with AST2600 pinctrl enabled.
The rebased kernel has not been tested on hardware.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 145 ++++++++++++++++++++-
 1 file changed, 141 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 85d6640ff..be22a9184 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -4,7 +4,10 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/types.h>
@@ -36,6 +39,8 @@
 #define SCU4D8		0x4D8 /* Multi-function Pin Control #23 */
 #define SCU500		0x500 /* Hardware Strap 1 */
 #define SCU510		0x510 /* Hardware Strap 2 */
+#define SCU514		0x514 /* Hardware Strap 2 Clear */
+#define SCU51C		0x51c /* Hardware Strap 3 */
 #define SCU610		0x610 /* Disable GPIO Internal Pull-Down #0 */
 #define SCU614		0x614 /* Disable GPIO Internal Pull-Down #1 */
 #define SCU618		0x618 /* Disable GPIO Internal Pull-Down #2 */
@@ -2743,12 +2748,56 @@ static struct aspeed_pinctrl_data aspeed_g6_pinctrl_data = {
 	.nconfmaps = ARRAY_SIZE(aspeed_g6_pin_config_map),
 };
 
+struct aspeed_g6_probe_data {
+	struct aspeed_pinctrl_data pdata;
+	int thru_error;
+};
+
+static bool aspeed_g6_is_thru_pin(unsigned int pin)
+{
+	return pin >= AB22 && pin <= AB23;
+}
+
+static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev,
+					 struct pinctrl_gpio_range *range,
+					 unsigned int offset)
+{
+	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	struct aspeed_g6_probe_data *g6 =
+		container_of(pdata, struct aspeed_g6_probe_data, pdata);
+
+	if (g6->thru_error && aspeed_g6_is_thru_pin(offset))
+		return g6->thru_error;
+
+	return aspeed_gpio_request_enable(pctldev, range, offset);
+}
+
+static int aspeed_g6_set_mux(struct pinctrl_dev *pctldev,
+			     unsigned int function, unsigned int group)
+{
+	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	struct aspeed_g6_probe_data *g6 =
+		container_of(pdata, struct aspeed_g6_probe_data, pdata);
+	const struct aspeed_pin_group *pgroup = &pdata->pinmux.groups[group];
+	unsigned int i;
+
+	/* Check the entire group before the shared helper changes any pin. */
+	if (g6->thru_error) {
+		for (i = 0; i < pgroup->npins; i++) {
+			if (aspeed_g6_is_thru_pin(pgroup->pins[i]))
+				return g6->thru_error;
+		}
+	}
+
+	return aspeed_pinmux_set_mux(pctldev, function, group);
+}
+
 static const struct pinmux_ops aspeed_g6_pinmux_ops = {
 	.get_functions_count = aspeed_pinmux_get_fn_count,
 	.get_function_name = aspeed_pinmux_get_fn_name,
 	.get_function_groups = aspeed_pinmux_get_fn_groups,
-	.set_mux = aspeed_pinmux_set_mux,
-	.gpio_request_enable = aspeed_gpio_request_enable,
+	.set_mux = aspeed_g6_set_mux,
+	.gpio_request_enable = aspeed_g6_gpio_request_enable,
 	.strict = true,
 };
 
@@ -2778,15 +2827,103 @@ static const struct pinctrl_desc aspeed_g6_pinctrl_desc = {
 	.confops = &aspeed_g6_conf_ops,
 };
 
+/*
+ * Experimental: transfer the global GPIOP0-P5 THRU selection to the
+ * individual mux controls before registering any pinctrl consumers.
+ * PWM selection is higher priority and is deliberately left unchanged.
+ *
+ * Do not undo the local selections on error: a shared enable may already
+ * have cleared. Keeping the equivalent local selections preserves routing
+ * while rejecting affected requests, rather than granting an unsafe GPIO.
+ * Signal continuity during this transfer still needs hardware validation.
+ */
+static int aspeed_g6_thru_handover(struct regmap *scu)
+{
+	const u32 local_mask = GENMASK(29, 24);
+	unsigned int strap2, strap3, local;
+	int ret;
+
+	ret = regmap_read(scu, SCU510, &strap2);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU51C, &strap3);
+	if (ret)
+		return ret;
+
+	if (!(strap2 & BIT(28)) &&
+	    ((strap2 & BIT(30)) || !(strap3 & BIT(9))))
+		return 0;
+
+	/* Preserve every globally selected role, including under PWM. */
+	ret = regmap_update_bits(scu, SCU4BC, local_mask, local_mask);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU4BC, &local);
+	if (ret)
+		return ret;
+	if ((local & local_mask) != local_mask)
+		return -EPERM;
+
+	/* Leave the inactive GPIOZ6 source alone in dedicated-strap mode. */
+	if (!(strap2 & BIT(30)) && (strap3 & BIT(9))) {
+		ret = regmap_update_bits(scu, SCU51C, BIT(9), 0);
+		if (ret)
+			return ret;
+	}
+
+	if (strap2 & BIT(28)) {
+		/* SCU510 is write-one-set; do not use an ordinary RW clear. */
+		ret = regmap_write(scu, SCU514, BIT(28));
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_read(scu, SCU510, &strap2);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU51C, &strap3);
+	if (ret)
+		return ret;
+	if ((strap2 & BIT(28)) ||
+	    (!(strap2 & BIT(30)) && (strap3 & BIT(9))))
+		return -EPERM;
+
+	return 0;
+}
+
 static int aspeed_g6_pinctrl_probe(struct platform_device *pdev)
 {
-	int i;
+	struct aspeed_g6_probe_data *g6;
+	struct regmap *scu;
+	int i, ret;
+
+	if (!pdev->dev.parent)
+		return -ENODEV;
+	scu = syscon_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(scu))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scu),
+				     "No SCU regmap for THRU handover\n");
+
+	g6 = devm_kzalloc(&pdev->dev, sizeof(*g6), GFP_KERNEL);
+	if (!g6)
+		return -ENOMEM;
+	memcpy(&g6->pdata, &aspeed_g6_pinctrl_data, sizeof(g6->pdata));
+
+	ret = aspeed_g6_thru_handover(scu);
+	if (ret == -EPROBE_DEFER)
+		return ret;
+	if (ret) {
+		g6->thru_error = ret;
+		dev_warn(&pdev->dev,
+			 "THRU handover failed (%d); GPIOP0-P5 mux requests blocked\n",
+			 ret);
+	}
 
 	for (i = 0; i < ARRAY_SIZE(aspeed_g6_pins); i++)
 		aspeed_g6_pins[i].number = i;
 
 	return aspeed_pinctrl_probe(pdev, &aspeed_g6_pinctrl_desc,
-			&aspeed_g6_pinctrl_data);
+			&g6->pdata);
 }
 
 static const struct of_device_id aspeed_g6_pinctrl_of_match[] = {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


