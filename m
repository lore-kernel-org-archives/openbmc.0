Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EI+b6CDh"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FBgy6zbnzF3HZ
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 04:42:54 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id j8-v6so1434164pff.6
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 11:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ch1q9tyLzHlfEUq+lFlyelPOQLAB/H3ySbiSj0A7Z2U=;
 b=EI+b6CDh4TaWw68vsOVgxPBy2WQCXms9LwucTVv11Y65hepRvA+bEcwgRUzfHGC6fM
 PLJUAxXaeTSeFOdSfx0qw350EByQADvGLDJj9/gwJSqNDv48IjvreIShSmf/WmV1vEkZ
 sKpbiMNnv9f6egk+Y6/lPoF1Nz57iX8EVAnoJakOrP50+uqvhRf2kIlblzP+C9DS2Hr/
 QOx0/aVfxiumiNqeNGtUotqh7WthbAu7FCGM3kqEwyxZYLTm6aSXNkzuS8vMUBHLThC1
 89HLI+2PJOh+RnuA6HDtH/qNCEcZZWfpQz2wmLS2/xtU3amqTnyW7vXIe58B7sMYoJw8
 DCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ch1q9tyLzHlfEUq+lFlyelPOQLAB/H3ySbiSj0A7Z2U=;
 b=KEao6H7a9N/OWhLyEGaU9WGlZmMAkej94+6Cgzh5Wl4oGx/YW6cAXQ3XFE5bhZtrwI
 vFZhhZxjYA8o60nNIZzpCaqbXxqkMEWrHDatBsXz9iBzovXCwo5NEJXTbMf557HmMLBb
 MJgUjWYSkg07nyD8wyEciLPCpUZfQoBTj1ENx1YWGu+/aG8wGaL99CRI1VVSpwNkKDjA
 gVviv3KbadyFwUex6jocW1oEVhYHEbVraMi5JidnMbM63lOItBzwaQjjcUDWGJO3vMxp
 KfVKg0PGjfjE4IOWvOyGOPa9n5tfQitqhgSHlcZSFFbAL+uH5RP5CU9HcYbIWHsGwhGm
 IOxg==
X-Gm-Message-State: APzg51BRMAN660a+0itT7boL3ACPIJ3BN0WeTAQ39TgNrpeM5Ygwnera
 1nUdcuMF3hwVhkue7I/P1dpewXcT3KyutzquOCNI5RXr
X-Google-Smtp-Source: ANB0Vda5wT/bctc/0cwLuq4LLmmkbU3BbnjWS85R32SqMwz2dbPYMbq/PO7i1Bk0pFaB+TJHDOXgypuE9fSNKz8gfT8=
X-Received: by 2002:a63:8543:: with SMTP id
 u64-v6mr29876886pgd.248.1537296171927; 
 Tue, 18 Sep 2018 11:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180911225630.124502-1-venture@google.com>
 <585d1c3a-6121-c20d-f6d6-7567595cd1af@acm.org>
 <CAO=notzHoqsjuSdEZby0mr3KgtoxtYjdr_X0nM_2zBu0NcOOAA@mail.gmail.com>
In-Reply-To: <CAO=notzHoqsjuSdEZby0mr3KgtoxtYjdr_X0nM_2zBu0NcOOAA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 18 Sep 2018 11:42:40 -0700
Message-ID: <CAO=notwkMAe_9=32D+ycPwiZ=c_un7sQ+Le9PW_oDiVeBp25jg@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Sep 2018 18:42:56 -0000

On Wed, Sep 12, 2018 at 3:54 PM Patrick Venture <venture@google.com> wrote:
>
> On Wed, Sep 12, 2018 at 3:10 PM Corey Minyard <minyard@acm.org> wrote:
> >
> > On 09/11/2018 05:56 PM, Patrick Venture wrote:
> > > Try to get the device ID repeatedly during initialization before giving up.
> > > The BMC isn't always responsive, and this allows it to be slightly flaky
> > > during early boot.
> > >
> > > Tested: Installed on a system with the BMC software disabled
> > > such that it was non-responsive.  The driver correctly detected this
> > > and gave up as expected.  Then I re-enabled the BMC software unloaded
> > > and reloaded the driver and it was detected properly.
> >
> > The patch looks fine, but I wonder if this is something that is really
> > valuable.
> > I have wondered about this before.
> >
> > The question is: If the BMC is unavailable, what are the chances of it
> > becoming
> > available by the time you do 5 attempts?  I would guess that is a pretty
> > small
> > chance, which is why I haven't done this already.

