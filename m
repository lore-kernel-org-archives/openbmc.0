Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="NcVFLpRo"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dWmt62T2zDqNH
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 22:42:54 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id d15so10322296qkj.0
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 03:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V6RyqVqTsW2wUgM3iE9ftzfC21Ku2y0YEvbTox3U+yE=;
 b=NcVFLpRoaYQKc3MQzL2CIelNqTvVThhEzNZFvCMyWt9l9FM5HOBLbaaQjFbEC1TRJd
 8AutPqz1bstM57ORbIUbHBXbQyhAJWM+hSvQySTcb+X7amfpPQHVWeY/mtw0aOGULPma
 WeEM/9nG8Yy0CojM1W6rgunmZ9MHltNNJuxrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V6RyqVqTsW2wUgM3iE9ftzfC21Ku2y0YEvbTox3U+yE=;
 b=Uy2h4wxRY3HAKRHEvdvmKv1BMvdCqcA2/9V18M0qFNUUmFpcK4KAQJiXQaHcxFo/QZ
 M7ybakTlJ6U/k4Jjg2q/RVcbrzLlNZlDQrVk4V0idPKbwoWTufXKY9et7b3sZibR73We
 aPGJ2kr9HAtx/V1klLVPrDMN+esMBHkCKXF9JWu0mUvggKuL/LrFJPZYVAvMVLJ0pHjy
 bDcBTY/N82IIgJjrcpvFpICvey4xtLzerC+3QsD4zTjwvMK213fptOmq6CXIeAL4d2Wn
 RTCoUjcsyIGxluPAJ07ZN5goUMmWCaVVj+ivCQdxhA/CJhV/F4P9OMVoz9QbuOx8yFx/
 MzLQ==
X-Gm-Message-State: AJcUukeejd39n1neCFY0qdPhqbP8HpClfDXZUsaGYby2SRTqzZvktrMh
 JgCe42QgqO8Lps+olCo3QCtYej9euC31v/MJk1M=
X-Google-Smtp-Source: ALg8bN61vPHmDFt59oJjGsnPDUxQeZ2HKmFZE65UF4JoH+tbdX0SI+dTbl5ZWCRcHq0Ks6nBhOM6b8Y0/3Lb5SXVTLA=
X-Received: by 2002:a37:781:: with SMTP id 123mr22049227qkh.231.1547466172551; 
 Mon, 14 Jan 2019 03:42:52 -0800 (PST)
MIME-Version: 1.0
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-9-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190107214136.5256-9-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Jan 2019 22:12:41 +1030
Message-ID: <CACPK8Xet1HUbC4MN-XO31oZj56+af1Lpc_mtee-COSYizedWTg@mail.gmail.com>
Subject: Re: [PATCH v10 08/12] mfd: intel-peci-client: Add PECI client driver
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
 James Feist <james.feist@linux.intel.com>, 
 Jason M Biils <jason.m.bills@linux.intel.com>, 
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
X-List-Received-Date: Mon, 14 Jan 2019 11:42:55 -0000

On Tue, 8 Jan 2019 at 08:11, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds PECI client driver.

It looks like it's a PECI driver for the three CPU families, and it
implements cpu and dimm temp, with sideband functions deferred to the
future. If you add that information with a few more words it would
make for a nicer commit message.

> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
