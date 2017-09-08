Return-Path: <arndbergmann@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::241; helo=mail-oi0-x241.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kgmkek3J"; 
 dkim-atps=neutral
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpnyW3nSBzDrbn
 for <openbmc@lists.ozlabs.org>; Sat,  9 Sep 2017 05:51:47 +1000 (AEST)
Received: by mail-oi0-x241.google.com with SMTP id a197so2478884oib.1
 for <openbmc@lists.ozlabs.org>; Fri, 08 Sep 2017 12:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=aIEpBOtyr6OCXRZrriRGIuz8QHAd6AVJ/B90bgB1Q9o=;
 b=kgmkek3JbGyh8gnGYl59tHQEBg03LT5P1kARf2HjRequB0ftICBVccBL0HMvN6vrRo
 gG14R9mEojMTj+Dlj9YdfaHTYO3YsaHkYESmJphSVjTkcNRMoFsXxuXL7GdgQj+rGJDF
 Epr7KuH+Xplwq5RoxnO9T97Q1xZgHh27KdRtKNlaZ+oEiUfLPF7VzNToaVlbtBXCxEoQ
 VBkam4ak47P+ZOPo9pQjGfyb6GRndLfLqGlY7LfGIKAjkcI41L9qtZOJmoGgS/6fhj6L
 MhfvRfdDLdLuQMNxMJHWRMuk/slZPy+Wb6NsqUvVpZcUzziZhX8SLJ3Q4RQkQikwMWla
 KCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=aIEpBOtyr6OCXRZrriRGIuz8QHAd6AVJ/B90bgB1Q9o=;
 b=h5GX4PXSQLh0s1jguFxsrvYD23CFP8jMS81kwaK4PYYqqZ5pJ/P5OxNSFgFqO5Fo/G
 thajXeGc7gE1G4b8GwHD9qtiuABM3SqrJO2cSw2Ivnuo4Zvn9gZvF1zeYpfGjgQy3gWm
 6UXPG4h4FQ2gHnJR99wuHjTPGoeSHYB/ky6zBypceGlABP3TSSLqTOnHC5hjJj4RXc/z
 +Hv0rXC0dOOFwYzl2F2/4gxh0GwNNrJaRuIzYjl4fem/g19Sc0tANJeiLVr2z/i5mzyE
 DX67RsfAfHgx+46gayOwGLdxQpPbGvB0ZhHMrqClHZna4oKAeM1Y9LZEd3R7pBk3gR1n
 YO3Q==
X-Gm-Message-State: AHPjjUi2FHH6ABbsOT2QAOiaHeXeif64EBxjTLuWVvZXWvHB4LFz8/Hh
 kBW5RyhLX9aUzP53hJUx2DEtNMyueg==
X-Google-Smtp-Source: AOwi7QDHzfl+WAwsR+NQb+YYZFnpPx68CMtet4Wm9WtDJymIE+XoR8hnsSsa/YT4qSHeXKw8N2wWVRSdJyo9hlEA2QY=
X-Received: by 10.202.193.65 with SMTP id r62mr4281617oif.313.1504900304426;
 Fri, 08 Sep 2017 12:51:44 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.157.91.35 with HTTP; Fri, 8 Sep 2017 12:51:43 -0700 (PDT)
In-Reply-To: <1504887229-2748-2-git-send-email-oleksandrs@mellanox.com>
References: <1504887229-2748-1-git-send-email-oleksandrs@mellanox.com>
 <1504887229-2748-2-git-send-email-oleksandrs@mellanox.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Sep 2017 21:51:43 +0200
X-Google-Sender-Auth: aD6RdWzkkUJawZa0gV6giYOisOU
Message-ID: <CAK8P3a2zkA5Tp4En+=zLBes4YRedHcn9xf1DhBsRufqPWrzvVQ@mail.gmail.com>
Subject: Re: [patch v8 1/4] drivers: jtag: Add JTAG core driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: gregkh <gregkh@linuxfoundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, 
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org,
 mec@shout.net, vadimp@maellanox.com, system-sw-low-level@mellanox.com, 
 Rob Herring <robh+dt@kernel.org>, openocd-devel-owner@lists.sourceforge.net, 
 Linux API <linux-api@vger.kernel.org>, David Miller <davem@davemloft.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri Pirko <jiri@mellanox.com>
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
X-List-Received-Date: Fri, 08 Sep 2017 19:51:48 -0000

