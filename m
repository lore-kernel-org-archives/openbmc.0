Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sXD8V55m"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WnbV1X6pzF3Ss
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 23:44:37 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id 1-v6so5900308plv.7
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 05:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=e9wL70jQ9n9DEljZDo6ba099okOE6toh5sDh6KNJziU=;
 b=sXD8V55moTRwiI1GKTvVqf07c7UcJOhWGU139rQqnRZOjYw1szdBwk2Hyc3+WsMMaP
 AgfURm21gJeJvBE1d3bCBRfQaR4nprSIALoxYKd6bBnKQNoHUsEgducuoHtgpTu0vb6G
 /y51DnBqzxZNLUZUsEjmVdoaJXBoMMnXt301+NUELwduxhk1TRCxsTG12RahhuF4+2bm
 tiqF3m538NU7N1VJNATm2GEOc4eG97otp0lUuPore7hykrhA3WbsWdLnEV4m63xIqanV
 dvsphpizqXzDf9Z7KhVSy/rHfGjHdPLrZ5LJHKvRM4uYX6zHFWymjKCGbdn+fRth3us2
 s90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=e9wL70jQ9n9DEljZDo6ba099okOE6toh5sDh6KNJziU=;
 b=n0uOWN+XrnqZLS0tj0KJBhZ0lWi3j6Mo4r9j0LCKBKy5uiREDlx4sNw4HCcwYokWB8
 ftHwe024TlFM0b7VG+gkrPrzsNfcEMgRxrlncDZO3QWEUiftRIAzfW+spwdOSELnKRog
 M//vmQ+LcZOL/YQOWnG0+mnwD5h4JtahiKNjNErPyg2gI+NEi0wJGuWkdDvXJ86yWyy4
 Saig8/Wfw37vdcBHofTdJbGfT/7RsiopDjsyrrgCx4IyB67RcakrpJpjqMi0ff/5GL7w
 5/SBJMATtX1QBorEaeoueIS3B2oOhVefh88ixZDvMWQJeqlMKVoc4wfw1s5fyfuHwU4a
 nczg==
X-Gm-Message-State: ABuFfogzMjKvVuXV0ALWk8GQj++9QexYA035RCyJppsYXGbeWjiFHc7A
 e3W9RMeU+doJTFWrP8ENX3M=
X-Google-Smtp-Source: ACcGV61WVGs5GkuOrmcWLWjxSYQ3d+dhI+b8qIcIt4V/UcmE0MCrWmsLt4PKyO1UoobH51a/DWZ0nw==
X-Received: by 2002:a17:902:5c4:: with SMTP id
 f62-v6mr5903063plf.18.1539348276066; 
 Fri, 12 Oct 2018 05:44:36 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id k63-v6sm2228528pga.36.2018.10.12.05.44.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Oct 2018 05:44:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 12 Oct 2018 05:44:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Rob Herring <robh@kernel.org>, Eddie James <eajames@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, jdelvare@suse.com,
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
 gregkh@linuxfoundation.org, mark.rutland@arm.com, joel@jms.id.au
Subject: Re: [PATCH v5 01/10] dt-bindings: fsi: Add P9 OCC device documentation
Message-ID: <20181012124434.GA11386@roeck-us.net>
References: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535664761-86018-2-git-send-email-eajames@linux.vnet.ibm.com>
 <20180910181610.GA5907@bogus>
 <c002018d3765280e135d673f7c731784a90a260d.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c002018d3765280e135d673f7c731784a90a260d.camel@kernel.crashing.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Fri, 12 Oct 2018 12:44:39 -0000

On Wed, Sep 12, 2018 at 09:56:33AM +0200, Benjamin Herrenschmidt wrote:
> On Mon, 2018-09-10 at 13:16 -0500, Rob Herring wrote:
> > On Thu, Aug 30, 2018 at 04:32:32PM -0500, Eddie James wrote:
> > > Document the bindings for the FSI-attached POWER9 On-Chip Controller.
> > > 
> > > Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> > > ---
> > >  Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> > > new file mode 100644
> > > index 0000000..46372f6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> > > @@ -0,0 +1,15 @@
> > > +Device-tree bindings for FSI-attached POWER9 On-Chip Controller (OCC)
> > > +---------------------------------------------------------------------
> > > +
> > > +This is the binding for the P9 On-Chip Controller accessed over FSI from a
> > > +service processor. See fsi.txt for details on bindings for FSI slave and CFAM
> > > +nodes.
> > > +
> > > +Required properties:
> > > + - compatible = "ibm,p9-occ"
> > > +
> > > +Examples:
> > > +
> > > +    occ {
> > 
> > FSI slave devices are supposed to have an address according to the 
> > binding doc.
> 
> This isn't the FSI device per-se actually. This is a node below the
> "sbefifo" FSI device. The SBE fifo is the mechanism by which we
> communicate with the OCC. The sbefifo doesn't really define a "bus",
> it's mostly used from userspace directly via /dev/sbefifo* to perform
> various tasks in the chip, but it happens to also provide the in-kernel 
> transport for the OCC commands.
> 

What is the conclusion here ? Is it ok as-is, or does it have to be changed ?

Thanks,
Guenter

> Cheers,
> Ben.
> 
> > > +        compatible = "ibm,p9-occ";
> > > +    };
> > > -- 
> > > 1.8.3.1
> > > 
> 
