Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com
 [IPv6:2a00:1450:400c:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8rVR2CYCzDvRR
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 03:47:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Ig1yq8+b; 
 dkim-atps=neutral
Received: by mail-wm0-x241.google.com with SMTP id p190so8936842wmp.1
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 09:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=y1KEqolp1nKgyFO2nnMC3FJpJfDtdwGi1988mzL0o78=;
 b=Ig1yq8+buPWSuA6C9vy4/qxSZCfv2k/VR0Qw6A/kYsr2IjlEyxEE0zKqbLZkhHSYfD
 vE8z9G3w1p0Zmu0Z3lTpO/yZiu2cXcdtFyeZw3rtW4pa1CApOFnhib+YiTU2RN4aDdmS
 bkppVydtrzYNsYORz4Y4QFgeRhsJdDhVtDgUc6786GE7+d0Mpo6mrR/y4BMzA6AjOu+1
 SFtPMY5IiMZsOr0krUWk8msUib/Ege5oexKvxDpzxJjkVNnNR/eb13sElI4AUQhg8Pnr
 5vMUPMS6WXKglfYOqzUpKeizDa4Z/5sS8/aE3j33Colen/8FkZ+qLF8XXy+suz1dZBF6
 AXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=y1KEqolp1nKgyFO2nnMC3FJpJfDtdwGi1988mzL0o78=;
 b=X5AI5LzeB6gwUWtBpVsnMNb+nx9n59Fj9v6rctIhPKrwcIsBuML2hWkhEAwb9IfGbh
 4gZvEWOLhcV8ZgC5fbUfl+O9iNIXRyK0M0ierMjzlNrKOQYH7G29eRMKiMXRtVQwOUAq
 kBonFI65LrO6R8j2gHIT3XGv0TRT3l1X9caFOHRhyW7gIYKoESIz0bcHapydx2SK6TBq
 hXdLqJ1djgCPxeYR5nPM4oTJwWBAqYYjSpn/lISFQsUaZLofabs8z60LYXSMF/Us3Vf+
 rLNjk1Ey0A0sq4IOgihL6BQsV8IoiZYk3PvWbo0CdGPVOP4EbpFQgFwtQJKQI6UNeywE
 5S7w==
X-Gm-Message-State: ABUngvc9K7yOkut5V29wBmTMyTtfUlhck9lVXtrEnze0Phy27QKSiU3krLTNtYDOFTttgsYzvcl0+koR9/0xwQ==
X-Received: by 10.28.71.14 with SMTP id u14mr10044803wma.10.1478191642496;
 Thu, 03 Nov 2016 09:47:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.161.71 with HTTP; Thu, 3 Nov 2016 09:47:21 -0700 (PDT)
In-Reply-To: <9b22edbb-f00e-32fc-e65f-9e5fb7cf6bf1@ozlabs.org>
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1477865379-11566-19-git-send-email-christopher.lee.bostic@gmail.com>
 <9b22edbb-f00e-32fc-e65f-9e5fb7cf6bf1@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Thu, 3 Nov 2016 11:47:21 -0500
Message-ID: <CAA0LjjUmyb-vH0KOYhDxxPss5OLfKnfSiwrzuZVwxosR0q+14w@mail.gmail.com>
Subject: Re: [PATCH linux v6 18/18] drivers/fsi: Add SCOM FSI client device
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
X-List-Received-Date: Thu, 03 Nov 2016 16:47:30 -0000

>> +static atomic_t scom_idx = ATOMIC_INIT(0);
>> +static int scom_probe(struct device *);
>
> You don't need this forward declaration anymore
>

Hi Jeremy,

OK will remove.

>> +static int get_scom(struct scom_device *scom_dev, uint64_t *value,
>> +                     uint32_t addr)
>> +{
>> +     uint32_t result, data;
>> +     int rc;
>> +
>> +     udelay(SCOM_FSI2PIB_DELAY);
>
> Why this udelay()? Does put_scom() not need it too then? If it's a
> matter of scom engine state, should we adjust this based on the last
> operation?

This is a carry over from previous code.  I don't know the history behind why
it was added.  Will remove.

>
> If it's necessary, can you add a short comment?
>
>> +static loff_t scom_llseek(struct file *filep, loff_t offset, int whence)
>> +{
>> +     if (whence != 0)  /* SEEK_SET */
>> +             return -EINVAL;
>> +
>> +     filep->f_pos = offset;
>> +     return offset;
>> +}
>
> I think you can drop this and use .llseek = no_seek_end_llseek instead
> (and then you get SEEK_CUR support too).

Will change.

>
>> +static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
>> +                     loff_t *offset)
>> +{
>> +     int rc = 0;
>> +     struct miscdevice *mdev =
>> +                             (struct miscdevice *)filep->private_data;
>> +     struct scom_device *scom = to_scom_dev(mdev);
>> +     struct device *dev = &scom->fsi_dev->dev;
>> +     uint64_t val;
>> +
>> +     if (len != sizeof(uint64_t))
>> +             return -EINVAL;
>> +
>> +     rc = get_scom(scom, &val, *offset);
>> +     if (rc) {
>> +             dev_dbg(dev, "get_scom fail:%d\n", rc);
>> +             return rc;
>> +     }
>> +
>> +     rc = copy_to_user(buf, &val, len);
>> +     if (rc)
>> +             dev_dbg(dev, "copy to user failed:%d\n", rc);
>> +
>> +     return rc ? rc : len;
>> +}
>
> What are the semantics of offset after reading & writing? Should two
> reads (with no intervening llseek) read the same address, or subsequent
> addresses?

The user is to specify the address for each scom read and write.   No
support has been provided for any other address auto set.

>
>> +static ssize_t scom_write(struct file *filep, const char __user *buf,
>> +                     size_t len, loff_t *offset)
>> +{
>> +     int rc = 0;
>
> No need to initialise this (and in scom_read too).
>

Will remove.

>> +     struct miscdevice *mdev =
>> +                             (struct miscdevice *)filep->private_data;
>> +     struct scom_device *scom = to_scom_dev(mdev);
>> +     struct device *dev = &scom->fsi_dev->dev;
>> +     uint64_t val;
>> +
>> +     if (len != sizeof(uint64_t))
>> +             return -EINVAL;
>> +
>> +     rc = copy_from_user(&val, buf, len);
>> +     if (rc) {
>> +             dev_dbg(dev, "copy from user failed:%d\n", rc);
>> +             return -EINVAL;
>> +     }
>
> You don't want to squash that return value; just return rc there.
>

OK, will change.

>> +
>> +     rc = put_scom(scom, val, *offset);
>> +     if (rc)
>> +             dev_dbg(dev, "put_scom failed with:%d\n", rc);
>> +
>> +
>> +     return rc ? rc : len;
>> +}
>> +
>> +static const struct file_operations scom_fops = {
>> +     .owner  = THIS_MODULE,
>> +     .llseek = scom_llseek,
>> +     .read   = scom_read,
>> +     .write  = scom_write,
>> +};
>> +
>> +static int scom_probe(struct device *dev)
>> +{
>> +     struct fsi_device *fsi_dev = to_fsi_dev(dev);
>> +     struct scom_device *scom = NULL;
>
> No need to initialise this either.
>

Removing

>> +
>> +     scom = devm_kzalloc(dev, sizeof(*scom), GFP_KERNEL);
>> +     if (!scom)
>> +             return -ENOMEM;
>> +
>> +     snprintf(scom->name, sizeof(scom->name),
>> +                     "scom%d", atomic_inc_return(&scom_idx));
>> +     scom->fsi_dev = fsi_dev;
>> +     scom->mdev.minor = MISC_DYNAMIC_MINOR;
>> +     scom->mdev.fops = &scom_fops;
>> +     scom->mdev.name = scom->name;
>> +     scom->mdev.parent = dev;
>> +     list_add(&scom->link, &scom_devices);
>> +
>> +     return misc_register(&scom->mdev);
>> +}
>> +
>> +static struct fsi_device_id scom_ids[] = {
>> +     {
>> +             .engine_type = FSI_ENGID_SCOM,
>> +             .version = FSI_VERSION_ANY,
>> +     },
>> +     { 0 }
>> +};
>> +
>> +static struct fsi_driver scom_drv = {
>> +     .id_table = scom_ids,
>> +     .drv = {
>> +             .name = "scom",
>> +             .bus = &fsi_bus_type,
>> +             .probe = scom_probe,
>> +     }
>> +};
>> +
>> +static int scom_init(void)
>> +{
>> +     INIT_LIST_HEAD(&scom_devices);
>> +     return fsi_driver_register(&scom_drv);
>> +}
>> +
>> +static void scom_exit(void)
>> +{
>> +     struct list_head *pos;
>> +     struct scom_device *scom = NULL;
>
> ... or this.
>

Will remove

>> +
>> +     list_for_each(pos, &scom_devices) {
>> +             scom = list_entry(pos, struct scom_device, link);
>> +             misc_deregister(&scom->mdev);
>> +             devm_kfree(&scom->fsi_dev->dev, scom);
>> +     }
>> +     fsi_driver_unregister(&scom_drv);
>> +}
>> +
>> +module_init(scom_init);
>> +module_exit(scom_exit);
>> +MODULE_LICENSE("GPL");
>

Thanks,
Chris

> Cheers,
>
>
> Jeremy
