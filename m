Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RGjetK+P"; 
 dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43rk7B2RN7zDqht
 for <openbmc@lists.ozlabs.org>; Sat,  2 Feb 2019 04:07:33 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id e6so284961pls.13
 for <openbmc@lists.ozlabs.org>; Fri, 01 Feb 2019 09:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lZTEEKl08ONDw6I6G8Vno6q4jUlqTAhKYWhWJGglnjQ=;
 b=RGjetK+PSKeOmNarVYWL/+ba1nQi0p5egGM/44varYdTy1dHW/iLgQ1INdJ25R0T45
 umCBpEbpwvmyNBNfwfX2YT5OiAYe9TsL3aOOvQK0X3FImD59QbJ3vKlNMHEmRYp5hMvw
 X2xz+jwVQrwwZCLCTzNqyIEyKBynhUXW590aySfjqDqOpq7euZoleuSXVknqkdmO8Qe1
 N3YW4S0BZva/5tLdBPLkBUlvc6+LmZRB43ETsMhdOenILkJLSgdWtpz5SNYXnpeHD+8V
 HSQI8vhG3pL/tP2Q8y1qZhAjJ4Q2NGNM9aTeY4yrSQmRIly4xKTfMhYRvwmHZQzSmp5P
 KAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZTEEKl08ONDw6I6G8Vno6q4jUlqTAhKYWhWJGglnjQ=;
 b=OKi/Q/AhxjHbXriw3apoiCtAvX/qolVk9ZHMI+kHe2BVY7rHSjPD/da2xxKPyFsUhl
 ol6s6utZYjktEMxEFeniuBgwXWXDtUhYPAq+GPDLhWS6QuxsqdQo2XCHFqR39ccGTAxD
 HCqlMkLI6KXh5DM7o74mtIMw+su7fxXjNDwFNPT1qYQRl+R98H2T85xhJztW3qnkX3KR
 e0H1U4aJfdkxTuwE8ICiX3eDAt2vQDvIHgxXtq075NFSWlJW2qvte5PCk5SxeWHKoC5D
 vISJs/Msm1/Jn7VB5gUAqsJO1uhc3i16rbANsWXB6b+ltkEQidqpM3UHynzgNN/cz6mG
 jPFw==
X-Gm-Message-State: AJcUukcu2x7GY680Hi7lBtIgLo9YnoL8seTOdYUVHbx0hWnajTyRBI7S
 4OSaRJ9UPRaJDOEG4IYwn30b6tT5s0e1NPbADcnhRQ==
X-Google-Smtp-Source: ALg8bN54pyW/9NUD15qPLvSbR+5Xi5l+S27KwTlKRUtGCtCw7Too73sr4pLOw4VsELxArV1O/oUn44BzYssCSUl/Stk=
X-Received: by 2002:a17:902:24e7:: with SMTP id
 l36mr40540387plg.61.1549040851554; 
 Fri, 01 Feb 2019 09:07:31 -0800 (PST)
MIME-Version: 1.0
References: <6065976.siBLTEBlHZ@flash>
 <CAJoAoZnV+u8kJKV7TkPxU_b1hdmJ3nbFyD6rVMSd9ohPSjDHig@mail.gmail.com>
 <CAO=notzSOb7VcYhByoyae63o3xFctpJpMCnKgaTn0dRKp+VckA@mail.gmail.com>
 <15407680.LHmlcfl6Tm@flash>
In-Reply-To: <15407680.LHmlcfl6Tm@flash>
From: Patrick Venture <venture@google.com>
Date: Fri, 1 Feb 2019 09:07:19 -0800
Message-ID: <CAO=notwOLxOrKQ49bAOsnFVw+ciESWRM3UUZJP5bRLns1VQPZA@mail.gmail.com>
Subject: Re: [EXT] Re: OpenBMC Sensors
To: Aaron Williams <awilliams@marvell.com>
Cc: Emily Shaffer <emilyshaffer@google.com>,
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
X-List-Received-Date: Fri, 01 Feb 2019 17:07:35 -0000

