Return-Path: <awilliams@marvell.com>
Authentication-Results: lists.ozlabs.org;
 spf=fail (mailfrom) smtp.mailfrom=marvell.com
 (client-ip=173.8.172.90; helo=roger.doofus.org;
 envelope-from=awilliams@marvell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=marvell.com
Received: from roger.doofus.org (unknown [173.8.172.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43rJnq38rDzDqdR
 for <openbmc@lists.ozlabs.org>; Fri,  1 Feb 2019 12:06:04 +1100 (AEDT)
Received: from roger.doofus.org (localhost [127.0.0.1])
 by roger.doofus.org (Postfix) with ESMTP id 44E2480A4413;
 Thu, 31 Jan 2019 17:06:01 -0800 (PST)
Authentication-Results: roger.doofus.org; 
X-DKIM-Authentication-Results: none
Received: from flash.localnet (unknown [192.168.0.16])
 by roger.doofus.org (Postfix) with ESMTPSA id EAE2F801F490;
 Thu, 31 Jan 2019 17:06:00 -0800 (PST)
From: Aaron Williams <awilliams@marvell.com>
To: Patrick Venture <venture@google.com>
Cc: Emily Shaffer <emilyshaffer@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [EXT] Re: OpenBMC Sensors
Date: Thu, 31 Jan 2019 17:05:58 -0800
Message-ID: <8654571.dlUhQdZHB1@flash>
In-Reply-To: <CAO=notzSOb7VcYhByoyae63o3xFctpJpMCnKgaTn0dRKp+VckA@mail.gmail.com>
References: <6065976.siBLTEBlHZ@flash>
 <CAJoAoZnV+u8kJKV7TkPxU_b1hdmJ3nbFyD6rVMSd9ohPSjDHig@mail.gmail.com>
 <CAO=notzSOb7VcYhByoyae63o3xFctpJpMCnKgaTn0dRKp+VckA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
X-List-Received-Date: Fri, 01 Feb 2019 01:06:08 -0000

Hi Patric, Emily,

Thanks for your help. Are there any examples of this? I've tried looking at 
the other available platforms but I'm not finding anything for this.

-Aaron

On Thursday, January 31, 2019 7:30:04 AM PST Patrick Venture wrote:
> On Wed, Jan 30, 2019 at 8:49 PM Emily Shaffer <emilyshaffer@google.com> 
wrote:
> > Aaron,
> > 
> > If it's complaining at build time it's what it says on the box - you
> > probably need to include the recipe which builds
> > phosphor-fans-sensor-inventory.
> > 
> > Emily
> > 
> > On Wed, Jan 30, 2019, 8:17 PM Aaron Williams <awilliams@marvell.com> 
wrote:
> >> Hi Emily,
> >> 
> >> I'm still not sure how to go about using this, I'm still fairly new to
> >> OpenBMC. It's complaing about nothing providing
> >> 'virtual/phosphor-fans-sensor- inventory'.  I included
> >> phosphor-pid-control as one of our dependencies.
> Per Emily, you'll need to implement a recipe that defines the PID
> inputs.  It sounds like you have two PID loops.  One is the
> temperature sensor, and that feeds the set-point for the fans, which
> are a second PID loop.  The idea being, the temperature pid loop
> attempts to maintain the temperature under (or over) some set-point,
> and it'll in turn try to get the fans to speed up when necessary.
> 
> >> -Aaron
> >> 
> >> On Wednesday, January 30, 2019 1:48:10 PM PST you wrote:
> >> > Great, best luck Aaron. Thanks!
> >> > 
> >> > On Wed, Jan 30, 2019, 1:47 PM Aaron Williams <awilliams@marvell.com> 
wrote:
> >> > > Hi Emily,
> >> > > 
> >> > > Thank you, I will look into it. I don't think losing the sensors when
> >> > > we
> >> > > cut
> >> > > power to the host CPU will be much of an issue. I was just notified
> >> > > of a
> >> > > change to our CPLD that will allow the BMC to keep the sensors
> >> > > powered. At
> >> > > the
> >> > > moment, cutting power shuts of the power from the ATX power supply
> >> > > but now
> 
> As far as the sensors when the try is powered down, that's pretty
> common.  The hwmon driver on the BMC will just be unable to read the
> values, and you can deal with that in phosphor-hwmon a couple ways.
> Phosphor-pid-control will go into fail-safe mode if it doesn't receive
> a sensor value frequently enough.  This mode would cause it to drive
> the fans to a pre-defined set-point per a configuration.
> 
> >> > > I
> >> > > will have more fine-grained power control. Now I just have to figure
> >> > > out
> >> > > how
> >> > > to update the Lattice CPLD from the BMC... I found some code in the
> >> > > Facebook
> >> > > OpenBMC which hopefully I can port over.
> >> > > 
> >> > > -Aaron
> >> > > 
> >> > > On Wednesday, January 30, 2019 1:42:40 PM PST Emily Shaffer wrote:
> >> > > > Aaron, we use this daemon for local (to BMC) thermal control:
> >> > > > https://github.com/openbmc/phosphor-pid-control
> >> > > > Maybe you'll find it helpful.
> >> > > > 
> >> > > > Although I'm not sure how to help you with losing sensors when the
> >> > > > host
> >> > > > powers down but the BMC is expected to continue to cool the tray.
> >> > > > Sounds
> >> > > > like an issue with the board design, unless I'm not understanding
> >> > > > what
> >> > > > you're saying.
> >> > > > 
> >> > > > On Wed, Jan 30, 2019 at 1:28 PM Aaron Williams
> >> > > > <awilliams@marvell.com>
> >> > > > 
> >> > > > wrote:
> >> > > > > Hi Emily,
> >> > > > > 
> >> > > > > That's what I need the temperature for. We have two controllers,
> >> > > > > one
> >> > > 
> >> > > that
> >> > > 
> >> > > > > monitors the core temperature (a TI TMP421) and one that controls
> >> > > > > the
> >> > > 
> >> > > fans
> >> > > 
> >> > > > > (ADT7462). In order to maintain the thermal envelope the TMP421
> >> > > > > needs
> >> > > 
> >> > > to
> >> > > 
> >> > > > > be
> >> > > > > monitored to adjust the fan speed through the ADT7462.
> >> > > > > 
> >> > > > > Further complicating things is the fact that these sensors
> >> > > > > disappear
> >> > > 
> >> > > when
> >> > > 
> >> > > > > the
> >> > > > > host is powered down.
> >> > > > > 
> >> > > > > -Aaron
> >> > > > > 
> >> > > > > On Wednesday, January 30, 2019 9:49:32 AM PST Emily Shaffer 
wrote:
> >> > > > > > External Email
> >> > > 
> >> > > ---------------------------------------------------------------------
> >> > > -
> >> > > 
> >> > > > > > Hi Aaron,
> >> > > > > > 
> >> > > > > > Note that you only really need to worry about sending the
> >> > > > > > temperature
> >> > > > > > via
> >> > > > > > IPMI if you want to send it somewhere besides the BMC.  If you
> >> > > > > > plan
> >> > > 
> >> > > to
> >> > > 
> >> > > > > > do
> >> > > > > > internal thermal control (BMC reads temperature, BMC adjusts
> >> > > > > > fans
> >> > > > > > accordingly) you probably don't need IPMI config and can get
> >> > > > > > away
> >> > > 
> >> > > with
> >> > > 
> >> > > > > > setting it up as far as DBus in the sensor architecture doc Lei
> >> > > > > > sent.
> >> > > > > > 
> >> > > > > > Emily
> >> > > > > > 
> >> > > > > > On Thu, Jan 24, 2019 at 1:27 AM Lei YU <mine260309@gmail.com> 
wrote:
> >> > > > > > > On Thu, Jan 24, 2019 at 5:13 PM Aaron Williams <
> >> > > 
> >> > > awilliams@marvell.com>
> >> > > 
> >> > > > > > > wrote:
> >> > > > > > > > I see how to set up the hwmon portion defining the devices
> >> > > > > > > > based
> >> > > 
> >> > > on
> >> > > 
> >> > > > > the
> >> > > > > 
> >> > > > > > > device
> >> > > > > > > 
> >> > > > > > > > tree, but I am unsure how to go about configuring the YAML
> >> > > > > > > > and
> >> > > 
> >> > > other
> >> > > 
> >> > > > > > > files for
> >> > > > > > > 
> >> > > > > > > > this.
> >> > > > > > > 
> >> > > > > > > For sensors' config, please refer to
> >> > > > > > > https://github.com/openbmc/docs/blob/master/sensor-architectu
> >> > > > > > > re.md
> >> > > > > > > 
> >> > > > > > > And it looks you are looking for fan controls, then you could
> >> > > 
> >> > > refer
> >> > > to:
> >> > > 
> >> > > https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide
> >> > > .md#f
> >> > > 
> >> > > > > > > ans
> >> > > > > > > 
> >> > > > > > > (I really need to submit my porting guide to openbmc/docs)
