Return-Path: <arndbergmann@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gL/WNV17"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40L8xS4zY2zF241
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 00:41:16 +1000 (AEST)
Received: by mail-qk0-x243.google.com with SMTP id g7so13596290qkm.1
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=TrsTlGIkBprYrPgOE/Ultz2wm2Jppb/4cfB8XTmUR4U=;
 b=gL/WNV17OIYtQmCCSYu4xyZN5ADuNw1ghWip53sVBKuGMCuTg/hRdrlcAC32lldC47
 cJIibfYzwMe0UAYhut3CX/ymcCdc8GLYSTKvYxfhkTLn1U9xahINCDH9GuTXuMARyZZe
 LHbxRoNxduk8+DeOY6+MoNOm4DRwA87+P5ysTArCZeEyozlN4wC0WsvWpVccgDQ3rTgg
 Tg8pis6fwKy2KnMNvNpJJMhqVAhIn1zzr5FDj6VRUYIMZ3ZqSk/SygG7kajoNTyhbU8h
 nzmDgDlgorkZv03dnL/91ZMlqpba3bqrZYA7oynSJXt1KwRnvTEzDVEPrJNXa3CB3+sk
 UvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=TrsTlGIkBprYrPgOE/Ultz2wm2Jppb/4cfB8XTmUR4U=;
 b=KZARcslQmCPI4RcgtBIbXJ4K8x2aK6iXgPLqXbAbqOvYkKjFAK3oWWqgcT4jEQHmMk
 En0q0enUyszhplAWeejpXmLUPvHF/FiIfB0nQ6vGS8166gHnYMTELL7GE6hj33FPiuEa
 jCLNAWeeh8v8VFWXNnEhTmG3GRdPPtvkJ1mEWRujiMLyJu4a5/2rnHlXuRuq9VxQ0QDy
 9HdTfycIvFe+heMY3e5T19hPc1KGFyryhNe+B5IAsuVdwPYL2WU8P9y/7suTGRxFLSFh
 rMyipRLvAkjdPkcjtMxEd8ZJDJvVFRgigb35mq3OMvE9scySrtavgMFywef9jcGBbifJ
 PzTg==
X-Gm-Message-State: ALQs6tD8jWiPDsp9vRT4va4N6d+zzdZKoCE5EftrTit6wVl7JjjrscoS
 Xg1fucGyL+EBkr/CzcYhodxBDS1tbl5m3kaqZDU=
X-Google-Smtp-Source: AIpwx4+3jkOzcbJW64gWy55eH6nMDDftj4Qk0vlV044wJDJ+OGtgUynL1e23eKCO2YdwPDvxMz47azia5Eg3kMlb4JA=
X-Received: by 10.55.5.8 with SMTP id 8mr1009416qkf.84.1523371272104; Tue, 10
 Apr 2018 07:41:12 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.12.185.25 with HTTP; Tue, 10 Apr 2018 07:41:11 -0700 (PDT)
In-Reply-To: <1523196197-2072-1-git-send-email-tmaimon77@gmail.com>
References: <1523196197-2072-1-git-send-email-tmaimon77@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 10 Apr 2018 16:41:11 +0200
X-Google-Sender-Auth: Qtzpi3-5EPhQeTp0WeRx0hR_SY8
Message-ID: <CAK8P3a30uzYXUVBV72+OiAUxdVRD+=VdLg_nH4c1TSxGzfvNCw@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] arm: npcm: enable L2 cache in NPCM7xx architecture
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: arm-soc <arm@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Avi Fishman <avifishman70@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Joel Stanley <joel@jms.id.au>, DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 10 Apr 2018 14:41:17 -0000

On Sun, Apr 8, 2018 at 4:03 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> This patch Enable ARM L2 cache module in Nuvoton NPCM7xx BMC
> by adding L2 cache parameters into NPCM7xx DT machine start structure.
>
> At patch V7 arm: npcm: add basic support for Nuvoton BMCs we got comments
> regarding the flags use in L2 cache module.
> - https://www.spinics.net/lists/arm-kernel/msg613212.html
>
> After checking again the L2 cache use in the NPCM7xx,
> the only L2 cache flag we need to set is L2C_AUX_CTRL_SHARED_OVERRIDE
> and it is done in the device tree:
> https://patchwork.kernel.org/patch/10063497/
>
> L2 cache flag mask allowed all the flag option.

I've applied the patch to my fixes branch now, but took your description above
instead of the two-line text that you had in the patch itself. I liked
the longer
text much better.

      Arnd
