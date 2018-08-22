Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22d; helo=mail-qk0-x22d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Rit+h7Zo"; 
 dkim-atps=neutral
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com
 [IPv6:2607:f8b0:400d:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41w8ZW2H52zDqnw
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 11:09:07 +1000 (AEST)
Received: by mail-qk0-x22d.google.com with SMTP id 89-v6so212927qkp.2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 18:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=dFpxyZfIOeM5vbWk/Y+zjZpTg7GHJ1h1PxGBqI2uc+k=;
 b=Rit+h7ZolCoagYCcSk2KcoTwfsvopbKNIRFxV8SS0IqLTYfcqUHGNfl3hBF/NAKqKI
 +us5lKH4Oj1/6YQZJ7GTV24Lw++CR6cUmaQYLn6kPZWH7iNWCPh8qpuHpC6S35X0osoB
 Mj1M5Ifd66ZQW3ttwwOcx4G5xz1NsSq7WnFZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dFpxyZfIOeM5vbWk/Y+zjZpTg7GHJ1h1PxGBqI2uc+k=;
 b=iMdsdgvYa7Dsawd/R6VyextP+abYsMO45qTVy/VlOJVxX1zZ5iwytDAoQIYEE0asii
 Ibik/RIZ6teM4RhX+o8t3rbsi7/Gbl/WhMzr76xZvOPLqd3c8ksXDbYaRaDa0qfPtjz3
 UPkNM6WazOyMiUb8NHx2gzgcVL3NOdQwYX8QLg7v5zmJIdskJIzFS/p/qZTwvssVfl48
 YN0YLa24ekaNFFgigzAIER5W+epj6euTKV/m1ofn67Wk+c/qQw3YvqpIRnbJy4S7eEx3
 GomHKwtoc0jaBn36LLv49acwduBE76JIag4LcRWroq4lyto5gZAruft6zT/H7W/QivzE
 FrfA==
X-Gm-Message-State: AOUpUlHUfgd+4b+klhXSZtcdycTsxm25iWea7DPpx7Me6+qJJkBjHn7J
 4l6V1BzTUIJOkEXRy65Ug9SZ7NxzB4fEhVpycOnpdMrO
X-Google-Smtp-Source: AA+uWPxuPFBwX9WWmNkPprrG9PUkGwQCq1RvESAcgoLs4XNErsSr+5gZlzjpOcmwGPRQ8d01lOjtK5/zEXzKe38zpMU=
X-Received: by 2002:a37:6b84:: with SMTP id
 g126-v6mr47798743qkc.231.1534900144504; 
 Tue, 21 Aug 2018 18:09:04 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Aug 2018 10:38:53 +0930
Message-ID: <CACPK8XeWPtw=5R0rBeT0-hSdFf+xKgM9RRzXmy2d5TMQLvH=Ww@mail.gmail.com>
Subject: Tagging master
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 22 Aug 2018 01:09:09 -0000

Hello,

I would like to propose we create a tag of master.

The tags are useful for those who are working on openbmc, but also
supporting fellow developers and testers who may be working on the
host firmware, operating system or other tools like openstack. When
they have issues, a glance at the tag give us a rough idea of how old
their firmware is. As a developer, this gives me a rough idea of what
kind of issues to expect, but also how far I should dig before
suggesting "you need an update".

I suggest we use tags as a lightweight epoch in our commit history.
They don't need to carry any additional meaning beyond being easier to
pronounce than 006d86903586b1dde915f5b0d90a68fd31935095. This means
there's no garuntee that a tag contains new features, or has had any
more testing than any other commit.

Cheers,

Joel
