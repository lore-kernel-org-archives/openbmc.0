Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq7Lz4pFxzDrPG
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 07:54:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=qu1jU4KI; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id h186so12301965oia.3
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 13:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=BlGYpeEfy5oBL2fF2lqRH15EyeE3AnR8esrzyzHZtL0=;
 b=qu1jU4KI5XniaS2MSALblf1wEyRfIbWJODt+/6r3wKoiIXNt/E252pnvBBRzd1gOwv
 +j8wz9C7yIoYIIALRIgWpZ+7uTFxrOgTepuT4TRxrDsHflmOd1UQDDVUbwioGktA5oab
 jwFGfgg7HFxLrHFLYjV5JII4I2+V5q+P6qFFAXjUGrgjUWw4fYSA5WiLFSyQxim7w3ip
 8LF0rBGbJ/+DjQRYz1AEhnUq5AT4KlmmI6PfxbvloK2851A5qcDjxmHwN98EMyMT+EAV
 1cmVOB1QlwHibmrxE6NYcffuqNxXnVZr5ougjwE/YezpuanZvoIQNM3TIpslVqrIL+9r
 8aFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BlGYpeEfy5oBL2fF2lqRH15EyeE3AnR8esrzyzHZtL0=;
 b=PCialezyK12ZZi19qWLqz/PNmRYs+ag7oMD2cnasBGmpJlsyzO/9uGf35VdcyM/23s
 1Tym63nrs8M6zMiKz1O8vqRUVGZHry8djZNs+M9JCWiZNsAoqWBegOErJsoKeuGx+lqM
 PdkEbrqQdHXFJaxU7XN5ZY2Bb/GEZFzlmy8SfFjZuDR0xJ9tvNuaXf2wCRu4q+zTTGI7
 8CYJD6a3SQAU0hetiwEoJ2nIlPAuI7BDRqysgvdkdeSmEyTojW3NgxiqwiX8zBZ8x5sv
 PHzytLnfEaOZxiUoutSU9y8pIdjPDUVpOg9Gi6G9x5iKSR/8c1utOMpZr09uCzKfXOVj
 xJQQ==
X-Gm-Message-State: AA6/9RnCILGYUfgE4zoH9gaEGNJ+twpCRU8XG+Zibae4PwsCdbkzucsbHpeq0ce8WU7K4A==
X-Received: by 10.157.27.253 with SMTP id v58mr7273615otv.146.1475700873708;
 Wed, 05 Oct 2016 13:54:33 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id i18sm3206459oib.12.2016.10.05.13.54.32
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Oct 2016 13:54:32 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux 00/15] FSI device driver introduction
Date: Wed,  5 Oct 2016 15:54:13 -0500
Message-Id: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
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
X-List-Received-Date: Wed, 05 Oct 2016 20:54:36 -0000
X-List-Received-Date: Wed, 05 Oct 2016 20:54:36 -0000
X-List-Received-Date: Wed, 05 Oct 2016 20:54:36 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Introduction of the IBM 'Flexible Support Interface' (FSI) bus device
driver. FSI is a high fan out serial bus consisting of a clock and a serial
data line capable of running at speeds up to 166 MHz.

Patches 01-13 of 15 have been provided by Jeremy Kerr as an example of
how FSI function should be phased in. This includes the basic framework
to add FSI extensions to the Linux bus and device models.  Patch 13
is a beginning definition of a GPIO controlled master controlled in
firmware.  Patch 14 contains only my recommended changes to Jeremy's set.
Patch 15 adds function to set up read/write access to a given CFAM.

Note patch 05/15 and patch 13/15 have blank lines at EOF and so
git am will warn on application of these two.  In order to make it
clear what changes Jeremy submitted and preserve his change history
I left them as is.  As per my understanding we wanted to make it
clear what changes were Jeremy's versus mine.

This set provides the basic framework to add FSI extensions to the
Linux bus and device models. Master specific implementations are
defined to utilize the core FSI function.

