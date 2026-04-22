Return-Path: <openbmc+bounces-1853-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F5CFAD3E5
	for <openbmc@archiver.kernel.org>; Thu, 23 Apr 2026 01:22:13 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g1JGN1WNQz2yvS;
	Thu, 23 Apr 2026 11:21:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1329" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776872729;
	cv=pass; b=NYFMFcwXJ4EkpeA5rdzJ071j/sBm8XdKi3ZdHS6dBV6NGekJdJk5dkBwhUn0Ox1BZHLVeWTRjLHz2zzPU5Tx02kJ38zzSOwQ8gaU2+DADc2JbN6oxlpapHFdKnJWGYvO1gecmc8bJMU2pGZn4vBVhjx/mttGuIh8k7ObxtqgRJBGu6l+Yc5DMpXHGB/IKO4mVpKzUWOmskw+IYzcYCODvFvZ5sFlNOhhsqyUnImYV5m2ecJEiAOw8HnRzP04nGyP0lHPyNQDaeRLizGY9X5Nxji3tx+KxHzE6T8Ifq6o9qZ2Nncx1Xwk/sirM25w44P674cFpuT49FhKfik6JriYHw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776872729; c=relaxed/relaxed;
	bh=1zlJeYX0RqjLY1gVypIuRmYsPWAKGdsD686ryeEDKGw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=B63gYxpVPfoL/LzbTQYhruv+zDsuuW2WIzWBbE7nPtW8/buzwvhYuXVR6wxHpxZ6kYajU5oRQ2UhY1YlytFNh864WhP2LZ7GklR3DaKP18YOV6YHg0kqiLtboQf8lGfQWEQVvSx55a4B5ro7yeQQuZPtIbhuIs5jxgVfdsuBPCWJjsDVSOP7jJqiwNtzpWbkvSde+Dl4hcVi92+CjH4iFA55Ke3ZKCZ8KuCDBWwzNLj0z5fkLevYUtO/p434EuFK4qfmbYbnqg66X+iUsokesMCc38IVnEsuuoWYCYC/H7xxzH7lSXb8GQyiCwbyO8hfigVXTVahaupKoWJLcFUgXw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jry6NjhO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1329; helo=mail-dy1-x1329.google.com; envelope-from=nharikrishna6231@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jry6NjhO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1329; helo=mail-dy1-x1329.google.com; envelope-from=nharikrishna6231@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1329.google.com (mail-dy1-x1329.google.com [IPv6:2607:f8b0:4864:20::1329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g13TM4vKbz2xpg
	for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2026 01:45:26 +1000 (AEST)
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2d96243c91fso8386927eec.1
        for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2026 08:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776872724; cv=none;
        d=google.com; s=arc-20240605;
        b=E4k5ApcIAjHj1yGB0uUDnwV90bnZvjm5BvoZU+i92CUsJmZZNEyWZiumeVEbreFYko
         w8psp5E7xtd1z1t+lyUC8O6G6hb2NumIUXMeN+NG86B202+PNqNZs6eBnVAgz+b9Og17
         TweUBmAYscWLsmDBsy+tw+itntNQxzEpE+vEFKFZw8+1tuTR0Uelx1zYcymk2be+VdYS
         Yhx6Nvb1zx7LBebqteTKNuMwshsv2REi8JjK8dAJcHks5a+0aGELgjUnMk6wA5mNy2Tc
         6alk0PpGsmq4mzfmM3uAzAKnuBCwNzuAHJnh334m44/ok7oMK3CDT14+b3JtXZ5OEha7
         pUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1zlJeYX0RqjLY1gVypIuRmYsPWAKGdsD686ryeEDKGw=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=c7y0bfjbEapatEIo2hodfTT1djmGBQSDVq+uFBXt3NNdIycH3MclxQxW5Jt9AsMtuE
         8UR/1X1jepNEP5VdkX7YFeOgbTJEBBK1Nt8jQho8Nt0wP/KxPr6ugnKtItHrlNK3wlux
         zvWgV4g6cz7HfJn47s/H13jBS1NjQNQOXXj3iAv8ifwYQhWT0qZnW6keynzxX1knMx9y
         gchf4elxGp57R6HfjNbzG3wBVHH4N+B28n1batCVH7OlHs/eYRsYd+C8RCZdUuL0VCKg
         33PnAB6uVBZS3UuyQRQbF36uY7OQe9OxrKH6QkNKKXXixgWDwi16FqSSPsvcK4WUDhZ7
         3C8g==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776872724; x=1777477524; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1zlJeYX0RqjLY1gVypIuRmYsPWAKGdsD686ryeEDKGw=;
        b=Jry6NjhOmTm6oX3o0qNrCfushSO/3vp/3hPEIUmwRYWOXv0jPtnzL/rZ3rUfce03oY
         MEP6Rngb/POvMwU1lfYGe7YRaVhVu7Js61syUOf+gXUltXkdGQiCtBZf/gbhSshC8qwo
         Kqb9dkY6HgPOgibOsi1fU4tLGok3+HjGVP5hy1Q/7abBiVQW71PaFkd0biTphdUmyUVj
         bmhbL5J9n5qsVqeSYrH4vBUp/rgJMEU7fcDvzZkkIy0az7QJOeAqgAr2ZMJYhbubxHhH
         51n33jRlpV3iNkR8HcmUw6Sj/QAQl0zh2t59KkIQSDUOxEzztBHf6lBKcDnG32hTqrmW
         q/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776872724; x=1777477524;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zlJeYX0RqjLY1gVypIuRmYsPWAKGdsD686ryeEDKGw=;
        b=IISMpxwIvgATQLkAEn0AZ9HkaNJ1OAwPpnv+DlG9lSrzXsQpGk6zeTSEBwZu0mgWNx
         fNU8TIbP7JAh3nP2V4BlMoWtGbNwYB+VQOglPbNONY2Ie3P3SHeDhZTob7yPfcWsLGFU
         X3axsUPxxfKGVWCHUnIeWnALiqO/mBXghDesph/Ns8JwN1KcmMLrHFPiAvA3//7FpFIZ
         rFFOPiB/UaE5/et3YORhEe9TN+8+tou9zeY+MSMGgp1pjq+Ce0G9tGwLwxda4KiekmS7
         qQKKJufTW15+VDfMiLJs6jc3H1X9cUmW6Gqc7u/Kk6c3fli2KzChaAHngNwuNRXgfamB
         rjHA==
X-Gm-Message-State: AOJu0YyH5VFzoEVlD7p/c2VVesAsQ2DXo5N54txIJ6JBy1PFLiUSV+e0
	zoNzZiSbj7oh+JumdKMpT1ypkc/H3z3YO/TxjDSpqyyR2cKB3W2r33K2IsesnXYrxW1YjAJEAKk
	iYX1p/zBsrrRBeccKuo1eeFmshkDWbFoTV8Jb
X-Gm-Gg: AeBDiet6DlGoTksAKBklKNLop59kGqftkoFkFD754BMdyxMkklj58f8mqcWsCzVwuab
	u7cf9nM4JkpisLs846JeIS+qFp2EGZfIdj5dXC2iXWpj2Z+N43PuCSp0IEye9Op3VE9I1SlnKUb
	+Ley7lPMXP63ruU4p8VhwbfZeiBbV3hzt4QepsMzRJejYKFoBo46/kiw3i7Z0aH1XX7KagM7uDQ
	YUhZheRauG9SCgGmg1XEIpWhDeIqQv6idYuU4OgSjQx3qYuEPRsqO+tXOr9v8Cm/y5u9N6Cg8sB
	ZaPuHc8RrfuhPRZPch4d
X-Received: by 2002:a05:7300:6da7:b0:2d1:299f:521a with SMTP id
 5a478bee46e88-2e483d82ca9mr13866032eec.26.1776872723520; Wed, 22 Apr 2026
 08:45:23 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
From: nellore harikrishna <nharikrishna6231@gmail.com>
Date: Wed, 22 Apr 2026 21:15:09 +0530
X-Gm-Features: AQROBzDSXgqhbb5JZM_QlccYYkWb1HqukrlZVO7rMjgYcGHoGHaQicdyKJAv7qA
Message-ID: <CADizvqVWggyi_hsRuYMiE8B4L4x55jyfbP+QV5ZSdCUsPTeBxw@mail.gmail.com>
Subject: RE: Correction to CLA Submission
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000007f213006500e6b37"

--0000000000007f213006500e6b37
Content-Type: text/plain; charset="UTF-8"

Hi Team,

In my previous mail, I had shared my individual email ID in the attachments.

Please disregard those details, as I am no longer contributing as an
individual. I will be submitting an updated CLA with my current company
details and official email ID.

Thank you for your understanding.

Best regards,

Nellore Harikrishna

--0000000000007f213006500e6b37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-isSelectedEnd">Hi Team,</p><p class=3D"g=
mail-isSelectedEnd">In my previous mail, I had shared my individual email I=
D in the attachments.</p><p class=3D"gmail-isSelectedEnd">Please disregard =
those details, as I am no longer contributing as an individual. I will be s=
ubmitting an updated CLA with my current company details and official email=
 ID.</p><p class=3D"gmail-isSelectedEnd">Thank you for your understanding.<=
/p><p>Best regards,</p><p>Nellore Harikrishna</p></div>

--0000000000007f213006500e6b37--

