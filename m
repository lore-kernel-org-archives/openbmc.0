Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ebb6jC/Y"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHYM61128zF0dN
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 04:50:41 +1100 (AEDT)
Received: by mail-qt0-x241.google.com with SMTP id i40so2827093qti.8
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 09:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=49kCRaF6pLm+SxEin7RGgBWjQcvc/j/BcnNjBL9VoFs=;
 b=Ebb6jC/Y8Ehqebo9mSKixF1xWXfJkRx6Gzx1R6AV3aZ6sQ9RbWaSGgrarijhSA5+Q1
 aVoSvb1mwIFMp8vGm8TWuRVZUFJKhmUNhP8NB6BXZT1SveHl2PVOeJMtcxZqwMuQyjIc
 tTX9E9QFf0jO4f6moE4SnnAOIKZf6LmMDLmqvhkAwzERLg/N7Gz4WXDbHYXrXhdZLphw
 W7AzpVTWC9g5ElEVZE1gdeoU500V4aeTvQjE2j0KgsNRAPXYHLXGDB/EX0P017SUFaxs
 THs12MUwXtU7JVygR53kagdE+UxR2VNWRJjH6vpuc2dIZNFzSbDnUsW2hK5v24ePMrk2
 ICXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=49kCRaF6pLm+SxEin7RGgBWjQcvc/j/BcnNjBL9VoFs=;
 b=X1YYwLmwdPz5OyjJkvtkmYVmNdBflxxb3KN8UnxTA2kARJVEfAY+vrEdKU+y0wjuug
 Ffh6uu+0zvc2j6ROU/xI+9UKNEQpWimRutuehUZFmp4Y0Ag9iVoARDXumo72RtMnaslB
 Wijg5aiAfxWs4ssu+lSOrb64yjokKFgzsEBR1AQhoLkgErjialMJF6U7HVEc0JAQMYcC
 3cvSDisYhWBh1rRUgZP2H50Qc9uKQeMkCbqxbHsXrBoy7jBLpbRECjratVA/XwJT6UKZ
 r7TvBmc914MGTiEmdGdDERAEDoZ74Hj5j+/7DVs2TRtZw0idBxHFvXedVdyS329W+IG1
 cyyw==
X-Gm-Message-State: AKwxytep9RTSGh4V3SFWaYWSaxnHxVfUYlG1xfzBCfzG+BUbvTHgU0oi
 5hi024u/mL142mDJghTWzaWZ69DQtZl09gjeGAo=
X-Google-Smtp-Source: ACJfBovHpsB5eX8kuO0hHWYcOLp0D4mt1e6kdY3d2NOicc0mrQj/Aiy1fcIRDtfrxcFp1gp+cbGOTuGrTjscVGXwQhA=
X-Received: by 10.237.43.229 with SMTP id e92mr35163007qtd.178.1515693039776; 
 Thu, 11 Jan 2018 09:50:39 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Thu, 11 Jan 2018 09:50:19 -0800 (PST)
In-Reply-To: <1514202808-29747-4-git-send-email-oleksandrs@mellanox.com>
References: <1514202808-29747-1-git-send-email-oleksandrs@mellanox.com>
 <1514202808-29747-4-git-send-email-oleksandrs@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Jan 2018 09:50:19 -0800
X-Google-Sender-Auth: i2FGUNjqrvAl5I1eMXxy7JhhOA0
Message-ID: <CACPK8XfH-4r0mBQYA+BwvUo2+RF8igai2jy+RqTDQcxx2-acsQ@mail.gmail.com>
Subject: Re: [patch v15 3/4] Documentation: jtag: Add bindings for Aspeed SoC
 24xx and 25xx families JTAG master driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org, 
 Vadim Pasternak <vadimp@mellanox.com>, system-sw-low-level@mellanox.com, 
 Rob Herring <robh+dt@kernel.org>, openocd-devel-owner@lists.sourceforge.net, 
 linux-api@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 mchehab@kernel.org, Jiri Pirko <jiri@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jan 2018 17:50:42 -0000

On Mon, Dec 25, 2017 at 3:53 AM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
> It has been tested on Mellanox system with BMC equipped with
> Aspeed 2520 SoC for programming CPLD devices.
>
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Jiri Pirko <jiri@mellanox.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v14->v15
> v13->v14
> v12->v13
> v11->v12
> v10->v11
> v9->v10
> v8->v9
> v7->v8
> Comments pointed by pointed by Joel Stanley <joel.stan@gmail.com>
> - Change compatible string to ast2400 and ast2000
>
> V6->v7
> Comments pointed by Tobias Klauser <tklauser@distanz.ch>
>  - Fix spell "Doccumentation" -> "Documentation"
>
> v5->v6
> Comments pointed by Tobias Klauser <tklauser@distanz.ch>
> - Small nit: s/documentation/Documentation/
>
> v4->v5
>
> V3->v4
> Comments pointed by Rob Herring <robh@kernel.org>
> - delete unnecessary "status" and "reg-shift" descriptions in
>   bndings file
>
> v2->v3
> Comments pointed by Rob Herring <robh@kernel.org>
> - split Aspeed jtag driver and binding to sepatrate patches
> - delete unnecessary "status" and "reg-shift" descriptions in
>   bndings file
> ---
>  .../devicetree/bindings/jtag/aspeed-jtag.txt       |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/jtag/aspeed-jtag.txt
>
> diff --git a/Documentation/devicetree/bindings/jtag/aspeed-jtag.txt b/Documentation/devicetree/bindings/jtag/aspeed-jtag.txt
> new file mode 100644
> index 0000000..8cfc610
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/jtag/aspeed-jtag.txt
> @@ -0,0 +1,18 @@
> +Aspeed JTAG driver for ast2400 and ast2500 SoC
> +
> +Required properties:
> +- compatible:          Should be one of
> +      - "aspeed,ast2400-jtag"
> +      - "aspeed,ast2500-jtag"
> +- reg                  contains the offset and length of the JTAG memory
> +                       region
> +- clocks               root clock of bus, should reference the APB clock
> +- interrupts           should contain JTAG controller interrupt
> +
> +Example:
> +jtag: jtag@1e6e4000 {
> +       compatible = "aspeed,ast2500-jtag";
> +       reg = <0x1e6e4000 0x1c>;
> +       clocks = <&clk_apb>;

We've now got a proper clock driver upstream. Can you update the
example to match the newly added bindings?

 clocks = <&syscon ASPEED_CLK_APB>;

Cheers,

Joel
