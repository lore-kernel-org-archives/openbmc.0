Return-Path: <cyril.bur@au1.ibm.com>
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A7B6F1A087B
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2015 15:35:22 +1100 (AEDT)
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyril.bur@au1.ibm.com>;
 Thu, 10 Dec 2015 14:35:19 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 10 Dec 2015 14:35:18 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: cyril.bur@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id C7CBD3578047
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2015 15:35:14 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBA4Z6G566060304
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2015 15:35:14 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBA4YgnF014997
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2015 15:34:42 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBA4Yeib014344; Thu, 10 Dec 2015 15:34:41 +1100
Received: from camb691 (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0316AA007B;
 Thu, 10 Dec 2015 15:33:46 +1100 (AEDT)
Date: Thu, 10 Dec 2015 15:33:45 +1100
From: Cyril Bur <cyril.bur@au1.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH btbridge v2 1/3] Update usage message
Message-ID: <20151210153345.08156645@camb691>
In-Reply-To: <CACPK8Xfx+hqgaSkR8Ad-O4Rm8jdxYtzfvoUOfdmB4XgcZmse1Q@mail.gmail.com>
References: <1449641406-15479-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1449641406-15479-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8Xfx+hqgaSkR8Ad-O4Rm8jdxYtzfvoUOfdmB4XgcZmse1Q@mail.gmail.com>
Organization: IBM
X-Mailer: Claws Mail 3.13.0 (GTK+ 2.24.28; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15121004-0029-0000-0000-00000296883F
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
X-List-Received-Date: Thu, 10 Dec 2015 04:35:23 -0000

On Thu, 10 Dec 2015 11:33:23 +1030
Joel Stanley <joel@jms.id.au> wrote:

> On Wed, Dec 9, 2015 at 4:40 PM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Cyril Bur <cyril.bur@au1.ibm.com>
> >
> > ---
> >  btbridged.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/btbridged.c b/btbridged.c
> > index 115ae63..ab4880c 100644
> > --- a/btbridged.c
> > +++ b/btbridged.c
> > @@ -584,7 +584,8 @@ out:
> >
> >  static void usage(const char *name)
> >  {
> > -       fprintf(stderr, "Usage %s\n", name);
> > +       fprintf(stderr, "Usage %s [ --debug | --verbose ]\n", name);
> > +       fprintf(stderr, "\t--debug\t Implies --verbose\n\t Dumps entire message contents to console\n");  
> 
> I don't know what this means. What's the difference between debug and verbose?
> 

The initial idea was that verbose doesn't actually do anything but print more
info. debug does actually do extra work. I agree though that from the
users perspective debug just prints more... and they won't care about the
distinction I'm making about added work or not.

> It might be more discoverable to support multiple levels of verbosity.
> -v for verbose, -vv for what you term "debug".

Good idea, I'll add to pull request

> 
> >         fprintf(stderr, "\t--verbose\t Be verbose\n\n");
> >  }
> >
> > --
> > 2.6.3
> >
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc  
> 
