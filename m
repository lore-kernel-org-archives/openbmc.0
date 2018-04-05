Return-Path: <arndbergmann@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JGtBYnl0"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40H2l15DFjzF1qc
 for <openbmc@lists.ozlabs.org>; Thu,  5 Apr 2018 22:51:23 +1000 (AEST)
Received: by mail-qt0-x242.google.com with SMTP id s48so26707397qtb.10
 for <openbmc@lists.ozlabs.org>; Thu, 05 Apr 2018 05:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=L9CHUW0S/zgSOSd7yfbzasHlDgdj+KrYMEJ6CvATzsw=;
 b=JGtBYnl0FL5q5MHcnOgLM1yl576rBvjsTs1qKBlkoeOfGsUJKvd33slSjts6oIcA3V
 HP553gahsWv+3exVUh0yMTVVgG+dg2U1oyT4rJiaiqsLbbJD83GXjVnmCI4aXxTJJoPF
 A4RKAhWJKSPlSRZxJAR5VuG7NmhTrydhBWVUmuyvFA5EYCu+GE+IgFONC8KYMSpodYtJ
 jNDMjsZ0E8dluADXY5hB5O6pzmTCVae5DM5PsKosY/M1b6yrav7ZlMpnOvk/8x43oxq9
 X3UQi2kyXnpBf4YbYGq7MPnTMoJfrjK54gMxtPb9q1APYWA+MpSFMNWq/x+Tojkswdhi
 8uJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=L9CHUW0S/zgSOSd7yfbzasHlDgdj+KrYMEJ6CvATzsw=;
 b=ES3CmJ7i83Yg5VEroJHfJ2KYnqOEpSoGy4hcRhYet5YnGQlmQAbP7mvUJXIBrxHjOt
 Yp4d+0fTln61YMPDsmHinlJ9/CbmTs4a+FeHc8lvEculzpRiBCplSv5xq/ICx9hlS/84
 KmqvOVGk0qsXA9nKfY8XQ4Ks10aFv/9tircefrctc1N/6B+Vhh9xl+xNZyCp7jo/SanE
 hC0/NDUV0pgHhwZQnUHOeh3E6elHRO47nwGAtsHpL5K7ciGIMMiBiRhu8RGkelRohINF
 X4sPim6Yw3qpdUhfb3EqFaTP2PSCw9kgEOY3mkFZweaP/kY6eYPk88BP+cZHE5y8deaD
 +XSg==
X-Gm-Message-State: ALQs6tAYXc4GxrYd2SAeJnK/OX2YaAVZ5iosjamGVTp35MjeT63b5EYe
 IQzwZmYMToS2PV4TyfZvwPx6fm3aRMZaJcRYNx4=
X-Google-Smtp-Source: AIpwx48P4IqPSp8JEG4NyVLJJeowAEoqJmJfhYjkadDTXSX2wCQtM+1QE45ZtVXPo00Kvwjsx99Kr8z9nmQrgqq+wZs=
X-Received: by 10.200.36.250 with SMTP id t55mr11389288qtt.141.1522932680658; 
 Thu, 05 Apr 2018 05:51:20 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.12.185.25 with HTTP; Thu, 5 Apr 2018 05:51:20 -0700 (PDT)
In-Reply-To: <CAFd5g47AeTtU_uYNOuDKroBwf_FMd+4Z7WgcCM5wyj2e_PEZrQ@mail.gmail.com>
References: <1521155412-29229-1-git-send-email-tmaimon77@gmail.com>
 <1521155412-29229-2-git-send-email-tmaimon77@gmail.com>
 <CAFd5g47AeTtU_uYNOuDKroBwf_FMd+4Z7WgcCM5wyj2e_PEZrQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 5 Apr 2018 14:51:20 +0200
X-Google-Sender-Auth: xoVOOPRzLDyZSADQYk3SDjxIGcQ
Message-ID: <CAK8P3a2AtJUmP+cNVEdyiKJSAst+svNqvHrssgseAHnTzqj40w@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm: npcm: modify configuration for the NPCM7xx
 BMC.
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>, 
 Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Nancy Yuen <yuenn@google.com>
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
X-List-Received-Date: Thu, 05 Apr 2018 12:51:26 -0000

On Fri, Mar 16, 2018 at 6:56 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> On Thu, Mar 15, 2018 at 4:16 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
>> Modify configuration and MakeFile
>> for the Nuvoton NPCM and NPCM7xx BMC.
>
>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>> ---
>>   arch/arm/mach-npcm/Kconfig  | 40 +++++++++++-----------------------------
>>   arch/arm/mach-npcm/Makefile |  4 +++-
>>   2 files changed, 14 insertions(+), 30 deletions(-)
>
> <snip>
>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Sorry for missing this earlier, I did ask for the rework but then
didn't see it as it
wasn't in my arm@kernel.org inbox.

Tomer, please make sure that all patches you want to have included in
the kernel are sent to that address, while patches you want to have reviewed
are not sent to it.

Normally I don't apply patches during the merge window, but this one fixes
some build problems, so I've decided to take it.

       Arnd
