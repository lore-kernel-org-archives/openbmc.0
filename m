Return-Path: <SRS0=Uzhw=E5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3839C2D0E4
	for <openbmc@archiver.kernel.org>; Mon, 23 Nov 2020 07:47:23 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2998F2073C
	for <openbmc@archiver.kernel.org>; Mon, 23 Nov 2020 07:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfdFOa/y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2998F2073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CffPj0hzJzDqJm
	for <openbmc@archiver.kernel.org>; Mon, 23 Nov 2020 18:47:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FfdFOa/y; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CffMs121RzDqDV
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2020 18:45:44 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id b6so3686023pfp.7
 for <openbmc@lists.ozlabs.org>; Sun, 22 Nov 2020 23:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BFitlouLqV5WjAV4yis+SNy1ksEBkbSXVdeVWFMxCgQ=;
 b=FfdFOa/yYakciFlKN4s4XKzdLppr3kFkdihyIqw6pVOmbiIvPV4hnA+HOCX4tMdJ+5
 kwyOZ0IOBV9C7zvY/+LD4FRDDCj2Q9g2o+MammUxnHjQuLzmzl5ebbdUFr/aYZkuQH3C
 IsIOwrPgUGdg0wO9jVME4yIEKj2FWwGFU1itdcjjBAK/EbVOOBSB+05kb2xFoNQvHwRZ
 GHX2T2H9d0UZjf3vKW8fPqcS62E9J1TeIJxPmTSaEdPelUFsnI6tc66YG/bUWZpBwg+P
 4jtC2j1P1NTvwMzGEHgU01iAQ8z5Xqvo0t5lGYPHEfwq/XeubjjrkA8tVy7q9CPlCVDU
 RViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BFitlouLqV5WjAV4yis+SNy1ksEBkbSXVdeVWFMxCgQ=;
 b=TBLhIKPRtX1xl578FY/s+cD22TAPifyKGVJV/CUz/Pr1pY5fxsb/nKx+HTT4LuD1qT
 4Pcg65wI/GacrC9CqDgn0qNYv/xybxpYCFwTdcUAp1sOLXBLluCgtBk97DCedQ8P59TG
 Fvx2gd+PvZS8Kb2OLBHb/zvKmTeGhf1FT6fU0Q469tjjH7ABYuScKpLEOXWyixrQxqek
 6YGIOOe5gdWxBPlJFa/lm2cuHhLBjx5PFRhde7KNwzVyerkKg2iG0qVb/y1vL2W5X9Gj
 TBwBYNjMshcVrOmqQFQFyJX2sW7SSni+l7DdhBZd25p12EBsIr5D01HKjBwo+NfQs7Gk
 H7DQ==
X-Gm-Message-State: AOAM530J9UNaHUERZFa+Px5pKNN9d+HReZl2F95AmGfaGx2fRbV3/AEs
 skOJORd05n9WIyU877/ICXU=
X-Google-Smtp-Source: ABdhPJyXUUqOuVScJwF1uK//p0FtqpPoILzGVsy9yWd3AX1S6EqzWMd6jO710sDbiwjkEihrx4PXIg==
X-Received: by 2002:a65:4c0a:: with SMTP id u10mr527328pgq.294.1606117541329; 
 Sun, 22 Nov 2020 23:45:41 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id 12sm13176340pjn.19.2020.11.22.23.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 23:45:40 -0800 (PST)
From: rentao.bupt@gmail.com
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com, mikechoi@fb.com
Subject: [PATCH v4 0/2] hwmon: (max127) Add Maxim MAX127 hardware monitoring
Date: Sun, 22 Nov 2020 23:45:30 -0800
Message-Id: <20201123074532.3730-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

The patch series adds hardware monitoring driver for the Maxim MAX127
chip.

Patch #1 adds the max127 hardware monitoring driver, and patch #2 adds
documentation for the driver.

Tao Ren (2):
  hwmon: (max127) Add Maxim MAX127 hardware monitoring driver
  docs: hwmon: Document max127 driver

 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/max127.rst |  45 +++++
 drivers/hwmon/Kconfig          |   9 +
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/max127.c         | 346 +++++++++++++++++++++++++++++++++
 5 files changed, 402 insertions(+)
 create mode 100644 Documentation/hwmon/max127.rst
 create mode 100644 drivers/hwmon/max127.c

-- 
2.17.1

