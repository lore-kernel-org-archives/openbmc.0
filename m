Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KBSib8Ms"; 
 dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44q5c60ZVTzDqMG
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 02:38:45 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id 188so9584246pfd.8
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 09:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+hCr8IW0fLGET0IUhaGOOxF8n2v08OKZZVzHc6iKC2E=;
 b=KBSib8MsNbgTrTEwECfcXSPGkCtIr9i7Dx5mZu/bTaUXp7cHueQ7e6LdjqmEIrR1h6
 DJ2ATy1cSQ9zuWGFVH3qUWRv5n/FOfvux1G4PugEXPWSdZ3sTLmXMzAOVlX2bNvYoYE5
 ZHl1DdahzvEvfBPdZVUlVIaJsL55UWSyPPNyOCAB1I5IyS5JVGGj+cyjJy+5E2qxFGwd
 oY47qvAbVp2VioEMTXZzCgM0vdEZ2l8KroDelc0w5pGa7hSYLfTybVjxatmWZObXz9RH
 9UPW0StfFogmlnQwsKfPpwyLKjJEO0XOTZaN63z7PzG3pG7hMdt7mtCKf/5qEF9yoF/L
 lw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+hCr8IW0fLGET0IUhaGOOxF8n2v08OKZZVzHc6iKC2E=;
 b=dpWFJmzo+ylWGcsC8d2+OrcWr6e1m5KF7/zL2NkzCAjSsp6kOmvGK57oMTqqFbs+o2
 iDN+XiwBiHVkKgrRqBvb7xLQtWNX2CJzknYX7Wq9c9TsqvpBVqKyO7CkGw3tsZs2hYZF
 Khedo8hQMdPZSl9Mo5428utt2Y3qOZnWcDoYkC+Eav99Kp3/HchjocpHkG809l1xLvH1
 s+AlIbVRM10nCW/Ojs4Qxtiz28Lh62dUo/rubnuCv6/wK4rHU4RFHEky/b9nfvL6iPMH
 jsRQrPOwcEdL6O1fCagjfGY23bDuWxvCfLyjmPH8LvoKAsL47H8gnEUXPC6HVq7jRaGb
 edRg==
X-Gm-Message-State: APjAAAUNh9jp8pWUCvtMIC8FsjTaho+VIdsgiIX0E9Qp8+XMu4GYbDGJ
 ssWv8Kh/ong5CBPDMmQj3IggQfAtbeN55UKWVYZYKG8yJh4=
X-Google-Smtp-Source: APXvYqztN1If2GRGDfvYYE57jRo0Gh15J8ySuMTR86Sg8G1us2CvD/TzQwBBSr1YA5zCHf/TcgjLAIEUf+GG7u6wLKY=
X-Received: by 2002:a62:415d:: with SMTP id o90mr34077778pfa.236.1556123921746; 
 Wed, 24 Apr 2019 09:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR04MB5224A33032E47CE691601881C93C0@AM6PR04MB5224.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB5224A33032E47CE691601881C93C0@AM6PR04MB5224.eurprd04.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 24 Apr 2019 09:38:30 -0700
Message-ID: <CAO=notzd6KOAqoYE_BXsrCDts6gGv7OOROKRgKMaLayAqEPESw@mail.gmail.com>
Subject: Re: Fan control service issues - service will not start "Uncaught
 DBus service lookup failure exception"
To: Stephen Boylan <sboylan@ircona.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 24 Apr 2019 16:38:47 -0000

