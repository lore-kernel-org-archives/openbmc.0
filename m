Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="fQ6Z+hM+"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Td5B2shBzDq9V
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 17:14:54 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id z17so17489708qts.13
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 23:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B5zKcGbYOwZXiHfyWza9OCk7PmUKicXCVvwmoWNH66A=;
 b=fQ6Z+hM+StBPnZR13Sl5rBKZfUscP6jnOcwO9r5PcKEBZF7EbpFF7iQJEY8ylmGLXn
 ni1rdB5f4//EDjX3dNc26Gzvi8m8IE0TFCJUpJS2wlC+VrLTAdkVT3+Qx2Ye4mSNvBx2
 189JGnaO5yLUs4XRaKI06kaDB3OIJWJ8x7G2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B5zKcGbYOwZXiHfyWza9OCk7PmUKicXCVvwmoWNH66A=;
 b=bRTmh6BuEUbprc3tKD/wI9ffBfvdtSavq+/Zn1Kv63sLPJAAxFWsW6K4MBlCKjlp07
 RLcGC9l1OZKPwSSHZRWo+CMpYetH3Z5gha62Vz//VbOLYK92GzhnGc5MpSzJTlGR/2Z0
 f60EW7rLxa+P4C+K2mDMxJ/loYn3QJnPX3KAhsS+ORlO3qg+4OpAM1ne3VhLVE7ogdz6
 rO9KwUOA1Dv9/GkVVY9AaRiYqcRwkBHKJwJ5inzcBckhz8wmhbhOMojJbAfeC7GGNHPC
 YaFprxnAsx0z9wX+rpBxWEkFzxhiXP4tUTS5IgXe17m3dQRPGYsAnmUkh9JcK+0QBf2j
 Dj1g==
X-Gm-Message-State: APjAAAXl7DO8nnpwPb0SglMZnwIbGhmBcQZTQE/+qFg8OCj6O3ew9cLI
 4AGiBFKIplcEneYKEszel7ZyffIJPgeHKz5pOQ4=
X-Google-Smtp-Source: APXvYqwCG0+yKeeskkOQ/X1q5myuNuuEc7ZKVmKxFXFjWxm43ln4dvhRmlHnPibFj5ov3K3d00GmZ4lKR8loNfO8acU=
X-Received: by 2002:ac8:3687:: with SMTP id a7mr27034565qtc.284.1553667291995; 
 Tue, 26 Mar 2019 23:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <1553196610-29595-1-git-send-email-eajames@linux.ibm.com>
 <1553196610-29595-7-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1553196610-29595-7-git-send-email-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Mar 2019 06:14:40 +0000
Message-ID: <CACPK8Xcv5ijaqFX3JVFyQ7teWn52AG5c=6wV==5D08yB8_R4tg@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 6/7] ARM: dts: witherspoon: Enable vhub
To: Eddie James <eajames@linux.ibm.com>, Adriana Kobylak <anoo@linux.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 27 Mar 2019 06:14:54 -0000

On Thu, 21 Mar 2019 at 19:30, Eddie James <eajames@linux.ibm.com> wrote:
>
> Enable the virtual USB hub.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

This seems unrelated to the video engine series. I've applied it to
dev-5.0 as the commit message is good.

Cheers,

Joel
