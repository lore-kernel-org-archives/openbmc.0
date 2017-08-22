Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x232.google.com (mail-pg0-x232.google.com
 [IPv6:2607:f8b0:400e:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbx6G6CcWzDrCw
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 13:35:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dez4o5oq"; 
 dkim-atps=neutral
Received: by mail-pg0-x232.google.com with SMTP id t3so82153991pgt.0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 20:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bZMJlwLgou/B6NzvQSSJKGQiHRX/wsTqaP0oKP3EoKY=;
 b=dez4o5oqJKKmmqfw5ao0BdUuYitQtOyECEH/tgPHeFe+bmlY9gFOHTdOsOVuevfqbn
 BLhNNlWIRUI0TvTqPDfAyqeY8KFO19CHO98463aB6WIN2RXGkU767Xgj0I5gqufB7rZc
 emgWOS9GroapHI3Gx7bJUOyMXN7CZlIuwUUmViUAn5xU/B+7bGbcIxY6SwNbZIKQjr9+
 sPYAK0EAhtWwHkGPqnq/NnsRMTHrn498CUFy6SSXSofmtlrwtN0cSRfHgDaN/0G85S4C
 ZjnV99y/LpgkdE8avPgr1fYvGgDsiDD1oD0f9fGmfjn194NfLxVnrAudN7sTlFTDUXsh
 4ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bZMJlwLgou/B6NzvQSSJKGQiHRX/wsTqaP0oKP3EoKY=;
 b=OPcUz1xIGTIAT7T1luIP5NG/2JeHzTDZ10cVSGfxRQCw2FINasSj1C2xmLHkscVCz6
 451EU6iLe61uNeePCkOuW82FNY/xkwncfuSCswbQGr1+FJOPJEKXOqFmbQCYtSOSkGm3
 5jyNZw6SwXBStvCVjv+D6rIJbTW4thwspnoQTxKmF+x1TGC6+m4uR8Ev7gP1Z0MwlClL
 j2HRBLUycvwoslOhIEMJGQ7Krj6rZls3/Ux4xcrRfgHKndPgQkeeX6FZKcETrZt4cIIS
 EMLpgdmlq9HlWfo5Q3A1VHgl1TacdrUWupp0Udms2L/L81wma7uaRvfK/iwx3h9BxKst
 /lyw==
X-Gm-Message-State: AHYfb5gchedLWVsuzD8Lh7tk5BVwOrwW+ZNxlkFGXuSb2n/voitCF+VD
 Dll7BPBGBptYxr78
X-Received: by 10.99.152.9 with SMTP id q9mr18983808pgd.148.1503372947892;
 Mon, 21 Aug 2017 20:35:47 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id e184sm25044480pfe.172.2017.08.21.20.35.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 21 Aug 2017 20:35:46 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: [PATCH v1 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Mon, 21 Aug 2017 20:34:59 -0700
Message-Id: <20170822033502.4100-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.1.480.gb18f417b89-goog
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
X-List-Received-Date: Tue, 22 Aug 2017 03:35:54 -0000

This patch set adds support for the Nuvoton NPCM Baseboard Management Controller
(BMC) SoC architecture as well as the NPCM750 variant. NPCM is an ARM based SoC
with external DDR RAM and supports a large set of peripherals.

The NPCM750 is based on Cortex A9 and comes in single core and dual core
flavors.

The device tree added in this patchset has a number of bindings for which the
corresponding drivers will be sent out later and thus do not yet have binding
documentation. Apologies in advance if you would like the bindings to be added
along with the corresponding drivers.

Thanks!
