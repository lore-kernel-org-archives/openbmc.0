Return-Path: <joel@jms.id.au>
Received: from mail-pa0-x242.google.com (mail-pa0-x242.google.com
 [IPv6:2607:f8b0:400e:c03::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYfWq06NjzDqFM
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 17:30:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=lxfXxM0E; 
 dkim-atps=neutral
Received: by mail-pa0-x242.google.com with SMTP id hf6so749897pac.2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 00:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WGGpC15RL+Qwr5EqF+gI9I1LexC8PtLTZygzsobnJX0=;
 b=lxfXxM0E07Lv1NDlFTTZmJ+S3rKN4eX4UIXLab4Uts22mGLLTgvBDjktuE7xnUYM5e
 9ZVH20QrEfp+31FcxVzWcbOTyEptyk5KgY+UoQCBwM/aFj5m1kP6OQUpB10hQsSlxEEV
 QL/vy4hN9CepAjX3BbgzEzqvpdbjtuvcpQnyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WGGpC15RL+Qwr5EqF+gI9I1LexC8PtLTZygzsobnJX0=;
 b=b+DCZAwq2keyhxUwoB3IEXdlp5jwSpdpu1N0YWPj1mBIAvDeRA+1NuZDZSpFkQionH
 WPPJWLAaNCgvj547LbHejqQRO//O+JqEEHaealeM94z4AtXJXLCAk7QPaW6KjD572/d/
 sFLxiTQXqeQ40Ns2CLGZ/iBlo0QTVKvx24Kyr0xkb488UZgpOBc0KYULPPdkbYL4AxGc
 vxLUiFpZwWTYOE303NHBkPdW3RhWAYCy1I6js8fPY3Zr3z6i/U1co6tb1rnV6qwhgGn3
 AbBbSRGVmiAFX+LBO5YNitzYBCXpZMUhcDuZU9NoO41eHodDjqIprErWCUvjFGW/5pYp
 tk7g==
X-Gm-Message-State: ALyK8tLTiYTJ6v7Xa42Wf0VwTEuu1xszJip7aU62XUFP/zjF+wodS2GKdSlyGvWUtyPnPQ==
X-Received: by 10.66.197.202 with SMTP id iw10mr27039287pac.148.1466494212598; 
 Tue, 21 Jun 2016 00:30:12 -0700 (PDT)
Received: from aurora.ibm.com ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id zv2sm13096910pac.43.2016.06.21.00.30.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 21 Jun 2016 00:30:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: clg@kaod.org,
	teddy.reed@gmail.com,
	andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Subject: [u-boot 3/3] arm: aspeed: Remove cpu directory
Date: Tue, 21 Jun 2016 16:59:45 +0930
Message-Id: <1466494185-24459-4-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466494185-24459-1-git-send-email-joel@jms.id.au>
References: <1466494185-24459-1-git-send-email-joel@jms.id.au>
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
X-List-Received-Date: Tue, 21 Jun 2016 07:30:15 -0000

ast2400 support had two mostly empty functions in the CPU directory.
The only function was to enable the i and d caches, so do this in the
board file instead.

It's not clear if this was necessary as the system boots without it.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/cpu/arm926ejs/aspeed/Makefile |  1 -
 arch/arm/cpu/arm926ejs/aspeed/cpu.c    | 29 -----------------------------
 board/aspeed/ast-g4/ast-g4.c           |  4 ++++
 3 files changed, 4 insertions(+), 30 deletions(-)
 delete mode 100644 arch/arm/cpu/arm926ejs/aspeed/Makefile
 delete mode 100644 arch/arm/cpu/arm926ejs/aspeed/cpu.c

diff --git a/arch/arm/cpu/arm926ejs/aspeed/Makefile b/arch/arm/cpu/arm926ejs/aspeed/Makefile
deleted file mode 100644
index e085b7b442e7..000000000000
--- a/arch/arm/cpu/arm926ejs/aspeed/Makefile
+++ /dev/null
@@ -1 +0,0 @@
-obj-y	+= cpu.o
diff --git a/arch/arm/cpu/arm926ejs/aspeed/cpu.c b/arch/arm/cpu/arm926ejs/aspeed/cpu.c
deleted file mode 100644
index cf62293b51ab..000000000000
--- a/arch/arm/cpu/arm926ejs/aspeed/cpu.c
+++ /dev/null
@@ -1,29 +0,0 @@
-/*
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
- * MA 02111-1307 USA
- */
-
-#include <common.h>
-#include <asm/io.h>
-
-int arch_cpu_init(void)
-{
-
-	return 0;
-}
-
-void enable_caches(void)
-{
-	icache_enable();
-	//TODO .....
-	dcache_enable();
-
-}
-
diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c
index 6f705d8559b3..549be782891f 100644
--- a/board/aspeed/ast-g4/ast-g4.c
+++ b/board/aspeed/ast-g4/ast-g4.c
@@ -36,6 +36,10 @@ void show_boot_progress(int progress)
 
 int board_init (void)
 {
+	/* The BSP did this in the cpu code */
+	icache_enable();
+	dcache_enable();
+
 	/* adress of boot parameters */
 	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
 	gd->flags = 0;
-- 
2.8.1
