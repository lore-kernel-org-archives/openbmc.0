Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZdhN88nL"; 
 dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44q57M3GxgzDq9p
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 02:17:18 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9so3603721pls.8
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 09:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kL64yzXr/fE5CPI2JIrU/NdIO52UE46unU4uYRbLW84=;
 b=ZdhN88nLBItg1lNYt+meROuz5MqoyKQekSwCL7ZrWgzgBS7+SvQwqsu4xAc1tlBzoF
 UnWlFPVR8HmMB81H3pV3A+6Aa9DNhm5o+zQewENu+tmKhbPK8BzJw4iTVykVEiQS12W7
 4NmrLDw+HzMFjl0poLetDTQ6YrJKH2cHAGeyNJa8l/tW9pRFARn7t7bJ8mNIQVfty9L4
 RHqABwSpf4BEk4umvz2Kf9c3/TNV9HfBxjmVgR++OnebcfqEiAofw4lvHu0IPm/SU7hl
 vZKFusCS8HPzFoAKN9l3ZSOr6XLRJkXwCcjr2Jx3McIkRkmgyiEQmyPS393hxyaqQonc
 z2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kL64yzXr/fE5CPI2JIrU/NdIO52UE46unU4uYRbLW84=;
 b=uKK6Bgb3yQ8vtr2uYzQjgGa4OjCiGqWePT2kcsxRUFAenBR2AEuwq/Y2YnHa1tV4uh
 edcCjx1z4CAE12hg/X6jEDz5U/xAdWLOQ2bygAI76AKZB+ZNv+ybwlj87cpdgnKiSL/l
 c5Nop8bWSLK1p9CNxuOQviz8D1UB5YE0lg1/zaJWYwYyFiJ6l+3+UARa+6Ey6r8kZsz4
 IcIG89A9Sj3WwLdrcg6Kj6EP2h8gq79FHQTJlVlPVG2miC5gz6nsyDtaJXCd4Z3lBbf6
 u3bMuFGHd74ATBMz6/BazTwAMEpKX16lvJQrlu663t9OR0iA1wknBDWwVlibycXOvF/x
 O5Mg==
X-Gm-Message-State: APjAAAVz8NXYkfFtb/iYqJHZEyGiRpa3gG0UWkY13dOe9sW31qfH00I8
 yaSlSkdFvD5sEz88JyBPBYg5yt0DonbbYuU8biowAEEU+Pk=
X-Google-Smtp-Source: APXvYqx6YtJZqBS+7jtKXIuprKl54V8ueCFr2QSPQwnFgOn5wILh41jufUNtLPGrsxHO93NBhhzpcFDltEh3WqoNGXU=
X-Received: by 2002:a17:902:e183:: with SMTP id
 cd3mr33595513plb.233.1556122634973; 
 Wed, 24 Apr 2019 09:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxPYxa8oxQXkSLKNhTy3mZV8TOWeYyX=8Cxecz8fpAQWg@mail.gmail.com>
 <20190424161127.bzi74nsp7kzotazm@thinkpad.dyn.fuzziesquirrel.com>
In-Reply-To: <20190424161127.bzi74nsp7kzotazm@thinkpad.dyn.fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 24 Apr 2019 09:17:03 -0700
Message-ID: <CAO=notyKXNNfbAMBudtS8LB2cu73wBV1ee7w+s9rXd2QVwiniw@mail.gmail.com>
Subject: Re: inarp package
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Wed, 24 Apr 2019 16:17:20 -0000

On Wed, Apr 24, 2019 at 9:10 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Sat, Apr 20, 2019 at 08:16:22AM -0700, Patrick Venture wrote:
> >The inarp packages isn't picked up currently by any meta layer and
> >doesn't build (it needs some gcc related updates missed by its
> >non-inclusion).  Brad, I see you're the maintainer, should we archive
> >this package or bring it up to date?
> >
> >Patrick
>
> Hi Patrick
>
> Thanks for noticing this.  I'm not the maintainer - what are you reading
> that indicates this?

Yeah, that was totally my flake. I just checked the last bit of
history.  I see there are actually maintainers.

>
> Now that you've pointed it out, Lets wait a couple months to see if
> anyone fixes the problems and if that doesn't happen I'll go ahead and
> archive the repository and we can remove the recipe.  Sound OK?

Sounds like a good plan.

>
> thx - brad
