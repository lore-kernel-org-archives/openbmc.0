Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::229; helo=mail-oi0-x229.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tqwuBj1z"; 
 dkim-atps=neutral
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41rmJM5SzRzDqp5
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 22:45:06 +1000 (AEST)
Received: by mail-oi0-x229.google.com with SMTP id w126-v6so7729910oie.7
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 05:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j7+5zzQ8R24xtms8C9xYKwES50Jmxr/+jhrdr51W6vU=;
 b=tqwuBj1z8ijZDP+udGauRTpRWfD7aGx4pnH2y6G5YDEFXfCkpWcsDmSa5d/pxF3tmR
 cXOnolr54YC9Hssgs2Ccc1e//gT+qXScQdKctoHm/JqKCL1tPKlaTTbaeqKk+/CA3OWg
 YTPFT474xD0AXgAKBuWv3zRLFyGHlWg/zWSsaIGMds6WlOMj1koJJGABYFRzGaB+DpN3
 8gEl6mIoJ+tivyuzDFWNE32qiK0TWX8qRsZLJo+YRHORYwGOeemVdSBfGKFOBKzhGnwG
 KEVXG4gFhYQQSQWVNmaR6EU7fBCokzW0butZTagY/KPm44O8kb2qWfNWEQz6thSlV8f5
 IIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j7+5zzQ8R24xtms8C9xYKwES50Jmxr/+jhrdr51W6vU=;
 b=JzebfeCihh20qFQk7mHgHUjHHC541OlrwVM9kNKtA7CffjvBKJt5ggnubtU7fV44qt
 JNlR7vI1XG3dkr3cM8de3vPqOBRxbdYIXLBWXAhWbhUUDt8uFC8wHFUUkN7xLnpOecsF
 r2xuATCj0VK5akA5P6giuf2kDWGBjn/NtQFt3cupd/FYyqBYNKc83jslaPcrTiZWl01G
 v9JbM7c/p6fmtaZLc5up6WKP99WVdAYkaR9BFoOcxX7mvsAAYe0t2p/wznfqPdMxHxoC
 Gw2i8s+eRyAhyGW8qcKmtMGQOeJ7mGLSqdzk8Qm5xqtHM9yOr0sbx31hjTskmQfKvNdY
 M+tQ==
X-Gm-Message-State: AOUpUlEuLrtctFoVty86L0nwsQt3juO2UkYZnrwz6ESxlON/hI1QtW4K
 4JObIXt8Z4N1+a3mpXbiEUCVHhrmWFuasrBhsyc=
X-Google-Smtp-Source: AA+uWPysJ9Nr6+1Dm1i8SdEHrEgqj75zeODikHR+F52Tqz3c8XpZWQ0LOL9h8nbg/rDNSip1j7c+dBwnHDsHS4zw45g=
X-Received: by 2002:aca:b609:: with SMTP id
 g9-v6mr29500872oif.148.1534423503799; 
 Thu, 16 Aug 2018 05:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <1c87c6bc-0f3b-73f2-e2a5-4b6ad7180f99@linux.vnet.ibm.com>
In-Reply-To: <1c87c6bc-0f3b-73f2-e2a5-4b6ad7180f99@linux.vnet.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 16 Aug 2018 07:44:52 -0500
Message-ID: <CALLMt=rfppDj6vjmj09NGwd6zPFOoPo86i2LyOTCx2b+3UL98w@mail.gmail.com>
Subject: Re: Streaming logs via rsyslog
To: dkodihal@linux.vnet.ibm.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 16 Aug 2018 12:45:09 -0000

On Thu, Aug 16, 2018 at 5:21 AM Deepak Kodihalli
<dkodihal@linux.vnet.ibm.com> wrote:
>
> Hi,
>
> We have a requirement to forward BMC logs (the systemd journal) to an
> external logging server.
>
> We're proposing doing this by making use of rsyslog. Here are notes
> based on some initial investigation.
>
> Forwarding the journal logs to a syslog daemon :
> Journald has this feature of being able to write journal logs to a
> socket which then can be read by a syslog daemon. I see that (on
> Witherspoon at least) the syslog daemon running by default (busybox
> syslogd) doesn't support reading logs forwarded by the journald to due
> to this commit :
> https://git.busybox.net/busybox/commit/?id=accd9eeb719916da974584b33b1aeced5f3bb346.
> However, I could get the forwarding working with the rsyslog daemon. I
> found an existing rsyslog recipe in the meta-oe layer.
>
> rsyslog configuration :
> rsyslog is configurable in various ways. For example, I can turn off
> local logging altogether via a config file, if I'm interested only in
> using rsyslog for streaming journal logs out. Various optional features
> can be turned off at build time to save flash space.
>
> rsyslog server provision :
> The BMC would need to be made aware of the external rsyslog server. This
> can just be an admin updating the rsyslog config file on the BMC, and
> there could also be a REST API if need be. I think a small app can
> implement the
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/Client.interface.yaml
> interface to update the rsyslog config.

Yeah, I'd tend to vote for a REST api, that would enable GUI support
and cleaner scripting (vs. an scp command).

>
> streaming :
> rsyslog can be configured to make use of TCP, or UDP, and optionally
> TLS. I think TCP is the default.
>
>
> Thoughts on this proposal? If this sounds okay, I'm planning to get some
> commits up in Gerrit for review. I can pull rsyslog in a phosphor layer
> (I mean as the default choice of a syslog daemon, replacing busybox
> syslog) if there's interest, as opposed to making it only a
> meta-witherspoon package. Specific rsyslog package config and config
> file overrides are possible in system specific layers.

Seems reasonable to me.  Do you have a rough feel for what the bare
bones rsyslog package will take up in flash space?  That would be my
only concern at this point, we're getting a bit pressed for flash
space.

>
> Regards,
> Deepak
>
