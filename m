Return-Path: <leroi.lists@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:400c:c09::242; helo=mail-wm0-x242.google.com;
 envelope-from=leroi.lists@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NFHpjygr"; 
 dkim-atps=neutral
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com
 [IPv6:2a00:1450:400c:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420z3J36vlzF35S
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 07:17:12 +1000 (AEST)
Received: by mail-wm0-x242.google.com with SMTP id 207-v6so6849472wme.5
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 14:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E+WhmDnPyDpkbgpLKixicczk4wLz+yZSoyzBBSF5MQQ=;
 b=NFHpjygrE3z5MtCw2aXNcAvOam6LFUzBdb9+rRyuFY25RKNMuLw5ZSDEhscrqMpfi2
 lWrCA5Mm0BboTtDevVv3myJ3a/B4vTjyzeZGOioZortwXPdgy8MelTrXE6NKC9svw5AZ
 VKDrZEQ0voVX+w3iRUP2M+PZlskKsk00ll3UUV+dKPtaARMMezL+QL6v7avYkaAurq2L
 ueg3RkSesAqTm95vvG2VWne3tnbkqqy9XVLYKq51LHKU0dSEIn2rtq31XBX6KIDewN76
 34Sle0h7Tro3rWHF7SX23FLEGQtJpq/hzE7ekFCyL9HlAD/tqq0E0/WiS/VjUM/aV1bS
 G93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E+WhmDnPyDpkbgpLKixicczk4wLz+yZSoyzBBSF5MQQ=;
 b=tg2PyRL11N+O+BRYVMpGjT/DriUIaEVSK0oqdR0MXBWGesRzsb6KuVv5+XRc6L5ol9
 tH8A0HCJAnL6or0pKkwirriFhGTJd0J1culolmYpqoftvaSSMRyKxD7uw7h0CJf0A04o
 QGf01IZUARZRErG00IfFcSviIQbnp48l0h/1krXpiiIRsEsMGFenmGlxlBFE4VnIi03a
 nL31hQ7xven5AsUqLjcVWw0PyFCJBDeON48MCzMpp2VXvk8FeJ8Yppv2dVWBC7InrFyh
 6Kyg7CT4mvaO8HVQcjpUwQ8a6uC5LyUS6C2WS+4VkcT6/w6hZlNJIa/rqKDRun+A3uQD
 CxOQ==
X-Gm-Message-State: APzg51DaZi/WyQldVhpjHmEmB80hjAqiH729LUwUDX8Q4O9HcrKGWhri
 emc7vImej7UskkwpD4NZxRI0G0DRkx0OoRbovpk=
X-Google-Smtp-Source: ANB0VdYRj9nH5GykDQ5ZEZ6C8b+gTUlH/LUGTyHI/KONdA+9QSNtMQZIicAHz0fZiyqnQ+WBPhk++kwXXVj7MUsaMdw=
X-Received: by 2002:a1c:9e89:: with SMTP id
 h131-v6mr5054865wme.13.1535577429043; 
 Wed, 29 Aug 2018 14:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
In-Reply-To: <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
From: Roman Yeryomin <leroi.lists@gmail.com>
Date: Thu, 30 Aug 2018 00:16:57 +0300
Message-ID: <CACiydb+3DJabMS9zQ9mc0i+BdSEG0zMDvT66bauCwJ4WZan9Kg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: marek.vasut@gmail.com
Cc: a.amelkin@yadro.com, linux-mtd <linux-mtd@lists.infradead.org>, 
 openbmc@lists.ozlabs.org, joel@jms.id.au, clg@kaod.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 31 Aug 2018 08:45:00 +1000
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
X-List-Received-Date: Wed, 29 Aug 2018 21:17:17 -0000

On Mon, 27 Aug 2018 at 14:35, Marek Vasut <marek.vasut@gmail.com> wrote:
>
> On 08/27/2018 01:24 PM, Alexander Amelkin wrote:
> > 27.08.2018 13:33, Marek Vasut wrote:
> >> On 08/20/2018 12:26 PM, Alexander Amelkin wrote:
> >>> Currently in spi-nor driver there is a line for mx66l51235l.
> >>> According to Macronix site, there is no such part number. The chip
> >>> detected as such is actually mx66l51235f. Hence, this commit renames
> >>> the chip.
> >> I wonder if this could pose a problem, since this might interfere with
> >> the DT being an ABI. But I guess fixing the name is OK.
> > Well, as far as I understand, in the DT you'll only have "compatible=jedec,spi-nor" for most cases.
> > Anyway, I did `grep -r mx66l41235 arch/*/boot/dts` and found nothing, so I guess it's safe to rename.
>
> The argument can go in the direction of out-of-tree DTs . I think it's
> OK to fix it too though.
>
> >>> According to the datasheet for mx66l51235f, "The device default is in
> >>> 24-bit address mode" (section 9-10). Having option SPI_NOR_4B_OPCODES
> >>> makes the code act as if the device was already in 4B mode and didn't
> >>> need the EN4B command. That prevents this chip from functioning on
> >>> systems where the boot loader left the chip in 3B mode (e.g. if the
> >>> chip wasn't used during the boot process).
> >>>
> >>> Hence, this commit removes the SPI_NOR_4B_OPCODES option for
> >>> mx66l51235f (added previously by commit d342b6a973af).
> >> Could it be there are two variants of the chip, one which supports the
> >> 4B opcodes and one which does not ? Wouldn't be the first time I saw
> >> this. If this chip supports the SFDP tables, you can check those.
> > I was unable to find another variant of the chip. There is only one specified in the datasheet:
> > http://www.macronix.com/Lists/Datasheet/Attachments/7401/MX66L51235F,%203V,%20512Mb,%20v1.1.pdf
> > and it says that the device supports both 3B and 4B modes, but defaults to 3B (24-bit) mode.
>
> So keep the 4B part in. Linux will just not reconfigure the device to 4B
> mode using register write, but will instead issue the 4B opcode
> directly, without any stateful change.
>
> > Most probably, Roman Yeryomin, the author of commit d342b6a973af, was fighting post-effects of u-boot or some other boot loader that set his chip to 4B mode before jumping to Linux kernel.
>
> It's the other way around, U-Boot keeps the flash in 3B mode.

Yep, usually (well I've never seen it doing differently) u-boot
doesn't alter access mode for the flash, since Linux kernel usually is
close to beginning and reachable using 3B mode.

> > It is hard to say for sure, though, as neither his patch itself, nor his post to the mailing list contained any rationale for the change.
> >
> > It is for sure though that for OpenPOWER systems using this chip as PNOR (BIOS flash in x86 terms), commit d342b6a973af broke host booting.
>
> I CCed him, so maybe he can clarify.
>
> But this is weird. If you reboot the system, isn't the SPI NOR
> power-cycled and reset into defined default state ? If not, your
> hardware is severely broken and you should fix your reset routing.

I guess it was clarified below already but will say it again: EN4B is
not reset on soft reboot, there is no power cycle. So the system won't
boot.
There was a quirk for shutdown, which would EX4B. But it was clumsy
and probably never sent upstream. SPI_NOR_4B_OPCODES is much more
elegant.
Sorry for not clarifying this in commit message.

Regards,
Roman
