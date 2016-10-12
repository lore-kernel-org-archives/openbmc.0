Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svM5G56X0zDsxJ
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 04:57:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=VGrte64Z; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id e12so3984248oib.3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 10:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=3yjnNXPjH7Iyx8Q9Wb+B3ulxySVL1E1CHSuEV9VkFNo=;
 b=VGrte64Z4sczlyDfFQ1d+kLElhKhR2iGyc+HZmr+cNfDDLIBFwUe6i4MbAuyKF5/av
 A3j9gshKsd0w4NOs8d0tMhlrWOlmHaDjQ/sKEJ52wZzrNQXcVVn2oC6Rxt265BJTCLWi
 uWiK0AwT0Xdc0x7iT+OV6oJghhC1DcW4HUEe7hO+CtYugu8gc0Zrs3uU2fONiFW6TdvW
 nUfggNiuWTvziGJa2MEt2UJMpLUbkyzxbuE1JXK9ocaBSlmPqTE5DwZxa5EUW5vsNJT8
 hj8gHurwiruqjadmM4rs31NKbAR71iPzRBC40bxszvSR3F8PG30yxmuaJJWJS0h9jU5N
 w1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=3yjnNXPjH7Iyx8Q9Wb+B3ulxySVL1E1CHSuEV9VkFNo=;
 b=DScjWxZNjGxlj19neLPgi6tNjOFu3Arhu3+Qkd9O/NxQtZxYkmZ6MhOq1oJdV50jNb
 IfuF80UifvenHauaWT9hnFbKddFRhpbaPWpfP/UQGWsHdxYB8KKktZipqGtnHlZgZ6G6
 f4DBMvOPa/y/hHeCChqtTeksCLf0CixrLXQ5l3hkminZDNp0rAIRDpIPdd9GI5NMzidy
 Czm5id5QY9nTjahLEl0n5ygNk5nQqu46oMFeEg63s7p9ZZUnUftqP6DBDUerI75ViPhU
 ijxqsvOv/bbnaUJykV4aWdkuwbT3B6wAyWhUjpq2AD/WP58449WMMVoDII/eoVnaIN28
 6/Ow==
X-Gm-Message-State: AA6/9Rkbn6bgnjQVxEHn1YI3Xx4au06WGy2apaM8KTfi9RMWwBPejw6FYqxfJNrIX6814JLABdPx2i4Woa4S7Q==
X-Received: by 10.157.33.166 with SMTP id s35mr1245165otb.92.1476295038965;
 Wed, 12 Oct 2016 10:57:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.132 with HTTP; Wed, 12 Oct 2016 10:57:18 -0700 (PDT)
In-Reply-To: <ad154be5-d4e3-a163-4962-167bbea924fa@ozlabs.org>
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476222003-99697-17-git-send-email-christopher.lee.bostic@gmail.com>
 <ad154be5-d4e3-a163-4962-167bbea924fa@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Wed, 12 Oct 2016 12:57:18 -0500
Message-ID: <CAA0LjjVMOQebHY3MBhqwa=SX-Pmu1u2+SoaRoEJ-yT1dFz4NTg@mail.gmail.com>
Subject: Re: [PATCH linux v3 16/18] drivers/fsi: Set up CFAMs for communication
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
X-List-Received-Date: Wed, 12 Oct 2016 17:57:24 -0000

On Tue, Oct 11, 2016 at 7:34 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> Issue break command to reset CFAM logic and set ID as appropriate
>> for a particular master type.  Begin definition of the slave
>> engine register set and accessors.
>>
>> V3 - Remove definition of BREAK command from fsi-master.h
>>
>>    - Remove definitions of fsi_master_fake for set_smode and
>>      break
>>
>>    - Remove master->set_smode master dependent function and
>>      moved to a generic base master set_smode.
>>
>>    - Add fsi_master_link_enable with master type dependencies
>>
>> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
>
> Looking better, I still have a few comments though:
>
> The most significant part of this patch is to add the send_break and
> link_enable callbacks, but we're also adding the smode setup. Because of
> that, I'd suggest splitting this into two:
>
>  - one patch to update the fsi_master API to add the new callbacks, and
>    their implementations; and
>
>  - another patch to do the cfam setup
>

OK will do that.

>> +/*
>> + * Issue a break commad on this link
>
>  *command
>

Oops, will fix.

>> + */
>> +static int fsi_master_break(struct fsi_master *master, int link)
>> +{
>> +     int rc = 0;
>> +
>> +     if (master->send_break)
>> +             rc = master->send_break(master, link);
>> +
>> +     return rc;
>> +}
>> +
>> +static void set_smode_defaults(struct fsi_master *master, uint32_t *smode)
>> +{
>> +     *smode = FSI_SMODE_WSC | FSI_SMODE_ECRC
>> +             | fsi_smode_echodly(0xf) | fsi_smode_senddly(0xf)
>> +             | fsi_smode_lbcrr(1) | fsi_smode_sid(0);
>> +}
>
> I assume that the smode value will depend on the master later, hence the
> need for a function for this (otherwise we'd just want a const
> uint32_t). However, can you just return the smode rather than setting a
> pointer and returning void?

OK will fix.

>
>> +static int fsi_master_set_smode(struct fsi_master *master, int link)
>> +{
>> +     uint32_t smode;
>> +     int rc;
>> +
>> +     set_smode_defaults(master, &smode);
>> +     rc = master->write(master, link, 0, FSI_SLAVE_BASE + FSI_SMODE,
>> +                     &smode, sizeof(smode));
>> +
>> +     return rc;
>> +}
>> +
>
> On reading this a little further, I'm a little confused about whether
> the smode register is part of the master or part of a slave. I've
> assumed the latter (as there are no registers on a GPIO master), but
> wouldn't that need to know the slave ID or base address?
>
> [Or is the absence of that a factor of only supporting one slave per
> link at the moment? If that's the case, can you rename this to
> fsi_slave_set_smode, and add the slave ID parameter that we'll need
> later?  That will clarify things a bit]
>

