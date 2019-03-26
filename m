Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KPaErm2M"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44TJNX1S8hzDqCc
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 04:41:57 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id o74so12291189ota.3
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 10:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=13g8DOyZDfMxmWogI9dENc8mQIBbIGzhWqp70P2HsrU=;
 b=KPaErm2MV8OaGrMvyRRYAtuGBQja+veykRvl75T77WgEbywAgnsLzgUSYX8YBncc/L
 nvFvLPwurHACBJPiYZGCpvqxXLcNscN5HrXxrH0IIi6EbeI/wkU7En5pNLH11dzJqbTA
 eqit7SAFazqQVNPC2B5Hes2fYnIiaqrcgjtXAJ86IjNPNdztcxZwzC4T45cR2VkdyKlT
 o2EDaKftDBxtd6QOAcpsR1LBdOM2Lb4/jxMZM8yxgut8Gko8S9eZlnm8Smtb6rGarpuu
 oo9V3MKAaUxGACT/25uXS6rUYUDsesT2loKDO+pnns3NokykBZJGQJuedA2NYNBY7EsO
 Gd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=13g8DOyZDfMxmWogI9dENc8mQIBbIGzhWqp70P2HsrU=;
 b=hLg07NqE/f4i6fsg6wpjDC4bX4VzAYFWIuPJk/uvwHvQ0yJJ8O3ydGr14jz5LVrN+h
 YngK/qTEpe+zjudMGw8Mxh787duJfeSZqGIZXU7+19+0pjyCcIq52p+VZP6p9bGnNQs/
 bqpnldDJGrwObtBNbahyhP1dgopBiH27pT3BGk72ymes1jqLPQKByVnk7FBu9Q+1TcmU
 30IPxnS8hE0pGavmgQLRiS0FiVsJO3P0vzJm3Zz2/6b94RvUCmx3H09GKelxM45ERWMu
 uYlwbz1kZ3GxnuYSfN9eYO3ZNSVx/RWXEXFc2yoPikhmijAiAzCgKzpq8GcpqPU2NPpT
 YU/Q==
X-Gm-Message-State: APjAAAU4PVhqOnTNNf2Zu0NViNV7esRTph9IANKZW0AyKYce5A0Fnj2r
 iOJEcq0Arlue8NZje2pxhex/ypkvxZf+iyJZP94tSQ==
X-Google-Smtp-Source: APXvYqxxAlv2H+DzRqn070vzVwlaxgPJ4k/57vrfDwq3XWpnWqopr0qXXQ8rJ0mG3fcA8w5+OwCGgliBaBo7voRTqh8=
X-Received: by 2002:a9d:51ca:: with SMTP id d10mr22065819oth.83.1553622114149; 
 Tue, 26 Mar 2019 10:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
 <20190325212446.25795-1-joe@perches.com>
 <CAP6Zq1g62wiDTd9zn5dhwsfK6Rr52+ishU_=cO+G0Rm3Cs7kbQ@mail.gmail.com>
In-Reply-To: <CAP6Zq1g62wiDTd9zn5dhwsfK6Rr52+ishU_=cO+G0Rm3Cs7kbQ@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 26 Mar 2019 10:41:42 -0700
Message-ID: <CAFd5g47LVZ6xtfcAx4GDO-bg1QsovMauiBqUHOk6JPT4fNPTqg@mail.gmail.com>
Subject: Re: Bad file pattern in MAINTAINERS section 'ARM/NUVOTON NPCM
 ARCHITECTURE'
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Joe Perches <joe@perches.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, 
 Benjamin Fair <benjaminfair@google.com>
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
X-List-Received-Date: Tue, 26 Mar 2019 17:42:04 -0000

On Tue, Mar 26, 2019 at 5:11 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Joe,
>
> Thanks for sending the notice.
>
> We will send a fix this week.
>
> Tomer
>
> On Mon, 25 Mar 2019 at 23:24, Joe Perches <joe@perches.com> wrote:
>>
>> A file pattern line in this section of the MAINTAINERS file in linux-next
>> does not have a match in the linux source files.

Hi Tomer,

Just thought I mentioned that I posted a fix here[1] sometime ago. The
patch should still apply cleanly.

On a side note, it would probably good to send a follow up patch that
removes me as a reviewer, and adds Benjamin Fair (CC'ed) as a
reviewer.

Cheers

[1] https://www.spinics.net/lists/kernel/msg2925741.html
