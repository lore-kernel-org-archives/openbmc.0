Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95195606A31A
	for <openbmc@archiver.kernel.org>; Fri, 23 Oct 2026 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=Vd6L5APh
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j9xdG6R1Dz2yS4;
	Fri, 23 Oct 2026 19:53:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=78.41.115.137
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792745618;
	cv=none; b=d5nARBtyKC+Rl7ghqH4BlTZy2+m4KYQv82FM9U21u4fm1egBCUtxp2pEawqmKhf3N/2J7dumrLv581cZJoLrREo9pAPu24g+tdxocuVIcG26niN3t2O7x6ButdWgFZo8K0erdnxEfC9z39epC4+r693guGm621qH0IhjurtCzwQWJ5t1qBHh3CO9k6XFwrKw6Vgu89wM7zkYId+FTV0AvBC/UL0LEsDhuVDkK3rT7y46R5cnH8j+Qr0dymRoQOEceTVDVQ/m9Q8ez+VQGwQwKShjUpwk5CTVc5PAtcu/FMaILcdYi5I5d8ALMAD16J3hdUkCdk6TpPicLD4+oXQdHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792745618; c=relaxed/relaxed;
	bh=DKyD7y7aiJU8ti9KmRJEw2BugeOPJd+RRSlPy5UtjDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ixvm+I+dCxTFXkVKVBmzznLGV0Xf/FS+YSy/5a+ski5ZtaOMQLjMHnHLV8ElVVH+88ikNhdZIhh3hS/M3TZA0+eM3QoZr4USf/kc6EDIJ79JJIhwAcvcZxu3Y/5Omy4ADuBS583UdhYrly3V5uwbemsfrFV4OFWOyfpq5g+6NIOENt2TFwJ2qbeK2Ei0bG7LaiOEzcOR6o2v8UAGcImxvCyE2ZazBmMBtEN/2Bu72OJqBLR1Vplpmv8VBf2kiNyb3Q+OPtiaaxU9KADs4qffjb0c1KaB9nvPeZHLqmP8C5HPy6Eolw1/8fQwTF9J329K3EoEVrzCznSQxs0c5FxmPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info; dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=Vd6L5APh; dkim-atps=neutral; spf=pass (client-ip=78.41.115.137; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org) smtp.mailfrom=truschnigg.info
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=Vd6L5APh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=truschnigg.info (client-ip=78.41.115.137; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org)
X-Greylist: delayed 310 seconds by postgrey-1.37 at boromir; Fri, 23 Oct 2026 19:53:37 AEDT
Received: from truschnigg.info (truschnigg.info [78.41.115.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j9xdF0sllz2xfX
	for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2026 19:53:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=truschnigg.info;
	s=m22; t=1792745301;
	bh=oZyACWlYbEyGEMgKy+Ou2ocjxvLi5UKgHueMMgxa2zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vd6L5APhKEaeSRRX0OCvASG6JuYhvPaqaJOZXk1MCbSOrrfo2oSsENpA3XEHmbvJI
	 MiDT6koNDFvnaJbkkiMW4jEZBDbWuTOKglfySmn5afeAcqplCdzKbe95ZuvEwcGm1U
	 AhVumEXOV0f2qnNB2RyXtepIrDHWDs9YR/ctDkEOA145Y61x5TZ+fTr1kEgcF1HldY
	 Gl86shNJ3ZiWM3jam9IW3ajDnOOZ1CJeOIdCBif5L0D4anO+2Ie/GTGhD0LR2In8PS
	 qHt4c+U4i/2GqbK514ZzUQjBwU6dtt6ORN8xlnLJ4eAF5pc8U/RpHxj9+PaZMwAh67
	 U01iANDKeGOHg==
Received: from vault.lan (unknown [IPv6:2a02:1748:fafe:cf3f:36af:7255:92c4:fe72])
	by truschnigg.info (Postfix) with ESMTPSA id 521EA3F258;
	Fri, 23 Oct 2026 08:48:21 +0000 (UTC)
Date: Fri, 23 Oct 2026 10:48:19 +0200
From: Johannes Truschnigg <johannes@truschnigg.info>
To: KAVYA M M <kavyamadarsh@gmail.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Seeking guidance to start to work on OpenBMC
Message-ID: <atsfU9jLm4IJAhGw@vault.lan>
References: <CAD_a9mYhkzX+4CoCX+7NtYMR7C5C-dBVvQB90g=1f2aHTu3oUg@mail.gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TfyKeSftBTOeSZgo"
Content-Disposition: inline
In-Reply-To: <CAD_a9mYhkzX+4CoCX+7NtYMR7C5C-dBVvQB90g=1f2aHTu3oUg@mail.gmail.com>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--TfyKeSftBTOeSZgo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kavya!

I cannot speak on OpenBMC's behalf of course, but I might have a few useful
answers to your questions. I did try (and partly succeed, mostly thanks to =
the
great support from kind people in this community) to port OpenBMC onto a mo=
re
consumer-focused board, the Gigabyte MC12-LE0 (with an AST2500). The port is
not ready for production use and most userspace component configs are still
missing, but it *does* work in principle.

I had pretty much the same situation that you seem to face going in - no
manufacturer-internal docs, an existing BMC firmware image (that has many
AMI-specific patches on top of Linux 3.x and predates/avoids Device Trees, =
for
instance), and an appetite for some hacking ;)

My fork lives at https://github.com/jtru/openbmc/tree/gigabyte-mc12-le0
The installer at https://github.com/jtru/openbmc_gigabyte_mc12-le0_installer

I'll try to answer your questions inline.


On Thu, Oct 22, 2026 at 09:48:34AM +0530, KAVYA M M wrote:
> [...]
> I have the following questions:
>=20
> 1. Hardware documentation required
> =E2=80=A2 What documents are normally required before starting an OpenBMC=
 port for
> a new motherboard?

"Required" is an elastic term. From my experience, what I would have most
appreciated and what took the longest to reverse engineer would have been a
document detailing the mapping of GPIO pins.


> =E2=80=A2 Is the motherboard user manual sufficient, or do we also need t=
he
> motherboard schematic, BMC datasheet, hardware design guide, component
> datasheets, and board-specific signal mappings?

The normal user manual is not going to be sufficient and probably not very
useful for what you intend to do in the first place. It's just a very
different target audience and use case that it covers. It *might* help you
locate UART debug pins for BMC console access on the board (if these exist),
but you'll probably have better results just looking for them on the PCB wi=
th
your own eyes :)


