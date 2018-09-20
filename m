Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="a2oUfWiB"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42GPqd6q5XzDq61
 for <openbmc@lists.ozlabs.org>; Fri, 21 Sep 2018 04:08:45 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id j26-v6so4732171pfi.10
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C3KnnUW8ADMuPlxEaz3Sx46B96gdCKurfI9VWXJh0Do=;
 b=a2oUfWiBFTfqF+Oys8MlL4f3YlKsc2d7bH7IUEs347pXfteSbAtIPdqZzUZIJXyVjD
 HMD3EczQI9fgbnplOmMNbRh+D4vJMBNwG5WsmEKEjsjCCG7q4Mz04nJgTFsfbFbZaxKb
 6Lsf4HzRPtKTYKpHMu3dfwjxXJy3t/DZ5jMM68kVveeoklYhNoF6kwc8C5DUBhMjcVCn
 fPt9TCq7TNsCDG+Mq0HYVcMPLpbOl5TNtCBC1WubXeutHgVyDyX/dCpqI07vi/blQNls
 phluCUC7HjGwj1F1JqduiL2/gKB5BlttWi8I77Fq908Cak8LUgi0DQvUPxiqxcICd/SW
 7gHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C3KnnUW8ADMuPlxEaz3Sx46B96gdCKurfI9VWXJh0Do=;
 b=ZBE/lvEt9LPvGr+TcsyHqGQrHc+Bb89Ab1PRM8c3j71FiJKq9jfssUAidPCx6dwFuQ
 PY3inFa+9+7uyzCdiijOWLKGPpn7nV21arwi0z48vsKMJrBGzpmHljLh3WNFlOfo0xwH
 zXAu1rdS5r9gtbC1bTJOyN4vjeXiVFeovESfu95Aiwl6Kbdzvy7P1ZPfR2AmpSG1tnZK
 xEF4XvzYqqZH9QY8UvIFYUrQEVaGzejSxsy8IOwp5umD4UYuksZ/51BaT0HY5Tjvdmq8
 dJV5cyeXNWUdIhZgNn6Vv8FG1PzRXsY3T3xYUQAlyLGEZENzLy8nd9cIcCbS1TIb8dHZ
 AGdQ==
X-Gm-Message-State: APzg51C431bmv1vI1e3d36kWT8nH0vaRabrpXLiQCIbImSQ1QZlwmgLD
 lCecNvJaw7kLCHI0tpcblu9KFPoslZR2DZHqq8uruw==
X-Google-Smtp-Source: ANB0VdbpiW6C7b6cTD+PEK1cRVmOqp7bpiJSrjO2V6l7AMaA56+x8a9u0c0wlj3mlvBjFaElRzUnq52/+Ktka64lHY0=
X-Received: by 2002:a63:6c04:: with SMTP id
 h4-v6mr25279854pgc.290.1537466923106; 
 Thu, 20 Sep 2018 11:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20180911225630.124502-1-venture@google.com>
 <585d1c3a-6121-c20d-f6d6-7567595cd1af@acm.org>
 <CAO=notzHoqsjuSdEZby0mr3KgtoxtYjdr_X0nM_2zBu0NcOOAA@mail.gmail.com>
 <CAO=notwkMAe_9=32D+ycPwiZ=c_un7sQ+Le9PW_oDiVeBp25jg@mail.gmail.com>
 <966e9741-6a27-a511-8d39-6576d8cfc8f8@gmail.com>
 <CAO=notzJxVuf+jfLaSde1iMRBE2=qwWGSCj+JzJociYK6yGTdQ@mail.gmail.com>
 <25f12226-b974-9373-cb9b-b04f2a6dfcdf@acm.org>
In-Reply-To: <25f12226-b974-9373-cb9b-b04f2a6dfcdf@acm.org>
From: Patrick Venture <venture@google.com>
Date: Thu, 20 Sep 2018 11:08:31 -0700
Message-ID: <CAO=notw5bjRbiPY6xfkNpQ+dkziNKxKfxWhT6=VVRcfUfAQ1tw@mail.gmail.com>
Subject: Re: [PATCH v2] ipmi: looped device detection
To: Corey Minyard <minyard@acm.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, 
 openipmi-developer@lists.sourceforge.net, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Sep 2018 18:08:47 -0000

