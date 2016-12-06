Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x233.google.com (mail-pg0-x233.google.com
 [IPv6:2607:f8b0:400e:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYJ132y1CzDvkV
 for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2016 10:36:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="U8n0+xV2"; 
 dkim-atps=neutral
Received: by mail-pg0-x233.google.com with SMTP id x23so154404666pgx.1
 for <openbmc@lists.ozlabs.org>; Tue, 06 Dec 2016 15:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=aE1yVZ7PuHZwfwKjxfDCAaquYXrrGQ9rcJ5JrOk5efo=;
 b=U8n0+xV2HjXpBUX+YHzeoVozmbDXxSbI2yYtZTLvb/ip2qwhdVYmNWeLtzjM+/LN1p
 pko9Md6GS2md8AAXa683HzBFgFJ/80PXjkMf4Qysp1tiRtzxP9jkH3DtYgLjQkW5USil
 Ne8sQZ3uTS623wzhCdn6rOZLVla9cLKSw6eDhqjropcnNu1HIVx9YfD+G5j3dgjJOp7l
 InsX9QeR5lg5I+tp3rsBvkVMzZ1hPFt42m94jd0xJcCU9hIo1G0dER+HlXI0Rb24j5Ko
 hdy02jlL1Fu149VjuLtVr/zK3RJUfK90ow+vhB8KxiBSGnWjccq2sify2Qxybqo36QuJ
 +K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=aE1yVZ7PuHZwfwKjxfDCAaquYXrrGQ9rcJ5JrOk5efo=;
 b=Fd81h5hznm60m4V+VuiJdPMb5Isc8sI0I4qiVQasOdqrU3viYAA+erT1W1yNVJfLLD
 nkJHjCNaO9hcUT1lvTgXWQy7bHP6Sng3pGytxhyMer9j58etX/jXJZabmYK1XzhtAcNK
 AIAzm3JiEGuV7xKDWmV/g2+d8KUULRP8L9JlfNR513GLTF1d2lephfv6BzQe3lSF7L61
 FIkZwEIsdFDoeNilahFv+0ssQA516WupDyaG8+khEkeOMOxhPv/BPmDwTSqG1vHTToKw
 Y5GohzEt7HRhSouoY5kX9fGVJR115JpOvqfvyTBwWoNNTUelUuTHSRvIlRX6Zj4qT+80
 +Mvg==
X-Gm-Message-State: AKaTC01W0SwoRik0fKcydA7WZ5A0PH4qF9l8bd2pYCRiCLeV8oeIosGqt8fzmHWaTWL5++es
X-Received: by 10.99.19.65 with SMTP id 1mr116628339pgt.71.1481067380292;
 Tue, 06 Dec 2016 15:36:20 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id b126sm37142409pfg.90.2016.12.06.15.36.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 06 Dec 2016 15:36:19 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Cc: Brendan Higgins <brendanhiggins@google.com>
Subject: [RFC linux 0/2] spi: aspeed: generic spi master
Date: Tue,  6 Dec 2016 15:36:01 -0800
Message-Id: <1481067363-3782-1-git-send-email-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 06 Dec 2016 23:36:24 -0000

Some time ago we mentioned we are interested in a generic spi master for use
with some sensors that were not flash chips; that was some time ago so I do not
expect anyone to remember. Anyway, I implemented an initial version.

I stole the *read_from_ahb/*write_to_ahb methods for the spi nor driver; so we
should consider, at the very least putting those in a common library, but I
think we could probably share even more code between the implementations: the
m25p80 mtd spi driver provides an mtd interface given a spi master; so we might
want to consider rolling the spi-nor and spi-master into the same driver.

I am especially looking for feedback on how I did the multiple io port ranges;
currently, I require two address ranges to be given, in addition to the address
ranges for the control registers, one for each chip select. Obviously, this does
not completely work for the fmc spi master, as it has three chip selects and
three coresponding io port regions. I was thinking that I should not require all
the io port regions to be specified and then just limit the available number of
chip selects, but that is kind of messy for someone who wants to use the third
chip select, when there is nothing on the second chip select.

Not yet implmented:
 - DMA support: we are not interested in it at this time and it probably does
   not belong in an initial version anyway, but I could implement it in a future
   version if someone really wants it.
 - AST24XX support: we are not using the chip and do not have any copies to test
   on, so I have not implmented anything for it; again, I do not mind adding
   support for this, but I will probably need someone's help.
 - clock interface: currently, we do not have an interface for the AHB clock,
   so there is no clock interface for the spi master to use; the current spi-nor
   appears to be in the same place. I do not think we have much control over
   this clock; even so, should we implement a fixed frequency clock as we have
   done for the lower speed peripherals?

I have tested this on the AST2500 evaluation board.

Brendan Higgins (2):
  spi: aspeed: added generic spi master for Aspeed
  spi: aspeed: added device tree documentation

 .../devicetree/bindings/spi/spi-aspeed.txt         |  33 ++
 drivers/spi/Kconfig                                |  12 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-aspeed.c                           | 582 +++++++++++++++++++++
 4 files changed, 628 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-aspeed.txt
 create mode 100644 drivers/spi/spi-aspeed.c

-- 
2.8.0.rc3.226.g39d4020
