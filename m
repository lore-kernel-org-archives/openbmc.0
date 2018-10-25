Return-Path: <lee.jones@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=lee.jones@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ye2NAM8p"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42gbLj2cSPzDrDg
 for <openbmc@lists.ozlabs.org>; Thu, 25 Oct 2018 16:30:36 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id i8-v6so144321wmg.0
 for <openbmc@lists.ozlabs.org>; Wed, 24 Oct 2018 22:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Gs9SgyZuw+dbAm6aFOPXkL0Pu2vbsZ/++lD/Uq0//bU=;
 b=Ye2NAM8pj7R+R3sjfvuIugGew6SEcHzoWDzP3TM8IPg7VilLgE2ILqaU5QJFAXlVKQ
 iQSqZabpEnHkxOIzNZIs4lI8rFyAfa72XdoO6Qj5Sa+xJBzJNBvJqyqvFpBqmhoMDuGr
 D5Isju5BkrtEv+YakBnVbq8GGCQljDlwf58jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Gs9SgyZuw+dbAm6aFOPXkL0Pu2vbsZ/++lD/Uq0//bU=;
 b=IHzi4cxCwCfmXaDc/1YSnTa+iNYZccNCgKxclFGnQqJu0cV6FT0Wov2bfWk6kRnkEk
 +4EBCA2XWpxIn54eIVbAK6+RCkPAGFXhOBI0zNo3Dr/5MJyjiPoWtqFVVsj+Saug4S8P
 9Yw9/AR/UaiNtsWVY+7g24oKuqf6y0QrnwPpnN22xAgIXRpkDKtzIDPFZU6/WchqujrD
 d33rctKlhfXp3SH+h8qh8RgFK7BKaaRInFZkkB38oQ/moDtcUlU6R3ptxJk+D5WQ9Nhh
 V5RUi+Xohu4nwCJvgLbSc8xm4rlMY+pFG/Y+nKs5fKF5CfmhEI2y85KQkMQVRcO7ipGX
 Hznw==
X-Gm-Message-State: AGRZ1gI8W9FYftdfdDt8RP7jXcEdtJYOyoNF6w+EZoQ0TwW9ENkHkaRl
 W/F9YJ0sb2CZAzGSYYAMmPAXgA==
X-Google-Smtp-Source: AJdET5ehNHALzH5Dzebf5elfVS5aMvq/tcovbcMP1c2szsGgEfBmv+6If/oxsm3CbFBcfPc6FDWdLg==
X-Received: by 2002:a1c:80d4:: with SMTP id
 b203-v6mr236310wmd.100.1540445433628; 
 Wed, 24 Oct 2018 22:30:33 -0700 (PDT)
Received: from dell ([2.31.167.182])
 by smtp.gmail.com with ESMTPSA id u9-v6sm5374658wrr.66.2018.10.24.22.30.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Oct 2018 22:30:32 -0700 (PDT)
Date: Thu, 25 Oct 2018 06:30:30 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
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
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 openbmc@lists.ozlabs.org, James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH v8 08/12] mfd: intel-peci-client: Add PECI client MFD
 driver
Message-ID: <20181025053030.GD4939@dell>
References: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
 <20180918215124.14003-9-jae.hyun.yoo@linux.intel.com>
 <20181024105903.GB4939@dell>
 <db7570cb-8f63-b551-d119-c54270ce6139@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db7570cb-8f63-b551-d119-c54270ce6139@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 25 Oct 2018 17:19:37 +1100
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
X-List-Received-Date: Thu, 25 Oct 2018 05:30:38 -0000

On Wed, 24 Oct 2018, Jae Hyun Yoo wrote:
> On 10/24/2018 3:59 AM, Lee Jones wrote:
> > On Tue, 18 Sep 2018, Jae Hyun Yoo wrote:
> > 
> > > This commit adds PECI client MFD driver.
> > > 
> 
> <snip>

[...]

> > > +bool peci_temp_need_update(struct temp_data *temp)
> > > +{
> > > +	if (temp->valid &&
> > > +	    time_before(jiffies, temp->last_updated + UPDATE_INTERVAL))
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +EXPORT_SYMBOL_GPL(peci_temp_need_update);
> > > +
> > > +void peci_temp_mark_updated(struct temp_data *temp)
> > > +{
> > > +	temp->valid = 1;
> > > +	temp->last_updated = jiffies;
> > > +}
> > > +EXPORT_SYMBOL_GPL(peci_temp_mark_updated);
> > 
> > These are probably better suited as inline functions to be placed in
> > a header file.  No need to export them, since they only use their own
> > data.

Also move them into the HWMON header file.

They have no business in MFD.

[...]

> > > +int peci_client_rd_pkg_cfg_cmd(struct peci_mfd *priv, u8 mbx_idx,
> > 
> > This is gobbledegook.  What's rd?  Read?
> > 
> 
> Yes, the 'rd' means 'read'. I intended to keep command names as listed
> in the PECI specification such as RdPkgConfig, WrPkgConfig and so on.
> Should I change it to 'peci_client_read_package_config_command' ?

I looks/reads a lot nicer, don't you think?

[...]

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