This patch set does not include extended FSI function such as:
    *  Hub master support
    *  Cascaded master support
    *  Application layer hot plug notification
    *  Application layer FSI bus status interface
    *  Host configuration allowing for various hardware / firmware
       emulation implementations of the FSI master.

Common FSI terminology:

* Master
    Controller of the FSI bus.  Only the master is allowed to control the
    clock line and is the initiator of all transactions on a bus.

* Slave
    The receiver or target of a master initiated transaction.  The slave
    cannot initiate communications on a bus and must respond to any
    master requests for data.

* CFAM
    Stands for Common Field replaceable unit Access Macro.  A CFAM is an
    ASIC residing in any device requiring FSI communications. CFAMs
    consist of an array of hardware 'engines' used for various purposes.
    I2C masters, UARTs, General Purpose IO hardware are common types of
    these engines.

* Configuration Space / Table
    A table contained at the beginning of each CFAM address space.
    This table lists information such as the CFAM's ID, which engine types
    and versions it has available, as well as its addressing range.

* Link
    The combination of a serial clock and data line constituting one
    FSI communications element. For each link there is a master on one
    end and a CFAM/slave on the other end.

* Engine
    A self contained hardware function found within a CFAM.  Examples
    include I2C masters, UARTs, GPIOs, etc...

* Client
    A device driver requiring access to its hardware via an FSI bus.
    For example an I2C client would be a device driver requiring
    access to an I2C master engine on a remote CFAM accessible via
    an FSI link.  Clients register with the FSI bus and will receive
    notifications of bus state changes as well as hot plug events related
    to engines of interest to them.

* Hub / Hub master
    Provides extension to the existing primary FSI master.  Allows for
    several chained FSI links in series to a target device thus increasing
    potential fan out.

* Cascaded master
    A subset of functionality of the  hub master.  Cascaded masters can
    access only a limited address range compared to hub masters.  This was
    the first generation implementation, essentially, of hub type function.

---

Chris Bostic (2):
  drivers/fsi: Rename slave to cfam
  drivers/fsi: Initialize CFAMs for read/write access

Jeremy Kerr (13):
  fsi: Add empty fsi bus definitions
  fsi: Add device & driver definitions
  fsi: add driver to device matches
  fsi: Add fsi master definition
  fsi: Add fake master driver
  fsi: enable debug
  fsi: Add slave defintion
  fsi: Add empty master scan
  fsi: Add crc4 helpers
  fsi: Implement slave initialisation
  fsi: scan slaves & register devices
  fsi: Add device read/write/peek functions
  fsi: Add GPIO master driver

 .../devicetree/bindings/fsi/fsi-master-gpio.txt    |   8 +
 drivers/Kconfig                                    |   2 +
 drivers/Makefile                                   |   1 +
 drivers/fsi/Kconfig                                |  29 ++
 drivers/fsi/Makefile                               |   4 +
 drivers/fsi/fsi-cfam.h                             |  72 ++++
 drivers/fsi/fsi-core.c                             | 386 +++++++++++++++++++++
 drivers/fsi/fsi-master-fake.c                      |  99 ++++++
 drivers/fsi/fsi-master-gpio.c                      |  95 +++++
 drivers/fsi/fsi-master.h                           |  42 +++
 drivers/fsi/fsi-slave.h                            |  62 ++++
 include/linux/fsi.h                                |  60 ++++
 12 files changed, 860 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
 create mode 100644 drivers/fsi/Kconfig
 create mode 100644 drivers/fsi/Makefile
 create mode 100644 drivers/fsi/fsi-cfam.h
 create mode 100644 drivers/fsi/fsi-core.c
 create mode 100644 drivers/fsi/fsi-master-fake.c
 create mode 100644 drivers/fsi/fsi-master-gpio.c
 create mode 100644 drivers/fsi/fsi-master.h
 create mode 100644 drivers/fsi/fsi-slave.h
 create mode 100644 include/linux/fsi.h

-- 
1.8.2.2
