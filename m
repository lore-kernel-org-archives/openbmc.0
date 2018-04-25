Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22a; helo=mail-vk0-x22a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="E1MkjU/w"; 
 dkim-atps=neutral
Received: from mail-vk0-x22a.google.com (mail-vk0-x22a.google.com
 [IPv6:2607:f8b0:400c:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40WZF8720szF24h
 for <openbmc@lists.ozlabs.org>; Thu, 26 Apr 2018 08:12:28 +1000 (AEST)
Received: by mail-vk0-x22a.google.com with SMTP id r184so14823311vke.11
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 15:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=dsCzQIzTasfzttKlLdMjMcFnC1lICneX8SzWI+Xf2qE=;
 b=E1MkjU/wB4p+dkyBoDGJXx1c18ZzMxB1q6guXp89ABm1n7LmVoeROMYjo71sJNB1+a
 OQjikFOKgxleJGJ4yerTwCO89+HicZoBlXz3qqRbPfSirP0RpggqNZ4YOHV1FmgVHSKu
 +39BRjtQaK2KOl8BxJ9UlTJoQtmYzbjoSX3RsO58Y/o6UKp6zUHeVGo5ohAE6iEha/tp
 8U90aTyQqTPTPj6azb95M9lsxNz0ApDMSZiTYXpzt6TzSvnV3DX+WSvDujRpozjEbYb9
 XKd6jhVL53E3RH5BMBmxnMNFxsJvxIUzOBgvPs1cBL9f+8ZcZ0ubKOhpWMqaNg+Vsr46
 hI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=dsCzQIzTasfzttKlLdMjMcFnC1lICneX8SzWI+Xf2qE=;
 b=pVey/hHqBIXTcWOT1aJftmTrUyvH0A9+b2xUfV5SGrZ7WUCPLqglGvv0+ExKLhzRLu
 lXrQq4pS6LEy6SiwxwiloRvcVQFeUrOK3zlZm2xre4IzPeLL2M70h1clZMZGsVojd/vC
 817WXxDdTzCZgQVd09Vom3c1DyutLWplGdND35SZj+Kj8RawQZf5Jf8wFBCcmsp+6qjk
 dT8BUaNUgtc3WEp4m5dC6P9krsZaAa+ceco+cFddkl6sOYQNEbRk880QkFpMCKg15/tV
 D+5POmboCt+oCsOI/qVdFxG9bxz3BiUtCrdNsorMcgMTyq4U7yS/KJR9TIFiCzRT1ggZ
 S4TQ==
X-Gm-Message-State: ALQs6tAqxqVLpebZysTOpDz9XVSuF27KSa6/j6Ehlgfze0iPqb+MVhRP
 Jdh8qy2ZQi8/eBgw+VGAoGlr2a10KilpWLAYw/YADfl3UX0=
X-Google-Smtp-Source: AIpwx4/dl/m1bSp31DsI0az2Ph8agYqfW5VjncgTqFqfsaQhFPUX9J5c3MjNagU9SK/OWfTMvIBDdEYAis0kwIWa3bs=
X-Received: by 10.31.135.146 with SMTP id j140mr21902199vkd.109.1524694345262; 
 Wed, 25 Apr 2018 15:12:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.87.198 with HTTP; Wed, 25 Apr 2018 15:12:04 -0700 (PDT)
In-Reply-To: <CAO=notzvDXGsri+oCHBWueU4LthtLtFnrhS8U0cdaa_r+An8Vg@mail.gmail.com>
References: <CAO=notzvDXGsri+oCHBWueU4LthtLtFnrhS8U0cdaa_r+An8Vg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 25 Apr 2018 15:12:04 -0700
Message-ID: <CAO=notwjeWL5arb=j+eudQi9dFrSfyY6Rr1yE_0UeEjHQ3UtXg@mail.gmail.com>
Subject: Re: First Stage of sdbusplus mocks
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
X-List-Received-Date: Wed, 25 Apr 2018 22:12:29 -0000

Hi everyone,

Just about to head on a quick vacation.  Wanted to reach out and see
if I can get some more feedback on the progress made to introduce
testability through interfaces in sdbusplus.  I'd like to start
writing tests that use it, but can't so feedback would be appreciated.
And thanks to Emily and Lei who have been looking at it.

https://gerrit.openbmc-project.xyz/#/q/topic:gtest-gmock-ready-for-review+(status:open+OR+status:merged)

Patrick

On Tue, Apr 10, 2018 at 1:12 PM, Patrick Venture <venture@google.com> wrote:
> Everyone;
>
> Mocks:
> https://gerrit.openbmc-project.xyz/#/c/10046
>
> I've only implemented mocks for sdbusplus::bus::bus and
> sdbusplus::message::message (append() & read()) at this point.  Next
> I'll be tackling other parts of sdbusplus.
>
> Basically you can now verify the calls into sdbusplus, and the
> parameters passed to the messages.  Which is pretty valuable.
> However, nearly all of openbmc was written without unit-testing in
> mind, so few things have easy injection points.  This'll have to
> change over time as unit-tests become prolific inside openbmc.   In a
> previous email I talked about using interfaces in libraries for
> everything so that you could get mocks for free :D  That's the way we
> need to go, and so I'm going to do some basic library implementations
> with mocks and see how people like them (or dislike them).  The idea
> being, anything you're calling should be mocked so you can easily test
> the code. :)  Easily being key.
>
> Examples of usage:
> https://gerrit.openbmc-project.xyz/#/c/10048
>
> Please take a look and provide some feedback.  The sdbuplus mocks
> aren't compiling in the CI, but did compile locally (as obvious by my
> usage of them in a unit-test and a live image).  So I would appreciate
> some insight into what might be going on there.
>
> Next on my plate for attack:
> sdbusplus::server::interface::interface
> sdbusplus::server::manager::manager
> sdbusplus::server::object::details...
> sdbusplus::server::transaction...
>
> and seeing what openbmc daemon is easiest to rip apart into testable
> units, to provide more examples.  phosphor-pid-control doesn't compile
> with upstream, otherwise I'd start there as I'm familiar with the
> daemon and it was written in lots of pieces for testing.
>
> Regards,
> Patrick
