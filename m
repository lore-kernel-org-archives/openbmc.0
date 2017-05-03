Return-Path: <sjitindarsingh@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHrH11JYszDqBH
 for <openbmc@lists.ozlabs.org>; Wed,  3 May 2017 18:02:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aEh+d3gq"; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id d1so112623pfe.1
 for <openbmc@lists.ozlabs.org>; Wed, 03 May 2017 01:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8FSTeL8EbH36Jb/vL2Nv601bcVxTsL3eozSL5vYD+Xw=;
 b=aEh+d3gq2nrvoHB0HHltgV+rRspFtKqF6XdpfKDPGwz/6w3Bpw+DDa497g6xi495Wv
 MKTCS3ekbcp4yuIkldBNdOlityswVZ83YzY897etrtPn2j4SkXpho8Zv37MDJi1aAmhM
 3PpeBf1SYNLmGntkwCGVX/pK32hzSE9oxItuHrn9bTJuFoXosu2mBzhloPTSgVdJos8z
 KWkT/g59OA4TBPLU1f42rSZ4CjAkSsxbb4nmeBDaVYOgFBidnH0vkDt7+IGXQy/IjMz+
 JR6cQrfnPrmcZlMZ0i5QEWldgJljV3m0TzRnFLD7DgImcv+Nrf3UtORX0heVFEItTL15
 SDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8FSTeL8EbH36Jb/vL2Nv601bcVxTsL3eozSL5vYD+Xw=;
 b=Xa2emFwFc+79psiPOPNy1DSTxcCr5sSVXjmfoCKZu+lPSJnLH7aVBJlmhdJSxnhI1r
 SJ3eiBD0EmYf6FTnrkVrfrIKYHGQlK1Vk/kx3c6kNaBC5Cl5JQcgtA3bwQWirhd8t/Mj
 xO6/c19Ir2IHpoO8pnr5ErPygSBsqAaIvDqLhZivpfCRF47iSZp1N32RdqVyEVD2Dd2c
 7CfmSY2mqLlTT1RqvvNVXNe1jUi5zuRzSV8PdKbygelPShL4flgQAStzbiSSzImbYEcM
 GR6Tak/CH46jc+4Qukh/OswoE9nVfmLAdgF9IamD16YnXUVhIu+2NYRpGDVkN8XLdmtC
 VWDw==
X-Gm-Message-State: AN3rC/6q+In3gX5k9TQb6A2DedjAUp9WNQk0RWegEqZsV/cOOl7ucz+g
 3LdV9F70tcVJSA==
X-Received: by 10.98.35.10 with SMTP id j10mr3316325pfj.23.1493798539193;
 Wed, 03 May 2017 01:02:19 -0700 (PDT)
Received: from surajjs.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id h7sm3708216pfc.99.2017.05.03.01.02.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 May 2017 01:02:17 -0700 (PDT)
Message-ID: <1493798532.2039.4.camel@gmail.com>
Subject: Re: [PATCH v2] drivers/mailbox: Add Aspeed mailbox driver
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, Cyril Bur <cyrilbur@gmail.com>, 
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 03 May 2017 18:02:12 +1000
In-Reply-To: <CACPK8XcELMZT+e1Q-uYK7SFb3QtihvhG8Ot_+QmT3z808oW0JA@mail.gmail.com>
References: <20170207233623.18737-1-cyrilbur@gmail.com>
 <CACPK8XcELMZT+e1Q-uYK7SFb3QtihvhG8Ot_+QmT3z808oW0JA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 03 May 2017 08:02:21 -0000

***PING***

Are there any comments on this stopping it going upstream?

Do we think this would better belong in /drivers/misc rather than as a
mailbox driver?

Looking to get some discussion going and this moving along :)

Suraj

On Thu, 2017-02-09 at 15:09 +1030, Joel Stanley wrote:
> On Wed, Feb 8, 2017 at 10:06 AM, Cyril Bur <cyrilbur@gmail.com>
> wrote:
> > 
> > This provides access to the mbox registers on the ast2400 and
> > ast2500
> > SoCs.
> > 
> > This driver allows arbitrary reads and writes to the 16 data
> > registers as
> > the other end may have configured the mbox hardware to provide an
> > interrupt when a specific register gets written to.
> > 
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> > V2:
> >    s/ASpeed/Aspeed/
> >    Reword Kconfig options
> >    Use tristate for config symbol
> > 
> >  drivers/mailbox/Kconfig       |   8 +
> >  drivers/mailbox/Makefile      |   2 +
> >  drivers/mailbox/aspeed-mbox.c | 334
> > ++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 344 insertions(+)
> >  create mode 100644 drivers/mailbox/aspeed-mbox.c
> > 
> > diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> > index ceff415f201c..e24044d5c219 100644
> > --- a/drivers/mailbox/Kconfig
> > +++ b/drivers/mailbox/Kconfig
> > @@ -152,4 +152,12 @@ config BCM_PDC_MBOX
> >           Mailbox implementation for the Broadcom PDC ring manager,
> >           which provides access to various offload engines on
> > Broadcom
> >           SoCs. Say Y here if you want to use the Broadcom PDC.
> > +
> > +config ASPEED_LPC_MBOX
> > +       depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP &&
> > MFD_SYSCON
> > +       tristate "Aspeed LPC Mailbox Controller"
> > +       ---help---
> > +         Provides a driver for the MBOX registers found on Aspeed
> > SOCs
> > +         (AST2400 and AST2500). This driver provides a device for
> > aspeed
> > +         mbox registers
> You repeat yourself.
> 
> Mention that this driver is for the the BMC side.
> 
> > 
> > diff --git a/drivers/mailbox/aspeed-mbox.c
> > b/drivers/mailbox/aspeed-mbox.c
> > 
> > +static int aspeed_mbox_probe(struct platform_device *pdev)
> > +{
> > +       struct aspeed_mbox *mbox;
> > +       struct device *dev;
> > +       int rc;
> > +
> > +       dev = &pdev->dev;
> > +
> > +       mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> > +       if (!mbox)
> > +               return -ENOMEM;
> > +
> > +       dev_set_drvdata(&pdev->dev, mbox);
> > +
> > +       rc = of_property_read_u32(dev->of_node, "reg", &mbox-
> > >base);
> > +       if (rc) {
> > +               dev_err(dev, "Couldn't read reg device-tree
> > property\n");
> > +               return rc;
> > +       }
> I think we want to use of_address_to_resource here.
> 
> > 
> > +
> > +static const struct of_device_id aspeed_mbox_match[] = {
> > +       { .compatible = "aspeed,ast2400-mbox" },
> > +       { .compatible = "aspeed,ast2500-mbox" },
> > +       { },
> I didn't see the bindings in this series. Have they already been
> accepted?
> 
> Cheers,
> 
> Joel
