Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x6DJq5lJLzDqg7
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 17:30:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oDOi7HjG"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id y129so946735pgy.3
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 00:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=OWggGqJgDzbZldput78rgnLVYKjPldUYyeRpzBcCjbM=;
 b=oDOi7HjGRkqoK4YRWrVZ2pVsvaKbo8LpATNRjISOl/3Op1PTlnqoO/3QwRwvIFMD2u
 p+uWsLxWDGqjHSCUCIluIEHH1sKpDRaPcOvAGmLKUdfijcly/oKfUbjYr4gxrEu6DObX
 iyYARyxKB2JwYwqJM50bkASfEaEb68WY06U9QKyXpv9ZH9uPmpvbVxHEX8aTE+cFEsTc
 En+2J/MFgmOWqtG1kJEEETUklIcQ5+GxpKh2SWs/z0grU0LP6an0iPMHtht4k4RvHxOr
 Wk7N0fr2u2gASFvqIjhFmw7s77h1hbldfno4z56Z2197Yopm0QBpV7z8CWI//EtxLN8A
 Kwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=OWggGqJgDzbZldput78rgnLVYKjPldUYyeRpzBcCjbM=;
 b=RzwI7c2Wc5YUkXetKXNRvu1XQ65GekuHe2uEeHrJ2vmeBmlK6imsk7167kJjJ8pgro
 727VHXuCDFTzJbnACALmTLUle/xg1EbtSHpLA4gJnX9z4Cp3W2R0qb47WXf4PzTmK2gE
 2SumvtjZjmL9UQz4NJoqF5vR0W0A5Xmh3u8ha8fSgtxaqj5kFWfW1JIGcuMZznO4D/SD
 TVBjrjfOAgBsxfImd2z362zWbFRI1OfKMAE7kO2M/KzHOZottnD5wBQQfifHKHkOBnLH
 OB8f/ozBzQl8cRc4Oxb0d1GasvnvC/pPuY+UeKIRblfVVuGnYWA7XA/XwpyoJ2BluNzF
 ZXoA==
X-Gm-Message-State: AIVw112KrK/9cTTk58HU8eZvk6OkFrzYdqzEYpjO/1AunUcJuax2s1LE
 MNCqp75qN1VlmQ==
X-Received: by 10.98.69.91 with SMTP id s88mr12305316pfa.183.1499758249940;
 Tue, 11 Jul 2017 00:30:49 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id c82sm26950408pfd.5.2017.07.11.00.30.46
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Jul 2017 00:30:49 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 11 Jul 2017 17:00:43 +0930
From: Joel Stanley <joel@jms.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Jeremy Kerr <jk@ozlabs.org>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH] fsi: core: register with postcore_initcall
Date: Tue, 11 Jul 2017 17:00:39 +0930
Message-Id: <20170711073039.20700-1-joel@jms.id.au>
X-Mailer: git-send-email 2.13.2
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
X-List-Received-Date: Tue, 11 Jul 2017 07:30:52 -0000

When testing an i2c driver that is a fsi bus driver, I saw the following
oops:

 kernel BUG at drivers/base/driver.c:153!
 Internal error: Oops - BUG: 0 [#1] ARM

 [<8027cb1c>] (driver_register) from [<80344e88>] (fsi_driver_register+0x2c/0x38)
 [<80344e88>] (fsi_driver_register) from [<805f5ebc>] (fsi_i2c_driver_init+0x1c/0x24)
 [<805f5ebc>] (fsi_i2c_driver_init) from [<805d1f14>] (do_one_initcall+0xb4/0x170)
 [<805d1f14>] (do_one_initcall) from [<805d20f0>] (kernel_init_freeable+0x120/0x1dc)
 [<805d20f0>] (kernel_init_freeable) from [<8043f4a8>] (kernel_init+0x18/0x104)
 [<8043f4a8>] (kernel_init) from [<8000a5e8>] (ret_from_fork+0x14/0x2c)

This is because the fsi bus had not been registered. This fix registers the bus
with postcore_initcall instead, to ensure it is registered earlier on.

When the fsi core is used as a module this should not be a problem as the fsi
driver will depend on the fsi bus type symbol, and will therefore load the core
before the driver.

Fixes: 0508ad1fff11 ("drivers/fsi: Add empty fsi bus definitions")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index a88df7a2b466..5966ecb72f37 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -889,17 +889,16 @@ struct bus_type fsi_bus_type = {
 };
 EXPORT_SYMBOL_GPL(fsi_bus_type);
 
-static int fsi_init(void)
+static int __init fsi_init(void)
 {
 	return bus_register(&fsi_bus_type);
 }
+postcore_initcall(fsi_init);
 
 static void fsi_exit(void)
 {
 	bus_unregister(&fsi_bus_type);
 }
-
-module_init(fsi_init);
 module_exit(fsi_exit);
 module_param(discard_errors, int, 0664);
 MODULE_LICENSE("GPL");
-- 
2.13.2
