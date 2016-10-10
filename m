Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3st4KX1DKzzDrbr
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 02:48:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3st4KW5wh6z9ryT;
 Tue, 11 Oct 2016 02:48:31 +1100 (AEDT)
From: Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [PATCH linux v2 16/17] drivers/fsi: Set up CFAMs for communication
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475948333-55960-17-git-send-email-christopher.lee.bostic@gmail.com>
 <bf2fa509-3c91-4969-f598-96806594e117@ozlabs.org>
 <CAA0LjjUpFw5bv=WYp+zuPQU7rUtjxkr0YJZC-g3s_9pDDMsX_Q@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
Message-ID: <0cf6507c-66f4-1717-eb16-925bb44f7f98@ozlabs.org>
Date: Mon, 10 Oct 2016 23:48:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAA0LjjUpFw5bv=WYp+zuPQU7rUtjxkr0YJZC-g3s_9pDDMsX_Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 10 Oct 2016 15:48:32 -0000

Hi Chris,

> For break and smode callbacks I did what you had done for
> fsi_master_fake_write( ).
> I'm not sure how mine are any different?

These implementations don't do anything, so no there's no point
populating those callbacks.

>>> +static int fsi_master_gpio_set_smode(struct fsi_master *_master, int link,
>>> +                                             uint32_t smode)
>>> +{
>>> +     int rc;
>>> +
>>> +     rc = _master->write(_master, link, 0, FSI_SLAVE_BASE + FSI_SMODE,
>>> +                     &smode, sizeof(smode));
>>> +
>>> +     return rc;
>>> +}
>>> +
>>
>> Won't this always be implemented the same way on all masters (ie, a
>> write to a particular slave register)? Why the need for a
>> master-specific callback here?
> 
> 
> This will be different for various masters based on the hardware
> issues mentioned in previous notes.  For example the cascaded master
> needs to set a different ID in smode.

Is sounds like you're putting slave logic (is, the actual value of
smode) into the master code then.

Keep the abstraction at the right level. If the smode depends on whether
the master is cascaded, then all the master needs to expose is whether
or not it's cascaded. It shouldn't need an entirely new callback to do a
write to a particular (fixed?) slave register.

However, since this isn't really used, I can't tell whether it's the
right thing to do or not. Can you defer changes like this (which are
used to support specific functionality - in this case adding cascades)
until their corresponding consumers are added too? This allows us to
review the changes with their proper context.

It seems like the priority at the moment should be getting a single
master going, with interrupts, then we can look at cascading.

Cheers,


Jeremy
