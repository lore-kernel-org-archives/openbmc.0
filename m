Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq6yJ5pT7zDq7d
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 13:37:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vq6yJ3Yvqz9s3l;
 Fri, 24 Mar 2017 13:37:12 +1100 (AEDT)
Subject: Re: Upstream work for OpenFSI patches
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org,
 Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <05efd2cd-b928-96eb-433e-49ff451eaaf3@ozlabs.org>
 <00baa1b7-d784-b73a-d396-e132bea3057b@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <14e0e695-861d-f5f2-fb61-30627de0e11b@ozlabs.org>
Date: Fri, 24 Mar 2017 10:37:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <00baa1b7-d784-b73a-d396-e132bea3057b@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 24 Mar 2017 02:37:12 -0000

Hi Chris,

Thanks for taking a look.

> Have you run much testing on bad bus accesses to verify recovery from
> errors?

Yes, I've tested two main scenarios:

 1) read from the SBE FIFO (CFAM addr 0xc00) when no FIFO data is present

    this results in endless BUSY/DPOLL, which we now correctly recover
    entirely within the fsi_master_gpio_xfer() function, as it now
    supports sending TERM

 2) accesses to non-existent slaves behind a cMFSI (CFAM addr 0x80000,
    referencing an unused cMFSI link)

    this is handled by the core error handler, which recovers the CFAM
    non-intrusively

If there's other areas that need testing, let me know.

>>   - Hub master: this is now implemented as a fsi engine driver, as the
>>     fsi_slave_{read,write}() functions are exported (and the port count
>>     is available in the hMFSI configuration register)
> I noticed you moved the FSI master control register definitions into
> fsi-master-hub.c   Though its not presently used, the cmFSI engine also
> shares a common control register setup for the most part and its
> possible there could be other implementations using the same scheme in
> the future.   Would it be preferable to move these into fsi-master.h or
> some other common master code?

We should move it to common code when (or if) we need it there. It may
be that we end up handling both cMFSI and hMFSI with the same driver.

I think it's a good idea to keep the scope of things as small as
possible, until usage dictates otherwise.

>>   - IRQ support needs more work, but there doesn't seem to be any
>>     consumers of that so far
> As long as we migrate to the final IIC driver solution before switching
> over to your new code then there is no interrupt support required. 
> Otherwise we'll need to consider when your changes are phased in.

OK. The IRQ support needs a bit of a rework, and we will probably want
to use the generic Linux irq infrastructure to implement that. We'll
probably also need it for whatever the final i2c driver implementation
is, so I'll bump that up my priority list.

>> So, please take a look at the series and let me know if there is
>> anything that still needs doing (particularly fixes that have come in
>> since the first series), and we can work out our plan for upstream
>> progression.
> The community had wanted crc calculations moved from drivers/fsi to the
> kernel/lib path on a previous patch set submission I sent out. Do you
> think this is something that will be required in your changes?

The last email I'd sent about that (to Greg) was asking how we would
handle different polynomial values if we were to move it to lib/. I
didn't get an answer to that, so I've added this to the commit message:

    We add this to the fsi code (rather than lib/), as we need a specific
    polynomial for FSI CRCs.

So, if we receive the same feedback, we'll need to figure out how to
handle that.

> The community also didn't want the fake FSI master driver included.   Is
> this something we should keep?

Was that feedback from me, or upstream?

Regardless, I've marked it as DEBUG, so am not intending to send it :)

Cheers,


Jeremy
