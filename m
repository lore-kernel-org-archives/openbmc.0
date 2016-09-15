Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZr3f549TzDsYk
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:43:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=IEK5DVKv; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 564B9641141
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:35:39 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WFuaht1FMviB for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:35:38 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id ADE2E641142
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:35:38 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com ADE2E641142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971738; bh=nNX/fC0PfE3qZPxToNOua7g2XFa7FFfq0dNC8vgqjXs=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=IEK5DVKvcOhGyZ3/K2p22H/5A1ABeN8DFI8nD491VbzrveLeuAmf33Nl+41AF4qnk
 fe8L2owPZaWF/S/S+JimETmLWG9UwboLs8Ut+Fg5fE1sjQ9p2TXORBeUh/8YVTTzJN
 JXKd3g38yc/2RCGcN+EnFeGG4yVCHIEUuavBTKjU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id n39sfR01AiS6 for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:35:38 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id 5D879641141
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:35:38 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:35:38 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <1740217293.194628.1473971738317.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 07/16] pinctrl-aspeed-g4: Add definition for GPIO pins J2 and
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: pinctrl-aspeed-g4: Add definition for GPIO pins J2 and
Thread-Index: 6V+IPUdj8lNMI43X8H66GBeeCP2cDw==
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2016 20:43:43 -0000

 O2

This is required for Firestone to boot.
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
