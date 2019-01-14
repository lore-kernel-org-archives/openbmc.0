Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="dl1Tod/+"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dWnZ0gBYzDqMm
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 22:43:29 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id u47so26095570qtj.6
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 03:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YSsm5KHK1vgCekTlZkLBW7Oe/copp0QlvQ1V9CXjt5o=;
 b=dl1Tod/+fmKMxz4fSs5uM5OM9EYe6up7FyBft3vlu7o6dlsBOasONH5bd4nc3hvSZl
 E5WQMXS2tLJKQ2lT5FUVS8T/vygn+OgEKcvdctm8G3V+cXd+LFDgdKSyHN9JnabIRRqN
 pQH2AL8bnVeS0u8feuE6mAnJEYTOYe4BiZwRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YSsm5KHK1vgCekTlZkLBW7Oe/copp0QlvQ1V9CXjt5o=;
 b=FmugdFnXRW+9o5IYj3ES/z2Uklht/vw6LCKgp+wWjSSOHjUmEwt6Z2AKJVoAR5h9Lh
 1LL30XLx51+1JpjN7Ij6bYV1Ipy+S2/joqJVcxsyRWrcrrpZuOBY5qFgPprF9brlA2Ax
 w8ELycL+P4ZjAlJ2HvmrgfNzv2XdNl9g9Qau5k7MrW01oqz+ncrhbmODA3nofF/6wcUu
 TDtoqG1iHuoff5kdgONZez9I7MHb1W14pt1YrjlAvcBDj81spE/8Y2HKkktb/+S39FlY
 LF/yxQoopKPEpqqivxm+ifA0ecOkNs5JStQGzMc0tzU0b2kujBR8HkoVcEdggzbRKNmm
 imSw==
X-Gm-Message-State: AJcUukc0DRSvUhtq/waD0f+uRy1PWo37Tejuz7uravqNIwHw4XHNnLMR
 MUSrCc9oKFKpSg/77c0ePHuxB6Pua7eMmDC2vBk=
X-Google-Smtp-Source: ALg8bN5msTpaMGdDNrcEC56t+z7OMLr65M73GRhD2on6tc5RQReecFM8zdmQ4xtnRFOpjFrk5SvU3HtNxMx0mTaG++o=
X-Received: by 2002:a0c:89b4:: with SMTP id 49mr23814949qvr.85.1547466207923; 
 Mon, 14 Jan 2019 03:43:27 -0800 (PST)
MIME-Version: 1.0
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-10-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190107214136.5256-10-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Jan 2019 22:13:17 +1030
Message-ID: <CACPK8XdK-VpV7y1UT81QUo7CXuUp=gjjnZmTbvLvRVERtv5fDA@mail.gmail.com>
Subject: Re: [PATCH v10 09/12] Documentation: hwmon: Add documents for PECI
 hwmon client drivers
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jonathan Corbet <corbet@lwn.net>, 
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
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jason M Biils <jason.m.bills@linux.intel.com>, 
 Haiyue Wang <haiyue.wang@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, 
 Vernon Mauery <vernon.mauery@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 18 Jan 2019 12:42:15 +1100
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
X-List-Received-Date: Mon, 14 Jan 2019 11:43:30 -0000

On Tue, 8 Jan 2019 at 08:11, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds hwmon documents for PECI cputemp and dimmtemp drivers.
>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> Reviewed-by: James Feist <james.feist@linux.intel.com>
> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Joel Stanley <joel@jms.id.au>
