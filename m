Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::235; helo=mail-io0-x235.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="q3aUw6m4"; 
 dkim-atps=neutral
Received: from mail-io0-x235.google.com (mail-io0-x235.google.com
 [IPv6:2607:f8b0:4001:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yHb502xL6zDq5W
 for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2017 15:08:19 +1100 (AEDT)
Received: by mail-io0-x235.google.com with SMTP id n137so8554123iod.6
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 21:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:to:cc:from:subject:in-reply-to;
 bh=nE7mkW49DmULRtSQqi1rdwj6I/OoxXe65gGd2SOJ3/s=;
 b=q3aUw6m4d5h0l0NYZ3J++pZQcz2CfAycmc1OvNLXzTnim3SqzBzej4gzuUhVkYYZuP
 VIv/1qumwHgiLucrOuNZrZaua30RmjyRuJovrN3cEc3r0ffRClecGv1CiL6EeYY5Kll7
 8NNFdgl6vd3AUXvQDzD/vEYQP/sWPOAbaCV3Onu8b9XTSMvJIUkTz9/9Kwo+JmVRRXIe
 9grbawdfAUDCNmIL5ryD8b4iLXHL4O/9rT5TvMp6tXqIhj+8CVUKQa9I5MFP69oyWJJM
 V2A+WnsLk8Up0lkLzOCE2I28X4ry3tmEdbmnoU05jpbjNlZ0AEEUXNBy/j8lUzOSjMe5
 Iv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:to:cc:from:subject:in-reply-to;
 bh=nE7mkW49DmULRtSQqi1rdwj6I/OoxXe65gGd2SOJ3/s=;
 b=N/Xmw9QQAV/EkZSznTyx7uESY80GFsfdWCnfS1rf5nBoEMhPajcBJiZpAovkNg8AsI
 8jxXzPSEh5dVBFZHJRdNhOCIp5io7DJyh4B5caOXYZwtninK5w4XcGkg3LrYL5uo3Oki
 Kfuy82qh+KURA/haHps3fr1HAIZ0fkqoeriETY1MPM7/LSlLxU/KYckBF7lC5G/dKY5T
 QnP7KyWgnaw3YM7f4NyWp6HsKVWqpvIx+JvPoJKmE1v/uvTj0VWe2yfxDzM6jhxBUIyM
 dlqvpOVQ316uv6r1XvsxH6xgfZWRGjU8r/nh9Q6nSay5x73fpnNlh3Opt9LgQKGfNbyt
 lBog==
X-Gm-Message-State: AMCzsaVd0qNP7qBtHUkTz0ub5NhkiflqQqpf8OttkbNnOv4tcm5JEqXZ
 DxiC7iPGrF/p0sRCO0jZJo4/ig==
X-Google-Smtp-Source: ABhQp+RxYJA1Qi/iKf7s94lvcOPT9NhA46dZICs+qTvERKcGjMpcDAeq3rZJpax9z3fnBjR90LPW0w==
X-Received: by 10.107.169.17 with SMTP id s17mr327113ioe.232.1508386096534;
 Wed, 18 Oct 2017 21:08:16 -0700 (PDT)
Received: from mactruck.svl.corp.google.com
 ([2620:15c:2c5:3:61fb:ee5a:34c7:9b7d])
 by smtp.gmail.com with ESMTPSA id u84sm6669572ioi.53.2017.10.18.21.08.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Oct 2017 21:08:16 -0700 (PDT)
Received: from mactruck.svl.corp.google.com (localhost [127.0.0.1])
 by mactruck.svl.corp.google.com (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
 id v9J48F7N009444; Wed, 18 Oct 2017 21:08:15 -0700
Received: (from brendanhiggins@localhost)
 by mactruck.svl.corp.google.com (8.14.4/8.14.4/Submit) id v9J48En6009442;
 Wed, 18 Oct 2017 21:08:14 -0700
Date: Wed, 18 Oct 2017 21:08:14 -0700
Message-Id: <201710190408.v9J48En6009442@mactruck.svl.corp.google.com>
To: vernon.mauery@linux.intel.com, tomjose@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
From: brendanhiggins@google.com
Subject: Re: phosphor-host-ipmid and phosphor-net-ipmid architecture
In-Reply-To: 59E063DF.7030805@linux.vnet.ibm.com
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Oct 2017 04:08:21 -0000

> Hey Vernon,
>
> 1)  There are few reasons for a different approach for net-ipmid
>
>      The primary design direction when developing net-ipmid was to reuse
> the provider libraries
>      for the commands that are common across the interfaces. It was a
> conscious decision
>      to have two processes for network & BT, keeping in mind to have
> small applications
>      rather than having monolithic ones.
>
>     The network handler would not be minimal like btbridge or KCSbridge,
> since there are net-ipmid
>     specific functionalities like session setup, serial over LAN..etc.

Unfortunately there is more common functionality than just handlers. For
example, Firmware Firewall is to be applied to all interfaces. Another example,
bridging allows messages to be taken from one interface, like the LAN Interface,
and applied on some other interface, like the System Interface.

I talked about this extensively with Corey Minyard (see discussion under [RFC v1
1/4] ipmi_bmc: framework for BT IPMI on BMCs). I was trying to create a common
interface that the userland could get IPMI messages from as well as a common way
to handle IPMI messages in the kernel. Unfortunately, the various concepts in
IPMI are just really too tightly coupled.

> The only difference i see in your
>     idea is we would relay the common commands on the dbus so that ipmid
> would handle.
>
> 2) The phosphor-host-ipmid was developed as part of the prototyping done
> for Barreleye. So i agree that
>      we have quite a number of shortcomings, that it is not in alignment
> with the modern C++ practices.
>      We have added more code and haven't got to refactor that. We have a
> story to refactor phosphor-host-ipmid.
>      The plan was to handle so some of these suggestions as part of that.
>
>     The support is in place to register each command's privilege. The
> support would be completed once the
>     IPMI user account management changes are in place. The command's
> privilege would matter only on
>     the LAN interface which is session based. In net-ipmid every command
> would be checked against the
>     session's privilege, so that a session with USER privilege would be
> restricted from running a command
>     that needs ADMIN privilege. Since KCS and BT are sessionless and
> unauthenticated, this would not matter.

Not quite true, see above.

>
>     Similarly System interface commands are compiled into a separate
> library which is not loaded in the
>     net-ipmid.
>
> 3) This is something we wanted to do, we can discuss what is the best
> possible approach. This would help with
>      command like Get/Set System Boot Configuration where each
> implementer would get the flexibility
>      to implement the OEM parameters.
>
>   Are you working on a OEM provider library?

