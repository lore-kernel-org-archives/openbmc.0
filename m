Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w1bzG1mdDzDq7Z
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 13:59:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HqLgRaPq"; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id o126so7449915pfb.1
 for <openbmc@lists.ozlabs.org>; Sun, 09 Apr 2017 20:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=P8UKeEtCGUgh6lZYo1AcU7syRd6tJ6WJejzPS2lZOpE=;
 b=HqLgRaPqyB0u8O+oXHTpor7Ctq+OJqBv9KaU1ePR5mOu9GIVm2FvPFdboA0zH3ciZb
 u77khPGhPzSLWMRxGVQEhhE/Y0pp1pvUG2IlXNVCXrbWF3MsDOAbjXjCQkV7MAoC38m8
 lsDF8uBut1Ph34+kdgTHRtxOurEEQXFw7Tl7ul+/KiHkyvewU27Y2UoWcL3iQdnhLNR6
 QbUtstIfvyKy5VVBwOodv2onw8k9NztE6/yUPLE/nENA4FfmtKc+2UyC1cczHInHw5Po
 wFGRP2pIjBGRen+7lW1Ws5FNJHc192vTzdhTMGrcAbpfaJumVbWBkNoCA1ZDGw7OLta1
 zLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=P8UKeEtCGUgh6lZYo1AcU7syRd6tJ6WJejzPS2lZOpE=;
 b=ZW9Ocpyqi6pNE3ZCsduC/+Kv8V0g8cbZbictZYNJ627fVhasE2DTsxGPuE/7L/AH8r
 cZAN+jnOs7XLXmXKwOfHcPICdcZUjRVVSUuK55zFowM5jKPONt5ityHcEoZqBTofj4h1
 ep/fHrMnvaNvS4wq/Q9e1f3Yj9UMPURhxislTNuMyW5m76Msk6BgRmIK2ekPoCl/SW4F
 4Pnfw66o0Wh/xOZy7OWT8Y6ZJZBU8DyfqDkKrFlVB6eEJkH7sy83CIg2FtO9ZGzDCq2n
 ubo1uraRMTkEV8T4pdb8GRDNrMKDMeUu7VWulwByKcSURtVTMbD8zhk07gciQo5xCQmo
 qkCw==
X-Gm-Message-State: AFeK/H1wWXiAmw/ih2Npvc8UxHMSbtHBuYW9OuiIqeTESPSdL9NROAiib73pBcJBXPofOQ==
X-Received: by 10.84.140.235 with SMTP id 98mr65616986plt.161.1491796760002;
 Sun, 09 Apr 2017 20:59:20 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id i3sm21291079pfg.117.2017.04.09.20.59.14
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 09 Apr 2017 20:59:19 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 10 Apr 2017 13:29:11 +0930
From: Joel Stanley <joel@jms.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v3 0/2] drivers: serial: Aspeed VUART driver
Date: Mon, 10 Apr 2017 13:29:02 +0930
Message-Id: <20170410035904.29443-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Mon, 10 Apr 2017 03:59:22 -0000

This is v3 of a driver for the Aspeed VUART. This version addresses feedback
from Andy and Greg, and includes Rob's ack for the bindings change.

The VUART is a serial device on the BMC side of the LPC bus that connects a BMC
to it's host processor.

We add a flag to the serial core to allow the driver to skip probing of the
THRE irq behaviour, which could hang due to the host not reading bytes out of
the buffer.

We've been using this on systems for over a year, so it has seen a good amount
of testing.

Cheers,

Joel

Jeremy Kerr (1):
  drivers/serial: Add driver for Aspeed virtual UART

Joel Stanley (1):
  serial: 8250: Add flag so drivers can avoid THRE probe

 Documentation/ABI/stable/sysfs-driver-aspeed-vuart |  15 +
 Documentation/devicetree/bindings/serial/8250.txt  |   2 +
 drivers/tty/serial/8250/8250_aspeed_vuart.c        | 323 +++++++++++++++++++++
 drivers/tty/serial/8250/8250_port.c                |   2 +-
 drivers/tty/serial/8250/Kconfig                    |  10 +
 drivers/tty/serial/8250/Makefile                   |   1 +
 include/linux/serial_core.h                        |   1 +
 7 files changed, 353 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-aspeed-vuart
 create mode 100644 drivers/tty/serial/8250/8250_aspeed_vuart.c

-- 
2.11.0
