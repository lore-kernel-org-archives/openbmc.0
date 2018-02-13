Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::22d; helo=mail-qk0-x22d.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SkumV4Jn"; 
 dkim-atps=neutral
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com
 [IPv6:2607:f8b0:400d:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgQv460lpzF0vy
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 13:08:48 +1100 (AEDT)
Received: by mail-qk0-x22d.google.com with SMTP id g129so6279344qkb.13
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 18:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=9VDt/wMaaK1BLj5Zg8FsEGLdKH6tgAqq6A32RVI7jRg=;
 b=SkumV4JnKE6kLx3iqJIKs4cceG1YxwcnCRn43u9n3LaHxfY0k3A/jXhJF15J6ZZJ2y
 Rv3kSCnYMuUEPbpQV2Yt+diHbtkwsHpGlYFSJbndKNKqGNPglqLy+phJyHhkP9E1zDad
 eM/CDKc0MbnrTTLw5Gz6kM654Qjhs02hkMW2aSt0KZnSWvt/YXUCcr08ndiCoO9OdTIb
 K7uthewSbIhD1taGmg/4TECKulO6KOmY5FcNofhZrsfjnQkpNIUqcHwCHxnlkafiS23r
 wqDYIW1Js2KGreNn2tA7Jz1DMH6Iete08JJZd0T2+q75yLJuV1YSAFZ+8hbxdGi6ZV1G
 FD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=9VDt/wMaaK1BLj5Zg8FsEGLdKH6tgAqq6A32RVI7jRg=;
 b=p2yt2DIZd+y1UlnjqYG/vrd6KHGNVaLLpjk5Qex7R9RMwSP6kKhxzWUKeI4YFsoWQG
 3+FmYAbFBmtEN4ZS3OSkiM5+G8t3GkkbL148FMBP0fxajGCwRQpxWBEGk6Aj5s6K0b3J
 eVFnKQnS0dx70YbFgrVpmYII+iXezgPporEWBQWZU24JKtlxApq5BSllBW+n91DFb4zm
 jyt6jLB+8BqUbCtuS/gx/bciBbhh68yUY7r5Dv0rubMsbwU3njIpGgwixkPkIzaStu0/
 AVwtPVAB8k8ufF/VbLVZSMyKxqcaCZmmhx7kPIpliD/5iEaG0r7WcGSmP8zhC0fQ0/S/
 9tqw==
X-Gm-Message-State: APf1xPDTldz8d54U7Pz9LIKiuUr9AeODhfqJz60dop+6uZRc0TYrOSUS
 5XsVoUhdBwaknSHcrWgxrIc1jor+fyeE8iIteSH3TA==
X-Google-Smtp-Source: AH8x227jm5YyXFrin28zzGWYzrAjh9/EtAW4yKoDiua1l0ijN0Sg0lnDtcQ1jMdzx29DGOoK1/C81rsd/3V3ob0zaD0=
X-Received: by 10.55.106.193 with SMTP id f184mr21563372qkc.211.1518487725626; 
 Mon, 12 Feb 2018 18:08:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.183 with HTTP; Mon, 12 Feb 2018 18:08:45 -0800 (PST)
In-Reply-To: <CACPK8XcGhxTq7QGeub2rAEtGSyrOmnobspVJfhE5YmB6MQRM9w@mail.gmail.com>
References: <20180212205833.151019-1-brendanhiggins@google.com>
 <20180212205833.151019-2-brendanhiggins@google.com>
 <CACPK8XcGhxTq7QGeub2rAEtGSyrOmnobspVJfhE5YmB6MQRM9w@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 12 Feb 2018 18:08:45 -0800
Message-ID: <CAFd5g46EVEQmETawUagDLzySLTFQqc2aM4kFJvvHMU_dvP5V3w@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm: npcm: add low-level debug support for NPCM7XX
To: Joel Stanley <joel@jms.id.au>
Cc: Jeremy Kerr <jk@ozlabs.org>, Russell King <linux@armlinux.org.uk>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 13 Feb 2018 02:08:49 -0000

On Mon, Feb 12, 2018 at 5:59 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Brendan,
>
> On Tue, Feb 13, 2018 at 7:28 AM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
>> Enable low-level debug support for Nuvoton NPCM7XX family by adding the
>> debug port definitions for the SoC.
>
> When playing with the Poleg boards at the recent OpenBMC hackathon
> Jeremy discovered that the UART is a normal-ish 8250, with a custom
> divisor and a few extra bits to be set.
>
> I found that we can us the generic 8250 low level debugging support
> just fine. This is because u-boot sets up the divisor settings for us
> (as you've assumed with your version here), and from there it's just
> reading/writing characters.
>
> Assuming you can reproduce our results, I suggest we drop these
> patches in favour of adding the correct configuration the Poleg.
>

Sounds good to me. I trust that if you were able to get the 8250 driver
working on the Poleg that it does indeed work.

We can talk about configuring it off the Linux mailing lists.

<snip>

Thanks!
