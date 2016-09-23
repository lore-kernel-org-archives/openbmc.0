Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgQLl137bzDsmd
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 17:42:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=tScECARa; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id 15so1107571uai.3
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 00:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=NYK9D/lRilcDPgWVOUvbnqOfh82ArWKQtVcR25H0Elg=;
 b=tScECARakoYPflG5ERmeIkT7EpftRvkLe042fkxMLTsVSwgIwqyCWBDiq9x7D9Qae4
 MxLiuSdWD733V2isk5Rjwk0j/+Gr1tcpikf1qyPaWIkXC21n3LD2YD2e/u1mrlsgM21w
 Yfl06+Obe4IiUOQ0d1fZlfjDheEEM9cXMYDUp3lftqwLM1vjCkIZRDpoAZ6uFnXwpMQt
 9qwRyRcowqxeI6fUxK58Ngz9PY60bxGC/LD485ei1OAHLg8Xkvq1vqD0lqSk6sKWubIl
 EOQaweuqu86in1/sM0OzRWalFGDlYjVISDdvf6YJc4rl+XGRyAu/fHxHhZwSk7s9s9ck
 gnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=NYK9D/lRilcDPgWVOUvbnqOfh82ArWKQtVcR25H0Elg=;
 b=SIE/yJhKGHljtgtYN4iZp3PwXujOdyTF9dgcP7c36TbxMWqW0v7tRlc6lfBBAMaV5y
 6SkePTLV04aa2KcX7S4iBZSE1PgPkN64poUQ18G3WKDnbx0MdBDIxHyzU0qLvlRBzww9
 Fd0+Te3VsAhL4NfcHCZ4B8g//1qD+6p/3euvkg09AGLHh/DYgL+swxxTbI+fi2RS66xq
 nFfLas6MMUDCAQqtfymK/4iS+2ovbyOYcl6CeVW5LqbVQcBRo78GkEMdRquugjDNKQIQ
 SGyqTMmc4NIqbWCZ1G/d/812GYALFf87mHQKTCUzCl6Zyp79ZqcvDnukhGffPHA5hbSL
 VEvQ==
X-Gm-Message-State: AA6/9Rm9Uq9H779EfdtTrsbBlXku+qHx1qYztA5aiNn4gbAS4xu3bIXRoRn2vUeNXiV0wtukpwAQJ1ffMLDhLw==
X-Received: by 10.176.3.206 with SMTP id 72mr2847669uau.145.1474616557187;
 Fri, 23 Sep 2016 00:42:37 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Fri, 23 Sep 2016 00:42:16 -0700 (PDT)
In-Reply-To: <1474058133-27363-17-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-17-git-send-email-tpearson@raptorengineering.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 17:12:16 +0930
X-Google-Sender-Auth: KvYCVavW2E-lEZL3Hpcg7G0KwVA
Message-ID: <CACPK8XdvqD3f10L5V01_F16xE0UVmN0gWstTThkd2PpNH+=1Mg@mail.gmail.com>
Subject: Re: [PATCH 16/17] Add LED expander mapping to Firestone DT
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 23 Sep 2016 07:42:39 -0000

On Sat, Sep 17, 2016 at 6:05 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
> There is a driver in the Linux kernel for the PCA9552 but it
> is not yet devicetree-enabled.

I will hold off until we have the driver working and can define some
bindings for it.

Cheers,

Joel
>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |   54 ++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index 38f1b4b..8b25ba7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -176,11 +176,57 @@
>         status = "okay";
>
>         leds@c0 {
> -               compatible = "pca,pca9552led";
> +               compatible = "nxp,pca9552";
>                 reg = <0x800000c0>;
> -               // led9 - led_fault_n
> -               // led10 - pwr_led_n
> -               // led11 - rear_id_led_n
> +
> +               centaur_present_0 {
> +                       //
> +               };
> +               centaur_present_1 {
> +                       //
> +               };
> +               centaur_present_2 {
> +                       //
> +               };
> +               centaur_present_3 {
> +                       //
> +               };
> +               centaur_present_4 {
> +                       //
> +               };
> +               centaur_present_5 {
> +                       //
> +               };
> +               centaur_present_6 {
> +                       //
> +               };
> +               centaur_present_7 {
> +                       //
> +               };
> +               no-connect-0 {
> +                       //
> +               };
> +               fault {
> +                       //
> +               };
> +               power {
> +                       //
> +               };
> +               identify-rear {
> +                       //
> +               };
> +               no-connect-1 {
> +                       //
> +               };
> +               power-supply-smbus-reset {
> +                       //
> +               };
> +               spi-vid-standby-reset {
> +                       //
> +               };
> +               apss-reset {
> +                       //
> +               };
>         };
>
>         rtc@d0 {
> --
> 1.7.9.5
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
