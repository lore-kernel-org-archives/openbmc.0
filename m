Return-Path: <brendanhiggins@google.com>
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSVK11TB1zDqp7
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 11:04:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cOdALIN+"; 
 dkim-atps=neutral
Received: by mail-oi0-x229.google.com with SMTP id e124so77407178oig.2
 for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2017 18:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=AO+W+20knssfNe95Ni7E+19RvhCXUlVhRINhoFmdEWM=;
 b=cOdALIN+LdEXrzidf7Eb6cfkNzbYta/CZXjKPDwgOn6C26sGoYe6zeLXA+fHBRY/eP
 LOZfYaAwzPtMRp0xjuHeJlDVP6RZzC/HizxrG0iNk0ezldXV/w2NHU0VcOuPXDbHm0hA
 euPqgACDqPwt6CuWFPfEB+3gx5FEzn4pmtRTyHcigw8aXxD0K1OMSge8KlJWjheTVG44
 CcZRTMs1xXmpnAlvJ7T9WvPBoMbKIYVyjX02ujZ8uNFNmMr4mYMGSHl2MCU96FJ68VnD
 RlDFICy3zjjXMSXt+uzZX80aYnEL/PBiOX7Kz0u2RfespZk6FOuVt3ItlI74O63W55Ir
 AUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=AO+W+20knssfNe95Ni7E+19RvhCXUlVhRINhoFmdEWM=;
 b=J0Q+q/dnroJI6CCjLeo/tKEZnP0qy7m5M7Ni+jonyqkHz37TU6TQdLwo6WDLcQD8Sg
 w2lt5qW5uhW/cgKaQQiUdNatZQ/Mzfq1COYr2nv9Z8M06pd1zf2JsPl3hhoKLKu2TWNP
 8Ys46rvAKPg89l7HlX93BLxjbMApXRNszSWJC7XswY8IkCPsOsCy2M46APHF5xleZPzo
 pRb7S5DIhd20Cj77dcMhUVWNFn0YsmHPmDZ7/u6QYqgv4UuOHf3UE1WkOQkJqUoUCT1c
 g/wnn+uhIsXsDPLQbSakloQWz+r6yOL0qRxJpk2P+CmkBETMBv8NHN89W4ifLRXSCZMd
 hQMA==
X-Gm-Message-State: AHYfb5ikpznyzj5O+fxy+IvdGDzJZ7BBAM/ANMMUy4Ej98cAEXFsg/4l
 16XvPYMmyZGo+VNBVKReGjzchLujIVS8
X-Received: by 10.202.244.129 with SMTP id s123mr11506667oih.318.1502327058278; 
 Wed, 09 Aug 2017 18:04:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.168.69.205 with HTTP; Wed, 9 Aug 2017 18:04:17 -0700 (PDT)
In-Reply-To: <fd82d68b-0ca4-fa43-4ed4-e18f684f6dee@acm.org>
References: <20170805011855.1027-1-brendanhiggins@google.com>
 <8f5579cb-2c4d-2cd0-e874-a44374e08417@acm.org>
 <CAFd5g46LmyjPnjKis7c-F9FbjzyU1MgvrVkR7vjrEC4oWV1doQ@mail.gmail.com>
 <fd82d68b-0ca4-fa43-4ed4-e18f684f6dee@acm.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 9 Aug 2017 18:04:17 -0700
Message-ID: <CAFd5g47FmTiygHDjm0-h2NAz8qa85zZVLKgCf9vGYP8iK6_+ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ipmi: bt-i2c: added IPMI Block Transfer over I2C
To: Corey Minyard <minyard@acm.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg KH <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Benjamin Fair <benjaminfair@google.com>, 
 linux-doc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, 
 openipmi-developer@lists.sourceforge.net, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Thu, 10 Aug 2017 01:04:21 -0000

> Perhaps that is some level of abuse, but it's pretty common.  I'm not
> against it.
>
> There is standard IPMI firmware NetFN (though no commands defined) that if
> you use
> the driver automatically goes into "Maintenance mode" and modified the
> timeouts
> and handling to some extent to help with this.

That is a really good point, I missed that.
...
>
>
> There are ways to accomplish this that aren't that complex.  You can create
> an OEM
> command that can query the maximum message size and the ability to do
> sequence
> numbers in the messages.
>
> If messages larger than 32-bytes are supported, and the host I2C/SMBus
> driver
> supports it, you could use the standard SSIF SMBus commands to do this, they
> have an 8-bit length field.
>
> If sequence numbers are supported, The SSIF could use different SMBus
> commands
> to do the write and read requests.  Since this is only if you get an OEM
> command,
> and if you put the sequence numbers at the end where they are easy to add on
> the send side, this is a small change to the driver.

What if we just had an OEM command that changed the message structure from
that point on? We could abuse the "maintenance mode" NetFN to get back into
normal SSIF if necessary.

>
> So I think the changes would be small and contained.  I'm actually ok with a
> different driver, but I think it would be more valuable to the OpenBMC
> project
> to have a standardized interface that would work (in a not quite as
> efficient
> mode) with software that does not use the Linux IPMI driver.

I guess I see the all of my asks as hacky things which we can hopefully remove
at some point. Hopefully, most OpenBMC users won't want or need these things.
...
>>
>> Regardless of what we do with the "BT-I2C" stuff, I am still interested in
>> what
>> you think about this.
>
>
> I think you are right, it probably belongs some place else.  The way that
> makes the most
> sense to me would be to have an "ipmi" directory with a "host" and "slave"
> side, and since
> ipmi is not really a char driver, to move it to the main driver directory.
> That might be
> fairly disruptive, though.

That was my thinking exactly.

>
> The other option that makes sense to me would be to add a
> drivers/char/ipmi_slave directory,
> or something like that, and put the slave code there.  That would be less
> disruptive.

Right that is the approach I took, except I called it drivers/char/ipmi_bmc.

I originally thought doing the less disruptive thing is best; however, I know
there are also some OpenBMC people who are interested in implementing
IPMB. So maybe now is the time to bite the bullet and create an ipmi
directory under drivers/.

>
> -corey

In summary, I think I can live with making it a mangled form of SSIF, but
I would prefer to put it in its own driver.

In any case, I think I would rather focus on the the BMC side IPMI framework
now, since it is a bigger change and would also reduce the work of
implementing a BMC side SSIF driver.

Here is what I propose: we focus on the BMC side IPMI framework RFC that
I sent out the other day:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1463473.html
I will add a change to the BMC side IPMI framework patchset to move all the
IPMI stuff to the new drivers/ipmi directory as discussed and then drop the
patch in that patchset that depends on this patchset.

Let me know what you think
