Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t5DH55RhDzDvSF
 for <openbmc@lists.ozlabs.org>; Sat, 29 Oct 2016 06:25:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=NXUUUWzn; 
 dkim-atps=neutral
Received: by mail-wm0-x244.google.com with SMTP id m83so8711891wmc.0
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 12:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=7g464AQiYgVYI7ZfllP1T+tBT51dfo6KFKp3Kc3jN84=;
 b=NXUUUWznoByuiv+4m2Jhu70Pfr+P0ck7fwDlV0etBzY/wd+rMvw9wdaqCsLX/PfuSA
 t+csqd48886rXUd5Gcnt6BD4iEKLXGSpsHvyBWclYUmLJEGNY3I3vjEnLENHc57bMhyC
 sWMMStBKrl8+aIq/p7bfXw1XgboUTccfm0Tugh9a6L4w3ubu8PUJ/8aY6VIQJ47x0mDI
 KC6QI3B7rRPUGGWpuREV6uEUFJK0tJSUMT73YDOZTC8tvM0pg3wATd4MkLLyJTbO08Xc
 A4tvTxXKq4BxJJ6sufcKpV+KnsTTYrL45xg+IMowmcD8TGp4OONf5zz9tdruA1AwkAPy
 Wfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=7g464AQiYgVYI7ZfllP1T+tBT51dfo6KFKp3Kc3jN84=;
 b=mrfpotGOmMkuv/FD43MMtwstaMEf5IhcYB5jVn4EUh09UIHxkxNQ+OphKrgMmNkfxj
 JhwHJYxQaWFFff0DCnFbiTX9FvYpEXKzke7aN3HsveXiFxK6/npPZrM+1d1KO0RVsgHm
 HUOJxGQAXALdfivspn7zb7UIKuh9lejQPtgvM4MsWPRaiDFryRHxKyL+Myv5mdT2wAlQ
 S2lio4WgSTC+dKrOqyHq9wUiSke2Kiu5sGkflxYn4Ft7tYihQq80d38nVd0qghrsv/n6
 tlo/3Awp7zF141cFA5Cv3ffoYZ1D7LtcQnwFj2mzjmy3BqJg/YkBvX4ZhDROAZaGijiv
 QehA==
X-Gm-Message-State: ABUngve6q9pLDxqYG3cggEkTwixUs9Tcf0JXoevLRJaDaHxsxxpCFhG/aADR/4/FE64qwU1DrRzlmkJ636aW8w==
X-Received: by 10.28.151.17 with SMTP id z17mr248951wmd.15.1477682701773; Fri,
 28 Oct 2016 12:25:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.161.71 with HTTP; Fri, 28 Oct 2016 12:25:01 -0700 (PDT)
In-Reply-To: <c75d32c6-546a-c5d2-a7ab-052b82de50ea@ozlabs.org>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-18-git-send-email-christopher.lee.bostic@gmail.com>
 <918db920-baf4-ef79-90fe-dc00a06a2430@ozlabs.org>
 <CAA0LjjWtdasgpv6NR2UCAuZCb+eP-+sDcsOMeGb4-_MEn1x7dw@mail.gmail.com>
 <c75d32c6-546a-c5d2-a7ab-052b82de50ea@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Fri, 28 Oct 2016 14:25:01 -0500
Message-ID: <CAA0LjjWkudTWak5kUY4O8KHsOKFUtjkofwh5ciWxaVrVOdOsBQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 28 Oct 2016 19:25:06 -0000

