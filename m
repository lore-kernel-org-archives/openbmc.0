Return-Path: <benh@au1.ibm.com>
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r1Cwl18mDzDq5m
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2016 10:54:46 +1000 (AEST)
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Fri, 6 May 2016 10:54:45 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 6 May 2016 10:54:43 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: benh@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 2BFFB3578056
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2016 10:54:43 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u460sZWj14483476
 for <openbmc@lists.ozlabs.org>; Fri, 6 May 2016 10:54:43 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u460sA9J008377
 for <openbmc@lists.ozlabs.org>; Fri, 6 May 2016 10:54:10 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u460sAlb008037; Fri, 6 May 2016 10:54:10 +1000
Received: from pasglop.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EE15EA01E9;
 Fri,  6 May 2016 10:53:45 +1000 (AEST)
Message-ID: <1462496025.20290.45.camel@au1.ibm.com>
Subject: Re: [PATCH 4/6] arm/dts: Set I2C_TEN_BIT_ADDRESS in Firestone BMC
 board i2c addresses
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Joel Stanley <joel@jms.id.au>, Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Gavin Shan
 <gwshan@linux.vnet.ibm.com>
Date: Fri, 06 May 2016 10:53:45 +1000
In-Reply-To: <CACPK8Xf7Bzi99E3=69Pi_O1aZTG9EOUNy+1uNO6+-87=zbTF1w@mail.gmail.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
 <1462411636-7225-5-git-send-email-cyrilbur@gmail.com>
 <CACPK8Xf7Bzi99E3=69Pi_O1aZTG9EOUNy+1uNO6+-87=zbTF1w@mail.gmail.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050600-0017-0000-0000-0000047612C5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 May 2016 00:54:47 -0000

On Thu, 2016-05-05 at 22:51 +0930, Joel Stanley wrote:
> On Thu, May 5, 2016 at 10:57 AM, Cyril Bur <cyrilbur@gmail.com>
> wrote:
> 
> Did you work out why we needed this, and why it fixes things?
> 
> Should we be doing it for all the device trees?

That's weird indeed... Is there a 10-bit device on that bus ? Otherwise
we shouldn't emit 10-bit addresses. In general, 10-bit addresses stuff
doesn't work, in my experience at least. We might be papering over some
other problem...

> > 
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> > b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> > index 2b988e7..379b561 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> > @@ -75,7 +75,7 @@
> >                                 i2c5: i2c-bus@180 {
> >                                         tmp423@98 {
> >                                                 compatible =
> > "ti,tmp423";
> > -                                               reg = <0x98>;
> > +                                               reg = <0x80000098>;
> >                                         };
> >                                 };
> >                                 i2c6: i2c-bus@1c0 {
> > @@ -98,27 +98,27 @@
> >                                         status = "okay";
> >                                         leds@c0 {
> >                                                 compatible =
> > "pca,pca9552led";
> > -                                               reg = <0xc0>;
> > +                                               reg = <0x800000c0>;
> >                                                 // led9 -
> > led_fault_n
> >                                                 // led10 -
> > pwr_led_n
> >                                                 // led11 -
> > rear_id_led_n
> >                                         };
> >                                         rtc@d0 {
> >                                                 compatible =
> > "dallas,ds3231";
> > -                                               reg = <0xd0>;
> > +                                               reg = <0x800000d0>;
> >                                         };
> >                                         si5338a@e2 {
> >                                                 // SiLabs clock
> > generator
> > -                                               reg =<0xe2>;
> > +                                               reg =<0x800000e2>;
> >                                         };
> > 
> >                                         idt@d6 {
> >                                                 // IDT 9DBV0641
> > clock buffer
> > -                                               reg = <0xd6>;
> > +                                               reg = <0x800000d6>;
> >                                         };
> > 
> >                                         tpm@a3 {
> > -                                               reg = <0xa3>;
> > +                                               reg = <0x800000a3>;
> >                                         };
> >                                 };
> >                                 i2c12: i2c-bus@440 {
> > --
> > 2.8.2
> > 
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
