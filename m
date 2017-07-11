Return-Path: <xow@google.com>
Received: from mail-pf0-x230.google.com (mail-pf0-x230.google.com
 [IPv6:2607:f8b0:400e:c00::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x63Gn1MTDzDq60
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 10:43:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TfNZKOPo"; 
 dkim-atps=neutral
Received: by mail-pf0-x230.google.com with SMTP id c73so58002423pfk.2
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2017 17:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WL3ruI6N9quuoc8PEEBTxDnHXp5qG1w+i9KaRfvvPDY=;
 b=TfNZKOPoESCZTlOg5wucZs/L7FJHoHYIlmvDV8l6pzG635vrv++jnpnJLVieOQAdZB
 AsSDSqOJgjKu4iWGIeJTFODU/JZWbwg5SNsvLvDBckvfvczEFFfagdF+Z7FJ+b92aNEv
 yJAoQNmkK2e06yCYxraTJE8Ctpv4sUnNMCqM97G/ozybdbejTb5Hb01EMxPiMFnRi0d4
 /k8I8QA5RAhNv18l02jwlJNxkEMYGVNfhC6bzntY7hiYIQJH9ealr6yVcZXNcUzuD6i2
 GVaaKWZgjqE04BIfCmRTozbqQ7/tOHbXP8sK4CnHeBRqy4lDM777dj1iC+bf3u9fcYDI
 NOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WL3ruI6N9quuoc8PEEBTxDnHXp5qG1w+i9KaRfvvPDY=;
 b=U7rx0fL4JaVxsKwMTeXIqIEJdAdQ++1k4LHrZKxiyS6Q+Y8B3EUht9TyAHWYJmt4MP
 PrLi7mlutSoGzQ7bmj94F0HmUI7Je8+cwlthZwKBcuBN1w/dWWMbIVN5VJJFiJMu3wPy
 aNTV/Xfx5YI7CaAjIxAy/BcvK1r+eWkaMyxbcw+SnPUGxf8pDshNtNnpLPYqX7Gjte1I
 nbwUomNrD0a0fMfVhqguJhsNWzqRJoUHd8Y0dKJi5qv4cdRkIiRmdP9Vga0Z8idCAPIe
 hT83Exb6khjt+E2HB1sbEdj54zj1J1p9t1O2XgWrWf/vJa5VLS/Kbj+uzLhVGOMmnEnt
 b5zA==
X-Gm-Message-State: AIVw113gcXTk+JbCB1vnXGu8CYceAuRdAUZ5R0UinZBXhR/cwiWA1bvY
 QpLnBy3HpmkhL3zhiw2HaQ==
X-Received: by 10.99.51.142 with SMTP id z136mr17050339pgz.275.1499733805448; 
 Mon, 10 Jul 2017 17:43:25 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id k194sm21956146pgc.31.2017.07.10.17.43.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 10 Jul 2017 17:43:24 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux,
 dev-4.10 0/4] *DO NOT MERGE* Driver support for reading Vdd current
 on Zaius
Date: Mon, 10 Jul 2017 17:42:57 -0700
Message-Id: <20170711004301.10515-1-xow@google.com>
X-Mailer: git-send-email 2.13.2.725.g09c95d1e9-goog
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
X-List-Received-Date: Tue, 11 Jul 2017 00:43:30 -0000

To help with Adrian Barrera's debugging for AVSBus current readouts, I'm
mailing our driver for the Intersil voltage regulator modules (VRMs). The
authors haven't yet mailed these to the appropriate mainline maintainers,
so please do not merge to the OpenBMC tree.

Maxim Sloyko (2):
  HWMon Driver for Intersil ISL68137 PWM Controller
  Add Infineon and Intersil regulators to the device tree

Robert Lippert (2):
  hwmon: (isl68137) add accessors to enable/disable AVS mode
  hwmon: (isl68137) add accessors for changing VOUT_MAX

 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts |  61 +++++++-
 drivers/hwmon/pmbus/Kconfig                |  10 ++
 drivers/hwmon/pmbus/Makefile               |   1 +
 drivers/hwmon/pmbus/isl68137.c             | 238 +++++++++++++++++++++++++++++
 4 files changed, 305 insertions(+), 5 deletions(-)
 create mode 100644 drivers/hwmon/pmbus/isl68137.c

-- 
2.13.2.725.g09c95d1e9-goog
