Return-Path: <miguel.ojeda.sandonis@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::143; helo=mail-lf1-x143.google.com;
 envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="L6yCZPVg"; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ZTgC42XQzDqRq
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 23:57:24 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id e26so5571014lfc.2
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jan 2019 04:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZOo5JSi7whhcM7/WGLUWRVHIGV2nNGbZoniImBrz8HI=;
 b=L6yCZPVgmSKLw7ZooXepH04uTqvC4MlaU3vVaMwNKCBclctn5t44oUOfWjyrj2GFNz
 QNMqxQ60HJO672mbGsfYM4NUlv2kBeqf4t/mk2TRFIfEIJhtWpgpNSkjeSNwbyoW4rQg
 1CmMwt1ZBL0O+BMYqfopTglRvcCopLCYs77k62C9JQVy4WSF7UkOkSqU+Q1UHL65xzDe
 Sr4zJLu7xegvYuYn/EsQ5576yjYVRyKy1rFuw8wBkTuKBM2y3+XsC0zTrOM2Wy4ef2uj
 xM8NifnHvw623Bc7wRR53qsxTCWA8RdU+Pn/ZY7RbmUnTHQd+4EGVZmt7S2lP5e1Z6Al
 tGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZOo5JSi7whhcM7/WGLUWRVHIGV2nNGbZoniImBrz8HI=;
 b=dfwgf/slG6OwTTnV1b9ulu4D5BHh1AWak3isFCFrdTNdRGXN3xRpW4ZHdCVTGe+5Md
 hKZLSFsL9VpIlXP/m2RRc8wj/rEoiXHDC49BqZblYe7Bco9MGpKnXPucJoZPhvniS8PL
 FhYP5Ojs9R0Ezm4ab5PF/WnMFbmqwmFlGqIJGCEOe6734E1wCU8tvl5jAfIKEL/dgiZm
 h1UInNI+WxHjctt1LKyq6L4zg0kj2t2RXpbkEIDuY35MWH4IvtiEyWWQapVRxdN46UYp
 fdRDxM/gMR6Q/TSXzQixPdMf9MYthgPFmgrUDnPc66C/Yj0ckysjKJIjGcMrAfLvmTnK
 E+Tw==
X-Gm-Message-State: AJcUukcmNFr2dobMXRpEAXhKaYjHInEn1li1PwRxnivJc8qNIu54Z/kT
 OILHXIE104EKVAybkKsV0A/S3jAiUyMiyGC8yn8=
X-Google-Smtp-Source: ALg8bN6lsFUWca0M39BC9MkCevTEdYbwdZcmwlKetXbjc22ZmWisyfxB/S2GV+bIbVhdjbLR/oJ55E8/S5Dkt/ktoY0=
X-Received: by 2002:a19:8fce:: with SMTP id s75mr3294463lfk.151.1547038640635; 
 Wed, 09 Jan 2019 04:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-11-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190107214136.5256-11-jae.hyun.yoo@linux.intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Jan 2019 13:57:09 +0100
Message-ID: <CANiq72=dA1weOip-YzZRmsOEHOve2FdJh9_qbN2dmH8HR58WYg@mail.gmail.com>
Subject: Re: [PATCH v10 10/12] hwmon: Add PECI cputemp driver
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, 
 Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>, 
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 "David S . Miller" <davem@davemloft.net>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, 
 Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, 
 David Kershner <david.kershner@unisys.com>, 
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sagar Dharia <sdharia@codeaurora.org>, 
 Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Juergen Gross <jgross@suse.com>, 
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, openbmc@lists.ozlabs.org, 
 Alan Cox <alan@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jason M Biils <jason.m.bills@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, 
 Stef van Os <stef.van.os@prodrive-technologies.com>, 
 Haiyue Wang <haiyue.wang@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, 
 Vernon Mauery <vernon.mauery@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 18 Jan 2019 12:42:14 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2019 12:57:28 -0000

Hi,

A few minor nitpicks that you may consider.

On Mon, Jan 7, 2019 at 10:41 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> +       if (priv->temp_config[channel] & BIT(attr))
> +               if (channel < DEFAULT_CHANNEL_NUMS ||
> +                   (channel >= DEFAULT_CHANNEL_NUMS &&
> +                    (priv->core_mask & BIT(channel - DEFAULT_CHANNEL_NUMS))))
> +                       return 0444;

Maybe if ((...) && (...)) instead of double if?

> +       for (i = 0; i < priv->gen_info->core_max; i++)
> +               if (priv->core_mask & BIT(i))
> +                       while (i + DEFAULT_CHANNEL_NUMS >= priv->config_idx)
> +                               priv->temp_config[priv->config_idx++] =
> +                                       config_table[channel_core];

priv->config_idx <= i + DEFAULT_CHANNEL_NUMS seems more readable (i.e.
the while-loop variable first).

> +static inline bool peci_temp_need_update(struct temp_data *temp)
> +{
> +       if (temp->valid &&
> +           time_before(jiffies, temp->last_updated + UPDATE_INTERVAL))
> +               return false;
> +
> +       return true;
> +}

Simply return the condition result.

Cheers,
Miguel
