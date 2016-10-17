Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syM8H3jPdzDt26
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 02:10:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GuYzsoSd; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id i127so12581706oia.0
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 08:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Vj8wmjKFom0d+zd5Bc3qjB6Ms/NBgppvzAXpC6XFZjU=;
 b=GuYzsoSdoJ1nnQuUnzf2OpzCCLiBN+Y4ynSjhw0DsNVHgEx9pzaFglVrnVtf2+M4TE
 CYVoHv9969Ig2fsnZofrVwpBMpe4DwHaldZxmJ00wo4q4k0jIh1noll/u9APoKOqOfY2
 Y/MGQH0CzOIfVxxHnztr3RVNGosJcN2A0zoqap5ieOf13RwOwJjoEUyZkGWqL1Fa4K09
 GHVsJLqDidHZaxn4FoFhZfuG5t/iAdUMdzAEFRGCflE0GnD1WP/g60rLgO98Jo+XiqnT
 syiSlj52N0/SIBVFzq2UgfelrEytLT6tNCiUfedKFg3X/4+zwYbbVy0b1RWbpZ0M7IxP
 BpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Vj8wmjKFom0d+zd5Bc3qjB6Ms/NBgppvzAXpC6XFZjU=;
 b=O4mbrGQsqJ00FIaBASpn9XnCqrS990aFFLWJjdu2kyBQqJ9rj+CP9ppGe1YiHbx2Ot
 i6EHPYA56R2UesGcUBPGNfJoxJC5zqAhfPM6PN+TVn7UuN04jVnKZbkTo4ldY7a+N17w
 zRCa9Jr4shwWkjipk3w2I8jYBhfZQP+5BLe/wP9uovx2UkQXinuqo87IsFGp510QyZ1j
 P5gNHkQW65LsM18xaS4wCubY+0AhF4oSzDUd1f2hS+dVn+VhaXLX8iht+/z4B7RRjNwI
 G+qvLSMm84ft5a3K2Wvdu84a8la80JZTfxC3Cj1q+8vXdx/Up5HPspZ9bqs6DA4cC2gy
 mLRw==
X-Gm-Message-State: AA6/9Rm00JXVnzAanhf8OYrQFvAeB0PyeEIi3FeHJDkK35vgP9aPp7BfJId7pK2sjDQrd+e4PjoBZ713G5EgXw==
X-Received: by 10.157.0.38 with SMTP id 35mr13150793ota.24.1476717021518; Mon,
 17 Oct 2016 08:10:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.9 with HTTP; Mon, 17 Oct 2016 08:10:20 -0700 (PDT)
In-Reply-To: <bf15af72-4bb5-69b7-974f-c2d34732e5b3@ozlabs.org>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476483282-85971-21-git-send-email-christopher.lee.bostic@gmail.com>
 <bf15af72-4bb5-69b7-974f-c2d34732e5b3@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Mon, 17 Oct 2016 10:10:20 -0500
Message-ID: <CAA0LjjUc5mwLChFZHuY7aHryfCBNB4eZRUyR2rNbAoFxBjw6tA@mail.gmail.com>
Subject: Re: [PATCH linux v4 20/20] drivers/fsi: Add SCOM client driver
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
X-List-Received-Date: Mon, 17 Oct 2016 15:10:24 -0000

On Mon, Oct 17, 2016 at 2:27 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> +     /* todo: fill in and register cdev */
>> +     /* open, read, write, close file ops */
>> +
>> +     /* todo: user space linkage to get_scom / put_scom */
>> +     /*  engine init */
>
> We have a couple of options for this, but I think a simple chardev would
> work fine. Were you thinking just a read/write interface, where the
> off_t is the SCOM address?
>

Hi Jeremy,

Yes, the idea was to create the char dev and use the read/write syscalls.
Might be a good topic for discussion in tonight's call.  Want to make sure
this adheres to the general openBMC plan for user space access to
the kernel.

Thanks,
-Chris

> Cheers,
>
>
> Jeremy
