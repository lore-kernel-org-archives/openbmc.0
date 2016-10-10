Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssqn820s1zDsgc
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:23:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Xa+j1x91; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id b186so3733603vkb.3
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=9b4fivouxB2vj+vCpyKcFJN5TMuKGAjtC0oe4b1iI+Q=;
 b=Xa+j1x91xEi8JZ06WGXnl73adBKoknTBiyWCp4qi8NwW0MhjvYamR3N3qi7VXgZ+4x
 WSNtD6LSogYhCWrunH3yjcqO8YfukL1tNxvxq+czEepgHDVEzq+jBrkrJQPBpF1u47zB
 dLIWME+x2SHQgH0dusZklqlFdNruXIW4lxOtdzRZhdfbW9EzzVxnBmI0VIiUTzWXlm3E
 wj0WO2t14QWeY0Phi+i8KJRnDOY8IGnb6gTjPimVNSuz8ZCnZPcJvhJgjp2pe+C2feSw
 7li3gYUSwel0F6rKFm61E7fao6agGKJYWhuXqHxqdP4myJBmd4o2e75lqnCuoGEbpwr2
 UKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=9b4fivouxB2vj+vCpyKcFJN5TMuKGAjtC0oe4b1iI+Q=;
 b=i5ayTsj48Q72TU3i3evLa2pHQPtML0keqYGgzYIqO+OdF8Co1Hf8FAyiC3QCGssEKi
 XIi8SfTtyW6rDefjhZ07802he1X1QRL5javfCsDV56N/L/YMG9NAYIGrZ9h6ov+WteEh
 FRYIPJPdgKmEPu0R236+lvN8nFJnJcosEhd4sO9kYdSidakOAcC4SY3qliXlg9tzbfhb
 lOgGkJ8AFDIEwWr8csr8Uwm3SfJdBSM4ALSi9QSvuKbIUpyXYlyhkYoyPNsMyaTgePs5
 YVTh856G2VE7ktS6vifeE+UAH7Gxp3lRzjAcPPA267rlx10Lq0wbyWCXH4wh9XvOdjoe
 xHZw==
X-Gm-Message-State: AA6/9Rn+dkmK7SiZiKkXZ3kglWlIaS6AUEcxdjxAkXOSxT8RVRd6C9eGwQCk7tZaFXeoGDQhufu2/fcKiTujuw==
X-Received: by 10.31.166.208 with SMTP id p199mr1754416vke.145.1476080586083; 
 Sun, 09 Oct 2016 23:23:06 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:22:45 -0700 (PDT)
In-Reply-To: <1475789205-19618-6-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <1475789205-19618-6-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:22:45 +1100
X-Google-Sender-Auth: 4V216s33hGqnsGVb4sHgPEXF9Ds
Message-ID: <CACPK8XcwEk5V2wOZgGun=BizKS-5gLPQM7b4YrACL9s7_Ms2wQ@mail.gmail.com>
Subject: Re: [PATCH u-boot 05/12] aspeed: replace CONFIG_ASPEED_TIMER_CLK with
 CONFIG_TIMER_CLK_FREQ
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 10 Oct 2016 06:23:08 -0000

On Fri, Oct 7, 2016 at 8:26 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/mach-aspeed/timer.c | 6 +++---
>  include/configs/ast-common.h | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
