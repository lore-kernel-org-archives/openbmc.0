Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::242; helo=mail-oi1-x242.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="siXTSpgS"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vfPv10M3zF3Jx
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 07:30:10 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id a202-v6so3443417oib.1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 12:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=62Kb1NKVM7/A1S0DnqESmLir8HVfpkhhb5cY2z2wzX0=;
 b=siXTSpgSLPfATuKDorlxrNVgLM5Nn3ItNs1ULnL5UPMmgWLPiIWDLRM9QvY98EXqRk
 YGaiVXd2IWKPDA1I0YoWAOOaL++LnIcT7XILr/T/5nSlOYB8Ko/sXKQLQkLZdj8rYJae
 OeE/gasCut5JaOCKv2fIxoYEQQDhhWFhGa2YWKDlVTDCiNslVW6pRExSE3/pt9YlIyvd
 eoYD8tybzPI8Firs9jZKUjdF0lagoGHU/lD9jmVUFLIRYaEe50ZkObH3KVrB3sA+yveN
 hEDmc8te6ZVhH6b+FM/EnKq+x6Tb5UPQ5LHFt3o0QEDmKzimIKGYraOzyks9yiyv0rtg
 9lNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=62Kb1NKVM7/A1S0DnqESmLir8HVfpkhhb5cY2z2wzX0=;
 b=ANMJyGN00SR16KELlDmdtl0OGyivzy1TtxVTgUoGyJpkeecyIID4tme07mVNqKpBlT
 VgtBE5ruBM0OtgZN+z89hesEmRHCP0nB0CtxOy3HdsHo3jXKDTRNbutA4/XHP1dRLO3s
 WEezoygcjQxU4ks4dkCb/24l0ezjLU8hEczOq+nMU2exDY86qPXiIYbyYnnCVwMCiR5i
 PXboiy0+dTUTSDyyHp7qzWad7wN+ZIDDH2PLBSWHnTR2K5Dh6CGKMxBusH0YE2ISLYsi
 6vgaGOS5G1PhDOaA4X08935OXsqGtnF5BOXZeKkauwXEYTr2l5wYQPYgjSDJX5KBMmYO
 G5Hw==
X-Gm-Message-State: AGRZ1gJqssfjrjutc1bFX1uis9pPV3iNfGszbCILwXF7BYxvRW+ZXdZn
 5pAAPji4IuqRVqIxF15Cj7OgA/A9QxSmKk2TWH8=
X-Google-Smtp-Source: AJdET5eMVarc5byrKLU8na6eG3ZkA0uZVTArtKaWk3mKwm9AR/BsmIBoWUDc9z5MJSiCusi+23ATmrEiCIdXwlVK4NE=
X-Received: by 2002:aca:2ed3:: with SMTP id
 u202-v6mr4051921oiu.93.1542141008048; 
 Tue, 13 Nov 2018 12:30:08 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8XfRxu-4DubF4SAsAzX0y4dkpF23MYq9ynS+VT8ufPMMoA@mail.gmail.com>
In-Reply-To: <CACPK8XfRxu-4DubF4SAsAzX0y4dkpF23MYq9ynS+VT8ufPMMoA@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 13 Nov 2018 14:29:51 -0600
Message-ID: <CALLMt=pwnn=4_qbZM_Ph=GNUZw2tnmC5p2kcJ9EvAuwD47W2xA@mail.gmail.com>
Subject: Re: Disabling ppc64le hosts for Qemu tests
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, clg@kaod.org, 
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Tue, 13 Nov 2018 20:30:12 -0000

On Mon, Nov 12, 2018 at 11:08 PM Joel Stanley <joel@jms.id.au> wrote:
>
> Hello Andrew,
>
> I've been trying to get to the bottom of the slow-booting qemu issue
> for a few weeks now. We commited a fix that resolve the issue on x86
> hosts, but when running the same Qemu build on ppc64le it still has
> the "go slow" behaviour.
>
>  https://github.com/openbmc/qemu/issues/14
>
> I propose we run the Romulus Qemu boot test on x86-only build slaves
> while we work this out. That will allow us to unblock the kernel
> security bumps, which have been pending for a few weeks.

Unfortunately there's no way that I can find in the jenkins multi-configuration
matrix plugin to specify which part of an axis goes to which slave node.

The flow right now is that whichever node gets assigned to build the
image, is then used to run the QEMU job (so no transfers of
images have to occur). The assignment of which node builds
which config is random so builder4 (our ppc64le) node gets Romulus
about 25% of the time.

Removing builder4 from the build queue would work, but would
also remove 25% of our build capacity.

>
> I'll continue working on fixing Qemu in the future, but I don't have
> time for the next two weeks due to some higher priority work.

This feels like one of those things that's always tough to come back
to once you let a workaround in. Is there a specific kernel commit
you've bisected down to that we could just pull from the openbmc/linux
tree? Is there a workaround we could put in our openbmc/qemu for
now? I'd prefer both of these over just disabling ppc64le.

>
> Cheers,
>
> Joel
