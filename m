Return-Path: <xow@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szFTl5QKNzDt1g
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 12:58:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Xi8XNakx; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id s8so6292481pfj.2
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 18:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uxVxikIOnVlmkcvixK8Vmi+MPClSNfZpNiLxBAb+61w=;
 b=Xi8XNakxCowyyaRez5gkPsAOQgqN4MBL38d6ZC7OOUgckcHvp3APJoH/9/3vpI6aqC
 ZZSodjNZH+mRI+n/6YetuMNW7sC6TpnLzmsWqjRmtQyeBrW6qzyM9BHETjvfhUzPDF5Y
 RQY9vkLWACfGfwFw9IH9lstRmhMZtVsHkcu0e0ut5HeCbmRu8XY+7pNsnXNhbzXgK3Rl
 PXA5gTLvL51oHIaNN5Lg2Y4tfKzADnEFykRGwRlhEw5+8nzmtjCu2kI8Ic77b5ly3Del
 6rJaAFLGMYwy6CjwvD0rpujf4G3T/VxEC4wpREqK1+SQKj1mnh0Q14km9qhCJudolSYB
 lJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uxVxikIOnVlmkcvixK8Vmi+MPClSNfZpNiLxBAb+61w=;
 b=AsW0WZ6NF7mtSCc9+VSviWiFlXwMhH/k3ntqId37cI0qGRNCp09NhSbCnV+TcE2hAk
 w4GHus0EVH3XJ0uEHONlb577LEAsH7PmLgquO2TzOKRtwxWQ1xsPmWeq7i8bsjuNMvPb
 5P0/MmpNnob1nk7G4hbxwsefx1IKQyMB0ECytwREo0HdeYv2nUyr5GGx7v2bxTN5Pp9E
 jovFeGoxBuJZHyBJzkgEa68qoFwswMwrvjJyD3EgNYXymXdt3UG+5Tyhc1o45J3pbkSl
 iCT28yM7RweoniAC18EpK9Z7oeAatgpUs5MyyF9E0BQZCQBd6WB2qzMmClnk2loHixHj
 JIYw==
X-Gm-Message-State: AA6/9RlLXetZZPpANFOaQdTqXNmisz+fvrDXVuAJVTsg9dlM75Jg+RppsA0CW7gVZLLbk5Em
X-Received: by 10.98.79.193 with SMTP id f62mr6136458pfj.94.1476842313512;
 Tue, 18 Oct 2016 18:58:33 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id xo5sm58906315pab.13.2016.10.18.18.58.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 18 Oct 2016 18:58:32 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 1/2] phy/broadcom: Update Auxiliary Control Register
 macros
Date: Tue, 18 Oct 2016 18:58:27 -0700
Message-Id: <1476842308-142217-1-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Wed, 19 Oct 2016 01:58:36 -0000

Add the RXD-to-RXC skew (delay) time bit in the Miscellaneous Control
shadow register and a mask for the shadow selector field.

Removes a re-definition of MII_BCM54XX_AUXCTL_SHDWSEL_AUXCTL.

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