On Wed, Sep 19, 2018 at 1:20 PM Corey Minyard <minyard@acm.org> wrote:
>
> On 09/19/2018 02:56 PM, Patrick Venture wrote:
> > On Tue, Sep 18, 2018 at 2:37 PM Corey Minyard <tcminyard@gmail.com> wrote:
> >> On 09/18/2018 01:42 PM, Patrick Venture wrote:
> >>> On Wed, Sep 12, 2018 at 3:54 PM Patrick Venture <venture@google.com> wrote:
> >>>> On Wed, Sep 12, 2018 at 3:10 PM Corey Minyard <minyard@acm.org> wrote:
> >>>>> On 09/11/2018 05:56 PM, Patrick Venture wrote:
> >>>>>> Try to get the device ID repeatedly during initialization before giving up.
> >>>>>> The BMC isn't always responsive, and this allows it to be slightly flaky
> >>>>>> during early boot.
> >>>>>>
> >>>>>> Tested: Installed on a system with the BMC software disabled
> >>>>>> such that it was non-responsive.  The driver correctly detected this
> >>>>>> and gave up as expected.  Then I re-enabled the BMC software unloaded
> >>>>>> and reloaded the driver and it was detected properly.
> >>>>> The patch looks fine, but I wonder if this is something that is really
> >>>>> valuable.
> >>>>> I have wondered about this before.
> >>>>>
> >>>>> The question is: If the BMC is unavailable, what are the chances of it
> >>>>> becoming
> >>>>> available by the time you do 5 attempts?  I would guess that is a pretty
> >>>>> small
> >>>>> chance, which is why I haven't done this already.
> >>> Friendly ping.  I'd like to get a sense of whether you're likely to
> >>> accept this.  If not, it's fine, will close out patch in current
> >>> downstream rebase.
> >> I'm ok with doing this, but I lied about the patch being fine, there are
> >> some issue.
> >> Well, I didn't lie, but I didn't look closely enough.
> >>
> >> Can you use dev_xxx() instead of pr_xxx().  I know the driver isn't
> >> currently
> >> consistent, but there are a number of patches I have pending to make it
> >> better and it's a longer-term goal.
> > Ack.
> >
> >> Can you make GET_DEVICE_ID_ATTEMPTS more specific, add IPMI_SI_ to
> >> the beginning or something.
> > Ack.
> >
> >> I am not sure that I'm ok with waiting up to 1.25 seconds in the init
> >> function.
> >> As I mentioned before, a large number of systems have broken ACPI/SMBIOS
> >> information, and for those it will add 1.25 seconds to the boot time of
> >> every
> >> one of those systems.  That won't make me a popular guy :-).
> > Yeah, that's problematic for the systems that'll never get a valid
> > response.  I don't think it makes sense to gate the feature with a
> > configuration option, do you?
>
> Yeah, a config option wouldn't really help.  You could do a module parm,
> but that's
> really not very easy to use.
>
> Pushing the detection off to a thread would solve that problem, but it
> creates its
> own problems.  The driver may be in the process of detecting something, but
> it may not be ready when the module load or kernel boot finishes.
>
> I don't think this has been an issue in the past because generally the
> BMC is
> integral to the boot of most systems.  So it's always operational by the
> time
> the OS comes up.
>
> So I'm not sure what to do.

Let's drop the patch.  I'll maintain it downstream.  Thanks for your
thoughts and time on this.

