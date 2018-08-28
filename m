Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rmZJsmXJ"; 
 dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420H023hg5zDrVP
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 04:12:01 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id e23-v6so2127893lfc.13
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 11:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vCREilUp9AgRAK4iMqP/6f10Q/QMzC57LBPC7QAB1es=;
 b=rmZJsmXJoOXCIzAoLZ5DDQ0TfsryZdJMgwp8QAp9O8FSThk/vVHLW4IQtcLLRMUIGi
 8y6S8olHpp4WiiZ7tZFCK3P137lj1BDndQIZD4d78MSfNJq0JLTANS2Cjnl7ry6lB388
 dg7G5lCdYeC6H0oVAjpVkK9wddMpBfx0gRyYHKDgvr4CSP1R3cKzF3oFgAxslxuGc8Nl
 Ep8xxSqY4sghDXT/Uf/TfN9VilRWdi211MZ4vwKRq/X+9lacO2fuBdFkjBUbQ7noGqGC
 EBoEqfXDns/nui9K5rYvuaheE3kYiRU4casLIe/UVQtkvN0SxoHhjH7oG4LExTQxiQ12
 OPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vCREilUp9AgRAK4iMqP/6f10Q/QMzC57LBPC7QAB1es=;
 b=AgmH3qBv8LYS2JDztn4bia43Ult9LO/YFVeRi47b9CAwBUPjnjSzjTy10AVgyfv/g/
 vz6ACuhuWO6ROfo1zyDKEIMTNYBbWWqFtrE3Ypgsp5Lw2DaWwGdtOyfJNdk3UY3EIYvx
 em32Ya+8mnJ74d9Rsl78EKZO8qXPXc9z6wuD27wFaKnurP1OoiQFKAdNkBwrDcfI/YG3
 Pw7GAmWZPu/IbWu9eZ2/D3YTutOXr2IaxG7mpzg0jq0V6Ki93cXkiWob5frzFGMjhQ81
 uu/CfGcuCzeGENZflnylb4GO+ZkzSrR67ZasEnQCKbCD3eawrpc5k1l+XVTG4ASKz0c/
 NZDw==
X-Gm-Message-State: APzg51CWCLfahdsrEJ+vcDWYQaaJcFOdNoZ8SeUZ1uu/dOy4xLYiPKYl
 9BoiGnIQNkgVqyH7XhvOvY6+bZnYgrlG+dBznM2Njw==
X-Google-Smtp-Source: ANB0VdbEMLBTtXxfmg4HH6WWjZooKGpbQY/Xan0/apNCoBZi0EO4T/w4MN4vccvhnou+gVlpsAAcg2tlF8iD4KwnQXc=
X-Received: by 2002:a19:57c5:: with SMTP id
 l188-v6mr2080635lfb.109.1535479917658; 
 Tue, 28 Aug 2018 11:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzut2sd4GZvA3gMzoB+J7g48nXnXKONhnwNfJC8jPWPAg@mail.gmail.com>
 <c3d8f4e3-86e2-8fae-5c6e-49632262b8a9@linux.intel.com>
In-Reply-To: <c3d8f4e3-86e2-8fae-5c6e-49632262b8a9@linux.intel.com>
From: William Kennington <wak@google.com>
Date: Tue, 28 Aug 2018 11:11:46 -0700
Message-ID: <CAPnigK=420eP_9d04FMCyvCzyoDB=f7i+ZbNMkxa5kGL9avd3A@mail.gmail.com>
Subject: Re: Header inclusion ordering style addition
To: james.feist@linux.intel.com
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Tue, 28 Aug 2018 18:12:04 -0000

As long as this can be done automatically with clang format it sounds
good to me. It seems like the trivial alphabetical ordering built-in
to clang-format works fine for the consistency element. We should get
rid of all local includes and use system includes if the headers get
installed as part of the packaging process.
On Tue, Aug 28, 2018 at 10:54 AM James Feist
<james.feist@linux.intel.com> wrote:
>
> On 08/28/2018 10:35 AM, Patrick Venture wrote:
> > Each file in each daemon attempts to order the headers in a consistent
> > way.  Typically, alphabetically.  However, I propose here a more
> > explicit ordering:
> >
> > https://gerrit.openbmc-project.xyz/12180
> >
> > As an example of the ordering:
> >
> > https://gerrit.openbmc-project.xyz/11421
> >
>
> This can be enforced in clang-format with SortIncludes
> https://clang.llvm.org/docs/ClangFormatStyleOptions.html and
> IncludeCategories regex for specific ordering.
>
> > I feel that having a consistent ordering that deals with the various
> > types of header files included provides a couple benefits:
> > * header files are included where you expect to find them
> > * easily can see that there are c-headers included in a clean group
> > * defines that the phosphor library headers are treated as normal cpp
> > libraries and included in that grouping making the headers come across
> > as system libraries and not something different.
> >
> > Please take a look.
> >
> > Patrick
> >
