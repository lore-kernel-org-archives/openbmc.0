Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AECFlWbF"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qqR06Q7xzDqdW
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 07:03:24 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id y12so382435plk.11
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 14:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uXn6U8t8PaC+aSdCvNtmmpwBfV4O/+VHrL4o6URwT/0=;
 b=AECFlWbFvMnPHkiJ3ejqQVkPhpwQeOkpk2vh4NWuByAcq79DsiKDKff7jpH+JNOF6n
 G/xI2FKNq2529PceZvsUJbTB7+6IXN/+znILHFg3D1/Z1qeeoqhPnQyBZITS6FXwFzys
 oWBQRxPCynovAtqGSp8FWzgRt8usnG/BYltpgdl4bJxH2NjdkESfVN/Zy/SvCpBiW6nn
 9Y56w7r+1mbHA8IJmJw5QUnPnmzbviApS2ru+VfdbKEPRl7dyGSfoCo8DRueWbkbge1Y
 zS14DWufaQIoGD9g/JOdpRakroq6MASUTYJDHBQ0lzuxv4CyVmOdmQz4MtDMEk/QFqZI
 N66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uXn6U8t8PaC+aSdCvNtmmpwBfV4O/+VHrL4o6URwT/0=;
 b=TsCRu/ux9EEucyZQAQiRkRXGm2w+9uajkcPtwGZvWPcHTLs5+OyLxZFLTvRD1kB/N0
 J0SlAkVSCxrGXT0vwrdjA8/EGIIbXBOYcKXcJYPUMxFX9oHebUfSnP+tvLEaEB1jzIFI
 SjYUYVeFpK8N2Ta5Ut/86pzSeqtyyUU7KlxfA2wTT2sQmYSf0QXk4rqaIt1zUqt2Mkot
 LdHbiNEe0KfIXvrzmmmKsiA7Ov0CFUlUjnkzefF/ZNGF0RxD0AoZOhcfcXmPx8DZaf7q
 60e3PoTdWXXSOn50YOcmYBD3QpYAF6sEmdstIC+UEXvgJ/zuEKX/ckcKWvhx/Xmcq5n7
 0AtA==
X-Gm-Message-State: APjAAAVSLmXTmpCjYTb7+hNt0XTZILGTzYc1ZxGxLF8ZTGiW7meol9Jw
 HLoTkWlcTcy5c21hgNF+g2BIWql4JfVWDi1bDTFIkw==
X-Google-Smtp-Source: APXvYqypKtiAqOX/cTLV9bsRSLT2zvks8JQGjXPtFRaYsRs61aJYJRU8xxyKUcTQ/mnmSNsUa3rVxi78OUfFvGZKSaQ=
X-Received: by 2002:a17:902:7d8f:: with SMTP id
 a15mr41044240plm.3.1556226201064; 
 Thu, 25 Apr 2019 14:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190425205254.95368-1-venture@google.com>
 <CAO=notyvfKiYShxHbLcPpkFfkyoDowxAv7jRs9qTtEijQs83sg@mail.gmail.com>
In-Reply-To: <CAO=notyvfKiYShxHbLcPpkFfkyoDowxAv7jRs9qTtEijQs83sg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 25 Apr 2019 14:03:09 -0700
Message-ID: <CAO=notz5H8nGTzug+YkAbRu+_KpMXr35MokRDzaYpNMkhZjuOQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 25 Apr 2019 21:03:25 -0000

On Thu, Apr 25, 2019 at 2:01 PM Patrick Venture <venture@google.com> wrote:
>
> On Thu, Apr 25, 2019 at 1:52 PM Patrick Venture <venture@google.com> wrote:
> >
> > Fixup compiler warnings:
> >  - 108 warning: ISO C90 forbids mixed declarations and code
> >  - 264 warning: unused variable 'value'
> >  - 335 warning: unused variable 'res'
> >
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Patrick Venture <venture@google.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > (cherry picked from commit 2d1c31cb642b44e3d621643b8d30e15e5e4df4e4)
> > ---
> > v2:
> >  - First instance of this patchset on the chain, no changes.
> > ---
> >  drivers/misc/aspeed-p2a-ctrl.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/misc/aspeed-p2a-ctrl.c b/drivers/misc/aspeed-p2a-ctrl.c
> > index c0521b2ffc6a..9736821972ef 100644
> > --- a/drivers/misc/aspeed-p2a-ctrl.c
> > +++ b/drivers/misc/aspeed-p2a-ctrl.c
> > @@ -99,13 +99,14 @@ static void aspeed_p2a_disable_bridge(struct aspeed_p2a_ctrl *p2a_ctrl)
> >
> >  static int aspeed_p2a_mmap(struct file *file, struct vm_area_struct *vma)
> >  {
> > +       unsigned long vsize;
> >         struct aspeed_p2a_user *priv = file->private_data;
> >         struct aspeed_p2a_ctrl *ctrl = priv->parent;
> >
> >         if (ctrl->mem_base == 0 && ctrl->mem_size == 0)
> >                 return -EINVAL;
> >
> > -       unsigned long vsize = vma->vm_end - vma->vm_start;
> > +       vsize = vma->vm_end - vma->vm_start;
> >         pgprot_t prot = vma->vm_page_prot;
> >
> >         if (vma->vm_pgoff + vsize > ctrl->mem_base + ctrl->mem_size)
> > @@ -261,7 +262,6 @@ static int aspeed_p2a_open(struct inode *inode, struct file *file)
> >  static int aspeed_p2a_release(struct inode *inode, struct file *file)
> >  {
> >         int i;
> > -       u32 value;
> >         u32 bits = 0;
> >         bool open_regions = false;
> >         struct aspeed_p2a_user *priv = file->private_data;
> > @@ -332,7 +332,7 @@ static int aspeed_p2a_ctrl_probe(struct platform_device *pdev)
> >  {
> >         struct aspeed_p2a_ctrl *misc_ctrl;
> >         struct device *dev;
> > -       struct resource *res, resm;
> > +       struct resource resm;
> >         struct device_node *node;
> >         int rc = 0;
> >
> > --
> > 2.21.0.593.g511ec345e18-goog
> >
>

strikethrough-start
> I had submitted this as a fixup! patchset upstream, and it was applied
> as such and so yeah, it's squashed.  Let me try v3 and it'll be back
> to the two patches but with fixed up notes.
strikethrough-end

Caffeine is starting to fail me.
