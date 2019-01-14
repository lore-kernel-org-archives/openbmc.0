Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="mF+vHs/b"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dMcX0pDbzDqQb
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 16:35:07 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id z18so9882637qkj.10
 for <openbmc@lists.ozlabs.org>; Sun, 13 Jan 2019 21:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oaJnHgqxNLSmOeClaph1+naF1VsLXybulRXguvYvNko=;
 b=mF+vHs/b3gwFu7b+oacGUylpLkfQjRl4AkOOn9YE+Ca0J2kUHAA2XghIU9VX7cS51e
 7ElDMIIp1YUBbADVHsVA9wtvPn6uh8/H5yYo3Fu/KUpQ4RFxQRJ+Jjt///QGsfJEIb/r
 gd3HsN0UHLCo9RrpQlz/nmQmEwmenbkWtr58M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oaJnHgqxNLSmOeClaph1+naF1VsLXybulRXguvYvNko=;
 b=ueoZSOwD6Y+nhToTW6A7gilHIxgv9ICt/X6dA+CT35eFAhvCiLdGz8BHxTFtEB6sE7
 cEv4ofTlVyqMiVACyBWI10m647rU8175bMZNoNeqPOhpDJf/Elx+xiriVA3jCMAcLTh+
 a5+fSFJJR/0EsZiGhiuZblHbr3O9e9K+XZQn4erqZDpkSImkibRxGj1FMCcXv1V/Y8CL
 wOr6crKn9RpIlPHheXqTnxKd/RIk7nwbYA/Gav0OjL/F5TVnUGmzP+WxdISWGnFCIkmh
 +nIFMRX/EIGdDkkC8E+4rwQL7e3YedL+Awd7d3vkpBebB0eoOMfpuXX/v/nglcupmLkP
 YpnA==
X-Gm-Message-State: AJcUukfPd/MpJy6Y0XBspIn6+9/OPmEyEIZ98T/PiykJeJR6KA+68XKA
 5uldp1M1cu2/Mzw6BbOT3VYdfR5ewX29qs1a/Oc=
X-Google-Smtp-Source: ALg8bN7AotucbzagLEkUA9bBE23ZmB2lHcesb2pNRdmv6h/jGw9Q/hiKytIE4a0Gk3hlE5Rft3IETb54XrNZ+PQ4h7U=
X-Received: by 2002:ae9:dec5:: with SMTP id
 s188mr21107671qkf.127.1547444104492; 
 Sun, 13 Jan 2019 21:35:04 -0800 (PST)
MIME-Version: 1.0
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-2-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190107214136.5256-2-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Jan 2019 16:04:53 +1030
Message-ID: <CACPK8Xe5H31M=U3JQQaOheoopFZQtS0ZegaGRx4Pmw7Ym9g5YQ@mail.gmail.com>
Subject: Re: [PATCH v10 01/12] dt-bindings: Add a document of PECI subsystem
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
 Haiyue Wang <haiyue.wang@linux.intel.com>, 
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, 
 Rob Herring <robh@kernel.org>
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
X-List-Received-Date: Mon, 14 Jan 2019 05:35:08 -0000

On Tue, 8 Jan 2019 at 08:11, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds a document of generic PECI bus, adapter and client
> driver.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> Reviewed-by: James Feist <james.feist@linux.intel.com>
> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
