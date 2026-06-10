Return-Path: <openbmc+bounces-2081-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E776CD8CB2
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 16:46:49 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gbBWQ4g64z3bpG;
	Thu, 11 Jun 2026 02:46:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::536" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781110002;
	cv=pass; b=gcXp/OvWaYO0QFiIj7l9E4N7/WD7h4maNBzFIervuxU6miIyFJG2cGc7RzDJs3RAm9R6WJ6+iyDLZZagJ8GydSe5aANCNdn4ozTjg6yom9iLZrwL05EifA+kXKn/bakj1KFaPsFvnpKu1m5SKkSXfu/gKZ6nUJ5i0vZigGTNHzPpN8LLV9fVz44dBOiVhmpscCPo0M8fJdyEsInR+sPjDv18GPdnF00Kcmm/9+YPodF/hTZhCSUx0cehKTEpCuBBWsMbLJI4XmHCX8X5DEIye9EWOP8AEYBZ5rZhW6c8zmhigi9I01VJi6qd8weSu8u5rOeE/3m8qpuS9Jqr33mxiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781110002; c=relaxed/relaxed;
	bh=s62YavCeclcS5soGJlMm76DLEOFR6pcgmAuoSKxLqnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOGoSthWoP1BSvm8afvV6VfgNNvRqQ49NkhwZnsMYHuczBrvG8m2oGQ4fO3XXk+7Di/I1pzQ7qVQQbiqm3d3MLb1xRdL8KdpUmD0wVljYf20cOlfNkzU9SrtSPZPov2rS4eo0qqtAehonxpOW6vWtaXEZJk9uoFDpiqQbRyj8X04fmQ2pJuDA6lIPdcqid3mNP8cD5stMuxRW3KLDA454xAa7+aGE2sugKloxK8L/0waSs5EhUqVcQ6P0Eedh0X/M/MMtmhp3RVxaUIdM+rqFUSHSooleiE9nt1FpNfSViWOYzreaQX5DTyX3dKtV4UZH9PndmjKZ4A982MXmHglfA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net; dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20251104.gappssmtp.com header.i=@tanous-net.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=g9rtlq9H; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org) smtp.mailfrom=tanous.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20251104.gappssmtp.com header.i=@tanous-net.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=g9rtlq9H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gbBWN4jwCz2ysW
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2026 02:46:39 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c85893bce34so2812647a12.1
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 09:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781109997; cv=none;
        d=google.com; s=arc-20240605;
        b=B0sB3dkByr9XaV09eBR1IyA5tByf6c3tr/spnfGUpz0lrctXdgpf8I2QDAcp/shYKk
         rPd91S5HPHD5idq4r3PALmhyvWdDOMp+MztjCok78OvN7ijntRKd5QU3tFevwzhlggrR
         xzsZLMrBa9jgW4xniRq7TimkcuwGRRXfZBmp2acfMMVr0D8tAWwvG3JVW8Q+2Pcylsha
         kS+Ck8RSTrMSwmvEAG+9d55ZyyK9sh4c9vAc85EZzb0R5n/FduIWPu0yH68aYMzKMYBu
         JhyQ9Is/kUUtzcfNmnaX/PGCRAGzAUUWyG4WizOLtYgfwv80u/bwJIlFYIMdH5IBTA46
         YuNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s62YavCeclcS5soGJlMm76DLEOFR6pcgmAuoSKxLqnQ=;
        fh=un1d289b64oRdr7aYcBXiIe2wZnDdmPCG6oyK0Zp4v4=;
        b=ca6qlRXDFwTSSK3fPeV9LZT1K9jgHdLrQK0s5/S5pKV85E2cu6Ulu6jQgdGSOnkiDk
         +bfceLIt4vNXLhfFZAuc8mBe5aeRVgKA628GZ6wLqBj7sKY+U/cxkn9lKXSNitml8seR
         WgNTBsb2noI3otjH8dSccgC6ATUN7C3J5LDg5ojxF06UQURPVOe1XdLYE2YNsQukPD4f
         AwiNnu+yHIvtV6FWq1DQKA5KpkGWJx1kQKltWGC/aE6ehMFm8m1AG41LjY1W+bu9KbCF
         j5bn/QgwYdVUZsPbhHRtI7xYfYxCtKLsIGznhLwJ3E8tNOvgIbrvSrsDl65yZ5CuNjxj
         0tpA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20251104.gappssmtp.com; s=20251104; t=1781109997; x=1781714797; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s62YavCeclcS5soGJlMm76DLEOFR6pcgmAuoSKxLqnQ=;
        b=g9rtlq9HN1EZmP0Q9E6oAizBx5rOkDB2qfT6BxaWhZq5PVE4UP9XRDiqJwFURZKKXp
         TLHjbtiD1AFwZmy25IR1g0jaGqxqy+NQ7cApggjJlRO98/AnbpKTiKq400PunasfUdt6
         cf/4tCO71e19nQkIMmVqVmlWd0/VRle8hAwpKxQ2WI6wN5c88lh08EXDGKMCDhVX4DGg
         Z+ghKaPlkDwiCfl9Ye0raZwQcNM3VT1rKXGxzRMqMKBKWCXpqJxfXa9IZJwZU0SU7aEd
         h9RjOeeFu62zZrRcihcPMVkvsI82SaSZ0xlMtH5g+yPrTAu4ll9XXCSaOK20t+KJenCV
         Pd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781109997; x=1781714797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s62YavCeclcS5soGJlMm76DLEOFR6pcgmAuoSKxLqnQ=;
        b=iLuShvdE/F35rj3lZt5IiL2cY2o+wIF2ttgUaJwJYbOPk0T3VwLeK+9Rl+kAwq84Xb
         aTqBUgcq8nppqiJIdWZdxZn8r4JldKnp4laLiUpfQYOwu6Jmt3fVOCjjq1Q/8lypdJ7V
         C8USHHpLRrcZLI7113snLh3kEVS123oM+6CtR+kHapcPVZEmL6dthUVFb53Lo81uBcY8
         TsBjuTP0dSGUB/1IBmEMVVOaJNR6S9c4CTYNRnX7028aPAoRFAicj8m5Seq2fzK67FNS
         5kMmORT2ytLImOXrVn08a6x9gFx3I12ooGgTIqbz4FDtA/mit90zNho/Wt1gf12Gr/io
         /ofA==
