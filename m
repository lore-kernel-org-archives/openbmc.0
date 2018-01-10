Return-Path: <gregkh@linuxfoundation.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=140.211.169.12; helo=mail.linuxfoundation.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zH0tk5lY7zF0jn
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 07:27:41 +1100 (AEDT)
Received: from localhost (LFbn-1-12258-90.w90-92.abo.wanadoo.fr [90.92.71.90])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 8EE8EF7D;
 Wed, 10 Jan 2018 20:27:39 +0000 (UTC)
Date: Wed, 10 Jan 2018 21:27:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, jdelvare@suse.com,
 linux@roeck-us.net, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@intel.com>
Subject: Re: [PATCH linux dev-4.10 0/6] Add support PECI and PECI hwmon drivers
Message-ID: <20180110202740.GA27703@kroah.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180110101755.GA5822@kroah.com>
 <006c4a95-9299-bd17-6dec-52578e8461ae@linux.intel.com>
 <20180110191703.GA20248@kroah.com>
 <8997e43c-683e-418d-4e2b-1fe3fefe254e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8997e43c-683e-418d-4e2b-1fe3fefe254e@linux.intel.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jan 2018 20:27:43 -0000

On Wed, Jan 10, 2018 at 11:30:05AM -0800, Jae Hyun Yoo wrote:
> On 1/10/2018 11:17 AM, Greg KH wrote:
> > On Wed, Jan 10, 2018 at 11:14:34AM -0800, Jae Hyun Yoo wrote:
> > > On 1/10/2018 2:17 AM, Greg KH wrote:
> > > > On Tue, Jan 09, 2018 at 02:31:20PM -0800, Jae Hyun Yoo wrote:
> > > > > From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
> > > > > 
> > > > > Hello,
> > > > > 
> > > > > This patch set provides support for PECI of AST2400/2500 which can give us PECI
> > > > > functionalities such as temperature monitoring, platform manageability,
> > > > > processor diagnostics and failure analysis. Also provides generic peci.h and
> > > > > peci_ioctl.h headers to provide compatibility to peci drivers that can be
> > > > > implemented later e.g. Nuvoton's BMC SoC family.
> > > > 
> > > > What is the "dev-4.10" in the subject for?  4.10 is really old and
> > > > obsolete :(
> > > > 
> > > > thanks,
> > > > 
> > > > greg k-h
> > > > 
> > > 
> > > I made this patch set on top of the v4.10 which OpenBmc project is currently
> > > using. I'll rebase this patch set onto the current kernel.org mainline.
> > 
> > What is "OpenBmc", and why are they using an obsolete and insecure
> > kernel for their project?  That seems like a very foolish thing to do...
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> OpenBmc is an open source project to create a highly extensible framework
> for BMC (Board Management Controller) software for data-center computer
> systems:
> https://github.com/openbmc
> 
> Its current mainline is v4.10 but it is being kept upgrading so it will be
> upgraded to the latest stable or long-term version soon.

Why hasn't it been updated in the year since 4.10 was released?  That's
a _very_ long time to be running on a totally insecure kernel, and no
new development should ever be done on old kernels, that's even crazier
(as we can't go back in time and accept patches for new features to old
releases...)

It sounds like the openbmc project needs to learn how to manage their
kernels a whole lot better, who do I need to go poke about this?

thanks,

greg k-h
