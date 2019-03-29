Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OmktHYoy"; 
 dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Vm2n6GQBzDqPV
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 13:31:45 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id p10so301274pff.3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 19:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+RntpvIB5iV6YU12c758sYyJXGZ1hj96mxo7awH4rgc=;
 b=OmktHYoy/6oiiqI34tJQHKQYuIh0T2cP26aUU5zATLvrEJohOFkeTw5vH2vOE54GHk
 D3MmQXdueKzcNU3+EvW+IN6g4OlCwZTGKXyYiuViMrnRFBGGs0r7MJzK1ObiKPsyjh/o
 vk8p+QkUnTr5bodjwW7n4oxvVB+EtSW6F3Me7ZP2p3MeKEfrZoEemQvx7B2nbhWKV8Uz
 0FAoh8v6/XBBQ/jekc9pCskYowkgbiynMoIbxLG0W9YoqncHDqt0qadZW/eet4CG5SAg
 BUJO3Dbp+PrUCQUoOO8IjhieYM8GrKxjcvvD5znAtEZKMUfecuSvSSYQundWvWjBo6Bo
 K7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+RntpvIB5iV6YU12c758sYyJXGZ1hj96mxo7awH4rgc=;
 b=YXaVug/QnwDrswpJRAPMgHq/2npn/vpSvy81peguDBWPYHEISGlhgqWdh7CjjBemRx
 yleZHQgujX3VqT6NkSKNaaGYGohiWRtBkyQjIynQSfSWhyq7F6pgSjucHWEKexHE2ICq
 6lmdbjafdOu9l7ssbJOaGKWIphhMpa9aZdK5Osuj++NoeauDD6euBvJNQ1dJkpp/ostW
 XcLZRBmt4GCCvfB38MumRHb6p8hPGAvrIit0253tzRGaoOwfe/I5hpuirlb7V3K7LuD3
 zTkgAKzAnuqmomwuEk8aKAV+uXW6dvcEylcDgrqqIoUnWuxipmMcynnjhbHdZuY/Iw3v
 RV4w==
X-Gm-Message-State: APjAAAXunFUGfz6vLOFJnOJuy947CpHPda6TZMjPJkRq43ZKSM1isyHb
 zkDJN5RQkLgVfKLWxzYgsOLHYGJT4SOJzWaoG2/wTIvL
X-Google-Smtp-Source: APXvYqwy4z4qdd+FRq2CbsRKwE36qm+0u60wwqfch8eCsd/P1cj357tiTEf4by77NAZ3H0RrHfDhfqg8exoAogttyXA=
X-Received: by 2002:aa7:8b4c:: with SMTP id i12mr44314751pfd.189.1553826702796; 
 Thu, 28 Mar 2019 19:31:42 -0700 (PDT)
MIME-Version: 1.0
From: susan jasinski <susantjasinski@gmail.com>
Date: Thu, 28 Mar 2019 21:31:32 -0500
Message-ID: <CANT4NrJdiFyJBR9SA-jVA0JZ8C=cf7HvBXjxaiHHBEocxaWR6Q@mail.gmail.com>
Subject: OpenBMC GUI navigation -- User vs Security
To: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Fri, 29 Mar 2019 02:31:46 -0000

Currently, the OpenBMC GUI has a single sign-on and there is a menu
called Users from which that panel is accessed.

Users
- Manage User Account

Now that we are developing LDAP user management and local user
management, I was thinking we could put them together under a menu
called "Security" that would replace the "Users" menu.

Security
- LDAP User Management
- Local User Management
- SSL Certificate Management (including certificate generation)
- others?

Does anyone have an option about this?

Thanks in advance, Susan Jasinski
