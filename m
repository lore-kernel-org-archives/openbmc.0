Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KdUpE4Wl"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLtjy2mVBzF0fM
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 15:03:34 +1100 (AEDT)
Received: by mail-pg0-x241.google.com with SMTP id s9so8785532pgq.13
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 20:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=PMbAzUheqi3qMGr0tejZwlNBFd2vU+clo6aW2ZtuqJU=;
 b=KdUpE4WlnrxZTedbLPoyt0y0exVTHY2txhDS+yXKBXcEiPKkZs2vpLFSOe3IeFGMNy
 KrQK4rfssS0toHQQWqM2TviKPoI4R9WKrdjr74uGG4PF8VGoZJxhd/WGe3N12aExYUHv
 vf4YrjiXz3cBmzHdmNfgOxe3aDBYbMFoU67zPvzdy5ZfkSnNTamvkdflGvCbv1gyQRAZ
 3XvCEGk5a8qWwS5D67Hfh4HEE2a4DKoz419AZ207L8xQVfM27Kb1hH4X0zLHKxOJ0L1R
 7YP1NBAsKgmft+lSc2nJ2MzcSTvZclr0nyQGNqopRgKIOzi17T3gGI9TWUjUhP/kMuQa
 B7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=PMbAzUheqi3qMGr0tejZwlNBFd2vU+clo6aW2ZtuqJU=;
 b=D4MjL9OYfAskAqDkuqtVxsbdIqAh7JUeLUNrYB4i9VD9t6eD2o0qmi+I6OmA1JkE/M
 AV7q7ysI1zKixrT3iOzHyYnGEPtIKqabV4hb7v0V3xZmO3lRh80GYWmAO5xBCR0UTHGi
 3mCf6dQ44fX2TobGoBSFYpAGgqjsdwNAKi2EkP2biOOs8LlYq4GGvozPxa9rOc1AOEU5
 wEAFZr038RtprpoUhzHLdwY1jtypDgSw4GPFjocuEV+sOpHELELidrNuEaNuv3I2SKb3
 6tqQi/voXKPIqjXDvsJt5F1wDvuHajfTq4hbL5FDruUNaQ6SA94cfGKwnhqbdvShMPzk
 PhAg==
X-Gm-Message-State: AKwxytfY9kErj902CVFlDj0C3jtMAKX9w9fZigjv8WBI7OUT7GhLSVvJ
 6wdU5CVyBk9um31wKUcpFeOskbUz
X-Google-Smtp-Source: ACJfBotdNarPWG/vT2TwWQCq8zbMSUWKBnR162XW7y7NQOIl4ouWhb+o59jA2B3MoaO+HrNpS1BonA==
X-Received: by 10.99.171.12 with SMTP id p12mr5072473pgf.304.1516161811582;
 Tue, 16 Jan 2018 20:03:31 -0800 (PST)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id r2sm5045965pgn.94.2018.01.16.20.03.30
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Tue, 16 Jan 2018 20:03:30 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 0/3] hwmon: add w83773g driver
Date: Wed, 17 Jan 2018 12:02:50 +0800
Message-Id: <1516161773-16137-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jan 2018 04:03:35 -0000

This series backport the W837373g hwmon device driver from upstream.

Guenter Roeck (1):
  hwmon: (w83773g) Fix fault detection and reporting

Lei YU (2):
  hwmon: Add W83773G driver
  hwmon: (w83773g) Add documentation

 Documentation/hwmon/w83773g |  33 +++++
 drivers/hwmon/Kconfig       |  10 ++
 drivers/hwmon/Makefile      |   1 +
 drivers/hwmon/w83773g.c     | 329 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 373 insertions(+)
 create mode 100644 Documentation/hwmon/w83773g
 create mode 100644 drivers/hwmon/w83773g.c

-- 
1.9.1
