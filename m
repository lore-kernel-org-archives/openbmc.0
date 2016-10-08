Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtsx703rzDrWR
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=MT7S7vYR; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id d132so5424842oib.2
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=58XryvEyrJ1U8KxdBR/HwL3bFoNWVlApCbpiVPKKTNs=;
 b=MT7S7vYRNKOkaxY5/wFaoPwMez5Yez0uJHOaV6mAtK/I4TrAbZo8Iq2tM4rWOdj8GC
 lGHJdtKv1AAZw0DYrsvNcA/EMdPZPq0Ze6HKZFGcmpHrr1662aXBMOjFBJdx9LiSnyJ6
 2EUKo5iFQhICCt85rnPXeyABTuM3IlsLgPMTToxmydBppQxcYaa+wk4YFwBTXMzscPdj
 GsX0+HJBT594+ETeb2UsczrlIDQ1XfvGxoh+tueHl3pmokqkRHMJ+SrhDkBiCvJbLQeA
 D7aL0Ycupe53o9Ecde7jH7susu0EXA/MS8iXKcRqbeA4MZajitjaHWUu0F4xZ0BNJl/A
 YO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=58XryvEyrJ1U8KxdBR/HwL3bFoNWVlApCbpiVPKKTNs=;
 b=jxCag+deXO7PJvmeyWXPMXPyceG4Zmihak+7H6amnbX5gKWEYp/NXZLOIWNt9A6kmp
 wx4KvRm+vKk7vEGd2cftbVvjpS02v6iGPuOXyloKC6hxX74pgv1g6BikEh8K8KRaeCoM
 qkFEEoCjkHrdVkUv7b/3CCOcimKwoVPCx5jW9i4TULJPL0WIPlETWlH2HCz8jTn/qtYc
 3OBsJdyszB2d8sL0SjzRRfarzGDhYvMbYb96oNDR3CxWeBTSixPHOp1hiBq5z/ug+pKX
 5XZWJMuR6yD695a5BGXudXg65T8Pau9slKZB0Ze7rkZg7xwh9FwtwWJiZr2jZ9lujl9S
 YatQ==
X-Gm-Message-State: AA6/9RnUYCi+in4JljjGpfOOsPxBZN15VrHqmQzYJMApEoHdHRI/EThuP8KdBQtXdwjY1g==
X-Received: by 10.157.43.105 with SMTP id f38mr15309189otd.77.1475948339672;
 Sat, 08 Oct 2016 10:38:59 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.38.58
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:38:59 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v2 00/17] FSI device driver introduction
Date: Sat,  8 Oct 2016 12:38:36 -0500
Message-Id: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:02 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Patches 01-13 have been provided by Jeremy Kerr as an example of
how FSI function should be phased in. This includes the basic framework
to add FSI extensions to the Linux bus and device models.

Patch 14: Minor changes to text formatting, white space removal.

Patch 15: Recommended changes to patches 01-13 as provided by Jeremy
Kerr.

	V2: Removed suggested renaming of struct fsi_slave to fsi_cfam

Patch 16: Set up CFAM communications.  Send break command and init
target cfam id based on master type.

Patch 17: Define FSI gpio master functionality.


Introduction of the IBM 'Flexible Support Interface' (FSI) bus device
driver. FSI is a high fan out serial bus consisting of a clock and a serial
data line capable of running at speeds up to 166 MHz.

This patch set does not include extended FSI function such as:
    *  Hub master support
    *  Cascaded master support
    *  Application layer hot plug notification
    *  Application layer FSI bus status interface
    *  Interrupt functionality

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

---





Chris Bostic (4):
  drivers/fsi: Fix some text formatting
  drivers/fsi: Revisions to existing patch set
  drivers/fsi: Set up CFAMs for communication
  drivers/fsi: Add GPIO master functionality

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
 drivers/fsi/fsi-cfam.h                             |  63 ++++
 drivers/fsi/fsi-core.c                             | 398 +++++++++++++++++++++
 drivers/fsi/fsi-master-fake.c                      | 114 ++++++
 drivers/fsi/fsi-master-gpio.c                      | 259 ++++++++++++++
 drivers/fsi/fsi-master.h                           |  42 +++
 drivers/fsi/fsi-slave.h                            |  62 ++++
 include/linux/fsi.h                                |  60 ++++
 12 files changed, 1042 insertions(+)
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
