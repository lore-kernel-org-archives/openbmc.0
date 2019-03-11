Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CcKx4Dxb"; 
 dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44J7gW6nRszDqC0
 for <openbmc@lists.ozlabs.org>; Tue, 12 Mar 2019 06:38:15 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id b3so291543otp.4
 for <openbmc@lists.ozlabs.org>; Mon, 11 Mar 2019 12:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Xurrq9v0ms9CCOH4XrsCg+K/n8+tp9jSomKHIC/kEIU=;
 b=CcKx4Dxb9pksYB7mjDmdB5H9lLiuke4vh8DWs2VYPnGAo1+/t63AnjUhXkZfFuNYbY
 y3TFrz117umFxW1YtSvhj1f5pWT7vkzPGAb7rqEy8xPsxBlDALLXsWXD+Je1HbJx9wM1
 Vq4bwl/NegEuX9d49Y+zywGd5iMb/IXh041YcsfIlbze4KgJhaaL4Q7Od/3EAFP3s7Ud
 80Ddeghn0djmQ2Dr8UdHiRuytExojzKbiXW4Vn1fsgum0BP+xFgVcC5jnCNNyrZ56RGz
 89Sa7FZElSDVbc5/gYT3tBRZ6sImFrW/JvlxsNKJk8uMr/Qq7AAA8Tr6mqim8/MX+9nD
 MqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Xurrq9v0ms9CCOH4XrsCg+K/n8+tp9jSomKHIC/kEIU=;
 b=hY6DwO2iI2E+FaEVwYg1sLPFQcCqSbNzE5Od2n+lAS0Xv8dctIHlek6uXxbEHk1s64
 5kbINCsz+0jlx10vMGPR6s1DuBu+cJ8GagAKFl6BPDAl1hqP6ouOhO23xuc36NihFgqn
 3/p1LjdWwNOoAc22RDtA72Eo/LriW/Lzg1jo6ZRYnnnOrh2ouGtmwYRwk8jhK5MsPu7R
 yD3PSfIPw6wEx/jlwIvoeNDWZkBvGD8yPYLPJMMrOBtoLZhqJU6IOzw78kM9C3kzmwKV
 Dm2PgVW7T1ZM7iv0BpvXJmbB1pMM/D2dQj3syJ7lVCQfQxT/TWjnN3fCmAx10p6/ic0L
 XNTQ==
X-Gm-Message-State: APjAAAWA2BbFbpWYpUvFOD7DQC8CY7yorETqHhFWTmKt4ojbeSyTDNB9
 Jcn57/ITketq/c0YL2G2mEHh3yOCnvccReV+2wbfCqzj
X-Google-Smtp-Source: APXvYqwRKBSKPMywy+RfpVm3sHfT4MhSSUifbzp1GD1JpEN7fiGEFVyqNKHEUkOceprVJapPZFErxFclJMA3zhL1Guc=
X-Received: by 2002:a05:6830:16d3:: with SMTP id
 l19mr13676485otr.123.1552333091530; 
 Mon, 11 Mar 2019 12:38:11 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 11 Mar 2019 14:37:55 -0500
Message-ID: <CALLMt=rz5Mvohzhavhm+D3Q8g=EZGVyubi+rsMZ3CFV_PHUfPg@mail.gmail.com>
Subject: New Gerrit Upgrade Coming - 2.16.6
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
X-List-Received-Date: Mon, 11 Mar 2019 19:38:17 -0000

It's getting to be that time again. We're currently running on 2.15.2.

We discussed in the infrastructure group last week on whether we should
just update to the latest 2.15 release or go for 2.16. The general consensus
was we're OpenBMC, we always love to be bleeding edge :)

So here we go, I've setup a test instance of it with a snapshot of our code
from this morning. This lets us all check it out and also let me make sure
I could recover our gerrit server with the data I've been backing up
(i.e. disaster recovery):

https://gerrit-test.openbmc.org

Please remember, any review comments or attempt to merge will be
useless with this link, it's just for you to play around with and provide
any feedback on.

Gerrit 2.16 has moved to the new polygerrit based view by default. It
has some neat new features, although does take a little time to get used
to.

Let me know if you see any big blockers, otherwise I'll try and roll this out
within the next week or so.

Andrew
