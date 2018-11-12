Return-Path: <3mozpWwcKBz8cmvfdnehpphmf.dpnpqfocndmjtut.p0mbct.psh@flex--bluecmd.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--bluecmd.bounces.google.com
 (client-ip=2607:f8b0:4864:20::e49; helo=mail-vs1-xe49.google.com;
 envelope-from=3mozpwwckbz8cmvfdnehpphmf.dpnpqfocndmjtut.p0mbct.psh@flex--bluecmd.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fLiZ1RH5"; 
 dkim-atps=neutral
Received: from mail-vs1-xe49.google.com (mail-vs1-xe49.google.com
 [IPv6:2607:f8b0:4864:20::e49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42ttJ14lp5zF3NF
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 01:22:21 +1100 (AEDT)
Received: by mail-vs1-xe49.google.com with SMTP id t25so4608932vsk.0
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 06:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=9kTpxVMli6hf6qEle55EwUhl92aMVXBaPNgvJQFh3sk=;
 b=fLiZ1RH5XHJgsdwP2TvrvomnRYDfDPU6ssuPPIweNMJJqJWfZYLx5apniJ1FQpM5L/
 e/hRRnXGuzPOpjKjSNG3Y0SNFYQqPIg59GxPMy0pybmAM6FVBrefUb5i/rn3eWp3T1mF
 9dOXvbTvt47K0/NZ+ob1tVDHpTcn48ln/YCxvPATUQFFkXgcx8iqoFOWfKGYf5QV7dkr
 RntG7Y7bERaSKmKjom7LU34CoVJwKKhMPS0GwlEeHcZ4kg700IV9YYofakzvhiWefXBk
 eVgMd0Ekh6TqfI27U0RcK3t//RozdI4VKa0ogz+bJdFUc76tNT1/kKclKUHSjMcditT4
 QpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=9kTpxVMli6hf6qEle55EwUhl92aMVXBaPNgvJQFh3sk=;
 b=rqpsK46tQMEFhb1O0uW1Y0GQTZqZ9e7UNkC/uTLuQsi9z4IrCQ0ACkNtC4vPLXMFH8
 b/L0fuXRIGxg8hKgWk+eviO7Mo3WjuJmnlFEJM9w1C+fd6EU6f9g7iKqGmnGdUt+MTtF
 s3qzgYNdPQ4e4VgSMj2jbQdDPLOBnjjx2xiDRldQjm4TBznfIcSKtGzyj4KjGDS5+iYc
 majXgvubX8fvKVYlikVHAI2ZLj3fYwVjuo39ImBS/lCBiC5Wb8tp1XEvujqSb756yqBj
 ifn85xzkZ9lIML7G+Mo0Y/GnBF+D6FDN8gml34doejkJ3dv2E9hORIvdeayHKWnYI6WI
 gZRQ==
X-Gm-Message-State: AGRZ1gLIY2sO7LAbglM5a9G4VN7kerWTWH9oKYwBPgcQqS4FHk9cfk4v
 DImxqDh0rtk6W2Iq5DwylMJxDsB428eX5l0OmpnLBToBgiRr3g1LL0J6ZHTgiX56wXMlUwk/Skf
 99SXxp8S4yPkLh5fakRZE4D9156E08bQZenvyOpJjTC/ORPe58b0hU8z07In1Zyh5BJU=
X-Google-Smtp-Source: AJdET5dBX8NQV73H8wL/HcvmMe9LkTWMiCeC07+2MWxIWXbWvnvTm1HAF3G0YQtuuhg7m8KW+EAwXn45Klo3
X-Received: by 2002:ab0:9d6:: with SMTP id e22mr906936uah.11.1542032538986;
 Mon, 12 Nov 2018 06:22:18 -0800 (PST)
Date: Mon, 12 Nov 2018 15:21:38 +0100
Message-Id: <20181112142137.160970-1-bluecmd@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
Subject: [PATCH] qemu: aspeed_timer: Use signed muldiv for timer resets
From: Christian Svensson <bluecmd@google.com>
To: openbmc@lists.ozlabs.org
Cc: blue@cmd.nu, joel@jms.id.au, andrew@aj.id.au, clg@kaod.org, 
 Christian Svensson <bluecmd@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 12 Nov 2018 14:22:27 -0000

If the host decrements the counter register that results in a negative
delta. This is then passed to muldiv64 which only handles unsigned
numbers resulting in bogus results.

This fix ensures the data being operated on is signed before it is
ultimately casted to the final unsigned value.

Test case: kexec a kernel using aspeed_timer and it will freeze on the
second bootup when the kernel initializes the timer. With this patch
that no longer happens and the timer appears to run OK.

Signed-off-by: Christian Svensson <bluecmd@google.com>
---
 hw/timer/aspeed_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 9acd1de485..1a54d85e9d 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -253,7 +253,7 @@ static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
             int64_t delta = (int64_t) value - (int64_t) calculate_ticks(t, now);
             uint32_t rate = calculate_rate(t);
 
-            t->start += muldiv64(delta, NANOSECONDS_PER_SECOND, rate);
+            t->start = (int64_t)t->start + ((__int128_t)delta * NANOSECONDS_PER_SECOND / rate);
             aspeed_timer_mod(t);
         }
         break;
-- 
2.19.1.930.g4563a0d9d0-goog
