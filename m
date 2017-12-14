Return-Path: <pombredanne@nexb.com>
Authentication-Results: ozlabs.org; spf=none (mailfrom) smtp.mailfrom=nexb.com
 (client-ip=2a00:1450:400c:c09::243; helo=mail-wm0-x243.google.com;
 envelope-from=pombredanne@nexb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nexb-com.20150623.gappssmtp.com
 header.i=@nexb-com.20150623.gappssmtp.com header.b="1yFodSsv"; 
 dkim-atps=neutral
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyMBl4KN4zDrfj
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 05:13:50 +1100 (AEDT)
Received: by mail-wm0-x243.google.com with SMTP id f140so13123830wmd.2
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 10:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nexb-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=tztrStxS1YR3nyaZWKgfhS5oWLy5fOYheXA7V7Vui6U=;
 b=1yFodSsvcIG8I1J8t8UZniNAre8I5alwmrTdItH1skED5kBEkHQPeN+ve3cV2Zc1m4
 FLUCcf2SjLffvzRupYwZhoLxGxp9M9Paxw4CmLoQGvn3uDP0tXxlYXYWyxQn8/XqtRa0
 0G4plIAYUKoO6rE0dlUNx1pPqx/g0+kMLiqGA+xZLJKepv+bmbYVuCqCfc7OfQEgJ7B4
 Pum6BvOkND2VWkrM95OivfKpwp8wbKAn807COJeas4eNNNBQNtfRGFcz8klAIirHQFtz
 kO8XyIAa4quMXl+kilREgqcaUQsURm1t0fwfGyV1bBv59J/Lz6VJNLwc+mVTzVich+q0
 6Pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=tztrStxS1YR3nyaZWKgfhS5oWLy5fOYheXA7V7Vui6U=;
 b=EJf8w3OVBdNiLkG7unkBlrslcb6jPSO+LhctFcsAkFdKOZ1UElEVe1sH6mZUuZ99Wt
 ZOjDLEDleWbWwrvhm918wGDYWfu1Ky44HDxDyvnCJpSEOOjNJHkygRxC2RNtcBIbJpmV
 ci+JJbzXiNdaxOt1lS+Kbg+damuDNBH/fH+AKLdI/H46LVIZI/bUFuuPrSXOfWZ/XL2o
 TZ0P+x8Dmpnm8PbqCBshp+gDMztA0ydyHNjKy4h1o9ykUtXCfdaEHz4h10A3UHnCf6MC
 WhyZpLLWXrfWQtv1JU309BVv2lTvQTmZ106fwrO1PJ8A6YjMn8iKYqJX0G5jsjZNotQ3
 o9UA==
X-Gm-Message-State: AKGB3mKGz3XX6ol6smtkRcDyCqsuv33Aw8MGzOFP/orZ8cIqduMVv1e0
 TFSUvp7+ffmNaTJ9QlhOEMxOYKCDiHzX8ECehlclOA==
X-Google-Smtp-Source: ACJfBotStIXl7oDpqaMXpaoFU3akH8gGQeE9xrU6hOI1lRAan44Flov0edvOTVdDXdTph0Tgve6th0UpeRYwjZlQDVo=
X-Received: by 10.28.207.8 with SMTP id f8mr2799239wmg.30.1513275226914; Thu,
 14 Dec 2017 10:13:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.157.195 with HTTP; Thu, 14 Dec 2017 10:13:06 -0800 (PST)
In-Reply-To: <1513268971-13518-2-git-send-email-oleksandrs@mellanox.com>
References: <1513268971-13518-1-git-send-email-oleksandrs@mellanox.com>
 <1513268971-13518-2-git-send-email-oleksandrs@mellanox.com>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Thu, 14 Dec 2017 19:13:06 +0100
Message-ID: <CAOFm3uHd7VJWRiYPSuTbEmeh1YohUC_9Gr2AiP8qdpUPcY83nQ@mail.gmail.com>
Subject: Re: [patch v14 1/4] drivers: jtag: Add JTAG core driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 joel@jms.id.au, =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, 
 system-sw-low-level@mellanox.com, Rob Herring <robh+dt@kernel.org>, 
 openocd-devel-owner@lists.sourceforge.net, linux-api@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri Pirko <jiri@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Dec 2017 18:13:53 -0000

Oleksandr,

On Thu, Dec 14, 2017 at 5:29 PM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
> Initial patch for JTAG driver
> JTAG class driver provide infrastructure to support hardware/software
> JTAG platform drivers. It provide user layer API interface for flashing
> and debugging external devices which equipped with JTAG interface
> using standard transactions.
>
> Driver exposes set of IOCTL to user space for:
> - XFER:
> - SIR (Scan Instruction Register, IEEE 1149.1 Data Register scan);
> - SDR (Scan Data Register, IEEE 1149.1 Instruction Register scan);
> - RUNTEST (Forces the IEEE 1149.1 bus to a run state for a specified
>   number of clocks).
> - SIOCFREQ/GIOCFREQ for setting and reading JTAG frequency.
>
> Driver core provides set of internal APIs for allocation and
> registration:
> - jtag_register;
> - jtag_unregister;
> - jtag_alloc;
> - jtag_free;
>
> Platform driver on registration with jtag-core creates the next
> entry in dev folder:
> /dev/jtagX
>
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Jiri Pirko <jiri@mellanox.com>
> ---
> v13->v14
> Comments pointed by Philippe Ombredanne <pombredanne@nexb.com>
> - Change style of head block comment from /**/ to //
>
> v12->v13
> Comments pointed by Philippe Ombredanne <pombredanne@nexb.com>
> - Change jtag.c licence type to
>   SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
>   and reorder line with license in description
> v11->v12
> Comments pointed by Greg KH <gregkh@linuxfoundation.org>
> - Change jtag.h licence type to
>   SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
>   and reorder line with license in description

Thanks for the SPDX bits: for this part you have my ack:

Acked-by: Philippe Ombredanne <pombredanne@nexB.com?

-- 
Cordially
Philippe Ombredanne
