Return-Path: <openbmc+bounces-1803-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F29EBFD22
	for <openbmc@archiver.kernel.org>; Mon, 13 Apr 2026 09:29:27 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fvMYX5kjTz2yrg;
	Mon, 13 Apr 2026 19:29:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::230" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776072560;
	cv=pass; b=dj5COk0gSQ1oufcGD4J8jYRXzTW5AXRQfsrM1ats5m6Hbb0+wFqULn5oJcs3q9UdT1WZaCjTZIN1JQuXajp7gLJUJ1Nsl8BIYYrNFAIPIJUkHZUCek1K4ZdmoqiAjaWWka4gHI0lPeqAMAY+gLTu6/zjSHt3JDvJiu75mR28JnTOtkazOBGKoxyJDTlJOWenIum/CAw5Ilv+x3+wZONziE2fMOteKappZN5D6KSgNqTvnt8tmMVMILLBO0wPFbc2m/odB1ydblVrm34bdzRNeUNwRxXDNHLWj6OosnGt0IsIvuFdIX6V7WD06DCeGFs15erwLNFfYOXsiIcyLlb86g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776072560; c=relaxed/relaxed;
	bh=DUkNE8/cmtnBkSV+0rIYShyUGUlkkFf2pnqbCzBkZYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNvCjkMDWP4moZmX6/nwbn1euCVwOYhUHVn36wXj29ett2h6rvn5OcygzLK4jaFpkrR2rw59EOYwaFvDk6zZWm7CNUpSNCLay7w2/Bg5CCyoaho1DwK3yWKd6/AKd1lrrJUPlNkPVq3I//GpAZfmsmwsIbtdbZgwZjLFmeN4PS+UZRt5tHT5kUAKM8P0qBQ1yLCDTbjlmEhMwNx0gfPPp/fqI3x7rZ8tU/LVbnJAyNzBcsuKp0NIV9YRUVrrQJVDNIHFwQWSZHVIPQ+TUVd8aY+yE+H1eU+mvuiJyn2LStdAgLVbnHD3qBRja9MjEf8bVMGZe4NNrAKzOogY8uYwmQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JroxqZL5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com; envelope-from=eric.yang.wiwynn@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JroxqZL5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com; envelope-from=eric.yang.wiwynn@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fvMYV4LYVz2yjV
	for <openbmc@lists.ozlabs.org>; Mon, 13 Apr 2026 19:29:17 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-4756e74f8edso2872183b6e.1
        for <openbmc@lists.ozlabs.org>; Mon, 13 Apr 2026 02:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776072554; cv=none;
        d=google.com; s=arc-20240605;
        b=UBycRtmRXwqb7VneJz9coc5TESBwVNHJ8o8J/uXMj23jXWA3prFWBwpVXNufUV81Tf
         LEqIBjek/Fj3AwUHxXSDZUpgnyRGP0aq6jqF6glpbhT2BN5dWrXGWbUYhIgNPnAfJgny
         0EqxhArlkA+WwcsHlXHhPcYL53HoUgC/M8vRoOZNq3KDL+RfkXc53s3SRa+5j0sbSuO2
         xEW+3NbaeVyG85DDPRwSocOjbB2lBTZEPbBj9/rw2bQaFI2RVNss9NzPuy7wY2caKrQd
         aB/Qog5hAyy40+Jptbn4GAhBCxL315R8yVxQopUiRHSxBionZusKQdyjKf/lkkbX8/lP
         kx0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DUkNE8/cmtnBkSV+0rIYShyUGUlkkFf2pnqbCzBkZYI=;
        fh=jgE4hDT3df2VOYVB8PiXtkngkS44kC13o2CPtBSLsks=;
        b=CYNlm8XckKPEw7/Pq02eqACtWmyGEYDHCF5SFNdnNffrWVmqzbbUIGb+bpildXGIyP
         IlDUMgK/LVlZ6fANSl6oJ8r7RSICvngKSV7aIYAqLskveV7VCligWweQPAIVflVy1Qz0
         33JNWRFi22OzF+FPCe2QkkpEF21BM6sbmrhEskW7y6qebCFn3fOMPVzDEcm4dHC1f3qc
         8x3rFIrtrQ9L854agyuCwD6F+vh8w1bpH70HFyvldyuoCdBo4xQjQkEnOxe5csqTliQJ
         3nZ9faMbq0MHzUBKiUZtTJbvXmxPQfF/ii7p+bktBxCafslCg66w18TFoYWy7lzvssuf
         kBWQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776072554; x=1776677354; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DUkNE8/cmtnBkSV+0rIYShyUGUlkkFf2pnqbCzBkZYI=;
        b=JroxqZL5CC9X1vQzZ1RvrKXKizl4iVkOtxYh4ox8Mqvokz+p3I4L5nygFugWOwNmua
         LYDdNLOuQVqPs8slx8owy0RotEbYr1b8Y46buWA5fFsnDc6Kf/1CSD4w2wsUkbQ/jwLW
         +dQFCUTLsdlu0QvbEJLvYVmJ0tSBJYHBB9m3twhpCFoLKU7blmDigjNe20owzfNa8rzD
         EvqJJgvausG8Yeitc05X7nCp/SKzb8AiwEkpFPPI9PuBrfmnAuf2cpUGJBWljFVxvojj
         f8DMCnjQK+ydcBXs6EgrfXOqET7bx+wXC10iYESpmcwdBz9Hai8pJhdARRdD2vpbnyPx
         xgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776072554; x=1776677354;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUkNE8/cmtnBkSV+0rIYShyUGUlkkFf2pnqbCzBkZYI=;
        b=pCed6SF9JqH8FcVcPrIcE+fI0FJPqF1o02IHf1R1PpXpT3xyQJFUyqSOD6G+lRWDrD
         DHh84DEUYJSMYhJTxm/NTc6wLmmCudua8I4/dR1ZyX9VtpXPfwvSOSnG0ADwtHUuG/Mq
         FtcN+fxi3JRwBv4EykFj1joAKm4uzrSinGVOaXrQR25yWEx1UE3sGmObin2GBvU+8iM+
         21nL/XjxMxLHyfhdV/bxFZi6jStR9qYFMj3bjw3D7Sddy9RinZtcq/YEldQv6Qk5w3oS
         BwGvBr1jfzg4btC2Crx4+SoQhG9WsULo+SHGw4CsZLnrJp9sHa1tq0YRL0bfaTuCf9aN
         +9yQ==
