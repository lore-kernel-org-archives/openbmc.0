Return-Path: <openbmc+bounces-2574-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4DDC79F99
	for <openbmc@archiver.kernel.org>; Tue,  8 Sep 2026 16:12:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hfTVH4YvRz2yb9;
	Wed, 09 Sep 2026 02:12:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788883943;
	cv=none; b=eQ2noodFSKOwx8FmSME/ZZ4wSK9fxjHEKBS1QM6Nkja/tzzu4tOFsmGczcqbbr9gB7DB+IECuHKxFnYAcH5AywXgIA3AZSKCLJj2S05feCj8SNxhHgv96049HWk2B7XYiuFhRCD72ydkTbA/p91gMuthLVJHnIs9ESKsC/eJ7VUZgO5bL4OzOzeL6zX21ndkZvtfzL49mHsTG0mxIYwQS9X+YVH7MTTQG9uu33s2QWALevqEc69xLeGp01fMohgcy5/nd/n1aEAiyJ38wrNIgFkpDebxORE3PGmS6Fgylecnl9boCkPz77Ha76kcYQrjNv5OoDaprKVFU+cgDppCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788883943; c=relaxed/relaxed;
	bh=2RTVmx65sj/OQ1FTIJA7qw5cuQ/6mnn1iGRNRdhAkxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RU5zyQYrQF0y2/0xtdYmiTBVTEOG2ZYg+0d+G5KoP1w8qduk4nJciy0wBpa1irP46qzBdo4sJh3IKiEyXiY3oU0FbeqgPufxY3eFakIxDWKtdLxI3kFqfmWPTKUa8V50xNuuyDIYRzKeEHwwPIIVX6yqYD6NT1WVmc7s1CR5ZChtzFElrJT7IA83AfjhjpWCXltrphyzZLSKwDB6G0jhnMDWCcwGmx+r6lQMDjQJZxrnc8xmzQDK+dBtiYg+Z2+2EmpNYfMYsMUoe0szkIr3/temMJByTYA5vhgZadL7WQwVQeFy1D8jafF5wSu34Y5nYcGX0d1r78Y69bKp9sqazw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pyAm1WZc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pyAm1WZc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hfTVD5NHPz2y1F
	for <openbmc@lists.ozlabs.org>; Wed, 09 Sep 2026 02:12:19 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso40935955ad.3
        for <openbmc@lists.ozlabs.org>; Tue, 08 Sep 2026 09:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883937; x=1789488737; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2RTVmx65sj/OQ1FTIJA7qw5cuQ/6mnn1iGRNRdhAkxI=;
        b=pyAm1WZcvRz4vP0l0to1faguMZePDCAiQu+fkdfFAZvfvEwxyehVYA0R9P5DcYVnlG
         sXGKG35ZQv4C78QKerBJ9Rrgv3VKAuY0ZEobRiQOxcVSO3gGyHZukZmZ80LbvDS9y0zw
         XNQwkmGgwILNlFPe9NGe5S9f4qjYgUgnODh0YhfnImS1F6rb58HW02BxaDFj5MXAGV/H
         NQUlytiRbMDBhvQpBhX/I9agaA3EIEnLMyQNLOAzljrHTKU4i733KdBC4pzzCZ6jsuO9
         vM4+2yEewaJYZqsPIRm5zYwjXmN4xs+ra1UHN4K5Yo2jLeaTfvMxgOzbRXm6V7xkxc9M
         BXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883937; x=1789488737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RTVmx65sj/OQ1FTIJA7qw5cuQ/6mnn1iGRNRdhAkxI=;
        b=E5F78vaVcS6xZLrYXA9/MSt5kk0AZfXWrA9nM1T6QMkjUFRFub+AgWZohsQMMzHkfZ
         P0kqKBuKl3kztlnQxcbLcC8+6dklo2sTu7s2spF91GFtK/TCbvaVFcxzS/npg0PZWyA/
         F6R1hpGY0s9/fq+/MapMT7pmN6Y9UiPv0IdHbyV66Aj4XdrxpsKfK6AcFGJig5rnJtvJ
         l4JZ65WrEnYIi22sriw7Lb3vFKkHNJ/D17ehJBK6emkabMmlYi2DNIHwxGc/GktuORKl
         XA/+uNwyrSWcRyhery4JN/EsEEqFp54SK6a9cB5laxNnn/ezsQ37Bvw/vMTQB38LEbwl
         zjXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnhYjR1Hm29EQIy9G7eH4ZAFjprjXaumgNxvga9xFHTQfu0iP5YIK1FyPCp7H7ebce+v6ZVSHt@lists.ozlabs.org
X-Gm-Message-State: AFuF++lOUWD7Mh+zOojhBhTeWJvXrQNCd5FtvbS5rbkYhXgP297IHG9T
	YlWYorKkB8hdMgbukcA7M5OekPHRx/ja2OV8r8GJsTAeb3tRNuPYMsVS
X-Gm-Gg: AYBFou00BYgqTEjTMlUjrd3dHJxU5mqG9zqWUL/0sAQ45SQIcRnotXZ4BJCcLacLXsV
	PBYY1mwSz14CNnZhXV71Pna9Q69ntGKDWvypOP+uFs+VjtIPIp4h4or8Ob8Hhnc2FqsiBxQ6euz
	dH75mew5lBYBcnZrxHygjrZv6jubmdPpgfx2VlgFX3ROkdOILmjm963zBXqmZivRUNhwuYgZ7mI
	UhpWH5v6RsOcEGI5PkDPtSIfyRX52JDGWFUWgfG528aWKaUwD5CMtd8R5LqRBfpzz+8F+23ExO1
	/ZYE0ZOZwaRpQZe5CWKSIhPfJ/pCKa7ec1AXX3Ui+PN22V3CZnBaAHr1vD1ZPvDBcoGhKX72usR
	+1h9sirZ6ek6uoLabC0yEkOecCM+EBB9+RE4Me3S5oLf4exxgWVW5Q+fVVt8vVS3c6o1dxrGn1T
	L3sAx1EWcU3otOBZ/9vmg+qcRmjmwF7H3O7RcfmmPLiqKKUBbVNcLbce2DM9ZjKc8hqjAQOHVzw
	Q==
X-Received: by 2002:a17:902:db07:b0:2db:5ea1:8b04 with SMTP id d9443c01a7336-2db5ea18e2amr170023395ad.5.1788883937378;
        Tue, 08 Sep 2026 09:12:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b419sm61093785ad.13.2026.09.08.09.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:12:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:12:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add Axiado AX3000 TSADC
Message-ID: <ba945a15-bd57-4c6a-a738-53177a9cd814@roeck-us.net>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>

On Thu, Sep 03, 2026 at 12:09:47AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the temperature sensor ADC (TSADC)
> controller found on the Axiado AX3000 and AX3005 SoCs.
> 
> The controller monitors the on-die temperature. An SoC may contain
> multiple TSADC controllers at different locations on the die, each
> represented by a separate Devicetree node.
> 
> AX3005 uses the same programming model as AX3000 and is compatible
> with the AX3000 implementation. Therefore, axiado,ax3000-tsadc is
> used as its fallback compatible.
> 
> Also add a MAINTAINERS entry covering the binding and driver.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

