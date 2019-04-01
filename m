Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TZTEvJ/S"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Y3vN1g6YzDqCt
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 07:33:19 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id e24so5127808pfi.12
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=brXnhZ35DOxe8YvRls1wcuCx+Ht1aMZM4JnVt1oR5cg=;
 b=TZTEvJ/SePE5ZxZt+fPiF/0HZWR8TdH8K4Ktst/AWOpD5K80qv1WHO9UMvv2x0UIfg
 AirZF9v6fwrpUDsm23e8Jr/QasB09G0Rb/s1iU+SzD0N8n032ldwstIlBGYiichuTzH0
 pUKX0bosZ5fA2WKyC4yQ8Xj6h0aalL+/9zMtC/roWCm6XMw8ZEOgyIiArT8ZZhIp/GIx
 dtZqhYRuKZ5Wi1UZDB4j3RTFMKNZOjJ/5kftkrMlTygI1Aa3F2rmq+PzigwcStTwP7nt
 00pB7JopMNun7KnU9UCcrqgOKQYi9OPBqE5YCI57YXxZcLpcjGbnB5KonbHI4hClUTNL
 kypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=brXnhZ35DOxe8YvRls1wcuCx+Ht1aMZM4JnVt1oR5cg=;
 b=K1RPyUPDe4MlOmWOsR8mZhiFTNZu3FZbugJ61I2HIpIBMY34rXQgQIWABtuK5ZEVNJ
 wLcu/PILlCOuPAe91ZrcNzgO32XG5e4mDV01jD0qSPetiyOYuaOh0lqGKpM0EZp7i7ht
 SxfSkUCCsQwXbSfvy9QihHlK5SGxU8TreTnoUpqhq6GvT1h4KKoarBxtlbUaVtqXdygW
 c+HHr8nJB/uxBk9qWz/CEAxz/XqocoQsUoQGbL9d37AQDSRcMgTAq8DuXOb0WU4FCGnh
 wSlljiSIQiE6xgVdzqbW37XrLZpEAApb0LmPaVzyYjM0QW64N/jy1TYhWxDvDTmsk9WN
 jNVw==
X-Gm-Message-State: APjAAAU6E398MHixFc+7nvOD3iQ2k4/IQ9NugnajZ6RmmfJ9TcmtLurw
 pzxgWyel5oqMdKZyUYG9KQgvaUOjCXy1njtP8JCjQw==
X-Google-Smtp-Source: APXvYqyjp3iI3rlq6/uUr1ebF/7+1PySzXs665IYzLV9GYONBpuIs5KuCAjEBiCvFO0MwETmcY7F4B5Tuq+Y0QiV9N0=
X-Received: by 2002:a63:4101:: with SMTP id o1mr10285568pga.17.1554150795755; 
 Mon, 01 Apr 2019 13:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyEKDUdTWOzJRGiGD_gFycTJbSW=GzF=YCbUW4XJswtpQ@mail.gmail.com>
 <CAPnigKkYDQOyPPotS9d_TbtWXB99-bueODsW_an0SZ-FRPiJRQ@mail.gmail.com>
 <20190401201435.2v3ng5vwazwh2efi@thinkpad>
In-Reply-To: <20190401201435.2v3ng5vwazwh2efi@thinkpad>
From: Patrick Venture <venture@google.com>
Date: Mon, 1 Apr 2019 13:33:04 -0700
Message-ID: <CAO=notxLNUDYXB-mhpjs-GU4nU5PD6y-F_-0GtFYjnjfcHy6UA@mail.gmail.com>
Subject: Re: wantedby target
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: William Kennington <wak@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Andrew Geissler <geissonator@gmail.com>
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
X-List-Received-Date: Mon, 01 Apr 2019 20:33:21 -0000

On Mon, Apr 1, 2019 at 1:13 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Mon, Apr 01, 2019 at 12:04:09PM -0700, William Kennington wrote:
> >It's still unclear to me why we even have obmc-standby.target instead
> >of just using multi-user.target.
>
> This is my fault.  It only exists because in the early days (early
> 2016?) I thought it might be useful to quarantine OpenBMC applications
> in their own target.

It's not a bad argument, IMHO.  It's makes sense because it's a way of
grouping them and starting them after some point.  That said, we've
all looked back every few years and revisited decisions.

>
> There weren't any requirements driving that and in all this time noone
> has commented on its facility so I support doing the normal thing and
> just putting all our units in multi-user.
>
> >I think it has something to do with host power on / off on ibm machines
> >and how they pick which services to start.
> Andrew, do we rely on this somewhere?  I hope not...

If the answer here is that we don't -- when I start staging the
service file patches, I'll move them all towards multi-user.target.

>
> >We almost certainly don't want to be using the basic.target as that is
> >reserved for core system services and ordered Before all targets.
> Agreed.
>
> >
> >On Mon, Apr 1, 2019 at 8:20 AM Patrick Venture <venture@google.com> wrote:
> >>
> >> When moving service files to the repo there is a choice.  To hard-code
> >> the wanted by information in the service file, or providing a variable
> >> for it that can be set via configuration (via the recipe).
> >>
> >> There's the default which is obmc-standby.target, there's the more
> >> popular multi-user.target and basic.target -- I was curious if there
> >> was a consensus or a best practice here?
> >>
> >> Thanks,
> >> Patrick
