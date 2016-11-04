Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t96jJ6kWfzDvXC
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 14:27:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZDKpZFiO"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id x4so10332122oix.0
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 20:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=my5B0NWnYTdYKNHXaDKXWz/xB8ebx2SyNZqCz6/4zrc=;
 b=ZDKpZFiOzxhfun0yBQm+z1YbDiuc3ERHoUMS7c+j7qsUSIRatvbMwRkrSL/U/OR8A+
 Us0eyE26evZNeVN6Vhptr8BFgGoXjcDSn9+dVhLy4X3VERRzxqQWqIuuMF6DUewcz37M
 XGb7w+eFIuRR4NoHD0txJw58z90EHSMmniBkTOpp8/4TEvVmZXHfaUpf6UDuNrJL1JAB
 2XIIVwcRLOYYrcGj9YweyikpZKvdRYV7diuD/cRjr/33m4ewecDQlhvqPZPP47loQwNz
 uv6qKUQi2dvRNW6PgoadGHhVc0qx1C9WQAqhdVv57kfcroV5JnAyfPaAwhogX8waxOk4
 hrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=my5B0NWnYTdYKNHXaDKXWz/xB8ebx2SyNZqCz6/4zrc=;
 b=eNDQ3rpTUYVHDq08jSQtFL7QKvw47yAER6oVoT91By2lh5k/UozTh7S6p873Avml9g
 CNAXbSEEvFEBr+w/kZi21I1Essez5s3TMa/T86gX+Hr1iJb6OocoKZKgaxcc4/H/dTpC
 9SRzq5TkBd7+atViv8BvWAZPGim3GRxzmVudOTHCCGO1QVo7AqizCNCmJOIrjnY6vlyI
 x2+4bRbF9f/MOIe0XQmWEvGyDQa5rVga/IrKC9XOCTmLi/8zON9NT/g/kZIaq6DLoWug
 Sgxrmusk+ZYQ+DZSSYKYqxa0Fzur587aD1evN5i97wVayrgHeqlDL4y+v0+nnL1ZTT3e
 3IcA==
X-Gm-Message-State: ABUngvdc1vpX88Xk57NUsDYEDu2WMGwvhl0iLEG7rNcBlEr3Ct+JvMM7GF77q9CImhh2PgdjaRPRUWRmawTURA==
X-Received: by 10.157.22.200 with SMTP id s8mr8054822ots.14.1478230066541;
 Thu, 03 Nov 2016 20:27:46 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 3 Nov 2016 20:27:26 -0700 (PDT)
In-Reply-To: <1478228924.27396.64.camel@aj.id.au>
References: <20161103223009.4794-1-joel@jms.id.au>
 <20161103223009.4794-5-joel@jms.id.au>
 <1478228924.27396.64.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 4 Nov 2016 13:57:26 +1030
X-Google-Sender-Auth: YZCUV-jhHx_KUNY_Jee3ibovYi4
Message-ID: <CACPK8Xc99AyjVvuVat4L022eVszEPQFB1dEbdr6=hz0ki7mbpg@mail.gmail.com>
Subject: Re: [linux dev-4.7 PATCH 4/4] arm: aspeed: Remove SPI controller hacks
To: Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Fri, 04 Nov 2016 03:27:49 -0000

On Fri, Nov 4, 2016 at 1:38 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> -     /* SCU setup
>> -      *  - GPIOC{4,5,6} are FUNC_MODE{0,1,2}. These nets are
>> -      *    connected to the Ethernet phy and to ensure the correct
>> -      *    operation they all need to be in GPIO mode (SCU90[0] = 0)
>> -      *    and then pulled down
>> -      */
>
> Did you intend to remove this? It's still relevant and useful.

Yeah I did.

It's still an accurate description of the hardware. But it's not
describing the register writes below. It's in the device tree now.

Cheers,

Joel
