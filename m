Return-Path: <openbmc+bounces-1674-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69C61094481
	for <openbmc@archiver.kernel.org>; Sat, 21 Mar 2026 22:24:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fdYrm3SzFz2ySV;
	Sun, 22 Mar 2026 09:24:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1234" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774131880;
	cv=pass; b=mx4ldugZjxianvHte41dc85MiL4mOhIccMiSuvZ5DycQgcNApducLsLgVH5gfp9aqJPwTySfqbyphHAgB9vSbJ0oB0feZ3IrZ1kb2QReYFs0SNC+8vYEHTjeH0zGi6KYXV8PHPTWC6U74m48BNMRw2K6uPsGEH7/gL51BlExRcUI7cNVeCcyLnjl7Bo3L0CBJTB4IKf8J8rNmSN/Bnk+09tnk7vxryG3k04dLb2g9ZJtW5VzgpazlmGFPQ+eHHfHHQDFZqF3wfCrkRGr+sMkgR3UW8FXKvXvfYiOzblqSY4wSmUQD55Q4xdRAOnz9h+Yvb80B8+W8H/JRH86YJGJ/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774131880; c=relaxed/relaxed;
	bh=j+S+gbJa72Pewocw7cmfT/esml/kQWzS0Ym6MmxT03Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2T1Fourg2DplgJbdbJGxYRPy+ChTGNjKWzWh4WoOyqkFCJM1T5A5/PWIbF9V4aHMP1ghSYPn7HXfuu6jFeSWSFEgc2r4ALmkbDbfLPTG1izpRAI8wv3qHrh/knKZvlClkdteTGZXtfdLjFwKJ4aoeSHuqmR1gPnyO3zh+ComIyISgWxcuqon/vwd2WpA/oTCB2OEmyQPueZBiwWfO5JSKigIXqX4UdNHCuk13nQJozm0fs0y5z1Hs9BFN07o6Br6VAuWaXanA7n+3qNMeZZmVofL6GFMynKkPOA/yNG5b0a8ZP+0RQLLT1sWyU0h2S592i1FjKdiBH/aQOZQNoX6Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JkFiwIRI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1234; helo=mail-dl1-x1234.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JkFiwIRI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1234; helo=mail-dl1-x1234.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x1234.google.com (mail-dl1-x1234.google.com [IPv6:2607:f8b0:4864:20::1234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fdYrl0QhRz2xlt
	for <openbmc@lists.ozlabs.org>; Sun, 22 Mar 2026 09:24:37 +1100 (AEDT)
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-12776bebe9fso2919525c88.1
        for <openbmc@lists.ozlabs.org>; Sat, 21 Mar 2026 15:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774131874; cv=none;
        d=google.com; s=arc-20240605;
        b=C4imaKFiO8GolfhIuYFgdk3aOdfekdR2RsiYwdUwyXSWwyhTsCFMlhjjlHuhQ0FZ3g
         o2pLaxLXgBQLh+NWqWPT8m4mJchqUKIpo0N3VglsMO1UMOWVqrlcpqNU0mn+QGlec7V6
         4f4CASMpHNpflU3V1SA+zrt0fJOhEY9IneuKX2xeWSQFPLPd8bB/mSqezpMbd4bY2tSu
         xcRdUYPkrY6Pktd/hFjBoecDGmXWJ0nmvK+t6G/VBxQMfiCcihm9HdaQL8EiqHYPSp43
         LLPvbq5VZ1PQzILd+wJsPXh54ojC+DpUkvgB1Ht5ujQTBVRYpIVlKo/YlSH+jNncD2kS
         IMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j+S+gbJa72Pewocw7cmfT/esml/kQWzS0Ym6MmxT03Y=;
        fh=NIH44XBxRZTcqNesJYmNJYO0HVxi8ckWWKStEdg6q2c=;
        b=f0TiADQnlvJOMl19fjsJ2063gKB86+DHmEb6VjyR72m9faoXbFj0FYValRaSdtFLEi
         ownZRqlla/gWir6HYH6wf+7UQlK07mJiiKz3coyPLt8JrfT0NOvZGzIJ3IA+97nrgi/d
         Xnky263GoRBdvjueaBYbAtWgPJgqR0zn3IyYJZ0lXjNNbcrRwD/sw5p9xouvCjLYV5jO
         p+2lZQlhDyHl3f0efho597Rlujo0rL88lqH9r5QhjXRjeUpzeQY7lMfZlc2MN4eMXB/r
         27WxqlkAFwJRQGD5yjy1ipdTu0/33Dqi33LBpwa9VaSoAlJo+yzkF9TnqD8hMSGIFLtW
         6W1Q==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774131874; x=1774736674; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j+S+gbJa72Pewocw7cmfT/esml/kQWzS0Ym6MmxT03Y=;
        b=JkFiwIRInUwdjKhEdAvy5QMamsSHWxQaqX9x8RKbRTJcpcMBdcWw0vz7UqxZ59qyFv
         491TZg81aKLNZvC0Py6c0ahirb2B/sstC9ltxS8ZQpybL2pxf43K2gDXmKzJeNhmY2Ug
         9tAiGsr/LdC0JOkXKIaPYQLEFFan91QwjhdPT3Hnm4qfuEKmO/OOmtBvHOu07ImZoiIQ
         jcO4cWJHf4JUp+du1LcLGEhNmAh+x4uoprE2tlmaYX2RFwKhoDF6cO+BDpXZ8UtcapDv
         BrQWeaEBsXVx2X40k/7oIItjE4DaGMf4vNTJloKc0VZ48TWTJsJ9IMiJdID8AYKHFGpo
         IYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774131874; x=1774736674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+S+gbJa72Pewocw7cmfT/esml/kQWzS0Ym6MmxT03Y=;
        b=AKlYU8H85Ft875IByqXf4N5kD8ngW51VKPoiCBO5qdxhV8brkhakqtTPbh8UCcisLt
         zd0faIFtPN+PoXFjdF8Jwh+yj/aDjLyouzuWRGk8o/3YLawu23M/kAhGerrDbynAgejt
         RzyXBHzJlwHWcpu8HsnJRgbPgQW3vwgqNNuQ6WZ256eJPfduyBq9MZ1EDxSMVwXPZOLS
         o4xIyOrXRZEJzCYfbJ7qrpfkdIczI5VObo5scNQPJHlX2t7CA097xTS0SLsmbIUxySXS
         VIlW9Y+euzFz9TZZ4/W4Oisb9vo5A/7GHqxlpkvncySFdDEYQqvnWBeHsf53S4O7xgl7
         xFOA==
X-Forwarded-Encrypted: i=1; AJvYcCW8VGxw6BcpJzItfta3q8Vbu7fE7tNXeWjdYrprZb9g7UwsImns7qfvDl4hqPH7FzmVufKfwpFq@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywqls/gnhOBGQVb+fa52gvKXbxrGqpn8+aZXTuNjJv+3Yd7fDva
	86j76ncdwpPUiYGabcCaKit4loe3T4HfSZHY37v1UloFWEJfVmUHw5qT483ufOnlZVlCH18H+58
	/s5rZ6rvaaYaIbLKYpICxkoVyOHiHTwxerWWR
X-Gm-Gg: ATEYQzycS1Dy8AUdBpJ8/PTeZ7QFY5qPx5FZMsMAMj8xI6DJi0djHhjcFhhxRpIUiKm
	yR58/YvV9Hj2YBD5ItzwWevH9VWLGxoJO05HoySJunbqJ3iVHLJYWOZqXEtEI4T3qlxIyi44LJm
	8jTIRjl49wg2fbaXM5gdJ64u66S2pEAXii01TpfShSQGnnKgjHiPLUnuBQZUDBqiArxeiAwb885
	L/yGI2aJflAB4qjqa/lCpjqqOpDV51G+AfuRQF3XXTdSwJBAX8YHiKDUn1y727AJqpr8f51o/uH
	LKhbPkzokCMWL3W0MIJcPzKW58pfmhE=
X-Received: by 2002:a05:7022:f112:b0:127:9d23:ad43 with SMTP id
 a92af1059eb24-12a726476b1mr3704573c88.1.1774131874207; Sat, 21 Mar 2026
 15:24:34 -0700 (PDT)
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
References: <20260228-asus-kommando-v1-1-9a288620096d@gmail.com>
 <0f0a1a6862a8b94bf4f5c00da85bad4efce7c071.camel@codeconstruct.com.au> <CAJ13v3R-3p5mV0b3AqHyF8m4A=HnX4rrNoKQXYi69Mod=OsEmQ@mail.gmail.com>
In-Reply-To: <CAJ13v3R-3p5mV0b3AqHyF8m4A=HnX4rrNoKQXYi69Mod=OsEmQ@mail.gmail.com>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Sat, 21 Mar 2026 17:24:22 -0500
X-Gm-Features: AaiRm51bmDNR2PY9RIOKGhGaGfyNxiVQI0732iPSSqWV5t_mfid-YiPMHsQmBFg
Message-ID: <CAJ13v3RhazyeTJZKnh7SOK2O51F2-jW7SYSbs4ro70pdvfKncg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add dts for ASUS Kommando IPMI card
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Helo Andrew,

After doing some more reading and experimentation, I think I might
have a clearer understanding of how things work.

Andrew Lunn's suggestion in the patch series from Aspeed was to patch
u-boot to not insert clock delays anymore. And then use rgmii-id as
the phy mode in u-boot and linux for all new device trees.

I tested this by setting the mac2 clk delays to 0 in the u-boot device
tree like this

&scu {
    mac2-clk-delay = <0 0
              0 0
              0 0>;
};

Setting the phy-mode to rgmii-id now gives us working networking in
u-boot and linux.

So how do you suggest we proceed here?
1. Add this DT to u-boot now, set phy mode to rgmii-id and set
mac2-clk-delay values to 0. Networking will work in u-boot and linux.
Update the DT to remove the clk delay values once Aspeed updates
u-boot
2. Add this DT to u-boot now. set phy mode to rgmii-id. This means
networking won't work in u-boot, but it works once you're in linux
3. Add this DT to u-boot now without networking. Add networking later
when Aspeed updates u-boot based on the discussion in that thread.
3. Wait for aspeed to update u-boot, then add this DT to u-boot.

In any of these cases, we can also now add networking to the linux DT
for this card (it's missing currently) with phy-mode set to rgmii-id.
No need to wait for Aspeed to update the linux driver (or I think
they're not gonna make any updates at all if it's just u-boot that
needs fixing).

Let me know what you think (or if I've gotten any info incorrect here).

Regards
Anirudh Srinivasan

