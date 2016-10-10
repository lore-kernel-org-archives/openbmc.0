Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssqp26LKwzDsff
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:23:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=LY3ytYTA; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id z126so3740874vkd.0
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=oXGaYEvi7SEcz6keMDu4dgmEOtyuMpNV5O/DEgqSLfM=;
 b=LY3ytYTA20JATI4N7dDMcqHHUHkY+Zev1BM2Qotu/8gS/JvFr/Ub3b8uSNi+WS/1cr
 5ZGxs2cXgMIe1AvuPeb3/8F1Mp3GBEiNhhv5i5Ooz0TQIA4zTqWF2jeDkBo6dwoKDVIO
 Vcdf8lM6LO57wVxTeDXQf5bXhfIkRDGI4Ik/7Z1v9+4z6sMElp5m59+atXHrsLy54VVB
 D3ogxSexHLE5qjz5hYNQHG7pDbwdcQwQrPuJtqeorcs35RpAXQvGX/Ls+NcvQrBMAYVN
 7ZkwL9eZgKaKEzAJ7fsjMnKbepzQI4/9gWEPlXImpPcK1fkINdmvU6zOnIkRSfWwCN37
 CisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=oXGaYEvi7SEcz6keMDu4dgmEOtyuMpNV5O/DEgqSLfM=;
 b=VsAueRJr4yYtb7dkeDmFhA9BMwrx/pie93PDIpbJYwj/xfYpKPCKTq56TgVFdAa4gx
 baS1MCfLOIRcxhyV3SgfA0EYrqgF03R3p2NJOBmAMwsVP3va4d/4Pp6FipTbAKvmxUA/
 cruYFIY5AwIw8edXphMVvWWeWlg9IHIxsWXEhBj8alVaW2KQRYihVe3wpENSNhZkbdWs
 oLimTLkL2Rl2qIFsC6ETOGs60yO6AoQKXcYOmKSPKUALrl1GYeO0CD7daiRDFa497xK7
 tuNq0DymBpypdoQ6jZKNo9V5xHVaGGX8Wy2E5AeIrr0npYJJxIqqrsClsU+kHnwU1q1l
 q+Dg==
X-Gm-Message-State: AA6/9Rnw+pFgkXibHc09dlbC9q1ELhz8RMgXpEvXm6C2ENDojfqyLF2aVJnDX0q++6hMgaUBUUH8aX4w26II7w==
X-Received: by 10.31.233.6 with SMTP id g6mr7373184vkh.148.1476080633023; Sun,
 09 Oct 2016 23:23:53 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:23:32 -0700 (PDT)
In-Reply-To: <1475789205-19618-10-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <1475789205-19618-10-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:23:32 +1100
X-Google-Sender-Auth: OGyqLbEwWJyOOSKFpJgOnSH9lPg
Message-ID: <CACPK8XdnYOBP0s8BJ1RLHVpbH2mL_+GsRPv97jFPe=51=_uX=Q@mail.gmail.com>
Subject: Re: [PATCH u-boot 09/12] aspeed: add CONFIG_DRAM_ECC
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
X-List-Received-Date: Mon, 10 Oct 2016 06:23:55 -0000

On Fri, Oct 7, 2016 at 8:26 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> There is still a warning  I need to get rid of :
>
>       board/aspeed/ast-g5/Kconfig:22:warning: config symbol defined witho=
ut type
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  board/aspeed/ast-g5/Kconfig   | 9 +++++++++
>  include/configs/ast-g5-ncsi.h | 3 ---
>  include/configs/ast-g5-phy.h  | 3 ---
>  3 files changed, 9 insertions(+), 6 deletions(-)
