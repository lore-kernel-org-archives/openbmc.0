Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRr06dCSzDsdv
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=JnU6ZuMB; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7A162641150
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 15:35:37 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Xnw6CaK9bX3t; Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 06FBB641077;
 Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 06FBB641077
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058136; bh=B9YVlOOz3z12bGOmH3JOxvLanx39JZfoA3xj3vgKv8Y=;
 h=From:To:Subject:Date:Message-Id;
 b=JnU6ZuMBsBGughAAR/vXEwrynHhnDAytOjC4ktaX/QRHTD9BHF+U4JrjKGU5RN9Ff
 Ak5sVNzicQt163JDCJDA2Fx2q9jttrSKc8Y6ZsEoQnQSX63876ovAGOxi51xoe7mcp
 TRpBCTBdMKLNnOqxwjsRxgo8BKPRkmjbWiUzGTqM=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id N89cGWAWJiwk; Fri, 16 Sep 2016 15:35:35 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 3A56F641141;
 Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 07/17] pinctrl-aspeed-g4: Add definition for GPIO pins J2 and
 O2
Date: Fri, 16 Sep 2016 15:35:23 -0500
Message-Id: <1474058133-27363-8-git-send-email-tpearson@raptorengineering.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
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
X-List-Received-Date: Fri, 16 Sep 2016 20:35:45 -0000

This is required for Firestone to boot.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c |   15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index e356619..610ab48 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -499,6 +499,9 @@ MS_PIN_DECL(E7, GPIOH7, ROMD15, RXD6);
 
 FUNC_GROUP_DECL(UART6, A8, C7, B7, A7, D7, B6, A6, E7);
 
+#define K5 74
+SSSF_PIN_DECL(K5, GPIOJ2, SGPMO, SIG_DESC_SET(SCU84, 10));
+
 #define J3 75
 SSSF_PIN_DECL(J3, GPIOJ3, SGPMI, SIG_DESC_SET(SCU84, 11));
 
@@ -727,10 +730,14 @@ SS_PIN_DECL(V6, GPIOO0, VPIG8);
 SIG_EXPR_LIST_DECL_SINGLE(VPIG9, VPI24, VPI24_DESC, SIG_DESC_SET(SCU88, 9));
 SS_PIN_DECL(Y5, GPIOO1, VPIG9);
 
+#define AA4 114
+SIG_EXPR_LIST_DECL_SINGLE(VPIR0, VPI30, VPI30_DESC, SIG_DESC_SET(SCU88, 10));
+SS_PIN_DECL(AA4, GPIOO2, VPIR0);
+
 FUNC_GROUP_DECL(VPI18, T5, U3, V1, U4, V2, AA22, W5, Y4, AA3, AB2);
 FUNC_GROUP_DECL(VPI24, T5, U3, V1, U4, V2, AA22, W5, Y4, AA3, AB2, V6, Y5);
-FUNC_GROUP_DECL(VPI30, T5, U3, V1, U4, V2, W1, U5, W4, Y3, AA22, W5, Y4, AA3,
-		AB2);
+FUNC_GROUP_DECL(VPI30, T5, U3, V1, U4, V2, W1, U5, W4, Y3, AA4, AA22, W5, Y4,
+		AA3, AB2);
 
 #define Y7 125
 SIG_EXPR_LIST_DECL_SINGLE(GPIOP5, GPIOP5);
@@ -1154,6 +1161,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_G4_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(J20),
 	ASPEED_PINCTRL_PIN(J21),
 	ASPEED_PINCTRL_PIN(J3),
+	ASPEED_PINCTRL_PIN(K5),
 	ASPEED_PINCTRL_PIN(K18),
 	ASPEED_PINCTRL_PIN(L22),
 	ASPEED_PINCTRL_PIN(N21),
@@ -1189,6 +1197,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_G4_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(Y4),
 	ASPEED_PINCTRL_PIN(Y5),
 	ASPEED_PINCTRL_PIN(Y7),
+	ASPEED_PINCTRL_PIN(AA4),
 };
 
 static const struct aspeed_pin_group aspeed_g4_groups[] = {
@@ -1231,6 +1240,7 @@ static const struct aspeed_pin_group aspeed_g4_groups[] = {
 	ASPEED_PINCTRL_GROUP(FLBUSY),
 	ASPEED_PINCTRL_GROUP(FLWP),
 	ASPEED_PINCTRL_GROUP(UART6),
+	ASPEED_PINCTRL_GROUP(SGPMO),
 	ASPEED_PINCTRL_GROUP(SGPMI),
 	ASPEED_PINCTRL_GROUP(VGAHS),
 	ASPEED_PINCTRL_GROUP(VGAVS),
@@ -1341,6 +1351,7 @@ static const struct aspeed_pin_function aspeed_g4_functions[] = {
 	ASPEED_PINCTRL_FUNC(FLBUSY),
 	ASPEED_PINCTRL_FUNC(FLWP),
 	ASPEED_PINCTRL_FUNC(UART6),
+	ASPEED_PINCTRL_FUNC(SGPMO),
 	ASPEED_PINCTRL_FUNC(SGPMI),
 	ASPEED_PINCTRL_FUNC(VGAHS),
 	ASPEED_PINCTRL_FUNC(VGAVS),
-- 
1.7.9.5
