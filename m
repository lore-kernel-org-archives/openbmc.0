Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sw41k26PwzDt1j
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 08:41:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=N1euz8DD; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id n189so7197731qke.1
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 14:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=pBqtXr3+5ty9RWvq6nVBC8yBnYHHrmjusskUYqESooE=;
 b=N1euz8DD5FJjIi70NC9ZzrKII5jYEYwqDkjsNIMIHhjnosKab5blYiUd89OZcHejj7
 Z4hr+9dwP3NZeJICDohwuaM69q1eZVj5MkF1sq43XXA+PQB6WscWBgPeUiM8mZyLixk8
 uIUvhKCC3lbTMtl5Y0a6rkaSVDvKaiprWJtKTUC7XJ9QCOtnfjhlnqW/HfmTmeryFBEc
 fT/zkJI/k3ujWieMBDGUHlB4s1WFXGYKvhasXSM+H+W+PM2JvyBbVlVzbVFCdmQQzskl
 VqC/QXBRMOI4BcEPRu7sNPucf7RduGnUBF2xWIZ+07GuIGv6B8dKpnvgx95lBcJLbLHc
 KY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pBqtXr3+5ty9RWvq6nVBC8yBnYHHrmjusskUYqESooE=;
 b=Ddmur6aZFmjgufEDB0iykSHIRCgTUTjeLPH7MH8uBSQtX3XiXDZl1g//ejHoYAjz1g
 mT6MUvcHY/X7eeG4If28Vp3de7X94MXTT9yqlygcKo19yPrPjmfkTk88UlGKPVWD6geC
 lmOt8rn0JOjLYeRyIrQaCYeGdnapWBbe+J35yIBHtquHhjComTC2JBBsUY52H+Ogtl+u
 JaHeBL676wZgMr3O/MB7MdsXwKr9ee0abZAfg+zllkd4wnxPJFuFD0Q0PtDk6RZ7vXQg
 Y1GcoCNbXib5AxpNDppgbJGvqy65z7woF4aQc70BQTW9XwH7OZ6+hocgb3cOw4Qnca5X
 sg4w==
X-Gm-Message-State: AA6/9Rnm9740ilgVHsmsRJ090+NTI4XwwBmTP0AqIya8Z63+y1HkTUfuZ1mcxLPhcGqrZw==
X-Received: by 10.55.158.139 with SMTP id h133mr10255945qke.202.1476394903780; 
 Thu, 13 Oct 2016 14:41:43 -0700 (PDT)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.56])
 by smtp.gmail.com with ESMTPSA id j2sm5815785qtb.46.2016.10.13.14.41.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Oct 2016 14:41:42 -0700 (PDT)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v4 0/6] hwmon: On-Chip Controller (OCC) hwmon driver
Date: Thu, 13 Oct 2016 16:41:32 -0500
Message-Id: <1476394892-16770-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 21:41:47 -0000

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

Edward A. James (6):
  Revert "hwmon: Add Power8 OCC hwmon driver"
  hwmon: Add OCC driver stub
  hwmon: Add OCC driver basic sysfs attributes
  hwmon: Add OCC driver polling and parse response
  hwmon: Add OCC sensor groups
  hwmon: Add OCC CAPS sensors

 drivers/hwmon/Kconfig          |   13 +-
 drivers/hwmon/Makefile         |    2 +-
 drivers/hwmon/occ/Kconfig      |   15 +
 drivers/hwmon/occ/Makefile     |    1 +
 drivers/hwmon/occ/occ.c        |  128 ++++
 drivers/hwmon/occ/occ.h        |   47 ++
 drivers/hwmon/occ/occ_i2c.c    |  151 +++++
 drivers/hwmon/occ/power8_occ.c | 1031 +++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/power8_occ.h |   25 +
 drivers/hwmon/power8_occ_i2c.c | 1254 ----------------------------------------
 10 files changed, 1400 insertions(+), 1267 deletions(-)
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
