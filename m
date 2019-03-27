Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ks88QwYH"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Td7k509KzDqKR;
 Wed, 27 Mar 2019 17:17:06 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id t28so17550735qte.6;
 Tue, 26 Mar 2019 23:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KtzVbZWrpnwI/6w8sfxbOTMjlqGjaoVOplQYARCjTKY=;
 b=ks88QwYHbJR559S+WHeUMe4WgiOk9ILA8idxGdsKv9u5nSe8AYAEh8ocpHueXh/5Wf
 1gfW3NFNytPH64gAxAXrgJm3B0i/dc+baVwMSXrD67IuKpPDWTk0YfvT69ekj/R+gVab
 wkxSxDVAzbjjaw1JTId7imGDZDTXEj3wCZWf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KtzVbZWrpnwI/6w8sfxbOTMjlqGjaoVOplQYARCjTKY=;
 b=gAJpdkVA+JruY2qMBDytz9O5OiEhh09ur448URH+iLIgKSQGDyPatLlhm1e8oq+71U
 q+T2G6HB2Xt8pImaBL7dL3b7e5wHm/1LwjwQRKIuIy6y4XOrLqYcAcdcBraPn1UQJxyw
 mR6RRQzJ21/gYCzBPcg39t4mDLZgewJJd5BclRdH9qnsBG/FwpZ6dfTQN20+9eCGLR2E
 qOf+7XP3Bc1JfjcqvSjF9wfVR5PCV/Oc8ZXsMxkUzo2MqHwB2pv2dZaYNJvJPymQedht
 BCrO9qISFNqa4wd1ATBERwHRCC3cJTjj8EfegJPgnA511bGjAotSYtRI8ExTTuLLp1R5
 LKbg==
X-Gm-Message-State: APjAAAUS1byAm4RqCwkge1v05ps4MkDzJFoRGetxITs/V2FEVA82Hgwd
 L902te1pIPVAd+EtoUs4sVy4loM12fZOzylj3ts=
X-Google-Smtp-Source: APXvYqyzxY2zTMu8dUs6kv077CtJYDnkfXumZ/wMlBP7O0bbgBR4ADo1hxWdK7OqMZsiWsVtaXcRjh9noaAwmfQaRdw=
X-Received: by 2002:aed:3641:: with SMTP id e59mr28955888qtb.235.1553667424304; 
 Tue, 26 Mar 2019 23:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <1553610803-65797-1-git-send-email-anoo@linux.ibm.com>
In-Reply-To: <1553610803-65797-1-git-send-email-anoo@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Mar 2019 06:16:52 +0000
Message-ID: <CACPK8XfSPYxKJ6QJ6UkBEs69cH8E0COxk-BgcJbqfvsNsc4Tsg@mail.gmail.com>
Subject: Re: [PATCH] witherspoon.dts: Enable the USB vhub (device)
To: Adriana Kobylak <anoo@linux.ibm.com>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 27 Mar 2019 06:17:06 -0000

Hi Adriana,

On Tue, 26 Mar 2019 at 14:34, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> The Aspeed vhub device driver is already enabled in
> the defconfig, make use of it in the witherspoon platform.
>
> Signed-off-by: Adriana Kobylak <anoo@linux.ibm.com>

The patch looks good. However it would be good if the commit message
would follow the style used by other patches. Next time, do a git log
of the file and see how others format their messages.'

$ git log --oneline arch/arm/boot/dts/aspeed-*
2b66ba56dca9 ARM: dts: aspeed: Add Power9 and Power9 CFAM description
82545da4069b ARM: dts: aspeed: Rename flash-controller nodes
58e953107de1 ARM: dts: palmetto: Fix flash_memory region
3b1433fac7ec ARM: dts: aspeed: tiogapass: Add sensors
36b64bb6dfa2 ARM: dts: aspeed: tiogapass: Enable KCS
7dd7e19bed04 ARM: dts: aspeed: Add KCS support for LPC BMC

I've applied the version of this patch that Eddie sent, so it should
be all good.

Cheers,

Joel
