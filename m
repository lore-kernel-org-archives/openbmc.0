Return-Path: <eajames.ibm@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCSwF48K7zDvPb
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 10:15:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FM6pGr1G"; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id e187so12353348itc.0
 for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2016 15:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=BFYaHLeZW+c1Lz+r9v7u9ndmUcTsyxrueOGfMv8Jd/s=;
 b=FM6pGr1Ge79D8PCDsMfAzhyAAVpHKnL9rnjKlHYSsvE7KMt8laiof7IZsd6H6ghXns
 t9U04EHREwD4NOOYjwRBtG2nx/30MsWCWZPKCQ4D7XDHvXPaUp052XIH2eF3dnMrkq7r
 qvA7bbqB7pBUiwYp6tF6idu6o/RWftL7lm8LqTBrypGdxqmrnqhhe2ZsDbwdglZGldMy
 GSi155wHihgIxkJb7Tc9Tv1U5JC8xdXDdukjjmPFAC+aM/7P1gPNw5bYCQW8d1AKsne7
 RXO3IuEwpReZXLrR0NKQO6LiJ9/XfPfiyJQ8wbwf4Lg7eIeHgKtV3glRk9XzilLrQn+W
 IX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BFYaHLeZW+c1Lz+r9v7u9ndmUcTsyxrueOGfMv8Jd/s=;
 b=iz4fV8Y4wvQAasYJa91aoTFKjHU+++dtsbrbWsHFSOuH5r5S3FpBU43upuGs0Z1doa
 IRw1nEh0UcwnUNOk3IRU704FEEZU0Yun1rpYAI2mIvaLByYv6kRHYx69LyWgQCePSmNg
 QG61VyigwwzUgy3i0SlH8DF/E5bp/di0eMFpf/VocA2d4H1vm5EaiQuSFljXsqclPfUg
 li6f2bkOgPObIgL1SlmnRX+w008b2nW/PGUkImURE9cjQbu9IcDheIboiG+yIOFVZMnt
 qsS+bR50S566D7I4fQOjQdvFuTLFKh5lSn03GOxFNU1LfEyhIg8rLaN9SxJcL/uRUQtK
 itGA==
X-Gm-Message-State: ABUngvcspzgBmDTQcNChINewqrMadlPt1c0cxPSzJMtoyvCoxmbQoLm6N9UDvb7t4in7Wg==
X-Received: by 10.107.8.201 with SMTP id h70mr11396820ioi.139.1478560522886;
 Mon, 07 Nov 2016 15:15:22 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.57])
 by smtp.gmail.com with ESMTPSA id p77sm6005466iod.35.2016.11.07.15.15.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 07 Nov 2016 15:15:22 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v5 0/5] On-Chip Controller (OCC) hwmon driver
Date: Mon,  7 Nov 2016 17:15:12 -0600
Message-Id: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Mon, 07 Nov 2016 23:15:26 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This patchset provides a new OCC hwmon driver. There are a number
of issues with the existing driver. Firstly, i2c access was embedded
throughout the driver. Secondly, there is no way to easily differentiate
versions of the OCC.

This patchset addresses the first issue by abstracting the bus transfer
protocol into a modular structure. In this way, any low level transfer
method may be easily implemented.

The second issue is addressed by separating the "version specific" code
for the OCC and the common hwmon code. This task is not yet complete, but
the general structure is in place. Ultimately, different OCC versions
could be probed up using the device tree.

Edward A. James (5):
  Revert "hwmon: Add Power8 OCC hwmon driver"
  drivers: Add hwmon occ driver framework
  drivers: hwmon OCC scom bus operations
  drivers: Add hwmon OCC version specific functions
  drivers: OCC hwmon driver and sysfs

 .../devicetree/bindings/i2c/i2c-ibm-occ.txt        |    2 +-
 drivers/hwmon/Kconfig                              |   13 +-
 drivers/hwmon/Makefile                             |    2 +-
 drivers/hwmon/occ/Kconfig                          |   15 +
 drivers/hwmon/occ/Makefile                         |    1 +
 drivers/hwmon/occ/occ.c                            |  892 ++++++++++++++
 drivers/hwmon/occ/occ.h                            |   58 +
 drivers/hwmon/occ/occ_i2c.c                        |  147 +++
 drivers/hwmon/occ/p8.c                             |  222 ++++
 drivers/hwmon/occ/p8.h                             |   29 +
 drivers/hwmon/occ/p9.c                             |  253 ++++
 drivers/hwmon/occ/p9.h                             |   29 +
 drivers/hwmon/occ/scom.h                           |   31 +
 drivers/hwmon/power8_occ_i2c.c                     | 1254 --------------------
 14 files changed, 1680 insertions(+), 1268 deletions(-)
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/occ.c
 create mode 100644 drivers/hwmon/occ/occ.h
 create mode 100644 drivers/hwmon/occ/occ_i2c.c
 create mode 100644 drivers/hwmon/occ/p8.c
 create mode 100644 drivers/hwmon/occ/p8.h
 create mode 100644 drivers/hwmon/occ/p9.c
 create mode 100644 drivers/hwmon/occ/p9.h
 create mode 100644 drivers/hwmon/occ/scom.h
 delete mode 100644 drivers/hwmon/power8_occ_i2c.c

-- 
1.9.1
