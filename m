Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="c0CGji9g"; 
 dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 421YhC3wCHzF37N
 for <openbmc@lists.ozlabs.org>; Fri, 31 Aug 2018 06:17:46 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id s17-v6so4324526plp.7
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 13:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=95M2NJ0lh1TVxdLn8zsRjDfIBKo9uvPnoNqgiGIuUNY=;
 b=c0CGji9gGsUFZrmm6rRgmADqzkHa+XQkAjJu5ZxIbY37t8FltEIq4Tnzju2nrqSVHI
 OL2tjZFappyK5kO8SHFbCx8+AhmRuANlWrxG4/rv3h5ouM/2xB1ifIGbqIIxSZjQ0bpG
 aZhYfBg7OTDClko3dlLAhA5UbncP0e/sIJy85vdUsxZ7qUW613BgT1Zgs/fFNccGzUv3
 R4hPvKGTnAsHd6ok0ffs3AUPvYZCOQDS9e6pbTdup2H2Ro20ekNRmoouhoPSXM2JDYxH
 85MEftnQk41820VV1h3nRTdd/br42lYOpiTx0UcaQLEupStJmLaZxNh5YeJxfA9SQJ37
 uD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=95M2NJ0lh1TVxdLn8zsRjDfIBKo9uvPnoNqgiGIuUNY=;
 b=hNhG7E360fQWyOTTGH5T4pPxz+zJPoakAT5oXajcJ/2DQ/f0rP7j4ojzSAFZba0H9Z
 nCqrAQbkZUS1X3Kim+WXidkA8djN/97MPrcOQYSZ+NL9PQi9MzatjrBAepANbhqdeYkX
 YnJ1JRoJE/Z+py2SorbEG3kxePo3y5HbOYvDQIxUCuABTFmHUlRiF6Jtv7YO8Zhg7pLd
 M0V6qLvAZxlOz2jkzNog/8RpnYLR/pThSb6x+F4VaT82UqRYJn3AMUxdtcjN8mifiO9Y
 TNJ0t/7IANlajb+QzuT58mpX3/p9J8TS6bwPtTrwUKIOhL5PP7/cjBrJRzKf7VrZyZrF
 N9uQ==
X-Gm-Message-State: APzg51BXOjkudIGwoE0feIQuDLrd6LgzFvsVENAlu2Ydi4gbo68Ynq2c
 VFmy57t9ut5WCrS+RfDz7S8t+m8dR8BQU/4ogouhFA==
X-Google-Smtp-Source: ANB0VdbUR0M2Y84JuJ6QVuf44PisRfrUTehEmkJvV4Q9nEEtyn1ouwi+/mlon2TMgKF//7IQoSl4tN4nO8SV/aX8aF0=
X-Received: by 2002:a17:902:46a4:: with SMTP id
 p33-v6mr11891361pld.205.1535660263513; 
 Thu, 30 Aug 2018 13:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=XaO=t=UuSDjcgZ=Nkh9J7vTQJPEAMG5=_Ca7ukRVekA@mail.gmail.com>
 <CAO=notxjAAF0w70yrmFffNQchEmdcexWjAt9xftiwaRw6-aM7Q@mail.gmail.com>
 <CAARXrt=fojNyiYiZn2qC+8O9nw9AvjT7ux4vtFP9cf4m7GM0Qw@mail.gmail.com>
In-Reply-To: <CAARXrt=fojNyiYiZn2qC+8O9nw9AvjT7ux4vtFP9cf4m7GM0Qw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 30 Aug 2018 13:17:31 -0700
Message-ID: <CAO=notzau4N3HLTyGy0YpUBNXy8UvV+8DBN4xQN_yEJ_5wFT=A@mail.gmail.com>
Subject: Re: Feature request in phosphor-pid-control
To: Lei YU <mine260309@gmail.com>
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
X-List-Received-Date: Thu, 30 Aug 2018 20:17:49 -0000

On Thu, Jun 14, 2018 at 7:21 PM Lei YU <mine260309@gmail.com> wrote:
>
> > So, this change really is just, "don't fail if you can't find the
> > sensor during start-up, and keep trying until it shows up"
> >
> > Does that follow?
>
> Pretty much close.
> More like "in any case, don't fail if you can't find the the sensor, and keep
> trying".
> Note this is applicable to sensors that are unavailable.
>
> For sensors that are expected to be treated as fault, it should trigger
> failsafe, and this is discussed in Ed's mail.
>
> Putting it together, the feature request is splitted:
> 1. For sensors without operation status, we can config them as optional, so
>    they do not trigger failsafe;
> 2. For sensors with operation status, do not trigger failsafe if it is
>    unavailable; trigger failsafe if it is fault.

Just bumping this back to the top of my list.  I don't know that I'll
have to time to restructure the initialization of sensors until a few
weeks from now.  However, I'm bumping this now because I'm doing some
phosphor-pid-control work again and it's a good time to think about
these features -- since I'm already cracking it open.
