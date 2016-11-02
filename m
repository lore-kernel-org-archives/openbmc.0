Return-Path: <kunyi@google.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8NNw0K1XzDvNf
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 09:41:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=JEPNGAXA; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id d2so19215019pfd.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 15:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=iDRBOu5zkTQV1L/tYI7nzPCXX7irScVCkWbKyL2sEJw=;
 b=JEPNGAXA+d5Lk64bZA9NcBj8s628m65P6uZflmPRY8r3FMkV1ASyaUUbituSEI2SKN
 sDTAh3p+RWXdhtThF8b9MyPJQpBrUhNvPv9ToiUlRJI3NPOKT3qAMJaZBQI3YprF4qPv
 J3bMkUHgIbks2DFRmqE9qRRu9hz0wEQ43QbxY5gtY8C3ZrhjlCsWwZ/EU957zMKSvEph
 3LjBHwUv00WYbQ5KIl2uJV17u+LeuWNPsXcD43du5MIYFAh/KcvIvd9SdIj94wtJ7zkW
 6kfqzvHEUJhwy7BPNvKVdOqRkE3RrI9X/un2/PlmeH0aPyXOI5jKc5eRqPESpJ4AxnKC
 6MmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iDRBOu5zkTQV1L/tYI7nzPCXX7irScVCkWbKyL2sEJw=;
 b=nDCH3da0dV1p5u0iPCJdu8Ut+oEIzStMQ01tFlomQl4iEaukIYJOAGHJNJpXu+tuzV
 Sy6uTYZBTZOSpA32ifqKN9VC3uOB17f6VDmwBXXoSf2Ag+rypuMKSrVR//wNr2Jc4IuG
 yMApkF+DEQPg7VSvz+ruQBxY2oeHTMggXIBeqXE2Fk1jMXG4UP8snJPaWnoNk5yfqKDA
 IQF+LxZoSh943cP5l/AW0RRYgyhEV/rnoO0Au200wOkyxojmpzGtOwuTMmh61pa9LhGE
 dzJMN81922U+LlRd2sCns9Mni9qErQXyRWc1SCTO51tYAJ8YS2ibhi78hh7/QQYTHQDh
 /P+Q==
X-Gm-Message-State: ABUngveeG+Iedx02Pmv/Qs91SMYaH/omOEEDO3NRk6AHTmc8fxt8e9f4Df0ceSZdLg0rVkNR
X-Received: by 10.98.220.10 with SMTP id t10mr11185097pfg.47.1478126461484;
 Wed, 02 Nov 2016 15:41:01 -0700 (PDT)
Received: from kunyi0.svl.corp.google.com ([100.123.242.82])
 by smtp.gmail.com with ESMTPSA id n7sm7130061pfn.62.2016.11.02.15.41.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 02 Nov 2016 15:41:01 -0700 (PDT)
From: Kun Yi <kunyi@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-4.7 v1 0/1] Enable pinctrl to modify SPI1 strap bits
Date: Wed,  2 Nov 2016 15:39:39 -0700
Message-Id: <1478126380-3189-1-git-send-email-kunyi@google.com>
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
X-List-Received-Date: Wed, 02 Nov 2016 22:41:05 -0000

Hi,

This is a patch related to Andrew's suggestion to a previous RFC proposal[1].
To modify SPI1 mode at runtime, pinctrl subsystem will need to add exception to
the read-only HWSTRAP rule. This patch does precisely that.

Sending this out as a standalone patch since it seems to me this change could
also make boot time SPI1 mode configuration easier. Instead of configuring
the strap bits in mach-aspeed/aspeed.c AND make sure device tree pinctrl
settings match what was configured, with this change device tree entry
should dictate default SPI1 mode regardless of what's set previously. E.g.
following node will be able to configure spi1 in master mode.

&spi1 {
        status = "okay";

        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_spi1_default>;
};

I saw Joel sent out a patch that configures SPI1 to master for every AST2500
machine, do we not have any uses currently for other modes?

[1] https://lists.ozlabs.org/pipermail/openbmc/2016-October/005194.html

Thanks,
Kun

Kun Yi (1):
  pinctrl: aspeed: Enable ASPEED pinctrl driver to modify SPI1 strap
    bits

 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 22 ++++++++++++++++++++--
 drivers/pinctrl/aspeed/pinctrl-aspeed.h |  2 +-
 2 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.8.0.rc3.226.g39d4020
