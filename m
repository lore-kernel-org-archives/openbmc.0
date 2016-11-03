Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t906d7126zDvRC
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 09:30:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=IoUtH/sg; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id n85so5955310pfi.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 15:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=dYQ+q85dJjPnGesTjaAIkyGXGk8d8wP7T28mUgGyT0A=;
 b=IoUtH/sgvhrDDuJ23vW8Xc6sLU5JpvQoZxBxj6UnTYA6Do9YJexWXTzLMpRqM8zuXh
 zLGd0rJj+SHmcG6So8yLhtdVfGRVPZ5GJHMYhPlHuEWCMHnKr1FTKRVutlOCqc1WpHiY
 mngYop0NPnXteJuMfyWkELjZsziHA/7eoiv6GGlBdfRoF9qxBafLa7kav2+1/bIqKg1a
 jzNFP54nDSTPDxlN0c9/3hbM2HfhV7Tn8M6tI785VQRJhlwBypKEUw5PKXtng0L9I8ue
 +RIvrtMiJjD7TLr+07e1fwWO9dYDGXFf4c55Tn2jBIhPFtUQ01PUWDTKy/nS5gpH3//O
 +1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=dYQ+q85dJjPnGesTjaAIkyGXGk8d8wP7T28mUgGyT0A=;
 b=Q2CcD1OigHzV+RRavj0EewdN+kIQMrL/Yv/Wo/DrDKxnV6Tf68+hW9jIcVrmLykohA
 gSHobWjE/Cz8nR8A22auffS3ulcqXGRcVy0qYIyjMYmwYpDS69ciuAe/yqtzJ1TslPcw
 nRrelgbr4x9RAUuxxpHylm5TNBmOI1Sf/CoKL3Bnj3lBYEbyDL8ZMYOWdDgXDcAL7il1
 zMdF/8fR5Phig31UsqL2TgBY46NR0SI7sXxxqm+CITZTqtJF/PSF7vIeJti09buCbvvR
 BBgk5cGuAKh0OM8UrCERCVTDvn93dIzXdeeY/uz7KAEKWVJ4R+63ycVctrFBpkgirPAF
 iMVw==
X-Gm-Message-State: ABUngvf82KUjam8sNLNhEdZCsTg1DQmi6BIo4HnWyQJJA0nBX1Sa3kujcEhaf0Knj7JrqA==
X-Received: by 10.99.97.15 with SMTP id v15mr17367048pgb.10.1478212248409;
 Thu, 03 Nov 2016 15:30:48 -0700 (PDT)
Received: from aurora.jms.id.au ([2403:480:11:8000:3922:4bc4:ef17:3570])
 by smtp.gmail.com with ESMTPSA id u17sm15056964pfi.1.2016.11.03.15.30.45
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 03 Nov 2016 15:30:47 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 04 Nov 2016 09:00:40 +1030
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [linux dev-4.7 PATCH 3/4] arm: aspeed: Remove setting of SCU90 from
 common
Date: Fri,  4 Nov 2016 09:00:08 +1030
Message-Id: <20161103223009.4794-4-joel@jms.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161103223009.4794-1-joel@jms.id.au>
References: <20161103223009.4794-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 03 Nov 2016 22:30:50 -0000

This hack enabled I2C buses 3 to 8 inclusive:

   Enable I2C8 function pins: 0x1
   Enable I2C7 function pins: 0x1
   Enable I2C6 function pins: 0x1
   Enable I2C5 function pins: 0x1
   Enable I2C4 function pins: 0x1
   Enable I2C3 function pins: 0x1

Bit 3 set the USB1.1 Host port 2 function, which is not yet supported in our
kernel.

Bits 13 and 15 disabled the RGMII/RMII 1 and 2 RX pin internal pull down which
is the default state.

Therefore all functionality is present in the device tree and this can be
removed.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index cfbd6d3b3b73..46e711ca275c 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -58,7 +58,6 @@ static void __init do_common_setup(void)
 	/* TODO: This should go in the GPIO driver device tree bindings */
 	writel(0x01C000FF, AST_IO(AST_BASE_SCU | 0x88));
 	writel(0xC1C000FF, AST_IO(AST_BASE_SCU | 0x8c));
-	writel(0x003FA008, AST_IO(AST_BASE_SCU | 0x90));
 
 	/* Setup scratch registers */
 	writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
-- 
2.9.3
