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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43qcQv6STTzDqD1
 for <openbmc@lists.ozlabs.org>; Thu, 31 Jan 2019 08:47:19 +1100 (AEDT)
Received: from roger.doofus.org (localhost [127.0.0.1])
 by roger.doofus.org (Postfix) with ESMTP id E187480A4413;
 Wed, 30 Jan 2019 13:47:15 -0800 (PST)
Authentication-Results: roger.doofus.org; 
X-DKIM-Authentication-Results: none
Received: from flash.localnet (unknown [192.168.0.16])
 by roger.doofus.org (Postfix) with ESMTPSA id A31D1801F490;
 Wed, 30 Jan 2019 13:47:15 -0800 (PST)
From: Aaron Williams <awilliams@marvell.com>
To: Emily Shaffer <emilyshaffer@google.com>
Cc: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [EXT] Re: OpenBMC Sensors
Date: Wed, 30 Jan 2019 13:47:12 -0800
Message-ID: <2825900.tvUVfaqXQI@flash>
In-Reply-To: <CAJoAoZk1XGosz=7Gg-o8RAU1OfftAVr8L7OmfsfwHqPAXVqORQ@mail.gmail.com>
References: <6065976.siBLTEBlHZ@flash> <32964718.XoMeP9TR8m@flash>
 <CAJoAoZk1XGosz=7Gg-o8RAU1OfftAVr8L7OmfsfwHqPAXVqORQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 Jan 2019 21:47:20 -0000

Hi Emily,

Thank you, I will look into it. I don't think losing the sensors when we cut 
power to the host CPU will be much of an issue. I was just notified of a 
change to our CPLD that will allow the BMC to keep the sensors powered. At the 
moment, cutting power shuts of the power from the ATX power supply but now I 
will have more fine-grained power control. Now I just have to figure out how 
to update the Lattice CPLD from the BMC... I found some code in the Facebook 
OpenBMC which hopefully I can port over.

-Aaron

On Wednesday, January 30, 2019 1:42:40 PM PST Emily Shaffer wrote:
> Aaron, we use this daemon for local (to BMC) thermal control:
> https://github.com/openbmc/phosphor-pid-control
> Maybe you'll find it helpful.
> 
> Although I'm not sure how to help you with losing sensors when the host
> powers down but the BMC is expected to continue to cool the tray.  Sounds
> like an issue with the board design, unless I'm not understanding what
> you're saying.
> 
> On Wed, Jan 30, 2019 at 1:28 PM Aaron Williams <awilliams@marvell.com>
> 
> wrote:
> > Hi Emily,
> > 
> > That's what I need the temperature for. We have two controllers, one that
> > monitors the core temperature (a TI TMP421) and one that controls the fans
> > (ADT7462). In order to maintain the thermal envelope the TMP421 needs to
> > be
> > monitored to adjust the fan speed through the ADT7462.
> > 
> > Further complicating things is the fact that these sensors disappear when
> > the
> > host is powered down.
> > 
> > -Aaron
> > 
> > On Wednesday, January 30, 2019 9:49:32 AM PST Emily Shaffer wrote:
> > > External Email
> > > 
> > > ----------------------------------------------------------------------
> > > Hi Aaron,
> > > 
> > > Note that you only really need to worry about sending the temperature
> > > via
> > > IPMI if you want to send it somewhere besides the BMC.  If you plan to
> > > do
> > > internal thermal control (BMC reads temperature, BMC adjusts fans
> > > accordingly) you probably don't need IPMI config and can get away with
> > > setting it up as far as DBus in the sensor architecture doc Lei sent.
> > > 
> > > Emily
> > > 
> > > On Thu, Jan 24, 2019 at 1:27 AM Lei YU <mine260309@gmail.com> wrote:
> > > > On Thu, Jan 24, 2019 at 5:13 PM Aaron Williams <awilliams@marvell.com>
> > > > 
> > > > wrote:
> > > > > I see how to set up the hwmon portion defining the devices based on
> > 
> > the
> > 
> > > > device
> > > > 
> > > > > tree, but I am unsure how to go about configuring the YAML and other
> > > > 
> > > > files for
> > > > 
> > > > > this.
> > > > 
> > > > For sensors' config, please refer to
> > > > https://github.com/openbmc/docs/blob/master/sensor-architecture.md
> > 
> > > > And it looks you are looking for fan controls, then you could refer 
to:
> > https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md#f
> > 
> > > > ans
> > > > 
> > > > (I really need to submit my porting guide to openbmc/docs)
