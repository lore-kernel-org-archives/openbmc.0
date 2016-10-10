Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3st8kB1qL5zDskZ
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 06:06:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=SXKxYRAy; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id n189so7583349qke.1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 12:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:subject:date:message-id;
 bh=GqShvdDfwoIPx2V3FWF4mbo3Ms43KoJrtNnAUF2XhCY=;
 b=SXKxYRAyjSrCudr51vQHQ9YOL1j8wUyvfNB/mQ0I1Fs1UR+lvoz7WT9a1XQ+b3oziL
 3AsjypES2emAJvb3JJmQp6GhC9QD9Oc3YZToB75s7uB6ebOLnJUSRrfUJ6QxDnjKU7hN
 G6O9Ngu5BXSiKQWC5aaK8ejflQerTn4pfOF7urdE4mSbeHbOgkpKL4mB2WCyjdBvX8/N
 CsreVk9X2t8Tko7jZncZH2meiWLUTZHxEEqa2uUWI0O8K2ngvbP0eHp8NT8XEQN8Uyu/
 IHgFc81InZ9AB0r/8VQzaa+d/GBo55FcVmrwtCVCSZhxOeLOJROUNYjU7MNCdKPPgIE8
 oXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=GqShvdDfwoIPx2V3FWF4mbo3Ms43KoJrtNnAUF2XhCY=;
 b=iEpTlHYKvX2Wcv9H746ampcecN1N/PTDE4tCfQ+GpJmdHPcoS7sBo2OeDFKhLgQBgu
 rn4ffjBN6QKfgnOTXwXSf4ojIe4e8PoYt5WveOLUeIlNXrDtrsikQxKqZyszN6JvbW6o
 Z3gi0XqmDYpIMZ5rTDNxa1E0gqHX6BhvkXA3rG5uw376Z5+R0LfckQaC4zmtSd0QxBpi
 yUMcmvi55FjYI8bwSSOkAlxufBYjpt2gzgVhzEBXhgW4ilOv0CJIp3fYm8hiLeoMPRNP
 k401OxgM5vLQ3bk1M/0hgIyXIchhIILduXuRQr074NXXo//azhiXtRZZq9Hlbhp1GRjY
 blWg==
X-Gm-Message-State: AA6/9RkwxHmzGqD+bwVuaImi4/HIPDb85k+CKNOczio8KcB9UtWTAQOBppMqcOrr1Wb8nQ==
X-Received: by 10.55.23.206 with SMTP id 75mr30556174qkx.237.1476126399601;
 Mon, 10 Oct 2016 12:06:39 -0700 (PDT)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.51])
 by smtp.gmail.com with ESMTPSA id m201sm12061481qke.46.2016.10.10.12.06.38
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 10 Oct 2016 12:06:38 -0700 (PDT)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Subject: [RFC linux v1 0/2] drivers: OCC hwmon driver restructuring
Date: Mon, 10 Oct 2016 14:06:30 -0500
Message-Id: <1476126390-17892-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Mon, 10 Oct 2016 19:06:43 -0000

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

Patch 1: "drivers: move OCC hwmon driver to occ directory"
* Move the Power8 OCC hwmon driver into it's own directory. Now we can
  have multiple files and avoid cluttering up the main hwmon directory.

Patch 2: "drivers: occ hwmon - isolate bus transfer protocol"
* modify drivers/hwmon Makefile and Kconfig
* create i2c layer
* move some common code out of the Power8 OCC specific file
* clean up Power8 OCC driver

Edward A. James (2):
  drivers: move OCC hwmon driver to occ directory
  drivers: occ hwmon - isolate bus transfer protocol

 drivers/hwmon/Kconfig          |   13 +-
 drivers/hwmon/Makefile         |    2 +-
 drivers/hwmon/occ/Kconfig      |   15 +
 drivers/hwmon/occ/Makefile     |    1 +
 drivers/hwmon/occ/occ.c        |  127 ++++
 drivers/hwmon/occ/occ.h        |   50 ++
 drivers/hwmon/occ/occ_i2c.c    |  191 ++++++
 drivers/hwmon/occ/power8_occ.c | 1048 +++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/power8_occ.h |   24 +
 drivers/hwmon/power8_occ_i2c.c | 1254 ----------------------------------------
 10 files changed, 1458 insertions(+), 1267 deletions(-)
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
