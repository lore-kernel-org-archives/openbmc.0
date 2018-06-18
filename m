Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::244; helo=mail-pg0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I5QHNF4R"; 
 dkim-atps=neutral
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418H4z37mdzDrcd
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 13:43:47 +1000 (AEST)
Received: by mail-pg0-x244.google.com with SMTP id w8-v6so3850951pgp.7
 for <openbmc@lists.ozlabs.org>; Sun, 17 Jun 2018 20:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vW8hSGqoPhF3gV/V/CNgNC3w3PhnFtWOtpGzGgm32dg=;
 b=I5QHNF4RB/YAqcD1hIP8O7yWrUqwgbTqEUtfNM+eypqhL9aGwo71KQdJt3RCOJP/8T
 OY+4PCuy1X5oubFL2EJq9PGZ214+iTIXnh+SwETacqj7Uy4SQUZZqDK0zSTWlqN/Ynfe
 yMmquvNtoJ/hbGHyy7nsWJMo/2Wc/Uf/57cOzBU5nsvPgh0ulXDdALI92k48IzSLmw94
 m5YTtvxUxuL9M0G5ii9pWBCgMFWx56vZvOrNYMN10yVFQKrDCmCQMY0/rquJjW1Xh/iO
 gRiw35hLhDtHTHx7r8E0aQLhd9Uf4p9J0uZiVnr2fcHn/A5MsZ3dr5+7Bk88Mb73nmnc
 JEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vW8hSGqoPhF3gV/V/CNgNC3w3PhnFtWOtpGzGgm32dg=;
 b=k91Gu8kAZABmkDcJSkIkpvmac2JQ06hom3CArqNPQI1G5KhxOlbTPyCfiHkSGXDOB/
 /NS6Sk510cJlSMoag88u1qusgrh9pmsjz4phgFvxl+o57debOhhyCRCYVvYfmibCCt1k
 zuvvJauubROK+PsLRrovM0/WASJmQD1y25MeMGuRIJ/45PvAX2CbqoFXOCPySChC0geU
 lgKa/HPvvokf3lyn9AkKI8X6OrOPeQCwYH7JvnNDPofEczIO3lM/guy8s15adVjAbgxr
 hrJH4pIqxG2T8s7b6TpyW4q983kfESjPYWZl6SbMFdOu+JLTXBG20vSsnzzvRXWGuEuT
 SZoQ==
X-Gm-Message-State: APt69E2x1gNQYB+pxTcjLxSTracHZoDVZMYqE0NkIJZFF0sY21iEHhZL
 KvOEQgI54RlnVQxSVxxrqVOAOuxr
X-Google-Smtp-Source: ADUXVKLlp6997rv2w/Mz5UvAu9OHWxolRWZYfGCzp1hCEpl1krrP5zGD6jF9U8EPqNxz1CJYYYCX+A==
X-Received: by 2002:a63:7b51:: with SMTP id
 k17-v6mr9538820pgn.55.1529293424610; 
 Sun, 17 Jun 2018 20:43:44 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id j8-v6sm4327639pfe.84.2018.06.17.20.43.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 17 Jun 2018 20:43:43 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 18 Jun 2018 13:13:38 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH 0/5] FSI warning fixes
Date: Mon, 18 Jun 2018 13:13:30 +0930
Message-Id: <20180618034335.9732-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2018 03:43:48 -0000

Hi Eddie and Ben,

I've fixed a bunch of printf warnings (that only occur when the kernel
is being built for a 64 bit machine) and sparse warnings.

Where appropraite please fold these fixes into your work in progress
code.

(This is with the work in progress 4.17 tree, which contains all of the
posted fixes, plus a mega-patch that I created with all of the OCC HWMON
work).

Joel Stanley (5):
  fsi-occ: Fix size_t printf
  hwmon (occ): Fix printf warning
  fsi: sbefifo: Fix sparse warnings
  fsi: master-hub: Fix sparse warnings
  fsi: core: Fix sparse warnings

 drivers/fsi/fsi-core.c       | 23 +++++++++++++----------
 drivers/fsi/fsi-master-hub.c |  5 +++--
 drivers/fsi/fsi-occ.c        |  2 +-
 drivers/fsi/fsi-sbefifo.c    |  5 +++--
 drivers/hwmon/occ/common.c   |  2 +-
 5 files changed, 21 insertions(+), 16 deletions(-)

-- 
2.17.1
