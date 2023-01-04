Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C67C4332F
	for <openbmc@archiver.kernel.org>; Wed,  4 Jan 2023 09:14:07 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nn3nT6ZmMz3bTJ
	for <openbmc@archiver.kernel.org>; Wed,  4 Jan 2023 20:14:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V5CHBHmD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V5CHBHmD;
	dkim-atps=neutral
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nn3mL5Ty6z2yw6
	for <openbmc@lists.ozlabs.org>; Wed,  4 Jan 2023 20:13:04 +1100 (AEDT)
Received: by mail-vs1-xe2d.google.com with SMTP id l184so5586449vsc.0
        for <openbmc@lists.ozlabs.org>; Wed, 04 Jan 2023 01:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QPMX5kWJZPRRY4wnvXmSYf/iEepycQO9qoz1tO03Y7E=;
        b=V5CHBHmD0S3FbkXFR+gItsN90huqqoo5uYdU3eF8jc9PWKVQPmONGIcPnPtLRvlj8W
         aV2Qr7a0+07PeaMz5mL93zB69HtQifJXnmqseFsOAI4tm/UJBnyf8kT8WPFhsq16Zy0C
         FiR4ay1mvoDxnXMMBZRHJlRM/LA+I2cjFE1hYMFfOMeg/xvt4WheNQZ9a50r5yzkD2Ou
         f/+jpLcxTSotclANBYL9H5j+Ffjp8wuyKs63qKx25pifjjdOVXtGZ5vTQ6yYlW1RAgdN
         3Nz6Wyqb4WyL280TZ17G/vBkRBkqHW/wcb61rIi5eO5VE1BGuKrSsezv16qndtj1OMiJ
         IiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPMX5kWJZPRRY4wnvXmSYf/iEepycQO9qoz1tO03Y7E=;
        b=SYp78YtXg/Ev3goM7x+IXfXyLIBhOZ0hO7AQlPiR9VsR6wPcl7caNVy21WZg3v7XNz
         YSErSHtJLIVIkk498BTIZloOdSnmO8IPy110J/itL+n92xhnA1GQTbSDLfDKAFfop856
         SjPr9HMX8of5EgoQN8j5ZRsT2EJ2vRknwmb8wy/NMQgxoR7CFXgncTG7IvjiGlNk62Mr
         DFKzY1Rk9e+X7jxbY8m6BGy5r+4M8H4ZhKmPIlsMgNReODTjaCXE/P4qsZVVEVTlEZoE
         tNPDMrSmkyS+JfgoYI1Nc9PXrtxIsP3CUZ7OOLxuFmRXmN9p+rPbMd2fl5Ln2Bjr1YFZ
         ML5A==
X-Gm-Message-State: AFqh2kppqkZjz3aW85smL2+GlYsbXzhqeqagqSFCW7ryDVz7BfkW2+XT
	sCEfgCUeiTZv0XURse7oFHSI85QJxSeHjAT8BQE=
X-Google-Smtp-Source: AMrXdXvTAdvAkZT6n8ezEcrJXpeklPvOVSosiAD0Vx17p4+/0cH66MykDFyoZ+aMSBUgDhRY9po3H9T6OpYe5jZNSAs=
X-Received: by 2002:a05:6102:e94:b0:3b1:3231:ac9e with SMTP id
 l20-20020a0561020e9400b003b13231ac9emr5119931vst.50.1672823580988; Wed, 04
 Jan 2023 01:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20221227095123.2447948-1-milkfafa@gmail.com> <20221227095123.2447948-8-milkfafa@gmail.com>
 <b8f173c0-6d40-d6aa-543e-fa8b06557f4f@molgen.mpg.de> <CADnNmFr1naRfam=z0p-4hEugSDJy_HCK8XZyQJ0eFirnmwuH4A@mail.gmail.com>
 <4d64e3f9-57a3-c6be-2709-36e9a1617bf9@molgen.mpg.de>
In-Reply-To: <4d64e3f9-57a3-c6be-2709-36e9a1617bf9@molgen.mpg.de>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Wed, 4 Jan 2023 17:12:49 +0800
Message-ID: <CADnNmFqFMBUj07oAZze3eeXAR0hbep4p9za=XNu5YrLVqUex=w@mail.gmail.com>
Subject: Re: [PATCH v10 7/7] media: nuvoton: Add driver for NPCM video capture
 and encode engine
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, andrzej.p@collabora.com, robh+dt@kernel.org, linux-media@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, kflin@nuvoton.com, benjaminfair@google.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

> > How about "The VCD can capture a frame from digital video input and
> > compare two frames in memory, then the ECE will compress the frame
> > data into HEXTITLE format", is it better?
>
> Yes, I prefer your suggestion.
>
> >> Wich VNC viewer and version?
> >
> > I used RealVNC version 6.21.1109 to test.
> > Do I have to add this information in the commit message?
>
> I do not think there are rules, but I prefer to have the test
> environment and procedure information in the commit message in case
> there are problems, and you want to reproduce things.

OK, I'll do that.


> Yes, that is what I meant. Maybe even the debug messages.

I get these debug messages after VNC viewer connected:

npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: VCD mode = 0x1000b, Hi Res mode
npcm-video f0810000.video: Digital mode: 1600 x 1200 x 2, pixelclock
161666000, bytesperline 4096
npcm-video f0810000.video: ECE open: client 1
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: VCD irq status 0x84b00ff1
npcm-video f0810000.video: offset = 0, ed_size = 1540907, gap = 12
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: VCD irq status 0x84b00ff1
npcm-video f0810000.video: offset = 0, ed_size = 1539638, gap = 12
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: VCD irq status 0x84b00ff1
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: offset = 0, ed_size = 1539638, gap = 12
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: VCD irq status 0x84b00ff1
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: offset = 0, ed_size = 1539638, gap = 12
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: VCD irq status 0x84b00ff1
npcm-video f0810000.video: offset = 0, ed_size = 1539638, gap = 12
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: VCD irq status 0x84b00ff1
npcm-video f0810000.video: offset = 0, ed_size = 1539638, gap = 12
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: VCD irq status 0x84b00ff1
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: VCD irq status 0x84b00ff1
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: VCD irq status 0x84b00ff1
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: VCD irq status 0x84b00ff1
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
npcm-video f0810000.video: VCD irq status 0x84b00ff1
npcm-video f0810000.video: Got resolution[1600x1200] -> [1600x1200], status 0
[...]


> > I can note the datasheet name and revision in the commit message but
> > can't provide the file link because it is not public.
> > Is it ok with you?
>
> Yes, that would be ok with me.

> > So what I have to do is replace "u8/u16/u32" with "unsigned int" for
> > generic local variables as much as possible.
> > Is my understanding correct?
>
> Yes, I would say so.

> >>> +MODULE_AUTHOR("Joseph Liu<kwliu@nuvoton.com>");
> >>> +MODULE_AUTHOR("Marvin Lin<kflin@nuvoton.com>");
> >>
> >> Please add a space before the <.
> >>
> >>> +MODULE_DESCRIPTION("Driver for Nuvoton NPCM Video Capture/Encode Engine");
> >>> +MODULE_LICENSE("GPL");
> >>
> >> Not GPL v2?
> >
> > I'll correct them in the next patch.
>
> Awesome.

 Thank you for your feedback.

Regards,
Marvin
