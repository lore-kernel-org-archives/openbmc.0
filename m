Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyXL20yVKzDqH6
 for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2017 14:04:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rD3OguQV"; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id o126so311813pfb.1
 for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2017 21:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=T2DMXjMDt2TdPL9ko/CO2v7mE0QGLmyxFO30xm/hwIA=;
 b=rD3OguQVMS1SRvRoLgV0Lb4U2ZmxZZfDYWgO7F3KI/b69hSgY2prCkiwuhK06GQCZe
 49wYcctzq1wtSz98BZLY/OgcYyy7A3zHPet9bgQupzDdwlC1eCY09xDYzdF1hF34M7lc
 TSSKoSFVt+oeWAhSgPD2JJRUMgtbgko4KIt/hYe1oA5d9pVvU165wPleLF672y97fCnr
 /+os4OJNUtlOJqaI1Qm53QJ68EZXYFmfzd6Tvb/cjiU2krfTkig4nEw8sL3XjY6gotov
 IGIZMrCjOGRmPcQhf9Jz+SQP/gXCIFvMu0CiIGbAL48dHT4T7FE9MhEmLnHAoqbm2vkB
 KLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=T2DMXjMDt2TdPL9ko/CO2v7mE0QGLmyxFO30xm/hwIA=;
 b=qi/VmtmHqJovpX9aNG0Gm6m+fSXH7Qw6dVlj/7MrDy/Kmf9DCXgTsIXTdawkgMkoDX
 2Y7oa+VuIARaOICsPDJaBcxo+puFPr2TNYQbr9O9V4+A+r2uPKkAZNjUZom2QysCieYg
 8tarrIU33zT7+Y6n29/jUPqOEMSm82uMSePG5bihaD5PQr85QuPRVoZzbk7+L+Yph3a/
 EH3/klE6OgJXkTFoSGgBahH2BHMZPECoWGb93b9jBJ2OJbASb/jOrGLObyKtZEY0q+gT
 +Z07E35MwfVvIJ7MJMkKl70JbN4RwZMYXhNwiZIPqNd1AmnTQ01Z2XRdkLvg6smJ9phH
 2g/A==
X-Gm-Message-State: AFeK/H1PySX6Rjt9WGwtvO2TdtK3gLTSS8YF779hpieOep8czhvepPQJeJJVFtYCtIKrfQ==
X-Received: by 10.98.212.91 with SMTP id u27mr27143282pfl.117.1491365095764;
 Tue, 04 Apr 2017 21:04:55 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id r82sm27544754pfl.108.2017.04.04.21.04.49
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 04 Apr 2017 21:04:54 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Wed, 05 Apr 2017 13:34:45 +0930
From: Joel Stanley <joel@jms.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v2 0/2] drivers: serial: Aspeed VUART driver
Date: Wed,  5 Apr 2017 13:33:50 +0930
Message-Id: <20170405040352.5661-1-joel@jms.id.au>
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
X-List-Received-Date: Wed, 05 Apr 2017 04:04:59 -0000

This is v2 of a driver for the Aspeed VUART. This version addresses feedback
from Andy and Greg, and adds Rob's ack for the bindings change.

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
 drivers/tty/serial/8250/8250_port.c                |   2 +-
 drivers/tty/serial/8250/Kconfig                    |  10 +
 drivers/tty/serial/8250/Makefile                   |   1 +
 drivers/tty/serial/8250/aspeed-vuart.c             | 341 +++++++++++++++++++++
 include/linux/serial_core.h                        |   1 +
 7 files changed, 371 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-aspeed-vuart
 create mode 100644 drivers/tty/serial/8250/aspeed-vuart.c

-- 
2.11.0
