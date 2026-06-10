Return-Path: <openbmc+bounces-2071-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F9ACD8CB9
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 12:07:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gb4Js5xqmz2ykX;
	Wed, 10 Jun 2026 22:07:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b12f" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781093229;
	cv=pass; b=DpwPe57RjgGhVfEa27u5xPeA/WykPB/ocT4UZ3Dmo5NEvIqKZyvHT4fGNou2KvBHjIswVwaIeq3tkXSkSF9R1FLxe8DbDaNMIawZU5bupzigWMTgEdrZkwUR/frxwV6cuZDHfkSUMummcDduSxfx2WkJarIHLi7Ks2izexndTOhc8Iy8/pcRxdbC/bVdLHMHbCgoKEV4hyhx46kpA2WmlQUY3eMIAdj7ruur5jWv9EASmaGKVGBacVhiQUDc+mANNn4IfkgFs4b5T1qVp8Ko3IF1Kjlrz1PZoJDVkUTYAoWL17Ya8LmLzyiP0IF6LxQr8rwRnUGG9GXhYg01tQGW7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781093229; c=relaxed/relaxed;
	bh=rPBVbarQJunKddhuJZ36mYpeExA3zm9sIRg7kXIiufE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I/JZNqXL2HkydH/gbLaYH4nTPEJKybhm6/FGoSlOaHLtTDoJGPa40Nhv2SgZ0vrsu8P24QpQcgLS+Tk71J+U7qUPIuScR4UJ1n9ZPTcsgKvQBP3PR10fq39fLbNz2DQUl8IgSh7weLHvuYBOHDa93Mzf3SD9DIhePkenZ6BqEjKpZtkW4qM9do3h1u7KHS4a77AeS1+WB7h8IkP2NkwbkJ2gqrJLYy5MKZ3GNRvnHu8Y/6JGK8X8i2UTqSGJWC7Md0TRKL02A0qCtadMsc5K2x1esvGuYpwiALX74CiI19Gx8VkT2ULli4W/WBrjm8dboMLlb25Urr2iowv7zEclug==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QjiOC/3r; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b12f; helo=mail-yx1-xb12f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QjiOC/3r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b12f; helo=mail-yx1-xb12f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb12f.google.com (mail-yx1-xb12f.google.com [IPv6:2607:f8b0:4864:20::b12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gb4Jr5Mznz2xYg
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 22:07:08 +1000 (AEST)
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-66049669d78so5937211d50.0
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 05:07:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781093226; cv=none;
        d=google.com; s=arc-20240605;
        b=lKe+UImXfGyCHNOXNrerL1DMaypzXDBFzA0nl6Y1dD9zvnRLFnKMG6aSDGZqHOLeZ/
         JpYpBxO+yBUxeNWTb/tDNbdU5suS0qOG4qKTA7B9mhQkMb/krFtxdH2yp0mp/J8bCis5
         HzumKIabwEc6PTPI+OJB5hGLTmPs5UPj54ywumOPPHi2c1mHWZy4YYeLnEbscPx4PLNI
         r1ua3saXonXOIft6qFTyn5wWwlH+PuJ4Hqhzu0GqFhVuzgR8IYsEiEYpVGoQfXaHm1EU
         1PZcVVFvL27ri4NuLJmP2EJQ8dfe4R2WPNLcmEXFNqgGGIF9C8O6NsZ0mhZpcwFC74v7
         hPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rPBVbarQJunKddhuJZ36mYpeExA3zm9sIRg7kXIiufE=;
        fh=tzavHRZv4HNEBiWvTNjfvlLrdAYuFAlifnQ68kQbqKg=;
        b=DtxzryOfRNniWwkhykmrCyS6vhBWe/eoRymHHk1zjVdWOz26YRm30FIaFITyutls7L
         RIc+zes1Ua5+YAvK7dBF4si/WgrY8m5KW/DuzJCJqnhbaob5KNcQp51uzlo+BoMJMS6z
         Mtm1G0C00yFEA4+etJp89bJKH3e6xBXlYYSOeGWZMxTHIhCF9LkVMhQHeCkfwcRDLJKk
         V8sUO+Q/YL0NlksPu534wnVZf/6F+QS1JQOYShEzE2Bm4mzmjEBcUq7Y4j5ILzLhV1eB
         XFlDWgAs5vucIL8M05P7jC5wM5QObfO6S50lyH4WSn8TFjI0hUZPmIguTLYuQ7FRoaP+
         8SBg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093226; x=1781698026; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rPBVbarQJunKddhuJZ36mYpeExA3zm9sIRg7kXIiufE=;
        b=QjiOC/3rRBOlDzxiW6kZiJQmbnqvLJX0qZAnl97KnqEx7Jer2x4tFhB0TJukVTIt0k
         pmTHV7X+8/9gzs8JfMLakCc0a0uJHfRIOj0ZA07t3zYbR8j3+/0z8U1S5QYSm6JrCJoO
         93Xr+R7Kfsvh5Wf3rEx8vKKejaPzgYI7EQizTbmcTCA0iNMp4ZJxEy5hrweuYeRkW5UX
         MANRD3DuUqy9RS2qygWy/ftHNLaGxiyEjND+HcpLiFNhqaUN3QZNTamxmhBy9YoNmuPT
         zl3Fp7xyqe6qhIOrPkJw/YpiUSCrA+z+YzwNvZE2Spf/eqkuo9HOMIfVXZxxBMcClALk
         BT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093226; x=1781698026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPBVbarQJunKddhuJZ36mYpeExA3zm9sIRg7kXIiufE=;
        b=HvjQa2EJE/fO6MHo4YXx6/s3CPeCdKYjYAPp2cbKqw7Ljvj8nyt7E9CWBDtwZ6B1Aa
         9R3cl2sAZ3LKYeibFCxwGWoCfP7bmcxJ/Abj6FJgNP+FJ8nmwkA37HGcSvz8YYMZNSPu
         KKoUGW99oVk1UE4Il07C3rOmDomK3XwDqV/oix24DvWAtRb2cUpEgFtdwdyZzy21JgXg
         qpXRedqpW9oeaHNi0JU9oXf4nqFIfxbvhZLtiF4AzQgmrHLcl3QUK1W8p1BjWy+3UbBq
         y7uZhYZWchcQ547rd/0Qaeed9QPiKbmlmSTDjORa7YVolfq0CYYZKf/R/leOVgRVQ7dJ
         DJ9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9RSa24J1ltvyF6xPyarKqtDJuUZ2A4gxKwHTuAOklST4F0XHON+AVOhlZ3ZSwpGhUvCgLReymA@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwjuM3mhJ7D7z2cNE4hmcOhvSU/uh9gOtocg24HSn+l8rmYXcx9
	fLwAJKM87+z4QbexV5BPnW/Kl02lnJCgl0G0B5fr103OO204VeP0C05Gcapx8g2eRf/YFnAkINv
	jmu2diN+1QXRH5+4Zn/NL8eFNvjsMH2U=
X-Gm-Gg: Acq92OEOFl2tpM+5KK6Ni/6FVEO/LKqY7V6wNfHrJcJQTzgBOJcSpd9gzNcwrO+wn3H
	Akbrp0V0nEU1kn+xSDNsbvGyYBuvqnSwP7RXELXjtJ03XRkQhJtuaTaWjEStBQtYEr960uYbao0
	vttEDqMuDMMKCU8rPBmmlb8/mrD5yknd6c0H9fguSJETu6zOf4FaG5yFDzsginsWt7AuZ239Ufn
	c4N07VpEeZyV/o3GJ3TaI+udvUFhUayf15A4mwBt0kPYkDUSng34nSFH4VxW7gGIjSUMuy1+C1q
	QJscrZa/VvRF1bV+hfNH
X-Received: by 2002:a05:690e:134d:b0:660:433f:b0e6 with SMTP id
 956f58d0204a3-66108356dc3mr21625926d50.26.1781093226210; Wed, 10 Jun 2026
 05:07:06 -0700 (PDT)
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
References: <20260609163919.3321228-1-tmaimon77@gmail.com> <20260609163919.3321228-3-tmaimon77@gmail.com>
 <ff53862950a6075c43bb8f1e47c14389d6fc7575.camel@codeconstruct.com.au>
 <CAP6Zq1gBcSEQznnQ+awrqacBXjTOWELQsMLDXL1yw8_daCzMOQ@mail.gmail.com> <8a059e3a4a3338bc03829071a720012bd426bf6d.camel@codeconstruct.com.au>
In-Reply-To: <8a059e3a4a3338bc03829071a720012bd426bf6d.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 10 Jun 2026 15:06:54 +0300
X-Gm-Features: AVVi8CcbfduWf3TegsXkab0KWg7M5FV7yhmspd3KQakMOXk24-UcA1-8_To79Tw
Message-ID: <CAP6Zq1ic6nvk4JFTf1Re1ySqsYmWdP0ZcGOuUWccS0mfY31Mtg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com
Content-Type: text/plain; charset="UTF-8"

will send V5 soon with message modification

On Wed, 10 Jun 2026 at 14:58, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Wed, 2026-06-10 at 14:56 +0300, Tomer Maimon wrote:
> > On Wed, 10 Jun 2026 at 13:49, Andrew Jeffery
> > <andrew@codeconstruct.com.au> wrote:
> > >
> > > On Tue, 2026-06-09 at 19:39 +0300, Tomer Maimon wrote:
> > > > The NPCM7xx FIU controller driver gets its single clock with
> > > > devm_clk_get_enabled(dev, NULL) and does not perform a named
> > > > clock lookup. Drop the redundant clock-names properties from the
> > > > FIU controller nodes so the DTS describes only the resources the
> > > > driver actually uses.
> > >
> > > The devicetree is a description of the hardware in the form documented
> > > by the bindings. Generally it's not right to discuss Linux drivers
> > > here: they're only relevant in the context of Linux, but the devicetree
> > > binding governs devicetrees over multiple projects.
> > >
> > > From a quick look it seems that these names are not described in the
> > > corresponding binding, therefore no drivers should be using them and as
> > > such they can (and should) be dropped. A driver would only be worth
> > > mentioning if it did use the undocumented names (as that would be a
> > > complication).
> > >
> > > Can you please rework the description?
> > do you mean change the description as follows
> > "
> > The NPCM7xx FIU controller nodes reference a single clock,
> > but the FIU binding does not describe their clock-names properties.
> > Drop the undocumented names so the DTS matches the binding.
> > "
>
> That sounds reasonable to me.
>
> Thanks,
>
> Andrew

