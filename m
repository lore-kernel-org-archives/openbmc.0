Return-Path: <benjaminfair@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NHO3D1Lj"; 
 dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428zlw5MpkzF3CR
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 08:16:42 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id f17-v6so17817361qkh.4
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 15:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K+9yevZXCM4p4NCJxJKsIFHS3mLqrHdokpkZxCNVl6w=;
 b=NHO3D1LjsDCib1iaruJURn2KbPpV+MJvsA5nrB9tvbUTu3YgKfupD6MHNVnAvlMlBD
 Kn6oQGtwu1v87RnagCysfNeulXx+j9zeQXhyUHMepckmeQSC7MIumaa4xN8q/Duhl+RT
 cY+PdV2V5oEEyG4K38J7GMAlxgs+oFoqclZSShuotCjGgkY6EjZ3RSbzcHZaMCRWgOYO
 +fZOwVzyW1oDwAE5B74vawgA/JxKRksWWPi11OuZ3UAcq3iBzQbjdt1y1VDn6KsJbtsh
 Zh8xtUt7N9+K0+jno8bfcp9u4+pGV6tnqn0w6AZMR/M5kBHcZ+sMEE/G2+ljv8L5rTkv
 zgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K+9yevZXCM4p4NCJxJKsIFHS3mLqrHdokpkZxCNVl6w=;
 b=P9PKgkD6vFCvyBnw0PpQQBn2h+VNEG0QjuP0KZNI9MjECuQVz3RTd5FuAoL0m6VA0E
 DjMEAKizIT0+MWuvoAnal8NvWuHDTZP2ICDiWhAJYQ3JNvNpvZifiXVBEdEbQFJWzoYT
 OaThlkJARIqyzLEwbXiCaR45dkeoBSJ4m9q+f6o7dGYD+kYPvoFFxebye9SawqdC4+l5
 nJ646Xy3ppUM4EkErMXnKxV9jCY1/TcFPe9GaPKP/E/jAs2MURfdk40qqMd6G+a6Dfpw
 Aju1lkaWSe5dME8SW8s/4Sg8UZchmf9ef8k/ZLZ82xPZUBc5px1/WrgzNWqR5aYNrqAT
 gugw==
X-Gm-Message-State: APzg51DS8a4YZhp0thfkCxWvCbHixmtdejXhciEA4ojlZgmRsSj05BQl
 2aF+1KDIF4eUUs6uVs0lH0/UiKJ481QEG3X4frx41g==
X-Google-Smtp-Source: ANB0VdZ/SJkwZnLl7FiMbA9Ue00VXHRxOO2g5OiBe2/egpwqCH6WzIajyqj9R5J2RwR+hXZRKqAR3Ey5m55WRwAYstk=
X-Received: by 2002:a37:d959:: with SMTP id
 u86-v6mr19647468qki.165.1536704199610; 
 Tue, 11 Sep 2018 15:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <CADKL2t4bP5VKSZ3x9wiq4c+O-6JM=nFQgQjtTTBL_2i0e7zfzw@mail.gmail.com>
 <CAARXrtm4V-g6gH9iGKFHrE+LmOUvkG-thv+q9e7u335nQsYFqw@mail.gmail.com>
 <CAO=notx+-Qb8j3GYYpsgqcEHkP3janMb3ivgAyZYpxksNiYjig@mail.gmail.com>
In-Reply-To: <CAO=notx+-Qb8j3GYYpsgqcEHkP3janMb3ivgAyZYpxksNiYjig@mail.gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 11 Sep 2018 15:16:03 -0700
Message-ID: <CADKL2t4RHSZuUu9K2KAgqWLXU+tEjy=-JT+VCns5gU8GY5H9QA@mail.gmail.com>
Subject: Re: Sensor alarm logging in IPMI SEL
To: Patrick Venture <venture@google.com>
Cc: Yu Lei <mine260309@gmail.com>, openbmc@lists.ozlabs.org
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
X-List-Received-Date: Tue, 11 Sep 2018 22:16:45 -0000

On Tue, Aug 21, 2018 at 6:23 AM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Aug 20, 2018 at 8:03 PM Lei YU <mine260309@gmail.com> wrote:
> >
> > The existing phosphor-dbus-monitor should be able to do that.
> > It requires a yaml config to define the watches and actions.
> >
> > See [witherspoon example][1], that watches the properties (ThrottleProcTemp,
> > ThrottleProcPower, ThrottleMemTemp) on /org/open_power/control/occ0, and log
> > the related events.
> >
> > 1. https://github.com/openbmc/openbmc/blob/master/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/events/witherspoon-events-policy/config.yaml
> >
> > On Tue, Aug 21, 2018 at 3:53 AM Benjamin Fair <benjaminfair@google.com> wrote:
> > >
> > > Hi all,
> > >
> > > We are looking for a way to log and report sensor events such as
> > > over-temperature alarms and voltage regulator failures using the BMC.
> > > The IPMI SEL seems like a good approach, as it matches industry
> > > standards. There is already existing infrastructure for SEL in
> > > OpenBMC, so implementing this seems like it would only require
> > > modifying a daemon like sensord from the lm-sensors project to report
> > > alarms over dbus.
> > >
> > > Does this sound reasonable? Has anyone else already started working on
> > > something similar?
>
> So the phosphor-hwmon daemon itself has the notion of a configured
> threshold where if the value is beyond some point it sets the dbus
> property for that sensor.  It doesn't yet, unless I've missed some
> patches, respond to a hwmon sensor's alerts.  That may be a useful
> feature to develop into phosphor-hwmon.
>
> Patrick
>
> > >
> > > Thanks,
> > > Benjamin

Thanks for the replies!

It looks like phosphor-dbus-monitor would be able to do this, but the YAML file
would require a separate entry for each threshold on each sensor, which doesn't
seem like the best approach.

Patrick's idea of adding this functionality to phosphor-hwmon looks
interesting, so I've written up a design proposal for that and uploaded it to
Gerrit here: https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/12700

Feel free to take a look if you're interested and add any feedback you might
have.

Thanks,
Benjamin
