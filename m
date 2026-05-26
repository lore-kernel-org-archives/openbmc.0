Return-Path: <openbmc+bounces-1997-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4620BCD5BC9
	for <openbmc@archiver.kernel.org>; Tue, 26 May 2026 02:06:22 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gPbhT0Sgpz2yQn;
	Tue, 26 May 2026 12:06:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::122f" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779761176;
	cv=pass; b=kIct1dnImNaicEwqg2cqRjlOjd4aJcQ0AjKukGkJLbLrsSNvjgH9THxJBaEsq3UTgt0mPz4tW7SqOzFxHzd5nuB0NXxc8AGGgnlTrCC4hwXx9y8dAWGJm5JL2MBx7b/zPLENn8oZLVRssQcJvhedjUTmGJ6E1c7e3GOCWPD1us5NzEku+4+ZTaYefbymjWJGq38wLIx9EE2LUdF4wLzzg2IFlh0//7jY8P4SOR9SemsGiOukvG1l2IdaOYU2dWFNICMbRvnrb1jCjfNnZgWMZ7XeNU2rpC69o0y231QEQA7Df1DKGS7AFTX3V7g4UM7tGyAg0DfSpUDyzEz3Uqww7g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779761176; c=relaxed/relaxed;
	bh=nxPLmMq2NA3K2uuQNwx4vNIloK1rOsqN3huay3y7tGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VyRxK+TbdaTYgGzQmcPbzjBYVYfy3MCUG7PSYIm94D4REzzcrQjTu0/4pGJTQQpH1Pz1n49Y9RKV/JC6+ehhXo8LKSqIv64DraN4VZCtNcwit4CK6dHpK6fA3orJI+5HtkkaDRx66cgcYOMdqb5+AEur8jKZY3T6G2ApVTgGN1G/F+P9/qe5kONeyaJ9pvTlsy435MVtdGnPQgVk4zGlJmDYpqlsZXDJsA3hdllyZDN/QOHJtryisLMyOkptZpkfcboiE+wMCxP0zrzHE6dZVoMUQmVrPhoIOakj0L7QgoAv/2gDR6L+MvIhSH4LiheNGSL0XlCsagcmmLlh9yFauA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CJCPDGQ6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::122f; helo=mail-dl1-x122f.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CJCPDGQ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::122f; helo=mail-dl1-x122f.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x122f.google.com (mail-dl1-x122f.google.com [IPv6:2607:f8b0:4864:20::122f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gPbhS0RZRz2xPb
	for <openbmc@lists.ozlabs.org>; Tue, 26 May 2026 12:06:15 +1000 (AEST)
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1329fc4bf77so8420180c88.1
        for <openbmc@lists.ozlabs.org>; Mon, 25 May 2026 19:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779761173; cv=none;
        d=google.com; s=arc-20240605;
        b=ROpGKUyZ7P/8CnL/mS9qqxwfGgGMUqNuB7ryIMw7VsUXKvyOR89PKCdaMOh2uO+Hjh
         cg62y/ZEKtLbyrINmZU0oA/pp7wyuuhaQMWj3DhV02lovnTMD1JMiVOQFSA2cibNsGwf
         8v+UUUIP8IY7et1G87VBKtGaNoSawnk8jH+MuzJr8SJKT28Hp8BY+RhjmSlHyT11Fg8O
         mA3oSXfE2F+NwoGx93o7p/R5z932tWqmulagYGTW+AXU31kD3DtMOGkONfN3lVfjFUKF
         L7kb3QLEmZBzcWwEB9rJAJw8N6a1ZZjL/F3B5rEw7uyTL0CEhYPbJp2HBINZu5LZx/fk
         AE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nxPLmMq2NA3K2uuQNwx4vNIloK1rOsqN3huay3y7tGQ=;
        fh=jV/QTC5qKEZ+lA5tMVTh/THBpgWdnsRO/uogSylWi08=;
        b=KwJDyQp1MuW8QK2ionxvUB8eWNKOnQRa5KvUJg8YTASVX3F+mOK/uk3ZoNIfLt6T2f
         oyvzoK3GE/89mTRBHX/AX8BARuGfDgurZuCwivZz6Kv7GGwbIMiuot/xNrkaOkUBSE/N
         YensdJWCyig0H5sE7X+9ekqHQzy7zRrm+QhYVIlOp+MsixwjYmquVrrf1+uEqXRQbaMM
         vifr1urmMGYHY7B9KFti9wpDpkvemQR3zPjRFtgglEpI5Ai2KQoZAlwWWCfZK7RXX8qY
         wJtQaH545EkanqrZ665NvHnY1tt26VbfR4/7biNFcXDaB+qI6tfsPUa0rTG4+RjMXNes
         GZJw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779761173; x=1780365973; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxPLmMq2NA3K2uuQNwx4vNIloK1rOsqN3huay3y7tGQ=;
        b=CJCPDGQ64VMiNS6g3falZFpryTaB9ut7IzuJyQtCNyBtLxT+UVwYOnUwVZ96jrlz7q
         cphBqHp25ZQDqcv7jULtFJtQUu74X3AJkNmY7nqmyuNVHxBUY+HrJMgf0261bJhXKAgX
         P1/cpffoGd/SH1h8bzdHl1LhdJHk1815vF3e+qCjItXGlNlp5dd950SbuG9nb0LDk0Oe
         L4+7Det7HJXAKuPoESd2T/BWrcPDgtAG+oNDx/vdLkwzePl4KmmAwiwBhMOXxJTT+5lN
         4lCjnOMUpL1BVdJXpKuyO4r9K2cE0CJTKoWE16zOMv3Kg6LzefOec6PwzHyj+DEft1/R
         swsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779761173; x=1780365973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nxPLmMq2NA3K2uuQNwx4vNIloK1rOsqN3huay3y7tGQ=;
        b=o7Odbimeu8kpvQ3njeWX23g0IYszXhg/xyvViM2zQYHbfVieaoxVMsKlT1YUQ1ppaW
         Jo1IZLl0Au8W25nH3yzfyFvYBPXegNOgkbqrgVvPvhnTP1Bpkqv/ifpHHJ2JliLjjSy1
         3b0DHUvB9E6fNCkTtSACPQhkGdOPJZrRQkyTpKjyO4fZl4CAcUabXCVb13un4jG0BiXK
         3QSAkhpYXCToBaSQk/jVnMOSrwVnrjIlttffY7oP8420JVWLXI62QjNAkMixnGqi/M0H
         EF4/ogmRYbFdmU+nQu9GKPZBW3MGn8gjpjqQyL9/am24dry8EFF/q+1nNyFRqknWQDxG
         KZ5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/950SPI+n9yHomW9wKR7yZZQGA70wIP4XHFm/9b7O/0QcOCZw/oZ23xlwW/ruW9HCL3eMSKHso@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwfVwotBVs7DfT45HgtAQlRTiVQU+bI7sfj7SG6tQNbQlIR3Q32
	gtNKZCiQPbLKzJDrgiHzQMhSbhezb4Qto8oIbYSB+gz4tR3FtFgf7hPNhmusJgd1hTa29Bwf7ex
	M9ouDzPgyzl3pL/p3zqJKgn0oHAtOm3w=
X-Gm-Gg: Acq92OF4AE5m78+9tXBK7FS9HvQRFVsHIIrCOuqztQWuYVkGZxCDWvy+Aoc+OlU0lv3
	AauZlkGwVeZRNt6MaY6chxAVqPFYyaXsgDj9QG6jQ1jZa8eIA44acHbk45XilyY7AQJtCpaR0UJ
	lgjOm8KsRd1iRsnA+SwcH0AqKc29CCOxon1qgPeNPtHUi3Dv6ozspdFFOwgofqrY+EGF4eY1/0r
	/o+Xat7qxgxL7Y/xmSQP3YfI5jcQMMObw6/1VbAqioiv9mGll3HLl7wym7Ia6Vh6U+yUeQ9jyh7
	Ra8EO1JSYfRmMU4SiFUerzkgoPnyt8JKrREBX19uhkmwXiNgchAwr06hF968Ow==
X-Received: by 2002:a05:7022:f685:b0:136:4a60:43ce with SMTP id
 a92af1059eb24-1365f8209admr6563368c88.11.1779761173042; Mon, 25 May 2026
 19:06:13 -0700 (PDT)
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
References: <20260328-asus-kommando-v2-1-2a656f8cd314@gmail.com>
 <943cfc3799373dffe67d5624af5fe10432150857.camel@codeconstruct.com.au>
 <CAJ13v3QJ-sDBp_sUJ8ywk0QD7eADSq55SyGposb1_F=dmQQHOQ@mail.gmail.com> <a7d364d72bbfa4ed3d41e9f7282f8e87a783cf48.camel@codeconstruct.com.au>
In-Reply-To: <a7d364d72bbfa4ed3d41e9f7282f8e87a783cf48.camel@codeconstruct.com.au>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Mon, 25 May 2026 21:06:01 -0500
X-Gm-Features: AVHnY4LphYm5O2myoEZE7XGbfmIKyhrANl39E5J-zJyYDqNpfLn9rrN-HncI684
Message-ID: <CAJ13v3QewF4YodTyXAN3aLA2xd=QR9y=E0Uj78tC6zz30fdNGA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2] ARM: dts: aspeed: Add dts for ASUS Kommando
 IPMI card
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Ender Hsieh <andhsieh@nvidia.com>, Marc Olberding <molberding@nvidia.com>, 
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, joel@jms.id.au, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon, May 18, 2026 at 8:40=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Perhaps we could add the mac.-clk-delay properties with the default
> values currently used by the driver to the SCU devicetree node for
> those boards. From there, we can rework clk_ast2600 so that the default
> value is no delay from the SCU, and we rely on the devicetrees to
> specify what delay, if any, is required, where necessary.

I've sent a v3 that tries to do this. Let's see if this solution works
for everyone.

>
> From there, no new u-boot ast2600 devicetrees should require the mac.-
> clk-delay properties, and on the MAC nodes we can set `phy-mode =3D
> "rgmii-id";` as appropriate.
>
> I've added Marc to the thread for the MSX4 side of things.
>
> >
> > I looked through Ender's efforts and it seems surprising that it works
> > for their board. Maybe the board design is different in some manner
> > there?
>
> Yes, that is surprising. I've added Ender to this thread.

Hopefully we can test this on the nvidia board too.

>
> Andrew


--=20
Regards
Anirudh Srinivasan