X-Gm-Message-State: AOJu0YzG2K9Qg6AuPNnY6Ys3PEQLg3gjcnMFx2WTEUCVIp5XGmb60GR4
	QLRsKaB1MDUvCZMNCy/14wz0Butz7XH6rLvUv2Fht6kbTDHbWT8QDC8OnSuk+2YrTqWHGnvOAFG
	2l6QRSw2kAlVdAWzKjVunqG+I5yqWZ8D72j98T61ZGw==
X-Gm-Gg: Acq92OH9l5f788jm0swjQWBerjwx4E0/vLVNwzUEPYAORkqF8z9ESQ17+FdXE14iesI
	XS3W03mqTJOpvPf9XueBgn6HZZvhMoT+VIe2r1n4B31aNPsy5lhW6D21SHg3zktNepsrI9r3HRT
	nKWnbFcENJkzTETOl63jfTJu5tFNZ/ATAChl8v9+E3JD/SavKHX9VKhW+K1fTg1pKVDDpMjqmEH
	QslRBHkyvho4xq+WsqLDBpFVerKRH0SVERJ/NqLW19ygNnkQPfharbN/UeLS4yf3sIOmnZ+ajwA
	o+KlVMCjoeELvzI3q1dMeUX56bwJXMfOtp9tdb8W1jdtS4Fe2A==
X-Received: by 2002:a05:6a21:6113:b0:3b3:65c4:c680 with SMTP id
 adf61e73a8af0-3b4ccf7f2b8mr34244453637.25.1781109997586; Wed, 10 Jun 2026
 09:46:37 -0700 (PDT)
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
References: <CAGwee5_2x89EVnnkXpV3_NXNAPqqjOx1sknC7aegU5Zui+bjVA@mail.gmail.com>
In-Reply-To: <CAGwee5_2x89EVnnkXpV3_NXNAPqqjOx1sknC7aegU5Zui+bjVA@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 10 Jun 2026 09:46:26 -0700
X-Gm-Features: AVVi8Cc1tJlS0YYsQF4RhpLjq4p_kSsrIIMowaehCeHRfdTiOnM-t1N2gHqeDGA
Message-ID: <CACWQX83a-0x+TWsv6XFjwh_qovJew_jJenSOEhgSskncjFgLEg@mail.gmail.com>
Subject: Re: Proposal: Utilizing Container Registry for Shared BitBake Sstate-Cache
To: Yash Patel <yash.pateltx@gmail.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 7:16=E2=80=AFAM Yash Patel <yash.pateltx@gmail.com> =
wrote:
>
> Hello Team,

Welcome!

>
>It will also allow openbmc developers to
> be able to quickly spin up a container and do bitbakes quickly for a
> target machine with the sstate already pre-loaded.
>

I'm not an expert in our CI process, but anything that improves the
cache hit rate and reduces the amount of code we repeatedly build
seems like a welcome improvement.

I'm looking forward to seeing what you do here.

