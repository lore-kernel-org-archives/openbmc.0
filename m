Return-Path: <arndbergmann@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xWqfd36MKzDqln
 for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2017 21:16:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X/hRHLzQ"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id v11so469146oif.1
 for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2017 04:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=dn0JPB21nMGVGJFe0hX1J/gMkwua7fYpwv1hqOk/uJ8=;
 b=X/hRHLzQ/Z7HvJUi5MuPLq0QKl0ldPh/sF3ni7nL/JxtKSAoxy+sBD2bqZ2/lmavny
 +QpvNmC0KJq44FyRFspmmNAyrLoWVdqOm159qxRpm2/e4sJeqIsttA5So+Le9y5XkPy0
 n4gSCT/lOmQhdmMY32dOK0HUdtVhyRlyDu/Sb20dvaasIiNxqphWsCVIv2ifOqXR5YhU
 6cQhYiYf5zbPMrsvoMESHvGN6SfwfFAFmpBWrZYzJt+yT/okaOcCUXXCAlSodRcCTpyV
 xZmpcH0Qj1y0PbZWgtqRYEH6DHQOSTTohNXbaOjSJ80HPEwyUuLj9dP8kX6bz5+9Y0C/
 A/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=dn0JPB21nMGVGJFe0hX1J/gMkwua7fYpwv1hqOk/uJ8=;
 b=Z094twAcNj4fd46PQUJwEj14hyyYzcAGfF5orusPBgHMT/zGwQ5YabLTTj6YVEPwI0
 /XMti65gsncg4rfDAQtRxca7JabP7WW0gyq+rYEzkFmrNdFqenV9jKrJlNoJO1qNhxU8
 FycG1MBQMA/d+vxAs5KIrwYIpM08xJsMwxtdnLHCXdrMiltAdFcMU35Oq7HaJjJDUIaP
 1Kngo90lw7tw7JHrFt8/6pnH6+VcFDSu39BtFjiECHt1mb4NWBn39wXXg/4OEPjQxG6m
 aRthy3USvtiI8FZp0DAvhhV4WDwFQ7ckOjn7EbLBrjv0suzwtLZv8coh/QRg3WFHCGUy
 AsvA==
X-Gm-Message-State: AHYfb5hVbuxxxMuKNqzlk62w5Klhe4M1GC4GGr0cl3AQYlysD8o2y8Pf
 uPM0qY/hiUrtZ0FwTwOdbSR9owrsXQ==
X-Received: by 10.202.83.6 with SMTP id h6mr29012572oib.138.1502795767571;
 Tue, 15 Aug 2017 04:16:07 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.182.29.34 with HTTP; Tue, 15 Aug 2017 04:16:06 -0700 (PDT)
In-Reply-To: <1502791207-26951-2-git-send-email-oleksandrs@mellanox.com>
References: <1502791207-26951-1-git-send-email-oleksandrs@mellanox.com>
 <1502791207-26951-2-git-send-email-oleksandrs@mellanox.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 15 Aug 2017 13:16:06 +0200
X-Google-Sender-Auth: ChDZz4Mpao2Jh-pAEcbxkB383cE
Message-ID: <CAK8P3a3DutrfhGrd9MnDFbzhfvnZXSyrV2RbTgrFGgpbAs=H0w@mail.gmail.com>
Subject: Re: [patch v3 1/3] drivers: jtag: Add JTAG core driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: gregkh <gregkh@linuxfoundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, 
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org,
 mec@shout.net, vadimp@maellanox.com, system-sw-low-level@mellanox.com, 
 Rob Herring <robh+dt@kernel.org>, openocd-devel-owner@lists.sourceforge.net, 
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
X-List-Received-Date: Tue, 15 Aug 2017 11:16:10 -0000

On Tue, Aug 15, 2017 at 12:00 PM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:

> +       case JTAG_IOCXFER:
> +               if (copy_from_user(&xfer, varg, sizeof(struct jtag_xfer)))
> +                       return -EFAULT;
> +
> +               if (xfer.length >= JTAG_MAX_XFER_DATA_LEN)
> +                       return -EFAULT;
> +
> +               user_tdio_data = xfer.tdio;
> +               xfer.tdio = jtag_copy_from_user((void __user *)user_tdio_data,
> +                                               xfer.length);
> +               if (!xfer.tdio)
> +                       return -ENOMEM;

This is not safe for 32-bit processes on 64-bit kernels, since the
structure layout differs for the pointer member. It's better to always
use either rework the structure to avoid the pointer, or to use a
__u64 member to store it, and then use u64_to_user_ptr()
to convert it in the kernel.

> +       case JTAG_GIOCSTATUS:
> +               if (jtag->ops->status_get)
> +                       err = jtag->ops->status_get(jtag,
> +                                               (enum jtag_endstate *)&value);

This pointer cast is also not safe, as an enum might have a different
size than the 'value' variable that is not an enum. I think you need to
change the argument type for the callback, or maybe use another
intermediate.

> +static int jtag_open(struct inode *inode, struct file *file)
> +{
> +       struct jtag *jtag = container_of(inode->i_cdev, struct jtag, cdev);
> +
> +       spin_lock(&jtag->lock);
> +
> +       if (jtag->is_open) {
> +               dev_info(NULL, "jtag already opened\n");
> +               spin_unlock(&jtag->lock);
> +               return -EBUSY;
> +       }
> +
> +       jtag->is_open = true;
> +       file->private_data = jtag;
> +       spin_unlock(&jtag->lock);
> +       return 0;
> +}

Does the 'is_open' flag protect you from something that doesn't
also happen after a 'dup()' call on the file descriptor?

> + * @mode: access mode
> + * @type: transfer type
> + * @direction: xfer direction
> + * @length: xfer bits len
> + * @tdio : xfer data array
> + * @endir: xfer end state
> + *
> + * Structure represents interface to Aspeed JTAG device for jtag sdr xfer
> + * execution.
> + */
> +struct jtag_xfer {
> +       __u8    mode;
> +       __u8    type;
> +       __u8    direction;
> +       __u32   length;
> +       __u8    *tdio;
> +       __u8    endstate;
> +};

As mentioned above, the pointer in here makes it incompatible. Also,
you should reorder the members to avoid the implied padding.
Moving the 'endstate' before 'length' is sufficient.

        Arnd