Its the latter, due to having only one slave per link at the moment.
Will rename and add slave ID as a parameter.

>>  static int fsi_slave_init(struct fsi_master *master,
>>               int link, uint8_t slave_id)
>>  {
>> -     struct fsi_slave *slave;
>> +     struct fsi_slave *slave = NULL;
>>       uint32_t chip_id;
>>       int rc;
>>
>> +     /*
>> +      * todo: Due to CFAM hardware issues related to BREAK commands we're
>> +      * limited to only one CFAM per link. Once hardware fixes are available
>> +      * this restriction can be removed.
>> +      */
>> +     if (slave_id > 0)
>> +             return 0;
>> +
>> +     rc = fsi_master_break(master, link);
>> +     if (rc) {
>> +             dev_warn(master->dev, "no slave detected at %02x:%02x\n",
>> +                             link, slave_id);
>> +             return -ENODEV;
>> +     }
>
> Shoudln't we do the break as part of a master init (and then build
> slave IDs)? Seeing as it will reset the slave IDs, this operation can't
> be confined to only a single slave (as the name slave_init would imply.
>
>> +
>> +     rc = fsi_master_set_smode(master, link);
>> +     if (rc) {
>> +             dev_warn(master->dev, "failed to set smode id, rc:%d\n", rc);
>> +             return -ENODEV;
>> +     }
>> +
>

Good point, will do that.

> You'll probably be better returning rc for both of these cases, no need
> to squash it to ENODEV (and if you do, EIO might be more appropriate).
>

The main way to detect if there is a real and functional slave on the other
end of the link, at least in the past, was to see if the break command failed
or not.  If break failed then there was nothing present to respond to the
read of the slave smode register.  rc is just the result of the slave smode
read.  That was the reasoning for returning ENODEV.  Maybe it makes
more sense to place that value in the break function itself.  Let me know.

>>  /* FSI master support */
>>
>> +static int fsi_master_link_enable(struct fsi_master *master, int link)
>> +{
>> +     int rc;
>> +
>> +     if (master->link_enable)
>> +             rc = master->link_enable(master, link);
>> +
>> +     return rc;
>> +}
>> +
>
> OK, looks good for a link_enable function of the masters. However, can
> you add the new callbacks (link_enable & send_break) and their wrappers
> in a separate earlier patch?

Is this the same change you discuss above where you'd like to see
link_enable and send_break code in a separate patch from the set_smode
code? Or is this a third patch to spell out sub details on link_enable and
send_break?

>
>>  static int fsi_master_scan(struct fsi_master *master)
>>  {
>> -     int link, slave_id;
>> +     int link, slave_id, rc;
>> +
>> +     for (link = 0; link < master->n_links; link++) {
>> +             rc = fsi_master_link_enable(master, link);
>> +             if (rc)
>> +                     continue;
>
> Shouldn't we fail on that?
>

Yes, but what that means right now is uncertain.  I can put in a dev_dbg( )
to track the fail but I don't want to exit immediately on that error since there
may still be links to deal with in the for loop.

>>
>> -     for (link = 0; link < master->n_links; link++)
>>               for (slave_id = 0; slave_id < FSI_N_SLAVES; slave_id++)
>>                       fsi_slave_init(master, link, slave_id);
>> +     }
>>
>>       return 0;
>>
>> diff --git a/drivers/fsi/fsi-master-fake.c b/drivers/fsi/fsi-master-fake.c
>> index ec1ed5e..c7ad631 100644
>> --- a/drivers/fsi/fsi-master-fake.c
>> +++ b/drivers/fsi/fsi-master-fake.c
>> @@ -63,6 +63,8 @@ static int fsi_master_fake_probe(struct platform_device *pdev)
>>       master->n_links = 1;
>>       master->read = fsi_master_fake_read;
>>       master->write = fsi_master_fake_write;
>> +     master->send_break = NULL;
>> +     master->link_enable = NULL;
>
> master is kzalloc()ed, no need to set to NULL.
>

Will remove.

>> +/*
>> + * Issue a break command on link
>> + */
>> +static int fsi_master_gpio_break(struct fsi_master *_master, int link)
>> +{
>> +     struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>> +
>> +     if (link != 0)
>> +             return -ENODEV;
>> +
>> +     /* todo: send the break pattern over gpio */
>> +     (void)master;
>> +
>> +     return 0;
>> +}
>> +
>> +static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
>> +{
>> +     struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>> +
>> +     if (link != 0)
>> +             return -ENODEV;
>> +
>> +     /* todo: set the enable pin */
>> +     (void)master;
>> +
>> +     return 0;
>> +}
>> +
>
> Looks good.
>
>> diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
>> new file mode 100644
>> index 0000000..ea7a760
>> --- /dev/null
>> +++ b/drivers/fsi/fsi-slave.h
>> @@ -0,0 +1,62 @@
>> +/*
>> + * FSI slave engine definitions.
>> + *
>
> Why does this need to be in a header file? Isn't it only used by the FSI
> core?
>

I suppose this is me not being familiar with the common coding practices
of the Linux community.  I would typically put constants and structs in an
associated header file even if there was no intent to have them be used
by anything outside the core.   Is it a requirement that this all be moved
into fsi-core.c as a means of limiting accessibility?

Thanks,
Chris

> Cheers,
>
>
> Jeremy
