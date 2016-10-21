Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0YyX0xn4zDvZS
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 16:24:36 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3t0YyW50YRz9s3v;
 Fri, 21 Oct 2016 16:24:35 +1100 (AEDT)
Subject: Re: [PATCH linux v5 17/18] drivers/fsi: Add SCOM FSI client device
 driver
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-18-git-send-email-christopher.lee.bostic@gmail.com>
 <918db920-baf4-ef79-90fe-dc00a06a2430@ozlabs.org>
 <CAA0LjjWtdasgpv6NR2UCAuZCb+eP-+sDcsOMeGb4-_MEn1x7dw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <c75d32c6-546a-c5d2-a7ab-052b82de50ea@ozlabs.org>
Date: Fri, 21 Oct 2016 13:24:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAA0LjjWtdasgpv6NR2UCAuZCb+eP-+sDcsOMeGb4-_MEn1x7dw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 21 Oct 2016 05:24:36 -0000

Hi Chris,

>> Also, have you thought about endianness?
> 
> The plan is for endianness is to be dealt with in the fsi-core
> so the other engines don't need to worry about it.  Yes there
> is likely to be some additions there.  Will need to evaluate.

OK.

>>> +static int scom_probe(struct device *dev)
>>> +{
>>> +     struct fsi_device *fsi_dev = to_fsi_dev(dev);
>>> +     struct scom_device *scom = &scom_dev;
>>> +     int rc;
>>> +
>>> +     scom->fsi_dev = fsi_dev;
>>> +     scom->cdev = cdev_alloc();
>>> +     if (!scom->cdev)
>>> +             return -ENOMEM;
>>> +
>>> +     scom->cdev->owner = THIS_MODULE;
>>> +
>>> +     rc = register_chrdev(0, "scom", &scom_fops);
>>> +     if (rc < 0) {
>>> +             dev_dbg(dev, "scom major allocation failed:%d\n", rc);
>>> +             return rc;
>>> +     }
>>> +     dev_dbg(dev, "scom major allocated:%d\n", rc);
>>
>> You need to register the actual device too, right? We'll want scom0,
>> scom1, etc.
> 
> Don't understand your meaning here.  Also scom0 and scom1 refer to
> what exactly?

The actual devices. You're only registering a chardev major number
there, not an actual character device, and so this doesn't result in any
/dev/scom node being created.

You'll want to do a device_create there, to get the minor allocated and
have the device appear. However, that means you'll also need to create a
class too.

If you want to skip all that, just create a miscdev instead. That will
take care of the major/minor numbers for you, and will go into the
'misc' device class.

> For a first pass of core code I'd like to be able to deal with a
> single engine if possible and expand later.

There's a right and wrong way to do that though. Currently, it looks
like you're intending to register a /dev/scom. Then, when you want to
add multiple interfaces in future, that will have to be removed to
create /dev/scom0, /dev/scom1, etc. That's a userspace ABI change, which
could break old code.

So, even if your driver only handles one device for now, name that in a
way that doesn't conflict with that future interface.

However, handling multiple devices is pretty trivial. Just allocate your
device in the probe, rather than using one static instance, and name it
accordingly. Here's what I'd suggest for your probe function:

struct scom_device {
	struct fsi_device	*fsi_dev;
	struct miscdevice	mdev;
	char			name[32];
};

static atomic_t scom_idx = ATOMIC_INIT(0);

static int scom_probe(struct device *dev)
{
	struct fsi_device *fsi_dev = to_fsi_dev(dev);
	struct scom_device *scom;
	int rc;

	scom = devm_kzalloc(dev, sizeof(*scom), GFP_KERNEL);
	if (!scom)
		return -ENOMEM;

	snprintf(scom->name, sizeof(scom->name),
			"scom%d", atomic_inc_return(&scom_idx));
	scom->fsi_dev = fsi_dev;
	scom->mdev.minor = MISC_DYNAMIC_MINOR;
	scom->mdev.fops = &scom_fops;
	scom->mdev.name = scom->name;
	scom->mdev.parent = dev;

	return misc_register(&scom->mdev);
}


Then, in your read/write functions, file->private_data is your mdev, and
you can just do a container_of to get the struct scom_device *.

From your next email:

> Is there any value in appending an FSI device path to scom?  Like
> cat'ing the fsi device name on end.  That's what is done in existing
> product and it makes it easy to tell what device is where in the
> topology.

No, that's not normal convention for providing that sort of information.
If we set the device parent (ie, scom->mdev.parent), the device will be
referenced correctly through sysfs, so we have the correct hardware bus
layout available there. For example:

  # cat /sys/bus/fsi/devices/00:00:00:00/misc/scom1/dev
  10:62
  # ls -l /dev/scom1
  crw-------    1 root     root       10,  62 Jan  1 00:00 /dev/scom1

Then, if we want symlinks in dev, we add the appropriate udev rules to
create those according to system policy. The names in dev should be
fairly dynamic (eg, /dev/sdXN, /dev/ipmiN, etc)

[One advantage of using a chardev with a proper class is that 'misc'
class directory in the sysfs path could be named something more
appropriate...]

Cheers,


Jeremy
