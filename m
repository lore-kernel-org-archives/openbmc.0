Return-Path: <maxims@google.com>
Received: from mail-io0-x230.google.com (mail-io0-x230.google.com
 [IPv6:2607:f8b0:4001:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w39j30ms0zDq7h
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 03:22:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="B6JQWvtF"; 
 dkim-atps=neutral
Received: by mail-io0-x230.google.com with SMTP id l7so49152734ioe.3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2017 10:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=lnlBA9qGIbGO2LTP/FtYAhAcUhwrrcCMirNiP6CRsxs=;
 b=B6JQWvtFYRslukgsB/37tueQYQyaUgdu/lBdYw+3Cv6Hu/6Rhsaf354e/KC3N+zYto
 aaI2GXh1BGHIpIpETiL7KFHHLs6l8QNc+Mt17+a6DpuDhbV4IjtFer8ZgUJvX+HxvV6d
 3XTAkTh1+8jKENBTWDx56F/AlsAY3g7SipaDxXw2bzkQ33zxhz4/ISkPsH9hcX0CGlmX
 tZ65F0X9rukjHzjPhDD6d9DLKBoJ3v30awSmBaQpwkBldpMF3vXejQPhdsB8xOlitmbs
 OMKgIbpD/Q4s0ru6l4gpBQA3TzfLnzJ6yYoZvql0XNuQn9q7JifBQAyy6wq9fh9HdjqK
 CPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=lnlBA9qGIbGO2LTP/FtYAhAcUhwrrcCMirNiP6CRsxs=;
 b=uOUV0qHaZeSIu79HQ2+4bhjFfg0rG/DkyoZypleu+U7+2SRuO0hpm2LIBs5Eu8hL2Q
 5f30zQPyulI/LRyV8ehff9Jxvc93nLXmdwJdpYO3wIv/m9mjovKEa7t4ECTiHkXBSjX6
 gw7iiAQ13qT8h1A4QJWWOquHAs0IJWgrfPLRSwsXv4GMziEqiP2cPB4rBL09yk/o5S60
 bGFInUEwXX6Ire/WImwzI36NyFmigvidTXsKTwLJHaLVq8Ke9+TV3AfdID6mrrZAqYVu
 HNTxKb4j7t9XXVYMA2LQWH4RFYjf0c0v4ZGF4q6gNw0m0/QkWhRu1JjRadmx+1+SBu37
 Fw3w==
X-Gm-Message-State: AN3rC/6NbMyMUcrIf5hx2W/wxuAgsN4qhGDQ9YCPfnr5Ja2Eu6prmxM+jmyZLciRHmhqc/SWulTbgV6u+yOzILKp
X-Received: by 10.36.115.12 with SMTP id y12mr23334350itb.24.1492017748068;
 Wed, 12 Apr 2017 10:22:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.185.7 with HTTP; Wed, 12 Apr 2017 10:22:27 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 12 Apr 2017 10:22:27 -0700
Message-ID: <CAFR_W8po-K8Jjfd=qHzA=hO88stnQQDWEbNz2htm6b2DBqyHAg@mail.gmail.com>
Subject: Running tests
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Apr 2017 17:22:31 -0000

Hi all,

I'm looking into ways to automate test execution for ... well ... as
many things as possible. I see that some repos, like
openbmc/phosphor-event for example, have tests in them, but the
problem is, I can't build and run that project individually, because
of missing dependencies (my libsystemd is too old).

So, my question is, is there a way to build and run those tests from
bitbake, so that they would use the version of systemd from yocto,
rather than the one installed on my machine?

Hope this question makes some sense.

Thank you!

-- 
Maxim Sloyko
