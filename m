Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::235; helo=mail-oi0-x235.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hAPT2wGb"; 
 dkim-atps=neutral
Received: from mail-oi0-x235.google.com (mail-oi0-x235.google.com
 [IPv6:2607:f8b0:4003:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41vLDh14G1zDrb6
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 03:20:51 +1000 (AEST)
Received: by mail-oi0-x235.google.com with SMTP id m11-v6so27199410oic.2
 for <openbmc@lists.ozlabs.org>; Mon, 20 Aug 2018 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=oeESRWAOFRBYWfni8EHmXerni85v637NQw9RP2NBUZQ=;
 b=hAPT2wGbBMok+ATpFBYjyK1fAzfBzTWxRX4xjpg+YDNR1g6YUPgwk5wfl0BjrkmNbF
 jpFQRFA++ihW/fJ0mzLeixbzIxO0/r+hrkdEYy3a+3pLcYZxiw6Joav5hTMtVdQi8uBu
 7ObGO1DXDqb62gDnIEaSfGezwQ6pndomLFEI1KjxPsDHxKBPjpUz6ol0RVj7bpyAvHoY
 lcoq/bKv3CFBCo3xb8xtNwOtjqxRxqLApe8Ap3x1MNZ0MiZeP4Iw8d8E21JTK37QaKOT
 bz1IWyjsBsHRvzpt0B5LoUD3zZeyXuHc3KSw7KUU7fb1q5WekRapA6Z/dR0JYVI7hIkE
 Bupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=oeESRWAOFRBYWfni8EHmXerni85v637NQw9RP2NBUZQ=;
 b=XMsuvfk7q7qiaN8VGRbY5Qw1v5jhCXXhGA+tABdw9p47kp0+OCbHXc4UMq/x1ad9OZ
 95X+pdo/q0dEaskZZvNncfUbTqnTZb23XS6gGPTLSsOYuFFEG2KhLTixsrEXGK40xIQ9
 atB33MnJjymjYPCqVFFsgjFvELVP42PRy3u/m2rYoY22/OZbWLxH3muyOZ4oXsXI/vqk
 wzoOkl8sXB9ZDyMf2IWnPsS5xyYXrFXuLizuR5e3ilRkrliFxwB5rm89NeH7TtDh9U+2
 6GUH9n0nwEVPguwiY5KbdsJOOW4nM49BKXt2N3cXKU/+5xqxOqj5t9ROpkBW6nlysJ/N
 3kcQ==
X-Gm-Message-State: AOUpUlG2EmCQvnOqYoAYtjNvEXsv+KYjLDvm1sAyyyyfb6woxxwWcUAt
 AheXkx+BoF4vBsaxGLqg9OLTP1WcwBp7HsSB/9Lcjw==
X-Google-Smtp-Source: AA+uWPxH5u1JFtH/5oczaEq7BNMdETic4c7GOXifDL0AnUkpelNn6D/4oQRiIdP06lEk9atKMqpSuo4MwgK17oALqWU=
X-Received: by 2002:aca:5c85:: with SMTP id
 q127-v6mr13751825oib.127.1534785648528; 
 Mon, 20 Aug 2018 10:20:48 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 20 Aug 2018 12:20:37 -0500
Message-ID: <CALLMt=rzbdeBy9zH-Kz8qG+xnVucPY1pNptidK8SvjLq1KZgTA@mail.gmail.com>
Subject: CI compute resources
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel.stan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2018 17:20:53 -0000

Hey Everyone,

Per this mornings community call, it was noted that the upcoming
changes to our bitbake layers and the use of subtree to manage it,
we're going to double our CI build requirements for openbmc/openbmc.

We could short change ourselves and just do the new subtree commits
but Brad noted that yocto does CI for both the subtree and the main
merge for a variety of reasons, so we should too.

We have some other alternatives (build fewer machine configs, or only
build certain one's in each CI, or just wait longer) but it would be
best to first see if anyone can cough up a few more cloud machines for
CI.

Current server contributors for openbmc:

Rackspace: 1
Google: 2
IBM: 1

The ideal server has:

16 or greater cpu threads
64GB or greater memory
1TB or greater hard drive
Ubuntu 16 or greater

It needs to be on a public network that openpower.xyz can talk too.
All of the build scripts use docker so the system just needs to have
docker installed.

Let me and Joel know if you got something!

Thanks,
Andrew
