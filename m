Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x234.google.com (mail-io0-x234.google.com
 [IPv6:2607:f8b0:4001:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xfBBr1tQqzDrVp
 for <openbmc@lists.ozlabs.org>; Sat, 26 Aug 2017 05:32:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="b6d4snN8"; 
 dkim-atps=neutral
Received: by mail-io0-x234.google.com with SMTP id g33so2487540ioj.3
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 12:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=pzZJGd1GBmK3WBcYDnflfTjcMW9C8DxgS8vYa4lJOVQ=;
 b=b6d4snN8gwNFg/mrv0twyvFtwLIC0POq7LBsq6S2iI+KO38Wp9uDV5jaIJFcaYeSFO
 NVYcL6LLu8w9JAAZf3Aaxqxu07SUMSujJ5NC68+REqpj1NJGEfZINPnQkD7c8V6e2KE7
 cdJwP05CzjZ9OF4KcfLCw6s9DNjV6eMMsxK4jGM+8dvaRmAurPhpxUdpRoO30qJppkVE
 iTmHakPSh5GT8aCbT4Xa4U+kLh7Kx2T2vV0W40HQwLIIohChuNXRysGqTi8KWaSNLfsp
 hi66ih89jDlfXR1sEhtwr1r3Qn+IXK74uC2Mzjq7fmbXLBMnLUo5553GJEbe1W94MK6D
 TJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=pzZJGd1GBmK3WBcYDnflfTjcMW9C8DxgS8vYa4lJOVQ=;
 b=Zy2dpbNijoSP+ot5zFEDb5hE9tJqJgm5tU5X+nKHpA7MtJtoLNW53UB+83/2AEqjsK
 44+b9AIUg2Gjix1Bn48zBjlo0JMiXfHG0zBwi7Jv+D1WKJYgkTOPxBXdwtgz/GWVJitv
 H2L09ynvi1ghNx2xq0yIFAO9fRMsZNsLTJsrRoZkbG9+PlY2h6b/Fjjino76lc74osYc
 d1z4MoH47ehlMj2euNLXc4/bBlBFKzxrtVJW2BduXQ1GGVNF2KaUOojRc19k/1ywmeFS
 iuEI6qK59vB88S/IV4kaeC7WcSZHHGZ1bx+kWWptVVY6E9xPoa4xMa72tQmf4eZ5Napt
 aECg==
X-Gm-Message-State: AHYfb5jV3FGAfIxVkFoFrK7UQ3y7MiONaZWBt2vtczKzI1EaViXV4iEk
 txFEba4LjwwbTQSJRPkCRRCMH1DBtwW+
X-Received: by 10.107.2.77 with SMTP id 74mr3637893ioc.76.1503689553694; Fri,
 25 Aug 2017 12:32:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.182.139 with HTTP; Fri, 25 Aug 2017 12:32:33 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 25 Aug 2017 14:32:33 -0500
Message-ID: <CALLMt=rD633fC_qLVzUZAtQwuU_EoQZ+1yD9okrd1tngp1cpzg@mail.gmail.com>
Subject: Power Restore Policy
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 25 Aug 2017 19:32:37 -0000

The BMC has the concept of a Power Restore Policy.  It=E2=80=99s defined
within https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/=
openbmc_project/Control/Power/RestorePolicy.interface.yaml

The point of this policy is to define the host boot behavior by the
BMC if it is rebooted.  The policies are:
o AlwaysOn
o AlwaysOff
o Restore

What complicates things a bit is the scenario where the BMC is
rebooted, but the host is booted.  Rule number one in bmc management
firmware is don=E2=80=99t mess with the host if it=E2=80=99s up and running=
.  So
basically, if the host is up and running, and the bmc is rebooted, the
bmc should do no actions other then to get it=E2=80=99s chassis and host st=
ate
objects to reflect that of the chassis and host (on and running).

If the host is not running, then here=E2=80=99s what the policies mean:

o AlwaysOn -> Power on
o AlwaysOff -> Leave system in off state
o Restore -> Read last requested host state and re-request it

OBMC has an application, somewhat misnamed, discover_system_state
which enforces the AlwaysOn logic.  The Restore logic was put into
phosphor-host-state-manager but I don=E2=80=99t believe this is the correct
place for it.  It does it when it reads it=E2=80=99s persisted value for th=
e
last requested state when it starts.  I=E2=80=99d like to move the Restore
logic in with the discover_system_state application.

The reasons are the following:
o discover_system_state=E2=80=99s service can easily be configured to not r=
un
when the host is already running
o phosphor-host-state-manager has to be started always and early, so
that it can monitor for any state change requests (like in the case
where the bmc is rebooted while the host is still up).
o Having all the policy in a single application is more testable and obviou=
s

https://github.com/openbmc/openbmc/issues/2210 is tracking this.

Thoughts or questions?

Andrew
