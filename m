Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="m2WLsrSl"; 
 dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NypP567BzDqGP
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 03:15:57 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id w139so7659141oie.9
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vWAYYoLbI837iwjSYTTipC4l7ZAW1U7b8/bJuZVGPI8=;
 b=m2WLsrSlb2+rQHlEVM60MTX52DvvOGy+ShTAWi2KFYzBLbf5CQOEeReonX1TnZMyUQ
 NFh+96EMwSTXGcHT9u0RjKEu0jKOy7xZK34H1vQrK4MVUj7Beop6DvFXsXa3rliHC8Tq
 YEZvO+9OVwbLBT2luO0aUWLWXO6EDSJuHHn0sKI3rBMXPNqHsRAkmciShXxt1fuqInUs
 EvB+sqXUPaDvqnGhZbJECffmnkhEMiU2L3o0OmKOASbh8LBjYxT9kRFYXHzhaG8vtoPP
 ewT7W89mDpUbX2Ekw+NPc1zWFEZYztWiJOijDBAGQF/vB33d5w2ozadL5ULN/AFaKGFE
 FMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vWAYYoLbI837iwjSYTTipC4l7ZAW1U7b8/bJuZVGPI8=;
 b=NLJbE7cj6PFo1gX3BOMPLWVXugtjD3QQAAq8NclOBVl40RBetAbHx/UxxiBhTLTZnI
 +MYXn/Pii+ixhn6B+7DdlQqfKteh3M5ElPwdATPaQTCtFtJJy8J6rbxO3fj1IJNJ6O3R
 PeMmZ43pT/kA9hZ9B9O3dKNbqOO2p9EGT2lmFu/s+SHM6G9sSUk9J9ddYd1A0FTzZxU/
 YOwwzSquyJiJ6g2nGi8KCImfx1WN/4k7wx4LUf+LMeGC02M5llWNaRH4uYw+9olPGxDp
 3QPWhy5BigSsrxN2UtVMW23XE6xs57oLxvEdjSPotaI8dFzkM9mpvq1DgzyjEEpHyDsu
 8t8Q==
X-Gm-Message-State: APjAAAXdALtvUICf9Oo1rlxzel4h+32J03jsriX92sElyNIiLlyBjWGU
 zRFkHARa4yAmH4ZC+Vzz0jWVSWVj7wFUwPUsdFM=
X-Google-Smtp-Source: APXvYqwqmq6VChxDdFqAzXNIkeV9KQ/gOvpfeah+JEbQ9bpuZkjGr9rphV88/oRWCE+F56hgVwpV6XGfIN9xilaa+DU=
X-Received: by 2002:aca:c002:: with SMTP id q2mr1835751oif.145.1553012153854; 
 Tue, 19 Mar 2019 09:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=rz5Mvohzhavhm+D3Q8g=EZGVyubi+rsMZ3CFV_PHUfPg@mail.gmail.com>
 <CAARXrtmFGBc1dLHSuFY71E=J2RwepmG0Ko=qFTBHT5W0Gv23sQ@mail.gmail.com>
 <CALLMt=q6LDSGK=BhV4R66uSUj3UkMjB1J1gSf1GLbpFcj8G1zQ@mail.gmail.com>
In-Reply-To: <CALLMt=q6LDSGK=BhV4R66uSUj3UkMjB1J1gSf1GLbpFcj8G1zQ@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 19 Mar 2019 11:15:37 -0500
Message-ID: <CALLMt=r+AmvwWY-U+PDGQDQ7mrEEX1p=vyhpa7MbBDQY4kcs6A@mail.gmail.com>
Subject: Re: New Gerrit Upgrade Coming - 2.16.6
To: Lei YU <mine260309@gmail.com>
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
X-List-Received-Date: Tue, 19 Mar 2019 16:15:59 -0000

On Mon, Mar 18, 2019 at 10:26 AM Andrew Geissler <geissonator@gmail.com> wrote:
>
> On Mon, Mar 11, 2019 at 8:59 PM Lei YU <mine260309@gmail.com> wrote:
> >
> > > Gerrit 2.16 has moved to the new polygerrit based view by default. It
> > > has some neat new features, although does take a little time to get used
> > > to.
> >
> > It looks modern, and has better notification, that when I login to the new
> > gerrit, it gives me below message.
> >
> >    You have draft comments on closed changes. (view all)
> >
> > It helps me to find that I have some comments drafted, but forgot to send.
> > This is really good!
>
> Thanks for taking a look Lei. My plan is to do the upgrade tomorrow morning,
> 3/19, 7-9am US Central time.

It was not without a bit of pain but the gerrit server is back up and running
with 2.16.7. If you happened to push some code up when I thought all
was good between 8:45am to 9:45 CT, then I'm sorry. In order to get
the new gerrit groups working we created for CI authentication I had to roll
back to the gerrit data I had when I started the upgrade. The simplest
solution seems to be to just make a misc update to your patch and
push it up again to get a new commit id.

>
> Andrew
