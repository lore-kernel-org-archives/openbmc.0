Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3st4Dj1Vs1zDrbq
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 02:44:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=X7AdELWi; 
 dkim-atps=neutral
Received: by mail-it0-x235.google.com with SMTP id z65so74649693itc.0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 08:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Zoz2AxO8GGqjRNHt/3iJbZRx0F/c20iAauYcBaAlEOA=;
 b=X7AdELWiQxJJ6y5bZP7W2zs5Dl7Y0cpLywzY+xrpyckzBmQGG3/jdPAOBxUDf8NrBX
 b0SwKXWDHfLqgYYDvUZxZ69C6w4Y6HqoInJ6yIvTbHZo2wQVsHCmbh0B2F4OOrCA6bRk
 zjc52c/Bh4F/6aswF3zXENmeFx8e9oQz0+KlAB1CaZjVFU53ffcu3h+ROw1Lin3OtMTi
 aKJKnmoTL6VesETOG+eYWEk3eAWCXV70jStCmm+18pLVrar1bNopV+Z6pE1CgJ26LiAb
 frXWyXi2oKrG64zIfjU1cVPRDNTCVd7QYOAT42zZKCoqoG5PegIp63tM7vfbzCoszCiE
 lB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Zoz2AxO8GGqjRNHt/3iJbZRx0F/c20iAauYcBaAlEOA=;
 b=GG8ZP5gqhTadd3SHCx6YAA6MXr/ZbEFSftYlrZF065Gb85aA7kvGdCQcgRbuHZtbqq
 VUjHQ3XY1MyrXobCBALDF0KFVkCQWmynQDEl0IQ3d9zCjKg4msrSb9XO1E2O6Rr4IWDA
 JgUuV7ypJAc5seT3dteJnH/8lt9Eb3b4FnCDZq3SgiS47860k0y+C0ywnOvbP0QIpw4X
 2KVdteIxCMbvlD48Az+ScQOYm9NWAZHT1jvJd6NE8IGxtnvFpcVFI/WA3jHk1urhiXbn
 Fr/UaOREqd6EhdrSk16aTCBzarpRpDWKcr+T/oQHEja3+EOKgSUy8e3bM9WsDwpDTLTr
 7DNw==
X-Gm-Message-State: AA6/9RlHuWz+P6w4YcCuEh3W7aVfrv0o4Ri+HX6PsNxkxem3FNZ1bs/P36fg3u6kq0gzOk59Qsuk6gHMgsAFzQ==
X-Received: by 10.36.190.8 with SMTP id i8mr12068665itf.47.1476114257288; Mon,
 10 Oct 2016 08:44:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.148.194 with HTTP; Mon, 10 Oct 2016 08:44:16 -0700 (PDT)
In-Reply-To: <CACPK8XdQa5pptYRHop8iRapDG9NsG6kaHB-SuWOkNg=6Y7DGUg@mail.gmail.com>
References: <CALLMt=q+QdROYMq5i2+xTBtgyfBn0UW8xStRjZEntnc+CL-ivg@mail.gmail.com>
 <CACPK8XdQa5pptYRHop8iRapDG9NsG6kaHB-SuWOkNg=6Y7DGUg@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 10 Oct 2016 10:44:16 -0500
Message-ID: <CALLMt=pTARxnH4Kq=1QfSFXJ05v92q9oJhEeXkcQ0qSeGJ6GPw@mail.gmail.com>
Subject: Re: Adding firestone, garrison, and witherspoon to the CI job?
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Oct 2016 15:44:21 -0000

On Thu, Oct 6, 2016 at 6:49 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Fri, Oct 7, 2016 at 2:33 AM, Andrew Geissler <geissonator@gmail.com> wrote:
>> We've had a few recent regressions in building of firestone and
>> garrison.  Any time or space concerns with adding these plus
>> witherspoon to the gerrit CI job
>> (https://openpower.xyz/job/openbmc-build-gerrit-trigger-multi/)?
>
> I'd like to see Witherspoon being built :)
>
> I don't think Garrison will produce bootable images, as no one owns
> it. Doesn't hurt to keep it building though.
>
> The current disk space situation is:
>
> /dev/xvdb      1008G  567G  390G  60% /scratch
>
> Do you know how much disk space adding one more machine will cost us?

Each system takes 183MB of space.  So 3 more would add ~600MB per
build.  Seems ok, if you notice any issues we can knock the saved
builds from 15 to 10.  I'll get this going today.

>
> Cheers,
>
> Joel

Andrew
