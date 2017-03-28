Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsfxb71mqzDqf4
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 16:45:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HVvmcl0D"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id o123so15835073pga.1
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 22:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=h9WaVMalKuVNVo517WePUiV0dkUcIkdEEuVBEjd5qy4=;
 b=HVvmcl0DWjBvuXcaTFD+ELIH84/yNzw5gcMPu/VZuAg/r/q/Hwx0NJmCOHnjVWP9no
 zipl4bzNaSzVrsbtOSBy398X6Sy06Vkw4CMFFHrSTbcVUc7ybA29rXwtZotLPEZcn6KW
 4D5xZTXp0An4eRets0J9FcueYkbm5O7TFBtY2tEFrOSsmunzObC46eLkD1ktp7LQcu9b
 iWhuE380qs4NgeCogdABPeng8zn9aEtBxKWCc8cAFpJyiXB9Pna5xQ3F0fDZytMf2ZPO
 rUGlDSK92arHIvyz0Uv62ey5gN0p2YpklN1ZpG9aPt2YrEmkD+2JLPvdvwwPb06d+gUW
 J5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=h9WaVMalKuVNVo517WePUiV0dkUcIkdEEuVBEjd5qy4=;
 b=a/YGscyHUcT4ngbkkwn3eYoeOxoua9JF9xeO9J59pBbXFnmaszr9EJxHO35o2byhXp
 7eP6Rwjd24i5AY2JAuSGkhyO3L9gHWCo1bvMSIL5r4590Jo7OFGVQ/SrpfBRC0goLi+r
 ak3IVd0wI0lt2++X17P5ADFJGw01jS+GI1wC8540DdbKex4Jt3Za01LK0HGa1Pwsh3eP
 oDtV4QA5Pdxsf4gCny3qQmsnZc+NJ6QmJp4lMTugS6CTGhwi3MG7t3QyD0UudLZSJPOq
 V6lxJRTMXEjuzeQBMPbwFW/49RSKtRHi43KaqvJz32+UF9f4agLSbh6RQ0WTfe1I3Tt3
 alAQ==
X-Gm-Message-State: AFeK/H3WPwCfdyE0fVLwk65VkEFGFsUa2ypn1UlqqU08vty6s+2dj6GCPugtmcHYt48s9w==
X-Received: by 10.98.80.93 with SMTP id e90mr30013419pfb.7.1490679921354;
 Mon, 27 Mar 2017 22:45:21 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id u26sm4448758pfi.89.2017.03.27.22.45.12
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 27 Mar 2017 22:45:20 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 28 Mar 2017 16:15:05 +1030
From: Joel Stanley <joel@jms.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH 0/2] drivers: serial: Aspeed VUART driver
Date: Tue, 28 Mar 2017 16:14:56 +1030
Message-Id: <20170328054458.29341-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 28 Mar 2017 05:45:24 -0000

This is a driver for the Aspeed VUART. The VUART is a serial device on the BMC
side of the LPC bus that connects a BMC to it's host processor.

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

 Documentation/devicetree/bindings/serial/8250.txt |   2 +
 drivers/tty/serial/8250/8250_port.c               |   2 +-
 drivers/tty/serial/Kconfig                        |  10 +
 drivers/tty/serial/Makefile                       |   1 +
 drivers/tty/serial/aspeed-vuart.c                 | 335 ++++++++++++++++++++++
 include/linux/serial_core.h                       |   1 +
 6 files changed, 350 insertions(+), 1 deletion(-)
 create mode 100644 drivers/tty/serial/aspeed-vuart.c

-- 
2.11.0
