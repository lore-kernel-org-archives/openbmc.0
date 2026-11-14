Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79043606A31A
	for <openbmc@archiver.kernel.org>; Sun, 15 Nov 2026 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWEgLvA5
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jS77R0L7kz2xL1;
	Sun, 15 Nov 2026 21:50:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b136" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794680059;
	cv=pass; b=RP5SAf+7/y1cBrTgAVpovV1JxS6ku4082Xt2xGPjrPcGBLKOg/m9A/1oo3vLeh/7OHO9v79t79MeVhz5tyG+VyX6pdaZ7oB2I74Ww6tFnaMaOnQch0jEFUw6hTtuQ5xUIxefqX27Wx6VivKxQhQ2sy7oklkq3ZaLNrdlSt9H28VVK7F26s8zUQlAoS/KOR9z5x4kMq9C7i0qsBVAZi2dmUG5ReYN8hHaLELSX5IRIb5v6Uirj6kNzwFs5rL9rx91z1ivo0gi6vo1QB/tER2QDrzSIoHwzlsATuape3JIeOhPuj3ILKHTtL7as1etoDXjiIq3uwEDOrqiDZ34CJ5Izw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794680059; c=relaxed/relaxed;
	bh=090y8GKh0MotAj4aFHolyr7Z9JFJVvilZZ4D9FgDmDQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=gDS4eeWdMCIhv4zSPLDrAWbSyV1604Y0PoVpEUEARbuFQy84Y+rznp6L47RC4hPz+/XOhhE3sraLaDVdC+xGKs9m4PWT1J72DU9ksavzzkuZRYbVaYdtMWcup99QRIU5ONstmmoLcbYcnTTdvE/l0KpUTmcwlqkRmEoW4R2KTcX9VFpLyhyHVhBv295TN7khvnpyYKeDDjBIx5/iZFMfOlPoMqjm+JqTi95SaARQ3tD2hzh9LSAxrijwVRyMJhVSlTj34cWa4+ouqjIAoxui7spAx4LifSbbOhDMyfVRSvE+W776iF3BV+dw9+M5Q8bHjmkIb/Z5ovTaLQWRaEz5ag==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWEgLvA5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b136; helo=mail-yx1-xb136.google.com; envelope-from=prasanth.padarthi20@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWEgLvA5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b136; helo=mail-yx1-xb136.google.com; envelope-from=prasanth.padarthi20@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb136.google.com (mail-yx1-xb136.google.com [IPv6:2607:f8b0:4864:20::b136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jRj2206vMz3c55
	for <openbmc@lists.ozlabs.org>; Sun, 15 Nov 2026 05:14:17 +1100 (AEDT)
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-6798af41644so1514019d50.2
        for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2026 10:14:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794680055; cv=none;
        d=google.com; s=arc-20260327;
        b=VdwtJcSBzZvzh49GOxR8sQeQP0i69tH9EIjz65kzOm+etX4O5RsTXAystLxItriMJ+
         GfV+BB66v1CJPokyrPpAGMuR67vDILich/iTjhDuAETmClIdrHqLfUVr5fwMIFBIR9+Q
         yferhQ1BLQslfPDsBGijI6FoEQMdkFOJELVbF/KO77f1D4ugvSqVFCZ92s5zhsvmkVkP
         dzVmZYLIoJziXOyIJ2oQ5mdnLQK4viPjn+dgNI2XP8tF9BEDVsfIPLqiljYJ/6UQEYdE
         fZ9n13oQisrumbTwvX3nc5s0FDoxCySn41+sWB0bqRwAF0Hhyd06UhMfUYU74+Byb/Xf
         J4gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=090y8GKh0MotAj4aFHolyr7Z9JFJVvilZZ4D9FgDmDQ=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=EtvuexyEr1xlprtaLMW94Nu0yDBPq8sB5QbYufrwwVfBUf7B/RglQlDXuY3gb8VW3l
         j0f1BZWsDC3I+HqWw5dIl0dyJg4a3mw8teaz2+aRNQ7deiIoEhcWgFWMpt18HbfDY/qj
         +rifO0WMfgw+kVJILWCvuXIlqZ5dRt4d2+xsoCG6tJK82v0eG3SF6Rl5XrSzElVa1HvS
         /2vxsbEADZWNueZ4qArjXp2fgAnXIua3lKHDgZzNPwoHlNR5iI/SKamMt1N5s9bTSKvT
         Cc3lYUc0pP1r+W1FQlzq4p8wODJLzyqAuJTrb8nG8++GM4tNUtauXArcFgNSWGVflRGF
         Ch9w==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794680055; x=1795284855; darn=lists.ozlabs.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=090y8GKh0MotAj4aFHolyr7Z9JFJVvilZZ4D9FgDmDQ=;
        b=hWEgLvA58Tm+k/YeOf5WfX2awb0m7zm5Y5Mt0rpN7IITaAMrBzbkw7p95hGMz1yemC
         AKkagbDgRPr+Rk+9MIhFzFIiixkNsRU3dAXZUDd3vXF2eEXKQdtVd67FSD/O7Vbu5jxa
         IPtLiGj16fmIMVSBd4w9fWhycROt1n9i6cgv+2FenjGH+yLUqNGC492YptFhhGClGSfd
         ax/MHYxx5yh//G490Hj5FfTkS1C0p9ZrNTnaJcZUKwV+rP9g/x7gS2NyNPXragkM8Ivd
         6rBcQw62o7hD/bfIVqXt3gXrzmZ+WS6mQ1OcFeICAwHOnWldbv5rRKtPRL9ngyJMjJnY
         x8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680055; x=1795284855;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=090y8GKh0MotAj4aFHolyr7Z9JFJVvilZZ4D9FgDmDQ=;
        b=m6rKhyKEc4Y6fQJTesVKn8ue8Qet0LJYVwkrmjt1kPp4XXCDkbCxiYeNlKwdw9kmgo
         FUOBYT32b3jV0d6sVAGgvTmZeUfkZKF2vVf57zLxC3GO5eZJQPpKQ09vbvtSx6r4/PVi
         paCUq/rXGWGAo397f5e82aZTjgwBAMA8m8n6ob7sL/P0iFfto4OUeWXAGUlXTYm9XtDB
         xcPvqhj3OiVBZ1Zs+Kyxks2zJJr/U3U4P3lkz8CVE6ZFC3PoampzKfMKUi+M+IcqO/wH
         PhOABYuPidAU+lkdYXx910nVzefmo6uCLn3Qb46x33HoiF3lcfH/IyVTbzbBxdi0cNg0
         yebA==
X-Gm-Message-State: APuU4Z8aMyVFZE9OX5dLwqrKhxG4lu0Yw4VE5lrv/EPT+po0yaXVZPkE
	ajzbmWg7SdsTEBFJlMsZSoaw7S55p3uN9kn530WKm8lIPNkMSZAPfyYdHshI9KMfiCaJleqThJL
	nPxUQPRjfxfbXGbTB8dXLyKQhR2rybs7C0w==
X-Gm-Gg: AYBFou3jri2lUFuIEjBl0bbHJ9o5DKeeCrK/flWC8kQVU5iowSedH95TU/uPGzi6zKI
	yvucp4aOLgEgHOS58biJ9kE4fBJUQ4/EhjDyuLCWHKst2zwSiZzytDyxLQ2/qgoFCNvBkW+AWCT
	BytJeWE545NBWtoKPuW3/RYgLbEOMzFRWUK7H/ZCnOQTTDc5rX36dQRUBIPn6RKoKGDM9MbTkpi
	efkWBnYtYbv0JeomvdzykSEYbvcmIAUPAA7C0lg+vd7+OoWUIu8gjR0NjN/AlF6Bdk/AJmjJ9g2
	K7jRty2b/xLgvcK13nZmEh0Q6Wiy/DXv94nx+ur5qvBMpno/nU5Glr1fYOIdQH3NrNyMbkPhgeA
	zqE56hoAwLo9REL/I9rLN+EqFZd99TCYe+ERleeDvWpssu3pdLa/qP62Nlga50G3aS4Gcjw==
X-Received: by 2002:a05:690e:4281:20b0:67b:9953:2d97 with SMTP id
 956f58d0204a3-67d897c4ce6mr3051120d50.79.1794680054954; Sat, 14 Nov 2026
 10:14:14 -0800 (PST)
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
From: Prasanth Kumar Padarthi <prasanth.padarthi20@gmail.com>
Date: Sat, 14 Nov 2026 23:44:03 +0530
X-Gm-Features: AclHuK_C3B8cun1ZbpDAvGsJEq-urUBR2WnlYRONN2HtOxihv0g1dfVS7WH095U
Message-ID: <CAPv_rsq4Co7hCoSA5bQLiqSvyZnrGE6B6qzRbJdyHXCuBa6H0g@mail.gmail.com>
Subject: Request for remote presentation: OpenBMC bring-up on ASRock Rack B650D4U
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000293ed80660408371"
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000293ed80660408371
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I would like to present my experience independently porting OpenBMC to an
ASRock Rack B650D4U motherboard with an AST2600 BMC.

The proposed talk would cover:

- Discovering board hardware mappings from vendor firmware and UART logs.
- Preparing Linux and U-Boot device trees and booting a custom OpenBMC
image.
- Bringing up host power control and debugging the AST2600 GPIO passthrough
interaction.
- Current limitations, validation results, and upstreaming lessons.

Proposed title: =E2=80=9CBringing OpenBMC to an Off-the-Shelf Server Mother=
board:
Lessons from the ASRock Rack B650D4U=E2=80=9D

Would a 15=E2=80=9320-minute presentation, followed by questions, be suitab=
le for
an upcoming OpenBMC community meeting? I am based in India and would
participate remotely.

Please let me know the appropriate meeting, scheduling process, and whether
an outline or slides are needed beforehand. I can adjust the duration to
fit the agenda.

Thanks,
Prasanth

--000000000000293ed80660408371
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<br><br>I would like to present my experience =
independently porting OpenBMC to an ASRock Rack B650D4U motherboard with an=
 AST2600 BMC.<br><br>The proposed talk would cover:<br><br>- Discovering bo=
ard hardware mappings from vendor firmware and UART logs.<br>- Preparing Li=
nux and U-Boot device trees and booting a custom OpenBMC image.<br>- Bringi=
ng up host power control and debugging the AST2600 GPIO passthrough interac=
tion.<br>- Current limitations, validation results, and upstreaming lessons=
.<br><br>Proposed title: =E2=80=9CBringing OpenBMC to an Off-the-Shelf Serv=
er Motherboard: Lessons from the ASRock Rack B650D4U=E2=80=9D<br><br>Would =
a 15=E2=80=9320-minute presentation, followed by questions, be suitable for=
 an upcoming OpenBMC community meeting? I am based in India and would parti=
cipate remotely.<br><br>Please let me know the appropriate meeting, schedul=
ing process, and whether an outline or slides are needed beforehand. I can =
adjust the duration to fit the agenda.<br><br>Thanks,<br>Prasanth</div>

--000000000000293ed80660408371--

