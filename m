Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Gn88gguw"; 
 dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44TDJM5lv5zDqG6
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 01:38:11 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id j26so6343316pgl.5
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R3LzpwwYDwoxfJEw7PFJ8a13+jOcLyWnRaat8WSvOic=;
 b=Gn88gguwcHBh99ow5Rg89y8dHXB/DnutUkwlIbYQcztT2dOqp6SJ4Aq7y+IMyEGJCn
 8UEUxAAwp19qS3S0o9fv6bgAakiVgBObWqFpdavCR4/7oRZ2WvUF3rUpU5AS40oqZS1n
 MqhTlGZU/Zu7Goa2gUddC+VbLsZBZVbcLvUVcek41ouVHiU3iOQqFfBgmbF03341EuQj
 mKZSlTnJeQ+O5/rA57aIGnXmFKV2QC8wemCdKYtbbl0ZEc7aGwCSEmny7Ad12q3M8jZg
 1giCC4Fl3Zpry/vthsPuo11xTxuTs0nZRBoZVN0XoD+vSHPFwjw1QeN3z08Oue5//fy4
 AWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R3LzpwwYDwoxfJEw7PFJ8a13+jOcLyWnRaat8WSvOic=;
 b=aKuZ3za+ZEub4ncCzUJB0c+xysjS7zKUjDkJdBUEHin1yWjeWLjhCsv4nZohSu+7Qe
 t6hssQs6em13Q6zBCnN87Tiq5cta5VxW7ZRaWdsnWs8Dcq0QmkxqBu/PNLD10V+iNgMu
 IrW5b5/OqPQwMtl+Si1dIkVSmiwF02P7FJm+WJf+Aa+gkT/FTvjub9x+VhrFK+sAfJxC
 mqND/wT+4JELbF3jZJo5ZVPjHrF8bi/H8A59HTEsOZQtjICCH/vi5UsESp8cdKpNszMx
 qDQUcaGk2VZ3Hb0URjs1c/0FHYPhMO9dytF2zCo1xWLn779KwOBRvYCHFUellNLr2gRQ
 Xggg==
X-Gm-Message-State: APjAAAVsiOdn0vfRm0W4hvpd0o1p3kn4fhc6G9/MvAWgw0wpnrfRd0Gf
 x+nXdzEnpURKbPkdeJDdljjA+Xo8CxjfE1mTRSnjag==
X-Google-Smtp-Source: APXvYqyMMnwOQ4D30f023CxN14uAulTkEFA8MBxQkKgfKV5yW6S7XrPjQXJt3Ae61nYB4H3A82sH1HfcX5XuAPlrXII=
X-Received: by 2002:a63:1749:: with SMTP id 9mr28204672pgx.94.1553611087975;
 Tue, 26 Mar 2019 07:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <75d8c71fe0684d6ebc3710bada61b79f@quantatw.com>
 <CAO=notwZHO5St-L_Ke=fADi3nd-XJoSeGvYHpqymAG85-pPP-Q@mail.gmail.com>
In-Reply-To: <CAO=notwZHO5St-L_Ke=fADi3nd-XJoSeGvYHpqymAG85-pPP-Q@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 26 Mar 2019 07:37:57 -0700
Message-ID: <CAO=noty8onotnY_dE377Sy0C--+f=9SwKgOJ0FK7vG5S7aU-Ag@mail.gmail.com>
Subject: Re: [phosphor-pid-control] discuss the code in /pid/buildjson.cpp
To: =?UTF-8?B?SGFuayBMaW91ICjlionmmYnnv7Ap?= <Hank.Liou@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 26 Mar 2019 14:38:12 -0000

On Tue, Mar 26, 2019 at 7:00 AM Patrick Venture <venture@google.com> wrote:
>
> On Tue, Mar 26, 2019 at 5:54 AM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <=
Hank.Liou@quantatw.com> wrote:
> >
> > Hi all,
> >
> > Sorry for insufficient info about my question.
> >
> > I am reading the source code of /pid/buildjson.cpp in phosphor-pid-cont=
rol.
> >
> >
> > Is there an error in line 59 and 69? To be precise, I think j should be=
 p since only p has elements positiveHysteresis and negativeHysteresis.
>
> Looks like it.  I'll submit a patchset.

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-pid-control/+/19647

>
> >
> > Sincerely,
> >
> > Hank Liou
> > Quanta Computer Inc.
