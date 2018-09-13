Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fdEhpnbg"; 
 dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42B2Wj5sbCzF3SN
 for <openbmc@lists.ozlabs.org>; Fri, 14 Sep 2018 01:24:49 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id j26-v6so2818483pfi.10
 for <openbmc@lists.ozlabs.org>; Thu, 13 Sep 2018 08:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xHTW6K1lV8c4Y37Nit42pv8GX/gNAg4jStSCdcHewjo=;
 b=fdEhpnbgIyD3tBMpTNdvTcV3g6SzGzvLhGmGUhJXXe/Ru3JcUJnkSBQ/07XgcQ6QrA
 +3j1ePbmECLJcaT3wsZYbHV9+hq0KLQ+bVdC7V8IukZor07u7groSpLaoTq3f1AHDJ3C
 J5/zzaMma7bR6FsHOlt9Qdm0zX3KRHX1Hnks5lM31EMr7MY7sdGst40DSyCzwe+MNMre
 4CypQFZQ2R0NM4O82DVhTwExoA/f+crq49EcaK+lqNA+/sxZX36CqidpQUK9jf4Sra4l
 Q6ReRdWjl19S2O7pWxCHDYjXZpaCqjU3NshfaJNJ2VHlQKjIK6xltUY6hAyhy4hJMhcO
 897Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xHTW6K1lV8c4Y37Nit42pv8GX/gNAg4jStSCdcHewjo=;
 b=J11GYFhwpxGpt+YZQM21NhLL2XDXM7C8HFH//2J3alYnyQXZ6U56ORFD1RFXpVw1Ms
 vZCGSaa1NxoiKyRPOhfwMR3fL/1xj4npnt/DgSo4gL93EBovTeO4fTUEy4xTs8w76R9a
 ISJDz12xm4DV2446oEobOjFFlvU2aiwa23ucRHL74sxv1dlKXsxKEQnlbd/jXZwF96Cc
 /6oHe/ug8rj++pkwJNJpjckCg6fjCrxvRYR5pPonLwywgk8fYaBE5+iGyAafgnc4MWdM
 1hAQl7gyYPzBpeodaV60EhOwfATFTpDehX4qE9+OGCOKZWCAMtkkEb5iTzFOVPSobInp
 CBuQ==
X-Gm-Message-State: APzg51A+179ANGv+T1ZgUMB1QsTx1WyXjLvgdygMfBTQzGEpqVOvrJxM
 zA7GBsxdVgZyB/4xEC9Q3q20U3sJrr89W74b7bDDug==
X-Google-Smtp-Source: ANB0VdboE7pjzSXZvi3YDA0xm/0DdAUo5WaPKRFLXScKt9vZH5DaUVSzf95h4AObsZXBtc4zkBE51zV9hmjPUfTZDE8=
X-Received: by 2002:a63:8543:: with SMTP id
 u64-v6mr7884507pgd.248.1536852286957; 
 Thu, 13 Sep 2018 08:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyNQDxqa_DZtfLJxO2NE04gqgpzZGi0Q_HHgCKkRDVSgw@mail.gmail.com>
 <6E182BAD-47B8-4290-8754-2DA4E843145F@fuzziesquirrel.com>
 <CAO=notwQBph4z+VW22-V_pLfweMTv5tptQ07RP6ZxjdeBVY=oQ@mail.gmail.com>
 <1D7055CE-4BE8-4F0C-BBE3-89ADF9693296@fuzziesquirrel.com>
In-Reply-To: <1D7055CE-4BE8-4F0C-BBE3-89ADF9693296@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 13 Sep 2018 08:24:35 -0700
Message-ID: <CAO=notxUmT_USU_xKJQ-ByY1btEd0TesVDb2cX0-W6ib=qAwnw@mail.gmail.com>
Subject: Re: New Library SOP
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 13 Sep 2018 15:24:51 -0000

On Thu, Sep 13, 2018 at 5:09 AM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
>
>
> > On Sep 12, 2018, at 3:51 PM, Patrick Venture <venture@google.com> wrote=
:
> >
> > On Wed, Sep 12, 2018 at 11:24 AM Brad Bishop
> > <bradleyb@fuzziesquirrel.com> wrote:
> >>
> >>
> >>
> >>> On Sep 11, 2018, at 8:41 PM, Patrick Venture <venture@google.com> wro=
te:
> >>>
> >>> Brad;
> >>>
> >>> William contributed two libraries by building them as a repo under hi=
s
> >>> personal work account first, and then presumably you mirrored from
> >>> them.  Is this the process you prefer?  I'm looking to do some
> >>> cleanup-by-library and wanted to take off in the right direction.
> >>
> >> I don=E2=80=99t think I have a preferred process.  The one you have de=
scribed should
> >> work fine.  Otherwise I can just create a new repo.  I suppose it is a=
 bit
> >> easier for people to leave feedback that way?
> >
> > I agree that by forcing it through at least one round of gerrit people
> > have a chance to weigh in, which is preferable in my opinion.  And
> > goes along with the notion of upstream-first, which has something I've
> > been trying to push.
>
> Ok.  So what should the name of the new repository be?  And what will the=
 content be?

Thanks.

I talked to wak@ and I'm holding off on creating a new library to
track whether pivoting to a different already-existing one is a better
plan -- it wasn't clear that they were a good match but they probably
are. :)

That said, for future reference, as I'm sure other libraries will pop-up ->

Patrick
