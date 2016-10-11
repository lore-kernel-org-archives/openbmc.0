Return-Path: <eajames.ibm@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str7Q0CGWzDswk
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:42:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=PWsWSZhc; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id m138so2532703itm.0
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=+IOo/tfMr1CDAQ+vrkmbrqZlm9TaUsXj1SLW5Dea/sM=;
 b=PWsWSZhc7fnJHVbCPhjIDxTI7WIYgC2GEVx72RsrO7HMbPB6qKWNOLLjd1tBwhe3bU
 V2GKzKRVh7Udk9vR3kwlL9I2zf5NjsxqtiwhwbQGyCFMz40bUSijnVeaDKthhtL4c8Nc
 csGdtxRGyAYJF2U+JmHTSp6I7L+BZvOAMd+G6Ph37NR3e3EaOCczAgtxOQJGhCnrRJrC
 tNcFfVKj20h11qOSxmXzt3I0LiH8V5Z37FmFo9Lhr5vbavRzcnv6JZHDuLFXvn9VB+nG
 vUd0xg8hleFKPvfsISjqSwT0jpOuZ6pCelf1tE9BxbMF/qC43Hh+UbdG6N9ANxDafrHB
 xDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+IOo/tfMr1CDAQ+vrkmbrqZlm9TaUsXj1SLW5Dea/sM=;
 b=J2nZsQYQlJecJhxF8lkNWf7o9Aa2pSIFYPyJdES4tHANysqFgFiz8k4SbQ834akAqk
 B0L0hMgimqFG2b/tYbPbSCpBeBYFw0f+6fOK3Q0WtEJjHPu55IDbvGQ3BIxFzw5ViZKz
 4sjEaOcKOMkfJd+uO316Uec+scmaSHUHnqpNbRgybhVRvfSENXrvZq/6OPtoJhGniEE2
 1FMKsSO3gypK3ErlJ7pYBojrB6CNXub7oBC1w56HuiIWiXaaSl+hmtzi0TilzewXe13r
 hNa9PXk9UIMruUyd74n34E3dOuUf+eUxt104IkzTJqqAcuDmGhRWzgU3Jv5GDl9Bmgoq
 sYVg==
X-Gm-Message-State: AA6/9RnAW3foEsX4R0FFPeKtOxenkh2LjVVETC8k6bjmpS6l3tWIT5rOcvuoBYfhJUZ3uw==
X-Received: by 10.36.73.232 with SMTP id e101mr367202itd.119.1476222144059;
 Tue, 11 Oct 2016 14:42:24 -0700 (PDT)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.53])
 by smtp.gmail.com with ESMTPSA id j98sm2333698ioo.11.2016.10.11.14.42.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:42:23 -0700 (PDT)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux v2 0/2] drivers/hwmon: OCC hwmon driver restructuring
Date: Tue, 11 Oct 2016 16:42:14 -0500
Message-Id: <1476222134-14396-1-git-send-email-eajames.ibm@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Tue, 11 Oct 2016 21:42:26 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This patchset is provided to refactor the Power8 OCC hwmon driver. There are a
number of issues with the existing driver. Firstly, i2c access was embedded
throughout the driver. Secondly, there is no way to easily add different
versions of the OCC.

This patchset addresses the first issue by abstracting the bus transfer
protocol into a modular structure. In this way, any low level transfer method
may be easily implemented.

The second issue is addressed by separating the "version specific" code for the
OCC and the common hwmon code. This task is not yet complete, but the general
structure is in place. Ultimately, different OCC versions could be probed up
using the device tree.

Patch 1: "drivers/hwmon: Move OCC driver to occ directory"
- Move the existing OCC hwmon driver to it's own directory.
- Edit makefiles and Kconfig accordingly to preserve the build.

Patch 2: "drivers/hwmon: Isolate bus transfer protocol"
- Copy i2c related code into occ_i2c.c and simplify.
- Copy common platform code into occ.c; more functions can be placed here
  later.
- Change core functions to accept OCC driver data parameter instead of
  device pointer.

Edward A. James (2):
  drivers/hwmon: Move OCC driver to occ directory
  drivers/hwmon: Isolate bus transfer protocol

 drivers/hwmon/Kconfig          |   13 +-
 drivers/hwmon/Makefile         |    2 +-
 drivers/hwmon/occ/Kconfig      |   15 +
 drivers/hwmon/occ/Makefile     |    1 +
 drivers/hwmon/occ/occ.c        |  127 ++++
 drivers/hwmon/occ/occ.h        |   47 ++
 drivers/hwmon/occ/occ_i2c.c    |  150 +++++
 drivers/hwmon/occ/power8_occ.c | 1055 +++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/power8_occ.h |   25 +
 drivers/hwmon/power8_occ_i2c.c | 1254 ----------------------------------------
 10 files changed, 1422 insertions(+), 1267 deletions(-)
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/occ.c
 create mode 100644 drivers/hwmon/occ/occ.h
 create mode 100644 drivers/hwmon/occ/occ_i2c.c
 create mode 100644 drivers/hwmon/occ/power8_occ.c
 create mode 100644 drivers/hwmon/occ/power8_occ.h
 delete mode 100644 drivers/hwmon/power8_occ_i2c.c

-- 
1.9.1
