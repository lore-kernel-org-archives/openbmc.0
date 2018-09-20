Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CIz2d2BE"; 
 dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42GKqn336TzDrSJ
 for <openbmc@lists.ozlabs.org>; Fri, 21 Sep 2018 01:08:37 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id y18-v6so1274386pge.0
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 08:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xRP9LfIGTvHxBFeBG5VIjvBokCu6LY3thAAB35UUs1c=;
 b=CIz2d2BEd0IKF14uk1Y63Q7enYRKj3j7SMAgyesiKLiHbTyikU3dLvTDw8OyFYp6tp
 r7vmb68ABFqePeYHgtf+JLOGrhwljXIY8r5+goK26OeMYDnao+8CYso/PnKYuWSt2I+/
 Eat/13wS3yZDdlWKL6J40vY3wy3fZfT5u66S2t07+1err6beIOjPa4Gl8BEwWdcLFONx
 9+6dSvmjQ8VY4DUvrWL1W01rC1Nqqyy9W6zfxM0Awt85d21uvVh/xkQ9zd1M+YFG5dtz
 2lYGn1tAmfsK45Tn8vNJ+oWF9/gfSgwHus4xzu4dlEAqI/P5h8JC5wvNuNcj+MJ4cm+l
 qTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xRP9LfIGTvHxBFeBG5VIjvBokCu6LY3thAAB35UUs1c=;
 b=KppkpenDvlCOrF15VMe+iwxYAedJfSZVm+qOt0oy//qQ+biueerC3FrlmPLLhZAITA
 9tNGHQ0erARwvTNm7TZw+0keBlPFfGU08S0VYiQmcJutIX3NQLYe9SiQ9Y4qSLuECK+9
 zltEXEwepxFK7nkCWiysU/MUo8soogfV+2VSljaN0T4hRAZD9UsXcNEQ1vbCssjl9sMp
 JPFgeokLdXBlmzOxLe6CxFs/T9Q/ZUqJCFUrhr5Tc+lDyWmEeF0HgQSdugkC/uKklyc/
 QFlFmyBiixVgEF6MSuvS8u8dKuOVK+0nvejwVisrSFNTSOH8MyfC3h7JnkfLs47T8Ywe
 Z6Ag==
X-Gm-Message-State: APzg51C/mFJQHkhbyzMKUXYW7GjtE8PQ9aH8VMJMxM513Ohkv+ZuSy2p
 QVLY0uCeVCsLy3JrPGE6jVYp+f6zc2ZJKH571sKI5Q==
X-Google-Smtp-Source: ANB0Vdbj7dFR5vXd4U1JhR+pHif7ijW13jXcUc0++6Z64ZPRvYFYshKp8VD1Uyz9KHkkEeE47SyH5Uu6oif++cUwMrE=
X-Received: by 2002:a62:5a01:: with SMTP id o1-v6mr42178195pfb.0.1537456114138; 
 Thu, 20 Sep 2018 08:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzGm3D-ug6OdeFiFTv8RFpoSWRVMusFBSrELe8RHRa2ag@mail.gmail.com>
 <F6D94198-16AA-4744-A888-8243D2EADE2D@fuzziesquirrel.com>
In-Reply-To: <F6D94198-16AA-4744-A888-8243D2EADE2D@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 20 Sep 2018 08:08:22 -0700
Message-ID: <CAO=notw5VeBno=Rzd438UBKm6KxqfP2VDNdn+86dhObUnN4DUA@mail.gmail.com>
Subject: Re: subtree patches
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
X-List-Received-Date: Thu, 20 Sep 2018 15:08:38 -0000

On Thu, Sep 20, 2018 at 5:58 AM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
>
>
> > On Sep 19, 2018, at 8:55 PM, Patrick Venture <venture@google.com> wrote=
:
> >
> > Brad;
> >
> > Did you want us to generate the patches
>
> I don=E2=80=99t think so - at the moment I think it would be a bit error =
prone
> to have multiple people generating these patches.
>
> > to openbmc/openbmc when we update a subtree or do you have an automated
> > process to pick up the changes?
>
> I don=E2=80=99t have an automated process either.  I _do_ have a process,=
 and
> on my todo list is:
>
> 1 - Document it (so others can do it when I=E2=80=99m not around)
> 2 - Automate it (so it takes less of my time to maintain)
>
> Is this satisfactory?

That's perfectly fine, I just wanted to make sure I wasn't dropping
the ball on generating the patches.  I assumed there would be some
script or something at some point, and I'm not surprised to hear
you're working on it.

Patrick
