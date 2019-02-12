Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ksCBvYYr"; 
 dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zKXB4Dy3zDqM7
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 22:03:38 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id w4so2421105qtc.1
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 03:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Z3PQ1NLBEnhIHX+tKmBobI/axZwsfncrf5ZfUNFvO9k=;
 b=ksCBvYYrWmRReN6c+hZNs1o0ArH4KJxNFgLxwJlAxB3zwW/3nmWh09JMtfni8fp7y+
 Ks1ekJ1iEl9idmy+PNn4L9l2OVtJJmyLWEl90z+p2gugw09v9iK7DDQ5GJ4KztOXlNwX
 BlmIdpYud6ZEY7vagwMNOa2OFOwWWqxSW72pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Z3PQ1NLBEnhIHX+tKmBobI/axZwsfncrf5ZfUNFvO9k=;
 b=rvVPOWGYEJkNXdRT6dsD05cJRzn1JXvz7YwOWQEA2NLk51uOSzIJoIK1LVAGTFAX/D
 HwyN8K+5ZqXLNb9K2RLxEN85JvqNo1A9Z2eUt+mScw37+Y9C1UyT8Y427p9x7ZWdJ17y
 4dMntvKGPYAtReXsO/ag6XtEKbhSIBsscokSIvUbG0UvKCUd8wXhV+AgkWEvvlEa5URP
 YDbrxeivX47/zCJnZyXWgSRC1w3dF50S9jcfm2mp218CX2qn+7wofu/wVnjKHrCSZnR4
 ZWpvcUwGl+gD7koJ58On3lKn1UuJhXsgqRkU9PlXCYbzqcFzwqiO5QEXHOCVQ1TkLZT+
 lvDA==
X-Gm-Message-State: AHQUAub2u3GEvKWuJxMv88ijKFaFaR+pQngrvKHMBrL8vCyVcwDcs7Or
 6eQ3T+mrgLlryjhgYz/S9xV/PnJBLWtDP+ujwf0=
X-Google-Smtp-Source: AHgI3IZX8bMd7bv6fV80FY3I+2jOJLxQLiw4IUIRa/sh0Wo4heJIOGuaBT4cT+UIrtUIjVLlZALOQyWmIYqra3qp8gk=
X-Received: by 2002:ac8:29b7:: with SMTP id 52mr2260048qts.266.1549969415826; 
 Tue, 12 Feb 2019 03:03:35 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Feb 2019 21:33:24 +1030
Message-ID: <CACPK8XcrM9tT6WgaNAPDTmSMFEC4qb3ETx5uVj2UrrB396tMGg@mail.gmail.com>
Subject: ppc64 asan issue
To: "William A. Kennington III" <wak@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
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
X-List-Received-Date: Tue, 12 Feb 2019 11:03:40 -0000

Hi William,

I saw this change to our build scripts, where we disable the sanitiser
for ppc64:

https://github.com/openbmc/openbmc-build-scripts/commit/282e33011ea62fe80bff2c5ab0e9ef9446d6c551

It would be great if you could open a bug report about this one. As a
starting point it should file it against GCC, but even an openbmc
issue would be a good start.

I did some investigation myself and I could reproduce the failure on
GCC 7 on Ubuntu 18.04 ppc64le. It didn't happen with GCC 8, nor with
GCC trunk.

However even GCC 7 took a few compiles before I started hitting the
issue, so my testing may have not been comprehensive.

Cheers,

Joel

--
My testing looked like this:

$ cat san.c
#include <stdlib.h>
#include <stdio.h>

int main()
{
    void *p = malloc(4);
    printf("%p\n", p);
    return 0;
}
$ gcc -fsanitize=address -o san{,.c}
$ ./san