On Thu, Jan 31, 2019 at 9:17 PM Aaron Williams <awilliams@marvell.com> wrote:
>
> Thanks,
>
> I think I know what I need to do, after looking at the config example and
> other yaml examples I've found. My problem is I haven't been able to find any
> example recipes and whatnot that use this (or maybe I'm looking at the wrong
> things). I've looked at the various implementations but don't see anything
> using this.

I'm looking for an example upstream.  I may end up updating the
quanta-q71l board to use it:
https://github.com/openbmc/meta-quanta/tree/master/meta-q71l
I split off from maintaining that a while ago primarily due to cycles
for regular upstream testing.

>
> -Aaron
>
> On Thursday, January 31, 2019 7:30:04 AM PST Patrick Venture wrote:
> > On Wed, Jan 30, 2019 at 8:49 PM Emily Shaffer <emilyshaffer@google.com>
> wrote:
> > > Aaron,
> > >
> > > If it's complaining at build time it's what it says on the box - you
> > > probably need to include the recipe which builds
> > > phosphor-fans-sensor-inventory.
> > >
> > > Emily
> > >
> > > On Wed, Jan 30, 2019, 8:17 PM Aaron Williams <awilliams@marvell.com>
> wrote:
> > >> Hi Emily,
> > >>
> > >> I'm still not sure how to go about using this, I'm still fairly new to
> > >> OpenBMC. It's complaing about nothing providing
> > >> 'virtual/phosphor-fans-sensor- inventory'.  I included
> > >> phosphor-pid-control as one of our dependencies.
> > Per Emily, you'll need to implement a recipe that defines the PID
> > inputs.  It sounds like you have two PID loops.  One is the
> > temperature sensor, and that feeds the set-point for the fans, which
> > are a second PID loop.  The idea being, the temperature pid loop
> > attempts to maintain the temperature under (or over) some set-point,
> > and it'll in turn try to get the fans to speed up when necessary.
> >
> > >> -Aaron
> > >>
> > >> On Wednesday, January 30, 2019 1:48:10 PM PST you wrote:
> > >> > Great, best luck Aaron. Thanks!
> > >> >
> > >> > On Wed, Jan 30, 2019, 1:47 PM Aaron Williams <awilliams@marvell.com>
> wrote:
> > >> > > Hi Emily,
> > >> > >
> > >> > > Thank you, I will look into it. I don't think losing the sensors when
> > >> > > we
> > >> > > cut
> > >> > > power to the host CPU will be much of an issue. I was just notified
> > >> > > of a
> > >> > > change to our CPLD that will allow the BMC to keep the sensors
> > >> > > powered. At
> > >> > > the
> > >> > > moment, cutting power shuts of the power from the ATX power supply
> > >> > > but now
> >
> > As far as the sensors when the try is powered down, that's pretty
> > common.  The hwmon driver on the BMC will just be unable to read the
> > values, and you can deal with that in phosphor-hwmon a couple ways.
> > Phosphor-pid-control will go into fail-safe mode if it doesn't receive
> > a sensor value frequently enough.  This mode would cause it to drive
> > the fans to a pre-defined set-point per a configuration.
> >
> > >> > > I
> > >> > > will have more fine-grained power control. Now I just have to figure
> > >> > > out
> > >> > > how
> > >> > > to update the Lattice CPLD from the BMC... I found some code in the
> > >> > > Facebook
> > >> > > OpenBMC which hopefully I can port over.
> > >> > >
> > >> > > -Aaron
> > >> > >
> > >> > > On Wednesday, January 30, 2019 1:42:40 PM PST Emily Shaffer wrote:
> > >> > > > Aaron, we use this daemon for local (to BMC) thermal control:
> > >> > > > https://github.com/openbmc/phosphor-pid-control
> > >> > > > Maybe you'll find it helpful.
> > >> > > >
> > >> > > > Although I'm not sure how to help you with losing sensors when the
> > >> > > > host
> > >> > > > powers down but the BMC is expected to continue to cool the tray.
> > >> > > > Sounds
> > >> > > > like an issue with the board design, unless I'm not understanding
> > >> > > > what
> > >> > > > you're saying.
> > >> > > >
> > >> > > > On Wed, Jan 30, 2019 at 1:28 PM Aaron Williams
> > >> > > > <awilliams@marvell.com>
> > >> > > >
> > >> > > > wrote:
> > >> > > > > Hi Emily,
> > >> > > > >
> > >> > > > > That's what I need the temperature for. We have two controllers,
> > >> > > > > one
> > >> > >
> > >> > > that
> > >> > >
> > >> > > > > monitors the core temperature (a TI TMP421) and one that controls
> > >> > > > > the
> > >> > >
> > >> > > fans
> > >> > >
> > >> > > > > (ADT7462). In order to maintain the thermal envelope the TMP421
> > >> > > > > needs
> > >> > >
> > >> > > to
> > >> > >
> > >> > > > > be
> > >> > > > > monitored to adjust the fan speed through the ADT7462.
> > >> > > > >
> > >> > > > > Further complicating things is the fact that these sensors
> > >> > > > > disappear
> > >> > >
> > >> > > when
> > >> > >
> > >> > > > > the
> > >> > > > > host is powered down.
> > >> > > > >
> > >> > > > > -Aaron
> > >> > > > >
> > >> > > > > On Wednesday, January 30, 2019 9:49:32 AM PST Emily Shaffer
> wrote:
> > >> > > > > > External Email
> > >> > >
> > >> > > ---------------------------------------------------------------------
> > >> > > -
> > >> > >
> > >> > > > > > Hi Aaron,
> > >> > > > > >
> > >> > > > > > Note that you only really need to worry about sending the
> > >> > > > > > temperature
> > >> > > > > > via
> > >> > > > > > IPMI if you want to send it somewhere besides the BMC.  If you
> > >> > > > > > plan
> > >> > >
> > >> > > to
> > >> > >
> > >> > > > > > do
> > >> > > > > > internal thermal control (BMC reads temperature, BMC adjusts
> > >> > > > > > fans
> > >> > > > > > accordingly) you probably don't need IPMI config and can get
> > >> > > > > > away
> > >> > >
> > >> > > with
> > >> > >
> > >> > > > > > setting it up as far as DBus in the sensor architecture doc Lei
> > >> > > > > > sent.
> > >> > > > > >
> > >> > > > > > Emily
> > >> > > > > >
> > >> > > > > > On Thu, Jan 24, 2019 at 1:27 AM Lei YU <mine260309@gmail.com>
> wrote:
> > >> > > > > > > On Thu, Jan 24, 2019 at 5:13 PM Aaron Williams <
> > >> > >
> > >> > > awilliams@marvell.com>
> > >> > >
> > >> > > > > > > wrote:
> > >> > > > > > > > I see how to set up the hwmon portion defining the devices
> > >> > > > > > > > based
> > >> > >
> > >> > > on
> > >> > >
> > >> > > > > the
> > >> > > > >
> > >> > > > > > > device
> > >> > > > > > >
> > >> > > > > > > > tree, but I am unsure how to go about configuring the YAML
> > >> > > > > > > > and
> > >> > >
> > >> > > other
> > >> > >
> > >> > > > > > > files for
> > >> > > > > > >
> > >> > > > > > > > this.
> > >> > > > > > >
> > >> > > > > > > For sensors' config, please refer to
> > >> > > > > > > https://github.com/openbmc/docs/blob/master/sensor-architectu
> > >> > > > > > > re.md
> > >> > > > > > >
> > >> > > > > > > And it looks you are looking for fan controls, then you could
> > >> > >
> > >> > > refer
> > >> > > to:
> > >> > >
> > >> > > https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide
> > >> > > .md#f
> > >> > >
> > >> > > > > > > ans
> > >> > > > > > >
> > >> > > > > > > (I really need to submit my porting guide to openbmc/docs)
>
>
>
>
