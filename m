Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wpr005xBszDq8M
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 16:22:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ik5Es62a"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id s127so1817332ywg.3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 23:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=vf2ajtZ5SsG34wg2EYazVubZCd1B687lx00pttGKK/w=;
 b=ik5Es62acSnZzGTd4peFqwN67iHjuiPB4h0504QEB+qAErNASdUAl7nXPOk+aXaTzk
 iLrICi/ZKY1zhp38qnpF3N+w0ZzZE42erNVhTsM7UnUU4yJrtO7lseWYrJ5zn2khzffQ
 stF/gcNHuj6N96C98t1oxGfANOd/bvTGgyp2kJbrLjA5dhBebEuGtt32H5QvOWTaW+Ww
 PqVe65D5gRAblzzz0enmttD5idxAGq4wfbeblXr9GW8mRnn7RXEgqRoFpRaiawA5mU86
 osrqgIn+6ICPxusy2hIdhKTvArjmD1oRGb8E5/dybdhPQX/MU/CcauK0TIwNge8SGvnT
 Jwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=vf2ajtZ5SsG34wg2EYazVubZCd1B687lx00pttGKK/w=;
 b=pzLQkBHNSC5+Q3MbcP/rRRXoMSgEfx58KdKP6hpW7qnuPQPqMYdaMrDZWtUQ+v1BPf
 0hdK8x0zb1TNkTyd+Dk9pPP2GUyhOV3gQRtyV/w6ib4BdpoH1srsYEF0o1Q2FrjFaSEd
 SqoHzZiJ7xCTazApDTbwFxE4Ubftreql793EtE0I5wZFa5T/aaJ3RGb0uKk1X5IIgQ5z
 44f1btEXeqR2wU+inhUEWymhWwh1X7xYOWUdOw0fi/r0jZpurVjc6LXh/1Emw1/Sfgv6
 Dwao8vcEce2qsNdZpvSUS45a9xBOwb9ymb1GP72lYfqDiKBP1i7ynABgtnaaZcCIaDiF
 WSkQ==
X-Gm-Message-State: AKS2vOzLipZlqaoD1Ysb0IkN374anuGsN/Ml7fzq/rFAM8Aiof+xSzZ5
 0+NehDC9wMaSm8IHGAfc6VGzePMPwA==
X-Received: by 10.13.252.129 with SMTP id m123mr7077328ywf.219.1497594174707; 
 Thu, 15 Jun 2017 23:22:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Thu, 15 Jun 2017 23:22:34 -0700 (PDT)
In-Reply-To: <20170615200033.67387-2-cbostic@linux.vnet.ibm.com>
References: <20170615200033.67387-1-cbostic@linux.vnet.ibm.com>
 <20170615200033.67387-2-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jun 2017 15:52:34 +0930
X-Google-Sender-Auth: BjKPDZk0AvxYr9pgtP_bFYXa-So
Message-ID: <CACPK8Xf388FM5Bd3Wd4DvB+Sw=MtJBZnKADWv=+atdhc9YDaZg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 1/3] drivers/hwmon: Document optional
 dev tree property 'fault-max-fan'
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Jeremy Kerr <jk@ozlabs.org>, Rob Herring <robh+dt@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 16 Jun 2017 06:22:57 -0000

On Fri, Jun 16, 2017 at 5:30 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Document new optional device tree property 'fault-max-fan'.  This
> property indicates that the max31785 should be configured to drive
> fan with 100% PWM duty cycle on fault condition.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  Documentation/devicetree/bindings/hwmon/max31785.txt | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/max31785.txt
>
> diff --git a/Documentation/devicetree/bindings/hwmon/max31785.txt b/Documentation/devicetree/bindings/hwmon/max31785.txt
> new file mode 100644
> index 0000000..2b0190d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/max31785.txt
> @@ -0,0 +1,20 @@
> +Bindings for MAX31785 I2C fan controller
> +
> +Reference:
> +[1]    https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
> +
> +Required properties:
> +- compatible : "maxim,max31785"
> +- reg        : I2C address, 0x52.
> +
> +Optional properties, default is to retain the chip's current setting:
> +- fault-max-fan : When present this property indicates to set fan to 100% PWM
> +                  duty cycle on FAULT condition.

The hardware has 6 pages that can be configured to assert this on
fault. We should describe that in the binding.

Should the binding describe the four pages as separate properties, or
just the one?

One option is to say: we are describing the presence of the wire that
connects the fault pin to something, so the presence/absence of the
hardware is all that will live in the binding?

Cheers,

Joel

>
> +Example:
> +
> +        max31785@52 {
> +                compatible = "maxim,max31785";
> +                reg = <0x52>;
> +                fault-max-fan;
> +        };
> --
> 1.8.2.2
>