On Wed, Apr 24, 2019 at 9:25 AM Stephen Boylan <sboylan@ircona.com> wrote:
>
> Hello all,
>
> I=E2=80=99ve run into an issue with my fan control. I have a simple two f=
an system which is failing to start phosphor-fan-control@.service
>
>
>
> This is the status
>
> root@evb-ast2500:/lib/systemd/system# systemctl status phosphor-fan-contr=
ol@0.service --no-page
>
> ? phosphor-fan-control@0.service - Phosphor Fan Control Daemon
>
>    Loaded: loaded (/lib/systemd/system/phosphor-fan-control@.service; sta=
tic; vendor preset: enabled)
>
>    Active: failed (Result: exit-code) since Wed 2019-04-24 16:22:36 UTC; =
16s ago
>
>   Process: 1218 ExecStart=3D/usr/bin/env phosphor-fan-control --control (=
code=3Dexited, status=3D1/FAILURE)
>
> Main PID: 1218 (code=3Dexited, status=3D1/FAILURE)
>
>
>
> Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: S=
ervice RestartSec=3D1s expired, scheduling restart.
>
> Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: S=
cheduled restart job, restart counter is at 2.
>
> Apr 24 16:22:36 evb-ast2500 systemd[1]: Stopped Phosphor Fan Control Daem=
on.
>
> Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: S=
tart request repeated too quickly.
>
> Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: F=
ailed with result 'exit-code'.
>
> Apr 24 16:22:36 evb-ast2500 systemd[1]: Failed to start Phosphor Fan Cont=
rol Daemon.
>
>
>
> And I noticed this in the journalctl
>
> {
>
>         "__CURSOR" : "s=3Defc0b033c5f243798b56446bcaffc0f5;i=3D23d;b=3D2d=
e3ccbcea7940f5b51652e55e900cd2;m=3D2f22198c;t=3D5874871dec1c2;x=3Df1ba902c2=
ec1feae",
>
>         "__REALTIME_TIMESTAMP" : "1556120101372354",
>
>         "__MONOTONIC_TIMESTAMP" : "790763916",
>
>         "_BOOT_ID" : "2de3ccbcea7940f5b51652e55e900cd2",
>
>         "_UID" : "0",
>
>         "_GID" : "0",
>
>         "_MACHINE_ID" : "4c5bf4049b5e4751b70a17eaeeb55a49",
>
>         "_HOSTNAME" : "evb-ast2500",
>
>         "_TRANSPORT" : "journal",
>
>         "_CAP_EFFECTIVE" : "3fffffffff",
>
>         "CODE_FILE" : "/home/ircadmin/OpenBMC/openbmc/build/tmp/work/armv=
6-openbmc-linux-gnueabi/phosphor-fan/1.0+gitAUTOINC+4b258ac8b6-r1/recipe-sy=
sroot/usr
>
> /include/phosphor-logging/log.hpp",
>
>         "CODE_LINE" : "105",
>
>         "CODE_FUNC" : "helper_log",
>
>         "PRIORITY" : "3",
>
>         "MESSAGE" : "Uncaught DBus service lookup failure exception",
>
>         "TRANSACTION_ID" : "114915536",
>
>         "PATH" : "/xyz/openbmc_project/sensors/fan_tach/fan0",
>
>         "INTERFACE" : "xyz.openbmc_project.Control.FanPwm",
>
>         "SYSLOG_IDENTIFIER" : "phosphor-fan-control",
>
>         "_PID" : "1273",
>
>         "_COMM" : "phosphor-fan-co",
>
>         "_EXE" : "/usr/sbin/phosphor-fan-control",
>
>         "_CMDLINE" : "phosphor-fan-control --control",
>
>         "_SYSTEMD_CGROUP" : "/system.slice/system-phosphor\\x2dfan\\x2dco=
ntrol.slice/phosphor-fan-control@0.service",
>
>         "_SYSTEMD_UNIT" : "phosphor-fan-control@0.service",
>
>         "_SYSTEMD_SLICE" : "system-phosphor\\x2dfan\\x2dcontrol.slice",
>
>         "_SYSTEMD_INVOCATION_ID" : "21572a9f879c44cab2b9b6b4c5e9a504",
>
>         "_SOURCE_REALTIME_TIMESTAMP" : "1556120101372269"
>
> }
>
>
>
> I know the PATH exists, though I=E2=80=99m not entirely sure about the IN=
TERFACE. I=E2=80=99ve checked systemctl to see if I can find it and I don=
=E2=80=99t see it. Should I be checking elsewhere for it?
>
>
>
>
>
> I can see my fan_tach sensors and my chassis entries as such
>
> /xyz/openbmc_project/sensors/fan_tach/enumerate
>
> {
>
>     "data": {
>
>         "/xyz/openbmc_project/sensors/fan_tach/fan0": {
>
>             "CriticalAlarmHigh": false,
>
>             "CriticalAlarmLow": false,
>
>             "CriticalHigh": 5500,
>
>             "CriticalLow": 1000,
>
>             "MaxValue": 0,
>
>             "MinValue": 0,
>
>             "Scale": 0,
>
>             "Unit": "xyz.openbmc_project.Sensor.Value.Unit.RPMS",
>
>             "Value": 4292,
>
>             "WarningAlarmHigh": false,
>
>             "WarningAlarmLow": false,
>
>             "WarningHigh": 5000,
>
>             "WarningLow": 1500
>
>         },
>
>         "/xyz/openbmc_project/sensors/fan_tach/fan1": {
>
>             "CriticalAlarmHigh": false,
>
>             "CriticalAlarmLow": false,
>
>             "CriticalHigh": 5500,
>
>             "CriticalLow": 1000,
>
>             "MaxValue": 0,
>
>             "MinValue": 0,
>
>             "Scale": 0,
>
>             "Target": 255,
>
>             "Unit": "xyz.openbmc_project.Sensor.Value.Unit.RPMS",
>
>             "Value": 3551,
>
>             "WarningAlarmHigh": false,
>
>             "WarningAlarmLow": false,
>
>             "WarningHigh": 5000,
>
>             "WarningLow": 1500
>
>         }
>
>     },
>
>     "message": "200 OK",
>
>     "status": "ok"
>
> }
>
>
>
> /xyz/openbmc_project/inventory/system/chassis/motherboard/enumerate
>
> {
>
>     "data": {
>
>         "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0":=
 {
>
>             "Functional": true,
>
>             "Present": true,
>
>            "PrettyName": "fan0"
>
>         },
>
>         "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0/f=
an0": {
>
>             "Functional": true
>
>         },
>
>         "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1":=
 {
>
>             "Functional": true,
>
>             "Present": true,
>
>             "PrettyName": "fan1"
>
>         },
>
>         "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1/f=
an1": {
>
>             "Functional": true
>
>         }
>
>     },
>
>     "message": "200 OK",
>
>     "status": "ok"
>
> }

It looks like they don't have that PWM interface.  You can check if
the pwm files exist under /sys/class/hwmon/hwmon*/  for the hwmon*
that has your fans.

>
>
