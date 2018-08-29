Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RcPhoUDA"; 
 dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420sN06WnnzF322
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 03:01:19 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id d19-v6so2599742pgv.1
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Sy1d7c5vl0RIE20nmKitfVxw3/mI53zGayMBF52cfcI=;
 b=RcPhoUDAFEYAIIVMh0IrKkye7RlsqXdmEHkrxQJ7NZQtl75XC+t/crrq63KuSFwb4i
 Di2bKuf05AZpwB43KFHr58xmMMHFvySt9q8PqnEzmNcezlVskaWDvZ7fkk2dnPu/0ANd
 hmFd+ZT/y0rsljN3+603qsMPQg6i5p3L27viScs+0oXlFHJ3kJADXkkgLlG3JBUrmNu7
 GEwfad5XKXUWNw/C/8FuYy0MYicWO/rl5AEmebvs9orthxgFUrRfg+8zHUMOFUbsD1yw
 I6KWqeEkMrkv00cm5sIyigvTpBmCk1+es2bTi0KlThCyFmms78XCyAcbmraWFiAPr8Fc
 wTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Sy1d7c5vl0RIE20nmKitfVxw3/mI53zGayMBF52cfcI=;
 b=E5oELXYiynqPc+4lPVk0r3pJ6VNEU9bQ9y5KcFwY1fabf3HbKr2O9Ex5mQgJR27WwC
 wt4cVCcuNeypRy/COPeQi8IQw+JlzPrFeBGox8d5V92lq6UQXyMMvz/D/5tpD875WpGl
 bFg3iNggk78QaqYglfAtGDH0s1XggsslIFZYAGGwHXmp2nUvADGgqrenfMp1xvmZUT8I
 zZSlRbtIJRyIG2JLNkgIpP3NJremHVKqwG3K6OeIH6lXqEdJxY4gluttcTQaJpvfuq90
 I878o6yOxajZO2Rir1MmLqGzL8jKoWZbXbpoDzJDkA01qxHxUr8hKgjCy07aNFM0GUkG
 qWuw==
X-Gm-Message-State: APzg51Dmo1oLI5SzTGOduipXNpmKmwzfpkl57Q73edB+wi65/FCOHbUQ
 CgwqKkTWj9BAyJ7G2R3tA0N/+tC+Hw3kt8w71+S4D+BdAdY=
X-Google-Smtp-Source: ANB0VdZ9qjdX9+28o4CR83NLmDwu01Wj8G54YQl3cN8xNrfYxEffKsUBmhUTnkC2KKelAlM+ze/aR2EyEbSVit3+2io=
X-Received: by 2002:a63:a309:: with SMTP id s9-v6mr6271687pge.90.1535562077553; 
 Wed, 29 Aug 2018 10:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxjhD7u8Gfa-D5zdJysuqzFMNqQM4fsfa3RmN5geudgrw@mail.gmail.com>
 <0DEA9298-A196-44BC-AEDA-A72BCCE93D77@fuzziesquirrel.com>
In-Reply-To: <0DEA9298-A196-44BC-AEDA-A72BCCE93D77@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 29 Aug 2018 10:01:06 -0700
Message-ID: <CAO=notxhB1dGiUwO0GiYQvJ0kxXu59C0hdc+MaFtittB58dwew@mail.gmail.com>
Subject: Re: Single-Source
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 29 Aug 2018 17:01:22 -0000

On Wed, Aug 29, 2018 at 9:55 AM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
>
>
> > On Aug 29, 2018, at 11:53 AM, Patrick Venture <venture@google.com> wrot=
e:
> >
> > Brad;
> >
> > While working on updating the documentation, which holds a
> > clang-format example in it, within the markdown, I was curious if
> > there was a single-source of truth w.r.t configurations of this
> > nature?  I imagine it hasn't been an issue yet, but I'm going to
> > update clang-format files to use the header inclusion, once we settle
> > on the exact pattern, and it'd be useful to have a single-source file
> > where I could make the change, and copy that file out into places --
> > since I'm not sure of a reasonable automated approach.
> >
> > Any suggestions or thoughts would be appreciated.
>
> Honestly I don=E2=80=99t think we should be telling maintainers how to st=
yle
> the code they maintain.  Just that they have one and and provide a way
> for contributors to adhere to it.

I'm 50/50 on that one.  I think if you have a standard against which
all the code in a project follows, it's easier to work with -- the
sort of classic answer.  If we say, maintainers can do what they want
as long as contributors can adhere to it, then what's to say they
should follow the openbmc style?  I am sure most engineers have
differences with the openbmc style, so if they all end up with their
own variations of clang-format -- at least it's automated, but it's
still different to read every repo.  Of course, the clang-format
doesn't do variables names (right?), the style guide still dictates
that... I don't know, it seems like if everything under openbmc/ has
the same style it has increased coherency.

>
> But I think I am in the minority with that viewpoint so I guess you
> could put a clang-format in the docs repo?  Does that work?

That would work for me, so I can just copy that into my repo(s).

>
>
> >
> > Patrick
