Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4003:c06::244; helo=mail-oi0-x244.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cCKEjMC5"; 
 dkim-atps=neutral
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 402ZTG0XsszF07s
 for <openbmc@lists.ozlabs.org>; Fri, 16 Mar 2018 16:56:17 +1100 (AEDT)
Received: by mail-oi0-x244.google.com with SMTP id g5so7730253oiy.8
 for <openbmc@lists.ozlabs.org>; Thu, 15 Mar 2018 22:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8bPBeSHvajI9h3hBMkfoFD8TcpALiXxAynUobsxAS0Q=;
 b=cCKEjMC5Ohxg7ZvnYpPzrsyTnpRXAKBoWEfg9E3436VmDI8SxdBbKQRSIhqeqMQv5v
 Ik3oemzx16pBm/ehwNfD5rWAUSAaGam8r9w7ZHTZVRHKVl5z5h/RIewoSQvH9MyRA3/r
 WcrXaSCrSMwQG4clzf9d/TCDXqB4W4NEeTNFQD4IdvUKIIDSLMkar9mNAZcbGX0TT/q9
 Svyvc1x8gm5TzJ+lfNWvDtILukofEWW6rqFFO0X7xHeNSTmcH/ImWjazrZiqrb00zxmp
 Q1hi7Bu/YCHnkNK+x2igLVZV9MmX2v69Poxsplv9H8+a8VBTW198TqwLDGRJqEe13Krf
 nGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8bPBeSHvajI9h3hBMkfoFD8TcpALiXxAynUobsxAS0Q=;
 b=S3OWd58L5MGxczmU5xciF5MqwxG/VlIo7g7eHKAj+q1Md4/17GlfBN3eG7mVN9991+
 LNdTwUYK7oJviFRyf6GGcb72TdGJZrl3J3SM3lBsAm8N9bYoRaR0di78Y5n0rBMsJSNX
 FEnmr9/b4Vs0aB5ZoGjUCirYADmpRrVIsOcF7e3Kc1jgRoHbNfK0QxRkMwATqHxrQA+Q
 h1eaGgKRg1IlpESVssWgcD+2DhEpdyn9PbdK5woCLggCs1iBENHMHqWi2PYSBm7cMOrt
 sMvcv4woM/HhOAouGEuYxAAuPoRBCy244rMkdVV9GliYDuVhnypA3G0KTJ0ebbPMYNZG
 8fNQ==
X-Gm-Message-State: AElRT7HmiSi/vHivKi5N0FSNkpcgGyQPz2gHPSKGPKXUyqrprWZPs4q+
 rAc178IS4dRT7YgIZU8l04ewrnnWGU5IddEq0ewoCw==
X-Google-Smtp-Source: AG47ELvDceex6uzmRuxJkCA0VATts0QlUukDIiwnxZS2NWPIPUR2PzcEi3NSioMm4BaMPSQ8suzMULaDfHagRi2rGtY=
X-Received: by 10.202.8.206 with SMTP id 197mr344339oii.238.1521179775291;
 Thu, 15 Mar 2018 22:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <1521155412-29229-1-git-send-email-tmaimon77@gmail.com>
 <1521155412-29229-2-git-send-email-tmaimon77@gmail.com>
In-Reply-To: <1521155412-29229-2-git-send-email-tmaimon77@gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 16 Mar 2018 05:56:04 +0000
Message-ID: <CAFd5g47AeTtU_uYNOuDKroBwf_FMd+4Z7WgcCM5wyj2e_PEZrQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm: npcm: modify configuration for the NPCM7xx
 BMC.
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Patrick Venture <venture@google.com>, 
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
X-List-Received-Date: Fri, 16 Mar 2018 05:56:18 -0000

On Thu, Mar 15, 2018 at 4:16 PM Tomer Maimon <tmaimon77@gmail.com> wrote:

> Modify configuration and MakeFile
> for the Nuvoton NPCM and NPCM7xx BMC.

> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>   arch/arm/mach-npcm/Kconfig  | 40 +++++++++++-----------------------------
>   arch/arm/mach-npcm/Makefile |  4 +++-
>   2 files changed, 14 insertions(+), 30 deletions(-)

<snip>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
