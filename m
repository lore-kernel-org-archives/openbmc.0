Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22d; helo=mail-qk0-x22d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vUqzKri3"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Uk4LsS8/"; 
 dkim-atps=neutral
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com
 [IPv6:2607:f8b0:400d:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4112Bb0kZDzF0WH
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jun 2018 18:38:29 +1000 (AEST)
Received: by mail-qk0-x22d.google.com with SMTP id d130-v6so3433256qkc.2
 for <openbmc@lists.ozlabs.org>; Wed, 06 Jun 2018 01:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=NvK92mzeK9r6CxPRe3YH5vtWNAYEn4F513A3yWiBzaI=;
 b=vUqzKri35c2p1PXO+arCwKwXje9Rj4tThhBhU2qZLYtaumCW98koFcHM7wJf6H7Olw
 ipSCXcTKjUh0Pof2LTiphBoX7zSe6A/yjdQhXuvrJKKiNtVuGdh+iugWkqQMgQinLY/m
 y/X/zxor8IQtg3adAS4lai8zdnZurXOC5NtZbbTBhJr8anTDTYCggP9XwAHEb/wqScNL
 u3fhkwyo2O1ibQixilvf5smVvn/ZHVuB0Strq8VFNmX96n3oC4gwgpkRpmpOfvWGWrGt
 SGtlVzlCb7rS1QkzIBH9xI6s8sF1fZeoNLh8vnZ617dMwWb1vj9COjCYYGvwQOoQE1rI
 jEnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=NvK92mzeK9r6CxPRe3YH5vtWNAYEn4F513A3yWiBzaI=;
 b=Uk4LsS8/dpGL+RrrhZKSS+ujVBC63wa7IPtiyi50do3FOEPthIKkEcL7XSkXKZM2Pp
 XdJlF7Nye6clhKC+xH004dDumdEwkEDnF1mDMc/JqZCFrGtjFL32BVnSNH1qlByctInF
 FLHHd3k3jRFGSowehCSSGR39vO2QQ0FtKzCTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=NvK92mzeK9r6CxPRe3YH5vtWNAYEn4F513A3yWiBzaI=;
 b=LWGeN/klCLWLenSoXZmonHYc8b3+Q28qt9dwWsoGyTQIzP8lAKLwk3HJLmYaHMLY9k
 t1km+2bjceSJvRuSicPMJf+95obaQXJ7JaOlsdEbZx/MzVdhPeAe9szcFdL0aZTehiM9
 K1hc7HBZbx7Za8MurCUQnJ9m05nZI/z5baV1gT9+ZuJ8gO4l6rvLbzvvT7OHYPH3p07F
 zNWJdk/F7V4owyUrFokdVS/Z3SxTOpZYZqQM/1i/CZcfsjqyYli9veMU2CxXWPRiMtvq
 q82/NU0EyMVk7m3M/3RmP3d1B1EnLjs00YTILT6QKKzJgh3FKp5nbQXigjbv0o5v6Vbx
 gL4Q==
X-Gm-Message-State: APt69E0/eHavUqngGvtwNK+RHHdTQu5UhoqMeTfyfirO/a+cVVlXgKZO
 EBncLJIfEkvgK1q+8rPN0OQoa8A8PKXrb7KaABg=
X-Google-Smtp-Source: ADUXVKJlLnXYc+2ac1iBSfauskwf0bE1r4n+4sMrQ2DJGDatJfTPXMkwjfg6e3UdIZ0Elj/84CX6c3FHmGeEtNES7vE=
X-Received: by 2002:a37:1286:: with SMTP id 6-v6mr1648227qks.158.1528274306364; 
 Wed, 06 Jun 2018 01:38:26 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP;
 Wed, 6 Jun 2018 01:38:05 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Jun 2018 18:08:05 +0930
X-Google-Sender-Auth: EXxYFxTkRiTFHNP8rC7LFwTuBa0
Message-ID: <CACPK8Xc=utavS8Q42fkcWmVuOcnDbgHAMTQA3peJuxzHOzNYng@mail.gmail.com>
Subject: Re: lpc reset questions
To: Eugene.Cho@dell.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 06 Jun 2018 08:38:33 -0000

Hello Eugene,

On 6 June 2018 at 01:58,  <Eugene.Cho@dell.com> wrote:
>    I was trying to follow the following submission  https://lkml.org/lkml/2018/2/19/12,
> so best I can tell is on Aspeed this "reset-simple driver" will just take the UART
> out-of-reset, because Aspeed automatically puts the UART in reset on LPC-reset????
> Did I get that right?

At power on, the aspeed ties the reset of UART1 and UART2 to the LPC
reset. I figure this is because they have a "SUART" mode, where host
SIO accesses are used to program the BMC's UART directly from the host
over the LPC.

This doesn't work for Linux on the BMC as it expects the device to be
functional when it loads it's driver. Hence, the simple-reset driver
pokes at the tied-to-LPC-reset bit, effectively taking the UART out of
reset.

Cheers,

Joel
