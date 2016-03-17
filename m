Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x22b.google.com (mail-ob0-x22b.google.com
 [IPv6:2607:f8b0:4003:c01::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQc9s5DSjzDqWl
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 16:20:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=nM0uiIqD; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=SuOlhFeD; 
 dkim-atps=neutral
Received: by mail-ob0-x22b.google.com with SMTP id ts10so73243351obc.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 22:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ka6M+B4cuGw835MAknqI1RlJcXlYxhOlBjaGT9BJir0=;
 b=nM0uiIqDSxW0M7XZ6gAh3LNZ6RJxsGl3o63s3HhJML+VOQZIzT/3SlHoa0q+o+LdUx
 v3b1CY7pGBlzHZXqlASIHoB4vNZwuXMlOzYS4as/OXIJey/2/j7dAbj6/6rkcH2vyrPI
 u4C3bv5GHMQg069jsJb9VSkgfCMfisVFWp96LkHvLWcJWS/MWO1e7Ravjo4G7RFni04Y
 SV9jGxzRNEqzdJCcbqMbOhk/WAZvFNEbhxUW0H5QBdTdKazl8pG0EzgU7d3KbQMagbc5
 2mcnNmw2Z6PLerXUq4hflUB3mCwuqqWxXoJFR48oREloxFC7YTbDCLKHk//Aah2AZJ9o
 Y04A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ka6M+B4cuGw835MAknqI1RlJcXlYxhOlBjaGT9BJir0=;
 b=SuOlhFeDkUwFxnIpCv8mp5+l5h/iGp0+Ks15DLG5a3ALsmUJrVUeW3+0mYFZWBeGSn
 Z8IyUKcN2jRgHNEGWY71015ZNSpesZ/gMRe1Oybq6WSmFsItP3Wk8+WVk2Avy+UlORBM
 y/x5XpMYUIKw1HHPRbjCUkD5JO9VRjtqQyKWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ka6M+B4cuGw835MAknqI1RlJcXlYxhOlBjaGT9BJir0=;
 b=IgZSn0PHw5ma0aFi0Pi6UJS2fYNIg4QUAOTMQa+K9OG7K63QODCLuMQBuMMcHJDhx7
 rJ621bhDM1DLLeYkqjegTva8TEVeu1R95jg6Klvx+sIcCk7M/xJZpUWdryMZYvTnEynA
 gU1Xao76HLtJ+msjGBzfGf9iwfdZo6wtBfL7qUw6RVgDDFZ518zQj5mj4qhXocGrJN70
 ERHYcEHBDUTs32JDY2bdRWb43NeFPE8i52rjuvMvnRlohB4C6wdgX8Uog67zdGJpGBPe
 S8sPCueDa/1UBxQZZ3iVMfxP97v37a3ElDzMIkYVFeYxrBsSAR92ip+49b9mEifkAgC9
 CIyw==
X-Gm-Message-State: AD7BkJIWjpwlLq0mmfC6BZEscbpMN496ArjeXvEkODfFd+WCXcJPrtWxUgBG1sMQtJTKOQZBTmhXOEt2HWU/Dw==
X-Received: by 10.182.65.138 with SMTP id x10mr4729053obs.39.1458191999358;
 Wed, 16 Mar 2016 22:19:59 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.246.10 with HTTP; Wed, 16 Mar 2016 22:19:39 -0700 (PDT)
In-Reply-To: <1458190368-24002-2-git-send-email-andrew@aj.id.au>
References: <1458190368-24002-1-git-send-email-andrew@aj.id.au>
 <1458190368-24002-2-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Mar 2016 15:49:39 +1030
X-Google-Sender-Auth: RqVcdGWSxoe7I92p5QHC8Lx6VfE
Message-ID: <CACPK8XfWpkJ8HEbK4wOzWGrcfccBdRKoumsoQboj772jrgzUKA@mail.gmail.com>
Subject: Re: [PATCH] runqemu: Add palmetto target
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Mar 2016 05:20:02 -0000

On Thu, Mar 17, 2016 at 3:22 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The patch does a few things, but is more for inciting feedback than for
> merging:
>
> * Adds qemu_git.bb in favour of qemu_2.4.0.bb
> * Configured to build from master, at the commit merging the AST2400 support
> * Adds a runqemu target 'palmetto'

This is a good idea. Fix up the commit message so we can merge it :)

>
> diff --git a/yocto-poky/meta/recipes-devtools/qemu/qemu.inc b/yocto-poky/meta/recipes-devtools/qemu/qemu.inc
> index f6c0ae3..80ba2ca 100644
> --- a/yocto-poky/meta/recipes-devtools/qemu/qemu.inc
> +++ b/yocto-poky/meta/recipes-devtools/qemu/qemu.inc

yocto-poky is supposed to be the upstream repository, and shouldn't be
patched by us.

I don't know how poky lets us override built in recipies with those
from other meta- packages. Can we carry your qemu-git.bb in
meta-whatever instead?

Patrick, do you have any suggestions here?


> diff --git a/yocto-poky/scripts/runqemu b/yocto-poky/scripts/runqemu
> index 23cf5be..f09da50 100755
> --- a/yocto-poky/scripts/runqemu
> +++ b/yocto-poky/scripts/runqemu

The changes to this script look like a good start.

> @@ -110,7 +110,7 @@ while true; do
>      arg=${1}
>      case "$arg" in
>          "qemux86" | "qemux86-64" | "qemuarm" | "qemuarm64" | "qemumips" | "qemumipsel" | \
> -        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
> +        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq" | "palmetto")

Perhaps call it qemupalmetto? qemupalmbmc? to match the existing ones.

>              [ -z "$MACHINE" ] && MACHINE=$arg || \
>                  error "conflicting MACHINE types [$MACHINE] and [$arg]"
>              ;;
> @@ -236,13 +236,13 @@ fi
>
