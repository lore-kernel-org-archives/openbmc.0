Return-Path: <raltherr@google.com>
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vz2026PQHzDqK8
 for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2017 09:21:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AupvUzdq"; 
 dkim-atps=neutral
Received: by mail-pg0-x22c.google.com with SMTP id g2so17988031pge.3
 for <openbmc@lists.ozlabs.org>; Wed, 05 Apr 2017 16:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Il0Rk1rGc2DhDosIA8NIJobodfkatI2OzLTPeZJR1fI=;
 b=AupvUzdqEurHKs37jR/ErJXgmivdIBIM54fmL1SNAHsQrSEdUyvlQ5kgUl86qqqC3X
 /xFnHap8BRGQEeBmnLcLAEjJdhp0FKrYbgo0k3m65/en9h0kAfYfrN3ohSBbu9NtlIiT
 rplgOyw3akgs+IMgjAS/g3EA+aOV/yOs0VAdL6KM2yk7vWURlrZpL95XvQ+ewtqF8kAX
 HGWZeW88Qcy0o6hznbR2ENorizVpjfJUl0aId0rFqSab1l/26BXxM6nzsSwosAQ6Dv9s
 W39zulqXY0B9rl1nX96ivQBWW3eWzoeELDtb/0Aw1/+UUA3PY/nE7i88mZd8MIRkmE/g
 YMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Il0Rk1rGc2DhDosIA8NIJobodfkatI2OzLTPeZJR1fI=;
 b=N1HDKHHA016PrzSwvkwrzp1MZTAtDBpY8TzBXLRfLXdXg3AU5YL0rsMCwBNoCmhoNV
 5t3ltZcjQ2IZd5ddU9BGX1TYZ/7SDx9RP6/scQpfc28XOsiYnYsiZFz7FN9yKhkqtcEy
 ESrWwMv4VElXjb9DkmUt7BZijto6EAsfbVvmWwKeXwv1/sZ28UBAEjrWGyjeVZMES+Tl
 2yNLtku19NzHnFfC5tb9LOxW8cRNTg0TwFq747o1xN+aJyuW2emC1B2fvNZcAFNwNf6/
 oSwEfJ+a6/HJ9n4MBXzQ+Ekc1ryr9fyceLH66VwRRnvG3PN7Wc6t4rDvKxaBtlWpHq//
 HDdA==
X-Gm-Message-State: AFeK/H1vo+oJgLZSS5GDyfIO9qVPT0wyR1B49yNeUjpqbE6sae+gvVEuKLmdSCGodQWMcasU
X-Received: by 10.99.181.86 with SMTP id u22mr33201527pgo.102.1491434464088;
 Wed, 05 Apr 2017 16:21:04 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id q86sm11249755pfk.43.2017.04.05.16.21.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Apr 2017 16:21:02 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: alex@digriz.org.uk
Cc: openbmc@lists.ozlabs.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Matt Mackall <mpm@selenic.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] hw_random: timeriomem_rng: Migrate to new API and
 improve performance
Date: Wed,  5 Apr 2017 16:20:57 -0700
Message-Id: <20170405232100.2023-1-raltherr@google.com>
X-Mailer: git-send-email 2.12.2.715.g7642488e1d-goog
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
X-List-Received-Date: Wed, 05 Apr 2017 23:21:07 -0000

AST2400 can generate 32-bits of random data every 1us.  Original driver
was limited to one 32-bit read every jiffie due to deprecated API and use
of timers.  Migrating to new hwrng API and switching to hrtimers
improves read performance of /dev/hwrng to 13Mb/s.

Changes in v2:
- Split API migration into separate patch
- Split type and variable renames into separate patch
- Split performance improvements into separate patch

Rick Altherr (3):
  hw_random: Migrate timeriomem_rng to new API
  hw_random: timeriomem_rng: Shorten verbose type and variable names
  hw_random: timeriomem_rng: Improve performance for sub-jiffie update
    periods

 drivers/char/hw_random/timeriomem-rng.c | 157 ++++++++++++++++----------------
 1 file changed, 80 insertions(+), 77 deletions(-)

-- 
2.12.2.715.g7642488e1d-goog
