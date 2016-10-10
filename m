Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x233.google.com (mail-vk0-x233.google.com
 [IPv6:2607:f8b0:400c:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssqnn2n5hzDsj2
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:23:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=wgYvIIQN; 
 dkim-atps=neutral
Received: by mail-vk0-x233.google.com with SMTP id 2so47101704vkb.3
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=bDEiWM3RUli1TE57Ktbw0hUiRRGuXxy+U0aKx3so7vw=;
 b=wgYvIIQNnI80dKLFxESDMRfWK1Eo+jyI7ygoEviFvJv782Pox5hA34UiwU97QienuP
 OjJBWsW0/T7hSoB/ozosE/dizlsyS7BRrHQcA8JWwpCUI2dxyIIiOvlgKYKKurb1dJ4x
 BH+HvSRd07YbAK7RSLfNM245/K6pITpTCQJVf+/TQMFM06cIuYPg187fWNY5rx9YYeXz
 5eHxfrXYenbUGwI+zTQ5DUERFHVIa8h92yxiZiOen/U6Bqs0VcCswAib5Rlj3XyADE1p
 /MyKSVcB/PElP4RKqDahtHZfZAh3hRAjK6J5MR+zFl2ek2ybXnHjYVcoZHoqaSdlhxIR
 YNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=bDEiWM3RUli1TE57Ktbw0hUiRRGuXxy+U0aKx3so7vw=;
 b=g6hPiB3m+OWNIgqlfXab70lbxlmiYQ2ebSUqLQ25poI/1OqlgScmKu8MjyDOyFQGzC
 y5ruxe5FqmwGD5x+1c9j8wdrOqFwqE6m2BKxWeYccuLOYe8nUIHI3OD0goEaDf7FQgme
 5GwYJaOB3187kSOPRSqKqcvDsmIxNqtOSa/xfycCMozJSVXTFLOyQiRlm1qyp8ogVvab
 NCNTXqa69aBdt6yTUt+IqUYq610OwXfRL2d9+PwXtftUpWLEHg0LIpZEybUvRgXt0vfX
 kb/fksf993rv9+kDQgpR7ZM/daiW0t6LlBJ9P8POT4RW5z7p0VSXNlbU582kgsS3evP9
 nSpw==
X-Gm-Message-State: AA6/9RnqzdSpGHA2OFVPqeqQC+LmD2QiD+Td7CTqj/OV+dg+jgb2vVdWNgGxQjmmn2tbOPYj5UIkqfSZODQJCQ==
X-Received: by 10.31.4.195 with SMTP id 186mr21285201vke.82.1476080619232;
 Sun, 09 Oct 2016 23:23:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:23:18 -0700 (PDT)
In-Reply-To: <1475789205-19618-8-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <1475789205-19618-8-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:23:18 +1100
X-Google-Sender-Auth: aG5YhN6T_LiYV4hvdlmOBXVllek
Message-ID: <CACPK8XfDep8jTKDvPn3C76WzC+=E0Kc4Xsk6FsrKfkvxw5AysQ@mail.gmail.com>
Subject: Re: [PATCH u-boot 07/12] aspeed: add configuration for the network
 devices
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 10 Oct 2016 06:23:42 -0000

On Fri, Oct 7, 2016 at 8:26 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> +config FTGMAC100
> +       bool "Faraday's FTGMAC100 Gigabit SoC Ethernet"
> +       select PHYLIB
> +       select MII
> +       help
> +         Support for Faraday's FTGMAC100 Gigabit SoC Ethernet
> +
> +config FTGMAC100_EGIGA
> +       bool "Define this if FTGMAC100 is connected to gigabit PHY"
> +       depends on FTGMAC100
> +       help
> +         If your system has 10/100 PHY only, it might not occur wrong
> +         behavior. Because PHY usually return timeout or useless data
> +         when polling gigabit status and gigabit control registers.
> +         This behavior won't affect the correctness of 10/100 link
> +         speed update.
> +

Are we able to fix this in the future?