>
> -corey
>
> >> This is a harder problem to figure out what to do.  To solve it properly
> >> would
> >> mean having a timer or thread drive this, and unload the module later if
> >> the process fails.
> >>
> >> -corey
> >>
> >>> Thanks
> >>>
> >>>> This patch was actually critical for us to provide a reliable IPMI
> >>>> interface.  The version of OpenBMC or the state of the BMC at the
> >>>> point the kernel was loading was flaky, so following the example in
> >>>> the BIOS source, we just re-try a few times.  We also can hold boot X
> >>>> seconds until it's responding, but, this avoided some issues inherent
> >>>> with that.
> >>>>
> >>>>> You could have something that re-tested periodically, but there are so many
> >>>>> systems with IPMI specified in ACPI or SMBIOS that is wrong, and it would
> >>>>> try forever.  Also not really a good thing.
> >>>> If we did a periodic check, it could check X times, but I felt going
> >>>> for a simple solution was ideal -- and this idea was proved out on a
> >>>> few platforms.  We have other drivers that are loaded by the kernel
> >>>> (not at run-time) and they depend on IPMI, and without this patch they
> >>>> would then have a non-trivial probability of failure.
> >>>>
> >>>>> So I've left it to reload the driver or use the hotmod interface.
> >>>>>
> >>>>> -corey
> >>>>>
> >>>>>> Signed-off-by: Patrick Venture <venture@google.com>
> >>>>>> ---
> >>>>>> v2:
> >>>>>>     - removed extra variable that was set but not used.
> >>>>>> ---
> >>>>>>     drivers/char/ipmi/ipmi_si_intf.c | 23 ++++++++++++++++++++++-
> >>>>>>     1 file changed, 22 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> >>>>>> index 90ec010bffbd..5fed96897fe8 100644
> >>>>>> --- a/drivers/char/ipmi/ipmi_si_intf.c
> >>>>>> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> >>>>>> @@ -1918,11 +1918,13 @@ int ipmi_si_add_smi(struct si_sm_io *io)
> >>>>>>      * held, primarily to keep smi_num consistent, we only one to do these
> >>>>>>      * one at a time.
> >>>>>>      */
> >>>>>> +#define GET_DEVICE_ID_ATTEMPTS       5
> >>>>>>     static int try_smi_init(struct smi_info *new_smi)
> >>>>>>     {
> >>>>>>         int rv = 0;
> >>>>>>         int i;
> >>>>>>         char *init_name = NULL;
> >>>>>> +     unsigned long sleep_rm;
> >>>>>>
> >>>>>>         pr_info(PFX "Trying %s-specified %s state machine at %s address 0x%lx, slave address 0x%x, irq %d\n",
> >>>>>>                 ipmi_addr_src_to_str(new_smi->io.addr_source),
> >>>>>> @@ -2003,7 +2005,26 @@ static int try_smi_init(struct smi_info *new_smi)
> >>>>>>          * Attempt a get device id command.  If it fails, we probably
> >>>>>>          * don't have a BMC here.
> >>>>>>          */
> >>>>>> -     rv = try_get_dev_id(new_smi);
> >>>>>> +     for (i = 0; i < GET_DEVICE_ID_ATTEMPTS; i++) {
> >>>>>> +             pr_info(PFX "Attempting to read BMC device ID\n");
> >>>>>> +             rv = try_get_dev_id(new_smi);
> >>>>>> +             /* If it succeeded, stop trying */
> >>>>>> +             if (!rv)
> >>>>>> +                     break;
> >>>>>> +
> >>>>>> +             /* Sleep for ~0.25s before trying again instead of hammering
> >>>>>> +              * the BMC.
> >>>>>> +              */
> >>>>>> +             sleep_rm = msleep_interruptible(250);
> >>>>>> +             if (sleep_rm != 0) {
> >>>>>> +                     pr_info(PFX "Find BMC interrupted\n");
> >>>>>> +                     rv = -EINTR;
> >>>>>> +                     goto out_err;
> >>>>>> +             }
> >>>>>> +     }
> >>>>>> +
> >>>>>> +     /* If we exited the loop above and rv is non-zero we ran out of tries.
> >>>>>> +      */
> >>>>>>         if (rv) {
> >>>>>>                 if (new_smi->io.addr_source)
> >>>>>>                         dev_err(new_smi->io.dev,
>
>
