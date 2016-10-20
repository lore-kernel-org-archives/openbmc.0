Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0CFY667yzDt0N
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 02:21:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=aPZy69qK; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id 66so6445820itl.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 08:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qK40v4Murgad/5V/+Rsyz2Cfm4r5HF+gixSLzHvAFHg=;
 b=aPZy69qKq8njXoSaRWJK+aOFcHIAOo1uDNTuwr2iEcc1D42JpsknZovrGh73H/l24X
 ULFjsdnDegSz5HIws1Dj5fwSEDs2D87LL9bRQiNHpoB7deIhtVETU52yS0rima9sW8lT
 US8s0LZcGEfQjDZNrZdQilJKGziA5gZTlvJ9HLkLFfrOl+HPI4L3+ETyXpWBKlVTtsNB
 dW/Jpoehw8sM1Wtw/qO5BKxQYtFZ+KfOqoxEzlgX/5mdNHg8h5fBPhHGx0MzKt6EtqvA
 pISvM7v8PrdK8Uv3MoGIAO0zDQJZn35kd/zicncZjHE+55PPfvRWTDRn2XLXtAhzfzy8
 s93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qK40v4Murgad/5V/+Rsyz2Cfm4r5HF+gixSLzHvAFHg=;
 b=KsaOKay+YlHG8+Q3mGWBCzrkG9xLVl80XYAyj5e4/QrJ8nlQJAP0K81FW8WfzHwxGE
 C1ZKINV+Ph88XA9QlZJ6uSZCZicEPnYOiGjMEK0Ij9D9R7Y7l4iK7mh6cko/uZma5AgF
 6L1jvIsOdSeL1kxQabRpl3TV5hEVt3wxAMp6gNIzRgz92v++3UsdeEvoJpR48c64HCHB
 3/ydD0pR2A6ri4pfCbmJLBWAj+slZ6dr/Fdna6r1Eg6DrkXgueVQoQ8sdNHJKtxuFr7C
 mRdyippk9g3r0dnrsMn1mGaGE1L/86GnnZKIChiziw/NTCTaLjrz2UBL4gfOQ5SmzzAY
 8M7w==
X-Gm-Message-State: ABUngvfXzdPQ5soeXJPVmmOb21c5p0SiblcVOb8CSD9ei/kvhKqr1J/Luntqt8WepBU0rDwklVNJVh2BldGxAA==
X-Received: by 10.157.34.106 with SMTP id o97mr534550ota.134.1476976879811;
 Thu, 20 Oct 2016 08:21:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.9 with HTTP; Thu, 20 Oct 2016 08:21:19 -0700 (PDT)
In-Reply-To: <918db920-baf4-ef79-90fe-dc00a06a2430@ozlabs.org>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-18-git-send-email-christopher.lee.bostic@gmail.com>
 <918db920-baf4-ef79-90fe-dc00a06a2430@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Thu, 20 Oct 2016 10:21:19 -0500
Message-ID: <CAA0LjjWtdasgpv6NR2UCAuZCb+eP-+sDcsOMeGb4-_MEn1x7dw@mail.gmail.com>
Subject: Re: [PATCH linux v5 17/18] drivers/fsi: Add SCOM FSI client device
 driver
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 20 Oct 2016 15:21:22 -0000

On Wed, Oct 19, 2016 at 10:27 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> diff > +static int scom_probe(struct device *);
>> +
>> +struct scom_op {
>> +     uint64_t        data;
>> +     uint32_t        addr;
>> +};
>
> You're making this a userspace interface, so this should go into the
> uapi headers (and then will form part of the unchangeable Linux ABI).
> However, more on the ABI below...
>
>> +struct scom_device {
>> +     struct fsi_device *fsi_dev;
>> +     struct cdev *cdev;
>> +};
>> +
>> +struct scom_device scom_dev;
>> +
>> +struct fsi_device_id scom_ids[] = {
>> +     {
>> +             .engine_type = FSI_ENGID_SCOM,
>> +             .version = FSI_VERSION_ANY,
>> +     },
>> +     { 0 }
>> +};
>> +
>> +struct fsi_driver scom_drv = {
>> +     .id_table = scom_ids,
>> +     .drv = {
>> +             .name = "scom",
>> +             .bus = &fsi_bus_type,
>> +             .probe = scom_probe,
>> +     }
>> +};
>
> Make these static, and put after the code, just before the
> module_fsi_driver. Then you won't need the forward definition of
> scom_probe.
>

Hi Jeremy,

OK will change.

>> > +static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
>> +                     loff_t *offset)
>> +{
>> +     int rc = 0;
>> +     struct scom_op op;
>> +     struct scom_device *scom = &scom_dev;
>> +     struct device *dev = &scom->fsi_dev->dev;
>> +
>> +     /* todo: Retrieve device to operate on from filep->private_data */
>
> Yep, otherwise you only get one scom interface, and crazy results if you
> get probed twice. I'd suggest not leaving this until later.
>

Will add.

>> +
>> +     if (len != sizeof(struct scom_op))
>> +             return -EINVAL;
>> +
>> +     rc = copy_from_user(&op, buf, len);
>> +     if (rc) {
>> +             dev_dbg(dev, "copy from user failed:%d\n", rc);
>> +             return -EINVAL;
>> +     }
>> +
>> +     rc = get_scom(&op.data, op.addr);
>
> I'm not a huge fan of that ABI to userspace. You already have the
> address in the offset argument, so you can do this without needing new
> uapi headers, using something like:
>
> static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
>                         loff_t *offset)
> {
>         uint64_t val;
>
>         /* todo: can we do 1/2/4/8 byte operations too? */
>         if (len != sizeof(uint64_t))
>                 return -EINVAL;
>
>         rc = get_scom(&val, offset);
>         if (rc)
>                 return rc;
>
>         rc = copy_to_user(&val, buf, len);
>
>         return rc ? rc : len;
> }
>

OK, will change that.

>
> Also, have you thought about endianness?
>
>

The plan is for endianness is to be dealt with in the fsi-core
so the other engines don't need to worry about it.  Yes there
is likely to be some additions there.  Will need to evaluate.

>> +static int scom_probe(struct device *dev)
>> +{
>> +     struct fsi_device *fsi_dev = to_fsi_dev(dev);
>> +     struct scom_device *scom = &scom_dev;
>> +     int rc;
>> +
>> +     scom->fsi_dev = fsi_dev;
>> +     scom->cdev = cdev_alloc();
>> +     if (!scom->cdev)
>> +             return -ENOMEM;
>> +
>> +     scom->cdev->owner = THIS_MODULE;
>> +
>> +     rc = register_chrdev(0, "scom", &scom_fops);
>> +     if (rc < 0) {
>> +             dev_dbg(dev, "scom major allocation failed:%d\n", rc);
>> +             return rc;
>> +     }
>> +     dev_dbg(dev, "scom major allocated:%d\n", rc);
>
> You need to register the actual device too, right? We'll want scom0,
> scom1, etc.

Don't understand your meaning here.  Also scom0 and scom1 refer to
what exactly?  For a first pass of core code I'd like to be able to deal
with a single engine if possible and expand later.

Thanks,
Chris


>
> Cheers,
>
>
> Jeremy