> =E2=80=A2 for example the CPU schematic and AST(BmC) reference schematic =
are
> available but the motherboard schematic is missing, how much of the
> required hardware configuration can be established from them?

Mind you that I only have experience with the AST2500; this might not apply=
 to
you board/platform!) GPIOs and their purpose and polarity is, I think, what
will matter most.


> =E2=80=A2 Since my target board uses the ASTs BmC, which specific datashe=
ets or
> hardware design documents should I obtain?

Anything you can get! :) But don't fret if you cannot get everything or even
most/many documents; having access to the running firmware (or an unencrypt=
ed
image of the firmware) will probably carry you most of the way, if you put
enough effort in. I guess that these days, some LLM-assisted reverse
engineering would carry you a long way rather quickly.


> 2. Extracting information from existing BMC firmware
> =E2=80=A2 If the original BMC firmware is available only as a binary and =
its Linux
> shell or source code is restricted, what information can reliably be
> extracted from the image?

Depends a lot on the firmware. With the AMI MegaRAC stuff, it was a mix of =
arm
ELF binaries, some (partly obfuscated) Lua stuff, data going in and out of
Redis, and shell scripts that held everything together. The latter parts we=
re
easier to digest than those earlier in that list, but it's probably going to
be different for your board anyways. You will (have to :)) figure it out as
you explore the image/firmware.


