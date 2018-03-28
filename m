Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::231; helo=mail-io0-x231.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N1A12lAy"; 
 dkim-atps=neutral
Received: from mail-io0-x231.google.com (mail-io0-x231.google.com
 [IPv6:2607:f8b0:4001:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40B7sn2kvgzF2KN
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 00:25:14 +1100 (AEDT)
Received: by mail-io0-x231.google.com with SMTP id e79so3526361ioi.7
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ecpT3/EdVui3C0n+bZTfVhUffmvcFIk3nXLRCmXtPKo=;
 b=N1A12lAyekr/xzI5kDDg0XyNhFIepX9AdTr8/5YckwQnHv7CPXnSWXCZUKfBBXJpwY
 ZXt9i882Fp/1enzEzTUuukl6ozMwc8kv8IpVfQGj4KG+PLnNAfKzq+BkMWXUnEv+ucBA
 YYu39sLFVSxxwwf//km/CMRwMA+1UHBLFyXGUQMzLYOHtLNkoTGk9cYBAhQRiZ+GVtgi
 vA+2ZFr+gqBgzhj6r0Jq1uSqR+v1URlepx9EeDfDewEhBXsVOJlKyXjyjZvMtPFZOyZZ
 iXjzDiXyMF69BHh7TDzYgbJMDsNVK0R3RYTF7HtkRE8niSaKWNai/cnfWJOGWBITs3ao
 r/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ecpT3/EdVui3C0n+bZTfVhUffmvcFIk3nXLRCmXtPKo=;
 b=OuzVoV0FAZsepzabGnscB53hyQ6ZBUOgQ6rP/CsDiFvpmh9k9p6uTOnz6BaIBdHtpK
 Twz/SQZU9WGzjkMPlgCwahOfXuLR/aQPEmbI5HX3XUIrtfMzfkpezUfhoXC4hTw2Tp/s
 ATImlIO26megsuoa2D7H2GtRHBkEio6dr0xZ3QneRIiSteARkBXTzrH2DhdtAN9Nokvw
 mIjLQuEdctxg7z1D/fRh8+9lbuYo1z8xaLSJAbn0VkplPWoFeP9VNLdLRoB+dIgVCBIY
 st8pTvf5XrbT3ZrX6cypPrXrcu/KjlxlIIOqULF5ILIIP2zsK9sLNXpfjjjA7GTzpCKf
 BmhQ==
X-Gm-Message-State: ALQs6tAn0fnQB4kw5cHK25lkLLTxKeOHwALsIzHR59imI+kssG4v54WP
 PuiXNobaQaSAkoWTpR30pdXGYfSIHh5EtSgM2OtP3w==
X-Google-Smtp-Source: AIpwx4+iQwzb64XxIIinw5aaaaO3ZavPGi24a9ASPjUF93/ee9n6w68jRByn92yEVo7PiCxnOIflfdFRhDwbS/cZjXo=
X-Received: by 10.107.174.207 with SMTP id n76mr10355ioo.16.1522243511558;
 Wed, 28 Mar 2018 06:25:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.11.159 with HTTP; Wed, 28 Mar 2018 06:25:11 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 28 Mar 2018 08:25:11 -0500
Message-ID: <CALLMt=qYtvJ5-tgf1=NVxYv8OeviamZrAGizsNYzE48V-icVww@mail.gmail.com>
Subject: New obmc-host-startmin action target proposal
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2018 13:25:19 -0000

Recently an issue arose
(https://github.com/openbmc/openbmc/issues/3035) which stated OpenBMC
needed to reset the host reboot counter whenever a fresh power on is
done. The host reboot counter
(https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbm=
c_project/Control/Boot/RebootAttempts.interface.yaml)
is used to ensure OpenBMC only retries the boot of the host a certain
amount of times.  It=E2=80=99s decremented each time the host fails to boot
and if all retries are used, the BMC will go to a host quiesce state.

It brought up an interesting issue because the reboot path used by
OpenBMC when the host fails to boot basically just used the host-stop
and then host-start target.  The host-start target is the same target
used for a fresh power on. This put me in a quandary because I
couldn=E2=80=99t just add a service to host-start to reset the host reboot
count since it was used in the reboot path.

Adriana and I discussed a few options (bread crumb in reboot path to
look at, software logic in phosphor-host-state code) but none seemed
as clean a just making a new host start action target.  The proposal
is we have two targets:

obmc-host-start (existing target)
obmc-host-startmin (minimum services required to start host, used by
reboot target)

The obmc-host-start target will require (i.e. start) the
obmc-host-startmin target.  We can now add services that we only want
run during a fresh power on to obmc-host-start.

I put the code up in https://gerrit.openbmc-project.xyz/#/c/9774/ (and
it=E2=80=99s related commit).

ref: https://github.com/openbmc/docs/blob/master/openbmc-systemd.md
(I=E2=80=99ll be updating this pending and comments on above design)

Comments appreciated.

Thanks,
Andrew
