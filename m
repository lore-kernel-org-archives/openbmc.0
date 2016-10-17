Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy5h06GwSzDvMC
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 16:03:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Fs0R9mjE; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id b186so7320932vkb.3
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 22:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Z2IHsIB4ec1+FGp4hNPoASOA26SkKD57xlcLpnMJfWg=;
 b=Fs0R9mjErFFsDFz1C+xIspWAyVhd7H4ZsQmaa+ZPEjm58B8w6jkN19Tskve44Fx36C
 APkEWp53lUKGP45xTnHCeVSqotr9OlskhbspKARYzxez75CMEVIirRwV883qAJGaDfXN
 H572upP/RlEiMWR/cqcwMJVdqS3EXTdSZWZsw7QXTCydrachTmfl+hXSA8UDCHAaCL9t
 esFhjF9xwjCqSavvLw9LokP02YRl1z2Mf21eRX/LL0BaBRZF94TB9uTmdfQvfjN5GgMl
 AbcPZxXPCUlp5uz5W0Jt2d1iUsgePwIPcLLIlnIL6+mdTWwjzRwueplDZHjILxB+5o4f
 DmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Z2IHsIB4ec1+FGp4hNPoASOA26SkKD57xlcLpnMJfWg=;
 b=D4m3zbsv6oamiK/sZR/uOeMgZndt4AY+EBShJCYdiePH4hs5/7UKTngSDW+Z3WiI7C
 wToXyCeQocfl/XO34xNi1QgIZu2aj3It61zvLur/w4pAuaP3+SD9vQlRryZR+r/pYsyk
 Clk/rYrwQzaQG0TtbQWdXxodfi+xCUyzui+bnV1LHS2rotxbVo7AMKrkiXYSO+jtgmm5
 gi513qxYIjGwmG76zHtUJNV6jmH6XvVbDmx/UiapXvjx0DNAGOAfQOu6RKpK4bgkVz9h
 WpzqLht3KYdvV3qAffaT9C6uAPl53iXYpj448TIa8BF3Z1SN0coEZSGNQyznD1dsKMy4
 9ZZg==
X-Gm-Message-State: AA6/9RmUAb23iZE4MSAgpRwc6eu8/RfUch9zSGpaL38GYhTNbN6yfRk881sU90ALwMdjU7EkfUNpmsKGhdp76g==
X-Received: by 10.31.140.147 with SMTP id o141mr13626999vkd.149.1476680606735; 
 Sun, 16 Oct 2016 22:03:26 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 16 Oct 2016 22:03:06 -0700 (PDT)
In-Reply-To: <1476448684-6149-6-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-6-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 15:33:06 +1030
X-Google-Sender-Auth: 24hWlgqaNACZe7iOpWVXzF41A-k
Message-ID: <CACPK8XeOhdUxqKSN+RPn9yKTJRX3xnh7QMUZX8HwuUmVtPRHSQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 05/12] ARM: dts: aspeed-g5: update
 witherspoon for new spi-nor binding
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Oct 2016 05:03:29 -0000

On Fri, Oct 14, 2016 at 11:07 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> From: Milton Miller <miltonm@us.ibm.com>
>
> Witherspoon has two flash modules for the BMC firmware and one for the
> host.
>
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 28 ++++++++++++++----=
------
>  1 file changed, 16 insertions(+), 12 deletions(-)
