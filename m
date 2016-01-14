Return-Path: <cyril.bur@au1.ibm.com>
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0B8E31A009A
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 10:12:44 +1100 (AEDT)
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyril.bur@au1.ibm.com>;
 Fri, 15 Jan 2016 09:12:43 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 15 Jan 2016 09:12:40 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: cyril.bur@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 781323578052
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 10:12:39 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0ENCVd140370382
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 10:12:39 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0ENC6OR013305
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 10:12:07 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0ENC6sV012673; Fri, 15 Jan 2016 10:12:06 +1100
Received: from camb691 (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 64999A0118;
 Fri, 15 Jan 2016 10:11:12 +1100 (AEDT)
Date: Fri, 15 Jan 2016 10:11:12 +1100
From: Cyril Bur <cyril.bur@au1.ibm.com>
To: Daniel Axtens <dja@axtens.net>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH btbridge 1/3] Initialise variable to avoid using it
 uninitialised
Message-ID: <20160115101112.1aeafa3b@camb691>
In-Reply-To: <87vb6v4wkd.fsf@gamma.ozlabs.ibm.com>
References: <1452750607-27095-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452750607-27095-2-git-send-email-openbmc-patches@stwcx.xyz>
 <87vb6v4wkd.fsf@gamma.ozlabs.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.13.1 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16011423-0025-0000-0000-000002C24AA2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jan 2016 23:12:45 -0000

On Fri, 15 Jan 2016 09:37:22 +1100
Daniel Axtens <dja@axtens.net> wrote:

> Out of curiosity, how did you find this? I'm guessing inspection?
> 

Yep

> OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> 
> > From: Cyril Bur <cyril.bur@au1.ibm.com>
> >
> > ---
> >  btbridged.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/btbridged.c b/btbridged.c
> > index fe692bb..3e261a9 100644
> > --- a/btbridged.c
> > +++ b/btbridged.c
> > @@ -489,7 +489,7 @@ static int dispatch_sd_bus(struct btbridged_context *context)
> >  static int dispatch_bt(struct btbridged_context *context)
> >  {
> >  	int err = 0;
> > -	int r;
> > +	int r = 0;
> >  
> >  	assert(context);
> >  
> > -- 
> > 2.6.4
> >
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc  
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
