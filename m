Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhd3NJjzDt2L
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:09:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=JOl+v9gf; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id k64so3167450itb.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=ijcbtbxCHjw1lhBg2bLRaGoErpUtOytnMAa2ToY+RDg=;
 b=JOl+v9gfo8RJ5kyAD9FDaWsZTGtgO1OHDFuY8AfEjXXW/ep3CMqTliY3HN3F+GCHnw
 6ahKi500XCagFa1TO45Qv+iZF3XUqVQKnvoKVvUuB3Gn5BMgSE2SEYamW58bI29lXMF4
 cZH/2/DCwugJ3sta9YGFXF/Kc4KQRbK7t/AfJIa7O8DzV7EVnBDmSl3WJAHjOA6gKj+j
 VxeuPYJZEvxPI/26C+1t4CkT8ElWQJt/zA9jhk7LdYLKh9fLblBYopW6h6r4uHwpSslk
 nLL9dGCFmPQUOH65ApUgSsxzfnYzsOchBRlEip9c5BqpLFNpMURDinN4kUYeh+4/F2mU
 7WZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ijcbtbxCHjw1lhBg2bLRaGoErpUtOytnMAa2ToY+RDg=;
 b=SWXw1CsgwvRbM4fvskp1bIIO47dgCnlE5j7WHMwlMEjCgbt2PRQloAIG881yZCyf1I
 c/Xj522BLKRwL8ouA3Ko6seY0y/k54AlfA6uqmP7R2iiyKhlkUubZINBSUpNA+p5yAYq
 rSPElYMvNp+0svPzqumtSGXbnPIClyChWctzYPTdPFUFobU0Ra0CsjPMKK9vxQiBugrG
 YoVptm49vswnn0SRKBVTrBgnNb7v+YAfvyXqNZjq6coKLMnW5abE0wPSltHw7beHgKuj
 fVbOVXb5/vn9VSXj28FNYUKoCu515ES7yizkkb6Ei2GHQl1OmgUa4s4VZR9X4nL1HM2y
 Azag==
X-Gm-Message-State: AA6/9RnL4rGMvho78xzflACUM6EYhWSX97Zgy0sxPGczyyUunsTviYBs0WYOKWHykA6aIQ==
X-Received: by 10.157.55.183 with SMTP id x52mr4374420otb.68.1476918591231;
 Wed, 19 Oct 2016 16:09:51 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.09.50
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:09:50 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v5 00/18] FSI device driver introduction
Date: Wed, 19 Oct 2016 18:09:28 -0500
Message-Id: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:09:54 -0000
X-List-Received-Date: Wed, 19 Oct 2016 23:09:54 -0000
X-List-Received-Date: Wed, 19 Oct 2016 23:09:54 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Patch Descriptions:

Patches 01-12 have been provided by Jeremy Kerr as an example of
how FSI function should be phased in.  This includes the basic framework
to add FSI extensions to the Linux bus and device models.

Patch 13 adds function to set up read/write access to a given CFAM.

Patch 14 sets up slave smode during scanning operations to allow
config space access.

Patch 15 defines a FSI master hardware implmentation using I/O.
The base of this was created by Jeremy Kerr and I've added additional
functionality on top of this.

Patch 16 is core additions for client driver registration.

Patch 17 implements a basic SCOM FSI client device driver.

Patch 18 adds some introductory documentation explaining FSI.

Chris Bostic (6):
  drivers/fsi: Set up links for slave communication
  drivers/fsi: Set slave SMODE to init communications
  drivers/fsi: Add GPIO FSI master
  drivers/fsi: Add client driver register utilities
  drivers/fsi: Add SCOM FSI client device driver
  Documenation: Add basic FSI text file

Jeremy Kerr (12):
  fsi: Add empty fsi bus definitions
  fsi: Add device & driver definitions
  fsi: add driver to device matches
  fsi: Add fsi master definition
  fsi: Add fake master driver
  fsi: enable debug
  fsi: Add slave definition
  fsi: Add empty master scan
  fsi: Add crc4 helpers
  fsi: Implement slave initialisation
  fsi: scan slaves & register devices
  fsi: Add device read/write/peek functions

 .../devicetree/bindings/fsi/fsi-master-gpio.txt    |  21 +
 Documentation/fsi.txt                              |  36 ++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  30 ++
 drivers/Kconfig                                    |   2 +
 drivers/Makefile                                   |   1 +
 drivers/fsi/Kconfig                                |  35 ++
 drivers/fsi/Makefile                               |   5 +
 drivers/fsi/fsi-core.c                             | 493 +++++++++++++++++++++
 drivers/fsi/fsi-master-fake.c                      |  95 ++++
 drivers/fsi/fsi-master-gpio.c                      | 464 +++++++++++++++++++
 drivers/fsi/fsi-master.h                           |  60 +++
 drivers/fsi/fsi-scom.c                             | 217 +++++++++
 include/linux/fsi.h                                |  72 +++
 13 files changed, 1531 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
 create mode 100644 Documentation/fsi.txt
 create mode 100644 drivers/fsi/Kconfig
 create mode 100644 drivers/fsi/Makefile
 create mode 100644 drivers/fsi/fsi-core.c
 create mode 100644 drivers/fsi/fsi-master-fake.c
 create mode 100644 drivers/fsi/fsi-master-gpio.c
 create mode 100644 drivers/fsi/fsi-master.h
 create mode 100644 drivers/fsi/fsi-scom.c
 create mode 100644 include/linux/fsi.h

-- 
1.8.2.2
