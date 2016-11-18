Return-Path: <geissonator@gmail.com>
Received: from mail-qk0-x22b.google.com (mail-qk0-x22b.google.com
 [IPv6:2607:f8b0:400d:c09::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL8mL0cfbzDvyS
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 07:31:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="x09f5w9K"; 
 dkim-atps=neutral
Received: by mail-qk0-x22b.google.com with SMTP id x190so278078653qkb.0
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 12:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=sjBJUkkPVrbFBI+S99h+brk+HG2TArXGNWKCjd2L450=;
 b=x09f5w9Kgy4rg2uSEardhKII75YQT13i0cVf5m6OD8AFcJj56pBLFNKrMBOR/7MvhF
 yWG9fuZWrD0RkiteeDuvj/L/zRAWLiqInjANjoYMxduZUVTpCs4Dh7NTn8tTtvvMQuP1
 JiBJULF3jD2H7tL3oPIGD9k7HyP0cwr3684XNUgHP1iqzG5w+nJodI6nolNlZST8WMlq
 hWrpdqyoWooDfRe3bLo1aK9ixcR/nkFWaeqAKo1IbZ74v6WA5WepgxpIlFagfjBWinjW
 5jwLDlGowP3LYWpdfMBba/A0FB0ENPFu0rtqfe/IL2COvnJ9xgx0KEkR7YxAGJnGMoGh
 6QEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=sjBJUkkPVrbFBI+S99h+brk+HG2TArXGNWKCjd2L450=;
 b=liQ8Dd1cy1zemwOp6aeRXuswKNQjK1byeEkBz52bTgx5n61szj2twUJ4De+1P/kQW7
 O26O4/fuTSQXmycBh8avaM6tqurSgY4R3yY3XEJ1leKDkl2w9iai/nvfpjMujzStb52Z
 k4h6M9G4KUP+zMmS6TPsP6/YVBFMQzbeUnWfI6/XfsZeiuJpMYBPCl5lzCIZgo9atZJY
 VKLkRXKFg7hddSOJsahZUqJ5UqwZI7kW/GbOmvq+lXavXzhTFwkvmmHHaG0JWN426mBf
 hbTQnXqgwY9CPqAZCF3M9JsV6GMVisyBZeOHZJ42hf2hyc9tQi+DbRV1ZBdyQnqC9tQW
 vgvQ==
X-Gm-Message-State: AKaTC00SzV8zYuewUE08P4ZKeE4VQcb1CLVwrwKKyvhxTrQsXT0qRTpbAEx8LsjYyb8/FYTOjbeSMPxcx+CxiA==
X-Received: by 10.55.150.193 with SMTP id y184mr2290529qkd.296.1479501101627; 
 Fri, 18 Nov 2016 12:31:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.148.49 with HTTP; Fri, 18 Nov 2016 12:31:41 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 18 Nov 2016 14:31:41 -0600
Message-ID: <CALLMt=oZ7neAge4of5KwzEQbA9nZ_ayuaYwFyUPGqN14Oq-5fA@mail.gmail.com>
Subject: BMC and Host State Management Refactor
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
X-List-Received-Date: Fri, 18 Nov 2016 20:31:46 -0000

Josh and I are working two stories this sprint that deal with
refactoring the bmc and host state management code out of skeleton
(#772/#783).  Here=E2=80=99s the proposal on this work.

A new repository will be created, phosphor-state-manager.  Within this
repo we will support both the BMC and Host state management functions.
The bmc and host function will be broken into separate objects within
the repo for cases where people only want one or the other.

For host management, we will be moving skeleton/op-hostctl into this
new repo.  The primary responsibility of this code is to initiate a
host power on/off/reboot via systemd and to monitor systemd targets to
maintain a coherent state of the host.  We will also be moving a
portion of op-hostctl into it=E2=80=99s own standalone application that wil=
l
be run in a systemd target and do the FSI bit bang magic to start the
SBE/Hostboot. Note that we will be moving a portion of the
skeleton/pychassisctl out as well (specifically the power
on/off/reboot and query functions).

For the BMC state management work we will be moving skeleton/bmcctl
into this new repo.  The primary responsibility of this code will be
to provide reboot and current state information on the BMC.

Note the actual state managemen function is still contained within
systemd and the corresponding units we've associated with it.  This
code we're writing here just iniates the systemd targets on user
requests and tracks the defined states by monitoring systemd progress.

The overall design for both state management objects is that they will
provide a set of properties on which to operate.
- DesiredState
- CurrentState

CurrentState will be a read only property.

The host control will have these additional properties:
- DesiredPowerState
- CurrentPowerState

Valid states to request for OpenBMC (DesiredState)
- READY, REBOOT
Valid states to be in for OpenBMC (CurrentState)
- NOT_READY, READY (note this proposal removes BASE_APPS and BMC_STARTING).

READY implies all services started and running successfully (i.e. we
reached obmc-standby.target)


Valid states to request for Host (DesiredState)
- OFF, ON, REBOOT
Validate states to be in for Host (CurrentState)
- OFF, BOOTING, BOOTED

BOOTED implies petitboot has reached it's "ready" state.


Valid power states to request for DesiredPowerState
- OFF, ON
Validate states to be in for CurrentPowerState
- OFF, TRANSITION, ON

Patrick and I had some discussion on providing more details on the
host booted state (petitboot vs. os booted) but that can be an
extension in the future if needed.

Yaml for review will be available shortly in gerrit.

Comments always welcome!
Andrew and Josh
