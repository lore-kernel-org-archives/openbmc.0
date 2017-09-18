Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E8kz+z+o"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwWdW2Y6CzDrWM
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 13:26:54 +1000 (AEST)
Received: by mail-lf0-x243.google.com with SMTP id m199so3822495lfe.5
 for <openbmc@lists.ozlabs.org>; Sun, 17 Sep 2017 20:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=0j9CSQMqTN2sBKkGwWCpJqtpLixtUMI1I48OF00v1AA=;
 b=E8kz+z+o2aPhh8oCm7O3Fq55/WezaC7O1GuQs3clCxUNdsMvbOKRYDrj3y8avs5kse
 G/OJQzIzYcxHTrgHJ/lUpPb78benq11apBv9ngFTGOx73idVQDZCpR7l58knv/N1KXEg
 6Kd4To6W4Vi5BSkCCkMEUOwTXd/Q+V92+utsEKVwkwi2mr/1PRJRrUnKYZkTSBtQyLH5
 rKgox0PFwG71HruFGQdefDXs0GzJo27tL6eSwwgbV9eeZpZudD2UYegK9JVYX/QDKRnb
 lcsk4/jZbL77y4hqDPvo/LtU79liTJJqWziPMezxzJJMKWh5gPyATzQ+/DMf8MXHI2wo
 qiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=0j9CSQMqTN2sBKkGwWCpJqtpLixtUMI1I48OF00v1AA=;
 b=MaQJNFzdkRoaS8HDsC4+gM4UhVvlsEhm39yVm0PMqyEP7fSitqxPdNs4m58Q1X61OV
 HJzBFIT8dcQwDXoZdUzcgdf6cE7zZMO7G3R9AlE2ulbzzj7a52DEBtEDRro1aW5j9zsu
 9T2jsSIG5p6n/jgG3ekE/Bj41lVCq6sFMj0Fl1H3iNZT8mXw4nIkJrHdIDSUe+cv1ske
 vr0PWkVNIYGOVEqqUoQspSUNRnOZPG9zEUKd3S/S29ViEjLsAIPp/EmOFGaQ1GmOy4k0
 dKWPd8gf8RNxgyEgkeFdsn/ducx4811KoDX9HQ0xmQqZ3WIvspnO69Yy3R4MKMKl+j15
 L/aQ==
X-Gm-Message-State: AHPjjUgxKyBMDG9gNvTrDxnMR1/na5S1QOBVNVDzVTJt0a4RDGai7j5v
 Fr3cvPoWbPBMDdAr3vyS40kH4xIZ0xQuQIJA60w=
X-Google-Smtp-Source: AOwi7QASbqa35ps1RUz1fYz70r5KYHg23gaORBiQQclQqVaxG8XMc9/2WnVxYMsq1p3hFqyoCE3UIHUNJkVWP/uzk2I=
X-Received: by 10.25.100.18 with SMTP id y18mr2843060lfb.257.1505705210361;
 Sun, 17 Sep 2017 20:26:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Sun, 17 Sep 2017 20:26:29 -0700 (PDT)
In-Reply-To: <9659eb97-6d10-d204-02a5-9359e2a09b8f@kaod.org>
References: <20170915061830.1527-1-joel@jms.id.au>
 <9659eb97-6d10-d204-02a5-9359e2a09b8f@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Sep 2017 12:56:29 +0930
X-Google-Sender-Auth: m0p92TG1KtTek5hNh53cNuh9fqs
Message-ID: <CACPK8Xe3_XNjoLF5CzmY8dDFbg8ivs1Fm4nLXbpNonds85rW+Q@mail.gmail.com>
Subject: Re: [PATCH qemu] arm: aspeed: Add palmetto and evb EEPROM I2C devices
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 18 Sep 2017 03:26:56 -0000

On Fri, Sep 15, 2017 at 4:55 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 09/15/2017 08:18 AM, Joel Stanley wrote:
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> We could fill the eeprom_buf with some valid data if needed.



That's a good idea.

When I use this I see the following error:

# pwd
/sys/devices/platform/ahb/ahb:apb/ahb:apb:i2c@1e78a000/1e78a100.i2c-bus
# hexdump -C i2c-0/0-0050/eeprom
hexdump: i2c-0/0-0050/eeprom: Operation timed out
00000000  74 65 73 74 20 64 61 74  61 0a 00 00 00 00 00     |test data.....=
.|
0000000f

A strace shows three reads, with the first succeeding and the second
two failing:

# strace hexdump -C i2c-0/0-0050/eeprom
execve("/usr/bin/hexdump", ["hexdump", "-C", "i2c-0/0-0050/eeprom"],
[/* 12 vars */]) =3D 0
set_tls(0x76fad764, 0x3c, 0x76fac47c, 0x24, 0x76fad698) =3D 0
set_tid_address(0x76fad6b4)             =3D 581
getuid32()                              =3D 0
open("i2c-0/0-0050/eeprom", O_RDONLY|O_LARGEFILE) =3D 3
dup2(3, 0)                              =3D 0
close(3)                                =3D 0
readv(0, [{iov_base=3D"test data\n\0\0\0\0\0", iov_len=3D15},
{iov_base=3D"", iov_len=3D1024}], 2) =3D 15
readv(0, 0x7e898cd4, 2)                 =3D -1 ETIMEDOUT (Operation timed o=
ut)
readv(0, 0x7e898cd4, 2)                 =3D -1 ETIMEDOUT (Operation timed o=
ut)
write(2, "hexdump: i2c-0/0-0050/eeprom: Op"..., 50hexdump:
i2c-0/0-0050/eeprom: Operation timed out
) =3D 50
ioctl(1, TIOCGWINSZ, {ws_row=3D0, ws_col=3D0, ws_xpixel=3D0, ws_ypixel=3D0}=
) =3D 0
writev(1, [{iov_base=3D"00000000  74 65 73 74 20 64 61 7"...,
iov_len=3D76}, {iov_base=3D"|\n", iov_len=3D2}], 200000000  74 65 73 74 20
64 61 74  61 0a 00 00 00 00 00     |test data......|
) =3D 78
writev(1, [{iov_base=3D"0000000f", iov_len=3D8}, {iov_base=3D"\n",
iov_len=3D1}], 20000000f
) =3D 9
exit_group(0)                           =3D ?
+++ exited with 0 +++

Any ideas there?

Cheers,

Joel
