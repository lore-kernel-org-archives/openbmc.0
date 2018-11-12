Return-Path: <3vozpWwcKB2MCMVFDNEHPPHMF.DPNPQFOCNDMJTUT.PaMBCT.PSH@flex--bluecmd.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--bluecmd.bounces.google.com
 (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com;
 envelope-from=3vozpwwckb2mcmvfdnehpphmf.dpnpqfocndmjtut.pambct.psh@flex--bluecmd.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RUxMET5F"; 
 dkim-atps=neutral
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com
 [IPv6:2607:f8b0:4864:20::d49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42ttJl1J61zF3Qh
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 01:22:56 +1100 (AEDT)
Received: by mail-io1-xd49.google.com with SMTP id q1-v6so5137122iop.23
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 06:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=+pT/cOzESxK96Dg2CeCwzeNkzFLvWktjRC8KJ7wdilk=;
 b=RUxMET5Folr+4rzmKq4xHunlYyiiHHXzT4LQurlmyA6le8jjz5XamtMtg8LcKKf8p7
 QMdM2gp4BPN6Lg9s86NXh8e90rOhKraUM8MOHjlIDKr1zrQ8LOinCBb9zlaZks6FkteM
 posH+Yhnv4chtJK8/WEc45Nx5nmP+/gwg1lbD9V2jKNo47i1dr3nrHBJG8xgtmLG7FiB
 Mf47xh+w3tZqjXc/yGfjMpq6uvSgAJWnMZoiY4Xq1A53AFruK6uBe0ksphw1aG1/33AP
 doGZ9Kb4/FdwY+0wPKD7uvRl1L1cJXC5YJYyC0OYsYIiZjd1cQiAZs5R5ihFWh4u5fkQ
 xPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=+pT/cOzESxK96Dg2CeCwzeNkzFLvWktjRC8KJ7wdilk=;
 b=P/lXGwbdKNrLuFhqXYKr/4fa8MV1CwI7HF376lRcD4X3y3pwaXO3c7RSsHGaiHlY4/
 oWklXH+cauBy2APDWe1DkK3TY/LffrhPZhSe4PxfCcIH8pKkxZ9Zv8Ug1pSNOAejFuxc
 b3uBEqAFB2lCM6C0MY0kxKM6PHqFP76SRDP4tWcekYi+8/VLYUVtAul2wgML3jjLc02t
 7b00ZFFtiJBsh2RLSNJIPsNmF+YEGVbDdREQQ3Vg5oxsP6johW4P3mfZK15T2dL2TpLR
 o2SCp6iN3PaLMxVUABBQZIi5IwE0NPeHJePOQ4uiM3bX5VrDXFYsrvubRxn5uUIT+1Nt
 XUMA==
X-Gm-Message-State: AGRZ1gJTEZPZd//d86PobL8CGdjwciH1Fzb1Jfu+1vKp18q3N+N9u/2V
 YqIkNGZe2c2aMR0joTsOTbLsnKlWFPMOytBaHNhxBSuRgoxnr7qk30aVYfeq2Gk8lqb14uPvV6R
 iQONcMGAlObmxtw03HkwMkX5nxZxDLXjCdPp32/lzRBZIjA1s66ouvBcj3qC4BglSA88=
X-Google-Smtp-Source: AJdET5c+18jRyrnRf4AGA5MW0xoi1E4P1+7Wk8HXwPR1DSwbUwkf3Kh72AXkz1wUxQknwxD+jQf1QdjOCOCn
X-Received: by 2002:a24:992:: with SMTP id 140-v6mr11001623itm.3.1542032574858; 
 Mon, 12 Nov 2018 06:22:54 -0800 (PST)
Date: Mon, 12 Nov 2018 15:22:32 +0100
Message-Id: <20181112142231.162425-1-bluecmd@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
Subject: [PATCH] qemu: aspeed_smc: Calculate checksum on normal DMA
From: Christian Svensson <bluecmd@google.com>
To: openbmc@lists.ozlabs.org
Cc: blue@cmd.nu, joel@jms.id.au, andrew@aj.id.au, clg@kaod.org, 
 Christian Svensson <bluecmd@google.com>
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
X-List-Received-Date: Mon, 12 Nov 2018 14:23:03 -0000

This patch adds the missing checksum calculation on normal DMA transfer.
According to the datasheet this is how the SMC should behave.

Verified on AST1250 that the hardware matches the behaviour.

Signed-off-by: Christian Svensson <bluecmd@google.com>
---
 hw/ssi/aspeed_smc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 55ceffe100..0dc22e44cf 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -871,6 +871,7 @@ static void aspeed_smc_dma_rw(AspeedSMCState *s)
         s->regs[R_DMA_FLASH_ADDR] += 4;
         s->regs[R_DMA_DRAM_ADDR] += 4;
         s->regs[R_DMA_LEN] -= 4;
+        s->regs[R_DMA_CHECKSUM] += data;
     }
 }
 
-- 
2.19.1.930.g4563a0d9d0-goog
