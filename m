Return-Path: <3-qnHWwUKB1E3D6H1z77z4x.v7578x6u5v41BCB.7I4tuB.7Az@flex--kunyi.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::749; helo=mail-qk1-x749.google.com;
 envelope-from=3-qnhwwukb1e3d6h1z77z4x.v7578x6u5v41bcb.7i4tub.7az@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KpTcVMDf"; 
 dkim-atps=neutral
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42b52C6QGVzF3Xp
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 08:30:36 +1100 (AEDT)
Received: by mail-qk1-x749.google.com with SMTP id d1-v6so28986056qkb.11
 for <openbmc@lists.ozlabs.org>; Wed, 17 Oct 2018 14:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=tp/fioYie4gVi2ET9bXwNR4jKJ+EDQoZn/CxhLSSFvE=;
 b=KpTcVMDf7FDEEh5CnHBCd4N3OqR97cVx7oqogIhpPs2Xo6fef+/IqYeV73txA+dqju
 7seIK41s9QjHACgz2+nGPsCoYm5V4Oo70wRjBU71sTOT+ioA2X9rufxSdTqF91QiqaGU
 QVmkV6M/ZSUdHqmoWJGO8aLUbJriDQ8Ix7/ymD3YBBMQesgODK7i55FBcAub9MSlWJ18
 MzojoByBv1tsznUDiKCX5sIIBBo4sMHqBvMoFd4tpT+JU8z3VU3llhGJW/OC9nkK1ODf
 m5buyex/j8PSABCdLsEXFZMvOLwpXwrKZ+qWsYayK/eFlvE9V3MR8MosAsOLLIvUWXma
 4RfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=tp/fioYie4gVi2ET9bXwNR4jKJ+EDQoZn/CxhLSSFvE=;
 b=t0zME0OqH32da1nXYsmwQ3HnD5OP6st19jNetom0MlxSqa+LZEgYX+k1v7sod3ydnl
 H6ve9N4NwrnGQ70ri0x4VNKWL9csW3wG9EqItg/47kzk+OZUql4pfA6QsQUg0yXfhKfG
 vUq3pc2QYOD6XWjC6N43hjqqFPU/6suojd0gQlFa87c7uEg1qi2PpGS8XcJTEnBTFVIG
 1z9pskQbvyf216ST4VGlFjveZJ/ZHPbw5KCbYE0hiPZcxReN1NUcfoBsXjcIIE9wlqOe
 QwE3BGTsBqfYvLxph58FqZ+02AjreYMKMywAPbzowqbo38nkr6cp4BRQiPWbzkeMKIYm
 y+Aw==
X-Gm-Message-State: ABuFfohAoq03QL1eJR36QiE0KlupcjS1QOOHS0lHUpXggT5DdicuE6/J
 +5MqPvC65ANWwF7PxNFuXxzpRB9KvA==
X-Google-Smtp-Source: ACcGV60NEmiVPGMTgN4oejm7RMxYk1PlGFVDkIAnYOFPincAN/Lt4kAJcdZ8IbsRE0jWuXpeVUWWJIJt2g==
X-Received: by 2002:a37:3a86:: with SMTP id
 h128-v6mr22811861qka.4.1539811834842; 
 Wed, 17 Oct 2018 14:30:34 -0700 (PDT)
Date: Wed, 17 Oct 2018 14:30:10 -0700
Message-Id: <20181017213012.233957-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.1.331.ge82ca0e54c-goog
Subject: [PATCH 0/2] Allow gpio-mmio to co-exist with pinctrl driver
From: Kun Yi <kunyi@google.com>
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, tmaimon77@gmail.com
Cc: linux-kernel@vger.kernel.org, avifishman70@gmail.com, 
 openbmc@lists.ozlabs.org, Kun Yi <kunyi@google.com>
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
X-List-Received-Date: Wed, 17 Oct 2018 21:30:44 -0000

This patchset is to resolve an issue found with Nuvoton pinctrl driver
when it uses a generic GPIO interface. Since the generic GPIO driver
stores the bgpio_data and bgpio_dir shadow register values and later on
modify based on the stored values, any change to the pin states in
between by the pinctrl driver is lost.

Kun Yi (2):
  gpio: gpio-mmio: Allow volatile shadow regs
  pinctrl: pinctrl-npcm7xx: Set BGPIOF_VOLATILE_REG

 drivers/gpio/gpio-mmio.c                  | 50 +++++++++++++++--------
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c |  3 +-
 include/linux/gpio/driver.h               |  2 +
 3 files changed, 38 insertions(+), 17 deletions(-)

-- 
2.19.1.331.ge82ca0e54c-goog
