Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22c; helo=mail-ua0-x22c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="J+MRjlvB"; 
 dkim-atps=neutral
Received: from mail-ua0-x22c.google.com (mail-ua0-x22c.google.com
 [IPv6:2607:f8b0:400c:c08::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40LJHs1FPXzF2SY
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 06:12:40 +1000 (AEST)
Received: by mail-ua0-x22c.google.com with SMTP id j18so8177483uae.12
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 13:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ajtjyuF850A6Glkl7lOohyPX4/HOFuW5rmoAuc82kJU=;
 b=J+MRjlvB2QDqGpkoU0Zl7IWix8YElSbFDil/CisRHXvAqMBJcOVjjqm6XhvD6bWphv
 OcQj466ynJ8tqIOaOsnUD501snd1M+R1x/bck2zA7lFk3hgkmwZBzLImRASU0Zl/YvSg
 KBcM6FQaQ6eKSJXC+c5Tw84MS0PmhDV454PqCUPjMpXocT4T/plSVl6+Kx6CLgyvvD6A
 HmORlbMtUSFrU/MrQa7xPbwpVlHOus9CRn/R6tj52ZHdZDLUIc8PFazjRKMnxlxROnPv
 N+57SUcYiodXLA3ErU99xujmTimMyL5Y+6WoBVs/DgcunVBrAa1eaQA4FAjIuQvJUdzp
 rkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ajtjyuF850A6Glkl7lOohyPX4/HOFuW5rmoAuc82kJU=;
 b=rFHOoG2LKKZ5bVF20/NkILB9Vd7tGx/hsUlzGjbJXJwl+ZkcItCBezt++GP9zWjUF/
 9TUiBUR9gEsRDtplhlG2fCasfKHUpXhrr/bS29seHMDmKK35IcvIgWzOaOovACu+cwfk
 TflMbo0LOIm4NR2kD0PvuCOBbJsDfjMcwDdu2byhjW9IHTru29gMzmhXLq+KeoJ1yCWX
 QRVLxkbAeEDZDaue++XdBQ7yXQq7Pm1/3m9dKilP7lDgWYJgvTMnFpBEbSi2qlWP88wX
 +0pLg+oSy/hHDq0emGIHX1HeE3y5lany75j8xhHsz+R5iePCTTSBVdyAMMuoBcoLOc5t
 EqVA==
X-Gm-Message-State: ALQs6tBgp/awx3EWILf2GLbVUVepFFhjGBpEpGrkZ3l2Acs17fsVYnIn
 9ien/cfOlJ8G3megpKPZQ/nmWgtlQof5MC32lqN7axFZHvg=
X-Google-Smtp-Source: AIpwx4+/fhfI54+tmksKn8vWQOGPT04gQGvlHmdqCtn+oLm1zBTNUhyvHCIDiIMyiZ7clNJ/cmrSKdoPw3KuZEiPK+U=
X-Received: by 10.159.56.202 with SMTP id w10mr1460225uaf.147.1523391157227;
 Tue, 10 Apr 2018 13:12:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Tue, 10 Apr 2018 13:12:16 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Tue, 10 Apr 2018 13:12:16 -0700
Message-ID: <CAO=notzvDXGsri+oCHBWueU4LthtLtFnrhS8U0cdaa_r+An8Vg@mail.gmail.com>
Subject: First Stage of sdbusplus mocks
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Nancy Yuen <yuenn@google.com>
Cc: Emily Shaffer <emilyshaffer@google.com>
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
X-List-Received-Date: Tue, 10 Apr 2018 20:12:42 -0000

Everyone;

Mocks:
https://gerrit.openbmc-project.xyz/#/c/10046

I've only implemented mocks for sdbusplus::bus::bus and
sdbusplus::message::message (append() & read()) at this point.  Next
I'll be tackling other parts of sdbusplus.

Basically you can now verify the calls into sdbusplus, and the
parameters passed to the messages.  Which is pretty valuable.
However, nearly all of openbmc was written without unit-testing in
mind, so few things have easy injection points.  This'll have to
change over time as unit-tests become prolific inside openbmc.   In a
previous email I talked about using interfaces in libraries for
everything so that you could get mocks for free :D  That's the way we
need to go, and so I'm going to do some basic library implementations
with mocks and see how people like them (or dislike them).  The idea
being, anything you're calling should be mocked so you can easily test
the code. :)  Easily being key.

Examples of usage:
https://gerrit.openbmc-project.xyz/#/c/10048

Please take a look and provide some feedback.  The sdbuplus mocks
aren't compiling in the CI, but did compile locally (as obvious by my
usage of them in a unit-test and a live image).  So I would appreciate
some insight into what might be going on there.

Next on my plate for attack:
sdbusplus::server::interface::interface
sdbusplus::server::manager::manager
sdbusplus::server::object::details...
sdbusplus::server::transaction...

and seeing what openbmc daemon is easiest to rip apart into testable
units, to provide more examples.  phosphor-pid-control doesn't compile
with upstream, otherwise I'd start there as I'm familiar with the
daemon and it was written in lots of pieces for testing.

Regards,
Patrick
