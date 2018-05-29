Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::229; helo=mail-qt0-x229.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X5M/plTL"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="cZW/J6OO"; 
 dkim-atps=neutral
Received: from mail-qt0-x229.google.com (mail-qt0-x229.google.com
 [IPv6:2607:f8b0:400d:c0d::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wCsH6RbJzDr43
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 22:36:51 +1000 (AEST)
Received: by mail-qt0-x229.google.com with SMTP id i18-v6so7681018qtp.12
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=8z0IG1ZkMsyNa1PweWXt+28Wc1ZyPNGVFwpJgRGRHEg=;
 b=X5M/plTLPLBIC73ZYn3UB0Z0A2zwDakP200mxrvmZ/VndIG7b1wBMavj9q8AdtbRxU
 9C8sRyAsREtjJ4HOlQ+2ygwGbN8jYQTnOUymQKnDCWONJTZfZ1/HVyDQtgrXGiEOV0oU
 OKsHDs4lMrKIIejfx3ciOEeQvGUJTbE16qmHRDLgl4Vm2q8gkdjtoDoKsI7DB9l8g4dp
 rG17/heQfJ+032/q1nHoGyBCBAqMYbmV9GBfsPq2ekhz1Tom/4+CUohwEK0dcARPBVhx
 jrUwgNEdKcZjwoEvwPqOGHT1AObS1acNZ5e/a1huzBIIIXpQMKriAWNa0QYWmFoTFAot
 9YpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=8z0IG1ZkMsyNa1PweWXt+28Wc1ZyPNGVFwpJgRGRHEg=;
 b=cZW/J6OOeOP64DzWyRb0PyeD3/1Iw0wfvxLYRKhsoy+0H3jGsRgxhRAtupGDMOmC3R
 e6QshFMnhImc6jegvR7vVB5daEkXQJIMJD7/cfO63kxHrWP8uMgyWtY7x/XL5Qf1PWbZ
 GCaqd9LdSQ5/gQ2Lee0Az+l5etX+yQ32LonC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=8z0IG1ZkMsyNa1PweWXt+28Wc1ZyPNGVFwpJgRGRHEg=;
 b=j1b9ATaH7IugcdbaqeFdklKuY1QbQhSm2ZSNsME3j62qMkYqRztyBrOBB/ik4ESYkC
 R3JcYIjQNJ7btTfLu/eQPReqButiq9fixscj9jf1QSIBxcfvVkPjhv7zYlIDYwh43hIv
 HrCHYVAs9XPV31to0apOx2QQVNMcWVD0s5D44AgqkzQrcRpZefD5gHKQ/RC6hzKhae/9
 OdUAHntbBrYXmewhCOIh9qriDGdW7wsqLpAKRq2dYb8sywFC7sHQiozdcXDiKi0oB7yb
 TBBYvv16E07evRd98CZR0b//OVjp63ka8cIkR5NoA8ARHrZTa5WdkOaRO/Z+E4VYYK8i
 l5ew==
X-Gm-Message-State: ALKqPwd0RdpkJaw38Vb9evIxJeO1WuJtA6GVHVbIfY4Y0r1k3uLVNz0K
 cJzVKZgSjQR3ZJl5huyZWS3b8S3HxicN6tfGA7uDGw==
X-Google-Smtp-Source: ADUXVKJHCjhWz/D59sd/Q5UKDkblTvJN1VKoxoi3V59mj2PvU2q4GyQJxvl07Jm7h1P44tCkEfiacYSadg8Yh7XHyHo=
X-Received: by 2002:a0c:9b8a:: with SMTP id
 o10-v6mr15740843qve.89.1527597408628; 
 Tue, 29 May 2018 05:36:48 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Tue, 29 May 2018 05:36:28
 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 29 May 2018 22:06:28 +0930
X-Google-Sender-Auth: 66KX1rUiAmDRDmZQNMXEJplX9mU
Message-ID: <CACPK8XfkfE4c8-Oy5E0YBxV3Uxh6vXcQXODzmQ4BGT0dDmvf=g@mail.gmail.com>
Subject: Linux kenrel: Moving to a 4.17 base
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 29 May 2018 12:36:53 -0000

Hello OpenBMCers,

On Monday I plan to push a 4.17 based tree to our Linux kernel
repository, and bump the in-tree machines to use this.

I've spent a bunch of time putting 4.17-rc7 through it's paces on a
Romulus machine, and it's looking good.

Cheers,

Joel
