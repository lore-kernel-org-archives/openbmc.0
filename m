Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jLkgbe0S"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43r41Q0RcvzDqTL
 for <openbmc@lists.ozlabs.org>; Fri,  1 Feb 2019 02:30:17 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id z9so1631896pfi.2
 for <openbmc@lists.ozlabs.org>; Thu, 31 Jan 2019 07:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eGVJ18UkmJ+ehfbyqvKASbc3J71CPthEVXD9NTFdAxk=;
 b=jLkgbe0SZhEtDH/Vxwo5KXi9YHC2ddQFIT6P1fNnMh86UMb0LaJVQqA9rVcZmqUvQt
 nRTttbFcnPs+lTIdA5jxrxSqkZiM27dhV7yNnC2h3Er43BQ6J6qLZv/Ffc+6CQM5WQl3
 ZBtOYrf9FzpWsFqLdnMPKFEttour5N3x+n0BeoUInngfydGY9g+zFr/XvdP05+b1xnTa
 sLRnF6zBLi5uvch6DU1xYhVmhx5lL3YHV5nIchZvYQ3ypOARmCXfobSUvM/fyqgyFsqn
 wUDqPDixlkhKi7H9vg3qqDe6SnqGq+FLQBRONCMYvZL3qua2Zf/YTt40456Opkwq/jwn
 p0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eGVJ18UkmJ+ehfbyqvKASbc3J71CPthEVXD9NTFdAxk=;
 b=uHnLkCI9wZSj0j3ZpXSDKvYpRMq5s7Y/xIhj8IHh2YsN43aE3FvDT/sapL9QOyrgXa
 0ttlb3S/4ZRjH+Ko0VBAJnbqr3/yPYAVLqeKlwVb3RiSyIPhT1Umjz3GMC3q0HeW0F/I
 nM764rr5Agqam1fN5cbumry4fiTJhCIECWQZQyudYzsr/EUNSKzEa0aabhuLHbq9Og29
 5GJjLNDwF4hbcapNpQXNo4yvN9jXufiUmiFsTR6Fn/2Oz6/Y0KyWr9fXdnXpqt8l6iTC
 3VDbcdb3xpvAl7S9fwC6OnkMowqtrmrk0oXFK6UraGFiR5t6UPBPcE79BKQgGk8kESFD
 slww==
X-Gm-Message-State: AJcUukdPcM+p4uZPDm5g0hyzTJVPNVMJHAQr0HiRUn7KeEnRISV87Ahr
 e/drEiN2TN0n3xji9RwjSUNU4e4C18EcvnrT4CgN1Q==
X-Google-Smtp-Source: ALg8bN5qs7Wis5CuRX/AdPGwHhpUhmMGNtNTFXx6xk9QI48tWVvadiRD6ggmRfnL5eMf6VOgVVEtaSqS8MbKe2xZF9s=
X-Received: by 2002:a63:e545:: with SMTP id z5mr31903959pgj.195.1548948615199; 
 Thu, 31 Jan 2019 07:30:15 -0800 (PST)
MIME-Version: 1.0
References: <6065976.siBLTEBlHZ@flash> <2825900.tvUVfaqXQI@flash>
 <CAJoAoZkOAgt7w5QAxkuO1595NUn7jbkYwh4WN4nAnEGMLxWeMg@mail.gmail.com>
 <2342439.TUI2J960l9@flash>
 <CAJoAoZnV+u8kJKV7TkPxU_b1hdmJ3nbFyD6rVMSd9ohPSjDHig@mail.gmail.com>
In-Reply-To: <CAJoAoZnV+u8kJKV7TkPxU_b1hdmJ3nbFyD6rVMSd9ohPSjDHig@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 31 Jan 2019 07:30:04 -0800
Message-ID: <CAO=notzSOb7VcYhByoyae63o3xFctpJpMCnKgaTn0dRKp+VckA@mail.gmail.com>
Subject: Re: [EXT] Re: OpenBMC Sensors
To: Emily Shaffer <emilyshaffer@google.com>
Cc: Aaron Williams <awilliams@marvell.com>,
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
X-List-Received-Date: Thu, 31 Jan 2019 15:30:19 -0000

On Wed, Jan 30, 2019 at 8:49 PM Emily Shaffer <emilyshaffer@google.com> wrote:
>
> Aaron,
>
> If it's complaining at build time it's what it says on the box - you probably need to include the recipe which builds phosphor-fans-sensor-inventory.
>
> Emily
>
> On Wed, Jan 30, 2019, 8:17 PM Aaron Williams <awilliams@marvell.com> wrote:
>>
>> Hi Emily,
>>
>> I'm still not sure how to go about using this, I'm still fairly new to
>> OpenBMC. It's complaing about nothing providing 'virtual/phosphor-fans-sensor-
>> inventory'.  I included phosphor-pid-control as one of our dependencies.

Per Emily, you'll need to implement a recipe that defines the PID
inputs.  It sounds like you have two PID loops.  One is the
temperature sensor, and that feeds the set-point for the fans, which
are a second PID loop.  The idea being, the temperature pid loop
attempts to maintain the temperature under (or over) some set-point,
and it'll in turn try to get the fans to speed up when necessary.

