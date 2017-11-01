Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22d; helo=mail-io0-x22d.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tGi6MJdS"; 
 dkim-atps=neutral
Received: from mail-io0-x22d.google.com (mail-io0-x22d.google.com
 [IPv6:2607:f8b0:4001:c06::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yRWvK37PwzDqlM
 for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2017 13:12:28 +1100 (AEDT)
Received: by mail-io0-x22d.google.com with SMTP id 101so3104963ioj.3
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 19:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jqSL/feJyJHHGYSrQ+4MGrozuFvBi99UDZ5qTu5DYjk=;
 b=tGi6MJdSHfO2oY9ZhCElhdBrPWMjbVUae/zWJyJOzTKg804dDHwK1zqFbf9nBQoaAh
 yIqrELZoHRlUFQfQCgeR4s0d5/ML5/326y8nlQjvSK0dyuY9NnzQ41pKhdEt74ulu5rH
 Au8KnKysOdXfwAT5lZXZlkfvist4pZPsdpeGP9gSxNg34PKgs6NtkuOndeYyJgFPoGgA
 84Lz8d4qep72H4CA3fwwEEMyzB8+xpcrYZ2MNfk9cJCzN23aMf4KmFIUzW4VfjkaIHAS
 T4hwGjF/pqUufQEZoNLZnQxkJ0IfTt4LjRHdcxBkHZgtz6tuo/P2E9t1KflqXrsiSi2i
 gl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jqSL/feJyJHHGYSrQ+4MGrozuFvBi99UDZ5qTu5DYjk=;
 b=cElY7B9tAdqiJVY865JvSbmki7L4pEix3cQfpjCBaLmmP+09cHD61w/4DsT+8m4Jt0
 CJBuxDFJ8M9glTJ5BEITBvko9pMB3XqIrxUJloKDS/bnn2jZX/g9YKF7pqUNjy13DqRo
 ekpn6GRslXcLr+unIfeZS5L39EYuW8ybeMrrVtSX4+XUgrL0YqXkPjsc5W23eXeUYxOx
 Cq4veWfEjqQrvg3VjZBWOpMadxDIUPP/r5N0ikmnN7qnZJJ9xHQvgLYuB/+QDoyPgJVK
 AjY3Xm+BVXNNjq0lSMFE4hSN5+OtS+R669BaYYAwk7X93moFTvJTDVfCDunOZUfhwxCk
 oswA==
X-Gm-Message-State: AMCzsaXUXeas4rpa21j5JQlDCMtBVtMfBIz/SY8FA9wumwMGKC1Aa04r
 o00GDI6yVUG6N5rr9jXJe9JWJMoJXM5h/5XrKY/kUQ==
X-Google-Smtp-Source: ABhQp+QuFGsbbc6sZFiJ2bv7ck5iqZyMwD7Iz5oFb4psxnMjDEP+7ODi60s+9m2yGG71Up4u50Owr/Daunra/WQY0Zk=
X-Received: by 10.36.124.72 with SMTP id a69mr5966125itd.135.1509502345593;
 Tue, 31 Oct 2017 19:12:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.150 with HTTP; Tue, 31 Oct 2017 19:12:24 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 31 Oct 2017 21:12:24 -0500
Message-ID: <CALLMt=pFnn_e+++-aYyUEOMyzdFHbKeOXVnKPHfyMkGpE68pTg@mail.gmail.com>
Subject: Disabling wtmp in openbmc
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Nov 2017 02:12:30 -0000

I  noticed our automation systems were having some very large
/var/log/wtmp files.  This is a file that keeps track of all logins to
the system.  It's really only useful if you have the 'last' tool
installed (although we could copy it off and post-process later).

Looks like normally we'd install logrotate to ensure it's rotated
properly but my vote is we just disable it.  We'll still have
/var/log/lastlog for some tracking history if needed.

Something that takes up persistent storage, and can grown unbounded is
a bit worrisome in an embedded system.

I really don't have much experience in this area so any thoughts or
ideas are appreciated.  I've been doing some research and there
doesn't actually seem to be a great way to disable wtmp.  Some
indications are that with Linux, just deleting it is a bad idea.  Some
people point to removing it and then making a link to /dev/null.  I've
got a few trial commits out there but no silver bullet yet.

https://gerrit.openbmc-project.xyz/#/c/7683/ (I think this is how we
would remove it?)

https://gerrit.openbmc-project.xyz/#/c/7725/ (I assumed dropbear was
doing all the logging but even with this the file still grew on ssh
logins)

Thanks,
Andrew
