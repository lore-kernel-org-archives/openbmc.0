Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DQQ1FL0/"; 
 dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ppKY6nJCzDqRf
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 06:10:24 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id c2so12515024plz.13
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 13:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RLP+cM7q9CZUGkmdY3ak762lYRSZwn+3N+nABuGlnmU=;
 b=DQQ1FL0/kkVN0G4FRJHku1k2NctteLiv1thI52HezSNDXIgHvxq3GmMuAEvJQpsXLj
 /46UxNMvRT66phBJo368nhKU+lnCHOCbMuTBniILUd/Dnb1m8sdNo1haeEobeb4qVbfm
 u21qU/oRjczCtbWZN1avecYW/OQFQAkbMRNkDQmvb3J+bVzt2HCLbFNjsHH3oEEJy+xg
 CNgPwjLgVEl5bdeaczsscfdqeBoa5oio6ZGOcwCyhtLS653g1toCT7VNR3Ux8l3I8Qd8
 GEUH4Y8s6iOFDp9cCZVB8dawHKCqnKVopZ7+flJGCXBQjVkH8Z1VJcvz90lwJcwdXFIb
 fIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RLP+cM7q9CZUGkmdY3ak762lYRSZwn+3N+nABuGlnmU=;
 b=RuoRjUu6IsDN98kV/hYezSqe9OIrbAqGZAQ3/bDndAqBIjcKMJU/flkEWmv9n7UUCI
 pbaZerNyEiXt/p0tYWCWI6Q2heOYKwEwfT2Cah5T6A3EuItgfHbLUu3zWvKlxpGJ6wmi
 DwRe9ft2z4Wb486WYMITNS2AqOlZfUOIqZXIAqS5a3ywiYj2d35S1RDbzpjm645FMDf7
 +B/9MbileTgMYwZ/in403XQ1Bir78lmQ9tbQQEh6pr7MeuujyWVAwCY57gTFE5VILjN+
 i8TM77m4Wryv6qj5V0Ad0juruACJy4/sdmX1nDEm2f/pR2ZYdsPDR6t8/2wYpD6HWOcK
 jIsA==
X-Gm-Message-State: APjAAAUBLYYsNYGL0h7Sps0hbCRRJChJuqAy+RAxjGP9Y7BXL3wZBiOm
 dWfXyGGMakalSb4BqKFluvKDeTyr495qyOePjToZtcfB3Sg=
X-Google-Smtp-Source: APXvYqylrUU1VMtMyXT2KwtTwfGdHXZQE8qa2zmo/kzkxfpFkKnGpKl1pNetVW418yjS/p6prg9ESQ1YVhW7kmsge8k=
X-Received: by 2002:a17:902:9307:: with SMTP id
 bc7mr44057491plb.183.1563394221698; 
 Wed, 17 Jul 2019 13:10:21 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 17 Jul 2019 13:10:10 -0700
Message-ID: <CAO=notxgpy8N5bf4GyqgoTaw6KdRgCUE7jy5Jk-a3-TZDYRpwQ@mail.gmail.com>
Subject: Super Short OEM IPMI Proposal
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 17 Jul 2019 20:10:26 -0000

Hi all;

Undoubtedly you've been using IPMI out of necessity and ran into some
limitations.  You've then worked to map out the commands you want, and
dropped them into the OEM space.

I was looking at how Intel handled one of their OEM commands and
effectively want that command -- not all their commands, but just that
one.  And I was curious if there was any value in OpenBMC as a
community working to define some shared OEM commands.

Is there value in this or will it just become a cumbersome camel?

Patrick
