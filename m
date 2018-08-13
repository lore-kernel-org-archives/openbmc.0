Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22c; helo=mail-oi0-x22c.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nXVlhuO5"; 
 dkim-atps=neutral
Received: from mail-oi0-x22c.google.com (mail-oi0-x22c.google.com
 [IPv6:2607:f8b0:4003:c06::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41q0sC314SzF0Rr
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 02:03:58 +1000 (AEST)
Received: by mail-oi0-x22c.google.com with SMTP id n21-v6so28189641oig.3
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 09:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZIOnjzYvWeeg0z+V4twTW5LCxHIWMvK2EutBpxN94gs=;
 b=nXVlhuO5WeJuy43eKHTVfEtuYMGSLnUYLHlMrF61iDKgwRBqph1LZugRyrgjn3jVq8
 hjGenAWnub/22XnrQWs5RfxnluJcIGVnJKxkr4+HgYn0ktZm8rpmdb16PKMYuDd62pA3
 IU9tnuo/LVH0LtckiGrMrA3CS5Lb3laNgzLgPYppPnizpdooHIw9tpzFIyJH7V/YUmXa
 TzqP8EE4Pu43CeGHZfxkxV9nzTzf1VWfIiIl+6YjKegHuMauIQLS+FsLYIV136svb+av
 a53/ZRwqnJb1lPI0Rxk1R/WOxuINFqOqSzhA7oe7P60xuHlxPygAAyGVYKCpyK21+8w7
 4Nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZIOnjzYvWeeg0z+V4twTW5LCxHIWMvK2EutBpxN94gs=;
 b=pfxYfXqaWe+2a3FQQYEBg8dwDAXbQl5n+laRaBcFxfu43rW40sNVqf6vsj2gmcGEeb
 yQkmJTTfpiuoIOTsCk6ro79I/c2QmOhzJqZVH946By3GFItTtRj/u4UUtJh5jcRS8R+y
 BKZ7SeZVH5v95z/J8/o1S3CC8azqqxxYFdILKOxLXHMfOHpVcsXuqrrjrLktKH9fyuh3
 8aCN5TsPP0eZq9wwgSqUwgRlrXgLuloyOcCJw/bMDItLULyBzmWobTdGel3p3pYX+jiz
 b+am2zhozzwxZz8VEa2hMV0/eMP3ky8/nb5+wQL0d/KhI1lo8yBdxQeYaplttMWPAhvK
 Qocg==
X-Gm-Message-State: AOUpUlFV49ZidlV1QaozznhXiCmYmdeAWF91FtMxSFXjw3+9pGeyUOR+
 bUA+/NMQO6oSdShpa5tKDw8yjdVpH+EtwoOa+HM90t4B
X-Google-Smtp-Source: AA+uWPye9TK8NZv1d/EUanq99yxqJDYV07qWPFwY9e2P1CiKK+Bv58w+Ezt9FSds4NZgxbL6a2XM3LeXpss/WfPvyTI=
X-Received: by 2002:aca:401:: with SMTP id 1-v6mr20325393oie.28.1534176236687; 
 Mon, 13 Aug 2018 09:03:56 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 13 Aug 2018 11:03:45 -0500
Message-ID: <CALLMt=pDF+AQWZT1hqe4XEedCkv5ypHd5rLmD5=-+FsBFwZ7xg@mail.gmail.com>
Subject: openbmc bug management
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 13 Aug 2018 16:04:00 -0000

Currently we mostly open bugs against openbmc/openbmc.  This is nice
in that it provides a single location to search for all bugs related
to openbmc, but it doesn't provide any clear ownership for someone to
drive the bug, and it becomes more and more unmanageable as the
openbmc project continues to grow.

Per the community call topic today, we'd like to start having bugs
assigned to the specific repo that will provide the fix to the bug.
The main concern with this is that if someone is unsure on where the
bug should go and takes a best guess, if the guess is wrong, how do we
ensure the bug gets routed correctly?  The idea was that it's the
responsibility of the creator of the bug, so the repo owner says
something to the affect of "not my problem" (with some guidance on
who's it is if they know) and the bug submitter will then use the
zenhub option "Move Issue" to close it in the current repo and copy it
over to the new repo.

Thoughts or concerns?
Andrew
