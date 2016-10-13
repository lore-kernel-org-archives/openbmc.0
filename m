Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svY6515Y7zDrbg
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 12:28:45 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3svY645dmMz9s36;
 Thu, 13 Oct 2016 12:28:44 +1100 (AEDT)
Subject: Re: [PATCH linux v3 16/18] drivers/fsi: Set up CFAMs for communication
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476222003-99697-17-git-send-email-christopher.lee.bostic@gmail.com>
 <ad154be5-d4e3-a163-4962-167bbea924fa@ozlabs.org>
 <CAA0LjjVMOQebHY3MBhqwa=SX-Pmu1u2+SoaRoEJ-yT1dFz4NTg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <9fa700d8-2882-cb4c-9606-018f08fd9a04@ozlabs.org>
Date: Thu, 13 Oct 2016 09:28:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAA0LjjVMOQebHY3MBhqwa=SX-Pmu1u2+SoaRoEJ-yT1dFz4NTg@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 01:28:45 -0000

Hi Chris,

>> You'll probably be better returning rc for both of these cases, no need
>> to squash it to ENODEV (and if you do, EIO might be more appropriate).
>>
> 
> The main way to detect if there is a real and functional slave on the other
> end of the link, at least in the past, was to see if the break command failed
> or not.

But the break has no response, so any failure there would only indicate
a problem with the master, right? Wouldn't a slave error only be
detected by the smode write?

But yes, in that case, -ENODEV is appropriate for the smode write.

>> OK, looks good for a link_enable function of the masters. However, can
>> you add the new callbacks (link_enable & send_break) and their wrappers
>> in a separate earlier patch?
> 
> Is this the same change you discuss above where you'd like to see
> link_enable and send_break code in a separate patch from the set_smode
> code? Or is this a third patch to spell out sub details on link_enable and
> send_break?

No, same as above. Sorry for the confusion!

>>>  static int fsi_master_scan(struct fsi_master *master)
>>>  {
>>> -     int link, slave_id;
>>> +     int link, slave_id, rc;
>>> +
>>> +     for (link = 0; link < master->n_links; link++) {
>>> +             rc = fsi_master_link_enable(master, link);
>>> +             if (rc)
>>> +                     continue;
>>
>> Shouldn't we fail on that?
>>
> 
> Yes, but what that means right now is uncertain.  I can put in a
> dev_dbg( ) to track the fail but I don't want to exit immediately on
> that error since there may still be links to deal with in the for
> loop.

OK, makes sense.

>>> diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
>>> new file mode 100644
>>> index 0000000..ea7a760
>>> --- /dev/null
>>> +++ b/drivers/fsi/fsi-slave.h
>>> @@ -0,0 +1,62 @@
>>> +/*
>>> + * FSI slave engine definitions.
>>> + *
>>
>> Why does this need to be in a header file? Isn't it only used by the FSI
>> core?
> 
> I suppose this is me not being familiar with the common coding practices
> of the Linux community.  I would typically put constants and structs in an
> associated header file even if there was no intent to have them be used
> by anything outside the core.   Is it a requirement that this all be moved
> into fsi-core.c as a means of limiting accessibility?

It's not a requirement, but a strong convention. Only use headers for
stuff that you need to share across other files; this gives future
developers a definite indication of the scope of these macros, consts
and structs.

The less that is globally accessible, the better.

Regards,


Jeremy
