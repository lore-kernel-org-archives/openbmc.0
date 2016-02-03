Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 59D951A007F
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 12:08:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FWuWmLZF; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id gi1so217556pac.2
 for <openbmc@lists.ozlabs.org>; Tue, 02 Feb 2016 17:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=13Vd6zT5NnXiokJtRUEjGEakHm0eSmg8+PEQLRIsbj4=;
 b=FWuWmLZFBJobpVardVWY9Dt6HMZB1H5scRT/2xFsS+oDe4d0ewC/pfkslgEEVTDfqN
 vpLDYnaVC55LmlvveX57uJNcKDtiQTToCVp5xet8ji1LcqdZPZD3+1SNMHPKW6/w9Lu1
 /+TLYaARE6biatyquhk4WjG6vwJjcEq/ikAxHu5JpDcPZ9hnvjCrT68wRXRUEJkFF90z
 JDkkY8gj4BQ0ZiVDMgtfqMgTiICW8o969r0AB7ASvMi7PoQ9dsFX8oJlK+VQx6xgfSU+
 b1r68+ijdNpzhNKAjPWAghuFnw4ZKWDUv0GMcPGF7HFmgeeVd8G89AR7QiR1iNwUAlhP
 oz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=13Vd6zT5NnXiokJtRUEjGEakHm0eSmg8+PEQLRIsbj4=;
 b=OYB1rkNxr7tQHJyfdtL+i026x/IIjZwsfAHzJ42E72XsXxWYqEtj2YX+rTHczh4d5G
 WLVQ0aB4tywh29v0kI7zjhWPT9i/6lsYvF3GTyMgliNBQnVoX9dq9uCWBNyJWOX2l73j
 iqVcXtSu/DCwV+1UrqbYUvAkF9EGR6apERt+sh/JkydX5Mdqd+kVgFGnnQlVSMUCVJI5
 /U7UOVi6GBWBiiQ6q+pptX6ceFWuePUsAOoipwkGM/MtRE/o1gUgjJxgj8ixaS90q3gW
 N4U55iC2EVHL7JhBIk+/aphCKNKeGr1f4NzIT2XsOZPkCQPuemWnt+JsMEM22HtTR0OD
 j4WA==
X-Gm-Message-State: AG10YOTRDW5VW5CeBdR88FH5mY9Fm0hvMjam3MoRAxhn5vTKwmCTzTt6FsY8vdPZIm42/A==
X-Received: by 10.66.255.39 with SMTP id an7mr52024322pad.101.1454461723649;
 Tue, 02 Feb 2016 17:08:43 -0800 (PST)
Received: from camb691 ([138.44.251.171])
 by smtp.gmail.com with ESMTPSA id a21sm5316359pfj.40.2016.02.02.17.08.41
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 02 Feb 2016 17:08:43 -0800 (PST)
Date: Wed, 3 Feb 2016 12:08:41 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, anoo@us.ibm.com
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc 1/2] Update recipes
Message-ID: <20160203120841.6aabf916@camb691>
In-Reply-To: <1454386220-10574-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454386220-10574-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454386220-10574-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 03 Feb 2016 01:08:46 -0000

On Mon,  1 Feb 2016 22:10:19 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Adriana Kobylak <anoo@us.ibm.com>
> 
> ---
>  meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb | 2 +-
>  meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
> index 5eed1f4..06ee00e 100644
> --- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
> @@ -18,7 +18,7 @@ TARGET_CFLAGS += " -fpic -std=gnu++14"
>  
>  SRC_URI += "git://github.com/openbmc/ipmi-fru-parser"
>  
> -SRCREV = "63696f4b23c9fd0a84ce539a6414ada406aaf229"
> +SRCREV = "a14239a201443222906864273449a39cfa84118e"
>  
>  FILES_${PN} += "${libdir}/host-ipmid/*.so"
>  FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
> diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> index e74a6de..068d395 100644
> --- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> @@ -18,7 +18,7 @@ RDEPENDS_${PN} += "settings"
>  RDEPENDS_${PN} += "network"
>  SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
>  
> -SRCREV = "e90d8bf6a342649dba2fd1589a3cddb3cd051bb1"
> +SRCREV = ""
>  

Does this not break the build?

>  S = "${WORKDIR}/git"
>  INSTALL_NAME = "ipmid"
