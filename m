Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 745091A0791
 for <openbmc@lists.ozlabs.org>; Sat, 20 Feb 2016 06:53:20 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455909068435334.65343714559845;
 Fri, 19 Feb 2016 11:11:08 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <njames@us.ibm.com>,
	Norman James <nkskjames@gmail.com>
Subject: [PATCH u-boot] Move UART setup outside DRAM init
Date: Fri, 19 Feb 2016 13:11:06 -0600
Message-Id: <1455909066-21813-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455909066-21813-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455909066-21813-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Feb 2016 19:53:21 -0000

From: Norman James <njames@us.ibm.com>

Signed-off-by: Norman James <nkskjames@gmail.com>
---
 board/aspeed/ast2400/platform.S | 81 +++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 39 deletions(-)

diff --git a/board/aspeed/ast2400/platform.S b/board/aspeed/ast2400/platform.S
index dd94da0..5e048a5 100644
--- a/board/aspeed/ast2400/platform.S
+++ b/board/aspeed/ast2400/platform.S
@@ -184,6 +184,48 @@ LPC_Patch_E:
 
 .globl lowlevel_init
 lowlevel_init:
+    /* setup UART */
+    ldr r0, =CONFIG_ASPEED_COM_LCR
+    mov r1, #0x83
+    str r1, [r0]
+
+    ldr r0, =0x1e6e202c
+    ldr r1, =0x00000010
+    str r1, [r0]
+
+    ldr r2, [r0]
+    mov r2, r2, lsr #12
+    tst r2, #0x01
+    ldr r0, =CONFIG_ASPEED_COM
+#if CONFIG_BAUDRATE == 115200
+    moveq r1, #0x0D                              @ Baudrate 115200
+    movne r1, #0x01                              @ Baudrate 115200, div13
+#endif
+#if CONFIG_BAUDRATE == 57600
+    moveq r1, #0x1A                              @ Baudrate 57600
+    movne r1, #0x02                              @ Baudrate 57600, div13
+#endif
+#if CONFIG_BAUDRATE == 38400
+    moveq r1, #0x27                              @ Baudrate 38400
+    movne r1, #0x03                              @ Baudrate 38400 , div13
+#endif
+#if CONFIG_BAUDRATE == 9600
+    moveq r1, #0x9c                              @ Baudrate 9600
+    movne r1, #0x0C                              @ Baudrate 9600 , div13
+#endif
+    str r1, [r0]
+
+    ldr r0, =CONFIG_ASPEED_COM_IER
+    mov r1, #0x00
+    str r1, [r0]
+
+    ldr r0, =CONFIG_ASPEED_COM_LCR
+    mov r1, #0x03
+    str r1, [r0]
+
+    ldr r0, =CONFIG_ASPEED_COM_IIR
+    mov r1, #0x07
+    str r1, [r0]
 
 init_dram:
     /* save lr */
@@ -338,45 +380,6 @@ set_MPLL:
     ldr r1, =0xFFFF0000                          @ enable UART3 and UART4
     str r1, [r0]
 
-    ldr r0, =CONFIG_ASPEED_COM_LCR
-    mov r1, #0x83
-    str r1, [r0]
-
-    ldr r0, =0x1e6e202c
-    ldr r2, [r0]
-    mov r2, r2, lsr #12
-    tst r2, #0x01
-    ldr r0, =CONFIG_ASPEED_COM
-#if CONFIG_BAUDRATE == 115200
-    moveq r1, #0x0D                              @ Baudrate 115200
-    movne r1, #0x01                              @ Baudrate 115200, div13
-#endif
-#if CONFIG_BAUDRATE == 57600
-    moveq r1, #0x1A                              @ Baudrate 57600
-    movne r1, #0x02                              @ Baudrate 57600, div13
-#endif
-#if CONFIG_BAUDRATE == 38400
-    moveq r1, #0x27                              @ Baudrate 38400
-    movne r1, #0x03                              @ Baudrate 38400 , div13
-#endif
-#if CONFIG_BAUDRATE == 9600
-    moveq r1, #0x9c                              @ Baudrate 9600
-    movne r1, #0x0C                              @ Baudrate 9600 , div13
-#endif
-    str r1, [r0]
-
-    ldr r0, =CONFIG_ASPEED_COM_IER
-    mov r1, #0x00
-    str r1, [r0]
-
-    ldr r0, =CONFIG_ASPEED_COM_LCR
-    mov r1, #0x03
-    str r1, [r0]
-
-    ldr r0, =CONFIG_ASPEED_COM_IIR
-    mov r1, #0x07
-    str r1, [r0]
-
     ldr r0, =CONFIG_ASPEED_COM
     mov r1, #0x0D                                @ '\r'
     str r1, [r0]
-- 
2.7.1
