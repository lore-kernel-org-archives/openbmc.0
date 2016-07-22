Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x22a.google.com (mail-io0-x22a.google.com
 [IPv6:2607:f8b0:4001:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rx2Vf5dTPzDqTF
 for <openbmc@lists.ozlabs.org>; Sat, 23 Jul 2016 06:36:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=BrK2ulbM; 
 dkim-atps=neutral
Received: by mail-io0-x22a.google.com with SMTP id b62so115156719iod.3
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jul 2016 13:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=Hn6mANGc8GTbwucFtUL6M7qGugT9v3cQsME+dEGf4lk=;
 b=BrK2ulbMXhAAGpwoH+xNFmZicQK08RFfj2zKLINlWHgM0phRQ1k35pguAZ4d60tYzP
 em90OahfgNpMWNDU0+cuJE86MG6EdCuaGDVjS2K9Yx/bQrSZvnkkj257zvfseXtWfxRz
 vNgYd++vSd9oL8StL0YpO5xBQp3mmm3+h98S+7J8jI6p0UE6Q0ooQec+RJAQqc+17Tdz
 fobTyJ8Q07FS7KR4cIp9/qlsYJF8LUH5VkiYWcsBYR4ZFYwt9vF5sBZslEO7bLSlwQUa
 sP3tyTBMlelZQ5WCmIuew4Iqj6htGaWsEKOvaeEcO5s1Icq9sdBxs+j5xI+KXHVchCkx
 jMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Hn6mANGc8GTbwucFtUL6M7qGugT9v3cQsME+dEGf4lk=;
 b=VSnSWnDDeE/GSh0PQ2B1G1y6FcwwLWLLSU03Yp2IGmdPIPdE8KADUweAhV9NFXXsML
 AIYqo/LXL4BvUkCARLShXC7/uDEkWq7c/SvT8/x9RJcWB91zqddu+o1ILbAC29eF8P9e
 E+rhDSGKjYrP73bV8AsChzXncdnMRUsPbJlz6HGZO12gQiB8pwr1E2ovToZSAJN5+5bb
 le9BnGGcMxNQ+icOrlzHZDqUqWIeO/4nEsARPsaHKDIunFpu5trK/NwtHSeZzavGDXnp
 RJnt/6O2VvwkpH1bRExXpeVqx05Dcobcy1tVE8q+dr+VdWW2z+Lg1DKxg3s8/OSEgsM1
 0ztQ==
X-Gm-Message-State: AEkoousJG4tiIrMDyMuA7uqjQ7GZEQ2g8M9/yTGvJVVQJs7LN2EW2Gloq4Q/1RdJB+Zhe5A45P8PZFP5i/IXog==
X-Received: by 10.107.12.152 with SMTP id 24mr7116958iom.35.1469219784418;
 Fri, 22 Jul 2016 13:36:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.166.140 with HTTP; Fri, 22 Jul 2016 13:36:24 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 22 Jul 2016 15:36:24 -0500
Message-ID: <CALLMt=pbxkdVNy6bUuWrStmxUUEh6tvNQ7gnTqesDRiEz3Ksnw@mail.gmail.com>
Subject: Continuous Integration authorization against openbmc/openbmc
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jul 2016 20:36:27 -0000

Just a heads up that I created a jenkins job today that will do github
id validation on gerrit commits to the openbmc/openbmc repo.

If the person is on the list, then the jenkins job will give the
gerrit a +1 on it's Ok-To-Test variable, which in turn will trigger
another jenkins job that does the actual build and qemu run.

If a github id is not on the approved list then, you'll get a message
in your gerrit review about seeing an admin.  This whole thing is to
protect against people putting up evil commits that could abuse our CI
process.  If you need to be added to the list then just send out a
query to the mailing list or ping on IRC.  Eventually we'll probably
base approval on who's in the openbmc community or something.

The plan going forward for CI is to enhance the QEMU job to run a base
set of robot tests and then to run the commit against real hardware
that we're getting setup here in Austin.

Validation Job: https://openpower.xyz/job/openbmc-userid-verify/
CI Job            :
https://openpower.xyz/job/openbmc-build-gerrit-trigger-multi/

Cheers!
Andrew
