Return-Path: <miguel.ojeda.sandonis@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gEBJMk/V"; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43h9PY23YwzDr86
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jan 2019 06:05:20 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id v15-v6so12470625ljh.13
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jan 2019 11:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QdGWIwTB/wqROLkdTOgH6GtcMluDp8HmPvDspscNkls=;
 b=gEBJMk/ViIIA1PmjUCtOyNq2+/g4UTI7KSYv6prqbYjVbxABssHi4d4LdscWfGXZB3
 eyqOQB/wFN0Gxctug0qRH4r6D3F2MCb9v+k+fh0cmbQBRi6OPckthYZurAFneK5fsKe8
 pQpKuuFZvYMUBMkZnhnHM4WZh+C1uqQEQuXohVNc+lEYb9VkVFn5noFePPINhENTtNd7
 6vVZcevYTUzzTqi8Q4wbtcW/IxMsvAsKHrgvQmGZCblR2SGI+wHI8mfS1jWh1xUJx9IB
 WSiWUTDcgqX9JVOsV+WqEXh7JzpoHQKd/9IehavO7Y4GLqF1wvF3B94lvkQQPkGhhuFp
 Lpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QdGWIwTB/wqROLkdTOgH6GtcMluDp8HmPvDspscNkls=;
 b=k2Kw4nmizPWRpJmNmZPB9dlb8L6NiOXg29nx+W5wIJLwr72TwDdlUjFC2/EfsQZX5M
 cW9XcONH9QP5ZJLHmtcsdWU6WSq0aYco9WCbESYcscD9XXmF8B8Y0I/77MtvtsnjTD+1
 K7mS8Y097c7+i6cZYCZ/6yaMCvmbx9n57oIeE9iVgo8kY4fConDHQYtD0ZQRfx3r7Js7
 L1Of4utljUc8KrVNyMMY5zcXb9aE9ecg0kjsgViBt5L5qy67b1JKcmZQ8VR0Qd/xtLG4
 hoHBwkvnpCR05+2XtFdfc41bhmxbWul/Cfc5JLTA8Do3nw8QjJa6+XtbEsn/YlZ4JzN5
 EkAQ==
X-Gm-Message-State: AJcUukcKJeBG6pjfv3Tty+IoSyWKNg197djLP2IlkwYBRCH3zzWcUrl7
 nqMr1K6ZUDeBks9if859NC6i8zhbrO6AaitSj0M=
X-Google-Smtp-Source: ALg8bN45Yt2qB+NYiS8SRXCKJkiYtzsN6kSMqZHD2pt47k+Ni2ZJboKQcDUUVgwIXqDeKV4v78LYdt/E+tDX2FIJEwE=
X-Received: by 2002:a2e:908b:: with SMTP id
 l11-v6mr12878951ljg.150.1547838317785; 
 Fri, 18 Jan 2019 11:05:17 -0800 (PST)
MIME-Version: 1.0
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-11-jae.hyun.yoo@linux.intel.com>
 <CANiq72=dA1weOip-YzZRmsOEHOve2FdJh9_qbN2dmH8HR58WYg@mail.gmail.com>
 <8ef997aa-2971-2907-3821-e71f9e8dd53a@linux.intel.com>
In-Reply-To: <8ef997aa-2971-2907-3821-e71f9e8dd53a@linux.intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 18 Jan 2019 20:05:06 +0100
Message-ID: <CANiq72=qO0B_WfWRM0sXOE4Hz_gU=_VsijTNsqVFN2PJehOWQg@mail.gmail.com>
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
X-Mailman-Approved-At: Mon, 21 Jan 2019 12:39:15 +1100
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
X-List-Received-Date: Fri, 18 Jan 2019 19:05:22 -0000

Hi Jae,

On Fri, Jan 18, 2019 at 6:52 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> I'm assuming you meant:
>
> return !(temp->valid && time_before(jiffies, temp->last_updated +
>                                               UPDATE_INTERVAL));

Yeah, or return !... || !..., whatever you feel is more comprehensible. :)

> Thanks for your review!

You're welcome! It is just nitpicking, but I thought sending the email
wouldn't hurt too much (in case you do another version of the series,
otherwise don't change it just for this! :-)

Cheers,
Miguel
