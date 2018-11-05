Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="c1r6sSCm"; 
 dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42pcXq2q7HzDrMm
 for <openbmc@lists.ozlabs.org>; Tue,  6 Nov 2018 02:48:42 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id p16-v6so4645527plr.8
 for <openbmc@lists.ozlabs.org>; Mon, 05 Nov 2018 07:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oIuXAw6BDaCfPGaDpnl795+5YxBGY2ZhENCOjX20Udg=;
 b=c1r6sSCmRR/qCNi4W/P18KYLUN1Fc0fiIr9+VIcAxpOvMFmcXEt6PwKliTWFdNW05b
 JCm2eV/a4rdBkJzBwAEBk6pImtSxo071nT46ZfOkgI9cQBCWw/7oaG9kHKKknEJPAlrF
 uuIN3iRa+5970cVQoVnNvjFrVFnUMLKa+6ifL538H7NKv97mg2MNGf25VeJfezZGyCKQ
 lkZIFUOO85TyvPsFtLiPeFqgYZHy2hFmL6T7y7RoWRiL43LUwcr9r82mk+B7q3vk8P+w
 3bX9UcoMOgTh5+qHZAdWqfIWCqvBMiUMlRkTWw7Cxp1NK1PjTwv3LQ5a9GnfyKvVrSYA
 VlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oIuXAw6BDaCfPGaDpnl795+5YxBGY2ZhENCOjX20Udg=;
 b=BtM7itAuzDBaa/MV/rZwcfDoKZqbBWFn0FPBABCJrXvPBiCzd+jV61vFgFJ2HQsqbJ
 K4tXjrai6eRw+HfAoKla5JW2IR0AEFy/GqACD+XxyGRNHd90KW8lcyvyYx0RIFcv3RYr
 w3e148JtSPHl7JGmYSuQWA+11vvlthtcHcEpWK3G6Pe2AH0r9jIiKzAp9dcRuNMrqwjS
 kxgl57A8JzxbVHh8hgD072UKlxj3JYsGzPGm0zw+xdq6WKQNUyWmonLGJbAfJxHp+CP7
 w8D2IUe2GaoV19D8cZ7pkVLn4wzlR8mpDqUdYvodDEC8nTvRYn+0CWWUmB8fOV48rIn8
 D73g==
X-Gm-Message-State: AGRZ1gL3HtBj5SAANmkH+XAisZb6+h+bPaC214e8k7kDF66fIX9shkrj
 svBFR0g5PLX0PkbRB6ZGQH0y6wRaK5Iji3qtlRDMZg==
X-Google-Smtp-Source: AJdET5fqr2C40O2MqcLv2ANysRPjZTPhnA85H0RBNDOdiGyhUFwcmVJMDjL2aiGRhWXEMZIOM+Qe7l3Web/jog70K0U=
X-Received: by 2002:a17:902:4583:: with SMTP id
 n3-v6mr22565577pld.53.1541432920158; 
 Mon, 05 Nov 2018 07:48:40 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notzskWiKUC149VvN=E6AiALP+G_2mFwRad56jhOykFcLsg@mail.gmail.com>
 <CAARXrtmqHVZspJuOp7cFcyHU+Xnk9Tb0q-KPL5mCEyea48cYKQ@mail.gmail.com>
In-Reply-To: <CAARXrtmqHVZspJuOp7cFcyHU+Xnk9Tb0q-KPL5mCEyea48cYKQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 5 Nov 2018 07:47:37 -0800
Message-ID: <CAO=notw6-JfnR5HK5Uz26HbEJkE+H1LGCqJG+wPQKwtvgCjt8g@mail.gmail.com>
Subject: Re: Copy-by-value in sdbus++ generated objects
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 William Kennington <wak@google.com>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Mon, 05 Nov 2018 15:48:44 -0000

On Sun, Nov 4, 2018 at 6:36 PM Lei YU <mine260309@gmail.com> wrote:
>
> On Sat, Nov 3, 2018 at 12:33 AM Patrick Venture <venture@google.com> wrote:
> >
> > Most repos inherit from an auto-generated object.  Those objects pass
> > all parameters by value.  This is fine for many cases where they would
> > need to create a copy of it, but in the case where:
> >
> > for instance:
> > https://github.com/openbmc/sdbusplus/blob/master/tools/sdbusplus/templates/property.mako.prototype.hpp.in#L69
> >
> > The values match it's wasteful to copy.  It's also possible the cpp I
> > learned way back is different in how this behavior works, but I wanted
> > to check.  Because of the prevalence of this code, if there are lots
> > of updates that don't actually change the value, it could optimize
> > quite a bit at run-time.
>
> Agreed, this piece of code does not change the value at all, so it is better
> to use const reference.
>
> >
> > It would require a lot of simultaneous fixes (or two different objects
> > generated, and transitioning everything).
> >
> > Thoughts?
>
> Maybe we could try to change this to const reference, do a build and see if it
> cause any build error.
> I guess this is OK.

So, I can guess without building that this change will generate a lot
of errors as all the overriding objects will be set to "override" but
not be overriding anything.  So, compilations will fail pretty much
across the board.  To be fair, it's actually maybe 20 repos that would
need fixing, so not that big of an order, but yeah, I don't think this
change can go in without a bunch of other simultaneous changes (unless
we add something like a suffix, '_next" or "_new_" or "_2" and then
slowly move things to calling that and then when everything is calling
that, make the original the same, and then move everyone onto the
original one.