> =E2=80=A2 Can we identify the flash layout, device tree, GPIO configurati=
on, I=C2=B2C
> devices, sensor definitions, fan configuration, Ethernet settings, and
> board identity?

Even AMI's very old Linux-based firmware foundation had to interface with a=
ll
these hardware facilities capabilities; the trouble was finding that
information in all kinds of non-standard places, and then translating these=
 to
a "modern" DTS/DTB-based setup that OpenBMC requires. All the info is
certainly in there; HOW you will be able to obtain it, I cannot predict.


> =E2=80=A2 Which details can be confirmed from firmware, and which require=
 the
> motherboard schematic or physical measurements?

I just can say that I did not need any special docs or even use of any spec=
ial
electronic device to get as far as I managed to. What helped the most were
some Free and Open Source software tools to revive the BMC whenever I did
manage to brick it (culvert, flashrom), and the ability/equipment to short
certain pins on the BMC to prevent it from reading its ROM via SPI. That was
only required for device recovery when things had gone very bad.


> 3. GPIO and hardware configuration
> =E2=80=A2 How can we verify GPIO connections, signal polarity, direction,=
 timing,
> and safe initial states without the motherboard schematic?

By reversing what the official, original firmware does. After that, trial a=
nd
error.


> =E2=80=A2 How can we identify the actual I=C2=B2C bus routing, multiplexe=
rs, device
> addresses, and peripheral protocols?

Same as above.


> =E2=80=A2 What is the recommended method for verifying voltage-divider va=
lues, ADC
> scaling, and temperature sensor configuration?

Same as above.


> =E2=80=A2 How should fan PWM/tachometer mappings, fan zones, minimum safe=
 speeds,
> and failsafe behavior be established?

Same as above.


> =E2=80=A2 How can the LED wiring, Ethernet PHY address/reset configuratio=
n, and
> NCSI connections be verified?

Same as above.


> 4. OpenBMC image development
> =E2=80=A2 What is the recommended workflow for creating a new OpenBMC mac=
hine
> configuration, device tree, Yocto layer, sensor configuration, and requir=
ed
> services?

It's been such a long while since I started this adventure, and I am not ve=
ry
familiar with Yocto regardless, so I do not feel like I can give very good
advice here. I did start with a new meta-$(manufacturer) sub-directory, and
cherry-pick (not in the git-commit-sense) components that I discovered were
needed to advance :)


> =E2=80=A2 Are there existing OpenBMC reference boards or porting guides t=
hat would
> be useful for this type of project?

I did draw some info from existing boards (AST2500 EVB and Facebook's
tiogapass machine), but I did that without having access to either of these=
 in
hardware. YMMV.


> =E2=80=A2 Can we proceed with firmware analysis and QEMU testing while so=
me
> hardware details remain unknown?

I never managed to boot the original AMI BMC firmware on QEMU, and did most
(if not all) of my porting work on the actual hardware. That might be a bad
idea if your board's implementation closely matches the QEMU example machin=
es;
I imagine having a virtualized testing platform for this kind of dev work to
be an absolute boon.


> =E2=80=A2 Which functions can be validated in QEMU, and which must be tes=
ted on the
> physical motherboard?

I don't know, sorry.


> 5. Flashing and recovery
> =E2=80=A2 If the original BMC firmware source code is unavailable, can a =
custom
> OpenBMC image still be developed and flashed safely?

Yes, I think I have demonstrated that with my project.


> =E2=80=A2 How should the original SPI flash be backed up, the flash layou=
t and
> image size verified, and a recovery procedure prepared?

You can use the manufacturer-specific update tooling to obtain a backup, or
try your luck with flashrom, via culvert, or by using a hardware flash
programmer. The backups have not been very important in my case, since just
flashing any stock firmware image onto the board's flash restored that in an
orderly, working fashion.


> =E2=80=A2 What checks should be completed before writing the image to the=
 physical
> BMC?

