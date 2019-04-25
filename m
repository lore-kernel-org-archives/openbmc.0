Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Vv8eodbC"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qqPd4L3NzDqdG
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 07:02:13 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id g3so527319pfi.4
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 14:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F783rimEV+t3j/eEoXyp8fIFKhH1n7Ql5cNK+dr7Q98=;
 b=Vv8eodbC7UoBPDIMTe9JobaXB2eysdnO6J23aRzAQQG6sW5lKK/fLPLL0/VNi0jUFU
 6mxV7gdur1slMBLJJiz9cgfId5ryqQAOt32KEmalQN97W4qsknFA9mbYF1tWrH/BkuT5
 jfyENgWyT977nZdJ2EA8AKWFIhGcPT6/p/RpsFfjcHIdmh6Ax9bxNdFSD1y1o2aesT/W
 05OISCPIGqOaXbrf/Rfpecm33e5VUpuSQtyBjISr/cG/3k7K8TrdlTuzuM+ownkDu9H9
 6IInrKTe5fYmOWsiz0Z1d0QFOu8Q16ly+FZLQ3CgZCw4ApLVzCMp1v87bEsdEWcNa1mD
 GzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F783rimEV+t3j/eEoXyp8fIFKhH1n7Ql5cNK+dr7Q98=;
 b=GK3wLsdz9TMGC9ZIafTHxZ2xtO6R4BEakgUIiRh/QUUekGEBT91EhCQN0Oi65dA8lg
 cMYm7sDLp704Fd4flrpRMH+P+Y52BPjK80CXVKXBxYqs6nz9w73WrTgFlfv7yCg+UQlM
 TqM7/6hEfWqli8kp4ps0Y+w+1VySWNStoovcsnJB4FCCw1/TwcyOO1SzzDeJAceHEm8e
 7IbRBf81eL8SL712GLL7xkL9BRMnc42K6VrDa+QqCd54wpWJFMU2S8J/aPFKGnxVB55H
 oXyR4hahidqQO0DlzXXc0gjeAy3sqEpeNNQQMBj1PVrAIj2C8NOCQpGt4xZCM9JhhNyS
 hpCw==
X-Gm-Message-State: APjAAAViZDQwTdgj7ETvu+/SvqE8f+rBHoQI/lz1IEDOw5twLJgObF7l
 i0yktVhKIetgqg4+UctStwKK/PqcWszdlcwR9sq7Y5L7Z1k=
X-Google-Smtp-Source: APXvYqyod5qV3d4KTsJj13CbErqsb58ReoimtehnEkM8UQc1ThPzsL3Yte2G9SEDSd2QXp8HY+UGQgpwb8L/eXhk0io=
X-Received: by 2002:a63:e850:: with SMTP id a16mr39825954pgk.195.1556226128712; 
 Thu, 25 Apr 2019 14:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190425205254.95368-1-venture@google.com>
In-Reply-To: <20190425205254.95368-1-venture@google.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 25 Apr 2019 14:01:57 -0700
Message-ID: <CAO=notyvfKiYShxHbLcPpkFfkyoDowxAv7jRs9qTtEijQs83sg@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 v2 3/3] drivers/misc: Add Aspeed P2A control driver
To: Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Thu, 25 Apr 2019 21:02:14 -0000

On Thu, Apr 25, 2019 at 1:52 PM Patrick Venture <venture@google.com> wrote:
>
> Fixup compiler warnings:
>  - 108 warning: ISO C90 forbids mixed declarations and code
>  - 264 warning: unused variable 'value'
>  - 335 warning: unused variable 'res'
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> (cherry picked from commit 2d1c31cb642b44e3d621643b8d30e15e5e4df4e4)
> ---
> v2:
>  - First instance of this patchset on the chain, no changes.
> ---
>  drivers/misc/aspeed-p2a-ctrl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/misc/aspeed-p2a-ctrl.c b/drivers/misc/aspeed-p2a-ctrl.c
> index c0521b2ffc6a..9736821972ef 100644
> --- a/drivers/misc/aspeed-p2a-ctrl.c
> +++ b/drivers/misc/aspeed-p2a-ctrl.c
> @@ -99,13 +99,14 @@ static void aspeed_p2a_disable_bridge(struct aspeed_p2a_ctrl *p2a_ctrl)
>
>  static int aspeed_p2a_mmap(struct file *file, struct vm_area_struct *vma)
>  {
> +       unsigned long vsize;
>         struct aspeed_p2a_user *priv = file->private_data;
>         struct aspeed_p2a_ctrl *ctrl = priv->parent;
>
>         if (ctrl->mem_base == 0 && ctrl->mem_size == 0)
>                 return -EINVAL;
>
> -       unsigned long vsize = vma->vm_end - vma->vm_start;
> +       vsize = vma->vm_end - vma->vm_start;
>         pgprot_t prot = vma->vm_page_prot;
>
>         if (vma->vm_pgoff + vsize > ctrl->mem_base + ctrl->mem_size)
> @@ -261,7 +262,6 @@ static int aspeed_p2a_open(struct inode *inode, struct file *file)
>  static int aspeed_p2a_release(struct inode *inode, struct file *file)
>  {
>         int i;
> -       u32 value;
>         u32 bits = 0;
>         bool open_regions = false;
>         struct aspeed_p2a_user *priv = file->private_data;
> @@ -332,7 +332,7 @@ static int aspeed_p2a_ctrl_probe(struct platform_device *pdev)
>  {
>         struct aspeed_p2a_ctrl *misc_ctrl;
>         struct device *dev;
> -       struct resource *res, resm;
> +       struct resource resm;
>         struct device_node *node;
>         int rc = 0;
>
> --
> 2.21.0.593.g511ec345e18-goog
>

I had submitted this as a fixup! patchset upstream, and it was applied
as such and so yeah, it's squashed.  Let me try v3 and it'll be back
to the two patches but with fixed up notes.
