Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3Kyq73NQzDr3x
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 00:35:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="g787/FtL"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id u62so481765pgb.0
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 07:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=s6nNrXC3Lk/iJ0jl22DrNVIzlQomtB5QNe9/xZ30EwI=;
 b=g787/FtLnpFBIgqfLbHEygz5+ioZjODgFWiy5pN9WoUWLG61FCiXg3QQXixZizbJU1
 ObBNu2qTMhzpPHXjs0v5VwuIWI7yEl59YXRQd7QMN3MxyuwhPG8glvNhk/3FKLyEbtvT
 4xJSn6NY5iCaEj7Z9RfPhOD6UYHpO1vpYniuLgmd84GIXDjjI2Avv5GTFo1bZZKRDoVB
 9h9VLKVXAz3VIfTeIZkbVYoYEAk8PdBcZiCD/doNODuUpoUPWcNGVXq5TrUl8NGs5Yb/
 VNaXC/BqcwCyV+qNRO64+dQG0uCnH4awxbwidr4lQ7InevZT8O3mOHcBoNGtw37qeSXu
 LP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=s6nNrXC3Lk/iJ0jl22DrNVIzlQomtB5QNe9/xZ30EwI=;
 b=X3zvUK37Xtqa7VCgLzDZjWVx7XjCf6mSqSO+jGwt7JVRFH5NSSEKln+2NxFvm5308W
 AHlMj/IQ4sgRFbvyycKHdoRWC94XUrV1qZCNk3rKKiNHZnqMtio1ozFUNMTSt4PVBpr1
 bEYjgt+geVBmjXJvvcmQ2vAeaHUiSLd3AiH3LifbhOLa8UhsMd6vM3tiXlMsLFeSXQ0H
 MacToTGrmgfrZDDq4gxsRaanMkLbacBZ6laxVIwzMhsvmbQI79r8bRDDVAJQDMXy4mb8
 COpfjVI0f36s8yN2Ckg8xLvl/mAQyPN4FAKO/SMONnCtgghfikewc9HapLhbznx7HG6q
 RsfQ==
X-Gm-Message-State: AIVw110MKjVhvxQ8f79icSCzyp4A0FAnnbj91qasc3eJoa9zZSjwIuYN
 3P+FNStdbsr6EIUlpMY=
X-Received: by 10.99.134.199 with SMTP id x190mr26745899pgd.127.1499351713545; 
 Thu, 06 Jul 2017 07:35:13 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id q19sm1293805pfd.24.2017.07.06.07.35.10
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 06 Jul 2017 07:35:12 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 07 Jul 2017 00:05:06 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10 0/4] i2c fsi fixes
Date: Fri,  7 Jul 2017 00:04:59 +0930
Message-Id: <20170706143503.21888-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 06 Jul 2017 14:35:16 -0000

Hi Eddie,

These are some work in progress cleanups that I have created for the fsi i2c
driver.

Patch 4 causes the kernel to crash when scanning for devices. To reproduce,
boot the system and do 'obmcutil poweron'. According to the device tree
bindings, his change is correct:

 https://github.com/openbmc/linux/blob/dev-4.10/Documentation/devicetree/bindings/fsi/fsi.txt#L56

 > Since the master nodes describe the top-level of the FSI topology, they also
 > need to declare the FSI-standard addressing scheme. This requires two cells for
 > addresses (link index and slave ID), and no size:
 >
 >  #address-cells = <2>;
 >  #size-cells = <0>;

The code suggests the same:

 https://github.com/openbmc/linux/blob/dev-4.10/drivers/fsi/fsi-core.c#L628

 > na = of_n_addr_cells(np);
 > ns = of_n_size_cells(np);
 >
 > /* Ensure we have the correct format for addresses and sizes in
 >  * reg properties
 >  */
 > if (na != 2 || ns != 0)
 >	return false;

If you don't apply that fix, we do get one of the chips probing correctly (I
assume the hub, as it has the correct format).

Another issue is patch 2, which removes the statically allocated port numbers,
where you added 100 or 200 the port number. To retain the old behaviour, I
suggest you send a patch that adds aliases instead:

 aliases {
	 i2c100 = &cfam0_i2c1;
	 i2c101 = &cfam0_i2c2;
 }

That's a workaround though. We should get the people using these interfaces to
discover them properly, instead of assuming they exist at a magic offset. sysfs
is a good way to do this.

 /sys/devices/platform/gpio-fsi/fsi0/slave@00:00/00:00:00:03/i2c-19/

Joel Stanley (4):
  i2c: fsi: Remove ida counter
  i2c: fsi: Dynamically allocate port numbers
  i2c: fsi: Remove idx counter
  ARM: dts: cfam: Fix hub node

 arch/arm/boot/dts/ibm-power9-cfam.dtsi |  4 ++--
 drivers/i2c/busses/i2c-fsi.c           | 28 ++++------------------------
 2 files changed, 6 insertions(+), 26 deletions(-)

-- 
2.13.2