On Fri, Sep 8, 2017 at 6:13 PM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
> Initial patch for JTAG driver
> JTAG class driver provide infrastructure to support hardware/software
> JTAG platform drivers. It provide user layer API interface for flashing
> and debugging external devices which equipped with JTAG interface
> using standard transactions.
>
> Driver exposes set of IOCTL to user space for:
> - XFER:
> - SIR (Scan Instruction Register, IEEE 1149.1 Data Register scan);
> - SDR (Scan Data Register, IEEE 1149.1 Instruction Register scan);
> - RUNTEST (Forces the IEEE 1149.1 bus to a run state for a specified
>   number of clocks).
> - SIOCFREQ/GIOCFREQ for setting and reading JTAG frequency.
>
> Driver core provides set of internal APIs for allocation and
> registration:
> - jtag_register;
> - jtag_unregister;
> - jtag_alloc;
> - jtag_free;
>
> Platform driver on registration with jtag-core creates the next
> entry in dev folder:
> /dev/jtagX
>
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Jiri Pirko <jiri@mellanox.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

My Ack was actually just for the device driver part, I had not
looked at the core again, sorry for not being clearer here.

The other two patches are fine, but looking at this one again,
I find a couple of things to improve:

> +
> +static __u64 jtag_copy_from_user(__u64 udata, unsigned long bit_size)
> +{
> +       unsigned long size;
> +       void *kdata;
> +
> +       size = DIV_ROUND_UP(bit_size, BITS_PER_BYTE);
> +       kdata = memdup_user(u64_to_user_ptr(udata), size);
> +
> +       return (__u64)(uintptr_t)kdata;
> +}
> +
> +static unsigned long jtag_copy_to_user(__u64 udata, __u64 kdata,
> +                                      unsigned long bit_size)
> +{
> +       unsigned long size;
> +
> +       size = DIV_ROUND_UP(bit_size, BITS_PER_BYTE);
> +
> +       return copy_to_user(u64_to_user_ptr(udata), jtag_u64_to_ptr(kdata),
> +                           size);
> +}

Only a style comment, but the casting to and from u64 multiple
times here seems overly complicated. Why not use a regular kernel
pointer here, and then pass that as a third argument to
ag->ops->xfer() ?

> +
> +       case JTAG_SIOCFREQ:
> +               err = __get_user(value, uarg);

This needs to use get_user(), not __get_user(). I think you changed
all the other instances after an earlier comment, but missed this one.

> +static int jtag_open(struct inode *inode, struct file *file)
> +{
> +       struct jtag *jtag = container_of(inode->i_cdev, struct jtag, cdev);
> +
> +       spin_lock(&jtag->lock);
> +
> +       if (jtag->open) {
> +               dev_info(NULL, "jtag already opened\n");
> +               spin_unlock(&jtag->lock);
> +               return -EBUSY;
> +       }
> +
> +       jtag->open++;
> +       file->private_data = jtag;
> +       spin_unlock(&jtag->lock);
> +       return 0;
> +}

The spinlock seems to not protect anything but the use count,
so this could be an atomic_t.


> +       mutex_lock(&jtag_mutex);
> +       list_add_tail(&jtag->list, &jtag_list);
> +       mutex_unlock(&jtag_mutex);

Similarly, you only use the mutex to protect the list_add/list_del,
but nothing ever walks the list, so I think you can simply remove
both the list and the mutex.

> +static int __init jtag_init(void)
> +{
> +       int err;
> +
> +       err = alloc_chrdev_region(&jtag_devt, 0, 1, "jtag");
> +       if (err)
> +               return err;
> +       return class_register(&jtag_class);
> +}
> +
> +static void __exit jtag_exit(void)
> +{
> +       class_unregister(&jtag_class);
> +}

This looks a bit asymmetric:

- you allocate a chardev region but don't destroy it in jtag_exit,
  so presumably this leaks a major number allocation each
  time you load/unload the module

- you allocate a single minor number at module load time,
  but the individual devices each get another number, and
  the original one does not appear to be used, unless I
  misunderstand the API here.

     Arnd
