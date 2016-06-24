Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbNCY4RYKzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 12:52:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=QnpsfL60; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id r136so110024qke.3
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 19:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=QlufYVbGLQWQmeb1J0z58++wm3PvzOckeiOjDxOmXlg=;
 b=QnpsfL604wLGnxAKn+IOSrWICTIp/4t9O06hwcavWnG79wNC9wbXly+6r5OwKEDv+N
 yGF9ZgWpeBc7cAGCUFpef4P1LPci/yZLkWLrksUROCuHOSF2nejXFEI9IHu8irdxlCY7
 UeaUu3oN/x4XvzRp886gzLemk5B4SofHtq1DrW1GXamlMYzzLuUOW6Ucbh0eA1A8ngtH
 zMnj//SdbbQWT2AkvaizDvc65cAU1tavrSaPvVfgMK76IPUYfAJuAHPfsFATAfOWbJZ6
 Q//Zx18sXQe4wvsauACqdXs+UirGJsJ2nB/HQ7++YL3dqQ/uKPltPbJ/4Lp3LgYWZdqu
 H8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=QlufYVbGLQWQmeb1J0z58++wm3PvzOckeiOjDxOmXlg=;
 b=BFhMU4U2VxxqAYp3BH6uJOdJcGoerjZmnw1JQrInziaMviBM3vRnj+N5FDFpCEgdpi
 KuQQNhwlT9VnUwuq/ctLh4NAXRkJ4BRhek3XdCZZ/6DGLe9DQlN//1qM1rc+HFr9H7wz
 UJ8DzvNnGF3y4XnE47cnhSo6ZC1Gaq9XZj7x37kqrFsNBDCV+F+ZPZM7uXBN4YhZAKXn
 KjiadTNBLD1ONRsNn8fkrLtUTi9fTykmMzeSLOFofuE7N804V5I6EN1cy+7GLKwAGnlI
 ajG/MvhVKEvw6Jv6TDZo7+eem1psOvvDdDst+av3sDcloQwKk9ZkfjaHikH96SyE0y53
 bycQ==
X-Gm-Message-State: ALyK8tJhH6MD1hCd8R6z3L0/wuM5wSArM1mEtQEDzpteUtrFmERKZ7JxH98pqAbO96/s/BlMTK5Dhm39Vgwqlg==
X-Received: by 10.55.212.89 with SMTP id l86mr2054673qki.114.1466736727746;
 Thu, 23 Jun 2016 19:52:07 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 19:51:48 -0700 (PDT)
In-Reply-To: <20160623204033.13165-8-openbmc-patches@stwcx.xyz>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
 <20160623204033.13165-8-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 12:21:48 +0930
X-Google-Sender-Auth: ZdKRdeO96mDrBOaN1C24VxIBTqw
Message-ID: <CACPK8XfrNz=4W6bCJAJnxDGNt7dPD=zAHxRGj97XeW+cktecRQ@mail.gmail.com>
Subject: Re: [PATCH openbmc v5 07/11] btbridged: Change how kernel-source
 depend is specified
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
X-List-Received-Date: Fri, 24 Jun 2016 02:52:10 -0000

On Fri, Jun 24, 2016 at 6:10 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Patrick Williams <patrick@stwcx.xyz>
>
> As of Yocto commit 46cdaf1 we are suppose to use:
>    do_configure[depends] += "virtual/kernel:do_shared_workdir"
> Instead of:
>     DEPENDS += "virtual/kernel"
>
> Without this, the kernel source is not unpacked if you compile with
> the sstate cache and so btbridged fails to find the bt-host header.
>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
> index a1a32d9..f3a7003 100644
> --- a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
> @@ -15,4 +15,4 @@ SRCREV="39b3700766d851009258544aa0f75365f024c597"
>
>  # This is how linux-libc-headers says to include custom uapi headers
>  EXTRA_OEMAKE_append = "CFLAGS=-I${STAGING_KERNEL_DIR}/include/uapi"
> -DEPENDS += "virtual/kernel"
> +do_configure[depends] += "virtual/kernel:do_shared_workdir"
> --
> 2.9.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
