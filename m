Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="FJtF8IbF"; 
 dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VjjX2FtWzDrP4
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 05:46:07 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id f8-v6so2958165plb.2
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u9BIbaboxBZxVfQkFxANN7b8arx3AyNDj2VDI4yk/tY=;
 b=FJtF8IbFmCypW8V0sSDINSsru6BgSvxfrf0O03rFMwIoRB9Lh0r1jty2Ioo2OBDFTk
 Fv6xpSqONb0g/nQFC8lmcZW/T7WkM56rRuN+NWbbSbPCEhoemQB0rWTUpWpUid0xpK8I
 IaYgd9KMdU00Mzvulx1khJMykqbdNQox+FPuJ1J+Ii7aDr1tnEfGibCpa2Grv3sYJ/9W
 tOwxlFZt6eCWTFe4QCHpSrovRIxRzmwzxFGTs6iwA52JNAnLVP7Ye3Aop0m0h7SAlmE+
 JvTqtEJmvG9k63o0MBbEus+lTYlfCbm8fp9PPU2poIesRarun3F7HArY607ToN4wJ5Mv
 jmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u9BIbaboxBZxVfQkFxANN7b8arx3AyNDj2VDI4yk/tY=;
 b=RjRRlM85kYgXjC4LyrjsWQnqLy2gcFPiHrx4kpIWE4It9Pm9ztpPubnd9IsYINACYi
 ykFIfCMbkJBNZ+zYCzCFTtnev3Yo0S2ugko0eL43dJaSLi2tHuQoaQp75r6y+rlI0TYQ
 dwFyDUWPs8zFch/bXK9nk81WLbrejgN4qN+0/arr6b7YaVXjduHA2/CvGQPytepB8jgb
 l5o1TaQ/6YJs2NukjEuHhHS2STPYRDo1d3U0jLOyWQY74J/daCCSAOSoyU7m1pJ2aPRh
 DHFxlgLZjKHWxw5dS9mRsfQ7Nt2xOq0Inh+pNNU7KC0P9OJeVtySeWpLMT7k+jiVweoc
 VMOA==
X-Gm-Message-State: ABuFfohN2Q9fmrCfIqZ82i1ez65UMzdV+Ho5nEmQe3naWjs0hnsqJQbN
 bfUArJPeQRIIvVs2toc/mFks1N7Yc5jSJctufzm4rr3ib7M=
X-Google-Smtp-Source: ACcGV60kX1N9KE8yxUEva/B9qcvJYIdebFanooene0Gmbbz71ifjk/j2/QkwS3A0jHtNKs3yKBbvCKyBmdTqCNDwUqo=
X-Received: by 2002:a17:902:124:: with SMTP id
 33-v6mr34414504plb.205.1539197165243; 
 Wed, 10 Oct 2018 11:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyKtrecZeAypPcjY7qi6rBqj_cPwPosFRds=wYpeHW8wA@mail.gmail.com>
 <9dc677b3c95c2bc7e7c5a11a97df49a7@linux.vnet.ibm.com>
In-Reply-To: <9dc677b3c95c2bc7e7c5a11a97df49a7@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 10 Oct 2018 11:45:53 -0700
Message-ID: <CAO=notx9Sncg2w68Z=OTsMAWJtoyENc2KUZJfz-8vDCGhJ7afA@mail.gmail.com>
Subject: Re: Recipe Renames, etc
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 10 Oct 2018 18:46:09 -0000

On Wed, Oct 10, 2018 at 11:38 AM Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
>
> On 2018-10-02 10:28, Patrick Venture wrote:
> > I've sent a bunch of recipe renames, but I'm still updating each with
> > an individual tested footer.  I will try marking them all as WIP now
> >
> > Patrick
>
>
> Hi Patrick,
>
> I think you broke master with these.  For example, the phosphor-rest
> recipe - it has a default url-config.json, and then a layer specific file gets
> applied from the meta-ibm layer, like:
>
> meta-ibm/recipes-phosphor/interfaces/phosphor-rest/url_config.json
>
> However, from the log.do_unpack from the phosphor-rest build, it doesn't
> look there, it now only looks in phosphor-rest%.  So any override directory without
> a % isn't being found.

Interesting that the CI didn't catch the break since witherspoon is
one of the systems built via it.  But I'll take a look.

>
> I haven't looked to see what all is broken yet and in how many layers,
> at least our phosphor-rest and phosphor-gevent, which is why the web UI stopped
> working on witherspoon.  Not sure if any other systems are also having problems.
>
>
