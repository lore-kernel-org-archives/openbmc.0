Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x241.google.com (mail-qg0-x241.google.com
 [IPv6:2607:f8b0:400d:c04::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rN3Vf5bdhzDq7w
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 02:40:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=gUF3kD79; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=IbJbcoX0; 
 dkim-atps=neutral
Received: by mail-qg0-x241.google.com with SMTP id p34so5144752qgp.0
 for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2016 09:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lW+qebg8Fk7IT7cw+ArNJlSVepF79nyatM4z7VZVu/0=;
 b=gUF3kD79NfDg+PPhsmO9XU8NzHmZlku8NCoxIf4+WIhvNxoOPhFzgX2T4L5D/yzEsV
 vg2gOFCwTKE28XerKEiy7Iuie3HdjsKjZqep4A6oLi1dVkmHC48uDribzKm0EHGolx13
 NrUDl+ceK+UUvR4y/LffQH8KlMl9K3W47ORDbOkjP2kPMasKXzfgIAETNPYDnt1nNriZ
 7NE+4q992Sh4gR7QHZrOE5cc3BoPtT1U12V0REmTXtvBCrci//fC9un52XWfday33Jeq
 E8qhvN2uMhkNXu0fpBcSwOhL9GIde9EfWKMNMhmcFMWaEWZoIGaPfRyrYg/ZyA4I5iuT
 wgFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lW+qebg8Fk7IT7cw+ArNJlSVepF79nyatM4z7VZVu/0=;
 b=IbJbcoX0NfqebcfoXPIT3w67V33KyK180SY0nHeYfBxtIBNBCmbUnVJ0kxQAB3HHKv
 yAoUr4rSGVd7CovrnCJnpR+H6wAu0oYFT54C6WZy6XMMbQLOiV+N4Vwrdg0BomEyImdC
 NCEaIVbP85DGemW3cY01cYBxhP+mAONlQK1EE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=lW+qebg8Fk7IT7cw+ArNJlSVepF79nyatM4z7VZVu/0=;
 b=FcW0tJHmFS/ukeQXg8QSpimHkM60sUvt2KHRa9hfY2cUqTg9fpKjZOuXUJ1uImPeup
 m9GS/7dHqMjrNxxRWRClO29KBIcFe18F95KKVyvh0h8Fs5llE5o/n0rtu1OFj0tDapCe
 YIQRQ+MX7R22z3JcIns/RTN88uxcCH4a8drKoGmQVbUSQHheK1wzGl2ks+7PniaZJTvz
 h8fAZiWG+x8Tj7agNqc/pKjqKRr3vPRHKXRM/ssO4j84Z5ERCTiJD7bHVAbG/Z+DgtHg
 Qz1Zw6AKzZzVAXvPcfzfL4o7bZpft7CbdxoY1Da0SGwBFN8UFSIbIblvQGR+ahkay2s2
 7A1Q==
X-Gm-Message-State: ALyK8tK5RIJQXqBeFumzygTFV3Mc+YA61ieCWdacaW2iU+ETn5P/JM8i20R8HXgGLfNdexilaAoW0O9H+P77bg==
X-Received: by 10.140.221.135 with SMTP id r129mr12290635qhb.59.1465144853898; 
 Sun, 05 Jun 2016 09:40:53 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.44.196 with HTTP; Sun, 5 Jun 2016 09:40:34 -0700 (PDT)
In-Reply-To: <20160604052039.6581-7-openbmc-patches@stwcx.xyz>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
 <20160604052039.6581-7-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 5 Jun 2016 11:40:34 -0500
X-Google-Sender-Auth: KcKd7ohxEzgoX7yfMbJ98Ecm9rY
Message-ID: <CACPK8XeSGjPNhXBvvRigQJ8eE3YWmJ3WmgGcR782crw6Wek6tg@mail.gmail.com>
Subject: Re: [PATCH openbmc 06/10] Move static kernel recipe configuration to
 include
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2016 16:40:59 -0000

On Sat, Jun 4, 2016 at 12:20 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> This facilitates multiple kernel recipes.
>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>  .../common/recipes-kernel/linux/linux-obmc.inc         | 18 ++++++++++++++++++
>  .../common/recipes-kernel/linux/linux-obmc_4.4.bb      | 18 +-----------------
>  2 files changed, 19 insertions(+), 17 deletions(-)
>  create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
>
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc b/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
> new file mode 100644
> index 0000000..c64ff9d
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Linux kernel for OpenBMC"
> +SECTION = "kernel"
> +LICENSE = "GPLv2"
> +
> +KCONFIG_MODE="--alldefconfig"
> +
> +KSRC ?= "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"

Can we tell poky to download a tarball instead of waiting for it to
check out a git repository?

> +SRC_URI = "${KSRC}"
> +SRC_URI += "file://hwmon.cfg"

As I commented in another patch, I'd prefer we weren't spreading our
configuration all over the poky tree and instead it was all in one
place.

Cheers,

Joel

> +
> +LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
> +
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +
> +COMPATIBLE_MACHINE_${MACHINE} = "openbmc"
> +
> +inherit kernel
> +require recipes-kernel/linux/linux-yocto.inc