I don't have any advice for that... but I would try to re-flash the
manufacturer's original firmware image at least once using a recovery-style
procedure (say, by using the EFI-shell based utility provided by most
manufacturers), so that you do not venture in blind in case you break the B=
MC
(and are lucky enough that the host still POSTs anyway, of course :))


> =E2=80=A2 If the image boots but networking, fan control, sensors, or oth=
er
> hardware functions do not work correctly, what is the recommended debuggi=
ng
> and recovery process?

That is too general and broad a question to answer, I am afraid. I guess you
collect the information, and with it, return to this mailing list? :)


> 6. Validation and safety
>=20
> =E2=80=A2 What validation checklist should be completed before enabling h=
ost power
> control or testing other GPIO outputs?

I had no such thing.


> =E2=80=A2 How should fan control and cooling failsafe behavior be validat=
ed before
> using the image on a live server?

I do not have such a thing yet, which is one of the things that keep me from
using my fork on one of the in-prod boards that I have ;)


> =E2=80=A2 What are the minimum hardware details that must be verified bef=
ore
> proceeding with physical-board testing?

As I said, focus on your ability to restore the vendor's firmware image. If
you have the ability to restore, all other concerns are less important.


> My current goal is to continue testing the image in QEMU, document the
> confirmed and unverified hardware mappings, and determine the correct
> procedure before flashing the physical board.

That sounds great if the QEMU-based workflow is already working for you!


> I would be grateful for any recommended documentation, reference
> schematics, OpenBMC porting guides, practical experience, or advice from
> engineers who have worked on similar BMC porting projects.
>=20
> Thank you for your time and guidance.

I did my best in answering you questions, documenting how I stumbled and tr=
ied
to get such a thing done. I hope you find some of the information shared
useful. I'd be happy to continue the conversation if you feel it's producti=
ve.

Best of luck on your OpenBMC adventure! :)

--=20
with best regards:
- Johannes Truschnigg ( johannes@truschnigg.info )

www:   https://johannes.truschnigg.info/

--TfyKeSftBTOeSZgo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGu9IhkI+7/aKLUWF95W3jMsYfLUFAmrbH1AACgkQ95W3jMsY
fLX10BAAoPvm/i2X+XZK4q0M4ni9AW2l+fPCy6hAvEzGqtVXX1JmoxL6S4iNEGCf
JxJYar8SUype59FNbGRWdhMYXK1wldNtewrZXvYHlsE37BZ9X7s6hYGBzqZfbdlu
NoYRIizn6iTSqdiEf/jOh8s9vXTTIz1zeCxtAwZh2Zbd10Sk69hiss25qmw1nf17
Qu+y0cRK+EouFOlegIxchCmH3eEgk+wJTzxAjefzI7jpK9L7we8yQtrP6bRxdfy0
lORlCapG7BPhlaNcfYiOfeGTn9h8COB6Gt5aFhzpFlB2dAJzdrzE+W3hIv2FhC5W
Hmp7WuF4UUD0xb8wcckuba+85DJPMm/QEQWquxUnl8GYhf2D0v5cb6CuMncn4dei
jwD0shpzaR2TaChBtxfyTMaLe7Mnhnoe9oUEiWuV28YpEG1ncPdVFfbJj/EwaKw5
1kV3kYJZ258ObpXcL2Md9mp72YuqaIZMBDa/8swSIgXeLif3Shyj8vpkQqkX4W4L
JtIQICfZWrdHTFxHhSYO+TarRABZEJtJr0Sn64mVPSJR9oKyIhqdRgziW56/S+tC
8ue58n3uc7LALPpVGcTlVm14KaI8zwZq5/ypj2GAeD3qJjBbTRSVlVK/5M/jEjal
GmL7I/1La5JD5TFpHoX2ZMWblPd/nICQolUAcKoHzt7QwZcNI7U=
=kgGF
-----END PGP SIGNATURE-----

--TfyKeSftBTOeSZgo--

