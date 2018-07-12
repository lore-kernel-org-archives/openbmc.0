Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4003:c06::244; helo=mail-oi0-x244.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oeAU74hR"; 
 dkim-atps=neutral
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41R8Tg6QdJzF35T
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 18:38:15 +1000 (AEST)
Received: by mail-oi0-x244.google.com with SMTP id v8-v6so54345414oie.5
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 01:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ANCuzMDOuGzWh1rGYNHuKELt8cqOFlK/eqtEdgjsPU=;
 b=oeAU74hRhWreE8llp6Q+q+ZqKNksBsWMVvPRHaphh4MZwQyciwElLkad6GLRmjH1A7
 32TaJTY6YwStkUbikcGbkvOYXgvS7+9N7Bn4CaRdbd9QDpAJZsfuHrwlopwoNkNqZzdY
 enB9fkBuQUz8BsP9Jh9V8Mor/G08fJR+axowQImlXTFan1RfA9FreNejngKPFtdmLIkZ
 UMN+3cx5o6Bp3GcKrfOgLWzQywwcSATAIdVjZFii07wRH/4S5+jZB5p4FE0S/IhV6PEY
 1V0ef8fVijNXtLEBKN5NgR6ns05Q5oWSlXKmJr+NLRAsuYbKDABgKK1EVd9Q4ExIemA0
 R4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ANCuzMDOuGzWh1rGYNHuKELt8cqOFlK/eqtEdgjsPU=;
 b=IaSUe2C/RQEeUJ0QW8zKUqp3Dk1ModWYVxouud91gWQz+2Siq3HgVDeWEmlidxNA3P
 Vj1unDRKzEjh/RRZaxv8iXE/Am6WrwEjgXA5bPm4Fh1mwCdOcebvWxvhTUAGmUX1rQEd
 WaxzMKEE8sUfux4R5JIGs7CdD3/Q6OWwWuEUOmK11QDLM5RzrIgwJVn0wFADVxUlrl83
 hVoBUTWzF77CZSB9IqZ7obt75Wm25cqN8U3QSYMevc/UtrRkS3H4PtahS9RBWkvBrQDz
 lLh+10bI/wgM7xHyDlkLnGpZLDbzc1N+f/QuPU2Vv9Hk9s1cdLnRnuYGMK9iqQXUIggl
 pbTA==
X-Gm-Message-State: AOUpUlEf7UuFfAMHVgr8XOIHQJ3sZPJklxUEdUwmObtU2c3UGu7bbN8l
 21I+xw47ufWMwnb+EzSpOUkpAqRCO+yyOyHFNlC5aA==
X-Google-Smtp-Source: AAOMgpcBklmjoVhyKUIb3HIZbgS3APMObCZu73IcUy17/ol3YlBjvq8wVgxtzhJDIO92SFhfK7EWwJnq9ylVK3X2tc0=
X-Received: by 2002:aca:190d:: with SMTP id
 l13-v6mr1422996oii.216.1531384692063; 
 Thu, 12 Jul 2018 01:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <20180702211359.30585-1-jae.hyun.yoo@linux.intel.com>
 <CAFd5g443wTQJ+0hrprOV949Sr_nRnBGpNo3Wd01xFN4GW4K2Ng@mail.gmail.com>
 <2d2f2b2b-394a-506f-c870-33520335250b@linux.intel.com>
 <c13fc12e859f7bdb300f08ad805cdf6d7ec09f52.camel@perches.com>
In-Reply-To: <c13fc12e859f7bdb300f08ad805cdf6d7ec09f52.camel@perches.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 12 Jul 2018 01:38:00 -0700
Message-ID: <CAFd5g47-Bq_wUkL4vP93si+urDs-A0j26ukZ+Riy24HWi5AuuA@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Add newline characters into message
 printings.
To: joe@perches.com
Cc: jae.hyun.yoo@linux.intel.com, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, 
 james.feist@linux.intel.com, vernon.mauery@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 08:38:17 -0000

On Wed, Jul 11, 2018 at 10:10 AM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2018-07-11 at 09:53 -0700, Jae Hyun Yoo wrote:
> > On 7/10/2018 10:42 PM, Brendan Higgins wrote:
> > > On Mon, Jul 2, 2018 at 2:14 PM Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> > > > There are some log printing without a newline character. This
> > > > patch adds the missing newline characters.
> []
> > > > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> []
> > > > @@ -431,7 +431,7 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
> > > >           */
> > > >          if (bus->master_state == ASPEED_I2C_MASTER_START) {
> > > >                  if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
> > > > -                       pr_devel("no slave present at %02x", msg->addr);
> > > > +                       pr_devel("no slave present at %02x\n", msg->addr);
> > >
> > > Unless something changed in the last couple versions of the kernel, this is the
> > > only line that actually changes anything. dev_* inserts a newline for every
> > > call.
>
> Not true.
>
> Any printk without KERN_CONT inserts a newline
> if the last character
> emitted is not a newline.
>
> dev_<level> uses can also be followed by pr_cont.
>
> So this patch does reduce the possibility of
> interleaved messages from multiple processes.

My mistake. Thanks for pointing that out.

Jae, forget what I said earlier. This looks good to me.