Friendly ping.  I'd like to get a sense of whether you're likely to
accept this.  If not, it's fine, will close out patch in current
downstream rebase.

Thanks

>
> This patch was actually critical for us to provide a reliable IPMI
> interface.  The version of OpenBMC or the state of the BMC at the
> point the kernel was loading was flaky, so following the example in
> the BIOS source, we just re-try a few times.  We also can hold boot X
> seconds until it's responding, but, this avoided some issues inherent
> with that.
>
> >
> > You could have something that re-tested periodically, but there are so many
> > systems with IPMI specified in ACPI or SMBIOS that is wrong, and it would
> > try forever.  Also not really a good thing.
>
> If we did a periodic check, it could check X times, but I felt going
> for a simple solution was ideal -- and this idea was proved out on a
> few platforms.  We have other drivers that are loaded by the kernel
> (not at run-time) and they depend on IPMI, and without this patch they
> would then have a non-trivial probability of failure.
>
> >
> > So I've left it to reload the driver or use the hotmod interface.
> >
> > -corey
> >
> > > Signed-off-by: Patrick Venture <venture@google.com>
> > > ---
> > > v2:
> > >   - removed extra variable that was set but not used.
> > > ---
> > >   drivers/char/ipmi/ipmi_si_intf.c | 23 ++++++++++++++++++++++-
> > >   1 file changed, 22 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> > > index 90ec010bffbd..5fed96897fe8 100644
> > > --- a/drivers/char/ipmi/ipmi_si_intf.c
> > > +++ b/drivers/char/ipmi/ipmi_si_intf.c
> > > @@ -1918,11 +1918,13 @@ int ipmi_si_add_smi(struct si_sm_io *io)
> > >    * held, primarily to keep smi_num consistent, we only one to do these
> > >    * one at a time.
> > >    */
> > > +#define GET_DEVICE_ID_ATTEMPTS       5
> > >   static int try_smi_init(struct smi_info *new_smi)
> > >   {
> > >       int rv = 0;
> > >       int i;
> > >       char *init_name = NULL;
> > > +     unsigned long sleep_rm;
> > >
> > >       pr_info(PFX "Trying %s-specified %s state machine at %s address 0x%lx, slave address 0x%x, irq %d\n",
> > >               ipmi_addr_src_to_str(new_smi->io.addr_source),
> > > @@ -2003,7 +2005,26 @@ static int try_smi_init(struct smi_info *new_smi)
> > >        * Attempt a get device id command.  If it fails, we probably
> > >        * don't have a BMC here.
> > >        */
> > > -     rv = try_get_dev_id(new_smi);
> > > +     for (i = 0; i < GET_DEVICE_ID_ATTEMPTS; i++) {
> > > +             pr_info(PFX "Attempting to read BMC device ID\n");
> > > +             rv = try_get_dev_id(new_smi);
> > > +             /* If it succeeded, stop trying */
> > > +             if (!rv)
> > > +                     break;
> > > +
> > > +             /* Sleep for ~0.25s before trying again instead of hammering
> > > +              * the BMC.
> > > +              */
> > > +             sleep_rm = msleep_interruptible(250);
> > > +             if (sleep_rm != 0) {
> > > +                     pr_info(PFX "Find BMC interrupted\n");
> > > +                     rv = -EINTR;
> > > +                     goto out_err;
> > > +             }
> > > +     }
> > > +
> > > +     /* If we exited the loop above and rv is non-zero we ran out of tries.
> > > +      */
> > >       if (rv) {
> > >               if (new_smi->io.addr_source)
> > >                       dev_err(new_smi->io.dev,
> >
> >
