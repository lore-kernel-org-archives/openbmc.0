Return-Path: <kunyi@google.com>
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t13kx52F5zDt2g
 for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2016 11:46:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Y5HVkVuz; 
 dkim-atps=neutral
Received: by mail-pf0-x22f.google.com with SMTP id 128so65461744pfz.0
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 17:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=VdD53qkiZBzapQLUZzOkaj6GI7gY85Zq9ST+1+GPI2s=;
 b=Y5HVkVuzJv9F2uqBhGBbmhjGdDrLhEk60ZHREpXkYwPzr4ZE1HXvtXT84aaex2N9dh
 t15jwG9OJGECAkBwzk/JTgUSi/tDOLY6D24Uf0TTaBs+6hAuoVbb1qhvJnlenbHolbfi
 jOGYoZjXPvLte9RzianqqfW/DbY3+0Vo6xl2QwTZfjiliu2BPU86cs7KrpbgZy5ip0Bx
 wUxbjwkmRjGyXCnmDogT4QlQhi42gUkIxi0qBtPfkvN6hckGM7bfIMXdYJ8pRA/UTOe4
 YsjFc/iVxYD14qQUZqZDuKEOIH5YrdurcuYZQNLM/mW5hVEV2nguuan8kRjwFU8sabJx
 1Chw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VdD53qkiZBzapQLUZzOkaj6GI7gY85Zq9ST+1+GPI2s=;
 b=HF3L7/k8+1mUPfysl3nu3jKi15/o5cpITxUMAX1avsZgSd1iS3SCc13ggVdYkJkDMc
 3FNJCswybmVzc5eOlKQJNCc+nHMFZnzqkZg2GDEZR6xugMcsHrQVWPeXQZrYM7ncbK8u
 w/xbZppGFUsFXDP3NRTg2m2qJpZr8qsebIqj5KzW+zapQegyEv6K8ymCVgOQZ/I6wNrN
 wBNZLacSXaaKUxbrJCLWInfxRhzwlgxOl+Z7O5VjZWQftZKu8AwBNczA/T8W2y6Rj85f
 5TBqIXgLcVVSdLdMrScfMNgCp7U1iDIcYVpl4f0g7ucA35VydTO4Xu0kA4VUk+x6csb5
 N4+g==
X-Gm-Message-State: ABUngvf7JIN+edyEqq+AkMZ0ljV5eiukGQwN0FaLerXi5pVnheHZ1y/PpmH+Wh0W8bDI1RbJ
X-Received: by 10.99.117.91 with SMTP id f27mr5288957pgn.75.1477097174939;
 Fri, 21 Oct 2016 17:46:14 -0700 (PDT)
Received: from kunyi0.svl.corp.google.com ([100.123.242.82])
 by smtp.gmail.com with ESMTPSA id yk6sm7682599pab.43.2016.10.21.17.46.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Oct 2016 17:46:14 -0700 (PDT)
From: Kun Yi <kunyi@google.com>
To: openbmc@lists.ozlabs.org
Cc: kunyi@google.com,
	brendanhiggins@google.com,
	clg@kaod.org
Subject: [RFC 0/2] spi: aspeed: SPI1 mode control driver enabling sysfs control
Date: Fri, 21 Oct 2016 17:45:56 -0700
Message-Id: <1477097158-139095-1-git-send-email-kunyi@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Sat, 22 Oct 2016 00:46:19 -0000

Hello,

I'm looking for feedback on a simple Aspeed SPI1 mode control driver that does two things mainly:
1. Expose a sysfs interface for userland control of SPI1 interface.
2. Optionally override the SPI1 mode at probe if "start_mode" is configured in 
   device tree.

Aspeed 24XX/25XX support three interface modes for their SPI1 interface,
which can be configured via HW strap register. In the typical case of connecting
a host flash chip SPI1 interface:
- SPI master mode makes BMC the master to the host SPI flash
- SPI pass-through mode make whichever external SPI interface connected to SYSSPI 
  be the master
- There are also "disable" and "debug" modes. Aspeed 25XX specified the debug
  mode is reserved though.

In particular, SPI pass-through mode would enable an external SPI master to
directly program host SPI chip and possibly serve as an alternative way to LPC
for host CPU accessing SPI flash. I think by providing a sysfs handle, userspace
applications can have a flexible way to mux host SPI flash ownership between 
BMC/external on the fly.

Overriding the SPI mode at probe time can be useful to make sure 2500-smc flash
controller always identifies the flash chip and create /dev/mtd files correctly.

I wrote the driver as a standalone misc driver for the ease of initial implementation.
There are other options such as merging the functionality into the SMC driver
itself, possibly enabled by optional device tree arguments/nodes, but I just want to
send the patches out first to gather comments on perceived usefulness of
the feature and how you think the driver should be constructed.

Feedback greatly appreciated!

Regards,
Kun
