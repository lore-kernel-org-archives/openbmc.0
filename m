Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Fj9OegFl"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dMgG3L1xzDqPb
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 16:37:30 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id k12so25316934qtf.7
 for <openbmc@lists.ozlabs.org>; Sun, 13 Jan 2019 21:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I+fuFfnOfbYN4lcAWtzSZLpCbw9JLZK5hx0Fx0btURk=;
 b=Fj9OegFlgC3Or6+pV/1hKHrg8a6rtj0Sa85udTnEOTMSam7MsB9mXG0SLe7E1SPeMP
 o4ZqyDnPLwWKQFwQbNTYrQN+e1KFr/b2V35gqaLjXFIV1damZ1HFwIKg8TWp93eIvYyi
 Msmcnm0RngOAYhaJUrJCseaOZ6UWOoxjuz5ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I+fuFfnOfbYN4lcAWtzSZLpCbw9JLZK5hx0Fx0btURk=;
 b=Sgdv7Uq6jGlOBT3m3T6Y2IGXpNzdqvermyeZo3L7gv4y1DTBbmde4yqzrRdl+VIy9P
 Kt2Ia9lmW9Aw3MiW4wUebW5tdYRZUlilThW3FsSvt/iS4xdDuisSf9VZo+W/IX1IT81F
 ml4tldjYFFtOF+pMkEB2FWZ6EeIg9bvnPzDpn/NCL/63hSuoAkci/B8PMJREPALTGLpl
 mMOY9exSMIvw7B5XUx0KDqmceGr5VoEaC3Fb20Nybyxsx+iCMrm8HNttG8EjkMzKHgGX
 ae8ryLexDZen3JQ+C3baAPJGiJyrVRRm7ypyrUybLQsTxHhUk+Kk54traTfWxslS9MyZ
 xQ3g==
X-Gm-Message-State: AJcUukeLM69iJeMUDANHtM5Q8FYbTukBq4usE8Na5C51nr7QJQu/wmyQ
 8O3s0EgNH8ZGdC7yJc/VfMbONMQW27Xv+F5cKKU=
X-Google-Smtp-Source: ALg8bN57J/RbjO+plpa9/63zwtYFzzAkpWjZcnzePHpTv0sNKhTWKby5QsAC9XD3pIdFuWKkNv/fFCkaYECVkVObDcE=
X-Received: by 2002:ac8:3065:: with SMTP id g34mr23100895qte.136.1547444247861; 
 Sun, 13 Jan 2019 21:37:27 -0800 (PST)
MIME-Version: 1.0
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-5-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190107214136.5256-5-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Jan 2019 16:07:16 +1030
Message-ID: <CACPK8Xd=tNhZOTb_cb5wckormAF7-8O4a3DJN_trv4XB6q=fjQ@mail.gmail.com>
Subject: Re: [PATCH v10 04/12] dt-bindings: Add a document of PECI adapter
 driver for ASPEED AST24xx/25xx SoCs
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
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jason M Biils <jason.m.bills@linux.intel.com>, 
 Milton Miller II <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>,
 Robin Murphy <robin.murphy@arm.com>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, Haiyue Wang <haiyue.wang@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, 
 Rob Herring <robh@kernel.org>
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
X-List-Received-Date: Mon, 14 Jan 2019 05:37:31 -0000

On Tue, 8 Jan 2019 at 08:11, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds a dt-bindings document of PECI adapter driver for ASPEED
> AST24xx/25xx SoCs.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Milton Miller II <miltonm@us.ibm.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ryan Chen <ryan_chen@aspeedtech.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> Reviewed-by: James Feist <james.feist@linux.intel.com>
> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
