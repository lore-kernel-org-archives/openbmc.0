Return-Path: <ross.burton@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=ross.burton@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="1227hNN8"; 
 dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43LB9r1LGczDqv8
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 23:37:50 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id p86so1219252lfg.5
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 04:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ezDvfohJ+UmdYbHYqPFQ3l4AE8T7JccBAedtOyE3AmA=;
 b=1227hNN8D4ulNTFAU8jR6zrE3x2KKRA0/ug4crc2YBtN8hqWpaXKDWRs+nIc8qytYu
 Zz6wlLty6BswgAqYdYzMGjSzHw8A0WxyyqngEVv8I/qsIQUACpJDfpbFk5g9n9JGyQ6E
 SoUD2WGUgZ4KZTsH2elNy/uhCW0NSdiLf4dnwFntoBr3AdZW60fd3V2YUn94zOfjmjC5
 p8V90Ai69Nk4vOcFXWhZ4dNPdmBcEIXKVtt6DIcXTweeZ9CKqkJFjS2H7+xb/ZvfmE2r
 W++kayuzPfzrdA3tg4YtzQeamWxemMW0supD5PE+4GExdy68iSKmCbkd8EAFB24zlL8d
 2u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ezDvfohJ+UmdYbHYqPFQ3l4AE8T7JccBAedtOyE3AmA=;
 b=hyDqR0eFjo1fdkjUNcjrSep6zr1BvRGEysvm8E1+RmFoL/xZIcePkUDx/0xPf4FMbg
 5MjHaDK4uOL73rDdL7z6Kp4+nhpHpi0G0V9SvFm25vyMTsmsetL3AvvuHASqbbu+ul7e
 YW0+aG0uVilAPj6rp7sU+dKiAzjkkBdX/IEBc6CiJRH7/sMgshd7PDsE/tpA/8SjpyZ5
 zloSBycCvjBwtLgfvN0FsjC26H4r5bGj4ZGYIKlZ8Rjqf6WTaNLM/v3MYb5GTx/qY8s2
 VgddLOvyNDlnaPGeP6SOt8Nmo3yAcUhrey4rBnI/HvMNp7uRBUNt0ZJ5E95KBSG89uEd
 Yu8g==
X-Gm-Message-State: AA+aEWYXuHQjRNp1Sc4IHJVDOjc42GBZnQ78z/k5T3kvfJQBJUIrpcf0
 gaoI45US8O48ssQtuFFhN4NBD8roNjP0MfPp4tIORw==
X-Google-Smtp-Source: AFSGD/Ux3C7JLSFRZW4dqZpi99l6widquQDxHnuFCwpSVcw6pZi/tUljAbf1FKOHXN/MJfmpqmuQQhdTIo2Mfek5Jok=
X-Received: by 2002:a19:22c2:: with SMTP id i185mr16183461lfi.2.1545309466896; 
 Thu, 20 Dec 2018 04:37:46 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
 <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
 <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
 <CAMKF1sp1DLQwANi8sbHp4pP-YPPMbVOOsArUoxa286QAgTx-Lw@mail.gmail.com>
In-Reply-To: <CAMKF1sp1DLQwANi8sbHp4pP-YPPMbVOOsArUoxa286QAgTx-Lw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 12:37:33 +0000
Message-ID: <CAJTo0Lb1Vq7-UXWKZf5hs4L4HzKAu45HTOnxtFXkOCttA0BiiA@mail.gmail.com>
Subject: Re: [OE-core] flto automake
To: Khem Raj <raj.khem@gmail.com>
Cc: Bradley Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC <openbmc@lists.ozlabs.org>, james.feist@linux.intel.com, 
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
X-List-Received-Date: Thu, 20 Dec 2018 12:37:54 -0000

On Thu, 20 Dec 2018 at 01:20, Khem Raj <raj.khem@gmail.com> wrote:
> > That however leads to the question of should we just change the
> > defaults? Does anything break if we use gcc-ar instead of ar?
>
> Dont think that is a good idea in general since gcc-ar is a wrapper
> around normal ar
> passing --plugin=/path/to/lto/plugin/so and that may not be right
> thing to do always.

Well, I built core-image-sato core-image-weston with AR=gcc-ar
RANLIB=gcc-ranlib globally and it worked fine.

As we build the cross gcc we know what is in it.  Other toolchains be
they clang, ICC, or external GCCs, can override AR just like they do
the other variables.

Ross