We have written some in the past. I proposed one about a year ago. I think there
was another one as well. Might be time to revisit that.

>
> Regards,
> Tom
>
>
>
>
> On Thursday 12 October 2017 03:35 AM, Vernon Mauery wrote:
> > I am working on an ipmi provider library and had a few questions and
> > observations.
> >
> > 1) Why are there separate ipmi message queues for the host and network?
> >     It seems awkward that for the host, the ipmi request comes from a
> >     different process (btbridge, or in our case kcsbridge), while for the
> >     network (RMCP+), the messages are handled directly in the same
> >     process.
> >
> >     It seems that the network handler could just as easily package the
> >     command up and send it to ipmid the same way that btbridge does.
> >
> > 2) Can we modify the signature of the handlers so that they can behave
> >     in a more intelligent manner? It would be nice if they were handed a
> >     gsl::span<uint8_t> instead of a void* and a length. This allows for
> >     a no-copy, bounds-checked way of passing buffers.
> >
> >     It would be nice to know what channel something came in on. We might
> >     want to be able to change behavior based on the incoming channel (as
> >     some channels are more secure than others).
> >
> >     It would be nice to know what IPMI privilege the command came in
> >     with (ADMIN for session-less commands) so that the command handler
> >     can behave appropriately based on the user.
> >
> > 3) When registering commands, it would be nice of the list also
> >     maintained a priority so that commands could be easily overridden.
> >     Currently the only way to override a command is to make sure that
> >     your library gets loaded first (and this is done via the library
> >     name). If we had default ipmi commands loaded at DEFAULT_PRIO and
> >     then had some higher priorities such as MFR_PRIO, and OEM_PRIO, or
> >     something like that, we could have integrators further on down the
> >     line able to easily add a new provider library and piecemeal override
> >     individual command. An alternate (or addition) might be the addition
> >     of a unregister command method to remove an existing command so it
> >     could be replaced with a new one (or just straight up removed).
> >
> >
> > I am happy to work on changes that I would like to see and submit
> > patches for review, but I wanted to know if there was some sort of
> > historical or other reason that would prevent my work from getting
> > rejected before I actually do the work.
> >
> > --Vernon
> >

Cheers
