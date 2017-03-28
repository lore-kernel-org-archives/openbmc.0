Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsfD10gX1zDqZk
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 16:12:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uONm+xtv"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id 81so46897347pgh.2
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 22:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nGfAkbklk1F2d3ov73vw6UNiHw+vQ0SEPC5pCxk2dNA=;
 b=uONm+xtvwGQNTyEGEIfbC4/FDFTrIz+w8FcjxuvVyPireaDEBAO9lv0hI4pFCgg1w+
 nM+MHE4npFOmUCmLUr/MXACwxW08Hrd1lBVrcVHDjjis0uOq1Bi4CIOCgN/qTrXVWxcU
 VBSS804uvbCJhnZvdU+SYBAn1fa6YLgknGjvsgVmXXHTdKD6opplLxR0VG7Ba72+V3dX
 gmXCbKkNXTYB8vpSzrF+EXEHVEqMADEKTW87tSPlSoAB5s5OmlovxYZaithI5RcHhVAu
 e2hSEYGvkr55lu8J2H2hc0aZoJEyTJ5k7s+TzYRR3OyLq1GC0xuAmVUW+loFwkd/rlHL
 6l6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nGfAkbklk1F2d3ov73vw6UNiHw+vQ0SEPC5pCxk2dNA=;
 b=ouvw1Z17nVnbOc7EaTqIWmEUDEHuOyhThBpFrEw3v0DrgMuLYc5VpM216nUvXB5p2m
 FQYZcgF9hSH8RfoJy2uMGxaDXMziDShWecMUdcn7q2tjPpCc9dqaiNvce2e7T6KcJ89y
 qTwrXiQO2FMix+Ef4YCxV5nQFXSMs+wHcy1Fx5O4z5eTAXrvLgbOP+TRQEgvFrkbJjoW
 OPtvqXSlZ1lrVkPo9tst8usG8WJdjdtaORhOrY6/0+xzq3BhR227cyMqF8TftM3yFIKL
 AZE9pzUKpu6GqeSisYD2jJrBExlddQYFWJn/y/1+5sSu6qtNwUro4zmYZw1DtJg9pirs
 2QlQ==
X-Gm-Message-State: AFeK/H2lNyZIHEwoA9VwySaCnM+l0mzWPK+8zY2cCGL1bljySulXtoBAYEoQMPlDe0nS2b6G
X-Received: by 10.84.241.139 with SMTP id b11mr26968371pll.107.1490677967166; 
 Mon, 27 Mar 2017 22:12:47 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id p19sm368233pfl.15.2017.03.27.22.12.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Mar 2017 22:12:46 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 benh@kernel.crashing.org
Subject: [PATCH v6 0/5] i2c: aspeed: added driver for Aspeed I2C
Date: Mon, 27 Mar 2017 22:12:21 -0700
Message-Id: <20170328051226.21677-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.12.2.564.g063fe858b8-goog
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
X-List-Received-Date: Tue, 28 Mar 2017 05:12:49 -0000

Sorry for the delay, I went on a long vacation prior to receiving feedback and
got back in the middle of a hardware bring up that consumed all of my attention
for an extended period of time. I will try to plan upstream submissions around
my other responsibilities better in the future.

Addressed comments from:
  - Vladimir in: https://www.spinics.net/lists/linux-i2c/msg27387.html
    and: https://www.spinics.net/lists/linux-i2c/msg27386.html
  - Wolfram in: https://www.spinics.net/lists/linux-i2c/msg27476.html
    and: https://www.spinics.net/lists/linux-i2c/msg27483.html

Changes since previous update:
  - No longer arbitrarily restrict bus to be slave xor master.
  - Pulled out "struct aspeed_i2c_controller" as a interrupt controller.
  - Pulled out slave support into its own commit.
  - Rewrote code that sets clock divider register because the original version
    set it incorrectly.
  - Discovered and fixed issue in implementation that caused certain slave
    devices to misbehave; the cause was that the master IRQ handler would return
    control to the requesting thread after the last RX or TX command was handled
    such that the requesting thread would issue either a repeated start or stop.
    This was incorrect because the time taken to complete the completion was too
    great. I fixed this by rewriting the master IRQ handler so that it now
    manages the entire transaction only returning control to the requesting
    thread once the entire transaction is complete.
  - Rewrote the aspeed_i2c_master_irq handler because the old method of
    completing a completion in between restarts was too slow causing devices to
    misbehave.
  - Added support for I2C_M_RECV_LEN which I had incorrectly said was supported
    before.
  - Addressed other comments from Vladimir.

Changes have been tested on the Aspeed 2500 evaluation board, as before, and now
on a real platform with an Aspeed 2520.
