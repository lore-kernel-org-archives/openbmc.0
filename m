Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="koeWgwRz"; 
 dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420s9X0XdvzF31h
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 02:52:16 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id z25-v6so2579752pgu.7
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 09:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rpTzCwyN1fxD3VfmJHXcN0vR9xv11TvVsCG/orjIDIM=;
 b=koeWgwRzvFMG4xsNP4xTshSL63XO2wFdd8oO/UBYA85gO3/qUBgZmFng9Wb6ppuo4k
 jEGJkWqtdJUofTm2hKDdwQZZuqsamt+tMB/EZZBYEoBz7XRYqoWdsZMS+UQeHP8lmbk6
 W2/vUHhAKrQR1VDVrTdTNQ+OqIqiildOVqcqNLOUCm7CPmKd2km1ATTkJB4zH2rciBut
 hMlTZ8x0aSLyhqdju62bGNYtTHMJIWdp5duG2EgzuHJdFNDcgjn9AcdF1VYkBODS6GxZ
 CibwiqfMGIasFp+EXMHL0VYSMBCEN2+0jHofvfuoIrxQToQt9UFNDDWPPR+eNdy3wYR9
 G1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rpTzCwyN1fxD3VfmJHXcN0vR9xv11TvVsCG/orjIDIM=;
 b=iAZNQJxsgodeusLk1+kXY9YKIScsRSlmnlbXU8ygpNqQ7ZEO9EGTGTD+NiUvz6gXUR
 VNu6jpWfKu+jDyzJyOIs8QTvu/INitsW+W10S+o7eAqQR0ELS14lKyI+nA0vw4p97nob
 sazGnlMxj2Mo7AZXnY3xcJHxNRIl9A8DwYU49TjB4+lFAIt9+mD0P/PHUjvWMZSyGw93
 DAKfILGMwa9ao4ezYCTVP1Kdomilm/o/ll2saULdzrFB4T6U5lovTM+L1tvPgIJeuvBj
 /VgQUxQU55DARWXlIe1Paq9OzxQibAWU2BsKiHbomcfSVerhrqLlBeHm8IdQaeM+CuDm
 2lLA==
X-Gm-Message-State: APzg51BlLiJVC+9Gmx/9dYoBixDiWSLixeaSOuSFf7D/KLoBdDSAilYX
 k2vbOqXREblxG/QHRKRXexfC0UK+mE4GIRjuvpxqKQ==
X-Google-Smtp-Source: ANB0VdaURXaJQrIrdDqxeh0D9TG5nPIoRlSFsfYLjWA9RWOLMdGy2BQe6m5qOQdF9Nv9Q4BOYoxmkQPqqDaGqeP7BvI=
X-Received: by 2002:a63:a5c:: with SMTP id
 z28-v6mr6253424pgk.209.1535561534221; 
 Wed, 29 Aug 2018 09:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notx7e+sfKm3t07-kg3pjrk2H3E5p=jQsZsW=Ekosd7=yyw@mail.gmail.com>
 <56709AAD-BB1E-4611-83E9-4440FAF81541@fuzziesquirrel.com>
In-Reply-To: <56709AAD-BB1E-4611-83E9-4440FAF81541@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 29 Aug 2018 09:52:02 -0700
Message-ID: <CAO=notwKw4KcsHoZN=pn6qzXm_U0j5L=q4V5BChySFN5Tz939w@mail.gmail.com>
Subject: Re: Two Google-Origin Daemons
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 29 Aug 2018 16:52:16 -0000

On Wed, Aug 29, 2018 at 5:44 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
>
>
> > On Aug 28, 2018, at 4:50 PM, Patrick Venture <venture@google.com> wrote:
> >
> > Brad;
> >
> > We have two daemons (to start with) that we'd like to send up.  So my
> > question is, should we put these to live under
> > openbmc/google-{reponame} or google/{reponame} and point the recipe in
> > meta-google to google/ or openbmc/ ?
> >
> > I'm inclined to say the code can live under openbmc/ so that others
> > can see it, and because it uses openbmc stuff.
>
> This is fine by me.  It would be nice to know what they do.  I may have
> an opinion on what they are called (the repositories).
>
> This highlights a concern I have.  The project could use some formal
> criteria for hosting code on openbmc.  Then we could evaluate new
> repository requests based on those criteria.  Open to thoughts on that...

I'd be ok with announcement emails that spawn discussion leading to
the decision.  Some will be no-brainers, while others may surprise.
Ultimately, I have five things that I'd like to upstream in the coming
weeks, and two are very google, and the other three could go either
way.

>
> >
> > Patrick
