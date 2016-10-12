Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svTQ73C7QzDrLv
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 09:42:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=j+6dZjNG; 
 dkim-atps=neutral
Received: by mail-qk0-x231.google.com with SMTP id f128so56120533qkb.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 15:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=SmKMoIxU/GYc66QVuiPhi1wrdkvH1gB7SPzkPxdDu6Y=;
 b=j+6dZjNGw6bvOPdvOafvcGskh3kHH+bbzhGf5P6x2cPc6hhha19roAjdz9hsT+063F
 ud8YsA7UjDUMoALwG3rN3XIGAJOGxjKN2KCn/DssbcH8tUcG3z3CdJ8NI7JsK/YukT7S
 w86uw1EwTcYXU1YtSik7PsBwHkkdQjUQih3QBxaJIhXCcrdDqek19mQaMX83lOdvEwsX
 HKBPxKBIaYI/lGsX5GeR8TYZR9trT0SYcTck1SXDIHmYyaG/IQ87LCuK51+ceDnHIWpu
 P2Mwt0GLTm5fESZSDld37n3qEmPoJJvKXTs4n7JhLH9zyobKSU5H15ScMn5ZHn6stfAu
 2CzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=SmKMoIxU/GYc66QVuiPhi1wrdkvH1gB7SPzkPxdDu6Y=;
 b=INXBeiMlDD9s7bjGP2ub+flD5jbke45lrAxqH87m5hPqWQGTEQecJ02cmWUG+KsOWq
 IaUdbb0t5oshFMGmAOldPMpK2J0x0L+P++xJcgknKPFzgeY2cbJMJ1h0UZGRnLwkEcQ7
 2mFrmOX1k6yY5xGLZ5quZ/Yn0jnx+lZ/4Zy2EtugnIbYPUoHNEstpMhCBYsR6aojnNvj
 w9GL/PtM2TGlCgn44bcBWiclJta1Z7CNCL07zc8yZm9KeHMuQ/4Cf4+l9Y1f8YN6LkZC
 BoI0mVveR9KUZxiE4/H9R91RDvX6ikahYO8Kp+EvE6d+Wn7C1HHRJOCAudmDyzbGqrGH
 E5Gg==
X-Gm-Message-State: AA6/9Rke813SjRe8XqDJ0MkhhHplx4vrpV4KnEXqHE+oqh0BWaZyGwzHcDD4J/PSjVwR4A==
X-Received: by 10.55.22.140 with SMTP id 12mr3384338qkw.236.1476312140747;
 Wed, 12 Oct 2016 15:42:20 -0700 (PDT)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.52])
 by smtp.gmail.com with ESMTPSA id 22sm3547915qkj.15.2016.10.12.15.42.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Oct 2016 15:42:20 -0700 (PDT)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux v3 0/4] hwmon: On-Chip Controller (OCC) hwmon driver
Date: Wed, 12 Oct 2016 17:42:08 -0500
Message-Id: <1476312128-19986-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 22:42:24 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This patchset provides a new Power8 OCC hwmon driver. There are a number
of issues with the existing driver. Firstly, i2c access was embedded
throughout the driver. Secondly, there is no way to easily add different
versions of the OCC.

This patchset addresses the first issue by abstracting the bus transfer
protocol into a modular structure. In this way, any low level transfer method
may be easily implemented.

The second issue is addressed by separating the "version specific" code for the
OCC and the common hwmon code. This task is not yet complete, but the general
structure is in place. Ultimately, different OCC versions could be probed up
using the device tree.

Edward A. James (4):
  Revert "hwmon: Add Power8 OCC hwmon driver"
  hwmon: Add OCC hwmon driver stub
  hwmon: Add OCC driver basic sysfs attributes
  hwmon: Add OCC driver polling and parse response

 .../devicetree/bindings/i2c/i2c-ibm-occ.txt        |   13 -
 drivers/hwmon/Kconfig                              |   13 +-
 drivers/hwmon/Makefile                             |    2 +-
 drivers/hwmon/occ/Kconfig                          |   15 +
 drivers/hwmon/occ/Makefile                         |    1 +
 drivers/hwmon/occ/occ.c                            |  128 ++
 drivers/hwmon/occ/occ.h                            |   47 +
 drivers/hwmon/occ/occ_i2c.c                        |  151 +++
 drivers/hwmon/occ/power8_occ.c                     |  719 +++++++++++
 drivers/hwmon/occ/power8_occ.h                     |   25 +
 drivers/hwmon/power8_occ_i2c.c                     | 1254 --------------------
 11 files changed, 1088 insertions(+), 1280 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ibm-occ.txt
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
