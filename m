Return-Path: <sam@mendozajonas.com>
Received: from mendozajonas.com (mendozajonas.com [188.166.185.233])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDgv45kCkzDq7Z
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 14:34:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="aINSwUgH"; dkim-atps=neutral
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: sam@mendozajonas.com)
 by mendozajonas.com (Postfix) with ESMTPSA id 03AC2143F68;
 Fri, 28 Apr 2017 12:34:05 +0800 (SGT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mendozajonas.com;
 s=mail; t=1493354046;
 bh=mzUUfqD867jj9jN1TIy0lOQbCo3xLelAdSbPYxRMElE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=aINSwUgHISPTo7NTgpDvo6LhMe2F3bcrsKUav7JdKi4qlJkAJZfIiQYaZGw/QMLqv
 W0VSGr6Ae/opf6HjAl9LkHin8e9OqCm/vahBIojZreWy2hIdl9cIY5iPwjIamoLMCo
 OYUUC2EXCjATNLTdTYeOzQ45FxxL4bGOfLn9qKiI=
Message-ID: <1493354043.32554.1.camel@mendozajonas.com>
Subject: Re: [PATCH] hwmon (pmbus): Add client driver for IR35221
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 28 Apr 2017 14:34:03 +1000
In-Reply-To: <1493168635.1790.6.camel@mendozajonas.com>
References: <20170421042505.20403-1-sam@mendozajonas.com>
 <248726f5-f1e7-4feb-1917-049173303aa6@roeck-us.net>
 <1493168635.1790.6.camel@mendozajonas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 28 Apr 2017 04:34:09 -0000

On Wed, 2017-04-26 at 11:03 +1000, Samuel Mendoza-Jonas wrote:
> On Fri, 2017-04-21 at 06:49 -0700, Guenter Roeck wrote:
> > On 04/20/2017 09:25 PM, Samuel Mendoza-Jonas wrote:
> > > IR35221 is a Digital DC-DC Multiphase Converter
> > > 
> > > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > > ---
> > > - Tested on a ppc64 system which includes several of these devices.
> > > - This patch re-implements the linear reg2data/data2reg functions from
> > >   pmbus-core like some other drivers in order to scale some results. Is
> > >   this something that would be better off being made generic for pmbus
> > >   drivers to call?
> > 
> > That might make sense. The only other driver is zl6100, or am I missing
> > something ?
> 
> I believe ltc2978 has a small implementation as well.
> 
> > 
> > Trying to understand the code, the data format seems to be linear11 with
> > an added exponent on top of it. Is that correct ? If so, I wonder if we should
> > make that configurable, ie store the additional exponent in R and handle it
> > in the pmbus core. Would that help ?
> 
> Yes that's essentially what it is. Using R for the extra exponent would
> be a neat solution, however at least for this chip commands in the same
> class have different scaling exponents (eg VIN_UV_WARN_LIMIT vs
> READ_VIN). I'll have a look though and see if I can cover this - maybe a
> small wrapper function that updates the exponent in the data returned by
> pmbus_read_word_data()/etc?

After thinking about this for a bit I don't think it's as straightforward
 as I would like :)

For ir35221 storing an exponent in R isn't quite enough since we have
regs of the same class with different exponents. Perhaps we could have a
simple array in pmbus_driver_info that gives an exponent for each reg,
but then we have per-page scaling too just to be annoying.
In zl6100 the main change is essentially (value * 9) / 10 which isn't a
power of two anyway.

What the three mentioned drivers have in common are partial
implementations of pmbus_reg2data_linear() - pmbus_reg2data() could be
made public, but since that converts from sensor->data which we're meant
to be updating in the first place it feels a little backwards even if we
temporarily update it with the new (unscaled) value. Is it worth trying
to split out some of the reg2data logic in order to simplify these
drivers slightly?

Sam
