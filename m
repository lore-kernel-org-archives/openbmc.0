Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tjH0y1447zDwcn
 for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2016 10:18:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z+HkfkOW"; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id 50so13285873uae.2
 for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2016 15:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=UpiWJJ35v3lo9RpwvbLUjirEVK1pMcaMGrciq7qkR4I=;
 b=Z+HkfkOWey/VHIjlTcKPdcErvuPUMIn9SGwlvuePqpqnygEUiftSg48ZkS6aVporzW
 uyMKsKq1f6BuMYIcuSRAp8IxbHnbYt6G/EtTljsYFJvhlSzkgvTtmMX+IvEnpWB/51EF
 4d8qOR/gVOpIvLGv9Kz+OUKheTKgBUB2hJcax2Rrn6kQpEX0j9RHV3E23VfOEzHDGjoH
 sGxucfrfRkPADrbIOal6eIjDDP0xX1+H7bJtYQA/E6X7vWiDVU8dlf1DpLzkrQ/CGeOp
 42iOBkvcm0K651QHxbqhQl9o+AQZD9tL94KXOKcGyJpGKStHjsV2VuJOS8U/Qg0wEKAh
 DRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=UpiWJJ35v3lo9RpwvbLUjirEVK1pMcaMGrciq7qkR4I=;
 b=eOgu3LXO0yHA9lDLZ/HcZE1L2BJQdmw0fv3i3rktCanpC5atP10Hy3iFHbQTWn5CmD
 I4OrNjVzybOpukT+7pGEB3xe/tpiUXkX3PQ0hSmj7d1gGAz17wuzFtZ+poghl8Bkci3S
 ZDo/PVXG3mcc0ZHHwGwp4sz8RZvNCXnTLY4hmDtrFGkcayZloRXKM/V/SPPvTr1bQezL
 TmYCOoGUfVEI8+n9w/7dYrbuwrmwBd3W8O1kDUG1u8/JRTRUPIIdh1wUV0hqIYkhsoWM
 oz5aQPH8Bb7FAK29nSFnGHf02PP+MUTRBJ7GQ1kVWRywfdHoWDG3fDI8qE3Pw9pYUx3G
 o7hA==
X-Gm-Message-State: AIkVDXJm3ZL4R0BG85mSznY+V8v5uGtjc41gPhf35ZSnMwKK1dRj8f162uo6pIJEQcOl1w5ZqWsxOdFf5YcCAQ==
X-Received: by 10.159.50.138 with SMTP id l10mr12600568uab.166.1482189534651; 
 Mon, 19 Dec 2016 15:18:54 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Mon, 19 Dec 2016 15:18:34 -0800 (PST)
In-Reply-To: <OFAB060B32.380FD18C-ON0025808E.003FDC40-0025808E.00405F91@notes.na.collabserv.com>
References: <OFAB060B32.380FD18C-ON0025808E.003FDC40-0025808E.00405F91@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Dec 2016 09:48:34 +1030
X-Google-Sender-Auth: mtJKJjSJTPmv9KvJtwaFv7qbkC0
Message-ID: <CACPK8XcryOVx-ch3ffVRUvwU6cXLSBGDu8_CS6wmoixjt=700w@mail.gmail.com>
Subject: Re: about fsp2 board
To: Ivan Mikhaylov1 <ivan@de.ibm.com>, Alistair Popple <alistair@popple.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Karlo Petri <XXPETRI@de.ibm.com>, Bradley W Bishop <bradleyb@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Dec 2016 23:18:58 -0000

Hello Ivan,

On Mon, Dec 19, 2016 at 10:13 PM, Ivan Mikhaylov1 <ivan@de.ibm.com> wrote:
> Hello everyone, so probably everyone knows about fsp2 board existence that
> is still using in P and Z systems, what we wanna do in case of Z series, we
> want to do same way as P doing right now with ast2400/2500. So we want to
> port fsp2 board into upstream kernel and be a part of openbmc project.
> Until now I'm just started to work with it. So if you see any things/thougts
> which we have to talk, pls tell us...

Getting your kernel and u-boot patches upstream is something I support.

I suggest you rebase your tree on the latest upstream (v4.9), and get
it to boot with a simple userspace.

Once you have that working then I suggest we get the essential drivers
and architecture support upstream. This list might include serial,
irq, ethernet, and device tree. The code will require rework to meet
upstream kernel standards. You will also need to be come familiar with
the tools used by the upstream kernel; git, patches and mailing lists.
Read this documentation:

https://www.kernel.org/doc/html/latest/development-process/index.html

From there you can develop the rest of the drivers as you need them.

Alistair (on cc) is the upstream maintainer for the PPC SoC the FSP2
is based on, so your patches must go through his process before being
merged by the PowerPC maintainer, and finally hitting Linus' tree.

The u-boot work will be a similar process.

Cheers,

Joel
