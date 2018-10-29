Return-Path: <truongmd@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com;
 envelope-from=truongmd@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EW3vVRY7"; 
 dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42kSxH4BBkzDrNV
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 08:52:00 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id p144-v6so4672052oic.12
 for <openbmc@lists.ozlabs.org>; Mon, 29 Oct 2018 14:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MOaWDGRrFryBZF+Usa8duu9xqoiOAUvJi1JhbuiWlOs=;
 b=EW3vVRY7Dnm5ZaLdF4UuhR+7EemTwbLENlbc1Z2JblsiUU1jTAqRx0wrWlLMvAtEzZ
 E4vNAuZ5Lg9TA5zFXpwI5+CB9sacB/z3UPtq4+vQo0FYTzXTdU0guhxE1j1gsQC1l9AD
 TB/HLdJ/q9cugNhTOako8wLXMAS2gthZy+61XuQKbVPCCVpug9McjmCEoJ2pmgWaye5F
 zbzC2Q9CRDuCuHrXTX73XN4hq/I9QsGdtpD14BC8+5AIkpeyWpX2wISOLCl6DFXJIJz/
 AsUfZWPDcwVgbuFMaVoS1cYD1Yh7pdDqtnD7lQ5imtMbnhY6Tqk/nepjhQFiUSIe5jdo
 2+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MOaWDGRrFryBZF+Usa8duu9xqoiOAUvJi1JhbuiWlOs=;
 b=XY5iCF44cBHUO3marsSU3SGhO56NU2nOV3Cubvm+m/db2mXnQwqkaGCSv3ghAePMWj
 yzOcBF7LL8b+sZhS+fRoslGOFdhpom8wRcVLT94hfEUqPyPXTVgU7JYp71RS9td1gEWs
 /3LBcaS1wODY6UhLG9TW32OBTjCmi+HWrX08PitkOgqPAZAMK9nZCuWwCEl0L2Np1Cnf
 4h0Ip35eQ6VpwvgTIMlNoaqZRkhzujM/4yKyAQpr9sj1+ls27Uoi2gV8VjOHZ4JBAGFK
 RCEXQwLclkyN0jL14VoJa3dAKREG/rpF5AzrMe9eB0hM5LwfUuOSdaGWJ0ofdNaVVKg5
 IezQ==
X-Gm-Message-State: AGRZ1gIjzrp5JEtzOIriP4nstrEBpwwikFU1wzGIZgTOUi3z4rFI3do1
 /rpSak4lJLnKYXy4k0FqHRE26ZzJfaEgViaDbBKyUurt
X-Google-Smtp-Source: AJdET5dV61COa8uU3OY/nB0AmieD4FWwE2GtdL9jdDgc+/4guJW2hrijcx4fHUEK5ymmBQ1SMGmEjhicfD3oT/S2J1I=
X-Received: by 2002:aca:785:: with SMTP id
 127-v6mr9949217oih.127.1540849917343; 
 Mon, 29 Oct 2018 14:51:57 -0700 (PDT)
MIME-Version: 1.0
From: "M. D. Truong" <truongmd@gmail.com>
Date: Mon, 29 Oct 2018 14:51:46 -0700
Message-ID: <CAEx7e2SGZWe5ba9=0rSFc1-ArS9uPDhn8oLFSZMT4ygX968t9w@mail.gmail.com>
Subject: OpenBMC Raspberry Pi
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 29 Oct 2018 21:52:04 -0000

Hi all,

OpenBMC on Raspberry Pi seems to have a bit of interest as a
stand-alone reference platform. The source has teased the possibility
of running OpenBMC on an RPI, so I bit and took a few cycles to make
it work. On a GitHub fork of OpenBMC code, sitting on the
"raspberrypi-cm3" branch are some patches that will build a working
distribution.

https://github.com/truongmd/openbmc/tree/raspberrypi-cm3

The README.md file has most of useful notes on building the code and
bringing it up on a device. I'm looking for feedback on changes before
pushing the code upstream. Features is a completely separate area for
discussion.

This was a great learning experience and I hope it's useful for others.


Cheers,
My