X-Gm-Message-State: AOJu0YzMdhZH3bMQZ3DWpo7OYguBEdgAM9Z/WQBUABxSAGpXjOZG720x
	HtrVQpJDWl2WyaxDh+TWM4ZgQB4sm+y2CfPicK/sdFy6fTSCP65YovKrGR6uWR5cWA11irzjVu2
	qBv+Zu1ofce0lF7BQqj1B7PIODPN7t5JUzREI
X-Gm-Gg: AeBDieuJfjldEkh5tPIsVfSw/Wx9Een2jTm0UJavODfj8hQjVb9/3vTjUx+VnyXQRf/
	7R46EOMC4juVpMuRye8fmqb5D2NADvZnXvppw+LYadTsd/g3TKKxX5oxGrf7qwv9VMmvw0pwI3q
	zhVTD7cOdZ8fPdFsVa0kSwLGokKOUZ3IyglZoN/CEt7OuoQ/SQG7m0+8LBaugngYRsVFh/rNgeF
	b9loznzLPiDPUFL0X3pePfw1EWrXybPoBGTVw0cokKOvc01FGVSTRlrMGrpGFxOxiXOAfKjwX1J
	dz3DBHc=
X-Received: by 2002:a05:6808:3086:b0:460:f435:2a71 with SMTP id
 5614622812f47-478a1919df0mr6015135b6e.46.1776072554257; Mon, 13 Apr 2026
 02:29:14 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <CAFme=rmRF03V1RLm4v6071ET-vVzrPjz_oVKCfWoO5G0CMzJUQ@mail.gmail.com>
 <CALLMt=pmg3CBB5SNVffAPMgVemj_L4Am5bc6egh9y8xAXt5jaQ@mail.gmail.com>
