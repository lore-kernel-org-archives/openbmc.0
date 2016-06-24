Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbNBR6MHgzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 12:51:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Q632HtXx; 
 dkim-atps=neutral
Received: by mail-qk0-x244.google.com with SMTP id b136so18987855qkg.2
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 19:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gATCM45PUE4aANAshXxw3E360DDBR7X7vrd+W+0aznA=;
 b=Q632HtXxN2+nHbTFdPksRoXzwtuEZd1NWBpTnTPzXnaL7aOMr098SBeIaWrximvkIB
 d269fYYRnS1WNZeTzVvbL+vwydnMUcU7bEBDVXanb8D4KdCizNLeqGHQWuLTbKEievVw
 QsFWWM8PzHnECYcZprS5aGOx6v0aX4BGytRdXrMz9GPz6gHjzT84p9lnYEkLJwN9hBT/
 InIEyS0hiUg8q4iHRG/+wEGus8TAtnbzoq937dg0GD/cXRG3iqsK4KBWW0DhjqOIEB4V
 7zamjYi/zt94v94Z+NwJcEeJOQZtlwHVjt7OZfQOvQG2QIqYmkzOzNrhT4VOQzyDIE58
 RwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=gATCM45PUE4aANAshXxw3E360DDBR7X7vrd+W+0aznA=;
 b=O2pG8MlOsev3NF4oRgVQBH8O7UFY61vN1grRG9WfJIpWrtD1I3shmVH245FcP5WjJT
 I1tqUXrIHlCM22Buk5Y9DZ+xcHP9/Om6gcbNKxqhM+VHKfDpUsrfcZAZTkRWLJUGvsn6
 6DNJHIMSVoRD8roIkZ8C5ph91LvPVY0acbgJloq7eVQDnzCQ8jACYuWBFl/iECB3PaAt
 0WEshyxC35V7gepkNU5pRc9ymsz9EDrJScakmCGkxZo+mdLGtePXyIM9THGGtweKfveB
 ddYunidxV9uJ3S511NcKpvCJcfwn2YtK0XLR5TbRm0EYGRd6mTubWPQC7Lsx45Bnkpta
 huMQ==
X-Gm-Message-State: ALyK8tK3uP0spfK0ApctRiKfhp02jeW96gMtDytRH/odqvi3OTvFNTVU6VuOKgORUxUXI2faCHDYVG3ei/9BRg==
X-Received: by 10.55.53.145 with SMTP id c139mr2012620qka.58.1466736669927;
 Thu, 23 Jun 2016 19:51:09 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 19:50:50 -0700 (PDT)
In-Reply-To: <20160623204033.13165-11-openbmc-patches@stwcx.xyz>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
 <20160623204033.13165-11-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 12:20:50 +0930
X-Google-Sender-Auth: ODwmYBGKyn14MUChCsIacGdUbZY
Message-ID: <CACPK8XeC7Aj5Z2V0f-cCktMEfUdqeTKdgEMZsMv=gSD=rfS4rg@mail.gmail.com>
Subject: Re: [PATCH openbmc v5 10/11] u-boot: Upgrade AST2400 machines to
 2016.15 tree.
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 02:51:12 -0000

On Fri, Jun 24, 2016 at 6:10 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Patrick Williams <patrick@stwcx.xyz>
>
> Move 2016.15 tree to point at the latest openbmc commit and point
> all AST2400 machines to it.
>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>  .../meta-ast2400/conf/machine/include/ast2400.inc            |  6 +++---
>  .../recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend            | 12 ++++++++++++
>  .../recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend     | 10 ----------
>  .../meta-ast2400/recipes-bsp/u-boot/u-boot_%.bbappend        |  3 +++
>  .../meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend |  1 -
>  .../meta-ibm/meta-firestone/conf/machine/firestone.conf      |  2 +-
>  .../meta-ibm/meta-garrison/conf/machine/garrison.conf        |  2 +-
>  .../meta-ibm/meta-palmetto/conf/machine/palmetto.conf        |  2 +-
>  .../meta-barreleye/conf/machine/barreleye.conf               |  2 +-
>  .../common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb     |  4 ++--
>  meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb    |  4 ++--
>  11 files changed, 26 insertions(+), 22 deletions(-)
>  create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
>  create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_%.bbappend
>
> diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
> index 8510a03..d67959a 100644
> --- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
> +++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
> @@ -4,10 +4,10 @@
>
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-obmc"
>  PREFERRED_VERSION_linux-obmc ?= "4.4+git%"
> -PREFERRED_VERSION_u-boot ?= "v2013.07+git%"
> -PREFERRED_VERSION_u-boot-fw-utils ?= "v2013.07+git%"
> +PREFERRED_VERSION_u-boot ?= "v2016.05+git%"
> +PREFERRED_VERSION_u-boot-fw-utils ?= "v2016.05+git%"

Should this be the branch name? The branch is called v2016.05-aspeed-openbmc.

> -UBOOT_MACHINE ?= "palmetto_config"
> +UBOOT_MACHINE ?= "ast_g4_config"

As I mentioned in my status update, I didn't do the best job of naming
the defconfigs. ast_g4_config is for ast2400 systems that use NC-SI,
which means it's no good for firestone or the facebook machines.

Do you want me to rename the config ast_g4_ncsi_config? Or leave it
for now, and we can clean it up once the u-boot tree is in order.

I would lean towards leaving it for now as once u-boot is cleaned up
to use the Kconfig system, we can have the yocto machines select the
option they require.

>  UBOOT_ENTRYPOINT ?= "0x40001000"
>  UBOOT_LOADADDRESS ?= "0x40001000"


> diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/machine/firestone.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/machine/firestone.conf
> index 42f2d29..fa0d35e 100644
> --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/machine/firestone.conf
> +++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/machine/firestone.conf
> @@ -5,7 +5,7 @@ require conf/machine/include/ast2400.inc
>  require conf/machine/include/obmc-bsp-common.inc
>  require conf/machine/include/ibm.inc
>
> -UBOOT_MACHINE_firestone = "palmetto_config"
> +UBOOT_MACHINE_firestone = "ast_g4_config"

As above; firestone uses a dedicated phy instead of NC-SI. Machines
won't have network if they update to this.

I can add add a new system to u-boot, or I can send a patch that hacks
at the machine.

>  UBOOT_ENTRYPOINT = "0x40008000"
>  UBOOT_LOADADDRESS = "0x40008000"
>
