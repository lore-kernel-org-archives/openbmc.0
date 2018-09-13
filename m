Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="opDZLtT3"; 
 dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42B5sK4GgrzF3Sq
 for <openbmc@lists.ozlabs.org>; Fri, 14 Sep 2018 03:55:17 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id r1-v6so3084544pgp.11
 for <openbmc@lists.ozlabs.org>; Thu, 13 Sep 2018 10:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=PXkGUw+dXngFutg5iTgkOVAxkM1fvrJ4wVCRS4y/L50=;
 b=opDZLtT37Ek9xaVQ0we4F3qs7g/Dr4EMU8iID3emUAqGnYUoQOIzv/mziyb1Wod5fK
 7NlEbWuHbMB+G2yNJ9F3ygxmEwdeIj6KwoE0IZSQa6TC1nIYKOjvSO1+EOCQU+2n6dzE
 H8kV5arCn2yHMrHcZYMT537R3BnSLP2nQYKzmBHGF1egXMg0c73rPQ+yQyHs9jfGp/Ch
 Brj52IJfH2hj6j6FhUYDZ5tRPo3r1uxWNCSX/Dyk0ITbPneX2OxaQQFxaT5ruZ6NFXa5
 lHaZ0brUNYfrRsmcwc4xPNkNDnGQ7zXS0VBKvYoc08C1IwdfOxp/LrlESNFfZL/KBlS5
 KMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PXkGUw+dXngFutg5iTgkOVAxkM1fvrJ4wVCRS4y/L50=;
 b=XgSk80lDBMFHTEODQk9XmHGQbUVrwGWdPwUBVhqbzM8vbhZvmdTV8SBmYt+D1igvAi
 V7GPlAnHg5tkC4jgunGdCgSoXYCOPYtQw6UA63RmjLwkn2ykaZ/xHPnqMMYulSCr+JM4
 p0mqR2fBS4cz7Xtv4b31rfPFmEhbmxe/sfwzIFMEBqZNVb1RD1ntGKyKsyK/2M6E1Byf
 9iN/CjS/smtR5guj6LTTe/uwStl62YGTQ7c3t3fmOB8uLIB39o9xMOdiwu28O/ufvki6
 4fQ3156TZq/WUUPpBsdpxLFzBMnbPaMARHzihW87ZSF3WuA7THJDva3/QqD+ePGPKycm
 XRWg==
X-Gm-Message-State: APzg51DDq6xvvdwZ/suwdxbrsj2FPxTje/MYabqS9aqnQrdMotmGeGY8
 j5p4f7WzIRWwatLOuFsAHhU22ltd2a/g2ul7X4G0nQ==
X-Google-Smtp-Source: ANB0VdanQrEmcnNFPsieI9GPDa0/KWefc5d6a0YES31RW8o+TmbRpegSwWprz826/Jre0gQkvY2KKorkG05qEpagZJM=
X-Received: by 2002:a63:1a1a:: with SMTP id
 a26-v6mr8110106pga.449.1536861312687; 
 Thu, 13 Sep 2018 10:55:12 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 13 Sep 2018 10:55:01 -0700
Message-ID: <CAO=noty_TQ2jvQw-Yxb-RYe+0xOXa4F39ozF11r9PN1w2Qt_Dw@mail.gmail.com>
Subject: New Repository Request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 13 Sep 2018 17:55:18 -0000

Brad,

I'd like to set up a new repository in openbmc to store a google oem
ipmi library I'd like to share with everybody.  It allows grabbing
ethernet device statistics over IPMI.

I have no problem registering it under the OpenBMC OEN (and the google
one) since OEM registration supports that -- then it could be
phosphor-ipmi-ethstats.

I really would like to share the code -- but I would be ok with it
being in a google-specific repository, such as google-ipmi-ethstats --
 If so, I'll put the recipe in meta-google.

I know we've talked about this before, and it really feels like six in
one hand on this --

Thanks,
Patrick
