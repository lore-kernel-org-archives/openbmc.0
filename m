Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KHYFwaLv"; 
 dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FmYY5rlQzF1QM
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 03:09:20 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id l63-v6so3044111pga.7
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 10:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sp+S3xflmFeYvhzI1vl64+T5SzJFy8Q2ryYUn9SzTRE=;
 b=KHYFwaLvJ6BSwfJseem3Pcw7pfIi+rP2I+uSiGcr5HuCAtgTW79tzNVOLVQXQQg3DB
 XnVQuGlHzT2W4zPYyCP3LJMmxOgEqVXeu3hq8fCOJYI1wNkNiQhZ7Lrts+Z1uE1+gE0w
 LlN76R+OfVitsmbrINotljtPudzJ7+nWgIknRZx3veYOtbPDgsgMAWnyDEmKzhU33Nhw
 OuS1n/JE18gM9H2ELZvjnfLySSoPxlPsX5Z6A0p+wFc9aRA0tcovqnTFO1IeJYYas4db
 Fa8DN1hKXck/zs7D0GII7SPAjnClROAkISr6rDr2H/9e11nGP2Amb9yTCANgmoK/XnC5
 UObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sp+S3xflmFeYvhzI1vl64+T5SzJFy8Q2ryYUn9SzTRE=;
 b=dwbnDk7dQnFv8vhU6YHTEY6w/Q4mXAp5oPO97kzc8IqXdMW4S99Ruofv3VF8KjnToP
 PPCkku2ItxTvHPxFTNthnA8mYxEUz1x+delJylUr8XgyxBK4yXsg53SI2oxUJHzvwPuK
 jC0YxxuSEXpl3GJav3QjZ0PE1S6bTF+XKz85rxNqA1qMWADtGe+5xO0yCVZsjLi0uEIi
 3INh6pzdP1gnpa4QwcZrV2qn6oDbBdDp2FjxrQFwY3lkzfDvvGt6qelMYwk+7HmISPzt
 ueT59U7RfLFKn34tryR09kSf+hiQ4aGk49lLM03qoiWiy7Fr88gIBCLbO2LKzxY8R0Wp
 B3UA==
X-Gm-Message-State: APzg51DIzAr83jeQU415TqfOBq0vwICCKUlrWzCT3rpoLRB0LcU3TXm0
 5F0drRBEi0TNppQolZmNkE85NlXBHGnhugoGo6feiw==
X-Google-Smtp-Source: ANB0VdYeuiMRJMjS7AnPMMHG4KHxUGRV0K+TJrCCuFfzEj3twnA7t2XyWB6JoUmRJshD7F7ArtolT3eFSF8rebnJWTw=
X-Received: by 2002:a62:9541:: with SMTP id
 p62-v6mr37566813pfd.194.1537376958935; 
 Wed, 19 Sep 2018 10:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxg=KimTVEuJXgR-iN9T5FiKcMA2TJD-E6pM_KVO9338g@mail.gmail.com>
 <5C90478E-E89A-428D-873F-3E4CCD5595D4@fuzziesquirrel.com>
 <CAO=notz2-wfv_kep5FhGP9T7rdQehvSqBSECvPywNis=uRXTKw@mail.gmail.com>
 <CALLMt=rthqi3e3vHNbNFkjyhBEp8P6P8KoYC0e4XrdKMhip1Hg@mail.gmail.com>
 <CAO=notxPfx-RufZXncqAX5LsdJCaQLirgxy-M+3hFPKYvrpTDw@mail.gmail.com>
 <CALLMt=o2y0TpXZCwjw--MiLJWo_5tg38i2K00Ety1AScO1M9Ew@mail.gmail.com>
 <ED9FEA73-985B-4898-8255-F60580024A82@fuzziesquirrel.com>
In-Reply-To: <ED9FEA73-985B-4898-8255-F60580024A82@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 19 Sep 2018 10:09:07 -0700
Message-ID: <CAO=notwdKFmckUgOCHdGWUsyAb3iSDd6aLoAg=PLULnFyFyJAA@mail.gmail.com>
Subject: Re: Link-up between Gerrit & Github
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 19 Sep 2018 17:09:23 -0000

On Wed, Sep 19, 2018 at 10:06 AM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
> > On Sep 19, 2018, at 1:00 PM, Andrew Geissler <geissonator@gmail.com> wrote:
> >
> > I did the restart and saw some of our new repos get synched up
> > (entity-manager, google-ipmi-sys, phosphor-ipmi-blobs) but nothing
> > from meta-x86.
> >
> > I'm not seeing much in gerrit for meta-x86?
> > https://gerrit.openbmc-project.xyz/#/q/project:openbmc/meta-x86
>
> meta-x86 seems to be in sync on 1d9260cede

Thanks!  I only mentioned meta-x86 since it had been out of sync.
