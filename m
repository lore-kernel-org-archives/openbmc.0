Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bs8o/adU"; 
 dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VwVH36qLzF0RF
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 13:52:06 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id f8-v6so3456272plb.2
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 19:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mVflXX7KmeUfWyUdJ/jYr/NyxgWwc7yYD1aviXd3ihQ=;
 b=bs8o/adUUxsCPeWX0tfVteUPC+qCsQCTM66QZZoRiSToSnTBeglm2bC6JhBFi5JT85
 I+btQcdlIraH7Y/RgnCZIBEgTmL6LlZQAs7YgKNfWKarEAqNVTN4TEqa3zQQ7WK1ViqQ
 O4g2JJRaFGA2YVtbrngB65zzeCLWGOySjSOYfi6KWzkrmaCMWklaalcotnvI0OmJx1BQ
 8H8kvW/u4DL8TfH3TZ/pR1JhzlIYOaonNGgWqJiU3eLSjV23Fmw6xnzHJbwkGnhc9InF
 Upk4gI9qe2GKv686/56jjVeMRFDF62JnTJSoo44WEQ5pHpaZAGBilA1EkwgMOQCHyPdx
 ePbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mVflXX7KmeUfWyUdJ/jYr/NyxgWwc7yYD1aviXd3ihQ=;
 b=I8AwH1UIm4RDb6EzMOmS480qgJd4zHllC2+q5cl55d7EYY7SiLCr+QQYkqKnMn5VoY
 g7M8xiyzHN5rUeBSg3hjAm0v9EJmSyiUYTfpyzk6xzk7oDzUscgr0jQ5S6MIK+U/sPBD
 OEQmEl1bs9QRSZdV9nxx+iObR9wgDRV1Gry/DVghqaRbRhkeegsYzxGVW8w1dwPTIJQI
 B5MmdmdaV9IU6yKYQyk4u+JHJBLAb7f9diXSfBKsVQg+nPazFcs2amn/acr0oAVIEVnb
 sqBsSP/oP1sJRa4DKSF548t1xzjJixFbteU8PF4QgDgSpaVa2yo+ydUASNYfUJexTyEu
 151w==
X-Gm-Message-State: ABuFfohksCEJ6nmgkx+EcLnQKlzHv6VNQ6jcgCkLujyTWV2avxwM1QT0
 iqVPhZZRKF6IR7FH/aZgCECOs9LuJryzy+lATpZpuwyg
X-Google-Smtp-Source: ACcGV60XeGnhzE2BD7HTuNgVX5sZWG/EgFGU0nwNfhs+uaSrpEnud8YxY7GMe4KJv6w5Sv0rs91wtKAClO0AJ+0PkF8=
X-Received: by 2002:a17:902:b706:: with SMTP id
 d6-v6mr2048338pls.53.1539226324196; 
 Wed, 10 Oct 2018 19:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
 <CA+YB3rb76TCnpLh3nXqcVtzGu0BUVWboWY87cNqgewm3ib=nFg@mail.gmail.com>
 <CAJoAoZ=fspkuFtZgyErrF6JjD2oR=uau3=gVb4ipugNQ2Qv2Kg@mail.gmail.com>
 <481b4ab3-8ecb-769c-5d23-25242ad394e5@gmail.com>
In-Reply-To: <481b4ab3-8ecb-769c-5d23-25242ad394e5@gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 10 Oct 2018 19:51:52 -0700
Message-ID: <CAO=notz--AX88W=OrY0MyQxk-=XZOyiRz+n0k34YPHgGxDk1iA@mail.gmail.com>
Subject: Re: Community Code of Conduct
To: krtaylor <kurt.r.taylor@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 11 Oct 2018 02:52:08 -0000

On Wed, Oct 10, 2018 at 7:58 AM krtaylor <kurt.r.taylor@gmail.com> wrote:
>
> On 10/9/18 1:53 PM, Emily Shaffer wrote:
> > Reading through this, I've got a couple concerns:
> >
> > - There's a clause for enforcement. How do we want to assign ownership
> > when enforcement is needed? We probably want to lay it out, I'm not sure
> > that it should come through the TSC. Maybe Kurt would be a good start as
> > the community manager? No offense to Kurt but I'd also like an
> > escalation path or alternative path - with these kinds of things it's
> > important to be able to bypass an individual if necessary.
>
> Re: Community Manager, I am already partially doing that in an
> unofficial sense, but for an escalation path, I would highly recommend
> first reaching out to the TSC. Any inappropriate activity or harassment
> must be taken care of immediately and the community leadership would be
> tasked to take care of that.
>
> >
> > - The clause on scope seems to me like it may leave a gap surrounding
> > harassment of community members outside of the official OpenBMC setting
> > - ie, Foo posts to their Twitter account, "I'm having a lot of trouble
> > with Bar's code reviews. What an idiot! Tell them so - their email is
> > bar@baz.org <mailto:bar@baz.org>!" I'm not sure I'm seeing how the
> > contributor covenant protects against this kind of behavior. Maybe I'm
> > just misreading and this counts as "prviate communication"?
>
> This would absolutely require that the person be put on notice. Maybe it
> will help, but I have also never seen this behavior work for anyone
> trying to harass anyone. It has always backfired on the person doing the
> harassing in every case I can think of (I have been involved in a couple).
>
> >
> > On Tue, Oct 9, 2018 at 11:31 AM Jeff Osier-Mixon <jefro.net@gmail.com
> > <mailto:jefro.net@gmail.com>> wrote:
> >
> >     Hi folks
> >
> >     We strongly recommend the contributor covenant coc. Being adopted by
> >     many projects.
> >
> >     https://www.contributor-covenant.org/version/1/4/code-of-conduct
> >
> >     Glad to discuss more
>
> As I said in my previous email, we already have a CoC under the LF
> policies, but I am not opposed to adopting a new one. That said, do we
> need to improve the existing one? Is there something missing? Has anyone
> compared the two? Did I just sign up to do that?  :)
>
> Kurt Taylor (krtaylor)

I just read over the LF CoC and I think it's pretty solid.
