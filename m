Return-Path: <3KB7CXAcKB1kM5EKLI57FF7C5.3FDFG5E2D3C9JKJ.FQC12J.FI7@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::94a; helo=mail-ua1-x94a.google.com;
 envelope-from=3kb7cxackb1km5ekli57ff7c5.3fdfg5e2d3c9jkj.fqc12j.fi7@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="X384Dtov"; 
 dkim-atps=neutral
Received: from mail-ua1-x94a.google.com (mail-ua1-x94a.google.com
 [IPv6:2607:f8b0:4864:20::94a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qqC26DFHzDqf3
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 06:52:59 +1000 (AEST)
Received: by mail-ua1-x94a.google.com with SMTP id h6so290669uab.0
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 13:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=UdRjZsdQfrDf7mO5THmgwA0o1RoQcAzem6bKtQpYtr8=;
 b=X384Dtov8FUyJ0zwWGMIWqGI5cG5K88U/k537mlwcBRio62zLDY6WKvt4am8KvS6cW
 Y9/dGt7zHxjM+J3+hCZem3081et/KCl13u5dL3w546La7YcrTUWu3rEE535y2SlrNRNb
 OYQP3XhIc9FncUElmVKK1M2hMHqG7hCZerrq3wWWJ6GXE3oroxFlAfxtL+BbMEhuo4Hu
 heTGFi0OaUktTy1Acc2urj1RGiKvT1l76qOb4a01A8IdtJoZfAF2rnd2WNTNAuDZOx8v
 84DXQ+3V6Gfl06pc6LJd1RvhlA00oh9ZnsXPLwlRuT4sWM06i9iAIjGcr1CjUSjKuBbI
 FqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=UdRjZsdQfrDf7mO5THmgwA0o1RoQcAzem6bKtQpYtr8=;
 b=fkpFDJf3Akzb0n6wEAkA3Rf/YsRCPeW8gujnNCEcl0pGheLRPKrjDyNe1CupmpfKeo
 kma2AMsg1YW3IhyA7Oxp/WwnY6UmTBCpTZdaDexByvFlZltyfdXEgYOIPy2Uqz5tHxLz
 EqtHxpM8xk1JnnxeKmTo0PYRpXylycQRRKkn6oissFm4iZVWrOgdLeAAzkHodNaz/JlJ
 9ncghZbadng1SK+eqFKTN4OPvOJPJXJjT+5UGRGVfFKcV7sMsnFeer8rDWYzeBZ2gZ2y
 frV/CQ8U1GsVJm1kOBJ5FAxbZJb9bkQgQ+6QVxfgf9bIEiuiUclrrVSn8sGhURFeai50
 5X+g==
X-Gm-Message-State: APjAAAVF54uW6TQASOaZCWxvVgmZVSj/r4P/24mP0ZktRr+NDbVJipgr
 oTymBh8SxrBgGI317TVwIbY7UrTFzi/G
X-Google-Smtp-Source: APXvYqzu4Y+d83ga1xAL5kvcqTYfrlS9UaVpE8sluDtniYzEfzUtgUrbTFemaHdx/CIH8egdnW2qEtYSE+4a
X-Received: by 2002:a67:485:: with SMTP id 127mr1936179vse.182.1556225576678; 
 Thu, 25 Apr 2019 13:52:56 -0700 (PDT)
Date: Thu, 25 Apr 2019 13:52:54 -0700
Message-Id: <20190425205254.95368-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH dev-5.0 v2 3/3] drivers/misc: Add Aspeed P2A control driver
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 25 Apr 2019 20:53:03 -0000

Fixup compiler warnings:
 - 108 warning: ISO C90 forbids mixed declarations and code
 - 264 warning: unused variable 'value'
 - 335 warning: unused variable 'res'

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Patrick Venture <venture@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
(cherry picked from commit 2d1c31cb642b44e3d621643b8d30e15e5e4df4e4)
---
v2:
 - First instance of this patchset on the chain, no changes.
---
 drivers/misc/aspeed-p2a-ctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/aspeed-p2a-ctrl.c b/drivers/misc/aspeed-p2a-ctrl.c
index c0521b2ffc6a..9736821972ef 100644
--- a/drivers/misc/aspeed-p2a-ctrl.c
+++ b/drivers/misc/aspeed-p2a-ctrl.c
@@ -99,13 +99,14 @@ static void aspeed_p2a_disable_bridge(struct aspeed_p2a_ctrl *p2a_ctrl)
 
 static int aspeed_p2a_mmap(struct file *file, struct vm_area_struct *vma)
 {
+	unsigned long vsize;
 	struct aspeed_p2a_user *priv = file->private_data;
 	struct aspeed_p2a_ctrl *ctrl = priv->parent;
 
 	if (ctrl->mem_base == 0 && ctrl->mem_size == 0)
 		return -EINVAL;
 
-	unsigned long vsize = vma->vm_end - vma->vm_start;
+	vsize = vma->vm_end - vma->vm_start;
 	pgprot_t prot = vma->vm_page_prot;
 
 	if (vma->vm_pgoff + vsize > ctrl->mem_base + ctrl->mem_size)
@@ -261,7 +262,6 @@ static int aspeed_p2a_open(struct inode *inode, struct file *file)
 static int aspeed_p2a_release(struct inode *inode, struct file *file)
 {
 	int i;
-	u32 value;
 	u32 bits = 0;
 	bool open_regions = false;
 	struct aspeed_p2a_user *priv = file->private_data;
@@ -332,7 +332,7 @@ static int aspeed_p2a_ctrl_probe(struct platform_device *pdev)
 {
 	struct aspeed_p2a_ctrl *misc_ctrl;
 	struct device *dev;
-	struct resource *res, resm;
+	struct resource resm;
 	struct device_node *node;
 	int rc = 0;
 
-- 
2.21.0.593.g511ec345e18-goog
