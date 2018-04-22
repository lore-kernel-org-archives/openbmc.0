Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::22a; helo=mail-ot0-x22a.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LUNhGqu7"; 
 dkim-atps=neutral
Received: from mail-ot0-x22a.google.com (mail-ot0-x22a.google.com
 [IPv6:2607:f8b0:4003:c0f::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40TLsW6JDkzF1Rl
 for <openbmc@lists.ozlabs.org>; Sun, 22 Apr 2018 17:32:47 +1000 (AEST)
Received: by mail-ot0-x22a.google.com with SMTP id p2-v6so13955587otf.3
 for <openbmc@lists.ozlabs.org>; Sun, 22 Apr 2018 00:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KiPS8+pfZoXoAdSO91gMEJIpLtlSECODajlPo5LoPAU=;
 b=LUNhGqu7d/ia7jgQmmVa5WpcCC0OwDJZ2uPmsi7M/diSY1FL3U5Fmj6eZNqSrQ6lc+
 vtT+2f4/0jEF5Msq89Jrqk6Yez8fH/0IF4AgaKI3JT0rTTiITm5uoYdkby5CnTn9zIEE
 CbcaaQ+e73UStkuWoqCE3xMhmPWBV3RtsVJT21OCJDXLl5e6n48hdthG3vfIQuXlGlz+
 X3//+Uw073CUQNOKaTSArTrO1yfWo0KpTJYzKTyw/dcKVCAWBy87pfLbsCxza26h8l1k
 Do7AABQ0JOHUEX/CiRBgJTYCV+5un5JA6ivQv5dMnF445z4W1c1K51aNyAcUNUjRk7cF
 8Kvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KiPS8+pfZoXoAdSO91gMEJIpLtlSECODajlPo5LoPAU=;
 b=KCGYE1ohrlG9J+2qtJXBjrSo9Mlx4ina2eR5/0gF+BNrn92vz9hQMjaosJLi4jRLl2
 X9QtvXDkGjL274yydnY5y6fHSCf6t6DCphkCDOigbAjfOXFCe+g/YsIh5H/449LxA14S
 U8AshPSb9mBOIK6DhWHW9w+XPdb+4Upirb5tVezclFF2cbBOnxtzvizNtAz5+kGRDIa6
 oIvVbmvvq5k0wMdYywT0Zjq0828TbS9h+Hly3ILdCzMxz0I7y34EIfYwwlJgFsc2q7MF
 +Q5efKhC06X2PTFQcYQDteQRUCUC72EYWVRSL1s86Jk8DEGa2Nm6YFDPNyDTTwVqTSFP
 nW5Q==
X-Gm-Message-State: ALQs6tD93DXeiadzR0E2XZbthw6tsD2dLHvoa7LED2Ww03T0PD2opW34
 8NGJwmfjIpSnPo90Moo9yKMK0glfUiSI3y00Zg==
X-Google-Smtp-Source: AB8JxZp1kz1NFXvWtOTFCteMBt8HpDgjul0tEGhibqqcnu5dQIZKxKJzEbwis2dvQf5r7Wzk+g/OPNqxFjCaq2hsIoU=
X-Received: by 2002:a9d:b75:: with SMTP id
 p50-v6mr1216585otd.277.1524382364388; 
 Sun, 22 Apr 2018 00:32:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:6146:0:0:0:0:0 with HTTP; Sun, 22 Apr 2018 00:32:44
 -0700 (PDT)
In-Reply-To: <1A67395A-9FF6-4DC2-AD43-2C80308F6608@fuzziesquirrel.com>
References: <1A67395A-9FF6-4DC2-AD43-2C80308F6608@fuzziesquirrel.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 22 Apr 2018 10:32:44 +0300
Message-ID: <CAKKbWA4hBmd3PC667q6YJnHLQ8Jp4i52frG109m0rDvKK3phZw@mail.gmail.com>
Subject: Re: reference platforms?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, uri.trichter@nuvoton.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sun, 22 Apr 2018 07:32:48 -0000

I am sending this on behalf of Uri Trichter, Nuvoton BMC project manager:

We suggest to consider a "manageability connector" on the Reference
Board such that every BMC SOC can test it's compatibility vs the
reference board functionality.
We understand, this doesn=E2=80=99t resolve the different HOST systems, but=
,
the focus of this group is BMC and therefore we see value in the
proposal.

In recent OCP summit,  a concept project called RunBMC presented this idea.
We analyzed RunBMC proposal and think that their functional signal
coverage is good, but the connector selected is less practical.
So, we are looking to define an SO-DIMM based edge connector that
contain similar++  functional signals in a usable form factor.

If OpenBMC form, will decide to go with a reference platform +
manageability connector on MB, we will make this specification
available for comments.

On Thu, Apr 12, 2018 at 8:40 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> I think in the not-too-distant-future we are going to need a concept of r=
eference
> platforms.
>
> openbmc/openbmc is essentially the same thing as Poky.  A super-repo
> of other upstream repos (bitbake, oe-core, etc=E2=80=A6).  Our upstream r=
epos
> just happen to be different things like poky, meta-virtualization, meta-p=
hosphor,
> meta-aspeed, etc.
>
> But the similarity ends when you look at the platforms supported.  Poky
> has a set of reference platforms.  Any other platforms or distros using
> Poky are not the Yocto projects concern - they are completely maintained
> by the project that uses Poky (like us!).
>
> Thus far we have not really put any filter on what machines you get
> when you clone openbmc/openbmc.  I think that needs to change to a model
> like the one the Yocto project uses.  The clear benefits I see to that
> are:
>
> - It addresses a scaling problem in the openbmc/openbmc repository.  We
> are on track to repeat the mistakes of the openembedded project that led
> to the formation of Poky in the first place.  That is, we cannot add new
> platform and BSP layers indefinitely.  At some point it will become
> unmanageable.  Part of me wonders if we are already there.
>
> - Testing.  Obviously a developer cannot test a patch on 100 platforms or
> 10 different SOCs.  So what is the developer expected to test on?  A refe=
rence
> platform.  Then who tests the other systems?  The maintainers of those
> systems.  Adopting the same mode of thinking as Poky makes this distincti=
on
> clear.
>
> So what does everyone think of the idea of reference platforms?  Can
> they help the OpenBMC project?
>
> So the obvious next question is=E2=80=A6what are the metrics for defining=
 reference
> platforms?  I predict finding the answer to that will be a challenge :-).
>
> Go ahead and throw crazy ideas out there.  Pay money to the project?  Mos=
t
> days without a compile failure?  There are about a million things we coul=
d
> do here - but what does everyone find fair?
>
> thx - brad