On Fri, Oct 21, 2016 at 12:24 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>>> Also, have you thought about endianness?
>>
>> The plan is for endianness is to be dealt with in the fsi-core
>> so the other engines don't need to worry about it.  Yes there
>> is likely to be some additions there.  Will need to evaluate.
>
> OK.
>
>>>> +static int scom_probe(struct device *dev)
>>>> +{
>>>> +     struct fsi_device *fsi_dev = to_fsi_dev(dev);
>>>> +     struct scom_device *scom = &scom_dev;
>>>> +     int rc;
>>>> +
>>>> +     scom->fsi_dev = fsi_dev;
>>>> +     scom->cdev = cdev_alloc();
>>>> +     if (!scom->cdev)
>>>> +             return -ENOMEM;
>>>> +
>>>> +     scom->cdev->owner = THIS_MODULE;
>>>> +
>>>> +     rc = register_chrdev(0, "scom", &scom_fops);
>>>> +     if (rc < 0) {
>>>> +             dev_dbg(dev, "scom major allocation failed:%d\n", rc);
>>>> +             return rc;
>>>> +     }
>>>> +     dev_dbg(dev, "scom major allocated:%d\n", rc);
>>>
>>> You need to register the actual device too, right? We'll want scom0,
>>> scom1, etc.
>>
>> Don't understand your meaning here.  Also scom0 and scom1 refer to
>> what exactly?
>
> The actual devices. You're only registering a chardev major number
> there, not an actual character device, and so this doesn't result in any
> /dev/scom node being created.
>
> You'll want to do a device_create there, to get the minor allocated and
> have the device appear. However, that means you'll also need to create a
> class too.
>
> If you want to skip all that, just create a miscdev instead. That will
> take care of the major/minor numbers for you, and will go into the
> 'misc' device class.
>

Hi Jeremy,

Ok, I've added this change for the next set to review.

>> For a first pass of core code I'd like to be able to deal with a
>> single engine if possible and expand later.
>
> There's a right and wrong way to do that though. Currently, it looks
> like you're intending to register a /dev/scom. Then, when you want to
> add multiple interfaces in future, that will have to be removed to
> create /dev/scom0, /dev/scom1, etc. That's a userspace ABI change, which
> could break old code.
>
> So, even if your driver only handles one device for now, name that in a
> way that doesn't conflict with that future interface.
>
> However, handling multiple devices is pretty trivial. Just allocate your
> device in the probe, rather than using one static instance, and name it
> accordingly. Here's what I'd suggest for your probe function:
>
> struct scom_device {
>         struct fsi_device       *fsi_dev;
>         struct miscdevice       mdev;
>         char                    name[32];
> };
>
> static atomic_t scom_idx = ATOMIC_INIT(0);
>
> static int scom_probe(struct device *dev)
> {
>         struct fsi_device *fsi_dev = to_fsi_dev(dev);
>         struct scom_device *scom;
>         int rc;
>
>         scom = devm_kzalloc(dev, sizeof(*scom), GFP_KERNEL);
>         if (!scom)
>                 return -ENOMEM;
>
>         snprintf(scom->name, sizeof(scom->name),
>                         "scom%d", atomic_inc_return(&scom_idx));
>         scom->fsi_dev = fsi_dev;
>         scom->mdev.minor = MISC_DYNAMIC_MINOR;
>         scom->mdev.fops = &scom_fops;
>         scom->mdev.name = scom->name;
>         scom->mdev.parent = dev;
>
>         return misc_register(&scom->mdev);
> }
>
>
> Then, in your read/write functions, file->private_data is your mdev, and
> you can just do a container_of to get the struct scom_device *.
>

Added these changes as well to the next patch set.


> From your next email:
>
>> Is there any value in appending an FSI device path to scom?  Like
>> cat'ing the fsi device name on end.  That's what is done in existing
>> product and it makes it easy to tell what device is where in the
>> topology.
>
> No, that's not normal convention for providing that sort of information.
> If we set the device parent (ie, scom->mdev.parent), the device will be
> referenced correctly through sysfs, so we have the correct hardware bus
> layout available there. For example:
>
>   # cat /sys/bus/fsi/devices/00:00:00:00/misc/scom1/dev
>   10:62
>   # ls -l /dev/scom1
>   crw-------    1 root     root       10,  62 Jan  1 00:00 /dev/scom1
>
> Then, if we want symlinks in dev, we add the appropriate udev rules to
> create those according to system policy. The names in dev should be
> fairly dynamic (eg, /dev/sdXN, /dev/ipmiN, etc)
>
> [One advantage of using a chardev with a proper class is that 'misc'
> class directory in the sysfs path could be named something more
> appropriate...]
>

Thanks for the clarification.
Chris.


> Cheers,
>
>
> Jeremy