>>
>> -Aaron
>>
>> On Wednesday, January 30, 2019 1:48:10 PM PST you wrote:
>> > Great, best luck Aaron. Thanks!
>> >
>> > On Wed, Jan 30, 2019, 1:47 PM Aaron Williams <awilliams@marvell.com> wrote:
>> > > Hi Emily,
>> > >
>> > > Thank you, I will look into it. I don't think losing the sensors when we
>> > > cut
>> > > power to the host CPU will be much of an issue. I was just notified of a
>> > > change to our CPLD that will allow the BMC to keep the sensors powered. At
>> > > the
>> > > moment, cutting power shuts of the power from the ATX power supply but now

As far as the sensors when the try is powered down, that's pretty
common.  The hwmon driver on the BMC will just be unable to read the
values, and you can deal with that in phosphor-hwmon a couple ways.
Phosphor-pid-control will go into fail-safe mode if it doesn't receive
a sensor value frequently enough.  This mode would cause it to drive
the fans to a pre-defined set-point per a configuration.

>> > > I
>> > > will have more fine-grained power control. Now I just have to figure out
>> > > how
>> > > to update the Lattice CPLD from the BMC... I found some code in the
>> > > Facebook
>> > > OpenBMC which hopefully I can port over.
>> > >
>> > > -Aaron
>> > >
>> > > On Wednesday, January 30, 2019 1:42:40 PM PST Emily Shaffer wrote:
>> > > > Aaron, we use this daemon for local (to BMC) thermal control:
>> > > > https://github.com/openbmc/phosphor-pid-control
>> > > > Maybe you'll find it helpful.
>> > > >
>> > > > Although I'm not sure how to help you with losing sensors when the host
>> > > > powers down but the BMC is expected to continue to cool the tray.
>> > > > Sounds
>> > > > like an issue with the board design, unless I'm not understanding what
>> > > > you're saying.
>> > > >
>> > > > On Wed, Jan 30, 2019 at 1:28 PM Aaron Williams <awilliams@marvell.com>
>> > > >
>> > > > wrote:
>> > > > > Hi Emily,
>> > > > >
>> > > > > That's what I need the temperature for. We have two controllers, one
>> > >
>> > > that
>> > >
>> > > > > monitors the core temperature (a TI TMP421) and one that controls the
>> > >
>> > > fans
>> > >
>> > > > > (ADT7462). In order to maintain the thermal envelope the TMP421 needs
>> > >
>> > > to
>> > >
>> > > > > be
>> > > > > monitored to adjust the fan speed through the ADT7462.
>> > > > >
>> > > > > Further complicating things is the fact that these sensors disappear
>> > >
>> > > when
>> > >
>> > > > > the
>> > > > > host is powered down.
>> > > > >
>> > > > > -Aaron
>> > > > >
>> > > > > On Wednesday, January 30, 2019 9:49:32 AM PST Emily Shaffer wrote:
>> > > > > > External Email
>> > >
>> > > ----------------------------------------------------------------------
>> > >
>> > > > > > Hi Aaron,
>> > > > > >
>> > > > > > Note that you only really need to worry about sending the
>> > > > > > temperature
>> > > > > > via
>> > > > > > IPMI if you want to send it somewhere besides the BMC.  If you plan
>> > >
>> > > to
>> > >
>> > > > > > do
>> > > > > > internal thermal control (BMC reads temperature, BMC adjusts fans
>> > > > > > accordingly) you probably don't need IPMI config and can get away
>> > >
>> > > with
>> > >
>> > > > > > setting it up as far as DBus in the sensor architecture doc Lei
>> > > > > > sent.
>> > > > > >
>> > > > > > Emily
>> > > > > >
>> > > > > > On Thu, Jan 24, 2019 at 1:27 AM Lei YU <mine260309@gmail.com> wrote:
>> > > > > > > On Thu, Jan 24, 2019 at 5:13 PM Aaron Williams <
>> > >
>> > > awilliams@marvell.com>
>> > >
>> > > > > > > wrote:
>> > > > > > > > I see how to set up the hwmon portion defining the devices based
>> > >
>> > > on
>> > >
>> > > > > the
>> > > > >
>> > > > > > > device
>> > > > > > >
>> > > > > > > > tree, but I am unsure how to go about configuring the YAML and
>> > >
>> > > other
>> > >
>> > > > > > > files for
>> > > > > > >
>> > > > > > > > this.
>> > > > > > >
>> > > > > > > For sensors' config, please refer to
>> > > > > > > https://github.com/openbmc/docs/blob/master/sensor-architecture.md
>> > > > > > >
>> > > > > > > And it looks you are looking for fan controls, then you could
>> > >
>> > > refer
>> > > to:
>> > >
>> > > https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md#f
>> > >
>> > > > > > > ans
>> > > > > > >
>> > > > > > > (I really need to submit my porting guide to openbmc/docs)
>>
>>
>>
>>
