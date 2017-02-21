Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS5q71SPGzDq5s
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 14:40:03 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vS5q65ldDz9ryj;
 Tue, 21 Feb 2017 14:40:02 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: scom: Add reset functionality
 and sysfs interface
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1487367671-26077-1-git-send-email-eajames@linux.vnet.ibm.com>
 <4b59fa39-65c2-cb33-07aa-3fe7a1c7fe21@ozlabs.org>
 <8f716407-6cdb-7f49-6ba6-39a5224a19ac@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <874c97f1-5b18-6a3e-cfb6-a6e8b7b02a38@ozlabs.org>
Date: Tue, 21 Feb 2017 11:40:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <8f716407-6cdb-7f49-6ba6-39a5224a19ac@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
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
X-List-Received-Date: Tue, 21 Feb 2017 03:40:03 -0000

Hi Eddie,

>>> +static ssize_t store_reset_register(struct device *dev,
>>> +                    struct device_attribute *attr,
>>> +                    const char *buf, size_t count)
>>> +{
>>> +    int rc;
>>> +    struct fsi_device *fsi_dev = to_fsi_dev(dev);
>>> +
>>> +    rc = scom_full_reset(fsi_dev);
>>> +
>>> +    return rc ? rc : count;
>>> +}
>>> +DEVICE_ATTR(reset, 0200, NULL, store_reset_register);
>>> +
>> How does this interact with the scom read/write operations? Having
>> different interfaces access methods (file for one, sysfs interface for
>> another)for both seems like an invitation for trouble - would this make
>> more sense as an ioctl on the existing fd?
> 
> It would, but I was under the impression ioctls were frowned upon for
> some reason?

The downside of an ioctl is that it needs a new definition in kernel
headers (ie, the ioctl number and any structures required for
input/output data).

However, I think it's entirely suitable in this case - we have the usual
flow of data (the scoms) over read()/write(), and control operations
(reset) using an ioctl.

However, that assumes that the reset is something that a user may want
to issue in normal operation, rather than a debug or diagnosis event. Is
that the case here?

Cheers,


Jeremy
