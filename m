Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x236.google.com (mail-io0-x236.google.com
 [IPv6:2607:f8b0:4001:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v3hDm6fh2zDqHg
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 09:18:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rjAVgm6K"; 
 dkim-atps=neutral
Received: by mail-io0-x236.google.com with SMTP id v96so23785151ioi.0
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 14:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=bmFTmlDUpDr3Vs0Dz5GZYi7AVAnqWNJ89nJNCK3Vr+I=;
 b=rjAVgm6KOBSS8UWENTOabUViscTYdMKVEeho1Ur6KTAzdLvhV6wccnYI/TAQhgHzNd
 bOD8baR6s7ilRjwcEDBGM118OUUwcv77iOvNltxSjImb9TPNBU/4kpLYUGb1EhX1GV7l
 R+BaEagWYys2oBDigJbQ+T5ys4nFylRxKLzgX/e6NeajvHEsgRUYyW53KlQfDPp3P/Dc
 vwKAD8GHmE9LAKtI6/UpK7MNFxHL6vOF04ml83Zv5JO6dtw55HicMKjx+CtUTtfnohO7
 gZ7jbicgbXhc02mpoaKMRaufNrUDBIwchQbaUIdL6IeiBDkFdvSrSdMPk+2V10sqa14E
 EYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=bmFTmlDUpDr3Vs0Dz5GZYi7AVAnqWNJ89nJNCK3Vr+I=;
 b=m2tuH6uP6MbA2MeKUEOJwzDEMxXB7ApKJMzlFIacPasbUhPKqSOjJyyvJyEzlqIz7m
 Jdh3n5WgRpkChBGZ1wh0fZWP0cqIk6psbOyb2gwWhNqeIr9/FDNjpmzgPYlLdW/o7y0W
 RSKlk3DWGwhzhs9gaQVmFqSsajQb2MRTewai62Q9FHNV1AUs2BLfvBGvLTTQplK9XIs/
 NlVIHzPCEmGIdQlRcLEk4a8lrJ7+mDWyLnYRv+Aml0PWOxDus6Zm4hf9T8TZ1bD5iI5s
 K59rkypefJuMtyErGM8mwOJQ2zGwtZ79J9tVYkQ5JdiV2B2WhdTdX5TLiETDwZneN5S8
 a8rQ==
X-Gm-Message-State: AIkVDXK8bbjJg0xMhx4Ht3a3RkaUO4exh1G3LQrIfSUZnX3CskBbS/NDUFnTLRAt7vqVlT824Wb0P0K1NatC6Q==
X-Received: by 10.107.166.18 with SMTP id p18mr5797889ioe.15.1484777878439;
 Wed, 18 Jan 2017 14:17:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.9.155 with HTTP; Wed, 18 Jan 2017 14:17:58 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 18 Jan 2017 16:17:58 -0600
Message-ID: <CALLMt=ojtcMuEp0yJA6z5RtoKmwugWdhM-LC3rhHFuxuTCZfJQ@mail.gmail.com>
Subject: Chassis power on/off targets
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jan 2017 22:18:01 -0000

For this sprints story, https://github.com/openbmc/openbmc/issues/951,
I need to refactor our systemd targets a bit to ensure we=E2=80=99ve got al=
l
the required checkpoints the code requires.  For a bit of background
on systemd and it=E2=80=99s units, targets, and services,
https://www.freedesktop.org/software/systemd/man/systemd.unit.html# is
a good launching point.

Within openbmc we have the concept of targets that have associated
services with them (see /lib/systemd/system/*.wants on a system for
the full list) and we have targets that are used to control the
ordering of execution of those services in the .wants targets.

For example, to power on a system we ask systemd to run
obmc-chassis-start.target.  When you look at the filesystem you see
this (with my notes added):

ls -al obmc-chassis-start\@0.target.wants

    op-wait-power-on@0.service -> ../op-wait-power-on@.service
        # Calls pgood_wait on /org/openbmc/control/power%i on
        o Run before obmc-power-on, obmc-power-start,

    op-power-start@0.service -> ../op-power-start@.service
              # Calls org.openbmc.control.Power setPowerState 1
        o Run after obmc-power-start-pre, obmc-fan-control before
obmc-power-start

    op-inventory-upload@0.service -> ../op-inventory-upload@.service
       # Calls inventory_upload.py, writes a PNOR partition
        o Run before obmc-host-starte-pre

    pcie-slot-detect@0.service -> ../pcie-slot-detect@.service
               # Run pcie_slot_present.exe
        o Run after obmc-power-on

    obmc-start-host@0.service -> ../op-start-host@.service
               # Calls "org.openbmc.control.Host boot=E2=80=9D
        o Run after obmc-power-on, obmc-host-start-pre, before
obmc-host-start, obmc-host-started

    obmc-start-watchdog@0.service -> ../obmc-start-watchdog@.service
  # Calls org.openbmc.Watchdog to set then start the watchdog
        o Run after obmc-host-started

Within these services you have lots of Before/After references to
other targets, like these to control the ordering of the service
execution:

obmc-power-start-pre
obmc-fan-control
obmc-power-start (this is a .wants, with 2 services associated with it)
obmc-power-on
obmc-host-start-pre
obmc-host-start
obmc-host-started

For my state purposes, I need to be able to do this:

Just power on and off the chassis (i.e. obmc-power-on/off) (for
debug/cronus/fsi i2c vpd programming purposes)
Know when the host has started, and when it has stopped (can use
existing targets for this)

Currently we have the chassis power and host power tied together in
obmc-chassis-start, my proposal is to simply make the obmc-power-on
and obmc-power-off targets that now have services associated with
them.  Specifically the services required to power on and off (and
verify they went on and off) the chassis.  So I=E2=80=99ll do this:
- move op-wait-power-on@.service and op-power-start@.service into the
obmc-power-on.wants target
- move op-power-stop@.service and op-wait-power-off@.service into the
obmc-power-off.wants target.

Thoughts or comments?
Andrew
