Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rr19N2cRHzDqxj
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2016 02:19:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=OfxsGTRp; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id q62so5001584qkf.2
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2016 09:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+aPc7esU3wDxQrlXjohriSMK7Fkq9/Jomgeu6kkP42E=;
 b=OfxsGTRpVWIXhBA+9eNnTmoEOumeoNponFQWlZU2gFEptjaIjo26sE2qib9nQspsnB
 WKIw4gwybaDGAU64YLGBA5gYvM5DOcOmq/M6C/+CUvhRVwmqHxdSOlHbzb63TeDdVytO
 FjTCNXYzbOzAXZfBbGxdslVYDGK4eo5Gpp+k7VvKt14v9Kr9Ootlp+aKGdW4hjxC+NbK
 ucTSJcdLwZxOmon0Kfh45cBq0TWYHHCzsmE6MNRS45xRt1jzH4xDoZWEeFAJbRKI9IrX
 6/2hwhaE0LSHlC4y+DXq9SRJVlXTrF7pS2tjOftA/T7DogmMQXzUcrCfG7EKwR8cWpD9
 rpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+aPc7esU3wDxQrlXjohriSMK7Fkq9/Jomgeu6kkP42E=;
 b=QyfKDmJscx6FBF8OluQ6H5l4ruNgsXtIYOcNNt/JvLxalFKRKXygZRPuSaj8oZ/c1C
 jJ4kftrkblQeNVXiyqxtUonaqI+GDucK1sjWOsQXjy22UnlDQZyfgCY/fhsYJhlfnKjS
 +99XZ5yCUVOQp9wuu7oRfXKk1IprZokKAmqOubcV1MibFGJYnHCRVvPrzes45tRQCvoY
 H499YZcbCRlyvbELhJ9+kpj5gWFAdlT5J9aFzgZ7G8juvSxCexQyizPmehesLfco2jLb
 RLzxfKp4m8OTTt8uHF+W9FTgIfAtZXOfjOLavi/XKTMKM6yhxx2TADh2Gg4z1D2XG+s/
 TJHg==
X-Gm-Message-State: ALyK8tJ5jxuKCbdAjLt5GcjLlKPw0wosjbROtFeOHRRwL7jaUzlRB8Ji5pSoRrbrBDoQN9QS8WBnoAVE0G05zA==
X-Received: by 10.55.15.27 with SMTP id z27mr18743433qkg.58.1468513141704;
 Thu, 14 Jul 2016 09:19:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.141 with HTTP; Thu, 14 Jul 2016 09:18:42 -0700 (PDT)
In-Reply-To: <20160713202012.10446-2-openbmc-patches@stwcx.xyz>
References: <20160713202012.10446-1-openbmc-patches@stwcx.xyz>
 <20160713202012.10446-2-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Jul 2016 01:48:42 +0930
X-Google-Sender-Auth: y9ez2DIFff_3m3zPkYbf1shWfkk
Message-ID: <CACPK8Xd3A0VMdEGYv3T8mS9q614xjCB49a15qS-amph8OpnihA@mail.gmail.com>
Subject: Re: [PATCH docs] Enhancing instructions on QEMU
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 14 Jul 2016 16:19:05 -0000

On Thu, Jul 14, 2016 at 5:50 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Chris Austen <austenc@us.ibm.com>
>
> Added step by step details on using QEMU in both a virtual
> bridge and tap environment.  Latest features of QEMU palmetto
> integration now allow for uboot flash support and ftgmac100
> device support.  That means you can start the qemu session
> from uboot and run the real ftgmac ethernet device.
>
> Signed-off-by: Chris Austen <austenc@us.ibm.com>
> ---
>  cheatsheet.md | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>
> diff --git a/cheatsheet.md b/cheatsheet.md
> index 873fbf9..37a9c60 100644
> --- a/cheatsheet.md
> +++ b/cheatsheet.md
> @@ -105,6 +105,65 @@ qemu-system-arm \
>
>  To quit, type `Ctrl-a c` to switch to the QEMU monitor, and then `quit` to exit.
>
> +## Using QEMU With Network capabilities
> +
> +In an attempt to get a palmetto working model with network capabilties a fork
> +was created.  The plan is to merge it back in to the qemu repo but for right now
> +the steps required to build, launch and verify are as follows.
> +
> +Compile a Palmetto flash image via Yocto and locate the file...
> +>build/tmp/deploy/images/palmetto/flash-palmetto
> +
> +```
> +git clone git@github.com:legoater/qemu.git

I support the idea of better documentation on how to use Qemu.
However, this is Cedric's personal development tree. I'd be hesitant
to point users at this - it's his space for doing development, so at
any one moment it may be broken.

We are aggressively upstreaming our Qemu code. I'd suggest pointing
users to upstream for their testing.

Cheers,

Joel

> +cd qemu
> +git checkout aspeed
> +mkdir build
> +cd build
> +../configure --target-list=arm-softmmu
> +make
> +cd arm-softmmu
> +```
> +
> +### Use a bridge device
> +Using a bridge device requires a bit of root access to set it up.  The benefit
> +is your qemu session runs in the bridges subnet so no port forwarding is needed.
> +There are packages needed to yourself a virbr0 such as
> +```
> +apt-get install libvirt libvirt-bin bridge-utils uml-utilities qemu-system-common
> +```
> +
> +```
> +./qemu-system-arm -m 256 -M palmetto-bmc -nographic \
> +-drive file=<path>/flash-palmetto,format=raw,if=mtd \
> +-net nic,macaddr=C0:FF:EE:00:00:02,model=ftgmac100  \
> +-net bridge,id=net0,helper=/usr/lib/qemu-bridge-helper,br=virbr0
> +```
> +
> +### Use a tap device
> +When running in an environment that does not support you having root you will
> +need to forward the model ports.
> +```
> +./qemu-system-arm -m 256 -M palmetto-bmc -nographic \
> +-drive file=<path>/flash-palmetto,format=raw,if=mtd \
> +-net nic \
> +-net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostname=qemu \
> +
> +```
> +Now you just need to redirect to communicate...
> +```
> +curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST https://localhost:2443/login -d "{\"data\": [ \"root\", \"0penBmc\" ] }"
> +```
> +or
> +```
> +ssh -p 2222 root@localhost
> +```
> +
> +There are some other useful parms like that can redirect the console to another
> +window.  This results in having an easily accessible qemu command session.
> +-monitor stdio -serial pty -nodefaults
> +
> +
>  ## Booting the host
>
>  Login:
> --
> 2.9.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
