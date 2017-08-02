Return-Path: <arndbergmann@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMy3j4YN6zDqn8
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 01:37:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KxfLqasA"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id e124so5998761oig.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 08:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=JR3jy6kN2QedtR7isj8rzdXiP7fTW/8B3Ehr8KbbbE0=;
 b=KxfLqasANJkhQuRYCb91cv3Vbhomn8pYNLE5ZeqTArLhrC2xbfJ3RJ72g6ebNwbqWk
 /Oyko0o+xGS4e22eNz24tPCb9CPa9AigTQhc9lhsVLz15Cw0kUGyxnWa1Zz/xRKraj3Y
 CIBz3YyIcjFvNgBkuJ0UJFdIOnIsmeATGOtGiQZIpU2ytv0pYfntqxlL62HgqLtMTuZW
 mYPOn61sMiIz27Ge7rVJJpnwksgqvHTS7JCk4POL0IreD3FMcjRJ/WE3FQ6+XPTc+k6m
 HoxozlkWVfnTLiEyjcu7JM6YvXfEOr4DbPXqjiHm1acY1OG5TzidqP6BZvRQzCGzvKee
 QzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=JR3jy6kN2QedtR7isj8rzdXiP7fTW/8B3Ehr8KbbbE0=;
 b=V4YMd/JAKX8/7NAsWzd3iniS/AJG4Z4OD3ByXboveIWU/jKfjXCyao3evNjk0Ao68J
 l0NPi3hdHkxgCQCs5RmKg0l6ZDsg77mGkSf4C8NQizhipp5tLX4moD6smoufKCgfpMW+
 PGCsA0JwpWQGzdYSj1Tw3JuVZrVG+/WlRU7PmB8NXWL5z6h02HdyDMzsy2tVUCUluPYX
 +JmAnOnXUTg1C2CrtFCZRMbhvyGEGej99CXwM8w+oH5NXCIMI05B35HFwQnzg8a1oSoF
 +jkhij8X/QbcK4VPzrjMZreocQjIWlVbsgUE68JY2V0MNMP1pI4Y4UiA5A8dUTyqPcc7
 EmyA==
X-Gm-Message-State: AIVw112N1IZdpCZYGUEz/DGrL8OkzUnKO9bLKynIgAnGBE0dnJ5c8ji9
 /xdAodv7+GgZOIv5Cmp/m388TU/sVQ==
X-Received: by 10.202.217.9 with SMTP id q9mr13674659oig.198.1501688223727;
 Wed, 02 Aug 2017 08:37:03 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.182.29.34 with HTTP; Wed, 2 Aug 2017 08:37:03 -0700 (PDT)
In-Reply-To: <1501679918-20486-2-git-send-email-oleksandrs@mellanox.com>
References: <1501679918-20486-1-git-send-email-oleksandrs@mellanox.com>
 <1501679918-20486-2-git-send-email-oleksandrs@mellanox.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 2 Aug 2017 17:37:03 +0200
X-Google-Sender-Auth: d7U1tqh8OZaNEdoSzuzFD3eso2E
Message-ID: <CAK8P3a1tEcDV2yTJoWcKwoM1=+NS0AgyckHappSGN5aCajkkeQ@mail.gmail.com>
Subject: Re: [patch v1 1/2] drivers: jtag: Add JTAG core driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: gregkh <gregkh@linuxfoundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, 
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org,
 mec@shout.net, vadimp@maellanox.com, system-sw-low-level@mellanox.com, 
 Jiri Pirko <jiri@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 02 Aug 2017 15:37:06 -0000

On Wed, Aug 2, 2017 at 3:18 PM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:

> +
> +static void *jtag_copy_from_user(void __user *udata, unsigned long bit_size)
> +{
> +       void *kdata;
> +       unsigned long size;
> +       unsigned long err;
> +
> +       size = DIV_ROUND_UP(bit_size, BITS_PER_BYTE);
> +       kdata = kzalloc(size, GFP_KERNEL);
> +       if (!kdata)
> +               return NULL;
> +
> +       err = copy_from_user(kdata, udata, size);
> +       if (!err)
> +               return kdata;
> +
> +       kfree(kdata);
> +       return NULL;
> +}

You can use memdup_user() here to simplify this, or just change the callers
to use that directly.

> +static long jtag_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +       struct jtag *jtag = file->private_data;
> +       struct jtag_run_test_idle idle;
> +       struct jtag_xfer xfer;
> +       void *user_tdio_data;
> +       unsigned long value;
> +       int err;
> +
> +       switch (cmd) {
> +       case JTAG_GIOCFREQ:
> +               if (jtag->ops->freq_get)
> +                       err = jtag->ops->freq_get(jtag, &value);
> +               else
> +                       err = -EOPNOTSUPP;
> +               if (err)
> +                       break;
> +
> +               err = __put_user(value, (unsigned long __user *)arg);
> +               break;

Use put_user() instead of __put_user() everywhere please.

To avoid using so many casts, just use a temporary variable
that holds the pointer.

Also, you should never use 'unsigned long' pointers in the arguments,
use either '__u32' or '__u64', whichever makes more sense here.

I see that your command definition has 'unsigned int', so it's already
broken on 64-bit architectures.

> +       case JTAG_IOCXFER:
> +               if (copy_from_user(&xfer, (void __user *)arg,
> +                                  sizeof(struct jtag_xfer)))
> +                       return -EFAULT;
> +
> +               user_tdio_data = xfer.tdio;
> +               xfer.tdio = jtag_copy_from_user((void __user *)user_tdio_data,
> +                               xfer.length);
> +               if (!xfer.tdio)
> +                       return -ENOMEM;

You should enforce an upper bound for the length here,
to prevent users from draining kernel memory with giant
buffers.

> +static struct jtag *jtag_get_dev(int id)
> +{
> +       struct jtag *jtag;
> +
> +       mutex_lock(&jtag_mutex);
> +       list_for_each_entry(jtag, &jtag_list, list) {
> +               if (jtag->id == id)
> +                       goto found;
> +       }
> +       jtag = NULL;
> +found:
> +       mutex_unlock(&jtag_mutex);
> +       return jtag;
> +}

I'm pretty sure there is a better way to look up the data from the
chardev inode,
though I now forget how that is best done.

> +static const struct file_operations jtag_fops = {
> +       .owner          = THIS_MODULE,
> +       .llseek         = no_llseek,
> +       .unlocked_ioctl = jtag_ioctl,
> +       .open           = jtag_open,
> +       .release        = jtag_release,
> +};

add a compat_ioctl pointer here, after ensuring that all ioctl commands
are compatible between 32-bit and 64-bit user space.

In turn, no_llseek is the default, you can drop that.

> +struct jtag *jtag_alloc(size_t priv_size, const struct jtag_ops *ops)
> +{
> +       struct jtag *jtag = kzalloc(sizeof(*jtag) + priv_size, GFP_KERNEL);
> +
> +       if (!jtag)
> +               return NULL;
> +
> +       jtag->ops = ops;
> +       return jtag;
> +}
> +EXPORT_SYMBOL_GPL(jtag_alloc);

Please add some padding behind 'struct jtag' to ensure
the private data is aligned to ARCH_DMA_MINALIGN,

      Arnd
