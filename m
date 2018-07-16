Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::241; helo=mail-it0-x241.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pj2nHNZS"; 
 dkim-atps=neutral
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41TgnX0L8bzDr55
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 21:15:42 +1000 (AEST)
Received: by mail-it0-x241.google.com with SMTP id h2-v6so18460945itj.1
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 04:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SCs2oro0BIKbFWE5LfLLVC7ONps5ENLe2Xwsf+OVL/k=;
 b=pj2nHNZSDhBW8d27FTzPw7wJvAC9bmtvNKfw+fArlqQpqTGJVF6OZw9YfyGB8efKyh
 D18uD5IrmUo91EU4kUBrx3jHJGNv8yEcZQYWcyLhv7RlAn08IvmoQpOOCxHOReQ3ZpwO
 ohiaofr+XzwpY4MIjZRWbU+/9lqmoQibYoQa6cxeAYgR0JTHrDyBT8uybHGEa60skhmZ
 LOBnMGDT6cvJgGQ7zPzDtfl71V8FfytvrtjBVuWu/LaLiK9UYg18gRqXb5j9tSH2r4mR
 zdOMD+Fz+vX2N1paL0pTFwOtJ7f5QsPQN743H6nHakCKXGffIK4dgSqUrnQmMzV9Rkkl
 osUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SCs2oro0BIKbFWE5LfLLVC7ONps5ENLe2Xwsf+OVL/k=;
 b=twioVPd1+m6YNcJfMnIxk9QsrCheD46ML8Cm9x2K14iJs7B5WXWcvgjPVUbQ/eu/lu
 37iFAQ8s9drgFh034NkxMMcKHDO+f2g2eydmfAswO1OkJN8JBjHTzm73UnoRL5Kxhlvx
 wsgbDu5bvJsMH1va1bAHiss1I1MWYtYiYPh9vFbD+VD/VGhAnrPh18a1gbRmDv+CYvWB
 kls5IXIlseiPJVwsEtlgPTwEJVfBEOoQ35EdCJ0C7vVFCob8ljFc+7CfRps5DvakYM4R
 tmRf4dJrIosa2vgIndbJ0giFAl4JQ8UamGakAI55F0GK7mKPKptsSL6LNboCW6JtbEXp
 j1NQ==
X-Gm-Message-State: AOUpUlF09jk0F0cS10jqbemFmc4LH2uDLrxgck74snfwpklGBnG+MJ4M
 shYEczQ5X7CDeAB4KmikTvNb/qsGySwNyYyp6A==
X-Google-Smtp-Source: AAOMgpcCdZ+7y/4lFVT18wX+f4KAXBAnuaBafrDUKMl9KGEu/Dgg6i4TaE0ek2wB74iJVapG4iQ5EGWVrMIS2mx21do=
X-Received: by 2002:a02:b4a4:: with SMTP id
 k33-v6mr13204023jaj.53.1531739739390; 
 Mon, 16 Jul 2018 04:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLHVuuMgcEQw1xkGP+H1h_Gxq1Vf0Re2SKjVbPhiAgkxNQ@mail.gmail.com>
In-Reply-To: <CAE33tLHVuuMgcEQw1xkGP+H1h_Gxq1Vf0Re2SKjVbPhiAgkxNQ@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 16 Jul 2018 14:15:28 +0300
Message-ID: <CAKKbWA7JEMjsJm4W7eY=HaLtsTrh2h1M3YfdH82Fov_G1q37ew@mail.gmail.com>
Subject: Re: KVM Support?
To: akashgj91@gmail.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, uri.trichter@nuvoton.com, 
 eyal.cohen@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2018 11:15:45 -0000

Hi Akash,

We have for Nuvoton a KVM for our npcm750 chip, it is a vncserver
working under VNC RFB protocol.
We didn't yet put it in OpenBMC, but we are going to do so.

Regards,
Avi Fishman
On Mon, Jul 16, 2018 at 9:35 AM AKASH G J <akashgj91@gmail.com> wrote:
>
> Hi Team,
>
> Please someone share whether Keyboard Video Mouse (KVM) over IP implementation available in OpenBMC ?
>
>
>
> Thanks and Regards,
>
> Akash