In-Reply-To: <CALLMt=pmg3CBB5SNVffAPMgVemj_L4Am5bc6egh9y8xAXt5jaQ@mail.gmail.com>
From: Eric Yang <eric.yang.wiwynn@gmail.com>
Date: Mon, 13 Apr 2026 17:29:02 +0800
X-Gm-Features: AQROBzBV4nR-PSLud6-HOn46kPYlvLkmE7TKu4c1Vf83VOQvta6Keyn1Tkzc24Y
Message-ID: <CAFme=rmw3=bjc8ZY_kVT-xEuFRch=pHPt5dSshDc+xbpe+on8w@mail.gmail.com>
Subject: Re: [DISCUSSION] Drive-level power control support in phosphor-state-manager
To: Andrew Geissler <geissonator@gmail.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

Thanks for the feedback, responses inline.

On Fri, Apr 10, 2026 at 9:29 PM Andrew Geissler <geissonator@gmail.com> wrote:
>
> Curious what the protocol looks like to monitor and perform the power
> cycling to these drives from the BMC? Is it something simple like
> GPIO's or is there something like MCTP to them?

The hardware I expect to support initially uses GPIO (toggling a drive
enable pin through an I2C IO expander). That said, the PSM drive
daemon itself would have zero knowledge of the hardware protocol. It
only starts systemd targets. The platform attaches its own services to
those targets via .wants/, so the actual protocol is entirely up to
the platform.

>
> How is this managed externally into the BMC? Is there a Redfish API?

Yes. DMTF already defines a Drive.Reset action in the Drive schema[1].

On the bmcweb side, I plan to submit a patch that adds a Drive.Reset
POST route, mapping the relevant ResetType values to the
State.Drive.Transition enum already defined in
phosphor-dbus-interfaces master (Reboot, HardReboot, Powercycle).

[1] https://github.com/openbmc/bmcweb/blob/33d7d41c71bb9a22725d77d97e41114c50b502c0/redfish-core/schema/dmtf/csdl/Drive_v1.xml#L152

>
> PSM is a wrapper to systemd which starts/stops/monitors specific
> systemd targets associated with the function. So would there still
> be a separate application with the business logic on how to monitor
> and power cycle the drives (like phosphor-power)?

Yes, completely separate. The drive state manager daemon in PSM would only:

1. Expose the xyz.openbmc_project.State.Drive D-Bus interface
   (already defined in phosphor-dbus-interfaces master, change 43155)
2. Map Transition values to systemd targets
3. Monitor JobRemoved signals to update CurrentDriveState

The actual hardware operations would live in platform-provided systemd
services attached to the drive targets.

>
> I don't see a use case for my company for this function currently
> but I'm not opposed to it in PSM if it makes sense. There would
> need to be some synergy though. Does the general idea of monitoring
> and starting systemd targets work for the use cases here?

Yes, drive transitions are discrete start/complete operations, same
semantics as chassis transitions. The systemd target model fits.

Regarding synergy, the drive state manager would directly reuse:
- PSM's D-Bus to transition table to systemd target to JobRemoved to
  state update pattern
- PSM's utils library (subscribeToSystemdSignals, etc.)
- PSM's systemd target naming conventions and dependency mechanism

The State.Drive interface is already defined in
phosphor-dbus-interfaces master. A small follow-up patch to
phosphor-dbus-interfaces would be needed to add the paths metadata [2]
so the daemon can follow the same object path construction pattern as
Host and Chassis.

[2] https://github.com/openbmc/phosphor-dbus-interfaces/blob/a93f3ea1a80a4d02983572f0ceb8b4692e2bd057/yaml/xyz/openbmc_project/State/Chassis.interface.yaml#L95

>
> My preference is keep it targeted on the use case we know unless
> someone has other use cases.

Agreed, I intend to keep it drive-specific. I plan to name the daemon
phosphor-drive-state-manager.

>
> Seems fine.

Thanks.

>
> Feels dependent on your system design. If powering off a chassis
> also powers off the drives, then you can just put the systemd target
> responsible for powering the drives off in the chassis-poweroff
> systemd target.

Agreed, the systemd target dependency mechanism handles this cleanly
at the platform level.

If this direction looks reasonable to you, I would like to start
submitting initial patches to Gerrit for review. I would appreciate
any further guidance.

Best Regards,
Eric Yang

