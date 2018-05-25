Return-Path: <james.mihm@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4002:c09::22c; helo=mail-yb0-x22c.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JnyXYE2v"; 
 dkim-atps=neutral
Received: from mail-yb0-x22c.google.com (mail-yb0-x22c.google.com
 [IPv6:2607:f8b0:4002:c09::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40sTx702yqzF1Rw
 for <openbmc@lists.ozlabs.org>; Fri, 25 May 2018 12:00:41 +1000 (AEST)
Received: by mail-yb0-x22c.google.com with SMTP id i1-v6so1331336ybe.1
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 19:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=waNEpsjc8MgCDZ8+/y34k5OZMKwXPxoKjHkGFiFD+bA=;
 b=JnyXYE2vRqtxkMxU4dPb5Ku8oznoZUdRf3nc5f3kFKVj1fZP8tKdsk8z/K7jq5HPvJ
 8hGz0ZKVJXinknQKrP97Gbd4zFqRPlZetXK0iJ47Xr/1n6HPUi/JdbJa+kH+at+6/NtC
 hgOCC2egty/NWBfYlr1dXSeqbNSypXNaweJcGmaxlWGdfnJnPWc925zWRDWlpZq36WR1
 Kg+J5q5rPyK/R7KUwMXYpPpDo46cMuc+P6pRuHOsKYAlgKCHlWI5LLeGaP/Pp8iWDU9H
 eF3d+lda+67SzXgjICpN4wqzS+9IVy5+cm7yzLqiFHn39Cp/X5HvcxTj1ez3Q1/vIwF+
 hx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=waNEpsjc8MgCDZ8+/y34k5OZMKwXPxoKjHkGFiFD+bA=;
 b=UZfjdXQbJXYgInpWaCI1M7iYoolUDr4XlLf787lAyVM1lPB6OPw5coRKlshhgEjrIJ
 bpY0HImRpWQb3xZwprCfkB0G1jIe60hhG/vzIA0tJBq4L5q9MZBRP99pMGq0c+QPWOqO
 hduOsND7Ckqe6jNj1UJWQz8pJWLp5robZssO/JoFIM8pdVgRNz97Fs9beHnaCdH9X382
 4Solo6/tJT8iXvH/6AWc+tfzsGp+J+j640HaNNNdnHK+WKdKMTSafBXh3S0G+UHSg4SH
 TAzC0ZVtd+5fVYwwNuLIgDxPkNqvhTpM9HARuV6+NEfyW+0+mTda8dzUmIGMTM6CeVLs
 pPzg==
X-Gm-Message-State: ALKqPwdxKe98KqG7zPtkhY3NIA/FaOJWvdYc4VV/OE8/eSYGUo6EnhwX
 szj63mwZfMOd7cUntRq5tIQrWNrcdBEdWSLMFNI=
X-Google-Smtp-Source: AB8JxZqIXFCaYej8S6LmNTkS8C1bB0wuJubewr6ngGiuy7YM307guZodtzbFbZ+pTm95Ys4rL7w2oXjc5cfjQ8jZ8J0=
X-Received: by 2002:a25:a023:: with SMTP id
 x32-v6mr216348ybh.441.1527213638033; 
 Thu, 24 May 2018 19:00:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:2d5a:0:0:0:0:0 with HTTP; Thu, 24 May 2018 18:59:57
 -0700 (PDT)
In-Reply-To: <571344FE-9386-4B1E-BCC6-39294C7DDC6B@fuzziesquirrel.com>
References: <f25e143f-dce7-3f6e-3d4e-72ce7fe51ee4@gmail.com>
 <571344FE-9386-4B1E-BCC6-39294C7DDC6B@fuzziesquirrel.com>
From: James Mihm <james.mihm@gmail.com>
Date: Thu, 24 May 2018 18:59:57 -0700
Message-ID: <CADy_Pt0w4N0yk95f7iuOP4-am8F_E+=HW0b8LnKYHSULy-=75w@mail.gmail.com>
Subject: Re: Proposal for OpenBMC releases
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: krtaylor <kurt.r.taylor@gmail.com>, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 25 May 2018 02:00:43 -0000

Releases every six months are a good cadence, and I'm in favor of
starting in November.

I like the idea of naming release such as Yocto. I find that names are
an easier mental map to projects and version.

I don't see the need for the *-next branches, but I'll defer to the
maintainers.

Project support for N (master) and N-1 is a good goal. Anything more
than N-1 should be a downstream product support responsibility.
Anything beyond N-1 will be a challenge for maintainers as time passes.

Milestones are a definite requirement. Having a setup time of 1-month
is a good target, but it should be flexible depending on the
situation.
Where security fixes should be a priority.


On Wed, May 23, 2018 at 4:22 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>> On May 21, 2018, at 1:07 PM, krtaylor <kurt.r.taylor@gmail.com> wrote:
>>
>> In order for us to facilitate all member companies in the OpenBMC work p=
lanning process, I believe it is important for the project to adopt a forma=
l release schedule. Release cycles allow member companies to plan on conten=
t being delivered, get a read on project priorities, and exchange design id=
eas on the best implementation. As with other projects, release dates would=
 be fixed in time. If a feature didn't make the release cutoff, then it shi=
ps in the next release. This really helps drive prioritization of new funct=
ionality.
>>
>> As Brad commented in the community call today, let's start off the propo=
sal with aligning with the Yocto project releases plus some time for projec=
t testing/hardening. Yocto releases are every 6 months, around May-October[=
1], so if we allow for a month of freeze and testing, that would be OpenBMC=
 releases every June-November. Since June is next month, I'd propose that w=
e start planning now for the November release.
>>
>> OpenBMC release ? November 2018
>>
>> Questions:
>> How do we number releases? do we want to code name them?
>
> I would suggest/vote-for adopting Yocto/Poky/OE conventions here=E2=80=A6
> so 2.3 -> pyro, 2.4 -> rocko, etc.
>
>> Do we want a stable branch/working branch organization?
>
> I would think so.  Again I'd suggest/propose something similar to
> Yocto/Poky/OE:
>
> master
> master-next
> rocko
> rocko-next
> pyro
> pyro-next
>
> Perhaps we could skip the -next branches.
>
>> How long does the project maintain a stable branch? n-1? n-2?
>
> I=E2=80=99m not sure.  My gut reaction was, as many as the community is w=
illing
> to write patches against, test, and maintain.
>
> Do you consider N to be master (dev branch) or the most recent release?
> If the latter=E2=80=A6I=E2=80=99d be happy to start with supporting just =
N.  We can
> see about N-1, N-2 once we get a taste of supporting something other
> than just master.
>
>> Do we want project milestones for content proposal, code freeze and rele=
ase?
>
> Most definitely, IMO.
>
>>
>> [1] https://wiki.yoctoproject.org/wiki/Releases
>>
>> Kurt Taylor (krtaylor)
