Return-Path: <raj.khem@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com;
 envelope-from=raj.khem@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dgz1UJIT"; 
 dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43LG8k0jgxzDr1F
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 02:37:09 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id i7so2221235qtj.10
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 07:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a9C7QNX6NbQP9irdn3VoouegMSwa4A/BOwbudBvL874=;
 b=dgz1UJITA/bS+T8l39XR0H0c14mmABl2rFJ8zyNmbK+5DTuTBdEG1aR1pmUMhjxtV4
 YmX2ZO1WlZ5W7s0uYi3eAiTTPuucJ40vlB6hRrdrhmghgWcyu36KHUJegKf9qDRmBmlu
 8GglEM7rig2xR49zV4LfG0UVL92vzrHjEAwey+KwIpxwl63WZnasF2k7WMi/nalMvItq
 QZmbwhlcp7HH7/24/RPweSCw5x9qrc/QDQSC0b+2FHmDLJB6TZeOTDdi4Le/ShkvI1Sq
 EBsHy8TJhQghrtgnFCqwsZ9kNqY3rAg19cKT6zFaJAkmNcZMtvxW3Z162f0bp2FVgccw
 ryHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a9C7QNX6NbQP9irdn3VoouegMSwa4A/BOwbudBvL874=;
 b=OXgAE3/rXwY4GFJ8grNHCaYCAE8h80hfz8NSRYEGGVCpJNlWf1E6nXPvFV9DfaA5vT
 LKaBRSMxgGNW7fZ5GudgLafwL7rtMMZA2ON4DVKkG466doE5l1fXyGx7+sOyonI29qxn
 wgpp1J6dreRZ/TJjhZjiFivsDEVElcHaW7w8BMYrjid/YJLruG0iWUX+J0A5AHBhoM/9
 df5EfYroVmZivxzepO8kvymZSxhOZTxZfNOWQYMWq+PswVXoDxrEMQNGsRffsm/5NctP
 JTQCq5NkI48Af3fch4ixkdObHX/+NgLi47ZMdvSgwZipqzpUPd/AeI+qP4zZbP9P7O7e
 fMLg==
X-Gm-Message-State: AA+aEWYtMA6BuIae52J+MDuCvyvPk5UNOYV/LEzTvK/GVqFrwx7Irfrc
 qmr8tzl/yAzgDa6hIq7dreGSV7jmtScA5hO+ZDc=
X-Google-Smtp-Source: AFSGD/Vx3wAEYdUM6E8u84L3tYNSvcX5iieH20URrfoLyH+0e/U5exjMT+vmd3JRqeShJZZkGuslVL3wuIp/4gZ+Pg0=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr26335276qvq.55.1545320227067; 
 Thu, 20 Dec 2018 07:37:07 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
 <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
 <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
 <CAMKF1sp1DLQwANi8sbHp4pP-YPPMbVOOsArUoxa286QAgTx-Lw@mail.gmail.com>
 <CAJTo0Lb1Vq7-UXWKZf5hs4L4HzKAu45HTOnxtFXkOCttA0BiiA@mail.gmail.com>
In-Reply-To: <CAJTo0Lb1Vq7-UXWKZf5hs4L4HzKAu45HTOnxtFXkOCttA0BiiA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Dec 2018 07:36:40 -0800
Message-ID: <CAMKF1speLVxgZXojHO5ZBNO1LQXS4CMFvhK6VEbkeJL3giyMiQ@mail.gmail.com>
Subject: Re: [OE-core] flto automake
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Bradley Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC <openbmc@lists.ozlabs.org>, 
 James Feist <james.feist@linux.intel.com>, 
 OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 20 Dec 2018 15:37:11 -0000

On Thu, Dec 20, 2018 at 4:37 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Thu, 20 Dec 2018 at 01:20, Khem Raj <raj.khem@gmail.com> wrote:
> > > That however leads to the question of should we just change the
> > > defaults? Does anything break if we use gcc-ar instead of ar?
> >
> > Dont think that is a good idea in general since gcc-ar is a wrapper
> > around normal ar
> > passing --plugin=/path/to/lto/plugin/so and that may not be right
> > thing to do always.
>
> Well, I built core-image-sato core-image-weston with AR=gcc-ar
> RANLIB=gcc-ranlib globally and it worked fine.

Please build a lot more. These images cover only handful of recipes
there are problems like

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77576

which we might have to contend.

>
> As we build the cross gcc we know what is in it.  Other toolchains be
> they clang, ICC, or external GCCs, can override AR just like they do
> the other variables.
>

Yes they can, but what doe this buy us ? except we make Core toolchain
gcc dependent one step more.

> Ross
