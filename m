Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssqmP5kNvzDrbk
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:22:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ZTlMkwvq; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id z126so3740392vkd.0
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=L2IeFcU+vJfCJ+VArkxUvAeaUWrwY0tNpnlnVDB+//k=;
 b=ZTlMkwvq2CkXlhey1P8vG3lJbiP9JHDi0RF65lPT+ijHv1eFVkFXbsvElgM1fg7Qjr
 0Iia03CKSmwUw3GrTXRZ8pxf7aLHv/bRd1nvnbhi2hw6+7et3b7y91yruYj9ALUvuZE/
 buFDvlbyQH5XEWR5SgVX+SUTSghejEL/Tq4kcN3CLjHE+ICTaif5SDQVpo3/bU3do8H5
 Gkch4CaTCnNocLIw1/tbPl7cyiNOz1Gv+muLFOADL7acWsB8tyQ2eCariDAXoCfd+pWy
 wDqxl/cIcLatubsbL0jqg7ah6sRJt8edxf8aqgMxTquewFzxPv7Ylx0/NBTlEygFDYrO
 G8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=L2IeFcU+vJfCJ+VArkxUvAeaUWrwY0tNpnlnVDB+//k=;
 b=aC5X7zi1Ahc72+NdvvJDGFbuMqMtr+YgCBsyZKRq+5r6SvhqE7KaK0IzNlWXGRDS3S
 p036iht6R41Vlkz0F7y4ijFp7MiQCrAC8xIFkmnIJg0/ODXtEy0kxt1WwVLg7G+h/yei
 q9mBL3sBy2SLsvN7gIk2GekNgKV8JOZHF9tq1UbLPirPDrHSRod4G/AReNzX3TzNih+A
 AmKDpPaX7IWf30wjyQbVEb7keNBb2eqYJPvjSBLicudnpSMW6neI7Z47ZpKRFD8DRIU6
 fQN34cB5FIpvS6UAZooiHAc5JWUQrFrbA6vLsHB93ylo/L2dpuuTh7qqIDDLXXXfKdk7
 SuAg==
X-Gm-Message-State: AA6/9RlDrFmT9xlyZFg5+JyHWgoUHAMx6LDcHT50zkT5nY2tiXwhwKfh+ZWZeDuTOWkpZK55bsufMb+biXhMOg==
X-Received: by 10.31.168.145 with SMTP id r139mr21447331vke.124.1476080547354; 
 Sun, 09 Oct 2016 23:22:27 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:22:06 -0700 (PDT)
In-Reply-To: <1475789205-19618-3-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <1475789205-19618-3-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:22:06 +1100
X-Google-Sender-Auth: aU6RTZl5wCknmqK92fQPi9WGBWI
Message-ID: <CACPK8XcbsK+FO87BFsei++dFUNjZBXSt7KgxLrz2Uo6rqTHr7Q@mail.gmail.com>
Subject: Re: [PATCH u-boot 02/12] aspeed: rework top level configuration of
 the Aspeed SoC
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
X-List-Received-Date: Mon, 10 Oct 2016 06:22:30 -0000

On Fri, Oct 7, 2016 at 8:26 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> and also add a proper CONFIG_ARCH_ASPEED
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/Kconfig                               | 16 ++++---------
>  {board/aspeed =3D> arch/arm/mach-aspeed}/Kconfig | 32 ++++++++++++++++++=
++++++--
>  board/aspeed/ast-g4/Kconfig                    |  6 -----
>  board/aspeed/ast-g5/Kconfig                    |  6 -----
>  configs/ast_g4_ncsi_defconfig                  |  1 +
>  configs/ast_g4_phy_defconfig                   |  1 +
>  configs/ast_g5_ncsi_defconfig                  |  1 +
>  configs/ast_g5_phy_defconfig                   |  1 +
>  include/configs/ast-common.h                   |  1 -
>  9 files changed, 39 insertions(+), 26 deletions(-)
>  rename {board/aspeed =3D> arch/arm/mach-aspeed}/Kconfig (52%)
