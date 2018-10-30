Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qHsDMo3P"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42kwrm0mJ1zF22T
 for <openbmc@lists.ozlabs.org>; Wed, 31 Oct 2018 02:49:43 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id c32so11533596otb.8
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 08:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2GzHmu2rz79jMdwedyA7Yf3uz0z0uRfX2ozdHslcRTw=;
 b=qHsDMo3PoNi6umMKjqsFyggXuDj7kKI1Had41iJrurboKH+Byjc66NDSb4Z1hblEmU
 v/RH/EdHsI5K1DcB/vZ0j3UAGMBczynghvSVHkc8g3G3o9dc9o1vQ1pNEbNEAteRS8Ep
 sow4QZY5i4D0U0FYTaOY6k2M2Fury4nt01mCpm2oaUzVG+M795Xyg0OK/Ly/BjxAN9Eo
 /CgooXUb0qbDNjO93nk5H02bycvzXiHTCyQoS8krn4CG5UT1nuRP1Wuf03XerPZgksw8
 l0RRxibls5V/3KAeBK9GrpBgZAoGZzdME/75ZUZ46lpkCVUreVU+sxXjNsv+3vyy4bJ+
 slVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2GzHmu2rz79jMdwedyA7Yf3uz0z0uRfX2ozdHslcRTw=;
 b=tN8EVUV+9bYzkDsc+yUmfKch7ggcRKkvuj98r3SbtEt4ZuAxwSk6t5qnveA5H6GdD3
 W+km/rSXx9PFD/s6qkLa/iduElrcHJXJtI6LwbUJDgHJ+2vuVe9b76xQLoUEO1scrDoQ
 vwv7k3kA/wdTwNP2JqL3aUdE/9cHvdjxeosx/+zq62GNpEmHQokdWZKKwdEwx1yKl6LS
 pRRF363TEQTLhZZOz09JyLxmSnj7gjuHq0+sO7HRnQWANmj0qurkxtgvPY4Zi3kI1XpQ
 1AAu3snW9miOBK3yjkvw5CK9g0+aOdABInc/JIjNfOdZ4U9B2WJjbCyoFgxgC7iEMwNg
 M/dQ==
X-Gm-Message-State: AGRZ1gKCvG7xgg/k5tSmHDWdayK/kIOPN+VN5qUBiu+GofHRZ/10y2Be
 bnwu9ugqmM0Tm6wLPD5Py9yvSmRNuvjVpw5hi0O4lQ==
X-Google-Smtp-Source: AJdET5eYKMhEVnRN25emhoN9Bzr4CJtnhT5dKzEsvgWSOKINNW7P/ccTsuxK+oNVsNjXNIQ9oDQfggpMLivUpoO6UFc=
X-Received: by 2002:a9d:12e3:: with SMTP id g90mr4451239otg.223.1540914581661; 
 Tue, 30 Oct 2018 08:49:41 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 30 Oct 2018 10:49:25 -0500
Message-ID: <CALLMt=qiyO0HHqp3fj=XFqCnMx2XWqR-m8Wn+OgSTGBKS5f=-w@mail.gmail.com>
Subject: Infrastructure Workgroup?
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
X-List-Received-Date: Tue, 30 Oct 2018 15:49:44 -0000

Based on some recent discussion in this area, I'm contemplating
forming an Infrastructure workgroup. The focus would be on improving
our CI infrastructure and the scripts and tools around it.

There's been a lot of great community effort already around our CI
build scripts.

Some thoughts on goals:
- Documenting the existing flow
- Alternatives to existing flow (ability to use freely provides clouds
for open source projects, ...)
- Managing the Jenkins nodes - Bringing new nodes online quickly
(chef, puppet, ansible?)
- Managing and optimizing the CI flow (repository CI, meta CI, openbmc CI)
-- Which systems do we build?
- Process for adding hardware CI (mechanism for individuals to add HW
CI to gerrit commits)
- Optimizations to existing scripts (docker building, CI, QEMU)
- Gerrit, Jenkins, and build node periodic update process
- Overall maintenance and responsibilities for infrastructure

Thoughts or interest?

Andrew
