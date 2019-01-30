Return-Path: <awilliams@marvell.com>
Authentication-Results: lists.ozlabs.org;
 spf=fail (mailfrom) smtp.mailfrom=marvell.com
 (client-ip=173.8.172.90; helo=roger.doofus.org;
 envelope-from=awilliams@marvell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=marvell.com
Received: from roger.doofus.org (aaronw.com [173.8.172.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43qc1T2WTLzDq6B
 for <openbmc@lists.ozlabs.org>; Thu, 31 Jan 2019 08:28:43 +1100 (AEDT)
Received: from roger.doofus.org (localhost [127.0.0.1])
 by roger.doofus.org (Postfix) with ESMTP id B5C4C80A4413;
 Wed, 30 Jan 2019 13:28:39 -0800 (PST)
Authentication-Results: roger.doofus.org; 
X-DKIM-Authentication-Results: none
Received: from flash.localnet (unknown [192.168.0.16])
 by roger.doofus.org (Postfix) with ESMTPSA id 1CAC3801F490;
 Wed, 30 Jan 2019 13:28:39 -0800 (PST)
From: Aaron Williams <awilliams@marvell.com>
To: Emily Shaffer <emilyshaffer@google.com>
Cc: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [EXT] Re: OpenBMC Sensors
Date: Wed, 30 Jan 2019 13:28:38 -0800
Message-ID: <32964718.XoMeP9TR8m@flash>
In-Reply-To: <CAJoAoZmZhxFNuvRYKQ04iTYZVrHgoukbM4HdTaPP6kCZppMhDA@mail.gmail.com>
References: <6065976.siBLTEBlHZ@flash>
 <CAARXrtkg0uoJ7L8cwme8mkckmNj5bwb1hk15iWgqVYXbJ5pOCw@mail.gmail.com>
 <CAJoAoZmZhxFNuvRYKQ04iTYZVrHgoukbM4HdTaPP6kCZppMhDA@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 Jan 2019 21:28:45 -0000

Hi Emily,

That's what I need the temperature for. We have two controllers, one that 
monitors the core temperature (a TI TMP421) and one that controls the fans 
(ADT7462). In order to maintain the thermal envelope the TMP421 needs to be 
monitored to adjust the fan speed through the ADT7462.

Further complicating things is the fact that these sensors disappear when the 
host is powered down.

-Aaron

On Wednesday, January 30, 2019 9:49:32 AM PST Emily Shaffer wrote:
> External Email
> 
> ----------------------------------------------------------------------
> Hi Aaron,
> 
> Note that you only really need to worry about sending the temperature via
> IPMI if you want to send it somewhere besides the BMC.  If you plan to do
> internal thermal control (BMC reads temperature, BMC adjusts fans
> accordingly) you probably don't need IPMI config and can get away with
> setting it up as far as DBus in the sensor architecture doc Lei sent.
> 
> Emily
> 
> On Thu, Jan 24, 2019 at 1:27 AM Lei YU <mine260309@gmail.com> wrote:
> > On Thu, Jan 24, 2019 at 5:13 PM Aaron Williams <awilliams@marvell.com>
> > 
> > wrote:
> > > I see how to set up the hwmon portion defining the devices based on the
> > 
> > device
> > 
> > > tree, but I am unsure how to go about configuring the YAML and other
> > 
> > files for
> > 
> > > this.
> > 
> > For sensors' config, please refer to
> > https://github.com/openbmc/docs/blob/master/sensor-architecture.md
> > And it looks you are looking for fan controls, then you could refer to:
> > 
> > https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md#f
> > ans
> > 
> > (I really need to submit my porting guide to openbmc/docs)
