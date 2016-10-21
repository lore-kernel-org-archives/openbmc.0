Return-Path: <xow@google.com>
Received: from mail-pf0-x231.google.com (mail-pf0-x231.google.com
 [IPv6:2607:f8b0:400e:c00::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0srW3qLBzDvcn
 for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2016 04:20:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=OMCwoAtK; 
 dkim-atps=neutral
Received: by mail-pf0-x231.google.com with SMTP id r16so59989702pfg.1
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a2cR/Fw1KlhMJqUgNhvVsuslQ11J8OQEqeLSyZlRsQY=;
 b=OMCwoAtKvEzjKUxNML06ZIcKDyZTfvxxykuw4caAj1gJPjsVy1zqARJ1ZsDT09N0ki
 FXWj+trZaSiNeflAxvDKCjNlakYVRHdy6Oc1VJUueg2g3ikLJWniXk99Baj3P1e6JHuY
 PLSvcm9UYZrnvThM4r6fH+PCDPwQOLdGfxQ7AaDX8telLgJat/Z+9WMAOOgD6SXopZkm
 BbSFxzoqFL2+p3o8AARY+7rbOGHTm5WQRAj6S3mFBcR5WqZXvKV3pAqF75YaTKtfONDm
 juo8B5aTVgWW0l4kNEcMg+fy4HLcdLSf84dehkUqDr28ZBDffdUk4ZyTIJuzqdm67Zxz
 9mJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a2cR/Fw1KlhMJqUgNhvVsuslQ11J8OQEqeLSyZlRsQY=;
 b=VTL4uAbtG3O37nmDdr5IGu/TEhm1KQkXErYPpL2NbAZGcKU6bALWe7bO/6KTOjj0Zu
 3DVpYPVigSsz5a25e034C1C+UovVBPs19dr0Robq7fHbRUuTGmWvLvQBG5asobQr3Dfc
 zc6KAXGv+s6BLQmB4C+7pHkqFGRxZV6KFYwCRNmd1OfOXmQzjTB6aSGqAO+46/Mi0Fub
 Fvj5aGzqSGRFU1g0vJ1Zjk1R3Tff57gJCFiUQtlB45WHbuGeenYAjgX1bC1vLC8BN3hQ
 017UdIz2xI+tNU/WCLM75bzg79KLNVqPEVoxCBSpBPuZaw8Jv9EJvmf6m8gv5DJwg1mb
 qhRQ==
X-Gm-Message-State: ABUngvei8WoPj7M1vzF2LRfO8c8ZxwQ+Bx3aeHgIVey5aWn7hvWZnqee4dEZzKg17XuZHHmh
X-Received: by 10.98.137.206 with SMTP id n75mr3504523pfk.132.1477070425652;
 Fri, 21 Oct 2016 10:20:25 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id f129sm6594037pfc.3.2016.10.21.10.20.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Oct 2016 10:20:25 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: f.fainelli@gmail.com
Cc: davem@davemloft.net, jaedon.shin@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 Xo Wang <xow@google.com>
Subject: [PATCH 1/2] net: phy: broadcom: Update Auxiliary Control Register
 macros
Date: Fri, 21 Oct 2016 10:20:12 -0700
Message-Id: <1477070413-92621-2-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1477070413-92621-1-git-send-email-xow@google.com>
References: <1477070413-92621-1-git-send-email-xow@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 21 Oct 2016 17:20:28 -0000

Add the RXD-to-RXC skew (delay) time bit in the Miscellaneous Control
shadow register and a mask for the shadow selector field.

Remove a re-definition of MII_BCM54XX_AUXCTL_SHDWSEL_AUXCTL.

Signed-off-by: Xo Wang <xow@google.com>
---
 include/linux/brcmphy.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
index e3354b7..22c4421 100644
--- a/include/linux/brcmphy.h
+++ b/include/linux/brcmphy.h
@@ -105,11 +105,12 @@
 #define MII_BCM54XX_AUXCTL_ACTL_SMDSP_ENA	0x0800
 
 #define MII_BCM54XX_AUXCTL_MISC_WREN	0x8000
+#define MII_BCM54XX_AUXCTL_MISC_RXD_RXC_SKEW	0x0100
 #define MII_BCM54XX_AUXCTL_MISC_FORCE_AMDIX	0x0200
 #define MII_BCM54XX_AUXCTL_MISC_RDSEL_MISC	0x7000
 #define MII_BCM54XX_AUXCTL_SHDWSEL_MISC	0x0007
 
-#define MII_BCM54XX_AUXCTL_SHDWSEL_AUXCTL	0x0000
+#define MII_BCM54XX_AUXCTL_SHDWSEL_MASK	0x0007
 
 /*
  * Broadcom LED source encodings.  These are used in BCM5461, BCM5481,
-- 
2.8.0.rc3.226.g39d4020
