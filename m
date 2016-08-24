Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sKJ0r0CpDzDrcX
 for <openbmc@lists.ozlabs.org>; Thu, 25 Aug 2016 05:54:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GPgfx2tS; 
 dkim-atps=neutral
Received: by mail-qk0-x244.google.com with SMTP id r128so2017139qkc.1
 for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2016 12:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=H3j5kmXbr9HW7RG8T5KW0g8Ekoe8joquFY3NPVNbqxI=;
 b=GPgfx2tSCYa4VOwaKmgqYeYHtc6oIKZ/9eGO1Z49L+25WN2FkrFqyQ2z+EumHRv8Gk
 LvGnISvIh1EWJvV64zF91KNb7kt+1/6F9t6TpYvrFg1a8EZedioHnk72c01fIR9QwVLk
 oynwTubqvrpyVhpWtTDCLT79uRf8hoWtFgWHCovy8zIIhBMdvIfL3yq4bKIw/14XN6Ag
 j/e+zFbmg+3yqZn+G2H+2oXrgq3uimswBI92derhvz1lL+kyupz6sC9gKxL26o5wJBiI
 WT7/u2k/Rw+9++MQ1md90aja5rb7y8nFBbs0Cock0b8GudfCy4V8M59w1KidtgVT21X/
 WEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=H3j5kmXbr9HW7RG8T5KW0g8Ekoe8joquFY3NPVNbqxI=;
 b=ApBJIJexl80Xi4KFXpVpIfn04fYsUdQnC2WGRuDQtLRQCTJwri3iDt90KhkX3jkDu9
 m2pzm+pX9Mm7c7vahRulcNy9mXfhAnLaogcmnzOLJD1cEb5irAFlsZ7lpAoH6JTcUKaj
 3CxNMJ+emqtFmLqzpZgzrGUuTUNwA+pJYEjzOM7yiPu7mezvINhkTBVPZVitZeWrnLAS
 ze9tzXPrU9OfYpIr5o175g1vKkIy9Ws+2SGAS6SdzC88B/DiYHX4HSDFn503YkRdwskO
 BBplXgrw5ZavMi7FiI0CgaEgghYX+CS3vX6oB3FGuzmST4NTDxXKsnKqrYMmoiDDB98+
 d9NQ==
X-Gm-Message-State: AE9vXwO+eAyVVfUSOuM+4yrzdNOEkuhWVG940a235ucWD+lGlR0mD/QVoEZJkiq+daQt7g==
X-Received: by 10.55.188.195 with SMTP id m186mr5623526qkf.180.1472068456709; 
 Wed, 24 Aug 2016 12:54:16 -0700 (PDT)
Received: from christophersmbp.austin.ibm.com ([32.97.110.51])
 by smtp.gmail.com with ESMTPSA id n6sm3544238qkf.36.2016.08.24.12.54.15
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 24 Aug 2016 12:54:16 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v5 0/7] Introducing the FSI device driver
Date: Wed, 24 Aug 2016 14:54:05 -0500
Message-Id: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Aug 2016 19:54:20 -0000
X-List-Received-Date: Wed, 24 Aug 2016 19:54:20 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Introduction of the IBM 'Flexible Support Interface' (FSI) bus device
driver. FSI is a high fan out serial bus consisting of a clock and a serial
data line capable of running at speeds up to 166 MHz.

This set provides the core functionality of the FSI device driver.  Core
function is defined as:
    *  FSI client registration and notification of bus state changes
    *  Device scanning and hotplug reporting to clients
    *  Interrupt detection and routing
    *  Bus error detection and cleanup

This patch set does not include extended FSI function such as:
    *  Hub master support
    *  Cascaded master support
    *  Application layer hot plug notification
    *  Application layer FSI bus status interface
    *  Host configuration allowing for various hardware / firmware
       emulation implementations of the FSI master.
    *  Soft FSI support.  Soft FSI is a device driver method of emulating
       FSI master hardware by 'bit banging' standard I/O lines.

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

* Build Up
    The process scanning a bus and creating a data structure representation
    of all devices discovered in a tree.  A tree in this context is a
    series of links and devices connected to those links.

* Hub / Hub master
    Provides extension to the existing primary FSI master.  Allows for
    several chained FSI links in series to a target device thus increasing
    potential fan out.

* Cascaded master
    A subset of functionality of the  hub master.  Cascaded masters can
    access only a limited address range compared to hub masters.  This was
    the first generation implementation, essentially, of hub type function.

---

Chris Bostic (6):
  drivers/fsi: Add FSI Master Functionality and Initialization
  drivers/fsi: Add FSI master target device scanning function
  drivers/fsi: Add initial FSI link buildup
  drivers/fsi: Add FSI bus type and hook into LDM
  drivers/fsi: Add FSI Bus Support for Clients
  drivers/fsi: Add CFAM scanning function

Christopher Bostic (1):
  drivers/fsi: Initial stubs for FSI device driver.

 drivers/Kconfig           |   2 +
 drivers/Makefile          |   1 +
 drivers/fsi/Kconfig       |   7 +
 drivers/fsi/Makefile      |   5 +
 drivers/fsi/build.c       | 876 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsi.h         | 134 +++++++
 drivers/fsi/fsi_private.h | 123 +++++++
 drivers/fsi/fsicfam.h     | 161 +++++++++
 drivers/fsi/fsiinit.c     |  92 +++++
 drivers/fsi/fsiinit.h     |  43 +++
 drivers/fsi/fsilink.h     |  99 ++++++
 drivers/fsi/fsimaster.c   | 619 ++++++++++++++++++++++++++++++++
 drivers/fsi/fsimaster.h   | 682 ++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsislave.h    | 415 ++++++++++++++++++++++
 drivers/fsi/ldm.c         | 347 ++++++++++++++++++
 drivers/fsi/readwrite.c   | 123 +++++++
 16 files changed, 3729 insertions(+)
 create mode 100644 drivers/fsi/Kconfig
 create mode 100644 drivers/fsi/Makefile
 create mode 100644 drivers/fsi/build.c
 create mode 100644 drivers/fsi/fsi.h
 create mode 100644 drivers/fsi/fsi_private.h
 create mode 100644 drivers/fsi/fsicfam.h
 create mode 100644 drivers/fsi/fsiinit.c
 create mode 100644 drivers/fsi/fsiinit.h
 create mode 100644 drivers/fsi/fsilink.h
 create mode 100644 drivers/fsi/fsimaster.c
 create mode 100644 drivers/fsi/fsimaster.h
 create mode 100644 drivers/fsi/fsislave.h
 create mode 100644 drivers/fsi/ldm.c
 create mode 100644 drivers/fsi/readwrite.c

-- 
1.8.2.2
