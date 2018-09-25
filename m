Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ntha56DH"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42KNcP2GbZzDr8p
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 00:24:20 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id i12-v6so24650286otl.1
 for <openbmc@lists.ozlabs.org>; Tue, 25 Sep 2018 07:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fKybQOvhGmFJgO1cLxa7MRXlTuWviTfLaeQB1dKtJ6k=;
 b=Ntha56DHZzFWJQjzcwcfwcBh7TZnljb+l6btKeweHTzD+8JtZf/atOvmTHk2CqZQQO
 GTIiQoblAUww5DtikImMg+b2oinIgk1mus6NT2rN2MWEVcnBnx0qJuX/14s9b/Kkcw74
 smvOsUJ9Dj9Y9eCd2BApwQQUohvteADlrWhNKTwW8rMRrlP7xCHKPyhgYQ7eSAmyXyiz
 30Xenr2O2p45eUn0Gl6tZ/5BlPTZPExa/5AiJiRVdy+v+nS7NisBdEPTcXAPkvsjo7NV
 hU8twVVksUK+acoUxa0cpYtfZ6dXwd8vpgVdOzhu79tLkVsC2jmMypEL7Cdf6bU0NbSI
 PQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fKybQOvhGmFJgO1cLxa7MRXlTuWviTfLaeQB1dKtJ6k=;
 b=eue0qXcI6acsVL1NM+N4GdZ5z4/iSf0OMamUn9sd6ajk4y+81uEmjUU54UMDBkTaOU
 CNnWgp17iwLP+0JtfP8+jzEtShTEAa1U8A+6hj5BSos4/2nt4Wg6OIU1qm369T5kcg/T
 seLdxn4LSe+I+cTNdKnnE8E6hAF82AZ1vmP/ey+hx3eaSECU0weTHDVhNFiVZ3UEl9VM
 3Mrk9+9MhnAuLYFYk3fSwLiSrKzNgQ4oI8AKjKmE1hI/YHbOScjN2cxF4G0IJnrr+NQY
 GxmOQPOaohnaHeaZ/7XwflAxlmY5NZCAa0Cu7rKiLeB523ZgX5kcVKZkeK0sxODcNqMi
 VBFA==
X-Gm-Message-State: ABuFfohxizFe8gdbGdaHmh0rLRmRxRPiHTKI7SFr69BBMEWm4hQ2cvjc
 9QEKvFeRsiQF2vFnd74V3ufDlC4YNwW15s5vaus=
X-Google-Smtp-Source: ACcGV63vMV4nYVE+vl2D4A9HKA47fnsPg+W5arshvRcIMqFW6jVR8U50oUIYUdVpZwUZJVxSYT1czd0aMCjKE8LAmhY=
X-Received: by 2002:a9d:1422:: with SMTP id h31-v6mr894917oth.41.1537885458609; 
 Tue, 25 Sep 2018 07:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <E434E069-640B-40A5-A08D-6FF893B41182@fb.com>
 <CALLMt=p+dH3e-C2M8L9Zv43vTDw9rcd9MpfcqFXge2aTkzk6Hw@mail.gmail.com>
 <16FCAE4F-97EB-4D32-BB14-5C24578773A6@fb.com>
In-Reply-To: <16FCAE4F-97EB-4D32-BB14-5C24578773A6@fb.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 25 Sep 2018 09:24:07 -0500
Message-ID: <CALLMt=rEH2wBzB5RrHJTG93AgHJB-DaG7pJVs9_UNrktpoau1g@mail.gmail.com>
Subject: Re: OpenBMC Hackathon @ OpenPower Summit?
To: sdasari@fb.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Stewart Smith <stewart@linux.vnet.ibm.com>, 
 Joel Stanley <joel.stan@gmail.com>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Tue, 25 Sep 2018 14:24:22 -0000

On Tue, Sep 18, 2018 at 4:13 PM Sai Dasari <sdasari@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 9/18/18, 1:21 PM, "Andrew Geissler" <geissonator@gmail.com> w=
rote:
>
>
>     Hey Sai, looks like Stewart, Joel, Jeremy, and myself will all be att=
ending.
>
>     We're just building the agenda now but we were thinking some basic
>     overviews, then some kernel hacking, SDK/QEMU hacking (systemd,
>     journald, service intros), and some customization hacking (adding new
>     machine layer, customizing web UI for your system).  Any other
>     thoughts/ideas from the group appreciated.  The overall goal is to
>     teach people unfamiliar with openbmc how to dive in and start hacking
>     at it. The OpenBMC community hackathon will be at the Intel summit
>     middle of next month up in Oregon.
> Thanks Andrew! Overall goal is awesome and look forward to meet at summit=
!

Yeah, be great to see you there.

I've started the series of doc updates in
https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/12994

Feedback always welcome. The goal is to have small tutorials that
people can follow to get up
and going with OpenBMC development.  We'll be walking through these
with people at the upcoming summit.

Future docs I'm thinking are:
- Adding a new systems (bitbake layer, kernel changes)
- Systemd phosphor service manipulation and usage
- Debugging
- Maybe taking someone through the process of a gerrit commit, don't
want to be redundant with our existing doc though

I'm trying to point to existing README and other docs as appropriate
to avoid redundancy.

Andrew

>
>
>
>
