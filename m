Return-Path: <clg@kaod.org>
X-Greylist: delayed 2254 seconds by postgrey-1.35 at bilbo;
 Fri, 08 Jul 2016 01:10:39 AEST
Received: from 10.mo53.mail-out.ovh.net (10.mo53.mail-out.ovh.net
 [87.98.189.210])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rlgzg2jTFzDqyB
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 01:10:38 +1000 (AEST)
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo53.mail-out.ovh.net (Postfix) with ESMTP id 6D81FFF99D2
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jul 2016 16:33:00 +0200 (CEST)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
 (deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
 (Authenticated sender: clg@kaod.org)
 by player158.ha.ovh.net (Postfix) with ESMTPSA id B3C85620081;
 Thu,  7 Jul 2016 16:32:57 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH uboot v2016.05-aspeed-openbmc] aspeed/ast-g4: disables D2-PLL
 and force UART configuration at reboot 
Date: Thu,  7 Jul 2016 16:32:47 +0200
Message-Id: <1467901967-8301-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7501871083539041026
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvdekgdeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 07 Jul 2016 15:10:40 -0000

The serial configuration could probably be done in a u-boot serial
driver. Disabling D2-PLL is also required but I am not sure where to
put it.

Based on :

      https://github.com/openbmc/u-boot/commit/4b44678c11ac82c7c797bb115e276181752ad54d
      
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 board/aspeed/ast-g4/platform.S |   70 +++++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 30 deletions(-)

Index: u-boot-v2016.05-aspeed-openbmc.git/board/aspeed/ast-g4/platform.S
===================================================================
--- u-boot-v2016.05-aspeed-openbmc.git.orig/board/aspeed/ast-g4/platform.S
+++ u-boot-v2016.05-aspeed-openbmc.git/board/aspeed/ast-g4/platform.S
@@ -166,6 +166,45 @@ PATTERN_TABLE:
     ldr r2, =0x00000800
     .endm
 
+    .macro init_uart
+    /* Disable D2-PLL */
+    ldr r0, =0x1e6e202c
+    ldr r1, =0x00000010
+    str r1, [r0]
+    /* Setting the 7th bit of UART LCR to 1 gives access to the
+     * divisor latches
+     */
+    ldr r0, =0x1e78400c
+    mov r1, #0x83
+    str r1, [r0]
+    /* check SCU_MISC1 for div13 enablement */
+    ldr r0, =0x1e6e202c
+    ldr r2, [r0]
+    mov r2, r2, lsr #12
+    tst r2, #0x01
+    /* configure baudrate */
+    ldr r0, =0x1e784000
+    moveq r1, #0x0D                              @ Baudrate 115200
+    movne r1, #0x01                              @ Baudrate 115200, div13
+#if defined(CONFIG_DRAM_UART_38400)
+    moveq r1, #0x27                              @ Baudrate 38400
+    movne r1, #0x03                              @ Baudrate 38400 , div13
+#endif
+    str r1, [r0]
+    /* interrupt settings */
+    ldr r0, =0x1e784004
+    mov r1, #0x00
+    str r1, [r0]
+    /* 8N1 */
+    ldr r0, =0x1e78400c
+    mov r1, #0x03
+    str r1, [r0]
+    /* baudrate is configured. restore LCR */
+    ldr r0, =0x1e784008
+    mov r1, #0x07
+    str r1, [r0]
+    .endm
+
 /******************************************************************************
  Calibration Macro End
  ******************************************************************************/
@@ -187,6 +226,7 @@ LPC_Patch_E:
 
 .globl lowlevel_init
 lowlevel_init:
+    init_uart
 
 init_dram:
     /* save lr */
@@ -336,36 +376,6 @@ set_MPLL:
     and r1, r2, r1
     str r1, [r0]
 
-/* Debug - UART console message */
-    ldr r0, =0x1e78400c
-    mov r1, #0x83
-    str r1, [r0]
-
-    ldr r0, =0x1e6e202c
-    ldr r2, [r0]
-    mov r2, r2, lsr #12
-    tst r2, #0x01
-    ldr r0, =0x1e784000
-    moveq r1, #0x0D                              @ Baudrate 115200
-    movne r1, #0x01                              @ Baudrate 115200, div13
-#if defined(CONFIG_DRAM_UART_38400)
-    moveq r1, #0x27                              @ Baudrate 38400
-    movne r1, #0x03                              @ Baudrate 38400 , div13
-#endif
-    str r1, [r0]
-
-    ldr r0, =0x1e784004
-    mov r1, #0x00
-    str r1, [r0]
-
-    ldr r0, =0x1e78400c
-    mov r1, #0x03
-    str r1, [r0]
-
-    ldr r0, =0x1e784008
-    mov r1, #0x07
-    str r1, [r0]
-
     ldr r0, =0x1e784000
     mov r1, #0x0D                                @ '\r'
     str r1, [r0]
